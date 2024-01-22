using Doreamon.Models;

namespace Doreamon.Repositories
{
    public interface ICartRepository
    {
        public Task<CartModel> addToCart(int Id, int UserId);
        public Task<List<CartModel>> GetCartProducts(int userId);
    }
}
