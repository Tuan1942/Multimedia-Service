using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MultimediaService.Context;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace MultimediaService.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MessageController : ControllerBase
    {
        private readonly MultimediaContext _context;
        private string Type;

        public MessageController(MultimediaContext context)
        {
            _context = context;
            Type = GetType().Name.Replace("Controller", "");
        }

        // GET: api/message
        [HttpGet]
        public async Task<IActionResult> GetMessages()
        {
            var messages = await _context.Messages.ToListAsync();
            return Ok(messages);
        }

        // GET: api/message/{id}
        [HttpGet("{id}")]
        public async Task<IActionResult> GetMessage(int id)
        {
            var message = await _context.Messages.FindAsync(id);
            if (message == null)
            {
                return NotFound();
            }
            return Ok(message);
        }

        // POST: api/message
        [HttpPost]
        public async Task<IActionResult> CreateMessage([FromBody] Message message)
        {
            if (message == null)
            {
                return BadRequest();
            }
            if (message.Type == null)
            {
                message.Type = Type;
            }

            message.SentTime = DateTime.Now;

            _context.Messages.Add(message);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetMessage), new { id = message.Id }, message);
        }

        // DELETE: api/message/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMessage(int id)
        {
            var message = await _context.Messages.FindAsync(id);
            if (message == null)
            {
                return NotFound();
            }

            _context.Messages.Remove(message);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
