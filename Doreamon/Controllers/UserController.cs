using AutoMapper;
using Doreamon.Data;
using Doreamon.Models;
using Doreamon.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace Doreamon.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly AppSetting _AppSetting;
        private IUserRepository _UserRepo;
        public UserController(IUserRepository repo, IOptionsMonitor<AppSetting> optionsMonitor)
        {
            _UserRepo = repo;
            _AppSetting = optionsMonitor.CurrentValue;
        }

        [HttpPost("Login")]
        public async Task<IActionResult> Validate(LoginModel model)
        {
            var user = await _UserRepo.GetUserByUserNameAsync(model);
            if (user == null)
            {
                return Ok(new APIResponse
                {
                    Success = false,
                    Message = "Invalid UserName or Password",
                });
            }
            else
            {
                //cấp token
                return Ok(new APIResponse
                {
                    Success = true,
                    Message = "Authenticate success",
                    Data = GenerateToken(user),
                });
            }
        }
        private string GenerateToken(UserModel user)
        {
            var jwtTokenHandle = new JwtSecurityTokenHandler();
            var secretKeyBytes = Encoding.UTF8.GetBytes(_AppSetting.SecretKey);

            var tokenDescription = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[]
                {
                    new Claim("UserName", user.UserName),
                    new Claim("Id", user.UserId.ToString()),

                    new Claim("TokenId", Guid.NewGuid().ToString()),
                }),
                Expires = DateTime.UtcNow.AddMinutes(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(secretKeyBytes), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = jwtTokenHandle.CreateToken(tokenDescription);
            return jwtTokenHandle.WriteToken(token);
        }
    }
}
