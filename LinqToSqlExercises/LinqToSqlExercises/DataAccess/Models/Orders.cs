using System;
using System.Collections.Generic;

namespace LinqToSqlExercises.DataAccess.Models
{
    public partial class Orders
    {
        public Orders()
        {
            InventoryTransactions = new HashSet<InventoryTransactions>();
            Invoices = new HashSet<Invoices>();
            OrderDetails = new HashSet<OrderDetails>();
        }

        public int OrderId { get; set; }
        public int? EmployeeId { get; set; }
        public int? CustomerId { get; set; }
        public DateTime? OrderDate { get; set; }
        public DateTime? ShippedDate { get; set; }
        public int? ShipperId { get; set; }
        public string ShipName { get; set; }
        public string ShipAddress { get; set; }
        public string ShipCity { get; set; }
        public string ShipStateProvince { get; set; }
        public string ShipZipPostalCode { get; set; }
        public string ShipCountryRegion { get; set; }
        public decimal? ShippingFee { get; set; }
        public decimal? Taxes { get; set; }
        public string PaymentType { get; set; }
        public DateTime? PaidDate { get; set; }
        public string Notes { get; set; }
        public double? TaxRate { get; set; }
        public byte? TaxStatus { get; set; }
        public byte? StatusId { get; set; }
        public byte[] SsmaTimeStamp { get; set; }

        public Customers Customer { get; set; }
        public Employees Employee { get; set; }
        public Shippers Shipper { get; set; }
        public OrdersStatus Status { get; set; }
        public OrdersTaxStatus TaxStatusNavigation { get; set; }
        public ICollection<InventoryTransactions> InventoryTransactions { get; set; }
        public ICollection<Invoices> Invoices { get; set; }
        public ICollection<OrderDetails> OrderDetails { get; set; }
    }
}
