using api.Data;
using api.Dto;
using api.Models;
using api.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OfficeOpenXml;
using System.Linq;

namespace api.Controllers
{
    [ApiController]
    [Route("[Controller]")]
    public class OrderController : Controller
    {
        private readonly AppDbContext _context;
        private readonly INotificationService _notificationService;
        public OrderController(AppDbContext context, INotificationService notificationService)
        {
            _context = context;
            _notificationService = notificationService;
        }
        [Authorize]
        [HttpPost("create")]
        public async Task<IActionResult> Create([FromBody] OrderDto orderDto)
        {
            var userIdString = User.FindFirst("UserId")?.Value;
            if (string.IsNullOrEmpty(userIdString))
            {
                return Unauthorized("Bạn cần đăng nhập để mua hàng");
            }
            int userId = int.Parse(userIdString);
            var order = new Order
            {
                UserId = userId,
                CreateDate = DateTime.Now,
                TotalAmount = orderDto.TotalAmount,
                Name = orderDto.Name,
                Phone = orderDto.Phone,
                Address = orderDto.Address,
                City = orderDto.City,
                Ward = orderDto.Ward,
                District = orderDto.District,
                Description = orderDto.Description,
                Discount = orderDto.Discount,
                Payment = orderDto.Payment,
                OrderItems = new List<OrderItem>()
            };
            foreach (var item in orderDto.OrderItems)
            {
                var product = await _context.products.FindAsync(item.ProductId);
                if (product == null)
                {
                    return BadRequest($"Sản phẩm với ID {item.ProductId} không tồn tại.");
                }

                var orderItem = new OrderItem
                {
                    ProductId = item.ProductId,
                    Quantity = item.Quantity,
                    Size = item.Size,
                    Color = item.Color,
                    TotalAmount = item.TotalAmount,
                };
                order.OrderItems.Add(orderItem);
                product.Sell += item.Quantity;
            }

            _context.orders.Add(order);
            await _context.SaveChangesAsync();
            var cartItems = await _context.carts.Where(ci => ci.UserId == userId).ToListAsync();
            _context.carts.RemoveRange(cartItems);
            await _context.SaveChangesAsync();
            await _notificationService.SendNotificationAsync("Có đơn hàng mới được tạo lúc " + DateTime.Now.ToString("HH:mm dd/MM"));
            

            return Ok(new { orderId = order.OrderId, message = "Đặt hàng thành công!" });
        }
        [Authorize]
        [HttpGet("GetByUser")]
        public async Task<IActionResult> GetByUser()
        {
            var userIdString = User.FindFirst("UserId")?.Value;
            if (string.IsNullOrEmpty(userIdString))
            {
                return Unauthorized("Bạn cần đăng nhập để mua hàng");
            }
            int userId = int.Parse(userIdString);
            var orders = await _context.orders
                .Include(c => c.OrderItems)
                .Where(o => o.UserId == userId).ToListAsync();
            return Ok(orders);
        }
        [HttpGet("GetAll")]
        public async Task<IActionResult> GetAll(int? page, int? limit)
        {
            var query = _context.orders
                .Include(u => u.User)
                .Include(c => c.OrderItems)
                .ThenInclude(p => p.Product)
                .AsQueryable();

            if (page.HasValue && limit.HasValue)
            {
                query = query.Skip((page.Value - 1) * limit.Value)
                             .Take(limit.Value);
            }

            var orders = await query.ToListAsync();
            return Ok(orders);
        }
        [Authorize]
        [HttpGet("GetById/{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var orders = await _context.orders
                .Include(u => u.User)
                .Include(c => c.OrderItems)
                .ThenInclude(p => p.Product)
                .Where(o => o.OrderId == id).FirstOrDefaultAsync();
            return Ok(orders);
        }
        [Authorize]
        [HttpPatch("Update/{id}")]
        public async Task<IActionResult> Update([FromBody] OrderDto orderDto, int id)
        {
            var order = await _context.orders.FindAsync(id);
            if (order == null)
            {
                return BadRequest();
            }
            order.ShippingStatus = orderDto.ShippingStatus ?? "Chưa chuyển";
            order.PaymentStatus = orderDto.PaymentStatus;
            _context.Entry(order).Property(o => o.ShippingStatus).IsModified = true;
            _context.Entry(order).Property(o => o.PaymentStatus).IsModified = true;
            await _context.SaveChangesAsync();
            return Ok();
        }
        [HttpGet("Statistical")]
        public async Task<IActionResult> Statistical(int year)
        {
            var monthlyStatistics = await _context.orders
            .Where(o => o.PaymentStatus == "Đã thanh toán" && o.CreateDate.Year == year)

            .GroupBy(o => o.CreateDate.Month)
            .Select(g => new
            {
                Month = g.Key,
                TotalAmount = g.Sum(o => o.TotalAmount)
            })
            .OrderBy(g => g.Month)
            .ToListAsync();
            var yearlyStatistics = await _context.orders
                .Where(o => o.PaymentStatus == "Đã thanh toán")
                .GroupBy(o => o.CreateDate.Year)
                .Select(g => new
                {
                    Year = g.Key,
                    TotalAmount = g.Sum(o => o.TotalAmount)
                })
                .ToListAsync();
            var totalAmountAllYears = await _context.orders
                    .Where(o => o.PaymentStatus == "Đã thanh toán")
                    .SumAsync(o => o.TotalAmount);
            return Ok(new
            {
                MonthlyStatistics = monthlyStatistics,
                YearlyStatistics = yearlyStatistics,
                TotalAmountAllYears = totalAmountAllYears
            });
        }
        [HttpGet("Export")]
        public async Task<IActionResult> Export(int year)
        {
            var monthlyStatistics = await _context.orders
            .Where(o => o.PaymentStatus == "Đã thanh toán" && o.CreateDate.Year == year)

            .GroupBy(o => o.CreateDate.Month)
            .Select(g => new
            {
                Month = g.Key,
                TotalAmount = g.Sum(o => o.TotalAmount)
            })
            .OrderBy(g => g.Month)
            .ToListAsync();
            var totalAmountForYear = await _context.orders
                    .Where(o => o.PaymentStatus == "Đã thanh toán" && o.CreateDate.Year == year)
                    .SumAsync(o => o.TotalAmount);

            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;


            using (var package = new ExcelPackage())
            {
                var worksheet = package.Workbook.Worksheets.Add("Doanhthu");

                worksheet.Cells[1, 1].Value = string.Format("Doanh thu năm {0} theo tháng", year);
                worksheet.Cells[1, 1].Style.Font.Bold = true;
                worksheet.Cells[1, 1].Style.Font.Size = 14;
                worksheet.Cells[1, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                worksheet.Cells[1, 1, 1, 4].Merge = true;
                worksheet.Cells[2, 1].Value = "Thời gian tạo: " + DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
                worksheet.Cells[2, 1].Style.Font.Italic = true;
                worksheet.Cells[2, 1].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Left;

                worksheet.Cells[3, 1].Value = "Tháng";
                worksheet.Cells[3, 2].Value = "Doanh thu (VND)";
                worksheet.Cells[3, 1, 3, 2].Style.Font.Bold = true;

                for (int i = 0; i < monthlyStatistics.Count; i++)
                {
                    var statistic = monthlyStatistics[i];
                    worksheet.Cells[i + 4, 1].Value = statistic.Month;
                    worksheet.Cells[i + 4, 2].Value = statistic.TotalAmount;
                    worksheet.Cells[i + 4, 2, i + 4, 3].Merge = true;

                }
                worksheet.Cells[monthlyStatistics.Count + 4, 1].Value = "Tổng";
                worksheet.Cells[monthlyStatistics.Count+4, 1].Style.Font.Bold = true;
                worksheet.Cells[monthlyStatistics.Count + 4, 2].Value = totalAmountForYear;
                worksheet.Cells[monthlyStatistics.Count + 4, 2, monthlyStatistics.Count + 4, 3].Merge = true;

                var fileContents = package.GetAsByteArray();

                // Trả về file Excel cho người dùng
                return File(fileContents, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", $"DoanhThu_{year}.xlsx");
            }

        }
    }
}
