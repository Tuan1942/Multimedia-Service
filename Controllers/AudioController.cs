using Microsoft.AspNetCore.Mvc;
using MultimediaService.Context;
using MultimediaService.Services;
using System;
using System.IO;
using System.Threading.Tasks;

namespace MultimediaService.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AudioController : ControllerBase
    {
        private readonly string _targetFilePath = Path.Combine(Directory.GetCurrentDirectory(), "Multimedia\\Audios");
        private readonly string _compressedFilePath = Path.Combine(Directory.GetCurrentDirectory(), "Compressed\\Audios");
        private readonly MultimediaContext _context;

        public AudioController(MultimediaContext context)
        {
            _context = context;

            if (!Directory.Exists(_targetFilePath))
            {
                Directory.CreateDirectory(_targetFilePath);
            }

            if (!Directory.Exists(_compressedFilePath))
            {
                Directory.CreateDirectory(_compressedFilePath);
            }
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetAudio(int id)
        {
            var audio = await _context.Audios.FindAsync(id);
            if (audio == null)
            {
                return NotFound();
            }

            var filePath = audio.CompressedPath ?? audio.FilePath;
            if (!System.IO.File.Exists(filePath))
            {
                return NotFound();
            }

            var fileStream = System.IO.File.OpenRead(filePath);
            return File(fileStream, "audio/mpeg");
        }

        [HttpPost("upload")]
        public async Task<IActionResult> UploadAudio([FromForm] IFormFile audio)
        {
            if (audio == null || audio.Length == 0)
            {
                return BadRequest("No audio file received.");
            }

            var fileName = FFmpeg.RandomName(20) + Path.GetExtension(audio.FileName);
            var filePath = Path.Combine(_targetFilePath, fileName);

            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await audio.CopyToAsync(stream);
            }

            var compressedFileName = FFmpeg.RandomName(20) + Path.GetExtension(audio.FileName);
            var compressedFilePath = Path.Combine(_compressedFilePath, compressedFileName);
            FFmpeg.CompressAudio(filePath, compressedFilePath);

            var audioEntity = new Audio
            {
                FileName = fileName,
                FilePath = filePath,
                CompressedPath = compressedFilePath,
                UploadDate = DateTime.Now
            };

            _context.Audios.Add(audioEntity);
            await _context.SaveChangesAsync();

            return Ok(new { Id = audioEntity.Id, FileName = fileName, FilePath = filePath, CompressedFilePath = compressedFilePath });
        }
    }
}
