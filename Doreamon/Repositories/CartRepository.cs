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

        public async Task<CartModel> AddToCart(int UserId, int ProductId, bool IncreaseQuantity)
        {
            var cart = await _context.Carts.FirstOrDefaultAsync(m => m.UserId == UserId && m.ProductId == ProductId);
            if (cart == null)
            {
                if (IncreaseQuantity)
                {
                    cart = new Cart { UserId = UserId, ProductId = ProductId, Quantity = 1 };
                    _context.Carts.Add(cart);
                }
            }
            else
            {
                if (IncreaseQuantity)
                {
                    cart.Quantity += 1; 
                }
                else
                {
                    if (cart.Quantity > 1)
                    {
                        cart.Quantity -= 1; 
                    }
                    else
                    {
                        _context.Carts.Remove(cart); 
                    }
                }
            }
            await _context.SaveChangesAsync();
            return _mapper.Map<CartModel>(cart);
        }
        public async Task<CartModel> DeleteCartProduct(int UserId, int ProductId){
            var product = await _context.Carts.FirstOrDefaultAsync(m => m.UserId == UserId && m.ProductId == ProductId);
            if(product != null){
                _context.Carts.Remove(product);
            }
            await _context.SaveChangesAsync();
            return _mapper.Map<CartModel>(product);
        }

        public async Task<List<CartModel>> DeleteAllCartProduct(int UserId){
            var cartProductList = await _context.Carts.Where(m => m.UserId == UserId).ToListAsync();
            if(cartProductList != null){
                _context.Carts.RemoveRange(cartProductList);
            }
            await _context.SaveChangesAsync();
            return _mapper.Map<List<CartModel>>(cartProductList);
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
                    UserId = c.UserId, 
                    ProductId = c.ProductId,
                    Products = new Products 
                    {
                        Name = p.Name,
                        Description = p.Description,
                        Price = p.Price*c.Quantity,
                        DiscountPrice = p.DiscountPrice,
                        ImagesUrl = p.ImagesUrl,
                    }
                }
            ).ToListAsync();
            return _mapper.Map<List<CartModel>>(cartProducts);
        }
    }
}
