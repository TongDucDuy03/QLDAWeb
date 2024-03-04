using Doreamon.Models;

namespace Doreamon.Repositories
{
    public interface ICartRepository
    {
        public Task<CartModel> AddToCart(int UserId, int ProductId, bool IncreaseQuantity);
        public Task<CartModel> DeleteCartProduct(int UserId, int ProductId);
        public Task<List<CartModel>> GetCartProducts(int userId);
        public Task<List<CartModel>> DeleteAllCartProduct(int UserId);
    }
}
