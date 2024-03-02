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
        private IUserRepository _userRepo;
        public UserController(IUserRepository repo)
        {
            _userRepo = repo;
        }

        [HttpGet("{userId}")]
        public async Task<IActionResult> GetUserByUserIdAsync(int userId)
        {
            try
            {
                var user = await _userRepo.GetUserByUserIdAsync(userId);
                if(user == null){
                    return NotFound();
                }
                else{
                    return Ok(user);
                }
            }
            catch
            {
                return BadRequest();
            }
        }
    }
}
