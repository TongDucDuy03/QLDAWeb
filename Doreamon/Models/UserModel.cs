﻿using Doreamon.Data;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace Doreamon.Models
{
    public enum UserStatus
    {
        Active,
        Inactive
    }
    public class UserModel
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
        public UserModel()
        {
            Orderss = new List<Order>();
            Carts = new List<Cart>();
        }
    }
}
