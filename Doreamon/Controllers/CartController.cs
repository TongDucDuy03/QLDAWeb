using AutoMapper;
using Doreamon.Models;
using Doreamon.Repositories;
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
        private IMapper _mapper;

        public CartController(ICartRepository repo, IMapper mapper) 
        {
            _cartRepo = repo;
            _mapper = mapper;

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

                var cartModelList = _mapper.Map<List<CartModel>>(cartProducts);

                return Ok(cartModelList);
            
        }
    }
}
