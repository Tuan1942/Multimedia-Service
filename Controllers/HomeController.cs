using MultimediaService.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using MultimediaService.Context;
using System.Security.Claims;

namespace MultimediaService.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly UserContext _userContext;

        public HomeController(ILogger<HomeController> logger, UserContext userContext)
        {
            _logger = logger;
            _userContext = userContext;
        }

        public async Task<IActionResult> IndexAsync()
        {
            var viewModel = new UserView();
            if (User.Identity.IsAuthenticated)
            {
                var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
                if (int.TryParse(userIdClaim, out var userId))
                {
                    var user = await _userContext.Users.FindAsync(userId);
                    if (user != null)
                    {
                        viewModel.Username = user.Username;
                        viewModel.Email = user.Email;
                    }
                }
            }

            return View(viewModel);
        }
        public IActionResult Login()
        {
            return View(new LoginModel());
        }
        public IActionResult Register()
        {
            return View(new RegisterModel());
        }

        public IActionResult Video()
        {
            return View();
        }

        public IActionResult CaptureImage()
        {
            return View();
        }

        public IActionResult Audio()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
