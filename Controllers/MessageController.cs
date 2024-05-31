using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MultimediaService.Context;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace MultimediaService.Controllers
{
    [Route("[controller]")]
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

        [HttpGet("All")]
        public async Task<IActionResult> GetMessages()
        {
            var messages = await _context.Messages.ToListAsync();
            return Ok(messages);
        }

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

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Message>>> GetMessagesBySenderReceiver(int sendId, int receiveId)
        {
            var messages = await _context.Messages
                .Where(m => (m.SendId == sendId && m.ReceiveId == receiveId) || (m.SendId == receiveId && m.ReceiveId == sendId))
                .ToListAsync();
            return Ok(messages);
        }

        [HttpPost]
        public async Task<IActionResult> Send([FromForm] Message message)
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

            return NoContent();
        }

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
