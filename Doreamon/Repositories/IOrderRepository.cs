using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Doreamon.Models;

namespace Doreamon.Repositories
{
    public interface IOrderRepository
    {
        public Task<OrderModel> CreateOrderAsync(OrderDtoModel orderDtoModel);
        Task<bool> PlaceOrder(int userId, string address);
    }
}
