namespace Doreamon.Data
{
    public enum OrderStatus
    {
        Confirm = 0, Shipping = 1, Completed = 2, Unconfirm = -1, Cancelled = -2
    }

    public enum OrderPaymentStatus
    {
        Unpaid = 0, Paid = 1
    }

    public enum OrderPaymentMethod
    {
        COD = 1, MomoPayment = 2
    }

    public class Order
    {
        public int OrderId { get; set; }
        public int UserId { get; set; }
        public DateTime? OrderDate { get; set; }
        public DateTime? DeliveryDate { get; set; }
        public string Address { get; set; }
        public OrderPaymentMethod PaymentMethod { get; set; }
        public OrderPaymentStatus PaymentStatus { get; set; }
        public OrderStatus Status { get; set; }

        public ICollection<OrderDetails> OrderDetailss { get; set; }
        public User User { get; set; }
        public Order()
        {
            OrderDetailss = new List<OrderDetails>();
        }
    }
}
