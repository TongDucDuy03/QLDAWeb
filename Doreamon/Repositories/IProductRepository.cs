using Doreamon.Data;
using Doreamon.Models;

namespace Doreamon.Repositories
{
    public interface IProductRepository
    {
        public Task<List<ProductsModel>> getAllProductsAsync();
        public Task<List<ProductsModel>> getProductsBySeriesIdAsync(int seriesId);
        public Task<ProductsModel> getProductsById(int productId);
    }
}
