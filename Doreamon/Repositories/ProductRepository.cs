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
        public async Task<ProductsModel> getProductsById(int productId)
        {
            var product = await _context.Products.FindAsync(productId);

            return _mapper.Map<ProductsModel>(product);
        }

        
    }
}
