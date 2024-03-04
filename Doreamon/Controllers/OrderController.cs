using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Doreamon.Models;
using Doreamon.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.IdentityModel.Tokens;

namespace Doreamon.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class OrderController : ControllerBase
    {
        private IOrderRepository _orderRepo;
        private IOrderDetailsRepository _orderDetailsRepo;
        private ICartRepository _cartRepo;
        public OrderController(IOrderRepository orderRepo, IOrderDetailsRepository orderDetailsRepo, ICartRepository cartRepo)
        {
            _orderRepo = orderRepo;
            _orderDetailsRepo = orderDetailsRepo;
            _cartRepo = cartRepo;
        }

        [HttpPost("CreateOrder")]
        public async Task<IActionResult> CreateOrder(OrderDtoModel orderDtoModel)
        {
            try
            {
                var cartProduct = await _cartRepo.GetCartProducts(orderDtoModel.UserId);
                if (cartProduct.IsNullOrEmpty()) return NotFound();
                else
                {
                    var order = await _orderRepo.CreateOrderAsync(orderDtoModel);
                    await _orderDetailsRepo.AddListOrderDetailsAsync(cartProduct, order.OrderId);
                    await _cartRepo.DeleteAllCartProduct(orderDtoModel.UserId);
                    return Ok(order);
                }
            }
            catch
            {
                return BadRequest();
            }
        }

        // [HttpPost]
        // public async Task<IActionResult> PlaceOrder(int userId, string deliveryAddress)
        // {
        //     bool result = await _orderRepository.PlaceOrder(userId, deliveryAddress);

        //     if (result)
        //     {
        //         return Ok("Order placed successfully");
        //     }
        //     else
        //     {
        //         return BadRequest("Failed to place order");
        //     }
        // }
    }
}
    
