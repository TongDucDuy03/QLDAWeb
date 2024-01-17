USE [master]
GO
/****** Object:  Database [MyDoreamonStore]    Script Date: 1/17/2024 10:42:35 PM ******/
CREATE DATABASE [MyDoreamonStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyDoreamonStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MyDoreamonStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyDoreamonStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MyDoreamonStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MyDoreamonStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyDoreamonStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyDoreamonStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MyDoreamonStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyDoreamonStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyDoreamonStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MyDoreamonStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyDoreamonStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyDoreamonStore] SET  MULTI_USER 
GO
ALTER DATABASE [MyDoreamonStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyDoreamonStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyDoreamonStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyDoreamonStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyDoreamonStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyDoreamonStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyDoreamonStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [MyDoreamonStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MyDoreamonStore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/17/2024 10:42:35 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 1/17/2024 10:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderDate] [datetime2](7) NULL,
	[DeliveryDate] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 1/17/2024 10:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[DiscountPrice] [float] NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/17/2024 10:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[DiscountPrice] [float] NOT NULL,
	[ImagesUrl] [nvarchar](max) NULL,
	[Status] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NULL,
	[Series_Id] [int] NULL,
	[UpdatedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Series]    Script Date: 1/17/2024 10:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Series](
	[Series_Id] [int] IDENTITY(1,1) NOT NULL,
	[Series_Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Series] PRIMARY KEY CLUSTERED 
(
	[Series_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/17/2024 10:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[UserEmail] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240111183009_DbInit', N'8.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240113174242_AddDB', N'8.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240116074822_fix', N'8.0.1')
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (3, N'Doremon Tập 1', N'Doremon đã đến với Nobita như thế nào
Chạy trời không khỏi nắng
Bánh quy biến hình
Câu chuyện cái bình bể
Ống sáo thần
Trở về thời xa xưa
Cào cào giúp hối cải
Tổ tiên của chúng mình
Bóng thay người
Thỏi son ngọt ngào
Cây bút thần kỳ
Ai cầu hôn trước
Quyển sổ như ý
Kem chống rét
Cây đèn thần
Nghệ thuật đi cà kheo', 20, 16000, 0, N'https://dorahome.info/wp-content/uploads/2021/08/truyen-ngan-doremon-doc-xuoi-1996-vol-01.jpg.webp', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (6, N'Doremon Tập 2', N'Bánh mỳ giúp trí nhớ
Bạn tri âm
Thi kể chuyện ma
Giấc mơ làm đại ka
Ơn nghĩa sinh thành
Búp bê tự thú
Khăn quàng bay
Gương nịnh hót
Chiếc khăn ảo thuật
Doremon làm thầy bói
Người bạn của sói
Nam châm rắc rối
Con tàu trong lòng đất
“Muốn ăn thì lăn vào bếp”
Bộ truyền cảm
Bàn tập trượt tuyết
Săn khủng long
Trạm bưu điện hỏa tốc', 30, 16000, 20, N'https://dorahome.info/wp-content/uploads/2021/08/truyen-ngan-doremon-doc-xuoi-1996-vol-02.jpg.webp', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (8, N'Doremon Tập 3', N'Nghệ thuật làm tranh truyện
Lịch đổi ngày
Đổi mẹ cho nhau
Nobita thám tử đại tài
Đồng hồ kế hoạch
Cá tháng tư
Siêu nhân Nobita
Tiền lãi ngân hàng
Búp bê cố vấn
Cây bút chì phù thủy
Những nhà tạo mốt
Mũi tên kết nghĩa
Thành phố tùy ý muốn
Thuốc viên như ý
Gia sư tuyệt vời
Cô gái giống hoa bách hợp
Trò chơi cổ tích
Con chó của Xuka', 40, 20000, 30, N'https://dorahome.info/wp-content/uploads/2021/08/truyen-ngan-doremon-doc-xuoi-1996-vol-03.jpg.webp', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (10, N'Doraemon: Thăm công viên khủng long', N'Thăm công viên khủng long bắt đầu khi Nobita tình cờ nhặt được một quả trứng khủng long hóa thạch, sau đó dùng khăn trùm thời gian đưa quả trứng về thời điểm 100 triệu năm trước rồi cho ấp nở. Không lâu sau một chú khủng long vô cùng đáng yêu ra đời và được đặt tên là Pisu. Nhưng khi chú lớn lên, làm sao Nobita có thể tiếp tục nuôi chú trong nhà? Hành trình đưa Pisu trở về thời cổ đại hóa ra lại không hề đơn giản…', 100, 20000, 40, N'https://dorahome.info/wp-content/uploads/2021/09/truyen-dai-doremon-doc-xuoi-tham-cong-vien-khung-long.jpg.webp', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (12, N'Doraemon: í mật hành tinh màu tím', N'Bí mật hành tinh màu tím bắt nguồn từ một lần vô tình, 2 người bạn Rap và Sami lạc chân đến Trái Đất, sau đó được Doremon giúp sửa chữa con tàu rồi trở về nhà. Khi bị Chaien và Xeko bắt tìm sân chơi, Nobita rủ cả nhóm bạn lên quê hương của Rap. Tưởng chừng đó là một nơi lý tưởng để chơi đùa, nhưng bất ngờ một bọn người xấu xuất hiện, bí mật hành tinh màu tìm dần được hé lộ…', 120, 16000, 20, N'https://dorahome.info/wp-content/uploads/2021/09/truyen-dai-doremon-doc-xuoi-bi-mat-hanh-tinh-mau-tim.jpg.webp', 1, NULL, 2, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Series] ON 

INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (1, N'Truyện ngắn')
INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (2, N'Truyện dài')
SET IDENTITY_INSERT [dbo].[Series] OFF
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getutcdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Series] FOREIGN KEY([Series_Id])
REFERENCES [dbo].[Series] ([Series_Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Series]
GO
USE [master]
GO
ALTER DATABASE [MyDoreamonStore] SET  READ_WRITE 
GO
