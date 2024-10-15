using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using api.Data;
using api.Dto;
using api.Models;

namespace Server.Controllers
{
    [ApiController]
    [Route("[Controller]")]
    public class CategoryController : Controller
    {
        private readonly AppDbContext _context;

        public CategoryController(AppDbContext context)
        {
            _context = context;
        }
        [HttpPost("create")]
        public async Task<IActionResult> CreateCategory([FromBody] CategoryDto categoryDto)
        {
            if (string.IsNullOrEmpty(categoryDto.Name))
            {
                return BadRequest("Tên không được để trống");
            }
            if (categoryDto.CategoryTypeId <=0)
            {
                return BadRequest("Danh mục không được để trống");
            }
            var newCategory = new Category
            {
                Name = categoryDto.Name,
                Image = categoryDto.Image,
                CategoryTypeId = categoryDto.CategoryTypeId,
            };
            _context.categories.Add(newCategory);
            await _context.SaveChangesAsync();
            return Ok("Thêm mới thành công");
        }
        [HttpGet("getByPage")]
        public async Task<IActionResult> getByPage(int page = 1, int limit = 10)
        {
            var category = await _context.categories
                .Skip((page - 1) * limit)
                .Take(limit)
                .ToListAsync();

            return Ok(category);
        }
        [HttpGet("getAll")]
        public async Task<IActionResult> getAll()
        {
            var category = await _context.categories
                .ToListAsync();

            return Ok(category);
        }
        [HttpGet("getByCategoryType/{id}")]
        public async Task<IActionResult> getByCategoryType(int id)
        {
            var category = await _context.categories.Where(c=>c.CategoryTypeId==id)
                .ToListAsync();

            return Ok(category);
        }

        [HttpDelete("delete/{id}")]
        public async Task<IActionResult> delete(int id)
        {
            var category = await _context.categories.FindAsync(id);
            if (category == null)
            {
                return Conflict("Không tìm thấy dữ liệu");
            }

            _context.categories.Remove(category);
            await _context.SaveChangesAsync();
            return Ok("Xóa thành công");
        }

    }
}
