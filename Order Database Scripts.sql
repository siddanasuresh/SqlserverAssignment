USE [master]
GO
/****** Object:  Database [Order]    Script Date: 04/07/2019 16:31:40 ******/
CREATE DATABASE [Order] ON  PRIMARY 
( NAME = N'Order', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Order.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Order_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\Order_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Order] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Order].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Order] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Order] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Order] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Order] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Order] SET ARITHABORT OFF
GO
ALTER DATABASE [Order] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Order] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Order] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Order] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Order] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Order] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Order] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Order] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Order] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Order] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Order] SET  DISABLE_BROKER
GO
ALTER DATABASE [Order] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Order] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Order] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Order] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Order] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Order] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Order] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Order] SET  READ_WRITE
GO
ALTER DATABASE [Order] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Order] SET  MULTI_USER
GO
ALTER DATABASE [Order] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Order] SET DB_CHAINING OFF
GO
USE [Order]
GO
/****** Object:  ForeignKey [FK__ORDERS__CUSTOMER__145C0A3F]    Script Date: 04/07/2019 16:31:42 ******/
ALTER TABLE [dbo].[ORDERS] DROP CONSTRAINT [FK__ORDERS__CUSTOMER__145C0A3F]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 04/07/2019 16:31:42 ******/
DROP TABLE [dbo].[Regions]
GO
/****** Object:  StoredProcedure [dbo].[SP_STUDENT_INSERT]    Script Date: 04/07/2019 16:31:42 ******/
DROP PROCEDURE [dbo].[SP_STUDENT_INSERT]
GO
/****** Object:  View [dbo].[EmployeesInDepartment1]    Script Date: 04/07/2019 16:31:42 ******/
DROP VIEW [dbo].[EmployeesInDepartment1]
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 04/07/2019 16:31:42 ******/
ALTER TABLE [dbo].[ORDERS] DROP CONSTRAINT [FK__ORDERS__CUSTOMER__145C0A3F]
GO
DROP TABLE [dbo].[ORDERS]
GO
/****** Object:  UserDefinedDataType [dbo].[Country]    Script Date: 04/07/2019 16:31:42 ******/
DROP TYPE [dbo].[Country]
GO
/****** Object:  View [dbo].[vmEmployeesEnterdInSecondHalf]    Script Date: 04/07/2019 16:31:41 ******/
DROP VIEW [dbo].[vmEmployeesEnterdInSecondHalf]
GO
/****** Object:  View [dbo].[vwProject]    Script Date: 04/07/2019 16:31:41 ******/
DROP VIEW [dbo].[vwProject]
GO
/****** Object:  Table [dbo].[Works_on]    Script Date: 04/07/2019 16:31:41 ******/
DROP TABLE [dbo].[Works_on]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 04/07/2019 16:31:41 ******/
DROP TABLE [dbo].[Customers]
GO
/****** Object:  Default [dbo].[Default_Country]    Script Date: 04/07/2019 16:31:41 ******/
DROP DEFAULT [dbo].[Default_Country]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 04/07/2019 16:31:41 ******/
DROP TABLE [dbo].[Department]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 04/07/2019 16:31:41 ******/
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 04/07/2019 16:31:41 ******/
DROP TABLE [dbo].[Project]
GO
/****** Object:  UserDefinedFunction [dbo].[FNC_CalculateAge]    Script Date: 04/07/2019 16:31:41 ******/
DROP FUNCTION [dbo].[FNC_CalculateAge]
GO
/****** Object:  Table [dbo].[STUDENT]    Script Date: 04/07/2019 16:31:41 ******/
DROP TABLE [dbo].[STUDENT]
GO
/****** Object:  Rule [dbo].[rule_Country]    Script Date: 04/07/2019 16:31:40 ******/
DROP RULE [dbo].[rule_Country]
GO
/****** Object:  Rule [dbo].[rule_Country]    Script Date: 04/07/2019 16:31:40 ******/
CREATE RULE [dbo].[rule_Country]
AS
(@country='Default_Country') 
OR @country in ('CA','WA','OR','NM')
GO
/****** Object:  Table [dbo].[STUDENT]    Script Date: 04/07/2019 16:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[STUDENT](
	[SID] [int] NOT NULL,
	[NAME] [varchar](50) NULL,
	[DATE_OF_BIRTH] [datetime] NULL,
	[AGE] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[STUDENT] ([SID], [NAME], [DATE_OF_BIRTH], [AGE]) VALUES (1, N'Subbu', CAST(0x0000834D00000000 AS DateTime), 27)
INSERT [dbo].[STUDENT] ([SID], [NAME], [DATE_OF_BIRTH], [AGE]) VALUES (2, N'Surekha', CAST(0x0000917300000000 AS DateTime), 17)
/****** Object:  UserDefinedFunction [dbo].[FNC_CalculateAge]    Script Date: 04/07/2019 16:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNC_CalculateAge](@Date_of_birth datetime)
returns int
as
begin
declare @Age int
SELECT @Age=FLOOR((CAST (GetDate() AS INTEGER) - CAST(@Date_of_birth AS INTEGER)) / 365.25)
return @Age
end
GO
/****** Object:  Table [dbo].[Project]    Script Date: 04/07/2019 16:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[project_no] [varchar](2) NULL,
	[project_name] [varchar](20) NULL,
	[Budget] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Project] ([project_no], [project_name], [Budget]) VALUES (N'p1', N'Apollo', 120000)
INSERT [dbo].[Project] ([project_no], [project_name], [Budget]) VALUES (N'p2', N'Gemini', 95000)
INSERT [dbo].[Project] ([project_no], [project_name], [Budget]) VALUES (N'p3', N'Mercury', 18560)
/****** Object:  Table [dbo].[Employee]    Script Date: 04/07/2019 16:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[emp_no] [varchar](10) NULL,
	[emp_fname] [varchar](20) NULL,
	[emp_lname] [varchar](20) NULL,
	[dept_no] [varchar](5) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Employee] ([emp_no], [emp_fname], [emp_lname], [dept_no]) VALUES (N'25348', N'Matthew', N'Smith', N'd3')
INSERT [dbo].[Employee] ([emp_no], [emp_fname], [emp_lname], [dept_no]) VALUES (N'10102', N'Ann', N'Jones', N'd3')
INSERT [dbo].[Employee] ([emp_no], [emp_fname], [emp_lname], [dept_no]) VALUES (N'18316', N'John', N'Barrimore', N'd1')
INSERT [dbo].[Employee] ([emp_no], [emp_fname], [emp_lname], [dept_no]) VALUES (N'29346', N'James', N'James', N'd2')
/****** Object:  Table [dbo].[Department]    Script Date: 04/07/2019 16:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[Dep] [varchar](2) NULL,
	[Department_name] [varchar](10) NULL,
	[Location] [varchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Department] ([Dep], [Department_name], [Location]) VALUES (N'd1', N'Res', N'Dallas')
INSERT [dbo].[Department] ([Dep], [Department_name], [Location]) VALUES (N'd2', N'Acc', N'Seattle')
INSERT [dbo].[Department] ([Dep], [Department_name], [Location]) VALUES (N'd3', N'Mar', N'Dallas')
/****** Object:  Default [dbo].[Default_Country]    Script Date: 04/07/2019 16:31:41 ******/
CREATE DEFAULT [dbo].[Default_Country]
AS 'CA'
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 04/07/2019 16:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [char](5) NOT NULL,
	[CompanyName] [varchar](40) NOT NULL,
	[contactName] [char](30) NULL,
	[Address] [varchar](60) NULL,
	[City] [char](15) NULL,
	[Phone] [char](24) NULL,
	[Fax] [char](24) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Works_on]    Script Date: 04/07/2019 16:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Works_on](
	[emp_no] [int] NULL,
	[project_no] [varchar](2) NULL,
	[Job] [varchar](20) NULL,
	[enter_date] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Works_on] ([emp_no], [project_no], [Job], [enter_date]) VALUES (10102, N'p1', N'Analyst', CAST(0x00008B7600000000 AS DateTime))
INSERT [dbo].[Works_on] ([emp_no], [project_no], [Job], [enter_date]) VALUES (10102, N'p3', N'manager', CAST(0x00008D3F00000000 AS DateTime))
INSERT [dbo].[Works_on] ([emp_no], [project_no], [Job], [enter_date]) VALUES (25348, N'p2', N'Clerk', CAST(0x00008BFF00000000 AS DateTime))
INSERT [dbo].[Works_on] ([emp_no], [project_no], [Job], [enter_date]) VALUES (18316, N'p2', NULL, CAST(0x00008C6900000000 AS DateTime))
INSERT [dbo].[Works_on] ([emp_no], [project_no], [Job], [enter_date]) VALUES (29346, N'p2', NULL, CAST(0x00008BC100000000 AS DateTime))
INSERT [dbo].[Works_on] ([emp_no], [project_no], [Job], [enter_date]) VALUES (2581, N'p3', N'Analyst', CAST(0x00008CF100000000 AS DateTime))
INSERT [dbo].[Works_on] ([emp_no], [project_no], [Job], [enter_date]) VALUES (9031, N'p1', N'Manager', CAST(0x0000728C00000000 AS DateTime))
INSERT [dbo].[Works_on] ([emp_no], [project_no], [Job], [enter_date]) VALUES (28559, N'p1', NULL, CAST(0x000072F800000000 AS DateTime))
INSERT [dbo].[Works_on] ([emp_no], [project_no], [Job], [enter_date]) VALUES (28559, N'p2', N'Clerk', CAST(0x0000836100000000 AS DateTime))
INSERT [dbo].[Works_on] ([emp_no], [project_no], [Job], [enter_date]) VALUES (9031, N'p3', N'Clerk', CAST(0x00008BA300000000 AS DateTime))
INSERT [dbo].[Works_on] ([emp_no], [project_no], [Job], [enter_date]) VALUES (29346, N'p1', N'Clerk', CAST(0x00008BD500000000 AS DateTime))
/****** Object:  View [dbo].[vwProject]    Script Date: 04/07/2019 16:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwProject] AS  
SELECT [project_no]
      ,[project_name]      
  FROM [Order].[dbo].[Project]
GO
/****** Object:  View [dbo].[vmEmployeesEnterdInSecondHalf]    Script Date: 04/07/2019 16:31:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vmEmployeesEnterdInSecondHalf]
AS 
SELECT EMP_FNAME, EMP_LNAME
FROM EMPLOYEE EMP INNER JOIN WORKS_ON WORKS 
ON EMP.EMP_NO=WORKS.EMP_NO AND 
MONTH(ENTER_DATE)>6
GO
/****** Object:  UserDefinedDataType [dbo].[Country]    Script Date: 04/07/2019 16:31:42 ******/
CREATE TYPE [dbo].[Country] FROM [varchar](2) NOT NULL
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 04/07/2019 16:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ORDERS](
	[ORDERID] [int] NOT NULL,
	[CUSTOMERID] [char](5) NOT NULL,
	[ORDERDATE] [datetime] NULL,
	[SHIPPEDDATE] [datetime] NULL,
	[FREIGHT] [money] NULL,
	[SHIPNAME] [varchar](40) NULL,
	[SHIPADDRES] [varchar](60) NULL,
	[QUANTITY] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ORDERID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[EmployeesInDepartment1]    Script Date: 04/07/2019 16:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EmployeesInDepartment1]
AS 
SELECT * FROM EMPLOYEE WHERE dept_no='d1'
GO
/****** Object:  StoredProcedure [dbo].[SP_STUDENT_INSERT]    Script Date: 04/07/2019 16:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_STUDENT_INSERT]
(@NAME VARCHAR(50),
 @DATE_OF_BIRTH DATETIME
)
AS
BEGIN
DECLARE @AGE INTEGER
DECLARE @STUDENT_ID INTEGER=0

SELECT @STUDENT_ID=isnull(MAX(SID),0)+1 FROM STUDENT

SELECT @AGE=dbo.FNC_CALCULATEAGE(@DATE_OF_BIRTH);


INSERT INTO STUDENT(SID, NAME, DATE_OF_BIRTH, AGE)
VALUES(@STUDENT_ID,@NAME,@DATE_OF_BIRTH,@AGE)
END
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 04/07/2019 16:31:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Regions](
	[City] [varchar](20) NULL,
	[Country] [dbo].[Country] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK__ORDERS__CUSTOMER__145C0A3F]    Script Date: 04/07/2019 16:31:42 ******/
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([CUSTOMERID])
REFERENCES [dbo].[Customers] ([id])
GO
