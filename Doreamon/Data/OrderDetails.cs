namespace Doreamon.Data
{
    public class OrderDetails
    {
        public int ProductId { get; set; }
        public int OrderId { get; set; }
        public int Id { get; set; }
        public int Quantity { get; set; }
        public double Price { get; set; }
        public double? DiscountPrice { get; set; }
        public double Total {  get; set; }


        public Products Products { get; set; }
        public Order Order { get; set; }
    }
}
