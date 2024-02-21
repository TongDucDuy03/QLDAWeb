// using System;
// using System.Collections.Generic;
// using System.Linq;
// using System.Threading.Tasks;
// using Doreamon.Data;
// using Doreamon.Repositories;
// using Microsoft.AspNetCore.Mvc;
// using Microsoft.EntityFrameworkCore;

// namespace Doreamon.Controllers
// {
//     [ApiController]
//     [Route("api/[controller]")]
//     public class AccountController : ControllerBase
//     {
//         private readonly DoreamonWebContext _context;
//         private readonly ITokenRepository _tokenrepo;

//         public AccountController(DoreamonWebContext context, TokenRepository tokenRepo)
//         {
//             _context = context;
//             _tokenrepo = tokenRepo;
//         }

//         [HttpPost("register")]
//         public async Task<IActionResult> Register(RegisterDto registerDto)
//         {
//             if (await UserExits(registerDto.UserName)) return BadRequest("UserName is taken");
//             else
//             {
//                 using var hmac = new HMACSHA512();

//                 var user = new User
//                 {
//                     UserName = registerDto.UserName.ToLower(),
//                     PasswordHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(registerDto.Password)),
//                     PasswordSalt = hmac.Key
//                 };

//                 _context.Add(user);
//                 await _context.SaveChangesAsync();

//                 return new UserDto
//                 {
//                     UserName = user.UserName,
//                     Token = _tokenService.CreateToken(user)
//                 };
//             }
//         }
//     }
// }