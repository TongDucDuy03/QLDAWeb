using AutoMapper;
using Doreamon.Models;
using Doreamon.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Doreamon.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CartController : ControllerBase
    {
        private ICartRepository _cartRepo;

        public CartController(ICartRepository repo, IMapper mapper) 
        {
            _cartRepo = repo;

        }
        [HttpPost]
        public async Task<IActionResult> addToCart(int Id, int UserId)
        {

            var check = await _cartRepo.addToCart(UserId, Id);
            return Ok(check);
        }
        [HttpGet("cart/{userId}")]
        public async Task<IActionResult> GetCartProducts(int userId)
        {
                var cartProducts = await _cartRepo.GetCartProducts(userId);

                return Ok(cartProducts);
            
        }
    }
}
