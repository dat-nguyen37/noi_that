using api.Data;
using api.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace api.Controllers
{
    [ApiController]
    [Route("[Controller]")]
    public class NotificationController : Controller
    {

        private readonly AppDbContext _context;
        public NotificationController(AppDbContext context)
        {
            _context = context;
        }
        [HttpGet("getNotification")]
        public async Task<IActionResult> Get()
        {
            var notifications = await _context.notifications.ToListAsync();
            return Ok(notifications);
        }
    }
}
