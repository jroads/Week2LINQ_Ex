using System;
using System.Collections.Generic;

namespace LinqToSqlExercises.DataAccess.Models
{
    public partial class Products
    {
        public Products()
        {
            InventoryTransactions = new HashSet<InventoryTransactions>();
            OrderDetails = new HashSet<OrderDetails>();
            PurchaseOrderDetails = new HashSet<PurchaseOrderDetails>();
        }

        public string SupplierIds { get; set; }
        public int Id { get; set; }
        public string ProductCode { get; set; }
        public string ProductName { get; set; }
        public string Description { get; set; }
        public decimal? StandardCost { get; set; }
        public decimal ListPrice { get; set; }
        public short? ReorderLevel { get; set; }
        public int? TargetLevel { get; set; }
        public string QuantityPerUnit { get; set; }
        public bool? Discontinued { get; set; }
        public short? MinimumReorderQuantity { get; set; }
        public string Category { get; set; }
        public string Attachments { get; set; }
        public byte[] SsmaTimeStamp { get; set; }

        public ICollection<InventoryTransactions> InventoryTransactions { get; set; }
        public ICollection<OrderDetails> OrderDetails { get; set; }
        public ICollection<PurchaseOrderDetails> PurchaseOrderDetails { get; set; }
    }
}
