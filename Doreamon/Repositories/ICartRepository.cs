using Doreamon.Models;

namespace Doreamon.Repositories
{
    public interface ICartRepository
    {
        public Task<CartModel> AddToCart(int Id, int UserId, bool IncreaseQuantity);
        public Task<List<CartModel>> GetCartProducts(int userId);
    }
}
