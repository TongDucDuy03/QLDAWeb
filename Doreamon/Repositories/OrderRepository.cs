using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Doreamon.Data;
using Doreamon.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Elfie.Extensions;
using Microsoft.EntityFrameworkCore;

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
            var order = new Order
            {
                OrderId = Convert.ToInt32(DateTime.Now.ToString("ddHHmmss")),
                UserId = orderDtoModel.UserId,
                OrderDate = DateTime.Now,
                Status = Data.OrderStatus.Unconfirm,
                PaymentStatus = Data.OrderPaymentStatus.Unpaid,
                Address = orderDtoModel.Address,
                PaymentMethod = orderDtoModel.PaymentMethod
            };

            _context.Orders.Add(order);
            await _context.SaveChangesAsync();

            return _mapper.Map<OrderModel>(order);
        }


        public async Task<bool> PlaceOrder(int userId, string address)
        {
            try
            {
                var user = await _context.User.FirstOrDefaultAsync(u => u.UserId == userId);
                if (user == null)
                {
                    return false;
                }

                var cartItems = await _context.Carts.Where(c => c.UserId == userId).ToListAsync();
                if (cartItems.Count == 0)
                {
                    return false;
                }

                var order = new Order
                {
                    UserId = userId,
                    OrderDate = DateTime.Now,
                    Address = address,
                    Status = Data.OrderStatus.Confirm
                };

                foreach (var cartItem in cartItems)
                {
                    var product = await _context.Products.FirstOrDefaultAsync(p => p.Id == cartItem.ProductId);

                    if (product != null)
                    {
                        var orderDetail = new OrderDetails
                        {
                            ProductId = cartItem.ProductId,
                            Quantity = cartItem.Quantity,
                            Price = product.Price, 
                            DiscountPrice = product.DiscountPrice,
                            Total = cartItem.Quantity * product.Price 
                        };
                        order.OrderDetailss.Add(orderDetail);
                    }
                    else
                    {
                    }
                }

                _context.Orders.Add(order);
                _context.Carts.RemoveRange(cartItems);
                await _context.SaveChangesAsync();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public async Task<bool> UpdateOrderStatusAsync(int orderId)
        {
            var order = await _context.Orders.FindAsync(orderId);

            if(order != null)
            {
                order.PaymentStatus = Data.OrderPaymentStatus.Paid;
                await _context.SaveChangesAsync();

                return true;
            }

            return false;
        }
    }
}
