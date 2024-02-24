using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Doreamon.Data;
using Doreamon.Models;
using Doreamon.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Doreamon.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AccountController : ControllerBase
    {
        private readonly ITokenRepository _tokenRepo;
        private readonly IUserRepository _userRepo;

        public AccountController(ITokenRepository tokenRepo, IUserRepository userRepo)
        {
            _tokenRepo = tokenRepo;
            _userRepo = userRepo;
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register(RegisterModel registerModel)
        {
            if (await UserExist(registerModel.UserName)) return BadRequest("UserName is taken");
            else
            {
                var user = new User
                {
                    UserName = registerModel.UserName.ToLower(),
                    Password = registerModel.Password
                };

                await _userRepo.AddUserAsync(user);

                return Ok(new 
                {
                    UserName = user.UserName,
                    Token = await _tokenRepo.CreateToken(user)
                });
            }
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login(LoginModel loginModel)
        {
            var user = await _userRepo.GetUserByUserNameAsync(loginModel.UserName);

            if (user == null) return Unauthorized("Invalid username");
            else
            {
                if(user.Password != loginModel.Password) return Unauthorized("Invalid password");

                return Ok(new
                {
                    UserName = user.UserName,
                    Token = await _tokenRepo.CreateToken(user)
                });
            }
        }

        private async Task<bool> UserExist(string username)
        {
            return await _userRepo.UserExistAsync(username);
        }
    }
}