using System;
using System.Collections.Generic;

namespace LinqToSqlExercises.DataAccess.Models
{
    public partial class OrderDetailsStatus
    {
        public OrderDetailsStatus()
        {
            OrderDetails = new HashSet<OrderDetails>();
        }

        public int StatusId { get; set; }
        public string StatusName { get; set; }

        public ICollection<OrderDetails> OrderDetails { get; set; }
    }
}
