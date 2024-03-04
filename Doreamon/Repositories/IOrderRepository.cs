using System.Threading.Tasks;

namespace Doreamon.Repositories
{
    public interface IOrderRepository
    {
        Task<bool> PlaceOrder(int userId, string deliveryAddress);
    }
}
