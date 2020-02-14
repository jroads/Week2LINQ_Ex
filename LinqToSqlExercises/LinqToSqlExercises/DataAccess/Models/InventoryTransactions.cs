using System;
using System.Collections.Generic;

namespace LinqToSqlExercises.DataAccess.Models
{
    public partial class InventoryTransactions
    {
        public InventoryTransactions()
        {
            PurchaseOrderDetails = new HashSet<PurchaseOrderDetails>();
        }

        public int TransactionId { get; set; }
        public byte TransactionType { get; set; }
        public DateTime? TransactionCreatedDate { get; set; }
        public DateTime? TransactionModifiedDate { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public int? PurchaseOrderId { get; set; }
        public int? CustomerOrderId { get; set; }
        public string Comments { get; set; }

        public Orders CustomerOrder { get; set; }
        public Products Product { get; set; }
        public PurchaseOrders PurchaseOrder { get; set; }
        public InventoryTransactionTypes TransactionTypeNavigation { get; set; }
        public ICollection<PurchaseOrderDetails> PurchaseOrderDetails { get; set; }
    }
}
