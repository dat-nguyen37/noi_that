using api.Data;
using api.Dto;
using api.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace api.Controllers
{
    [ApiController]
    [Route("[Controller]")]
    public class CategoryTypeController : Controller
    {
        private readonly AppDbContext _context;

        public CategoryTypeController(AppDbContext context)
        {
            _context=context;
        }
        [HttpPost("create")]
        public async Task<IActionResult> CreateCategoryType([FromBody] CategoryTypeDto categoryTypeDto)
        {
            if (string.IsNullOrEmpty(categoryTypeDto.Name))
            {
                return BadRequest("Tên không được để trống");
            }
            var newCategoryType= new CategoryType
            {
                Name = categoryTypeDto.Name,
                Image = categoryTypeDto.Image,
            };
            _context.categoryTypes.Add(newCategoryType);
            await _context.SaveChangesAsync();
            return Ok("Thêm mới thành công");
        }
        [HttpGet("getAll")]
        public async Task<IActionResult> getAll()
        {
            var categoryTypes = await _context.categoryTypes
                .Include(ct => ct.Categories) 
                .ToListAsync();

            return Ok(categoryTypes);
        }
        [HttpGet("getOne/{id}")]
        public async Task<IActionResult> getOne(int id)
        {
            var categoryTypes = await _context.categoryTypes.FindAsync(id);

            return Ok(categoryTypes);
        }
    }
}
