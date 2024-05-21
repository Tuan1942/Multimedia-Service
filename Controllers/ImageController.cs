﻿using Microsoft.AspNetCore.Mvc;
using MultimediaService.Context;
using MultimediaService.Services;
using System;
using System.IO;
using System.Threading.Tasks;

namespace MediaService.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ImageController : ControllerBase
    {
        private readonly string _targetFilePath = Path.Combine(Directory.GetCurrentDirectory(), "Multimedia\\Images");
        private readonly string _compressedFilePath = Path.Combine(Directory.GetCurrentDirectory(), "Compressed\\Images");
        private readonly MultimediaContext _context;

        public ImageController(MultimediaContext context)
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
        public async Task<IActionResult> GetImage(int id)
        {
            var image = await _context.Images.FindAsync(id);
            if (image == null)
            {
                return NotFound();
            }

            var filePath = image.CompressedPath ?? image.FilePath;
            if (!System.IO.File.Exists(filePath))
            {
                return NotFound();
            }

            var fileStream = System.IO.File.OpenRead(filePath);
            return File(fileStream, "image/jpeg");
        }

        [HttpPost("upload")]
        public async Task<IActionResult> UploadImage([FromForm] IFormFile image)
        {
            if (image == null || image.Length == 0)
            {
                return BadRequest("No image file received.");
            }

            var fileName = FFmpeg.RandomName(20) + Path.GetExtension(image.FileName);
            var filePath = Path.Combine(_targetFilePath, fileName);

            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await image.CopyToAsync(stream);
            }

            var compressedFileName = FFmpeg.RandomName(20) + Path.GetExtension(image.FileName);
            var compressedFilePath = Path.Combine(_compressedFilePath, compressedFileName);
            FFmpeg.CompressImage(filePath, compressedFilePath);

            var imageEntity = new Image
            {
                FileName = fileName,
                FilePath = filePath,
                CompressedPath = compressedFilePath,
                UploadDate = DateTime.Now
            };

            _context.Images.Add(imageEntity);
            await _context.SaveChangesAsync();

            return Ok(new { Id = imageEntity.Id, FileName = fileName, FilePath = filePath, CompressedFilePath = compressedFilePath });
        }
    }
}