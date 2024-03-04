using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Doreamon.Data;
using Doreamon.Models;
using Microsoft.AspNetCore.Mvc;

namespace Doreamon.Repositories
{
    public class OrderRepository : IOrderRepository
    {
        private readonly DoreamonWebContext _context;
        private readonly IMapper _mapper;

        public OrderRepository(DoreamonWebContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<OrderModel> CreateOrderAsync(OrderDtoModel orderDtoModel)
        {
            var order = new Order{
                    UserId = orderDtoModel.UserId,
                    OrderDate = DateTime.Now,
                    Status = Data.OrderStatus.Unpaid,
                    Address = orderDtoModel.Address,
                    PaymentMethod = orderDtoModel.PaymentMethod
            };

            _context.Orders.Add(order);
            await _context.SaveChangesAsync();
            
            return _mapper.Map<OrderModel>(order); 
        }
    }
}