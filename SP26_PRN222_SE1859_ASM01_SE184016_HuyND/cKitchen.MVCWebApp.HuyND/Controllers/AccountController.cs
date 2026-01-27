using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Data;
using cKitchen.Services.HuyND;
using cKitchen.MVCWebApp.HuyND.Models;

namespace cKitchen.MVCWebApp.HuyND.Controllers
{
    public class AccountController : Controller
    {
        private readonly SystemUserAccountService _userAccountService;

        public AccountController(SystemUserAccountService systemUserAccountService) => _userAccountService = systemUserAccountService; 

        public IActionResult Index()
        {
            return RedirectToAction("Login");
            //return View();
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginRequest model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            try
            {
                var userAccount = await _userAccountService.GetUserAccountAsync(model.UserName, model.Password);

                if (userAccount != null)
                {
                    var claims = new List<Claim>
                                {
                                    new Claim(ClaimTypes.Name, userAccount.UserName),
                                    new Claim(ClaimTypes.Role, userAccount.RoleId.ToString())
                                };

                    var identity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(identity));

                    Response.Cookies.Append("UserName", userAccount.FullName);
                    Response.Cookies.Append("Role", userAccount.RoleId.ToString());

                    return RedirectToAction("Index", "InventoryHuyNds");
                }                
            }
            catch (Exception)
            {
                // Log error if needed
            }

            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            ModelState.AddModelError("", "Login failure");
            return View(model);
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("Login", "Account");
        }

        public IActionResult Forbidden()
        {
            return View();
        }
    }
}
