using Doreamon.Data;

namespace Doreamon.Models
{
    public class CartModel
    {
        public int ProductId { get; set; }
        public int UserId { get; set; }
        public int Quantity { get; set; }
        public User User { get; set; }
        public Products Products { get; set; }
    }
}
