using System;
using System.Collections.Generic;

namespace LinqToSqlExercises.DataAccess.Models
{
    public partial class PurchaseOrders
    {
        public PurchaseOrders()
        {
            InventoryTransactions = new HashSet<InventoryTransactions>();
            PurchaseOrderDetails = new HashSet<PurchaseOrderDetails>();
        }

        public int PurchaseOrderId { get; set; }
        public int? SupplierId { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? SubmittedDate { get; set; }
        public DateTime? CreationDate { get; set; }
        public int? StatusId { get; set; }
        public DateTime? ExpectedDate { get; set; }
        public decimal ShippingFee { get; set; }
        public decimal Taxes { get; set; }
        public DateTime? PaymentDate { get; set; }
        public decimal? PaymentAmount { get; set; }
        public string PaymentMethod { get; set; }
        public string Notes { get; set; }
        public int? ApprovedBy { get; set; }
        public DateTime? ApprovedDate { get; set; }
        public int? SubmittedBy { get; set; }
        public byte[] SsmaTimeStamp { get; set; }

        public Employees CreatedByNavigation { get; set; }
        public PurchaseOrderStatus Status { get; set; }
        public Suppliers Supplier { get; set; }
        public ICollection<InventoryTransactions> InventoryTransactions { get; set; }
        public ICollection<PurchaseOrderDetails> PurchaseOrderDetails { get; set; }
    }
}
