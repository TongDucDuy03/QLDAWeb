using AutoMapper;
using Doreamon.Data;
using Doreamon.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Doreamon.Repositories
{
    public class CartRepository:ICartRepository
    {
        private DoreamonWebContext _context;
        private readonly IMapper _mapper;
        public CartRepository(DoreamonWebContext context, IMapper mapper) 
        {
            _context = context;
            _mapper = mapper;
        }

        public async Task<CartModel> addToCart(int UserId, int Id)
        {
            var cart = await _context.Carts.FirstOrDefaultAsync(m => m.UserId == UserId && m.ProductId == Id);
            if (cart == null)
            {
                cart = new Cart { UserId = UserId, ProductId = Id, Quantity = 1 };
                _context.Carts.Add(cart);
            }
            else
            {
                cart.Quantity += 1;
            }
            await _context.SaveChangesAsync();
            return _mapper.Map<CartModel>(cart);

        }

        public async Task<List<CartModel>> GetCartProducts(int userId)
        {
            var cartProducts = await (
                from c in _context.Carts
                join p in _context.Products on c.ProductId equals p.Id
                where c.UserId == userId
                select new CartModel
                {
                    Quantity = c.Quantity,
                    Products = new Products 
                    {
                        Name = p.Name,
                        Description = p.Description,
                        Price = p.Price,
                        DiscountPrice = p.DiscountPrice,
                        ImagesUrl = p.ImagesUrl,
                    }
                }
            ).ToListAsync();

            return _mapper.Map< List<CartModel>>(cartProducts);
        }
    }
}
