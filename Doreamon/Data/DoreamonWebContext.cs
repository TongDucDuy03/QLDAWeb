using Microsoft.EntityFrameworkCore;

namespace Doreamon.Data
{
    public class DoreamonWebContext:DbContext
    {
        public DoreamonWebContext(DbContextOptions<DoreamonWebContext>options) : base(options) { }
        #region DbSet
        public DbSet<Products>? Products { get; set; }
        public DbSet<Order>? Orders { get; set;}
        public DbSet<OrderDetails>?  OrderDetails { get; set; }
        public DbSet<Series>? Series { get; set; }
        public DbSet<User>? User { get; set; }
        public DbSet<Cart> Carts { get; set; }
        #endregion
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Products>(e =>
            {
                e.HasOne(e => e.Series)
                .WithMany(e => e.Productss)
                .HasForeignKey(e => e.Series_Id)
                .HasConstraintName("FK_Products_Series");
            });
            modelBuilder.Entity<Order>(e =>
            {
                e.ToTable("Order");
                e.HasKey(o => o.OrderId);
                e.Property(o => o.OrderDate).HasDefaultValueSql("getutcdate()");
                e.HasOne(e => e.User)
                 .WithMany(e => e.Orderss)
                 .HasForeignKey(e => e.UserId)
                 .HasConstraintName("FK_Order_User");
            });
            modelBuilder.Entity<OrderDetails>(e =>
            {
                e.ToTable("OrderDetails");
                e.HasKey(o => new {o.OrderId,o.ProductId});
                e.HasOne(e => e.Order)
                 .WithMany(e => e.OrderDetailss)
                 .HasForeignKey(e => e.OrderId)
                 .HasConstraintName("FK_OrderDetails_Order");
                e.HasOne(e => e.Products)
                 .WithMany(e => e.OrderDetailss)
                 .HasForeignKey(e => e.ProductId)
                 .HasConstraintName("FK_OrderDetails_Products");
            });
            modelBuilder.Entity<Cart>(e =>
            {
                e.ToTable("Cart");
                e.HasKey(o => new { o.ProductId, o.UserId });
                e.HasOne(e => e.Products)
                .WithMany(e => e.Carts)
                .HasForeignKey(e => e.ProductId)
                .HasConstraintName("FK_Cart_Product");
                e.HasOne(e => e.User)
                .WithMany(e => e.Carts)
                .HasForeignKey(e => e.UserId)
                .HasConstraintName("FK_Cart_User");
            });
        }
    }
}
