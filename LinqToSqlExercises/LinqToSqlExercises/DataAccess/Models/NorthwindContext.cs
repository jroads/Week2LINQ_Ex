using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace LinqToSqlExercises.DataAccess.Models
{
    public partial class NorthwindContext : DbContext
    {
        public virtual DbSet<Customers> Customers { get; set; }
        public virtual DbSet<EmployeePrivileges> EmployeePrivileges { get; set; }
        public virtual DbSet<Employees> Employees { get; set; }
        public virtual DbSet<InventoryTransactions> InventoryTransactions { get; set; }
        public virtual DbSet<InventoryTransactionTypes> InventoryTransactionTypes { get; set; }
        public virtual DbSet<Invoices> Invoices { get; set; }
        public virtual DbSet<OrderDetails> OrderDetails { get; set; }
        public virtual DbSet<OrderDetailsStatus> OrderDetailsStatus { get; set; }
        public virtual DbSet<Orders> Orders { get; set; }
        public virtual DbSet<OrdersStatus> OrdersStatus { get; set; }
        public virtual DbSet<OrdersTaxStatus> OrdersTaxStatus { get; set; }
        public virtual DbSet<Privileges> Privileges { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<PurchaseOrderDetails> PurchaseOrderDetails { get; set; }
        public virtual DbSet<PurchaseOrders> PurchaseOrders { get; set; }
        public virtual DbSet<PurchaseOrderStatus> PurchaseOrderStatus { get; set; }
        public virtual DbSet<SalesReports> SalesReports { get; set; }
        public virtual DbSet<Shippers> Shippers { get; set; }
        public virtual DbSet<Strings> Strings { get; set; }
        public virtual DbSet<Suppliers> Suppliers { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer(@"Server=(LocalDb)\mssqllocaldb;Database=Northwind;Trusted_Connection=true;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Customers>(entity =>
            {
                entity.HasIndex(e => e.City)
                    .HasName("Customers$City");

                entity.HasIndex(e => e.Company)
                    .HasName("Customers$Company");

                entity.HasIndex(e => e.FirstName)
                    .HasName("Customers$First Name");

                entity.HasIndex(e => e.LastName)
                    .HasName("Customers$Last Name");

                entity.HasIndex(e => e.StateProvince)
                    .HasName("Customers$State/Province");

                entity.HasIndex(e => e.ZipPostalCode)
                    .HasName("Customers$Postal Code");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Attachments).HasColumnType("varchar(8000)");

                entity.Property(e => e.BusinessPhone)
                    .HasColumnName("Business Phone")
                    .HasMaxLength(25);

                entity.Property(e => e.City).HasMaxLength(50);

                entity.Property(e => e.Company).HasMaxLength(50);

                entity.Property(e => e.CountryRegion)
                    .HasColumnName("Country/Region")
                    .HasMaxLength(50);

                entity.Property(e => e.EMailAddress)
                    .HasColumnName("E-mail Address")
                    .HasMaxLength(50);

                entity.Property(e => e.FaxNumber)
                    .HasColumnName("Fax Number")
                    .HasMaxLength(25);

                entity.Property(e => e.FirstName)
                    .HasColumnName("First Name")
                    .HasMaxLength(50);

                entity.Property(e => e.HomePhone)
                    .HasColumnName("Home Phone")
                    .HasMaxLength(25);

                entity.Property(e => e.JobTitle)
                    .HasColumnName("Job Title")
                    .HasMaxLength(50);

                entity.Property(e => e.LastName)
                    .HasColumnName("Last Name")
                    .HasMaxLength(50);

                entity.Property(e => e.MobilePhone)
                    .HasColumnName("Mobile Phone")
                    .HasMaxLength(25);

                entity.Property(e => e.SsmaTimeStamp)
                    .IsRequired()
                    .HasColumnName("SSMA_TimeStamp")
                    .IsRowVersion();

                entity.Property(e => e.StateProvince)
                    .HasColumnName("State/Province")
                    .HasMaxLength(50);

                entity.Property(e => e.WebPage).HasColumnName("Web Page");

                entity.Property(e => e.ZipPostalCode)
                    .HasColumnName("ZIP/Postal Code")
                    .HasMaxLength(15);
            });

            modelBuilder.Entity<EmployeePrivileges>(entity =>
            {
                entity.HasKey(e => new { e.EmployeeId, e.PrivilegeId });

                entity.ToTable("Employee Privileges");

                entity.HasIndex(e => e.EmployeeId)
                    .HasName("Employee Privileges$New_EmployeePriviligesforEmployees");

                entity.HasIndex(e => e.PrivilegeId)
                    .HasName("Employee Privileges$Privilege ID");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee ID");

                entity.Property(e => e.PrivilegeId).HasColumnName("Privilege ID");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.EmployeePrivileges)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Employee Privileges$New_EmployeePriviligesforEmployees");

                entity.HasOne(d => d.Privilege)
                    .WithMany(p => p.EmployeePrivileges)
                    .HasForeignKey(d => d.PrivilegeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Employee Privileges$New_EmployeePriviligesLookup");
            });

            modelBuilder.Entity<Employees>(entity =>
            {
                entity.HasIndex(e => e.City)
                    .HasName("Employees$City");

                entity.HasIndex(e => e.Company)
                    .HasName("Employees$Company");

                entity.HasIndex(e => e.FirstName)
                    .HasName("Employees$First Name");

                entity.HasIndex(e => e.LastName)
                    .HasName("Employees$Last Name");

                entity.HasIndex(e => e.StateProvince)
                    .HasName("Employees$State/Province");

                entity.HasIndex(e => e.ZipPostalCode)
                    .HasName("Employees$Postal Code");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Attachments).HasColumnType("varchar(8000)");

                entity.Property(e => e.BusinessPhone)
                    .HasColumnName("Business Phone")
                    .HasMaxLength(25);

                entity.Property(e => e.City).HasMaxLength(50);

                entity.Property(e => e.Company).HasMaxLength(50);

                entity.Property(e => e.CountryRegion)
                    .HasColumnName("Country/Region")
                    .HasMaxLength(50);

                entity.Property(e => e.EMailAddress)
                    .HasColumnName("E-mail Address")
                    .HasMaxLength(50);

                entity.Property(e => e.FaxNumber)
                    .HasColumnName("Fax Number")
                    .HasMaxLength(25);

                entity.Property(e => e.FirstName)
                    .HasColumnName("First Name")
                    .HasMaxLength(50);

                entity.Property(e => e.HomePhone)
                    .HasColumnName("Home Phone")
                    .HasMaxLength(25);

                entity.Property(e => e.JobTitle)
                    .HasColumnName("Job Title")
                    .HasMaxLength(50);

                entity.Property(e => e.LastName)
                    .HasColumnName("Last Name")
                    .HasMaxLength(50);

                entity.Property(e => e.MobilePhone)
                    .HasColumnName("Mobile Phone")
                    .HasMaxLength(25);

                entity.Property(e => e.SsmaTimeStamp)
                    .IsRequired()
                    .HasColumnName("SSMA_TimeStamp")
                    .IsRowVersion();

                entity.Property(e => e.StateProvince)
                    .HasColumnName("State/Province")
                    .HasMaxLength(50);

                entity.Property(e => e.WebPage).HasColumnName("Web Page");

                entity.Property(e => e.ZipPostalCode)
                    .HasColumnName("ZIP/Postal Code")
                    .HasMaxLength(15);
            });

            modelBuilder.Entity<InventoryTransactions>(entity =>
            {
                entity.HasKey(e => e.TransactionId);

                entity.ToTable("Inventory Transactions");

                entity.HasIndex(e => e.CustomerOrderId)
                    .HasName("Inventory Transactions$OrdersOnInventoryTransactions");

                entity.HasIndex(e => e.ProductId)
                    .HasName("Inventory Transactions$ProductOnInventoryTransaction");

                entity.HasIndex(e => e.PurchaseOrderId)
                    .HasName("Inventory Transactions$Purchase Order ID");

                entity.HasIndex(e => e.TransactionType)
                    .HasName("Inventory Transactions$TransactionTypesOnInventoryTransactiosn");

                entity.Property(e => e.TransactionId).HasColumnName("Transaction ID");

                entity.Property(e => e.Comments).HasMaxLength(255);

                entity.Property(e => e.CustomerOrderId).HasColumnName("Customer Order ID");

                entity.Property(e => e.ProductId).HasColumnName("Product ID");

                entity.Property(e => e.PurchaseOrderId).HasColumnName("Purchase Order ID");

                entity.Property(e => e.TransactionCreatedDate)
                    .HasColumnName("Transaction Created Date")
                    .HasColumnType("datetime2(0)")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.TransactionModifiedDate)
                    .HasColumnName("Transaction Modified Date")
                    .HasColumnType("datetime2(0)")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.TransactionType).HasColumnName("Transaction Type");

                entity.HasOne(d => d.CustomerOrder)
                    .WithMany(p => p.InventoryTransactions)
                    .HasForeignKey(d => d.CustomerOrderId)
                    .HasConstraintName("Inventory Transactions$New_OrdersOnInventoryTransactions");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.InventoryTransactions)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Inventory Transactions$New_ProductOnInventoryTransaction");

                entity.HasOne(d => d.PurchaseOrder)
                    .WithMany(p => p.InventoryTransactions)
                    .HasForeignKey(d => d.PurchaseOrderId)
                    .HasConstraintName("Inventory Transactions$New_PuchaseOrdersonInventoryTransactions");

                entity.HasOne(d => d.TransactionTypeNavigation)
                    .WithMany(p => p.InventoryTransactions)
                    .HasForeignKey(d => d.TransactionType)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("Inventory Transactions$New_TransactionTypesOnInventoryTransactiosn");
            });

            modelBuilder.Entity<InventoryTransactionTypes>(entity =>
            {
                entity.ToTable("Inventory Transaction Types");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.TypeName)
                    .IsRequired()
                    .HasColumnName("Type Name")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Invoices>(entity =>
            {
                entity.HasKey(e => e.InvoiceId);

                entity.HasIndex(e => e.OrderId)
                    .HasName("Invoices$OrderInvoice");

                entity.Property(e => e.InvoiceId).HasColumnName("Invoice ID");

                entity.Property(e => e.AmountDue)
                    .HasColumnName("Amount Due")
                    .HasColumnType("money")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.DueDate)
                    .HasColumnName("Due Date")
                    .HasColumnType("datetime2(0)");

                entity.Property(e => e.InvoiceDate)
                    .HasColumnName("Invoice Date")
                    .HasColumnType("datetime2(0)")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.OrderId).HasColumnName("Order ID");

                entity.Property(e => e.Shipping)
                    .HasColumnType("money")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.Tax)
                    .HasColumnType("money")
                    .HasDefaultValueSql("((0))");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.Invoices)
                    .HasForeignKey(d => d.OrderId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("Invoices$New_OrderInvoice");
            });

            modelBuilder.Entity<OrderDetails>(entity =>
            {
                entity.ToTable("Order Details");

                entity.HasIndex(e => e.Id)
                    .HasName("Order Details$ID");

                entity.HasIndex(e => e.InventoryId)
                    .HasName("Order Details$Inventory ID");

                entity.HasIndex(e => e.OrderId)
                    .HasName("Order Details$OrderID");

                entity.HasIndex(e => e.ProductId)
                    .HasName("Order Details$ProductsOnOrders");

                entity.HasIndex(e => e.PurchaseOrderId)
                    .HasName("Order Details$Purchase Order ID");

                entity.HasIndex(e => e.StatusId)
                    .HasName("Order Details$Status ID");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.DateAllocated)
                    .HasColumnName("Date Allocated")
                    .HasColumnType("datetime2(0)");

                entity.Property(e => e.Discount).HasDefaultValueSql("((0))");

                entity.Property(e => e.InventoryId).HasColumnName("Inventory ID");

                entity.Property(e => e.OrderId).HasColumnName("Order ID");

                entity.Property(e => e.ProductId).HasColumnName("Product ID");

                entity.Property(e => e.PurchaseOrderId).HasColumnName("Purchase Order ID");

                entity.Property(e => e.Quantity).HasDefaultValueSql("((0))");

                entity.Property(e => e.SsmaTimeStamp)
                    .IsRequired()
                    .HasColumnName("SSMA_TimeStamp")
                    .IsRowVersion();

                entity.Property(e => e.StatusId).HasColumnName("Status ID");

                entity.Property(e => e.UnitPrice)
                    .HasColumnName("Unit Price")
                    .HasColumnType("money")
                    .HasDefaultValueSql("((0))");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("Order Details$New_OrderDetails");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("Order Details$New_ProductsOnOrders");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("Order Details$New_OrderStatusLookup");
            });

            modelBuilder.Entity<OrderDetailsStatus>(entity =>
            {
                entity.HasKey(e => e.StatusId);

                entity.ToTable("Order Details Status");

                entity.Property(e => e.StatusId)
                    .HasColumnName("Status ID")
                    .ValueGeneratedNever();

                entity.Property(e => e.StatusName)
                    .IsRequired()
                    .HasColumnName("Status Name")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Orders>(entity =>
            {
                entity.HasKey(e => e.OrderId);

                entity.HasIndex(e => e.CustomerId)
                    .HasName("Orders$New_CustomerOnOrders");

                entity.HasIndex(e => e.EmployeeId)
                    .HasName("Orders$New_EmployeesOnOrders");

                entity.HasIndex(e => e.OrderId)
                    .HasName("Orders$ID");

                entity.HasIndex(e => e.ShipZipPostalCode)
                    .HasName("Orders$ZIP/Postal Code");

                entity.HasIndex(e => e.ShipperId)
                    .HasName("Orders$ShipperOnOrder");

                entity.HasIndex(e => e.StatusId)
                    .HasName("Orders$Status ID");

                entity.HasIndex(e => e.TaxStatus)
                    .HasName("Orders$TaxStatusOnOrders");

                entity.Property(e => e.OrderId).HasColumnName("Order ID");

                entity.Property(e => e.CustomerId).HasColumnName("Customer ID");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee ID");

                entity.Property(e => e.OrderDate)
                    .HasColumnName("Order Date")
                    .HasColumnType("datetime2(0)")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.PaidDate)
                    .HasColumnName("Paid Date")
                    .HasColumnType("datetime2(0)");

                entity.Property(e => e.PaymentType)
                    .HasColumnName("Payment Type")
                    .HasMaxLength(50);

                entity.Property(e => e.ShipAddress).HasColumnName("Ship Address");

                entity.Property(e => e.ShipCity)
                    .HasColumnName("Ship City")
                    .HasMaxLength(50);

                entity.Property(e => e.ShipCountryRegion)
                    .HasColumnName("Ship Country/Region")
                    .HasMaxLength(50);

                entity.Property(e => e.ShipName)
                    .HasColumnName("Ship Name")
                    .HasMaxLength(50);

                entity.Property(e => e.ShipStateProvince)
                    .HasColumnName("Ship State/Province")
                    .HasMaxLength(50);

                entity.Property(e => e.ShipZipPostalCode)
                    .HasColumnName("Ship ZIP/Postal Code")
                    .HasMaxLength(50);

                entity.Property(e => e.ShippedDate)
                    .HasColumnName("Shipped Date")
                    .HasColumnType("datetime2(0)");

                entity.Property(e => e.ShipperId).HasColumnName("Shipper ID");

                entity.Property(e => e.ShippingFee)
                    .HasColumnName("Shipping Fee")
                    .HasColumnType("money")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.SsmaTimeStamp)
                    .IsRequired()
                    .HasColumnName("SSMA_TimeStamp")
                    .IsRowVersion();

                entity.Property(e => e.StatusId)
                    .HasColumnName("Status ID")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.TaxRate)
                    .HasColumnName("Tax Rate")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.TaxStatus).HasColumnName("Tax Status");

                entity.Property(e => e.Taxes)
                    .HasColumnType("money")
                    .HasDefaultValueSql("((0))");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("Orders$New_CustomerOnOrders");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("Orders$New_EmployeesOnOrders");

                entity.HasOne(d => d.Shipper)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.ShipperId)
                    .HasConstraintName("Orders$New_ShipperOnOrder");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("Orders$New_OrderStatus");

                entity.HasOne(d => d.TaxStatusNavigation)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.TaxStatus)
                    .HasConstraintName("Orders$New_TaxStatusOnOrders");
            });

            modelBuilder.Entity<OrdersStatus>(entity =>
            {
                entity.HasKey(e => e.StatusId);

                entity.ToTable("Orders Status");

                entity.Property(e => e.StatusId).HasColumnName("Status ID");

                entity.Property(e => e.StatusName)
                    .IsRequired()
                    .HasColumnName("Status Name")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<OrdersTaxStatus>(entity =>
            {
                entity.ToTable("Orders Tax Status");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.TaxStatusName)
                    .IsRequired()
                    .HasColumnName("Tax Status Name")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Privileges>(entity =>
            {
                entity.HasKey(e => e.PrivilegeId);

                entity.Property(e => e.PrivilegeId).HasColumnName("Privilege ID");

                entity.Property(e => e.PrivilegeName)
                    .HasColumnName("Privilege Name")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Products>(entity =>
            {
                entity.HasIndex(e => e.ProductCode)
                    .HasName("Products$Product Code");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Attachments).HasColumnType("varchar(8000)");

                entity.Property(e => e.Category).HasMaxLength(50);

                entity.Property(e => e.Discontinued).HasDefaultValueSql("((0))");

                entity.Property(e => e.ListPrice)
                    .HasColumnName("List Price")
                    .HasColumnType("money")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.MinimumReorderQuantity).HasColumnName("Minimum Reorder Quantity");

                entity.Property(e => e.ProductCode)
                    .HasColumnName("Product Code")
                    .HasMaxLength(25);

                entity.Property(e => e.ProductName)
                    .HasColumnName("Product Name")
                    .HasMaxLength(50);

                entity.Property(e => e.QuantityPerUnit)
                    .HasColumnName("Quantity Per Unit")
                    .HasMaxLength(50);

                entity.Property(e => e.ReorderLevel).HasColumnName("Reorder Level");

                entity.Property(e => e.SsmaTimeStamp)
                    .IsRequired()
                    .HasColumnName("SSMA_TimeStamp")
                    .IsRowVersion();

                entity.Property(e => e.StandardCost)
                    .HasColumnName("Standard Cost")
                    .HasColumnType("money")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.SupplierIds)
                    .HasColumnName("Supplier IDs")
                    .HasColumnType("varchar(8000)");

                entity.Property(e => e.TargetLevel).HasColumnName("Target Level");
            });

            modelBuilder.Entity<PurchaseOrderDetails>(entity =>
            {
                entity.ToTable("Purchase Order Details");

                entity.HasIndex(e => e.Id)
                    .HasName("Purchase Order Details$ID");

                entity.HasIndex(e => e.InventoryId)
                    .HasName("Purchase Order Details$New_InventoryTransactionsOnPurchaseOrders");

                entity.HasIndex(e => e.ProductId)
                    .HasName("Purchase Order Details$ProductOnPurchaseOrderDetails");

                entity.HasIndex(e => e.PurchaseOrderId)
                    .HasName("Purchase Order Details$PurchaseOrderDeatilsOnPurchaseOrder");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.DateReceived)
                    .HasColumnName("Date Received")
                    .HasColumnType("datetime2(0)");

                entity.Property(e => e.InventoryId).HasColumnName("Inventory ID");

                entity.Property(e => e.PostedToInventory)
                    .HasColumnName("Posted To Inventory")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.ProductId).HasColumnName("Product ID");

                entity.Property(e => e.PurchaseOrderId).HasColumnName("Purchase Order ID");

                entity.Property(e => e.SsmaTimeStamp)
                    .IsRequired()
                    .HasColumnName("SSMA_TimeStamp")
                    .IsRowVersion();

                entity.Property(e => e.UnitCost)
                    .HasColumnName("Unit Cost")
                    .HasColumnType("money");

                entity.HasOne(d => d.Inventory)
                    .WithMany(p => p.PurchaseOrderDetails)
                    .HasForeignKey(d => d.InventoryId)
                    .HasConstraintName("Purchase Order Details$New_InventoryTransactionsOnPurchaseOrders");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.PurchaseOrderDetails)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("Purchase Order Details$New_ProductOnPurchaseOrderDetails");

                entity.HasOne(d => d.PurchaseOrder)
                    .WithMany(p => p.PurchaseOrderDetails)
                    .HasForeignKey(d => d.PurchaseOrderId)
                    .HasConstraintName("Purchase Order Details$New_PurchaseOrderDeatilsOnPurchaseOrder");
            });

            modelBuilder.Entity<PurchaseOrders>(entity =>
            {
                entity.HasKey(e => e.PurchaseOrderId);

                entity.ToTable("Purchase Orders");

                entity.HasIndex(e => e.CreatedBy)
                    .HasName("Purchase Orders$New_EmployeesOnPurchaseOrder");

                entity.HasIndex(e => e.PurchaseOrderId)
                    .HasName("Purchase Orders$ID")
                    .IsUnique();

                entity.HasIndex(e => e.StatusId)
                    .HasName("Purchase Orders$Status ID");

                entity.HasIndex(e => e.SupplierId)
                    .HasName("Purchase Orders$SuppliersOnPurchaseOrder");

                entity.Property(e => e.PurchaseOrderId).HasColumnName("Purchase Order ID");

                entity.Property(e => e.ApprovedBy).HasColumnName("Approved By");

                entity.Property(e => e.ApprovedDate)
                    .HasColumnName("Approved Date")
                    .HasColumnType("datetime2(0)");

                entity.Property(e => e.CreatedBy).HasColumnName("Created By");

                entity.Property(e => e.CreationDate)
                    .HasColumnName("Creation Date")
                    .HasColumnType("datetime2(0)")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.ExpectedDate)
                    .HasColumnName("Expected Date")
                    .HasColumnType("datetime2(0)");

                entity.Property(e => e.PaymentAmount)
                    .HasColumnName("Payment Amount")
                    .HasColumnType("money")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.PaymentDate)
                    .HasColumnName("Payment Date")
                    .HasColumnType("datetime2(0)");

                entity.Property(e => e.PaymentMethod)
                    .HasColumnName("Payment Method")
                    .HasMaxLength(50);

                entity.Property(e => e.ShippingFee)
                    .HasColumnName("Shipping Fee")
                    .HasColumnType("money")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.SsmaTimeStamp)
                    .IsRequired()
                    .HasColumnName("SSMA_TimeStamp")
                    .IsRowVersion();

                entity.Property(e => e.StatusId)
                    .HasColumnName("Status ID")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.SubmittedBy).HasColumnName("Submitted By");

                entity.Property(e => e.SubmittedDate)
                    .HasColumnName("Submitted Date")
                    .HasColumnType("datetime2(0)");

                entity.Property(e => e.SupplierId).HasColumnName("Supplier ID");

                entity.Property(e => e.Taxes)
                    .HasColumnType("money")
                    .HasDefaultValueSql("((0))");

                entity.HasOne(d => d.CreatedByNavigation)
                    .WithMany(p => p.PurchaseOrders)
                    .HasForeignKey(d => d.CreatedBy)
                    .HasConstraintName("Purchase Orders$New_EmployeesOnPurchaseOrder");

                entity.HasOne(d => d.Status)
                    .WithMany(p => p.PurchaseOrders)
                    .HasForeignKey(d => d.StatusId)
                    .HasConstraintName("Purchase Orders$New_PurchaseOrderStatusLookup");

                entity.HasOne(d => d.Supplier)
                    .WithMany(p => p.PurchaseOrders)
                    .HasForeignKey(d => d.SupplierId)
                    .HasConstraintName("Purchase Orders$New_SuppliersOnPurchaseOrder");
            });

            modelBuilder.Entity<PurchaseOrderStatus>(entity =>
            {
                entity.HasKey(e => e.StatusId);

                entity.ToTable("Purchase Order Status");

                entity.Property(e => e.StatusId)
                    .HasColumnName("Status ID")
                    .ValueGeneratedNever();

                entity.Property(e => e.Status).HasMaxLength(50);
            });

            modelBuilder.Entity<SalesReports>(entity =>
            {
                entity.HasKey(e => e.GroupBy);

                entity.ToTable("Sales Reports");

                entity.Property(e => e.GroupBy)
                    .HasColumnName("Group By")
                    .HasMaxLength(50)
                    .ValueGeneratedNever();

                entity.Property(e => e.Default).HasDefaultValueSql("((0))");

                entity.Property(e => e.Display).HasMaxLength(50);

                entity.Property(e => e.FilterRowSource).HasColumnName("Filter Row Source");

                entity.Property(e => e.SsmaTimeStamp)
                    .IsRequired()
                    .HasColumnName("SSMA_TimeStamp")
                    .IsRowVersion();

                entity.Property(e => e.Title).HasMaxLength(50);
            });

            modelBuilder.Entity<Shippers>(entity =>
            {
                entity.HasIndex(e => e.City)
                    .HasName("Shippers$City");

                entity.HasIndex(e => e.Company)
                    .HasName("Shippers$Company");

                entity.HasIndex(e => e.FirstName)
                    .HasName("Shippers$First Name");

                entity.HasIndex(e => e.LastName)
                    .HasName("Shippers$Last Name");

                entity.HasIndex(e => e.StateProvince)
                    .HasName("Shippers$State/Province");

                entity.HasIndex(e => e.ZipPostalCode)
                    .HasName("Shippers$Postal Code");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Attachments).HasColumnType("varchar(8000)");

                entity.Property(e => e.BusinessPhone)
                    .HasColumnName("Business Phone")
                    .HasMaxLength(25);

                entity.Property(e => e.City).HasMaxLength(50);

                entity.Property(e => e.Company).HasMaxLength(50);

                entity.Property(e => e.CountryRegion)
                    .HasColumnName("Country/Region")
                    .HasMaxLength(50);

                entity.Property(e => e.EMailAddress)
                    .HasColumnName("E-mail Address")
                    .HasMaxLength(50);

                entity.Property(e => e.FaxNumber)
                    .HasColumnName("Fax Number")
                    .HasMaxLength(25);

                entity.Property(e => e.FirstName)
                    .HasColumnName("First Name")
                    .HasMaxLength(50);

                entity.Property(e => e.HomePhone)
                    .HasColumnName("Home Phone")
                    .HasMaxLength(25);

                entity.Property(e => e.JobTitle)
                    .HasColumnName("Job Title")
                    .HasMaxLength(50);

                entity.Property(e => e.LastName)
                    .HasColumnName("Last Name")
                    .HasMaxLength(50);

                entity.Property(e => e.MobilePhone)
                    .HasColumnName("Mobile Phone")
                    .HasMaxLength(25);

                entity.Property(e => e.SsmaTimeStamp)
                    .IsRequired()
                    .HasColumnName("SSMA_TimeStamp")
                    .IsRowVersion();

                entity.Property(e => e.StateProvince)
                    .HasColumnName("State/Province")
                    .HasMaxLength(50);

                entity.Property(e => e.WebPage).HasColumnName("Web Page");

                entity.Property(e => e.ZipPostalCode)
                    .HasColumnName("ZIP/Postal Code")
                    .HasMaxLength(15);
            });

            modelBuilder.Entity<Strings>(entity =>
            {
                entity.HasKey(e => e.StringId);

                entity.Property(e => e.StringId).HasColumnName("String ID");

                entity.Property(e => e.StringData)
                    .HasColumnName("String Data")
                    .HasMaxLength(255);
            });

            modelBuilder.Entity<Suppliers>(entity =>
            {
                entity.HasIndex(e => e.City)
                    .HasName("Suppliers$City");

                entity.HasIndex(e => e.Company)
                    .HasName("Suppliers$Company");

                entity.HasIndex(e => e.FirstName)
                    .HasName("Suppliers$First Name");

                entity.HasIndex(e => e.LastName)
                    .HasName("Suppliers$Last Name");

                entity.HasIndex(e => e.StateProvince)
                    .HasName("Suppliers$State/Province");

                entity.HasIndex(e => e.ZipPostalCode)
                    .HasName("Suppliers$Postal Code");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Attachments).HasColumnType("varchar(8000)");

                entity.Property(e => e.BusinessPhone)
                    .HasColumnName("Business Phone")
                    .HasMaxLength(25);

                entity.Property(e => e.City).HasMaxLength(50);

                entity.Property(e => e.Company).HasMaxLength(50);

                entity.Property(e => e.CountryRegion)
                    .HasColumnName("Country/Region")
                    .HasMaxLength(50);

                entity.Property(e => e.EMailAddress)
                    .HasColumnName("E-mail Address")
                    .HasMaxLength(50);

                entity.Property(e => e.FaxNumber)
                    .HasColumnName("Fax Number")
                    .HasMaxLength(25);

                entity.Property(e => e.FirstName)
                    .HasColumnName("First Name")
                    .HasMaxLength(50);

                entity.Property(e => e.HomePhone)
                    .HasColumnName("Home Phone")
                    .HasMaxLength(25);

                entity.Property(e => e.JobTitle)
                    .HasColumnName("Job Title")
                    .HasMaxLength(50);

                entity.Property(e => e.LastName)
                    .HasColumnName("Last Name")
                    .HasMaxLength(50);

                entity.Property(e => e.MobilePhone)
                    .HasColumnName("Mobile Phone")
                    .HasMaxLength(25);

                entity.Property(e => e.SsmaTimeStamp)
                    .IsRequired()
                    .HasColumnName("SSMA_TimeStamp")
                    .IsRowVersion();

                entity.Property(e => e.StateProvince)
                    .HasColumnName("State/Province")
                    .HasMaxLength(50);

                entity.Property(e => e.WebPage).HasColumnName("Web Page");

                entity.Property(e => e.ZipPostalCode)
                    .HasColumnName("ZIP/Postal Code")
                    .HasMaxLength(15);
            });
        }
    }
}
