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
            var order = new Order
            {
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


        // public async Task<bool> PlaceOrder(int userId, string deliveryAddress)
        // {
        //     try
        //     {
        //         var user = await _context.User.FirstOrDefaultAsync(u => u.UserId == userId);
        //         if (user == null)
        //         {
        //             return false;
        //         }

        //         var cartItems = await _context.Carts.Where(c => c.UserId == userId).ToListAsync();
        //         if (cartItems.Count == 0)
        //         {
        //             return false;
        //         }

        //         var order = new Order
        //         {
        //             UserId = userId,
        //             OrderDate = DateTime.Now,
        //             DeliveryAddress = deliveryAddress,
        //             Status = OrderStatus.Confirm
        //         };

        //         foreach (var cartItem in cartItems)
        //         {
        //             var product = await _context.Products.FirstOrDefaultAsync(p => p.Id == cartItem.ProductId);

        //             if (product != null)
        //             {
        //                 var orderDetail = new OrderDetails
        //                 {
        //                     ProductId = cartItem.ProductId,
        //                     Quantity = cartItem.Quantity,
        //                     Price = product.Price, // Lấy giá từ bảng Products
        //                     DiscountPrice = product.DiscountPrice,
        //                     Total = cartItem.Quantity * product.Price // Tính tổng giá trị dựa trên giá của sản phẩm
        //                 };
        //                 order.OrderDetailss.Add(orderDetail);
        //             }
        //             else
        //             {
        //                 // Xử lý khi không tìm thấy thông tin sản phẩm
        //             }
        //         }

        //         _context.Orders.Add(order);
        //         _context.Carts.RemoveRange(cartItems);
        //         await _context.SaveChangesAsync();

        //         return true;
        //     }
        //     catch (Exception ex)
        //     {
        //         return false;
        //     }
        // }
    }
}
