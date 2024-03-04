using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Doreamon.Data;
using Doreamon.Models;

namespace Doreamon.Repositories
{
    public class OrderDetailsRepository : IOrderDetailsRepository
    {
        private readonly DoreamonWebContext _context;
        private readonly IMapper _mapper;

        public OrderDetailsRepository(DoreamonWebContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<List<OrderDetailsModel>> AddListOrderDetailsAsync(List<CartModel> cartModelList, int orderId)
        {
            List<OrderDetails> orderDetailsList = new List<OrderDetails>();

            foreach (var cartModel in cartModelList)
            {
                orderDetailsList.Add(new OrderDetails{
                    ProductId = cartModel.ProductId,
                    OrderId = orderId,
                    Quantity = cartModel.Quantity,
                    Price = cartModel.Products.Price / cartModel.Quantity,
                    Total = cartModel.Products.Price
                });
            }

            _context.OrderDetails.AddRange(orderDetailsList);
            await _context.SaveChangesAsync();

            return _mapper.Map<List<OrderDetailsModel>>(orderDetailsList); 
        }
    }
}