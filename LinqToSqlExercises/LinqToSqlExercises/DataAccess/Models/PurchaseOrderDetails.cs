using System;
using System.Collections.Generic;

namespace LinqToSqlExercises.DataAccess.Models
{
    public partial class PurchaseOrderDetails
    {
        public int Id { get; set; }
        public int PurchaseOrderId { get; set; }
        public int? ProductId { get; set; }
        public double Quantity { get; set; }
        public decimal UnitCost { get; set; }
        public DateTime? DateReceived { get; set; }
        public bool? PostedToInventory { get; set; }
        public int? InventoryId { get; set; }
        public byte[] SsmaTimeStamp { get; set; }

        public InventoryTransactions Inventory { get; set; }
        public Products Product { get; set; }
        public PurchaseOrders PurchaseOrder { get; set; }
    }
}
