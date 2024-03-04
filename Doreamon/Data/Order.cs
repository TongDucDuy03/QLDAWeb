namespace Doreamon.Data
{
    public enum OrderStatus
    {
        Confirm = 0,Shipping = 1,Completed = 2,Canceled = -1
    }
    public class Order
    {
        public int OrderId { get; set; }
        public int UserId { get; set; }
        public DateTime? OrderDate { get; set; }
        public DateTime? DeliveryDate { get; set; }
        public string DeliveryAddress { get; set; }

        public OrderStatus Status { get; set; }

        public ICollection<OrderDetails> OrderDetailss { get; set; }
        public User User { get; set; }
        public Order ()
        {
            OrderDetailss = new List<OrderDetails> ();
        }
    }
}
