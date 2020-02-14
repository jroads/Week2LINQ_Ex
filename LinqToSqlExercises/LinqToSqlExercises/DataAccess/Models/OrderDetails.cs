using System;
using System.Collections.Generic;

namespace LinqToSqlExercises.DataAccess.Models
{
    public partial class OrderDetails
    {
        public int Id { get; set; }
        public int OrderId { get; set; }
        public int? ProductId { get; set; }
        public double Quantity { get; set; }
        public decimal? UnitPrice { get; set; }
        public double Discount { get; set; }
        public int? StatusId { get; set; }
        public DateTime? DateAllocated { get; set; }
        public int? PurchaseOrderId { get; set; }
        public int? InventoryId { get; set; }
        public byte[] SsmaTimeStamp { get; set; }

        public Orders Order { get; set; }
        public Products Product { get; set; }
        public OrderDetailsStatus Status { get; set; }
    }
}
