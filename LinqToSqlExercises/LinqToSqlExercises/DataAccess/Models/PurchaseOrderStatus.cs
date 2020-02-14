using System;
using System.Collections.Generic;

namespace LinqToSqlExercises.DataAccess.Models
{
    public partial class PurchaseOrderStatus
    {
        public PurchaseOrderStatus()
        {
            PurchaseOrders = new HashSet<PurchaseOrders>();
        }

        public int StatusId { get; set; }
        public string Status { get; set; }

        public ICollection<PurchaseOrders> PurchaseOrders { get; set; }
    }
}
