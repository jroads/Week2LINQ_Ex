USE master;

-- Drop database
IF DB_ID('Northwind') IS NOT NULL DROP DATABASE Northwind;

-- If database could not be created due to open connections, abort
IF @@ERROR = 3702 
   RAISERROR('Database cannot be dropped because there are still open connections.', 127, 127) WITH NOWAIT, LOG;

/*
We can use the CREATE statement in DDL (data definition language)
to define database objects.  The basic syntax for this statement is

CREATE <object type> <objectname>
*/
create database Northwind;
go

/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1601)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [Northwind]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](50) NULL,
	[Last Name] [nvarchar](50) NULL,
	[First Name] [nvarchar](50) NULL,
	[E-mail Address] [nvarchar](50) NULL,
	[Job Title] [nvarchar](50) NULL,
	[Business Phone] [nvarchar](25) NULL,
	[Home Phone] [nvarchar](25) NULL,
	[Mobile Phone] [nvarchar](25) NULL,
	[Fax Number] [nvarchar](25) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](50) NULL,
	[State/Province] [nvarchar](50) NULL,
	[ZIP/Postal Code] [nvarchar](15) NULL,
	[Country/Region] [nvarchar](50) NULL,
	[Web Page] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[Attachments] [varchar](8000) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [Customers$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee Privileges]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee Privileges](
	[Employee ID] [int] NOT NULL,
	[Privilege ID] [int] NOT NULL,
 CONSTRAINT [Employee Privileges$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Employee ID] ASC,
	[Privilege ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](50) NULL,
	[Last Name] [nvarchar](50) NULL,
	[First Name] [nvarchar](50) NULL,
	[E-mail Address] [nvarchar](50) NULL,
	[Job Title] [nvarchar](50) NULL,
	[Business Phone] [nvarchar](25) NULL,
	[Home Phone] [nvarchar](25) NULL,
	[Mobile Phone] [nvarchar](25) NULL,
	[Fax Number] [nvarchar](25) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](50) NULL,
	[State/Province] [nvarchar](50) NULL,
	[ZIP/Postal Code] [nvarchar](15) NULL,
	[Country/Region] [nvarchar](50) NULL,
	[Web Page] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[Attachments] [varchar](8000) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [Employees$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory Transaction Types]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory Transaction Types](
	[ID] [tinyint] NOT NULL,
	[Type Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [Inventory Transaction Types$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory Transactions]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory Transactions](
	[Transaction ID] [int] IDENTITY(1,1) NOT NULL,
	[Transaction Type] [tinyint] NOT NULL,
	[Transaction Created Date] [datetime2](0) NULL,
	[Transaction Modified Date] [datetime2](0) NULL,
	[Product ID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Purchase Order ID] [int] NULL,
	[Customer Order ID] [int] NULL,
	[Comments] [nvarchar](255) NULL,
 CONSTRAINT [Inventory Transactions$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Transaction ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[Invoice ID] [int] IDENTITY(1,1) NOT NULL,
	[Order ID] [int] NULL,
	[Invoice Date] [datetime2](0) NULL,
	[Due Date] [datetime2](0) NULL,
	[Tax] [money] NULL,
	[Shipping] [money] NULL,
	[Amount Due] [money] NULL,
 CONSTRAINT [Invoices$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Invoice ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Details]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order ID] [int] NOT NULL,
	[Product ID] [int] NULL,
	[Quantity] [float] NOT NULL,
	[Unit Price] [money] NULL,
	[Discount] [float] NOT NULL,
	[Status ID] [int] NULL,
	[Date Allocated] [datetime2](0) NULL,
	[Purchase Order ID] [int] NULL,
	[Inventory ID] [int] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [Order Details$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Details Status]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details Status](
	[Status ID] [int] NOT NULL,
	[Status Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [Order Details Status$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Status ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order ID] [int] IDENTITY(1,1) NOT NULL,
	[Employee ID] [int] NULL,
	[Customer ID] [int] NULL,
	[Order Date] [datetime2](0) NULL,
	[Shipped Date] [datetime2](0) NULL,
	[Shipper ID] [int] NULL,
	[Ship Name] [nvarchar](50) NULL,
	[Ship Address] [nvarchar](max) NULL,
	[Ship City] [nvarchar](50) NULL,
	[Ship State/Province] [nvarchar](50) NULL,
	[Ship ZIP/Postal Code] [nvarchar](50) NULL,
	[Ship Country/Region] [nvarchar](50) NULL,
	[Shipping Fee] [money] NULL,
	[Taxes] [money] NULL,
	[Payment Type] [nvarchar](50) NULL,
	[Paid Date] [datetime2](0) NULL,
	[Notes] [nvarchar](max) NULL,
	[Tax Rate] [float] NULL,
	[Tax Status] [tinyint] NULL,
	[Status ID] [tinyint] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [Orders$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders Status]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders Status](
	[Status ID] [tinyint] NOT NULL,
	[Status Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [Orders Status$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Status ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders Tax Status]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders Tax Status](
	[ID] [tinyint] NOT NULL,
	[Tax Status Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [Orders Tax Status$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Privileges]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privileges](
	[Privilege ID] [int] IDENTITY(1,1) NOT NULL,
	[Privilege Name] [nvarchar](50) NULL,
 CONSTRAINT [Privileges$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Privilege ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Supplier IDs] [varchar](8000) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Product Code] [nvarchar](25) NULL,
	[Product Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Standard Cost] [money] NULL,
	[List Price] [money] NOT NULL,
	[Reorder Level] [smallint] NULL,
	[Target Level] [int] NULL,
	[Quantity Per Unit] [nvarchar](50) NULL,
	[Discontinued] [bit] NOT NULL,
	[Minimum Reorder Quantity] [smallint] NULL,
	[Category] [nvarchar](50) NULL,
	[Attachments] [varchar](8000) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [Products$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase Order Details]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase Order Details](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Purchase Order ID] [int] NOT NULL,
	[Product ID] [int] NULL,
	[Quantity] [float] NOT NULL,
	[Unit Cost] [money] NOT NULL,
	[Date Received] [datetime2](0) NULL,
	[Posted To Inventory] [bit] NOT NULL,
	[Inventory ID] [int] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [Purchase Order Details$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase Order Status]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase Order Status](
	[Status ID] [int] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [Purchase Order Status$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Status ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase Orders]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase Orders](
	[Purchase Order ID] [int] IDENTITY(1,1) NOT NULL,
	[Supplier ID] [int] NULL,
	[Created By] [int] NULL,
	[Submitted Date] [datetime2](0) NULL,
	[Creation Date] [datetime2](0) NULL,
	[Status ID] [int] NULL,
	[Expected Date] [datetime2](0) NULL,
	[Shipping Fee] [money] NOT NULL,
	[Taxes] [money] NOT NULL,
	[Payment Date] [datetime2](0) NULL,
	[Payment Amount] [money] NULL,
	[Payment Method] [nvarchar](50) NULL,
	[Notes] [nvarchar](max) NULL,
	[Approved By] [int] NULL,
	[Approved Date] [datetime2](0) NULL,
	[Submitted By] [int] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [Purchase Orders$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Purchase Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales Reports]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales Reports](
	[Group By] [nvarchar](50) NOT NULL,
	[Display] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Filter Row Source] [nvarchar](max) NULL,
	[Default] [bit] NOT NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [Sales Reports$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Group By] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](50) NULL,
	[Last Name] [nvarchar](50) NULL,
	[First Name] [nvarchar](50) NULL,
	[E-mail Address] [nvarchar](50) NULL,
	[Job Title] [nvarchar](50) NULL,
	[Business Phone] [nvarchar](25) NULL,
	[Home Phone] [nvarchar](25) NULL,
	[Mobile Phone] [nvarchar](25) NULL,
	[Fax Number] [nvarchar](25) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](50) NULL,
	[State/Province] [nvarchar](50) NULL,
	[ZIP/Postal Code] [nvarchar](15) NULL,
	[Country/Region] [nvarchar](50) NULL,
	[Web Page] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[Attachments] [varchar](8000) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [Shippers$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Strings]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Strings](
	[String ID] [int] IDENTITY(1,1) NOT NULL,
	[String Data] [nvarchar](255) NULL,
 CONSTRAINT [Strings$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[String ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 8/09/2017 6:48:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Company] [nvarchar](50) NULL,
	[Last Name] [nvarchar](50) NULL,
	[First Name] [nvarchar](50) NULL,
	[E-mail Address] [nvarchar](50) NULL,
	[Job Title] [nvarchar](50) NULL,
	[Business Phone] [nvarchar](25) NULL,
	[Home Phone] [nvarchar](25) NULL,
	[Mobile Phone] [nvarchar](25) NULL,
	[Fax Number] [nvarchar](25) NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](50) NULL,
	[State/Province] [nvarchar](50) NULL,
	[ZIP/Postal Code] [nvarchar](15) NULL,
	[Country/Region] [nvarchar](50) NULL,
	[Web Page] [nvarchar](max) NULL,
	[Notes] [nvarchar](max) NULL,
	[Attachments] [varchar](8000) NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [Suppliers$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Customers$City]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Customers$City] ON [dbo].[Customers]
(
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Customers$Company]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Customers$Company] ON [dbo].[Customers]
(
	[Company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Customers$First Name]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Customers$First Name] ON [dbo].[Customers]
(
	[First Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Customers$Last Name]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Customers$Last Name] ON [dbo].[Customers]
(
	[Last Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Customers$Postal Code]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Customers$Postal Code] ON [dbo].[Customers]
(
	[ZIP/Postal Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Customers$State/Province]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Customers$State/Province] ON [dbo].[Customers]
(
	[State/Province] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Employee Privileges$EmployeePriviligesforEmployees]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Employee Privileges$EmployeePriviligesforEmployees] ON [dbo].[Employee Privileges]
(
	[Employee ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Employee Privileges$EmployeePriviligesLookup]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Employee Privileges$EmployeePriviligesLookup] ON [dbo].[Employee Privileges]
(
	[Privilege ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Employee Privileges$New_EmployeePriviligesforEmployees]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Employee Privileges$New_EmployeePriviligesforEmployees] ON [dbo].[Employee Privileges]
(
	[Employee ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Employee Privileges$New_EmployeePriviligesLookup]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Employee Privileges$New_EmployeePriviligesLookup] ON [dbo].[Employee Privileges]
(
	[Privilege ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Employee Privileges$Privilege ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Employee Privileges$Privilege ID] ON [dbo].[Employee Privileges]
(
	[Privilege ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Employees$City]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Employees$City] ON [dbo].[Employees]
(
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Employees$Company]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Employees$Company] ON [dbo].[Employees]
(
	[Company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Employees$First Name]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Employees$First Name] ON [dbo].[Employees]
(
	[First Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Employees$Last Name]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Employees$Last Name] ON [dbo].[Employees]
(
	[Last Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Employees$Postal Code]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Employees$Postal Code] ON [dbo].[Employees]
(
	[ZIP/Postal Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Employees$State/Province]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Employees$State/Province] ON [dbo].[Employees]
(
	[State/Province] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Inventory Transactions$Customer Order ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Inventory Transactions$Customer Order ID] ON [dbo].[Inventory Transactions]
(
	[Customer Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Inventory Transactions$New_OrdersOnInventoryTransactions]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Inventory Transactions$New_OrdersOnInventoryTransactions] ON [dbo].[Inventory Transactions]
(
	[Customer Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Inventory Transactions$New_ProductOnInventoryTransaction]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Inventory Transactions$New_ProductOnInventoryTransaction] ON [dbo].[Inventory Transactions]
(
	[Product ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Inventory Transactions$New_PuchaseOrdersonInventoryTransactions]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Inventory Transactions$New_PuchaseOrdersonInventoryTransactions] ON [dbo].[Inventory Transactions]
(
	[Purchase Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Inventory Transactions$New_TransactionTypesOnInventoryTransactiosn]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Inventory Transactions$New_TransactionTypesOnInventoryTransactiosn] ON [dbo].[Inventory Transactions]
(
	[Transaction Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Inventory Transactions$OrdersOnInventoryTransactions]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Inventory Transactions$OrdersOnInventoryTransactions] ON [dbo].[Inventory Transactions]
(
	[Customer Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Inventory Transactions$Product ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Inventory Transactions$Product ID] ON [dbo].[Inventory Transactions]
(
	[Product ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Inventory Transactions$ProductOnInventoryTransaction]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Inventory Transactions$ProductOnInventoryTransaction] ON [dbo].[Inventory Transactions]
(
	[Product ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Inventory Transactions$PuchaseOrdersonInventoryTransactions]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Inventory Transactions$PuchaseOrdersonInventoryTransactions] ON [dbo].[Inventory Transactions]
(
	[Purchase Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Inventory Transactions$Purchase Order ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Inventory Transactions$Purchase Order ID] ON [dbo].[Inventory Transactions]
(
	[Purchase Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Inventory Transactions$TransactionTypesOnInventoryTransactiosn]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Inventory Transactions$TransactionTypesOnInventoryTransactiosn] ON [dbo].[Inventory Transactions]
(
	[Transaction Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Invoices$New_OrderInvoice]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Invoices$New_OrderInvoice] ON [dbo].[Invoices]
(
	[Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Invoices$Order ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Invoices$Order ID] ON [dbo].[Invoices]
(
	[Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Invoices$OrderInvoice]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Invoices$OrderInvoice] ON [dbo].[Invoices]
(
	[Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Order Details$ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Order Details$ID] ON [dbo].[Order Details]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Order Details$Inventory ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Order Details$Inventory ID] ON [dbo].[Order Details]
(
	[Inventory ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Order Details$New_OrderDetails]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Order Details$New_OrderDetails] ON [dbo].[Order Details]
(
	[Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Order Details$New_OrderStatusLookup]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Order Details$New_OrderStatusLookup] ON [dbo].[Order Details]
(
	[Status ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Order Details$New_ProductsOnOrders]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Order Details$New_ProductsOnOrders] ON [dbo].[Order Details]
(
	[Product ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Order Details$OrderDetails]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Order Details$OrderDetails] ON [dbo].[Order Details]
(
	[Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Order Details$OrderID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Order Details$OrderID] ON [dbo].[Order Details]
(
	[Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Order Details$OrderStatusLookup]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Order Details$OrderStatusLookup] ON [dbo].[Order Details]
(
	[Status ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Order Details$ProductID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Order Details$ProductID] ON [dbo].[Order Details]
(
	[Product ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Order Details$ProductsOnOrders]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Order Details$ProductsOnOrders] ON [dbo].[Order Details]
(
	[Product ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Order Details$Purchase Order ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Order Details$Purchase Order ID] ON [dbo].[Order Details]
(
	[Purchase Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Order Details$Status ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Order Details$Status ID] ON [dbo].[Order Details]
(
	[Status ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$CustomerID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$CustomerID] ON [dbo].[Orders]
(
	[Customer ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$CustomerOnOrders]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$CustomerOnOrders] ON [dbo].[Orders]
(
	[Customer ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$EmployeeID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$EmployeeID] ON [dbo].[Orders]
(
	[Employee ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$EmployeesOnOrders]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$EmployeesOnOrders] ON [dbo].[Orders]
(
	[Employee ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$ID] ON [dbo].[Orders]
(
	[Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$New_CustomerOnOrders]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$New_CustomerOnOrders] ON [dbo].[Orders]
(
	[Customer ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$New_EmployeesOnOrders]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$New_EmployeesOnOrders] ON [dbo].[Orders]
(
	[Employee ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$New_OrderStatus]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$New_OrderStatus] ON [dbo].[Orders]
(
	[Status ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$New_ShipperOnOrder]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$New_ShipperOnOrder] ON [dbo].[Orders]
(
	[Shipper ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$New_TaxStatusOnOrders]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$New_TaxStatusOnOrders] ON [dbo].[Orders]
(
	[Tax Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$OrderStatus]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$OrderStatus] ON [dbo].[Orders]
(
	[Status ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$ShipperID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$ShipperID] ON [dbo].[Orders]
(
	[Shipper ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$ShipperOnOrder]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$ShipperOnOrder] ON [dbo].[Orders]
(
	[Shipper ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$Status ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$Status ID] ON [dbo].[Orders]
(
	[Status ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Orders$TaxStatusOnOrders]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$TaxStatusOnOrders] ON [dbo].[Orders]
(
	[Tax Status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Orders$ZIP/Postal Code]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Orders$ZIP/Postal Code] ON [dbo].[Orders]
(
	[Ship ZIP/Postal Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Products$Product Code]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Products$Product Code] ON [dbo].[Products]
(
	[Product Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Order Details$ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Order Details$ID] ON [dbo].[Purchase Order Details]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Order Details$Inventory ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Order Details$Inventory ID] ON [dbo].[Purchase Order Details]
(
	[Inventory ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Order Details$InventoryTransactionsOnPurchaseOrders]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Order Details$InventoryTransactionsOnPurchaseOrders] ON [dbo].[Purchase Order Details]
(
	[Inventory ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Order Details$New_InventoryTransactionsOnPurchaseOrders]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Order Details$New_InventoryTransactionsOnPurchaseOrders] ON [dbo].[Purchase Order Details]
(
	[Inventory ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Order Details$New_ProductOnPurchaseOrderDetails]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Order Details$New_ProductOnPurchaseOrderDetails] ON [dbo].[Purchase Order Details]
(
	[Product ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Order Details$New_PurchaseOrderDeatilsOnPurchaseOrder]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Order Details$New_PurchaseOrderDeatilsOnPurchaseOrder] ON [dbo].[Purchase Order Details]
(
	[Purchase Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Order Details$OrderID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Order Details$OrderID] ON [dbo].[Purchase Order Details]
(
	[Purchase Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Order Details$ProductID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Order Details$ProductID] ON [dbo].[Purchase Order Details]
(
	[Product ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Order Details$ProductOnPurchaseOrderDetails]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Order Details$ProductOnPurchaseOrderDetails] ON [dbo].[Purchase Order Details]
(
	[Product ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Order Details$PurchaseOrderDeatilsOnPurchaseOrder]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Order Details$PurchaseOrderDeatilsOnPurchaseOrder] ON [dbo].[Purchase Order Details]
(
	[Purchase Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Orders$EmployeesOnPurchaseOrder]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Orders$EmployeesOnPurchaseOrder] ON [dbo].[Purchase Orders]
(
	[Created By] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Orders$ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Purchase Orders$ID] ON [dbo].[Purchase Orders]
(
	[Purchase Order ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Orders$New_EmployeesOnPurchaseOrder]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Orders$New_EmployeesOnPurchaseOrder] ON [dbo].[Purchase Orders]
(
	[Created By] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Orders$New_PurchaseOrderStatusLookup]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Orders$New_PurchaseOrderStatusLookup] ON [dbo].[Purchase Orders]
(
	[Status ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Orders$New_SuppliersOnPurchaseOrder]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Orders$New_SuppliersOnPurchaseOrder] ON [dbo].[Purchase Orders]
(
	[Supplier ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Orders$PurchaseOrderStatusLookup]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Orders$PurchaseOrderStatusLookup] ON [dbo].[Purchase Orders]
(
	[Status ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Orders$Status ID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Orders$Status ID] ON [dbo].[Purchase Orders]
(
	[Status ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Orders$SupplierID]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Orders$SupplierID] ON [dbo].[Purchase Orders]
(
	[Supplier ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [Purchase Orders$SuppliersOnPurchaseOrder]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Purchase Orders$SuppliersOnPurchaseOrder] ON [dbo].[Purchase Orders]
(
	[Supplier ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Shippers$City]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Shippers$City] ON [dbo].[Shippers]
(
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Shippers$Company]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Shippers$Company] ON [dbo].[Shippers]
(
	[Company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Shippers$First Name]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Shippers$First Name] ON [dbo].[Shippers]
(
	[First Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Shippers$Last Name]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Shippers$Last Name] ON [dbo].[Shippers]
(
	[Last Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Shippers$Postal Code]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Shippers$Postal Code] ON [dbo].[Shippers]
(
	[ZIP/Postal Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Shippers$State/Province]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Shippers$State/Province] ON [dbo].[Shippers]
(
	[State/Province] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Suppliers$City]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Suppliers$City] ON [dbo].[Suppliers]
(
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Suppliers$Company]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Suppliers$Company] ON [dbo].[Suppliers]
(
	[Company] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Suppliers$First Name]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Suppliers$First Name] ON [dbo].[Suppliers]
(
	[First Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Suppliers$Last Name]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Suppliers$Last Name] ON [dbo].[Suppliers]
(
	[Last Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Suppliers$Postal Code]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Suppliers$Postal Code] ON [dbo].[Suppliers]
(
	[ZIP/Postal Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Suppliers$State/Province]    Script Date: 8/09/2017 6:48:52 PM ******/
CREATE NONCLUSTERED INDEX [Suppliers$State/Province] ON [dbo].[Suppliers]
(
	[State/Province] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inventory Transactions] ADD  DEFAULT (getdate()) FOR [Transaction Created Date]
GO
ALTER TABLE [dbo].[Inventory Transactions] ADD  DEFAULT (getdate()) FOR [Transaction Modified Date]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT (getdate()) FOR [Invoice Date]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ((0)) FOR [Tax]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ((0)) FOR [Shipping]
GO
ALTER TABLE [dbo].[Invoices] ADD  DEFAULT ((0)) FOR [Amount Due]
GO
ALTER TABLE [dbo].[Order Details] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Order Details] ADD  DEFAULT ((0)) FOR [Unit Price]
GO
ALTER TABLE [dbo].[Order Details] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT (getdate()) FOR [Order Date]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Shipping Fee]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Taxes]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Tax Rate]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [Status ID]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Standard Cost]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [List Price]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Discontinued]
GO
ALTER TABLE [dbo].[Purchase Order Details] ADD  DEFAULT ((0)) FOR [Posted To Inventory]
GO
ALTER TABLE [dbo].[Purchase Orders] ADD  DEFAULT (getdate()) FOR [Creation Date]
GO
ALTER TABLE [dbo].[Purchase Orders] ADD  DEFAULT ((0)) FOR [Status ID]
GO
ALTER TABLE [dbo].[Purchase Orders] ADD  DEFAULT ((0)) FOR [Shipping Fee]
GO
ALTER TABLE [dbo].[Purchase Orders] ADD  DEFAULT ((0)) FOR [Taxes]
GO
ALTER TABLE [dbo].[Purchase Orders] ADD  DEFAULT ((0)) FOR [Payment Amount]
GO
ALTER TABLE [dbo].[Sales Reports] ADD  DEFAULT ((0)) FOR [Default]
GO
ALTER TABLE [dbo].[Employee Privileges]  WITH NOCHECK ADD  CONSTRAINT [Employee Privileges$New_EmployeePriviligesforEmployees] FOREIGN KEY([Employee ID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Employee Privileges] CHECK CONSTRAINT [Employee Privileges$New_EmployeePriviligesforEmployees]
GO
ALTER TABLE [dbo].[Employee Privileges]  WITH NOCHECK ADD  CONSTRAINT [Employee Privileges$New_EmployeePriviligesLookup] FOREIGN KEY([Privilege ID])
REFERENCES [dbo].[Privileges] ([Privilege ID])
GO
ALTER TABLE [dbo].[Employee Privileges] CHECK CONSTRAINT [Employee Privileges$New_EmployeePriviligesLookup]
GO
ALTER TABLE [dbo].[Inventory Transactions]  WITH NOCHECK ADD  CONSTRAINT [Inventory Transactions$New_OrdersOnInventoryTransactions] FOREIGN KEY([Customer Order ID])
REFERENCES [dbo].[Orders] ([Order ID])
GO
ALTER TABLE [dbo].[Inventory Transactions] CHECK CONSTRAINT [Inventory Transactions$New_OrdersOnInventoryTransactions]
GO
ALTER TABLE [dbo].[Inventory Transactions]  WITH NOCHECK ADD  CONSTRAINT [Inventory Transactions$New_ProductOnInventoryTransaction] FOREIGN KEY([Product ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Inventory Transactions] CHECK CONSTRAINT [Inventory Transactions$New_ProductOnInventoryTransaction]
GO
ALTER TABLE [dbo].[Inventory Transactions]  WITH NOCHECK ADD  CONSTRAINT [Inventory Transactions$New_PuchaseOrdersonInventoryTransactions] FOREIGN KEY([Purchase Order ID])
REFERENCES [dbo].[Purchase Orders] ([Purchase Order ID])
GO
ALTER TABLE [dbo].[Inventory Transactions] CHECK CONSTRAINT [Inventory Transactions$New_PuchaseOrdersonInventoryTransactions]
GO
ALTER TABLE [dbo].[Inventory Transactions]  WITH NOCHECK ADD  CONSTRAINT [Inventory Transactions$New_TransactionTypesOnInventoryTransactiosn] FOREIGN KEY([Transaction Type])
REFERENCES [dbo].[Inventory Transaction Types] ([ID])
GO
ALTER TABLE [dbo].[Inventory Transactions] CHECK CONSTRAINT [Inventory Transactions$New_TransactionTypesOnInventoryTransactiosn]
GO
ALTER TABLE [dbo].[Invoices]  WITH NOCHECK ADD  CONSTRAINT [Invoices$New_OrderInvoice] FOREIGN KEY([Order ID])
REFERENCES [dbo].[Orders] ([Order ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [Invoices$New_OrderInvoice]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [Order Details$New_OrderDetails] FOREIGN KEY([Order ID])
REFERENCES [dbo].[Orders] ([Order ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [Order Details$New_OrderDetails]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [Order Details$New_OrderStatusLookup] FOREIGN KEY([Status ID])
REFERENCES [dbo].[Order Details Status] ([Status ID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [Order Details$New_OrderStatusLookup]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [Order Details$New_ProductsOnOrders] FOREIGN KEY([Product ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [Order Details$New_ProductsOnOrders]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [Orders$New_CustomerOnOrders] FOREIGN KEY([Customer ID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [Orders$New_CustomerOnOrders]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [Orders$New_EmployeesOnOrders] FOREIGN KEY([Employee ID])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [Orders$New_EmployeesOnOrders]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [Orders$New_OrderStatus] FOREIGN KEY([Status ID])
REFERENCES [dbo].[Orders Status] ([Status ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [Orders$New_OrderStatus]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [Orders$New_ShipperOnOrder] FOREIGN KEY([Shipper ID])
REFERENCES [dbo].[Shippers] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [Orders$New_ShipperOnOrder]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [Orders$New_TaxStatusOnOrders] FOREIGN KEY([Tax Status])
REFERENCES [dbo].[Orders Tax Status] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [Orders$New_TaxStatusOnOrders]
GO
ALTER TABLE [dbo].[Purchase Order Details]  WITH NOCHECK ADD  CONSTRAINT [Purchase Order Details$New_InventoryTransactionsOnPurchaseOrders] FOREIGN KEY([Inventory ID])
REFERENCES [dbo].[Inventory Transactions] ([Transaction ID])
GO
ALTER TABLE [dbo].[Purchase Order Details] CHECK CONSTRAINT [Purchase Order Details$New_InventoryTransactionsOnPurchaseOrders]
GO
ALTER TABLE [dbo].[Purchase Order Details]  WITH NOCHECK ADD  CONSTRAINT [Purchase Order Details$New_ProductOnPurchaseOrderDetails] FOREIGN KEY([Product ID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[Purchase Order Details] CHECK CONSTRAINT [Purchase Order Details$New_ProductOnPurchaseOrderDetails]
GO
ALTER TABLE [dbo].[Purchase Order Details]  WITH NOCHECK ADD  CONSTRAINT [Purchase Order Details$New_PurchaseOrderDeatilsOnPurchaseOrder] FOREIGN KEY([Purchase Order ID])
REFERENCES [dbo].[Purchase Orders] ([Purchase Order ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Purchase Order Details] CHECK CONSTRAINT [Purchase Order Details$New_PurchaseOrderDeatilsOnPurchaseOrder]
GO
ALTER TABLE [dbo].[Purchase Orders]  WITH NOCHECK ADD  CONSTRAINT [Purchase Orders$New_EmployeesOnPurchaseOrder] FOREIGN KEY([Created By])
REFERENCES [dbo].[Employees] ([ID])
GO
ALTER TABLE [dbo].[Purchase Orders] CHECK CONSTRAINT [Purchase Orders$New_EmployeesOnPurchaseOrder]
GO
ALTER TABLE [dbo].[Purchase Orders]  WITH NOCHECK ADD  CONSTRAINT [Purchase Orders$New_PurchaseOrderStatusLookup] FOREIGN KEY([Status ID])
REFERENCES [dbo].[Purchase Order Status] ([Status ID])
GO
ALTER TABLE [dbo].[Purchase Orders] CHECK CONSTRAINT [Purchase Orders$New_PurchaseOrderStatusLookup]
GO
ALTER TABLE [dbo].[Purchase Orders]  WITH NOCHECK ADD  CONSTRAINT [Purchase Orders$New_SuppliersOnPurchaseOrder] FOREIGN KEY([Supplier ID])
REFERENCES [dbo].[Suppliers] ([ID])
GO
ALTER TABLE [dbo].[Purchase Orders] CHECK CONSTRAINT [Purchase Orders$New_SuppliersOnPurchaseOrder]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$Address$disallow_zero_length] CHECK  ((len([Address])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$Address$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$Business Phone$disallow_zero_length] CHECK  ((len([Business Phone])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$Business Phone$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$City$disallow_zero_length] CHECK  ((len([City])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$City$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$Company$disallow_zero_length] CHECK  ((len([Company])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$Company$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$Country/Region$disallow_zero_length] CHECK  ((len([Country/Region])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$Country/Region$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$E-mail Address$disallow_zero_length] CHECK  ((len([E-mail Address])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$E-mail Address$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$Fax Number$disallow_zero_length] CHECK  ((len([Fax Number])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$Fax Number$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$First Name$disallow_zero_length] CHECK  ((len([First Name])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$First Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$Home Phone$disallow_zero_length] CHECK  ((len([Home Phone])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$Home Phone$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$Job Title$disallow_zero_length] CHECK  ((len([Job Title])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$Job Title$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$Last Name$disallow_zero_length] CHECK  ((len([Last Name])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$Last Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$Mobile Phone$disallow_zero_length] CHECK  ((len([Mobile Phone])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$Mobile Phone$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$Notes$disallow_zero_length] CHECK  ((len([Notes])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$Notes$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$State/Province$disallow_zero_length] CHECK  ((len([State/Province])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$State/Province$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$Web Page$disallow_zero_length] CHECK  ((len([Web Page])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$Web Page$disallow_zero_length]
GO
ALTER TABLE [dbo].[Customers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Customers$ZIP/Postal Code$disallow_zero_length] CHECK  ((len([ZIP/Postal Code])>(0)))
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [SSMA_CC$Customers$ZIP/Postal Code$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$Address$disallow_zero_length] CHECK  ((len([Address])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$Address$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$Business Phone$disallow_zero_length] CHECK  ((len([Business Phone])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$Business Phone$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$City$disallow_zero_length] CHECK  ((len([City])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$City$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$Company$disallow_zero_length] CHECK  ((len([Company])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$Company$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$Country/Region$disallow_zero_length] CHECK  ((len([Country/Region])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$Country/Region$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$E-mail Address$disallow_zero_length] CHECK  ((len([E-mail Address])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$E-mail Address$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$Fax Number$disallow_zero_length] CHECK  ((len([Fax Number])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$Fax Number$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$First Name$disallow_zero_length] CHECK  ((len([First Name])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$First Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$Home Phone$disallow_zero_length] CHECK  ((len([Home Phone])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$Home Phone$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$Job Title$disallow_zero_length] CHECK  ((len([Job Title])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$Job Title$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$Last Name$disallow_zero_length] CHECK  ((len([Last Name])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$Last Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$Mobile Phone$disallow_zero_length] CHECK  ((len([Mobile Phone])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$Mobile Phone$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$Notes$disallow_zero_length] CHECK  ((len([Notes])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$Notes$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$State/Province$disallow_zero_length] CHECK  ((len([State/Province])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$State/Province$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$Web Page$disallow_zero_length] CHECK  ((len([Web Page])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$Web Page$disallow_zero_length]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Employees$ZIP/Postal Code$disallow_zero_length] CHECK  ((len([ZIP/Postal Code])>(0)))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [SSMA_CC$Employees$ZIP/Postal Code$disallow_zero_length]
GO
ALTER TABLE [dbo].[Inventory Transaction Types]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Inventory Transaction Types$Type Name$disallow_zero_length] CHECK  ((len([Type Name])>(0)))
GO
ALTER TABLE [dbo].[Inventory Transaction Types] CHECK CONSTRAINT [SSMA_CC$Inventory Transaction Types$Type Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Inventory Transactions]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Inventory Transactions$Comments$disallow_zero_length] CHECK  ((len([Comments])>(0)))
GO
ALTER TABLE [dbo].[Inventory Transactions] CHECK CONSTRAINT [SSMA_CC$Inventory Transactions$Comments$disallow_zero_length]
GO
ALTER TABLE [dbo].[Inventory Transactions]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Inventory Transactions$Transaction Created Date$validation_rule] CHECK  (([Transaction Created Date]>='1/1/1900'))
GO
ALTER TABLE [dbo].[Inventory Transactions] CHECK CONSTRAINT [SSMA_CC$Inventory Transactions$Transaction Created Date$validation_rule]
GO
ALTER TABLE [dbo].[Inventory Transactions]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Inventory Transactions$Transaction Modified Date$validation_rule] CHECK  (([Transaction Modified Date]>='1/1/1900'))
GO
ALTER TABLE [dbo].[Inventory Transactions] CHECK CONSTRAINT [SSMA_CC$Inventory Transactions$Transaction Modified Date$validation_rule]
GO
ALTER TABLE [dbo].[Invoices]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Invoices$Due Date$validation_rule] CHECK  (([Due Date]>='1/1/1900'))
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [SSMA_CC$Invoices$Due Date$validation_rule]
GO
ALTER TABLE [dbo].[Invoices]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Invoices$Invoice Date$validation_rule] CHECK  (([Invoice Date]>='1/1/1900'))
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [SSMA_CC$Invoices$Invoice Date$validation_rule]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Order Details$Date Allocated$validation_rule] CHECK  (([Date Allocated]>='1/1/1900'))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [SSMA_CC$Order Details$Date Allocated$validation_rule]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Order Details$Discount$validation_rule] CHECK  (([Discount]<=(1) AND [Discount]>=(0)))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [SSMA_CC$Order Details$Discount$validation_rule]
GO
ALTER TABLE [dbo].[Order Details Status]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Order Details Status$Status Name$disallow_zero_length] CHECK  ((len([Status Name])>(0)))
GO
ALTER TABLE [dbo].[Order Details Status] CHECK CONSTRAINT [SSMA_CC$Order Details Status$Status Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Orders$Notes$disallow_zero_length] CHECK  ((len([Notes])>(0)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [SSMA_CC$Orders$Notes$disallow_zero_length]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Orders$Order Date$validation_rule] CHECK  (([Order Date]>='1/1/1900'))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [SSMA_CC$Orders$Order Date$validation_rule]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Orders$Paid Date$validation_rule] CHECK  (([Paid Date]>='1/1/1900'))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [SSMA_CC$Orders$Paid Date$validation_rule]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Orders$Payment Type$disallow_zero_length] CHECK  ((len([Payment Type])>(0)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [SSMA_CC$Orders$Payment Type$disallow_zero_length]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Orders$Ship Address$disallow_zero_length] CHECK  ((len([Ship Address])>(0)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [SSMA_CC$Orders$Ship Address$disallow_zero_length]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Orders$Ship City$disallow_zero_length] CHECK  ((len([Ship City])>(0)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [SSMA_CC$Orders$Ship City$disallow_zero_length]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Orders$Ship Country/Region$disallow_zero_length] CHECK  ((len([Ship Country/Region])>(0)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [SSMA_CC$Orders$Ship Country/Region$disallow_zero_length]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Orders$Ship Name$disallow_zero_length] CHECK  ((len([Ship Name])>(0)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [SSMA_CC$Orders$Ship Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Orders$Ship State/Province$disallow_zero_length] CHECK  ((len([Ship State/Province])>(0)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [SSMA_CC$Orders$Ship State/Province$disallow_zero_length]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Orders$Ship ZIP/Postal Code$disallow_zero_length] CHECK  ((len([Ship ZIP/Postal Code])>(0)))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [SSMA_CC$Orders$Ship ZIP/Postal Code$disallow_zero_length]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Orders$Shipped Date$validation_rule] CHECK  (([Shipped Date]>='1/1/1900'))
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [SSMA_CC$Orders$Shipped Date$validation_rule]
GO
ALTER TABLE [dbo].[Orders Status]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Orders Status$Status Name$disallow_zero_length] CHECK  ((len([Status Name])>(0)))
GO
ALTER TABLE [dbo].[Orders Status] CHECK CONSTRAINT [SSMA_CC$Orders Status$Status Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Orders Tax Status]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Orders Tax Status$Tax Status Name$disallow_zero_length] CHECK  ((len([Tax Status Name])>(0)))
GO
ALTER TABLE [dbo].[Orders Tax Status] CHECK CONSTRAINT [SSMA_CC$Orders Tax Status$Tax Status Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Privileges]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Privileges$Privilege Name$disallow_zero_length] CHECK  ((len([Privilege Name])>(0)))
GO
ALTER TABLE [dbo].[Privileges] CHECK CONSTRAINT [SSMA_CC$Privileges$Privilege Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Products$Category$disallow_zero_length] CHECK  ((len([Category])>(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [SSMA_CC$Products$Category$disallow_zero_length]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Products$Description$disallow_zero_length] CHECK  ((len([Description])>(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [SSMA_CC$Products$Description$disallow_zero_length]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Products$Product Code$disallow_zero_length] CHECK  ((len([Product Code])>(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [SSMA_CC$Products$Product Code$disallow_zero_length]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Products$Product Name$disallow_zero_length] CHECK  ((len([Product Name])>(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [SSMA_CC$Products$Product Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Products$Quantity Per Unit$disallow_zero_length] CHECK  ((len([Quantity Per Unit])>(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [SSMA_CC$Products$Quantity Per Unit$disallow_zero_length]
GO
ALTER TABLE [dbo].[Purchase Order Details]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Purchase Order Details$Date Received$validation_rule] CHECK  (([Date Received]>='1/1/1900'))
GO
ALTER TABLE [dbo].[Purchase Order Details] CHECK CONSTRAINT [SSMA_CC$Purchase Order Details$Date Received$validation_rule]
GO
ALTER TABLE [dbo].[Purchase Order Status]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Purchase Order Status$Status$disallow_zero_length] CHECK  ((len([Status])>(0)))
GO
ALTER TABLE [dbo].[Purchase Order Status] CHECK CONSTRAINT [SSMA_CC$Purchase Order Status$Status$disallow_zero_length]
GO
ALTER TABLE [dbo].[Purchase Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Purchase Orders$Approved Date$validation_rule] CHECK  (([Approved Date]>='1/1/1900'))
GO
ALTER TABLE [dbo].[Purchase Orders] CHECK CONSTRAINT [SSMA_CC$Purchase Orders$Approved Date$validation_rule]
GO
ALTER TABLE [dbo].[Purchase Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Purchase Orders$Creation Date$validation_rule] CHECK  (([Creation Date]>='1/1/1900'))
GO
ALTER TABLE [dbo].[Purchase Orders] CHECK CONSTRAINT [SSMA_CC$Purchase Orders$Creation Date$validation_rule]
GO
ALTER TABLE [dbo].[Purchase Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Purchase Orders$Expected Date$validation_rule] CHECK  (([Expected Date]>='1/1/1900'))
GO
ALTER TABLE [dbo].[Purchase Orders] CHECK CONSTRAINT [SSMA_CC$Purchase Orders$Expected Date$validation_rule]
GO
ALTER TABLE [dbo].[Purchase Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Purchase Orders$Notes$disallow_zero_length] CHECK  ((len([Notes])>(0)))
GO
ALTER TABLE [dbo].[Purchase Orders] CHECK CONSTRAINT [SSMA_CC$Purchase Orders$Notes$disallow_zero_length]
GO
ALTER TABLE [dbo].[Purchase Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Purchase Orders$Payment Date$validation_rule] CHECK  (([Payment Date]>='1/1/1900'))
GO
ALTER TABLE [dbo].[Purchase Orders] CHECK CONSTRAINT [SSMA_CC$Purchase Orders$Payment Date$validation_rule]
GO
ALTER TABLE [dbo].[Purchase Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Purchase Orders$Payment Method$disallow_zero_length] CHECK  ((len([Payment Method])>(0)))
GO
ALTER TABLE [dbo].[Purchase Orders] CHECK CONSTRAINT [SSMA_CC$Purchase Orders$Payment Method$disallow_zero_length]
GO
ALTER TABLE [dbo].[Purchase Orders]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Purchase Orders$Submitted Date$validation_rule] CHECK  (([Submitted Date]>='1/1/1900'))
GO
ALTER TABLE [dbo].[Purchase Orders] CHECK CONSTRAINT [SSMA_CC$Purchase Orders$Submitted Date$validation_rule]
GO
ALTER TABLE [dbo].[Sales Reports]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Sales Reports$Display$disallow_zero_length] CHECK  ((len([Display])>(0)))
GO
ALTER TABLE [dbo].[Sales Reports] CHECK CONSTRAINT [SSMA_CC$Sales Reports$Display$disallow_zero_length]
GO
ALTER TABLE [dbo].[Sales Reports]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Sales Reports$Filter Row Source$disallow_zero_length] CHECK  ((len([Filter Row Source])>(0)))
GO
ALTER TABLE [dbo].[Sales Reports] CHECK CONSTRAINT [SSMA_CC$Sales Reports$Filter Row Source$disallow_zero_length]
GO
ALTER TABLE [dbo].[Sales Reports]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Sales Reports$Group By$disallow_zero_length] CHECK  ((len([Group By])>(0)))
GO
ALTER TABLE [dbo].[Sales Reports] CHECK CONSTRAINT [SSMA_CC$Sales Reports$Group By$disallow_zero_length]
GO
ALTER TABLE [dbo].[Sales Reports]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Sales Reports$Title$disallow_zero_length] CHECK  ((len([Title])>(0)))
GO
ALTER TABLE [dbo].[Sales Reports] CHECK CONSTRAINT [SSMA_CC$Sales Reports$Title$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$Address$disallow_zero_length] CHECK  ((len([Address])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$Address$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$Business Phone$disallow_zero_length] CHECK  ((len([Business Phone])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$Business Phone$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$City$disallow_zero_length] CHECK  ((len([City])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$City$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$Company$disallow_zero_length] CHECK  ((len([Company])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$Company$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$Country/Region$disallow_zero_length] CHECK  ((len([Country/Region])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$Country/Region$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$E-mail Address$disallow_zero_length] CHECK  ((len([E-mail Address])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$E-mail Address$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$Fax Number$disallow_zero_length] CHECK  ((len([Fax Number])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$Fax Number$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$First Name$disallow_zero_length] CHECK  ((len([First Name])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$First Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$Home Phone$disallow_zero_length] CHECK  ((len([Home Phone])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$Home Phone$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$Job Title$disallow_zero_length] CHECK  ((len([Job Title])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$Job Title$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$Last Name$disallow_zero_length] CHECK  ((len([Last Name])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$Last Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$Mobile Phone$disallow_zero_length] CHECK  ((len([Mobile Phone])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$Mobile Phone$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$Notes$disallow_zero_length] CHECK  ((len([Notes])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$Notes$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$State/Province$disallow_zero_length] CHECK  ((len([State/Province])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$State/Province$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$Web Page$disallow_zero_length] CHECK  ((len([Web Page])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$Web Page$disallow_zero_length]
GO
ALTER TABLE [dbo].[Shippers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Shippers$ZIP/Postal Code$disallow_zero_length] CHECK  ((len([ZIP/Postal Code])>(0)))
GO
ALTER TABLE [dbo].[Shippers] CHECK CONSTRAINT [SSMA_CC$Shippers$ZIP/Postal Code$disallow_zero_length]
GO
ALTER TABLE [dbo].[Strings]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Strings$String Data$disallow_zero_length] CHECK  ((len([String Data])>(0)))
GO
ALTER TABLE [dbo].[Strings] CHECK CONSTRAINT [SSMA_CC$Strings$String Data$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$Address$disallow_zero_length] CHECK  ((len([Address])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$Address$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$Business Phone$disallow_zero_length] CHECK  ((len([Business Phone])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$Business Phone$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$City$disallow_zero_length] CHECK  ((len([City])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$City$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$Company$disallow_zero_length] CHECK  ((len([Company])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$Company$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$Country/Region$disallow_zero_length] CHECK  ((len([Country/Region])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$Country/Region$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$E-mail Address$disallow_zero_length] CHECK  ((len([E-mail Address])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$E-mail Address$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$Fax Number$disallow_zero_length] CHECK  ((len([Fax Number])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$Fax Number$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$First Name$disallow_zero_length] CHECK  ((len([First Name])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$First Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$Home Phone$disallow_zero_length] CHECK  ((len([Home Phone])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$Home Phone$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$Job Title$disallow_zero_length] CHECK  ((len([Job Title])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$Job Title$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$Last Name$disallow_zero_length] CHECK  ((len([Last Name])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$Last Name$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$Mobile Phone$disallow_zero_length] CHECK  ((len([Mobile Phone])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$Mobile Phone$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$Notes$disallow_zero_length] CHECK  ((len([Notes])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$Notes$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$State/Province$disallow_zero_length] CHECK  ((len([State/Province])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$State/Province$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$Web Page$disallow_zero_length] CHECK  ((len([Web Page])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$Web Page$disallow_zero_length]
GO
ALTER TABLE [dbo].[Suppliers]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Suppliers$ZIP/Postal Code$disallow_zero_length] CHECK  ((len([ZIP/Postal Code])>(0)))
GO
ALTER TABLE [dbo].[Suppliers] CHECK CONSTRAINT [SSMA_CC$Suppliers$ZIP/Postal Code$disallow_zero_length]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Company]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Last Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Last Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[First Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'First Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[E-mail Address]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'E-mail Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Job Title]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Job Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Business Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Business Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Home Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Home Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Mobile Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Mobile Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Fax Number]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Fax Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Address]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[City]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[State/Province]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'State/Province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[ZIP/Postal Code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'ZIP/Postal Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Country/Region]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Country/Region'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Web Page]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Web Page'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Notes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Attachments]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'COLUMN',@level2name=N'Attachments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'CONSTRAINT',@level2name=N'Customers$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[City]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'INDEX',@level2name=N'Customers$City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Company]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'INDEX',@level2name=N'Customers$Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[First Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'INDEX',@level2name=N'Customers$First Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Last Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'INDEX',@level2name=N'Customers$Last Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[Postal Code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'INDEX',@level2name=N'Customers$Postal Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers].[State/Province]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers', @level2type=N'INDEX',@level2name=N'Customers$State/Province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Customers]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employee Privileges].[Employee ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee Privileges', @level2type=N'COLUMN',@level2name=N'Employee ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employee Privileges].[Privilege ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee Privileges', @level2type=N'COLUMN',@level2name=N'Privilege ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employee Privileges].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee Privileges', @level2type=N'CONSTRAINT',@level2name=N'Employee Privileges$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employee Privileges].[EmployeePriviligesforEmployees]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee Privileges', @level2type=N'INDEX',@level2name=N'Employee Privileges$EmployeePriviligesforEmployees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employee Privileges].[EmployeePriviligesLookup]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee Privileges', @level2type=N'INDEX',@level2name=N'Employee Privileges$EmployeePriviligesLookup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employee Privileges].[New_EmployeePriviligesforEmployees]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee Privileges', @level2type=N'INDEX',@level2name=N'Employee Privileges$New_EmployeePriviligesforEmployees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employee Privileges].[New_EmployeePriviligesLookup]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee Privileges', @level2type=N'INDEX',@level2name=N'Employee Privileges$New_EmployeePriviligesLookup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employee Privileges].[Privilege ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee Privileges', @level2type=N'INDEX',@level2name=N'Employee Privileges$Privilege ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employee Privileges]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee Privileges'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employee Privileges].[New_EmployeePriviligesforEmployees]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee Privileges', @level2type=N'CONSTRAINT',@level2name=N'Employee Privileges$New_EmployeePriviligesforEmployees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employee Privileges].[New_EmployeePriviligesLookup]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee Privileges', @level2type=N'CONSTRAINT',@level2name=N'Employee Privileges$New_EmployeePriviligesLookup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Company]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Last Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'Last Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[First Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'First Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[E-mail Address]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'E-mail Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Job Title]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'Job Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Business Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'Business Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Home Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'Home Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Mobile Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'Mobile Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Fax Number]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'Fax Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Address]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[City]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[State/Province]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'State/Province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[ZIP/Postal Code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'ZIP/Postal Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Country/Region]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'Country/Region'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Web Page]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'Web Page'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Notes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Attachments]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'COLUMN',@level2name=N'Attachments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'CONSTRAINT',@level2name=N'Employees$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[City]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'INDEX',@level2name=N'Employees$City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Company]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'INDEX',@level2name=N'Employees$Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[First Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'INDEX',@level2name=N'Employees$First Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Last Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'INDEX',@level2name=N'Employees$Last Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[Postal Code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'INDEX',@level2name=N'Employees$Postal Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees].[State/Province]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees', @level2type=N'INDEX',@level2name=N'Employees$State/Province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Employees]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employees'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transaction Types].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transaction Types', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transaction Types].[Type Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transaction Types', @level2type=N'COLUMN',@level2name=N'Type Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transaction Types].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transaction Types', @level2type=N'CONSTRAINT',@level2name=N'Inventory Transaction Types$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transaction Types]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transaction Types'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[Transaction ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'COLUMN',@level2name=N'Transaction ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[Transaction Type]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'COLUMN',@level2name=N'Transaction Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[Transaction Created Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'COLUMN',@level2name=N'Transaction Created Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[Transaction Modified Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'COLUMN',@level2name=N'Transaction Modified Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[Product ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'COLUMN',@level2name=N'Product ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[Quantity]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[Purchase Order ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'COLUMN',@level2name=N'Purchase Order ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[Customer Order ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'COLUMN',@level2name=N'Customer Order ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[Comments]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'COLUMN',@level2name=N'Comments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'CONSTRAINT',@level2name=N'Inventory Transactions$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[Customer Order ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'INDEX',@level2name=N'Inventory Transactions$Customer Order ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[New_OrdersOnInventoryTransactions]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'INDEX',@level2name=N'Inventory Transactions$New_OrdersOnInventoryTransactions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[New_ProductOnInventoryTransaction]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'INDEX',@level2name=N'Inventory Transactions$New_ProductOnInventoryTransaction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[New_PuchaseOrdersonInventoryTransactions]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'INDEX',@level2name=N'Inventory Transactions$New_PuchaseOrdersonInventoryTransactions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[New_TransactionTypesOnInventoryTransactiosn]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'INDEX',@level2name=N'Inventory Transactions$New_TransactionTypesOnInventoryTransactiosn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[OrdersOnInventoryTransactions]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'INDEX',@level2name=N'Inventory Transactions$OrdersOnInventoryTransactions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[Product ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'INDEX',@level2name=N'Inventory Transactions$Product ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[ProductOnInventoryTransaction]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'INDEX',@level2name=N'Inventory Transactions$ProductOnInventoryTransaction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[PuchaseOrdersonInventoryTransactions]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'INDEX',@level2name=N'Inventory Transactions$PuchaseOrdersonInventoryTransactions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[Purchase Order ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'INDEX',@level2name=N'Inventory Transactions$Purchase Order ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[TransactionTypesOnInventoryTransactiosn]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'INDEX',@level2name=N'Inventory Transactions$TransactionTypesOnInventoryTransactiosn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[New_OrdersOnInventoryTransactions]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'CONSTRAINT',@level2name=N'Inventory Transactions$New_OrdersOnInventoryTransactions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[New_ProductOnInventoryTransaction]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'CONSTRAINT',@level2name=N'Inventory Transactions$New_ProductOnInventoryTransaction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[New_PuchaseOrdersonInventoryTransactions]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'CONSTRAINT',@level2name=N'Inventory Transactions$New_PuchaseOrdersonInventoryTransactions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Inventory Transactions].[New_TransactionTypesOnInventoryTransactiosn]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Inventory Transactions', @level2type=N'CONSTRAINT',@level2name=N'Inventory Transactions$New_TransactionTypesOnInventoryTransactiosn'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Invoices].[Invoice ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'Invoice ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Invoices].[Order ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'Order ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Invoices].[Invoice Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'Invoice Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Invoices].[Due Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'Due Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Invoices].[Tax]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'Tax'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Invoices].[Shipping]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'Shipping'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Invoices].[Amount Due]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'COLUMN',@level2name=N'Amount Due'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Invoices].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'CONSTRAINT',@level2name=N'Invoices$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Invoices].[New_OrderInvoice]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'INDEX',@level2name=N'Invoices$New_OrderInvoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Invoices].[Order ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'INDEX',@level2name=N'Invoices$Order ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Invoices].[OrderInvoice]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'INDEX',@level2name=N'Invoices$OrderInvoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Invoices]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Invoices].[New_OrderInvoice]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Invoices', @level2type=N'CONSTRAINT',@level2name=N'Invoices$New_OrderInvoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[Order ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'COLUMN',@level2name=N'Order ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[Product ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'COLUMN',@level2name=N'Product ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[Quantity]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[Unit Price]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'COLUMN',@level2name=N'Unit Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[Discount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[Status ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'COLUMN',@level2name=N'Status ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[Date Allocated]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'COLUMN',@level2name=N'Date Allocated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[Purchase Order ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'COLUMN',@level2name=N'Purchase Order ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[Inventory ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'COLUMN',@level2name=N'Inventory ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'CONSTRAINT',@level2name=N'Order Details$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'INDEX',@level2name=N'Order Details$ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[Inventory ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'INDEX',@level2name=N'Order Details$Inventory ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[New_OrderDetails]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'INDEX',@level2name=N'Order Details$New_OrderDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[New_OrderStatusLookup]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'INDEX',@level2name=N'Order Details$New_OrderStatusLookup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[New_ProductsOnOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'INDEX',@level2name=N'Order Details$New_ProductsOnOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[OrderDetails]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'INDEX',@level2name=N'Order Details$OrderDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[OrderID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'INDEX',@level2name=N'Order Details$OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[OrderStatusLookup]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'INDEX',@level2name=N'Order Details$OrderStatusLookup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[ProductID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'INDEX',@level2name=N'Order Details$ProductID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[ProductsOnOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'INDEX',@level2name=N'Order Details$ProductsOnOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[Purchase Order ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'INDEX',@level2name=N'Order Details$Purchase Order ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[Status ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'INDEX',@level2name=N'Order Details$Status ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[New_OrderDetails]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'CONSTRAINT',@level2name=N'Order Details$New_OrderDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[New_OrderStatusLookup]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'CONSTRAINT',@level2name=N'Order Details$New_OrderStatusLookup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details].[New_ProductsOnOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details', @level2type=N'CONSTRAINT',@level2name=N'Order Details$New_ProductsOnOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details Status].[Status ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details Status', @level2type=N'COLUMN',@level2name=N'Status ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details Status].[Status Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details Status', @level2type=N'COLUMN',@level2name=N'Status Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details Status].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details Status', @level2type=N'CONSTRAINT',@level2name=N'Order Details Status$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Order Details Status]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order Details Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Order ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Order ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Employee ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Employee ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Customer ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Customer ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Order Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Order Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Shipped Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Shipped Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Shipper ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Shipper ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Ship Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Ship Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Ship Address]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Ship Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Ship City]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Ship City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Ship State/Province]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Ship State/Province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Ship ZIP/Postal Code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Ship ZIP/Postal Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Ship Country/Region]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Ship Country/Region'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Shipping Fee]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Shipping Fee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Taxes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Taxes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Payment Type]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Payment Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Paid Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Paid Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Notes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Tax Rate]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Tax Rate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Tax Status]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Tax Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Status ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'COLUMN',@level2name=N'Status ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'Orders$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[CustomerID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$CustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[CustomerOnOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$CustomerOnOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[EmployeeID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$EmployeeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[EmployeesOnOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$EmployeesOnOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[New_CustomerOnOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$New_CustomerOnOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[New_EmployeesOnOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$New_EmployeesOnOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[New_OrderStatus]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$New_OrderStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[New_ShipperOnOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$New_ShipperOnOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[New_TaxStatusOnOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$New_TaxStatusOnOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[OrderStatus]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$OrderStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[ShipperID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$ShipperID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[ShipperOnOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$ShipperOnOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[Status ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$Status ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[TaxStatusOnOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$TaxStatusOnOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[ZIP/Postal Code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'INDEX',@level2name=N'Orders$ZIP/Postal Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[New_CustomerOnOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'Orders$New_CustomerOnOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[New_EmployeesOnOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'Orders$New_EmployeesOnOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[New_OrderStatus]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'Orders$New_OrderStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[New_ShipperOnOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'Orders$New_ShipperOnOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders].[New_TaxStatusOnOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders', @level2type=N'CONSTRAINT',@level2name=N'Orders$New_TaxStatusOnOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders Status].[Status ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders Status', @level2type=N'COLUMN',@level2name=N'Status ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders Status].[Status Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders Status', @level2type=N'COLUMN',@level2name=N'Status Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders Status].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders Status', @level2type=N'CONSTRAINT',@level2name=N'Orders Status$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders Status]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders Tax Status].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders Tax Status', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders Tax Status].[Tax Status Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders Tax Status', @level2type=N'COLUMN',@level2name=N'Tax Status Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders Tax Status].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders Tax Status', @level2type=N'CONSTRAINT',@level2name=N'Orders Tax Status$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Orders Tax Status]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Orders Tax Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Privileges].[Privilege ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Privileges', @level2type=N'COLUMN',@level2name=N'Privilege ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Privileges].[Privilege Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Privileges', @level2type=N'COLUMN',@level2name=N'Privilege Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Privileges].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Privileges', @level2type=N'CONSTRAINT',@level2name=N'Privileges$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Privileges]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Privileges'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[Supplier IDs]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Supplier IDs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[Product Code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Product Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[Product Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Product Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[Description]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[Standard Cost]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Standard Cost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[List Price]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'List Price'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[Reorder Level]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Reorder Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[Target Level]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Target Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[Quantity Per Unit]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Quantity Per Unit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[Discontinued]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Discontinued'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[Minimum Reorder Quantity]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Minimum Reorder Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[Category]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[Attachments]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'COLUMN',@level2name=N'Attachments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'CONSTRAINT',@level2name=N'Products$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products].[Product Code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products', @level2type=N'INDEX',@level2name=N'Products$Product Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Products]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Products'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[Purchase Order ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'COLUMN',@level2name=N'Purchase Order ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[Product ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'COLUMN',@level2name=N'Product ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[Quantity]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'COLUMN',@level2name=N'Quantity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[Unit Cost]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'COLUMN',@level2name=N'Unit Cost'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[Date Received]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'COLUMN',@level2name=N'Date Received'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[Posted To Inventory]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'COLUMN',@level2name=N'Posted To Inventory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[Inventory ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'COLUMN',@level2name=N'Inventory ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'CONSTRAINT',@level2name=N'Purchase Order Details$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'INDEX',@level2name=N'Purchase Order Details$ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[Inventory ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'INDEX',@level2name=N'Purchase Order Details$Inventory ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[InventoryTransactionsOnPurchaseOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'INDEX',@level2name=N'Purchase Order Details$InventoryTransactionsOnPurchaseOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[New_InventoryTransactionsOnPurchaseOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'INDEX',@level2name=N'Purchase Order Details$New_InventoryTransactionsOnPurchaseOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[New_ProductOnPurchaseOrderDetails]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'INDEX',@level2name=N'Purchase Order Details$New_ProductOnPurchaseOrderDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[New_PurchaseOrderDeatilsOnPurchaseOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'INDEX',@level2name=N'Purchase Order Details$New_PurchaseOrderDeatilsOnPurchaseOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[OrderID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'INDEX',@level2name=N'Purchase Order Details$OrderID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[ProductID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'INDEX',@level2name=N'Purchase Order Details$ProductID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[ProductOnPurchaseOrderDetails]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'INDEX',@level2name=N'Purchase Order Details$ProductOnPurchaseOrderDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[PurchaseOrderDeatilsOnPurchaseOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'INDEX',@level2name=N'Purchase Order Details$PurchaseOrderDeatilsOnPurchaseOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[New_InventoryTransactionsOnPurchaseOrders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'CONSTRAINT',@level2name=N'Purchase Order Details$New_InventoryTransactionsOnPurchaseOrders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[New_ProductOnPurchaseOrderDetails]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'CONSTRAINT',@level2name=N'Purchase Order Details$New_ProductOnPurchaseOrderDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Details].[New_PurchaseOrderDeatilsOnPurchaseOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Details', @level2type=N'CONSTRAINT',@level2name=N'Purchase Order Details$New_PurchaseOrderDeatilsOnPurchaseOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Status].[Status ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Status', @level2type=N'COLUMN',@level2name=N'Status ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Status].[Status]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Status', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Status].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Status', @level2type=N'CONSTRAINT',@level2name=N'Purchase Order Status$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Order Status]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Order Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Purchase Order ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Purchase Order ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Supplier ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Supplier ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Created By]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Created By'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Submitted Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Submitted Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Creation Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Creation Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Status ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Status ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Expected Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Expected Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Shipping Fee]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Shipping Fee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Taxes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Taxes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Payment Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Payment Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Payment Amount]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Payment Amount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Payment Method]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Payment Method'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Notes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Approved By]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Approved By'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Approved Date]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Approved Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Submitted By]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'COLUMN',@level2name=N'Submitted By'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'CONSTRAINT',@level2name=N'Purchase Orders$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[EmployeesOnPurchaseOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'INDEX',@level2name=N'Purchase Orders$EmployeesOnPurchaseOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'INDEX',@level2name=N'Purchase Orders$ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[New_EmployeesOnPurchaseOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'INDEX',@level2name=N'Purchase Orders$New_EmployeesOnPurchaseOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[New_PurchaseOrderStatusLookup]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'INDEX',@level2name=N'Purchase Orders$New_PurchaseOrderStatusLookup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[New_SuppliersOnPurchaseOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'INDEX',@level2name=N'Purchase Orders$New_SuppliersOnPurchaseOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[PurchaseOrderStatusLookup]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'INDEX',@level2name=N'Purchase Orders$PurchaseOrderStatusLookup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[Status ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'INDEX',@level2name=N'Purchase Orders$Status ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[SupplierID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'INDEX',@level2name=N'Purchase Orders$SupplierID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[SuppliersOnPurchaseOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'INDEX',@level2name=N'Purchase Orders$SuppliersOnPurchaseOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[New_EmployeesOnPurchaseOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'CONSTRAINT',@level2name=N'Purchase Orders$New_EmployeesOnPurchaseOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[New_PurchaseOrderStatusLookup]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'CONSTRAINT',@level2name=N'Purchase Orders$New_PurchaseOrderStatusLookup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Purchase Orders].[New_SuppliersOnPurchaseOrder]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Purchase Orders', @level2type=N'CONSTRAINT',@level2name=N'Purchase Orders$New_SuppliersOnPurchaseOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Sales Reports].[Group By]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales Reports', @level2type=N'COLUMN',@level2name=N'Group By'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Sales Reports].[Display]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales Reports', @level2type=N'COLUMN',@level2name=N'Display'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Sales Reports].[Title]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales Reports', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Sales Reports].[Filter Row Source]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales Reports', @level2type=N'COLUMN',@level2name=N'Filter Row Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Sales Reports].[Default]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales Reports', @level2type=N'COLUMN',@level2name=N'Default'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Sales Reports].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales Reports', @level2type=N'CONSTRAINT',@level2name=N'Sales Reports$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Sales Reports]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Sales Reports'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Company]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Last Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'Last Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[First Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'First Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[E-mail Address]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'E-mail Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Job Title]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'Job Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Business Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'Business Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Home Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'Home Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Mobile Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'Mobile Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Fax Number]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'Fax Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Address]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[City]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[State/Province]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'State/Province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[ZIP/Postal Code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'ZIP/Postal Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Country/Region]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'Country/Region'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Web Page]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'Web Page'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Notes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Attachments]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'COLUMN',@level2name=N'Attachments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'CONSTRAINT',@level2name=N'Shippers$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[City]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'INDEX',@level2name=N'Shippers$City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Company]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'INDEX',@level2name=N'Shippers$Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[First Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'INDEX',@level2name=N'Shippers$First Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Last Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'INDEX',@level2name=N'Shippers$Last Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[Postal Code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'INDEX',@level2name=N'Shippers$Postal Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers].[State/Province]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers', @level2type=N'INDEX',@level2name=N'Shippers$State/Province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Shippers]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Shippers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Strings].[String ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Strings', @level2type=N'COLUMN',@level2name=N'String ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Strings].[String Data]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Strings', @level2type=N'COLUMN',@level2name=N'String Data'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Strings].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Strings', @level2type=N'CONSTRAINT',@level2name=N'Strings$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Strings]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Strings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[ID]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Company]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Last Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Last Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[First Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'First Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[E-mail Address]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'E-mail Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Job Title]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Job Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Business Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Business Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Home Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Home Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Mobile Phone]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Mobile Phone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Fax Number]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Fax Number'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Address]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[City]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[State/Province]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'State/Province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[ZIP/Postal Code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'ZIP/Postal Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Country/Region]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Country/Region'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Web Page]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Web Page'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Notes]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Notes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Attachments]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'COLUMN',@level2name=N'Attachments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[PrimaryKey]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'CONSTRAINT',@level2name=N'Suppliers$PrimaryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[City]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'INDEX',@level2name=N'Suppliers$City'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Company]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'INDEX',@level2name=N'Suppliers$Company'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[First Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'INDEX',@level2name=N'Suppliers$First Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Last Name]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'INDEX',@level2name=N'Suppliers$Last Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[Postal Code]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'INDEX',@level2name=N'Suppliers$Postal Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers].[State/Province]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers', @level2type=N'INDEX',@level2name=N'Suppliers$State/Province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'Database1.[Suppliers]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Suppliers'
GO
