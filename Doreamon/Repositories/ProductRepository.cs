using AutoMapper;
using Doreamon.Data;
using Doreamon.Models;
using Microsoft.EntityFrameworkCore;

namespace Doreamon.Repositories
{
    public class ProductRepository : IProductRepository
    {
        private readonly DoreamonWebContext _context;
        private readonly IMapper _mapper;

        public ProductRepository(DoreamonWebContext context,IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }


        public async Task<List<ProductsModel>> getAllProductsAsync()
        {
            var products = await _context.Products!.ToListAsync();
            return _mapper.Map<List<ProductsModel>>(products);
        }

        public async Task<List<ProductsModel>> getProductsBySeriesIdAsync(int seriesId)
        {
            var products = await _context.Products
                .Where(p => p.Series_Id == seriesId)
                .ToListAsync();

            return _mapper.Map<List<ProductsModel>>(products);
        }
        public async Task<CartModel> addToCart(int UserId,int Id)
        {
            var user = await _context.User.FindAsync(UserId);

            if (user == null)
            {

            }
            var cart = await _context.Carts.FirstOrDefaultAsync(c => c.ProductId == Id);
            if (cart == null)
            {
                cart = new Cart { UserId = UserId, ProductId = Id, Quantity = 1 };
            }
            else
            {
                cart.Quantity = 1;
            }
            await _context.SaveChangesAsync();
            return _mapper.Map<CartModel>(cart);
            
        }

    }
}
