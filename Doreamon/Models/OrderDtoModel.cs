using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Doreamon.Migrations;

namespace Doreamon.Models
{
    public class OrderDtoModel
    {
        public int UserId { get; set; }
        public string Address { get; set; }
        public Data.OrderPaymentMethod PaymentMethod { get; set; }
    }
}