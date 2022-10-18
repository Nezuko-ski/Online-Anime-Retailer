using GoAnime.Core.ViewModels;
using GoAnime.Domain.Enums;
using GoAnime.Domain.Models;
using GoAnime.Infrastructure;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace GoAnime.Controllers
{
    public class AccountController : Controller
    {
        private readonly UserManager<AnimeFan> _userManager;
        private readonly SignInManager<AnimeFan> _signInManager;
        private readonly AnimeDbContext _context;
        public AccountController(UserManager<AnimeFan> userManager, SignInManager<AnimeFan> signInManager,
            AnimeDbContext context)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _context = context;
        }

        public async Task<IActionResult> Users() => View(await _context.Users.ToListAsync());
        public IActionResult Login() => View(new LoginVM());

        [HttpPost]
        public async Task<IActionResult> Login(LoginVM loginVM)
        {
            if (!ModelState.IsValid) return View(loginVM);
            var user = await _userManager.FindByEmailAsync(loginVM.EmailAddress);
            if (user != null)
            {
                var passwordCheck = await _userManager.CheckPasswordAsync(user, loginVM.Password);
                if (passwordCheck)
                {
                    var result = await _signInManager.PasswordSignInAsync(user, loginVM.Password, false, false);
                    if (result.Succeeded)
                    {
                        return RedirectToAction("Index", "Anime");
                    }
                }
                TempData["Error"] = "Wrong details! Kindly try again";
                return View(loginVM);
            }
            TempData["Error"] = "Wrong details! Kindly try again";
            return View(loginVM);
        }
        public IActionResult Register() => View(new RegisterVM());
        
        [HttpPost]
        public async Task<IActionResult> Register(RegisterVM registerVM)
        {
            if (!ModelState.IsValid) return View(registerVM);
            var user = await _userManager.FindByEmailAsync(registerVM.EmailAddress);
            if (user != null)
            {
                TempData["Error"] = "Email address already in use!";
                return View(registerVM);
            }
            var newUser = new AnimeFan()
            {
                FullName = registerVM.FullName,
                Email = registerVM.EmailAddress,
                UserName = registerVM.FullName.Split().First()
            };
            var newUserResponse = await _userManager.CreateAsync(newUser, registerVM.Password);
            if (newUserResponse.Succeeded)
                await _userManager.AddToRoleAsync(newUser, UserRoles.Customer.ToString());
            return View("RegistrationComplete");
        }
        [HttpPost]
        public async Task<IActionResult> Logout()
        {
            await _signInManager.SignOutAsync();
            return RedirectToAction("Index", "Anime");
        }
    }
}
