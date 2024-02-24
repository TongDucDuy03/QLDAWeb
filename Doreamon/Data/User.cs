using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Doreamon.Data
{
    public enum UserStatus
    {
        Active,
        Inactive
    }
    [Table("User")]
    public class User
    {
        [Key]
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string? UserEmail { get; set; }
        public string Password { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public UserStatus? Status { get; set; }
        public ICollection<Order> Orderss { get; set; }
        public ICollection<Cart> Carts { get; set; }
        public User()
        {
            Orderss = new List<Order>();
            Carts = new List<Cart>();
        }
    }
}