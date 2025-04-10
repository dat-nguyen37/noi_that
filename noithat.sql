USE [master]
GO
/****** Object:  Database [noi_that]    Script Date: 10/21/2024 10:34:39 AM ******/
CREATE DATABASE [noi_that]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'noi_that', FILENAME = N'D:\TOOL\MSSQL16.SQLEXPRESS\MSSQL\DATA\noi_that.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'noi_that_log', FILENAME = N'D:\TOOL\MSSQL16.SQLEXPRESS\MSSQL\DATA\noi_that.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [noi_that] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [noi_that].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [noi_that] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [noi_that] SET ANSI_NULLS ON 
GO
ALTER DATABASE [noi_that] SET ANSI_PADDING ON 
GO
ALTER DATABASE [noi_that] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [noi_that] SET ARITHABORT ON 
GO
ALTER DATABASE [noi_that] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [noi_that] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [noi_that] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [noi_that] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [noi_that] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [noi_that] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [noi_that] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [noi_that] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [noi_that] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [noi_that] SET  DISABLE_BROKER 
GO
ALTER DATABASE [noi_that] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [noi_that] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [noi_that] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [noi_that] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [noi_that] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [noi_that] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [noi_that] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [noi_that] SET RECOVERY FULL 
GO
ALTER DATABASE [noi_that] SET  MULTI_USER 
GO
ALTER DATABASE [noi_that] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [noi_that] SET DB_CHAINING OFF 
GO
ALTER DATABASE [noi_that] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [noi_that] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [noi_that] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [noi_that] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [noi_that] SET QUERY_STORE = ON
GO
ALTER DATABASE [noi_that] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [noi_that]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[carts]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[carts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Color] [nvarchar](max) NULL,
	[Size] [nvarchar](max) NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_carts] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
	[CategoryTypeId] [int] NOT NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoryTypes]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoryTypes](
	[CategoryTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_categoryTypes] PRIMARY KEY CLUSTERED 
(
	[CategoryTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[colors]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[colors](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_colors] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CommentText] [nvarchar](max) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[Rate] [int] NULL,
 CONSTRAINT [PK_comments] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PaymentStatus] [nvarchar](max) NULL,
	[CreateDate] [datetime2](7) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[District] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Ward] [nvarchar](max) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[Payment] [nvarchar](max) NOT NULL,
	[ShippingStatus] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordersItem]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordersItem](
	[OrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Color] [nvarchar](max) NULL,
	[OrderId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Size] [nvarchar](max) NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ordersItem] PRIMARY KEY CLUSTERED 
(
	[OrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productColors]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productColors](
	[ProductColorId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
 CONSTRAINT [PK_productColors] PRIMARY KEY CLUSTERED 
(
	[ProductColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productImages]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productImages](
	[ProductImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_productImages] PRIMARY KEY CLUSTERED 
(
	[ProductImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Discounted] [decimal](18, 2) NULL,
	[DiscountedPrice] [decimal](18, 2) NULL,
	[CategoryId] [int] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[Sell] [int] NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productSizes]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productSizes](
	[ProductSizeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[SizeId] [int] NOT NULL,
	[Discounted] [decimal](18, 2) NULL,
	[DiscountedPrice] [decimal](18, 2) NULL,
 CONSTRAINT [PK_productSizes] PRIMARY KEY CLUSTERED 
(
	[ProductSizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promotion]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promotion](
	[PromotionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[DiscountRate] [decimal](18, 2) NOT NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[Code] [nvarchar](max) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_promotion] PRIMARY KEY CLUSTERED 
(
	[PromotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sizes]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sizes](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_sizes] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userPromotion]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userPromotion](
	[UserPromotionId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PromotionId] [int] NOT NULL,
	[UsedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_userPromotion] PRIMARY KEY CLUSTERED 
(
	[UserPromotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/21/2024 10:34:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Role] [nvarchar](max) NOT NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Username] [nvarchar](max) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240922171855_addUser', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240925140555_update', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240930044423_update2', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240930075933_update3', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240930121750_update4', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240930154503_update5', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241002120527_update-6', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241002175045_update-7', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241003123317_update-8', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241003155746_update-9', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241005084444_update10', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241005084548_update11', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241005155741_update12', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241006042126_update13', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241006043507_update14', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241007021143_update15', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241007162709_update16', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241008100941_update-17', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241008102319_update-18', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241008103232_update-19', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241008133954_update-20', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241008140538_update-21', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241008150816_update-22', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241008152143_update-23', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241008152714_update-24', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241009030605_update-25', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241009031725_update-26', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241009033345_update-27', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241009110843_update-28', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241009140424_update-29', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241010143418_update-30', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241010164534_update-31', N'6.0.0')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241012142619_update-32', N'6.0.0')
GO
SET IDENTITY_INSERT [dbo].[carts] ON 

INSERT [dbo].[carts] ([CartId], [UserId], [ProductId], [Quantity], [Color], [Size], [TotalAmount]) VALUES (31, 14, 5, 3, N'', NULL, CAST(2097900.00 AS Decimal(18, 2)))
INSERT [dbo].[carts] ([CartId], [UserId], [ProductId], [Quantity], [Color], [Size], [TotalAmount]) VALUES (32, 14, 7, 1, N'', NULL, CAST(12025000.00 AS Decimal(18, 2)))
INSERT [dbo].[carts] ([CartId], [UserId], [ProductId], [Quantity], [Color], [Size], [TotalAmount]) VALUES (33, 14, 17, 1, N'', NULL, CAST(30958000.00 AS Decimal(18, 2)))
INSERT [dbo].[carts] ([CartId], [UserId], [ProductId], [Quantity], [Color], [Size], [TotalAmount]) VALUES (37, 15, 6, 1, N'', N'1m2', CAST(17000000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[carts] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([CategoryId], [Name], [Image], [CategoryTypeId]) VALUES (2, N'Bàn nước', N'', 1)
INSERT [dbo].[categories] ([CategoryId], [Name], [Image], [CategoryTypeId]) VALUES (3, N'Tủ tivi', N'', 1)
INSERT [dbo].[categories] ([CategoryId], [Name], [Image], [CategoryTypeId]) VALUES (4, N'Ghế dài', N'', 1)
INSERT [dbo].[categories] ([CategoryId], [Name], [Image], [CategoryTypeId]) VALUES (5, N'Giường ngủ', N'', 2)
INSERT [dbo].[categories] ([CategoryId], [Name], [Image], [CategoryTypeId]) VALUES (6, N'Tủ áo', N'', 2)
INSERT [dbo].[categories] ([CategoryId], [Name], [Image], [CategoryTypeId]) VALUES (7, N'Bàn trang điểm', N'', 2)
INSERT [dbo].[categories] ([CategoryId], [Name], [Image], [CategoryTypeId]) VALUES (8, N'Nệm', N'', 2)
INSERT [dbo].[categories] ([CategoryId], [Name], [Image], [CategoryTypeId]) VALUES (9, N'Tủ bếp', N'', 3)
INSERT [dbo].[categories] ([CategoryId], [Name], [Image], [CategoryTypeId]) VALUES (10, N'Ghế', N'', 4)
INSERT [dbo].[categories] ([CategoryId], [Name], [Image], [CategoryTypeId]) VALUES (11, N'Bàn', N'', 4)
INSERT [dbo].[categories] ([CategoryId], [Name], [Image], [CategoryTypeId]) VALUES (14, N'Kệ sách', N'', 2)
INSERT [dbo].[categories] ([CategoryId], [Name], [Image], [CategoryTypeId]) VALUES (15, N'Ghế thư giãn', NULL, 1)
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[categoryTypes] ON 

INSERT [dbo].[categoryTypes] ([CategoryTypeId], [Name], [Image]) VALUES (1, N'Phòng khách', N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/danhmuc%2Fphongkhach.jpg?alt=media&token=a004ec79-ff0c-4ad3-8e5f-9b21eab9aa85')
INSERT [dbo].[categoryTypes] ([CategoryTypeId], [Name], [Image]) VALUES (2, N'Phòng ngủ', N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/danhmuc%2Fphongngu.jpg?alt=media&token=1613ecb9-6f07-4a8c-a57c-5e9fc2846c2c')
INSERT [dbo].[categoryTypes] ([CategoryTypeId], [Name], [Image]) VALUES (3, N'Phòng bếp', N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/danhmuc%2Fphongbep.jpg?alt=media&token=69c3526a-d9e7-41bc-99b6-71f7e47085fb')
INSERT [dbo].[categoryTypes] ([CategoryTypeId], [Name], [Image]) VALUES (4, N'Phòng làm việc', N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/danhmuc%2Fphonglamviec.jpeg?alt=media&token=071c2d62-9a20-4095-b4fa-876821b49b46')
SET IDENTITY_INSERT [dbo].[categoryTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[colors] ON 

INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (7, N'Đỏ', N'#F56565')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (8, N'Xanh dương', N'#3182CE')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (9, N'Xanh lá', N'#48BB78')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (10, N'Vàng', N'#ECC94B')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (11, N'Xám', N'#A0AEC0')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (12, N'Tím', N'#800080')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (13, N'Hồng', N'#FBB6CE')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (14, N'Cam', N'#F6AD55')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (15, N'Xanh lục nhạt', N'#4FD1C5')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (16, N'Xanh lam nhạt', N'#00B2A9')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (17, N'Xanh chàm', N'#5A67D8')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (18, N'Đỏ đậm', N'#C53030')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (19, N'Xanh dương đậm', N'#2B6CB0')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (20, N'Xanh lá đậm', N'#2F855A')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (22, N'Vàng đậm', N'#D69E2E')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (23, N'Xám đậm', N'#4A5568')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (24, N'Tím đậm', N'#6B46C1')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (25, N'Hồng đậm', N'#D53F8C')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (26, N'Cam đậm', N'#DD6B20')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (27, N'Xanh lục nhạt đậm', N'#38B2AC')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (28, N'Xanh lam nhạt đậm', N'#00A3C4')
INSERT [dbo].[colors] ([ColorId], [Name], [Code]) VALUES (29, N'Nâu', N'#8B4513')
SET IDENTITY_INSERT [dbo].[colors] OFF
GO
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([CommentId], [UserId], [ProductId], [CommentText], [ImageUrl], [CreatedDate], [Rate]) VALUES (9, 14, 3, N'hello1', N'', CAST(N'2024-10-06T16:04:16.0296434' AS DateTime2), 5)
INSERT [dbo].[comments] ([CommentId], [UserId], [ProductId], [CommentText], [ImageUrl], [CreatedDate], [Rate]) VALUES (10, 14, 3, N'hello2', N'', CAST(N'2024-10-06T16:04:25.0448492' AS DateTime2), 5)
INSERT [dbo].[comments] ([CommentId], [UserId], [ProductId], [CommentText], [ImageUrl], [CreatedDate], [Rate]) VALUES (11, 14, 3, N'hello3', N'', CAST(N'2024-10-06T16:06:37.5979417' AS DateTime2), 5)
INSERT [dbo].[comments] ([CommentId], [UserId], [ProductId], [CommentText], [ImageUrl], [CreatedDate], [Rate]) VALUES (12, 14, 3, N'xau', N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/comment%2Fproduct-3%2Fgn-2.jpg?alt=media&token=37a0f317-b774-4ff9-a940-861af86a5dc0', CAST(N'2024-10-06T16:06:54.5162833' AS DateTime2), 5)
INSERT [dbo].[comments] ([CommentId], [UserId], [ProductId], [CommentText], [ImageUrl], [CreatedDate], [Rate]) VALUES (13, 14, 3, N'', N'', CAST(N'2024-10-06T16:16:47.1445416' AS DateTime2), 1)
INSERT [dbo].[comments] ([CommentId], [UserId], [ProductId], [CommentText], [ImageUrl], [CreatedDate], [Rate]) VALUES (14, 14, 3, N'dsds', N'', CAST(N'2024-10-06T16:29:14.4964551' AS DateTime2), 1)
INSERT [dbo].[comments] ([CommentId], [UserId], [ProductId], [CommentText], [ImageUrl], [CreatedDate], [Rate]) VALUES (15, 14, 5, N'', N'', CAST(N'2024-10-06T18:19:32.9805828' AS DateTime2), 5)
INSERT [dbo].[comments] ([CommentId], [UserId], [ProductId], [CommentText], [ImageUrl], [CreatedDate], [Rate]) VALUES (16, 14, 2, N'tuyet voi', N'', CAST(N'2024-10-06T19:21:20.4503971' AS DateTime2), 5)
INSERT [dbo].[comments] ([CommentId], [UserId], [ProductId], [CommentText], [ImageUrl], [CreatedDate], [Rate]) VALUES (17, 15, 7, N'', N'', CAST(N'2024-10-12T19:31:25.8572204' AS DateTime2), 5)
INSERT [dbo].[comments] ([CommentId], [UserId], [ProductId], [CommentText], [ImageUrl], [CreatedDate], [Rate]) VALUES (18, 15, 6, N'', N'', CAST(N'2024-10-12T19:31:45.4005297' AS DateTime2), 5)
INSERT [dbo].[comments] ([CommentId], [UserId], [ProductId], [CommentText], [ImageUrl], [CreatedDate], [Rate]) VALUES (19, 14, 9, N'', N'', CAST(N'2024-10-13T19:15:52.7124818' AS DateTime2), 5)
SET IDENTITY_INSERT [dbo].[comments] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([OrderId], [UserId], [PaymentStatus], [CreateDate], [Address], [City], [Description], [District], [Name], [Phone], [Ward], [TotalAmount], [Discount], [Payment], [ShippingStatus]) VALUES (10, 14, N'Đã thanh toán', CAST(N'2023-10-09T19:39:43.0000000' AS DateTime2), N'nghean', N'Tỉnh Bắc Giang', N'sdsdsds', N'Huyện Lạng Giang', N'datchienhoang', N'3994934', N'Xã Quang Thịnh', CAST(2966500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Thanh toán tiền mặt khi giao hàng (COD)', N'Đã giao')
INSERT [dbo].[orders] ([OrderId], [UserId], [PaymentStatus], [CreateDate], [Address], [City], [Description], [District], [Name], [Phone], [Ward], [TotalAmount], [Discount], [Payment], [ShippingStatus]) VALUES (11, 14, N'Đã thanh toán', CAST(N'2023-11-10T09:59:18.0000000' AS DateTime2), N'nghean', N'Tỉnh Bắc Kạn', N'dsdsds', N'Huyện Bạch Thông', N'datchienhoang', N'3994934', N'Xã Vũ Muộn', CAST(26314300.00 AS Decimal(18, 2)), CAST(4643700.00 AS Decimal(18, 2)), N'Thanh toán tiền mặt khi giao hàng (COD)', N'Đã giao')
INSERT [dbo].[orders] ([OrderId], [UserId], [PaymentStatus], [CreateDate], [Address], [City], [Description], [District], [Name], [Phone], [Ward], [TotalAmount], [Discount], [Payment], [ShippingStatus]) VALUES (12, 14, N'Đã thanh toán', CAST(N'2023-12-10T21:28:27.0000000' AS DateTime2), N'nghean', N'Tỉnh Cao Bằng', N'nhanh', N'Huyện Bảo Lạc', N'datchienhoang', N'3994934', N'Xã Cô Ba', CAST(17000000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Thanh toán online qua cổng VNPay', N'Đã giao')
INSERT [dbo].[orders] ([OrderId], [UserId], [PaymentStatus], [CreateDate], [Address], [City], [Description], [District], [Name], [Phone], [Ward], [TotalAmount], [Discount], [Payment], [ShippingStatus]) VALUES (13, 14, N'Đã thanh toán', CAST(N'2024-04-10T21:37:22.0000000' AS DateTime2), N'nghean', N'Tỉnh Bắc Giang', N'dsdsdsd', N'Huyện Sơn Động', N'datchienhoang', N'3994934', N'Xã An Bá', CAST(17000000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Thanh toán tiền mặt khi giao hàng (COD)', N'Đã giao')
INSERT [dbo].[orders] ([OrderId], [UserId], [PaymentStatus], [CreateDate], [Address], [City], [Description], [District], [Name], [Phone], [Ward], [TotalAmount], [Discount], [Payment], [ShippingStatus]) VALUES (14, 14, N'Đã thanh toán', CAST(N'2024-05-10T21:40:15.0000000' AS DateTime2), N'nghean', N'Tỉnh Bắc Giang', N'njkda', N'Huyện Lục Ngạn', N'datchienhoang', N'3994934', N'Xã Tân Hoa', CAST(2966500.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Thanh toán online qua cổng VNPay', N'Đã giao')
INSERT [dbo].[orders] ([OrderId], [UserId], [PaymentStatus], [CreateDate], [Address], [City], [Description], [District], [Name], [Phone], [Ward], [TotalAmount], [Discount], [Payment], [ShippingStatus]) VALUES (15, 14, N'Đã thanh toán', CAST(N'2024-06-10T21:49:45.0000000' AS DateTime2), N'nghean', N'Tỉnh Bắc Giang', N'jkdfds', N'Huyện Lục Ngạn', N'datchienhoang', N'3994934', N'Xã Kiên Thành', CAST(699300.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Thanh toán online qua cổng VNPay', N'Đã giao')
INSERT [dbo].[orders] ([OrderId], [UserId], [PaymentStatus], [CreateDate], [Address], [City], [Description], [District], [Name], [Phone], [Ward], [TotalAmount], [Discount], [Payment], [ShippingStatus]) VALUES (16, 14, N'Đã thanh toán', CAST(N'2024-08-10T22:23:28.0000000' AS DateTime2), N'nghean', N'Tỉnh Lạng Sơn', N'hay', N'Huyện Văn Lãng', N'chien', N'3994934', N'Xã Gia Miễn', CAST(17000000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), N'Thanh toán online qua cổng VNPay', N'Đã giao')
INSERT [dbo].[orders] ([OrderId], [UserId], [PaymentStatus], [CreateDate], [Address], [City], [Description], [District], [Name], [Phone], [Ward], [TotalAmount], [Discount], [Payment], [ShippingStatus]) VALUES (17, 14, N'Đã thanh toán', CAST(N'2024-10-10T22:33:41.5727299' AS DateTime2), N'dien chau', N'Tỉnh Quảng Ninh', N'giao som cho toi', N'Huyện Tiên Yên', N'hoang', N'098237432', N'Xã Phong Dụ', CAST(6056250.00 AS Decimal(18, 2)), CAST(1068750.00 AS Decimal(18, 2)), N'Thanh toán online qua cổng VNPay', N'Đã giao')
INSERT [dbo].[orders] ([OrderId], [UserId], [PaymentStatus], [CreateDate], [Address], [City], [Description], [District], [Name], [Phone], [Ward], [TotalAmount], [Discount], [Payment], [ShippingStatus]) VALUES (18, 15, N'Đã thanh toán', CAST(N'2024-10-12T20:37:51.2330673' AS DateTime2), N'nghean', N'Tỉnh Quảng Ninh', N'ds', N'Huyện Bình Liêu', N'datchienhoang', N'3994934', N'Xã Đồng Tâm', CAST(16490000.00 AS Decimal(18, 2)), CAST(510000.00 AS Decimal(18, 2)), N'Thanh toán tiền mặt khi giao hàng (COD)', N'Đã giao')
INSERT [dbo].[orders] ([OrderId], [UserId], [PaymentStatus], [CreateDate], [Address], [City], [Description], [District], [Name], [Phone], [Ward], [TotalAmount], [Discount], [Payment], [ShippingStatus]) VALUES (19, 15, N'Đã thanh toán', CAST(N'2024-10-12T20:44:27.1114118' AS DateTime2), N'nghean', N'Tỉnh Điện Biên', N'dsd', N'Huyện Tủa Chùa', N'datchienhoang', N'3994934', N'Xã Tả Sìn Thàng', CAST(23336750.00 AS Decimal(18, 2)), CAST(4118250.00 AS Decimal(18, 2)), N'Thanh toán tiền mặt khi giao hàng (COD)', N'Đã giao')
INSERT [dbo].[orders] ([OrderId], [UserId], [PaymentStatus], [CreateDate], [Address], [City], [Description], [District], [Name], [Phone], [Ward], [TotalAmount], [Discount], [Payment], [ShippingStatus]) VALUES (20, 15, N'Đã thanh toán', CAST(N'2024-10-12T22:08:10.2755987' AS DateTime2), N'nghean', N'Tỉnh Lạng Sơn', N'đsd', N'Huyện Cao Lộc', N'datchienhoang', N'3994934', N'Xã Hải Yến', CAST(14450000.00 AS Decimal(18, 2)), CAST(2550000.00 AS Decimal(18, 2)), N'Thanh toán online qua cổng VNPay', N'Đã giao')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ordersItem] ON 

INSERT [dbo].[ordersItem] ([OrderItemId], [ProductId], [Color], [OrderId], [Quantity], [Size], [TotalAmount]) VALUES (10, 3, N'', 10, 1, NULL, CAST(2966500.00 AS Decimal(18, 2)))
INSERT [dbo].[ordersItem] ([OrderItemId], [ProductId], [Color], [OrderId], [Quantity], [Size], [TotalAmount]) VALUES (11, 17, N'', 11, 1, NULL, CAST(30958000.00 AS Decimal(18, 2)))
INSERT [dbo].[ordersItem] ([OrderItemId], [ProductId], [Color], [OrderId], [Quantity], [Size], [TotalAmount]) VALUES (12, 6, N'', 12, 1, N'1m2', CAST(17000000.00 AS Decimal(18, 2)))
INSERT [dbo].[ordersItem] ([OrderItemId], [ProductId], [Color], [OrderId], [Quantity], [Size], [TotalAmount]) VALUES (13, 6, N'', 13, 1, N'1m2', CAST(17000000.00 AS Decimal(18, 2)))
INSERT [dbo].[ordersItem] ([OrderItemId], [ProductId], [Color], [OrderId], [Quantity], [Size], [TotalAmount]) VALUES (14, 3, N'', 14, 1, NULL, CAST(2966500.00 AS Decimal(18, 2)))
INSERT [dbo].[ordersItem] ([OrderItemId], [ProductId], [Color], [OrderId], [Quantity], [Size], [TotalAmount]) VALUES (15, 5, N'', 15, 1, NULL, CAST(699300.00 AS Decimal(18, 2)))
INSERT [dbo].[ordersItem] ([OrderItemId], [ProductId], [Color], [OrderId], [Quantity], [Size], [TotalAmount]) VALUES (16, 6, N'', 16, 1, N'1m2', CAST(17000000.00 AS Decimal(18, 2)))
INSERT [dbo].[ordersItem] ([OrderItemId], [ProductId], [Color], [OrderId], [Quantity], [Size], [TotalAmount]) VALUES (17, 9, N'', 17, 1, NULL, CAST(7125000.00 AS Decimal(18, 2)))
INSERT [dbo].[ordersItem] ([OrderItemId], [ProductId], [Color], [OrderId], [Quantity], [Size], [TotalAmount]) VALUES (18, 6, N'', 18, 1, N'1m2', CAST(17000000.00 AS Decimal(18, 2)))
INSERT [dbo].[ordersItem] ([OrderItemId], [ProductId], [Color], [OrderId], [Quantity], [Size], [TotalAmount]) VALUES (19, 14, N'', 19, 1, NULL, CAST(27455000.00 AS Decimal(18, 2)))
INSERT [dbo].[ordersItem] ([OrderItemId], [ProductId], [Color], [OrderId], [Quantity], [Size], [TotalAmount]) VALUES (20, 6, N'', 20, 1, N'1m2', CAST(17000000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[ordersItem] OFF
GO
SET IDENTITY_INSERT [dbo].[productColors] ON 

INSERT [dbo].[productColors] ([ProductColorId], [ProductId], [ColorId]) VALUES (1, 16, 10)
INSERT [dbo].[productColors] ([ProductColorId], [ProductId], [ColorId]) VALUES (2, 16, 12)
INSERT [dbo].[productColors] ([ProductColorId], [ProductId], [ColorId]) VALUES (3, 16, 7)
INSERT [dbo].[productColors] ([ProductColorId], [ProductId], [ColorId]) VALUES (5, 16, 11)
INSERT [dbo].[productColors] ([ProductColorId], [ProductId], [ColorId]) VALUES (6, 16, 20)
INSERT [dbo].[productColors] ([ProductColorId], [ProductId], [ColorId]) VALUES (7, 16, 19)
INSERT [dbo].[productColors] ([ProductColorId], [ProductId], [ColorId]) VALUES (8, 2, 11)
SET IDENTITY_INSERT [dbo].[productColors] OFF
GO
SET IDENTITY_INSERT [dbo].[productImages] ON 

INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (4, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F18%2Fghe-lam-viec-van-phong-nga-lung-luoi-cam.jpg?alt=media&token=cb5c68fc-97cd-4a07-8bc8-d9484d1e7910', 18)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (5, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F18%2Fghe-lam-viec-van-phong-nga-lung-luoi4.jpg?alt=media&token=908a2dc6-4cb7-460b-8a06-967bb64f301d', 18)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (6, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F18%2Fghe-lam-viec-van-phong-nga-lung-luoi-xam.jpg?alt=media&token=082af9bc-6978-4f07-b8f3-33c24177ba3d', 18)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (7, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F18%2Fghe-lam-viec-van-phong-nga-lung-luoi-xanh.jpg?alt=media&token=19d61131-1e7c-4610-b67f-60847860a595', 18)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (8, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F19%2Fghe-cong-thai-hoc-van-phong-699-trang-den%20(1).jpg?alt=media&token=3dee5227-e658-4bc7-8f2f-869a0a323f17', 19)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (9, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F19%2Fmat-truoc-ghe-cong-thai-hoc-van-phong-699-trang-den.jpg?alt=media&token=e5ee2a16-0808-4cd1-9e2b-f4f324b57119', 19)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (10, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F19%2Ftua-lung-ghe-cong-thai-hoc-van-phong-699-den.jpg?alt=media&token=e51b04e1-ae29-424a-bdc3-097216f40a89', 19)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (11, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F20%2F8fecb6d4ee42eaa7fd552792d168dae9.jpg?alt=media&token=14ad0421-5f49-480b-8826-a75b9ed9c76a', 20)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (12, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F20%2Fghe-da-nga-thu-gian-lam-viec-van-phong-300x300.jpg?alt=media&token=36b1d1fd-80dd-4361-845a-ac21e312500b', 20)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (13, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F20%2Fghe-xoay-da-nga-lung-AM-01-1.jpg?alt=media&token=6d78b194-a85f-46fa-a6dc-2c18dcecbc57', 20)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (14, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F20%2Fghe-xoay-da-nga-lung-ami01-1.jpg?alt=media&token=8c6e334d-0aa5-44b8-94e7-d642a34a8116', 20)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (15, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F21%2Fghe-xoay-340-bac.jpg?alt=media&token=9a1d011c-b42f-4082-9b31-31cd6446bb39', 21)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (16, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F21%2Fghe-xoay-340-tim.jpg?alt=media&token=65c209ad-eb7a-40b2-8a55-d7b9c0f51e3d', 21)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (17, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F21%2Fghe-xoay-340-xanh.jpg?alt=media&token=2e4f06c4-f01e-4850-9cd6-3e4d251c3867', 21)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (18, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F21%2Fghe-xoay-340-xanh-la.jpg?alt=media&token=797710a0-f5a7-410c-8fba-03a260d9f424', 21)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (19, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F22%2FBan-lam-viec-Coastal.jpg?alt=media&token=36e7aab9-d9fb-48bd-b342-27a2ea5cb96c', 22)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (20, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F22%2FBan-lam-viec-Coastal-1-300x200.jpg?alt=media&token=469fc800-d317-4a21-a20b-c3c3df116172', 22)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (21, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F22%2FBan-lam-viec-Coastal-2-300x200.jpg?alt=media&token=e659670d-e81e-44e5-a789-14d65f7a14d0', 22)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (22, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F23%2FBan-lam-viec-Fence-129-70-30-1-300x200.jpg?alt=media&token=977863de-388c-4e80-8489-d8ed920dabbb', 23)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (23, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F23%2FBan-lam-viec-Fence-129-70-30-2-300x200.jpg?alt=media&token=7ad3b98b-4ace-4fe8-9cb2-79c3efa4495d', 23)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (24, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F23%2FBan-lam-viec-Fence-129-70-30-3-300x200.jpg?alt=media&token=f9f1454a-8e1b-47ec-af80-de4e3574da78', 23)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (25, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F23%2FBan-lam-viec-Fence-129-70-30-300x200.jpg?alt=media&token=5aa83372-6b55-416f-906d-cd600cb656b3', 23)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (26, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F24%2FBan-lam-viec-Pinn-260011-300x194.jpg?alt=media&token=10ce8c14-151e-447f-b6df-079d5678b110', 24)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (27, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F24%2FBan-lam-viec-Pinn-260011-3-300x194.jpg?alt=media&token=65efe2a3-4202-4407-b053-dec30b6a460d', 24)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (28, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F24%2FBan-lam-viec-Pinn-260011-300x194.jpg?alt=media&token=5493ac90-d89b-4d4d-8d34-f10842c442b0', 24)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (29, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F25%2Fban-lam-viec-osaka-300x200.jpg?alt=media&token=e80086d2-bfec-45fa-987e-1b3313f51629', 25)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (30, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F25%2Fban-lam-viec-osaka-1-300x200.jpg?alt=media&token=2f44891c-eced-46d8-8cbd-96769eed0882', 25)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (31, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F25%2Fban-lam-viec-osaka-2-300x200.jpg?alt=media&token=9f24a0d9-c5d3-4e7a-b0be-cc790166559a', 25)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (32, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F26%2Fbn-1.jpg?alt=media&token=5cc98808-b9fd-4ff1-a00e-4cef67617d4b', 26)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (33, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F26%2Fban-nuoc-chu-nhat-valente-2-300x200.jpg?alt=media&token=6f80c18a-388d-4571-9631-b3287433794b', 26)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (34, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F27%2Fbn-2.jpg?alt=media&token=8c32f252-ecad-4778-b7eb-72a7fd131f5b', 27)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (35, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F27%2Fban-nuoc-dura-3-300x200.jpg?alt=media&token=be7ff05a-e92a-4bb0-8eec-b4655f66be55', 27)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (36, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F27%2Fban-nuoc-dura-2-300x200.jpg?alt=media&token=490784be-dda2-4b3d-94c8-04fee411ec9c', 27)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (37, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F28%2Fbn-3.jpg?alt=media&token=1ec18233-5d78-499d-9b33-0152193fa31f', 28)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (38, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F28%2FBan-nuoc-Fence-8-300x200.jpg?alt=media&token=f679a959-6fd0-4557-b2cf-9e857322e62b', 28)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (39, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F28%2Fbn-3.jpg?alt=media&token=cec8c500-932b-46ab-b5fd-e0dc5937ebcb', 28)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (40, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F29%2Fbn-4.jpg?alt=media&token=b06a55c8-6c36-49d0-803a-ca39ac04fe5b', 29)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (41, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F29%2Fban-nuoc-ha-noi-1-300x200.jpg?alt=media&token=1ba039ee-9b86-4cc3-8b1f-b04fddb2c9a3', 29)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (42, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F29%2Fban-nuoc-ha-noi-4-300x200.jpg?alt=media&token=3400ca36-dbc6-4a07-9104-6044a19c28e1', 29)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (43, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F29%2Fban-nuoc-ha-noi-5-300x200.jpg?alt=media&token=ac510eef-15c4-4529-affa-b1f55d0f61a9', 29)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (44, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F30%2Fgtg-1.jpg?alt=media&token=fa93a664-3cb5-4d9f-ad89-90542edc20f1', 30)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (45, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F30%2Fghe-thu-gian-lazboy-10t364-dallas-da-ivory-1-300x200.jpg?alt=media&token=8f1d5aec-f030-4c4e-87c1-3ed4e4a6a509', 30)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (46, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F30%2Fghe-thu-gian-lazboy-10t364-dallas-da-ivory-2-300x200.jpg?alt=media&token=977408dd-0779-4e40-96ad-71c72678fe19', 30)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (47, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F30%2Fghe-thu-gian-lazboy-10t364-dallas-da-ivory-3-1-300x200.jpg?alt=media&token=0bad86df-372a-4ea9-ad20-56876f020ecd', 30)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (48, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F31%2Fgtg-2.jpg?alt=media&token=1325e953-4771-47f0-a359-b872fe2db605', 31)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (49, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F32%2Fgtg-3.jpg?alt=media&token=a3bb4c3b-55b7-4db0-aebd-aaf3ddff1cc7', 32)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (50, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F33%2Fgtg-4.jpg?alt=media&token=a2279e47-bb03-4764-96df-af75c057bf51', 33)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (51, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F34%2FTu-ao-Acrylic-300x200.jpg?alt=media&token=10a796ef-720a-4ed1-981b-6ad9b7fb2263', 34)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (52, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F34%2FTu-ao-Acrylic-1-300x200.jpg?alt=media&token=703b44a3-6ef8-471c-9c36-252cce4468f2', 34)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (53, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F34%2FTu-ao-Acrylic-2-300x200.jpg?alt=media&token=474ba25c-c0c9-4b93-80f6-0bff3cc3ec98', 34)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (54, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F35%2FTu-ao-Wabrobe-02-1-300x200.jpg?alt=media&token=44adf401-0df4-4a3a-8464-718f07f25cbf', 35)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (55, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F35%2FTu-ao-Wabrobe-02-2-300x200.jpg?alt=media&token=cdaeddb4-ff0c-418b-acf8-2493a9daefb1', 35)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (56, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F35%2FTu-ao-Wabrobe-02-3-300x200.jpg?alt=media&token=0693bf45-89d6-453f-8f7e-2b59420b8ca4', 35)
INSERT [dbo].[productImages] ([ProductImageId], [ImageUrl], [ProductId]) VALUES (57, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F35%2FTu-ao-Wabrobe-02-300x200.jpg?alt=media&token=f8bc8b31-80ea-4439-ac71-6108c2b629dd', 35)
SET IDENTITY_INSERT [dbo].[productImages] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (2, N'Bàn Trang Điểm LUCAS', N'Bàn trang điểm LUCAS là một sản phẩm nội thất tiện dụng, giúp bạn trang điểm và làm đẹp một cách dễ dàng. Bàn có kích thước 1200 x 540 x 760 mm, phù hợp với nhiều không gian phòng ngủ khác nhau.

Bàn được làm từ gỗ cao cấp, có khả năng chống ẩm, chống mối mọt, mang đến độ bền cao. Thiết kế bàn đơn giản, hiện đại, ngăn kéo tiện lợi . Bàn có thể kết hợp với ghế ngồi, giúp bạn thoải mái khi trang điểm và làm đẹp.', CAST(3650000.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(3102500.00 AS Decimal(18, 2)), 7, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fbtd-1.webp?alt=media&token=4ae010e8-354f-41ce-80b4-6d229ceb6ed8', CAST(N'2024-10-07T08:16:05.8650101' AS DateTime2), 1)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (3, N'Bộ Bàn Trang Điểm DOMINIK', N'Sản phẩm	Bộ bàn trang điểm
Bộ sưu tập	DOMINIK
Kích cỡ	L80xW41.3xH169.5
Màu sắc	Dark-wood-Dark-grey
Chất liệu	MFC
Xuất xứ	Việt Nam
Đơn vị	PCS', CAST(3490000.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(2966500.00 AS Decimal(18, 2)), 7, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fbtd-2.webp?alt=media&token=1df26b5e-c348-4e2d-8dc5-83db90c7a9c1', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (4, N'Kệ Sách STUDENT 5 Tầng Màu Gỗ Sáng / Đen', N'Bộ sưu tập nội thất văn phòng Student: Sự kết hợp hoàn hảo giữa Thẩm mỹ và Công năng sử dụng

Trong nhịp sống hiện đại, nơi mà hoạt động làm việc và học tập tại nhà trở nên ngày càng quan trọng, việc chọn một sản phẩm bàn học hay tủ kệ văn phòng phù hợp là điều không thể thiếu. Những vật dụng này không chỉ phải đảm bảo tính chất lượng và chắc chắn mà còn phải thể hiện sự thẩm mỹ và phù hợp với môi trường làm việc và nội thất trong gia đình. Bộ sưu tập Student chính là sự lựa chọn hoàn hảo cho nhu cầu của bạn.

Khung sắt và về mặt hoàn thiện xuất sắc', CAST(1790000.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(1253000.00 AS Decimal(18, 2)), 14, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fks-1.webp?alt=media&token=a351a5a6-8145-4f43-8386-a27a1ce5ee77', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (5, N'Kệ Trưng Bày 3 Tầng Gỗ Sồi LIPIZZAN', N'Được làm từ chất liệu MDF phủ veneer sồi bền chắc, giá để đồ LIPIZZAN nổi bật với thiết kế đơn giản nhưng sang trọng và cực kỳ tiện dụng. Sản phẩm giúp bạn sắp xếp và bày trí các vật dụng vừa ngăn nắp vừa nghệ thuật, đẹp mắt. Giá để đồ có nhiều màu sắc và kích thước khác nhau cho bạn thoải mái chọn lựa. Đây là dòng sản phẩm cực kỳ độc đáo đến từ nội thất BAYA.', CAST(1000000.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(699300.00 AS Decimal(18, 2)), 14, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fks-2.webp?alt=media&token=4c9dbd23-3177-4ef5-8df5-54a61ee8b5c0', CAST(N'2024-10-07T08:15:19.7748147' AS DateTime2), 1)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (6, N'Hệ tủ bếp MOHO Kitchen Premium Grenaa Nhiều Kích Thước', N'', CAST(19500000.00 AS Decimal(18, 2)), CAST(40.00 AS Decimal(18, 2)), CAST(11700000.00 AS Decimal(18, 2)), 9, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Ftb-1.webp?alt=media&token=f7d176ce-b8a0-4c94-a777-a0ca6316530f', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 5)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (7, N'Hệ tủ bếp MOHO Kitchen Premium Ubeda Nhiều Kích Thước', N'', CAST(18500000.00 AS Decimal(18, 2)), CAST(35.00 AS Decimal(18, 2)), CAST(12025000.00 AS Decimal(18, 2)), 9, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Ftb-2.webp?alt=media&token=aea466b0-582e-46bb-a229-73ddeb93ac1d', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (8, N'Hệ tủ bếp MOHO Kitchen Premium Narvik Nhiều Kích Thước', N'', CAST(20500000.00 AS Decimal(18, 2)), CAST(30.00 AS Decimal(18, 2)), CAST(14350000.00 AS Decimal(18, 2)), 9, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Ftb-3.webp?alt=media&token=cf74573e-3220-4375-ad2b-59594a2950d4', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (9, N'Hệ tủ bếp MOHO Kitchen Smart Grenaa Nhiều Kích Thước', N'', CAST(9500000.00 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), CAST(7125000.00 AS Decimal(18, 2)), 9, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Ftb-4.webp?alt=media&token=1490bb67-71eb-4907-97d9-13eb470b44a9', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (14, N'Giường Coastal xanh 1m6', N'', CAST(28900000.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(27455000.00 AS Decimal(18, 2)), 5, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fgn-1.jpg?alt=media&token=98ec77ed-b50e-495f-ac33-dd72796f4c18', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (15, N'Giường Leman 1m8 vải VACT10370', N'', CAST(33650000.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(28602500.00 AS Decimal(18, 2)), 5, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fgn-2.jpg?alt=media&token=3f2954d3-16f3-4a8b-b343-a63500ecd744', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (16, N'Giường Coastal vàng 1m8', N'', CAST(26900000.00 AS Decimal(18, 2)), NULL, NULL, 5, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fgn-3.jpg?alt=media&token=55ce4d1c-391e-427b-8b84-feaac5b85554', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (17, N'Giường Leman 1m8 vải VACT4328', N'', CAST(33650000.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), CAST(30958000.00 AS Decimal(18, 2)), 5, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fgn-4.jpg?alt=media&token=ba207d6c-4151-436a-bd35-6efaa3dc0712', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (18, N'Ghế làm việc lưới văn phòng ngả lưng cam', N'Ghế làm việc lưới văn phòng ngả lưng cam GXTH886 thuộc dòng sản phẩm ghế xoay chất lượng cao cấp. Với thiết kế lưng và đệm may tạo cảm nhận thanh thoát. Sản phẩm ghế xoay giá rẻ này hiện đang được giới văn phòng săn đón.', CAST(1550000.00 AS Decimal(18, 2)), NULL, NULL, 10, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fghe-lam-viec-van-phong-nga-lung-luoi4.jpg?alt=media&token=4e671fea-26a8-4525-af36-eef71827807f', CAST(N'2024-10-14T14:10:10.0979515' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (19, N'Ghế công thái học làm việc văn phòng 699 khung trắng', N'Chất liệu: Khung lưng bằng nhựa cao cấp chịu lực, được bọc lưới có lumbar support. Đệm ngồi mút đúc mềm mại. Tay cố định ốp nhựa đen cao cấp. Chân ghế nhựa cao cấp
Kiểu dáng: Ghế lưng cao, tựa đầu diện tích lớn. Tay ghế hình chữ T cố định. Chân sao 5 cánh có gắn bánh xe di chuyển linh hoạt. Ghế có khả năng nâng hạ và ngả sau
Màu sắc: Có thể đặt màu theo yêu cầu
Chất liệu: Xuất xứ: Nhập khẩu
Bảo hành: Hàng mới 100%, bảo hành 1 năm', CAST(1080000.00 AS Decimal(18, 2)), NULL, NULL, 10, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fghe-cong-thai-hoc-van-phong-699-trang-den%20(1).jpg?alt=media&token=9595a9b7-635d-4e85-9f54-bcdb6f731401', CAST(N'2024-10-14T14:22:35.2554010' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (20, N'Ghế trưởng phòng giám đốc da ngả lưng', N'Ghế trưởng phòng giám đốc da ngả lưng với thiết kế vững chắc cùng chất liệu da cao cấp khẳng định phong cách văn phòng đẹp. Chiếc ghế với độ ngả vừa phải giúp bạn có thể nghỉ ngơi sau những giờ làm việc căng thẳng.

Ghế xoay da GX090 thuộc dòng sản phẩm ghế da dùng cho nhân viên cấp cao và giám đốc. Với thiết kế tinh tế, không chỉ giúp người dùng thỏai mái mà còn tôn lên vị thế của họ. Được sản xuất dựa trên thói quen của nhân viên công sở. Cùng tìm hiểu về một trong những sản phẩm được ưa chuộng nhất hiện nay.', CAST(1300000.00 AS Decimal(18, 2)), NULL, NULL, 10, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2F8fecb6d4ee42eaa7fd552792d168dae9.jpg?alt=media&token=bc9f0860-46cf-4b29-88bd-3dfbcb92873e', CAST(N'2024-10-14T14:26:00.3848179' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (21, N'Ghế làm việc văn phòng lưng lưới GX340', N'Ghế làm việc văn phòng lưng lưới GX340 với đệm đúc chất lượng vượt trội, dòng sản phẩm được cải tiến mới để đạt tiêu chuẩn sức khỏe cho người ngồi làm việc liên tục trong 12 giờ. Sản phẩm thuộc thương hiệu ghế văn phòng Gowell.Ghế Lusi cấu tạo đơn giản, gọn nhẹ nên dễ dàng tháo lắp và di chuyển. Kích thước chuẩn khoa học, khi ngồi tạo cảm giác thoải mái và chống các tác hại xấu đến sức khỏe người sử dụng.Khung ghế nhựa PP cứng cáp, chịu lực tốt và kết hợp bọc vải lưới cao cấp tạo thành lực căng khi ngồi có độ đàn hồi cao, chống tích tụ nhiệt và thân thiện với môi trường.
Tựa lưng trung thiết kế bảo vệ sức khỏe với đường cong uốn nhẹ ngã về sau hình chữ S, giúp nâng đỡ bộ phận cột sống và vùng thắt lưng an toàn, hạn chế nhức mỏi khi ngồi làm việc lâu.
Đệm ngồi sử dụng mous xốp, bọc vải lưới thoáng mát và kết cấu mặt đệm hơi dốc ngược về phía sau với mục đích cố định tư thế ngồi đúng và giảm sự chèn ép của cơ thể lên vùng mông, đùi, chân rất hiệu quả.
Tay ghế nhựa cố định được thiết kế hiện đại với khả năng điều chỉnh lên xuống một cách dễ dàng và tạo sự tì đỡ vững chắc cho phần cánh tay cũng như khủy tay rất tốt.
Chân ghế xoay 5 cạnh hình cánh sao được chế tạo từ sắt dày với khả năng chịu lực cao tốt, bề mặt phủ lớp mạ crom sáng bóng có tác dụng chống hoen gỉ và ăn mòn.
Bánh xe Nylon gắn liền khung chân trụ với cơ chế xoay chuyển hướng linh hoạt đến nhiều vị trí khác nhau, không phát ra tiếng ồn lớn và chống trầy xướt mặt sàn khi có lực ma sát mạnh.
Sản phẩm trang bị bộ điều khiển 1 cần ngả nệm thông minh có chức năng chính: chốt khóa cố định 1 vị trí, thay đổi độ cao – thấp và rút cần dùng lực ngã nhẹ về sau dạng bập bênh thư giản cực dễ chịu.
Thiết kế tinh tế, sang trọng và thông số kỹ thuật chuẩn, ghế Lusi của nội thất Tiến Thành chắc chắn sẽ mang đến cho quý khách hàng sự hài lòng tuyệt đối.', CAST(790000.00 AS Decimal(18, 2)), NULL, NULL, 10, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fghe-xoay-340-bac.jpg?alt=media&token=fa37efbb-11ce-498d-aa57-6bfeab4a96e3', CAST(N'2024-10-14T14:27:51.7670829' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (22, N'Bàn làm việc Coastal', N'Coastal mang đậm chất Việt khi khéo léo dung hòa được những nét đẹp lấy cảm hứng từ miền duyên hải nước ta với các vật liệu cao cấp, lối thiết kế hiện đại. Bàn làm việc Coastal có thiết kế độc đáo với phần tủ kéo cong mang đến không gian làm việc sáng tạo và độc đáo. Chất liệu gỗ Ash vừa đáp ứng tính thẩm mỹ, đồng thời là vật liệu bền bỉ theo thời gian. Khi kết hợp bàn làm việc cùng ghế ăn Coastal sẽ tạo nên góc làm việc cực kỳ thoải mái và tiện nghi.', CAST(900000.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(810000.00 AS Decimal(18, 2)), 11, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2FBan-lam-viec-Coastal.jpg?alt=media&token=f132e73d-9de7-4b51-a5b8-78e3e48768b1', CAST(N'2024-10-14T17:26:31.2012059' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (23, N'Bàn làm việc Fence', N'', CAST(1200000.00 AS Decimal(18, 2)), NULL, NULL, 11, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2FBan-lam-viec-Fence-129-70-30-1-300x200.jpg?alt=media&token=fd0081fa-6460-4021-8726-b74e0e313276', CAST(N'2024-10-14T17:28:23.0043653' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (24, N'Bàn làm việc Finn 260011', N'', CAST(1400000.00 AS Decimal(18, 2)), NULL, NULL, 11, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2FBan-lam-viec-Pinn-260011-2-300x194.jpg?alt=media&token=bbfc5522-654c-4a5e-b2d3-9026358f4a99', CAST(N'2024-10-14T17:29:39.8335525' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (25, N'Bàn làm việc Saka', N'', CAST(1500000.00 AS Decimal(18, 2)), NULL, NULL, 11, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fban-lam-viec-osaka-1-300x200.jpg?alt=media&token=60a74a7d-d7ef-4c4b-93a2-1dfbb3298f81', CAST(N'2024-10-14T17:31:12.8621047' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (26, N'Bàn nước chữ nhật Valente', N'', CAST(15000000.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(12750000.00 AS Decimal(18, 2)), 2, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fbn-1.jpg?alt=media&token=de1c66b9-4103-4ce6-80c7-352374ed3914', CAST(N'2024-10-14T17:36:21.6182651' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (27, N'Bàn nước Dura', N'', CAST(13250000.00 AS Decimal(18, 2)), NULL, NULL, 2, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fbn-2.jpg?alt=media&token=a78ead8b-16e9-4824-92ea-6bbec64cd69c', CAST(N'2024-10-14T17:38:23.1669342' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (28, N'Bàn nước Fence', N'', CAST(14900000.00 AS Decimal(18, 2)), NULL, NULL, 2, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fbn-3.jpg?alt=media&token=b60059a0-9348-4ca6-8dd5-a792845943e0', CAST(N'2024-10-14T17:40:08.2998287' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (29, N'Bàn nước Hà Nội', N'', CAST(9800000.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(7840000.00 AS Decimal(18, 2)), 2, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fbn-4.jpg?alt=media&token=d65b7eaa-837e-45a8-a343-fddfd0af34f3', CAST(N'2024-10-14T17:41:32.6594833' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (30, N'Ghế thư giãn Lazboy 10T364 Dallas da Ivory', N'', CAST(12000000.00 AS Decimal(18, 2)), NULL, NULL, 15, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fgtg-1.jpg?alt=media&token=3fa768b7-d635-4dab-90f3-7dce803635cc', CAST(N'2024-10-14T17:54:56.0927408' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (31, N'Ghế thư giãn điện Lazboy da Pebble', N'', CAST(20000000.00 AS Decimal(18, 2)), NULL, NULL, 15, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fgtg-2.jpg?alt=media&token=5625bf07-219d-4dc1-8e27-1aba4ec4ae6f', CAST(N'2024-10-14T17:55:56.0451081' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (32, N'Ghế thư giãn Lazboy 10T352 Shannon da Sienna', N'Ghế thư giãn thương hiệu nối tiếng Lazboy của Mỹ được làm bằng khung gỗ bọc da, cấu trúc ghế chắc chắn nâng đỡ cơ thể. Khi ngồi tạo cảm giác êm ái thoải mái lắc lư theo nhịp ghế, phần nâng đỡ chân được bật ra, chỉ cần một động tác nhẹ phần tựa lưng sẽ tự động xuôi theo dáng nằm cho bạn cảm giác thoải mái nhất. Ghế thư giãn Lazboy là sự lựa chọn tuyệt vời nhất cho những phút giây thư giãn sau một ngày dài hoạt động.', CAST(14000000.00 AS Decimal(18, 2)), NULL, NULL, 15, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fgtg-3.jpg?alt=media&token=cf6b5d5d-eb6e-47e2-925b-efd7929faf84', CAST(N'2024-10-14T17:57:10.5242027' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (33, N'Ghế thư giãn Lazboy Dreamtime da TAN', N'Ghế thư giãn thương hiệu nối tiếng Lazboy của Mỹ được làm bằng khung gỗ bọc da, cấu trúc ghế chắc chắn nâng đỡ cơ thể. Khi ngồi tạo cảm giác êm ái thoải mái lắc lư theo nhịp ghế, phần nâng đỡ chân được bật ra, chỉ cần một động tác nhẹ phần tựa lưng sẽ tự động xuôi theo dáng nằm cho bạn cảm giác thoải mái nhất. Ghế thư giãn Lazboy là sự lựa chọn tuyệt vời nhất cho những phút giây thư giãn sau một ngày dài hoạt động.', CAST(17000000.00 AS Decimal(18, 2)), NULL, NULL, 15, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2Fgtg-4.jpg?alt=media&token=4b5beeb7-5ff9-46b3-99ad-037329747c12', CAST(N'2024-10-14T17:58:18.2212419' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (34, N'Tủ áo Acrylic', N'', CAST(11000000.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(9350000.00 AS Decimal(18, 2)), 6, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2FTu-ao-Acrylic-300x200.jpg?alt=media&token=3dfd2444-f0c8-491a-ad93-f5a5eee1aca7', CAST(N'2024-10-14T18:02:41.2893706' AS DateTime2), 0)
INSERT [dbo].[products] ([ProductId], [Name], [Description], [Price], [Discounted], [DiscountedPrice], [CategoryId], [Image], [CreatedDate], [Sell]) VALUES (35, N'Tủ áo Wabrobe 02', N'', CAST(30000000.00 AS Decimal(18, 2)), NULL, NULL, 6, N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/product%2FTu-ao-Wabrobe-02-1-300x200.jpg?alt=media&token=cc964158-771f-48d1-9753-6817dc8c356f', CAST(N'2024-10-14T18:04:40.5302917' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[productSizes] ON 

INSERT [dbo].[productSizes] ([ProductSizeId], [ProductId], [Price], [SizeId], [Discounted], [DiscountedPrice]) VALUES (1, 16, CAST(32000000.00 AS Decimal(18, 2)), 1, CAST(20.00 AS Decimal(18, 2)), CAST(25600000.00 AS Decimal(18, 2)))
INSERT [dbo].[productSizes] ([ProductSizeId], [ProductId], [Price], [SizeId], [Discounted], [DiscountedPrice]) VALUES (2, 16, CAST(27500000.00 AS Decimal(18, 2)), 2, NULL, NULL)
INSERT [dbo].[productSizes] ([ProductSizeId], [ProductId], [Price], [SizeId], [Discounted], [DiscountedPrice]) VALUES (3, 6, CAST(20000000.00 AS Decimal(18, 2)), 2, CAST(15.00 AS Decimal(18, 2)), CAST(17000000.00 AS Decimal(18, 2)))
INSERT [dbo].[productSizes] ([ProductSizeId], [ProductId], [Price], [SizeId], [Discounted], [DiscountedPrice]) VALUES (4, 6, CAST(22000000.00 AS Decimal(18, 2)), 3, CAST(10.00 AS Decimal(18, 2)), CAST(19800000.00 AS Decimal(18, 2)))
INSERT [dbo].[productSizes] ([ProductSizeId], [ProductId], [Price], [SizeId], [Discounted], [DiscountedPrice]) VALUES (7, 16, CAST(34000000.00 AS Decimal(18, 2)), 3, CAST(20.00 AS Decimal(18, 2)), CAST(27200000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[productSizes] OFF
GO
SET IDENTITY_INSERT [dbo].[promotion] ON 

INSERT [dbo].[promotion] ([PromotionId], [Name], [DiscountRate], [StartDate], [EndDate], [Code], [Status]) VALUES (1, N'Giảm giá mùa hè', CAST(10.00 AS Decimal(18, 2)), CAST(N'2024-10-05T05:48:28.0400000' AS DateTime2), CAST(N'2024-11-05T05:48:28.0400000' AS DateTime2), N'CHAOHE10', 1)
INSERT [dbo].[promotion] ([PromotionId], [Name], [DiscountRate], [StartDate], [EndDate], [Code], [Status]) VALUES (2, N'Khuyễn mãi tết', CAST(15.00 AS Decimal(18, 2)), CAST(N'2024-10-06T08:49:44.5120000' AS DateTime2), CAST(N'2024-11-05T08:49:44.5120000' AS DateTime2), N'KMTET15', 1)
INSERT [dbo].[promotion] ([PromotionId], [Name], [DiscountRate], [StartDate], [EndDate], [Code], [Status]) VALUES (3, N'Khuyễn mãi 2/9', CAST(15.00 AS Decimal(18, 2)), CAST(N'2024-10-07T08:49:44.5120000' AS DateTime2), NULL, N'KM2/9', 1)
INSERT [dbo].[promotion] ([PromotionId], [Name], [DiscountRate], [StartDate], [EndDate], [Code], [Status]) VALUES (4, N'dsdsd', CAST(3.00 AS Decimal(18, 2)), CAST(N'2024-10-12T00:00:00.0000000' AS DateTime2), NULL, N'ER92XG', 1)
SET IDENTITY_INSERT [dbo].[promotion] OFF
GO
SET IDENTITY_INSERT [dbo].[sizes] ON 

INSERT [dbo].[sizes] ([SizeId], [Name]) VALUES (1, N'90cm')
INSERT [dbo].[sizes] ([SizeId], [Name]) VALUES (2, N'1m2')
INSERT [dbo].[sizes] ([SizeId], [Name]) VALUES (3, N'1m4')
INSERT [dbo].[sizes] ([SizeId], [Name]) VALUES (4, N'1m6')
INSERT [dbo].[sizes] ([SizeId], [Name]) VALUES (5, N'1m8')
SET IDENTITY_INSERT [dbo].[sizes] OFF
GO
SET IDENTITY_INSERT [dbo].[userPromotion] ON 

INSERT [dbo].[userPromotion] ([UserPromotionId], [UserId], [PromotionId], [UsedDate]) VALUES (1, 15, 4, CAST(N'2024-10-12T20:37:51.6784063' AS DateTime2))
INSERT [dbo].[userPromotion] ([UserPromotionId], [UserId], [PromotionId], [UsedDate]) VALUES (2, 15, 2, CAST(N'2024-10-12T20:44:27.3903865' AS DateTime2))
INSERT [dbo].[userPromotion] ([UserPromotionId], [UserId], [PromotionId], [UsedDate]) VALUES (3, 15, 3, CAST(N'2024-10-12T22:08:10.3817426' AS DateTime2))
SET IDENTITY_INSERT [dbo].[userPromotion] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([Id], [Email], [Password], [Phone], [Address], [Role], [ImageUrl], [Username]) VALUES (14, N'hungmlml2k6@gmail.com', N'$2a$11$om0IXvN.8Z0AYWBgkmnIeOMjNcEGJcjey.EvBfKLU3kqzR5607jFy', N'0966544325', N'nghe an', N'User', N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/account%2Fnen.jpg?alt=media&token=f9905603-8afb-4381-8e90-975cc3886522', N'DatNguyen')
INSERT [dbo].[users] ([Id], [Email], [Password], [Phone], [Address], [Role], [ImageUrl], [Username]) VALUES (15, N'dat958734@gmail.com', N'$2a$10$JHxh3TL8iSW1L7HW66huTe.VMXYiFWSIA7eukGF4Be3zJ3Zuf9eS.', NULL, NULL, N'Admin', N'https://firebasestorage.googleapis.com/v0/b/noithat-b8966.appspot.com/o/account%2Fbg.jpg?alt=media&token=f561b919-422f-4f0c-9954-405a5440d497', N'Dat nguyen')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
/****** Object:  Index [IX_carts_ProductId]    Script Date: 10/21/2024 10:34:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_carts_ProductId] ON [dbo].[carts]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_categories_CategoryTypeId]    Script Date: 10/21/2024 10:34:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_categories_CategoryTypeId] ON [dbo].[categories]
(
	[CategoryTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_comments_ProductId]    Script Date: 10/21/2024 10:34:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_comments_ProductId] ON [dbo].[comments]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_comments_UserId]    Script Date: 10/21/2024 10:34:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_comments_UserId] ON [dbo].[comments]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ordersItem_OrderId]    Script Date: 10/21/2024 10:34:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_ordersItem_OrderId] ON [dbo].[ordersItem]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ordersItem_ProductId]    Script Date: 10/21/2024 10:34:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_ordersItem_ProductId] ON [dbo].[ordersItem]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_productColors_ColorId]    Script Date: 10/21/2024 10:34:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_productColors_ColorId] ON [dbo].[productColors]
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_productColors_ProductId]    Script Date: 10/21/2024 10:34:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_productColors_ProductId] ON [dbo].[productColors]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_productImages_ProductId]    Script Date: 10/21/2024 10:34:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_productImages_ProductId] ON [dbo].[productImages]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_products_CategoryId]    Script Date: 10/21/2024 10:34:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_products_CategoryId] ON [dbo].[products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_productSizes_ProductId]    Script Date: 10/21/2024 10:34:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_productSizes_ProductId] ON [dbo].[productSizes]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_productSizes_SizeId]    Script Date: 10/21/2024 10:34:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_productSizes_SizeId] ON [dbo].[productSizes]
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_userPromotion_PromotionId]    Script Date: 10/21/2024 10:34:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_userPromotion_PromotionId] ON [dbo].[userPromotion]
(
	[PromotionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_userPromotion_UserId]    Script Date: 10/21/2024 10:34:40 AM ******/
CREATE NONCLUSTERED INDEX [IX_userPromotion_UserId] ON [dbo].[userPromotion]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (N'Chưa thanh toán') FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreateDate]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (N'') FOR [Address]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (N'') FOR [City]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (N'') FOR [District]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (N'') FOR [Phone]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (N'') FOR [Ward]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT ((0.0)) FOR [Discount]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (N'') FOR [Payment]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (N'Chưa chuyển') FOR [ShippingStatus]
GO
ALTER TABLE [dbo].[productColors] ADD  DEFAULT ((0)) FOR [ColorId]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (N'') FOR [Image]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedDate]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT ((0)) FOR [Sell]
GO
ALTER TABLE [dbo].[productSizes] ADD  DEFAULT ((0)) FOR [SizeId]
GO
ALTER TABLE [dbo].[promotion] ADD  DEFAULT (N'') FOR [Code]
GO
ALTER TABLE [dbo].[promotion] ADD  DEFAULT (CONVERT([bit],(1))) FOR [Status]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT (N'User') FOR [Role]
GO
ALTER TABLE [dbo].[carts]  WITH CHECK ADD  CONSTRAINT [FK_carts_products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[carts] CHECK CONSTRAINT [FK_carts_products_ProductId]
GO
ALTER TABLE [dbo].[categories]  WITH CHECK ADD  CONSTRAINT [FK_categories_categoryTypes_CategoryTypeId] FOREIGN KEY([CategoryTypeId])
REFERENCES [dbo].[categoryTypes] ([CategoryTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[categories] CHECK CONSTRAINT [FK_categories_categoryTypes_CategoryTypeId]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_products_ProductId]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_users_UserId]
GO
ALTER TABLE [dbo].[ordersItem]  WITH CHECK ADD  CONSTRAINT [FK_ordersItem_orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[orders] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ordersItem] CHECK CONSTRAINT [FK_ordersItem_orders_OrderId]
GO
ALTER TABLE [dbo].[ordersItem]  WITH CHECK ADD  CONSTRAINT [FK_ordersItem_products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ordersItem] CHECK CONSTRAINT [FK_ordersItem_products_ProductId]
GO
ALTER TABLE [dbo].[productColors]  WITH CHECK ADD  CONSTRAINT [FK_productColors_colors_ColorId] FOREIGN KEY([ColorId])
REFERENCES [dbo].[colors] ([ColorId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[productColors] CHECK CONSTRAINT [FK_productColors_colors_ColorId]
GO
ALTER TABLE [dbo].[productColors]  WITH CHECK ADD  CONSTRAINT [FK_productColors_products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[productColors] CHECK CONSTRAINT [FK_productColors_products_ProductId]
GO
ALTER TABLE [dbo].[productImages]  WITH CHECK ADD  CONSTRAINT [FK_productImages_products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[productImages] CHECK CONSTRAINT [FK_productImages_products_ProductId]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[categories] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_categories_CategoryId]
GO
ALTER TABLE [dbo].[productSizes]  WITH CHECK ADD  CONSTRAINT [FK_productSizes_products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[productSizes] CHECK CONSTRAINT [FK_productSizes_products_ProductId]
GO
ALTER TABLE [dbo].[productSizes]  WITH CHECK ADD  CONSTRAINT [FK_productSizes_sizes_SizeId] FOREIGN KEY([SizeId])
REFERENCES [dbo].[sizes] ([SizeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[productSizes] CHECK CONSTRAINT [FK_productSizes_sizes_SizeId]
GO
ALTER TABLE [dbo].[userPromotion]  WITH CHECK ADD  CONSTRAINT [FK_userPromotion_promotion_PromotionId] FOREIGN KEY([PromotionId])
REFERENCES [dbo].[promotion] ([PromotionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[userPromotion] CHECK CONSTRAINT [FK_userPromotion_promotion_PromotionId]
GO
ALTER TABLE [dbo].[userPromotion]  WITH CHECK ADD  CONSTRAINT [FK_userPromotion_users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[userPromotion] CHECK CONSTRAINT [FK_userPromotion_users_UserId]
GO
USE [master]
GO
ALTER DATABASE [noi_that] SET  READ_WRITE 
GO
