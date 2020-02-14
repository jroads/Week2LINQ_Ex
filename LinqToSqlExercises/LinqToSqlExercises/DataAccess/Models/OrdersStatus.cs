using System;
using System.Collections.Generic;

namespace LinqToSqlExercises.DataAccess.Models
{
    public partial class OrdersStatus
    {
        public OrdersStatus()
        {
            Orders = new HashSet<Orders>();
        }

        public byte StatusId { get; set; }
        public string StatusName { get; set; }

        public ICollection<Orders> Orders { get; set; }
    }
}
