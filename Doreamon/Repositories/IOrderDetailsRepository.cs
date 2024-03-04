using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Doreamon.Models;

namespace Doreamon.Repositories
{
    public interface IOrderDetailsRepository
    {
        public Task<List<OrderDetailsModel>> AddListOrderDetailsAsync(List<CartModel> cartModel, int orderId);
    }
}