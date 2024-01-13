﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Doreamon.Data
{
    public enum Status
    {
        Active,
        Inactive
    }
    [Table("Products")]
    public class Products
    {
        [Key]
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public int Quantity { get; set; }
        public double Price { get; set; }
        public double DiscountPrice { get; set; }
        public string? ImagesUrl { get; set; }
        public Status Status { get; set; }
        public DateTime? CreatedAt { get; set; }
        public DateTime? UpdatedAt { get; set; }

        public int? Series_Id { get; set; }
        public Series Series { get; set; }
        public ICollection<OrderDetails> OrderDetailss{ get; set; }
        public Products()
        {
            OrderDetailss = new List<OrderDetails>();
        }
    }
}
