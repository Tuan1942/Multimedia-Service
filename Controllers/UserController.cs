using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MultimediaService.Context;
using System.Security.Cryptography;
using System.Text;

namespace MultimediaService.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly UserContext _context;

        public UserController(UserContext context)
        {
            _context = context;
        }

        [HttpPost("register")] //http://localhost:3000/api/user/register
        public async Task<IActionResult> Register([FromBody] User user)
        {
            if (await _context.Users.AnyAsync(u => u.Username == user.Username))
            {
                return BadRequest("Username already exists.");
            }

            if (await _context.Users.AnyAsync(u => u.Email == user.Email))
            {
                return BadRequest("Email already registered.");
            }

            user.PasswordHash = HashPassword(user.PasswordHash);
            user.CreatedAt = DateTime.Now;

            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            return Ok(new { user.Id, user.Username, user.Email });
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] User user)
        {
            var dbUser = await _context.Users.FirstOrDefaultAsync(u => u.Username == user.Username);
            if (dbUser == null || !VerifyPassword(user.PasswordHash, dbUser.PasswordHash))
            {
                return Unauthorized("Invalid username or password.");
            }

            // Need add token.
            return Ok("Login successful.");
        }

        [HttpPost("logout")]
        public IActionResult Logout()
        {
            // Need proper session or token invalidation.
            return Ok("Logout successful.");
        }

        private string HashPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            {
                var hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return BitConverter.ToString(hashedBytes).Replace("-", "").ToLower();
            }
        }

        private bool VerifyPassword(string enteredPassword, string storedHash)
        {
            var enteredHash = HashPassword(enteredPassword);
            return enteredHash == storedHash;
        }
    }
}
