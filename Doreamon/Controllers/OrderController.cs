using Microsoft.AspNetCore.Mvc;
using Doreamon.Repositories;
using System.Threading.Tasks;

namespace Doreamon.Controllers
{
    [ApiController]
    [Route("api/orders")]
    public class OrderController : ControllerBase
    {
        private readonly IOrderRepository _orderRepository;

        public OrderController(IOrderRepository orderRepository)
        {
            _orderRepository = orderRepository;
        }

        [HttpPost]
        public async Task<IActionResult> PlaceOrder(int userId, string deliveryAddress)
        {
            bool result = await _orderRepository.PlaceOrder(userId, deliveryAddress);

            if (result)
            {
                return Ok("Order placed successfully");
            }
            else
            {
                return BadRequest("Failed to place order");
            }
        }
    }
}
