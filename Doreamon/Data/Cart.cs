namespace Doreamon.Data
{
    public class Cart
    {
        public int ProductId { get; set; }
        public int UserId { get; set; }
        public int Quantity { get; set; }
        public User User { get; set; }
        public Products Products { get; set; }
    }
}