USE [master]
GO
/****** Object:  Database [MyDoreamonStore]    Script Date: 1/21/2024 10:56:59 PM ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/21/2024 10:57:00 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 1/21/2024 10:57:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ProductId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/21/2024 10:57:00 PM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 1/21/2024 10:57:00 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 1/21/2024 10:57:00 PM ******/
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
/****** Object:  Table [dbo].[Series]    Script Date: 1/21/2024 10:57:00 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 1/21/2024 10:57:00 PM ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240119162432_thembanggiohang', N'8.0.1')
GO
INSERT [dbo].[Cart] ([ProductId], [UserId], [Quantity]) VALUES (3, 2, 15)
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
Nghệ thuật đi cà kheo', 20, 16000, 10, N'https://static.wikia.nocookie.net/dorepedia/images/9/9b/Bia-tap-1-truyen-ngan.jpg/revision/latest/scale-to-width-down/400?cb=20190718084822&path-prefix=vi', 1, NULL, 1, NULL)
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
Trạm bưu điện hỏa tốc', 30, 16000, 10, N'https://static.wikia.nocookie.net/dorepedia/images/a/a8/Bia-tap-2.jpg/revision/latest?cb=20190724143807&path-prefix=vi', 1, NULL, 1, NULL)
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
Con chó của Xuka', 40, 16000, 10, N'https://static.wikia.nocookie.net/dorepedia/images/8/84/Bia-tap-3-truyen-ngan.jpg/revision/latest/scale-to-width-down/400?cb=20190724144118&path-prefix=vi', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (10, N'DORAEMON TRUYỆN DÀI - TẬP 1 - CHÚ KHỦNG LONG CỦA NOBITA', N'“Chú khủng long của Nobita” là tác phẩm mở đầu cho xêri Doraemon truyện dài, và đã được chuyển thể thành phim hoạt hình.
Trong tác phẩm này, 5 người nhóm bạn Doraemon đã ngược dòng thời gian, trở về thế giới khủng long Kỉ Bạch Á. Tất cả đã sát cánh bên nhau trải qua bao nhiêu sóng gió hiểm nguy để bảo vệ chú khủng long mới nở Pisuke.
Các em hãy cùng dõi theo câu chuyện phiêu lưu đầy tình thương yêu và tình bạn này nhé!', 100, 20000, 30, N'https://product.hstatic.net/200000343865/product/1_b7e049659e234c1bb108c966a9a90621_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (12, N'DORAEMON TRUYỆN DÀI - TẬP 2 - NOBITA VÀ LỊCH SỬ KHAI PHÁ VŨ TRỤ', N'“Nobita và lịch sử khai phá vũ trụ” là tác phẩm thứ 2 trong xêri Doraemon truyện dài, và cũng đã được chuyển thể thành phim hoạt hình.
Ở trên trái đất, Nobita hậu đậu làm việc gì cũng thất bại, nhưng khi đến hành tinh Koyakoya nơi lực hút rất yếu thì cậu bỗng trở nên mạnh mẽ phi thường. Bằng sức mạnh ấy, Nobita đã chiến đấu với bọn người xấu để bảo vệ hòa bình cho hành tinh này.
Tập truyện sẽ đưa chúng ta bước vào vũ trụ bao la rộng lớn, và chắc chắn các em sẽ vô cùng cảm động trước những hành động dũng cảm của Nobita, Doraemon cùng các bạn!', 120, 20000, 20, N'https://product.hstatic.net/200000343865/product/2_18d9073704a64be4a8da85cbcb6a9fb4_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (14, N'Doremon Tập 4', N'Máy ảnh ma thuật
Cầu gì được nấy
Đạo quân đồ chơi
Đũa thần thay đổi tính năng
Chuyến đi bộ qua biển
Tiếng dế trong đêm
Máy thay đổi dung nhan
Những kẻ mê tiền
Máy thu phục cảm tình
Trái đất bị lụt
Ống nhòm xuyên tường
Tiếng hát hơi ga
Kho tàng bị mất
Báu vật bị đánh cắp
Máy ghi âm bằng hơi nước
Người vô hình
Ba đỏ một đen
Bà ngoại', 120, 16000, 10, N'https://static.wikia.nocookie.net/dorepedia/images/3/3b/Bia-truyen-ngan-tap-4.jpg/revision/latest?cb=20190724144200&path-prefix=vi', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (15, N'Doremon Tập 5', N'Chậm, nhanh – nhanh, chậm
Buổi tất niên đáng nhớ
Trái đất thu nhỏ
Chiếc gương nhân đôi
Ông khách đãng trí
Ống tiền tham lam
Chỉ vì cái bánh rán
Tay đua số một
Lạc vào thành phố cổ
Tấm vải hộ thân
Bộ sưu tập huy hiệu
Bể bơi tưởng tượng
Hơi ga phát triển
Gối ước mơ
Võ sĩ đai đen
Tấm vé số độc đắc
Đường dây kỳ lạ
Chú voi của bác Nobiro', 100, 16000, 10, N'https://static.wikia.nocookie.net/dorepedia/images/3/3d/Bia-truyen-ngan-tap-5.jpg/revision/latest/scale-to-width-down/400?cb=20191222073656&path-prefix=vi', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (16, N'Doremon Tập 6', N'Thức đêm mới biết đêm dài
Vi rút đua đòi
Chuyến du lịch miễn phí
Sân trượt tuyết trong hộp
Bộ sưu tập sinh động
Bức tranh vô giá
Lồng đèn cá chép
Thà thú tội còn hơn
Khẩu súng thần công
Cô bé đi giày đỏ
Chiếc mũ thiện xạ
Nhà thám hiểm nhát gan
Chuyến du lịch bằng tàu ngầm
Quái vật hồ Lốc-nét
Bé bão anh hùng
Thuốc thay đổi tính nết
Đi tìm cô dâu tương lai
Tạm biệt Doremon
Phụ lục: Những bảo bối của Doremon', 100, 16000, 10, N'https://static.wikia.nocookie.net/dorepedia/images/5/5a/Bia-truyen-ngan-tap-6.jpg/revision/latest/scale-to-width-down/400?cb=20191222073748&path-prefix=vi', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (17, N'Doremon Tập 7', N'Doremon trở về
Những người lùn giúp việc
Thủ quân Nobita
Nuôi cá không cần hồ
Sức mạnh của tình yêu
Chuyến du lịch bằng máy ảnh
Truy tìm chiếc nhẫn kim cương bị mất
Đồng hồ báo nguy
Dùng bom diệt chuột
Đơn đặt hàng thế kỷ tương lai
Trở về thời tiền sử
Thuốc phóng đại thói hư tật xấu
Máy hòa nhập
Chiếc mũ thôi miên
Người máy kiểm tra
Hồ ly Nobita
Thẩm mỹ viện Nobita
Sợi dây nhạc
Bí mật thung lũng Takai', 100, 16000, 10, N'https://static.wikia.nocookie.net/dorepedia/images/e/e0/Bia-truyen-ngan-tap-7.jpg/revision/latest/scale-to-width-down/400?cb=20220315141018&path-prefix=vi', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (18, N'DORAEMON TRUYỆN DÀI - TẬP 3 - NOBITA THÁM HIỂM VÙNG ĐẤT MỚI', N'“Nobita thám hiểm vùng đất mới” là tác phẩm thứ 3 trong xêri Doraemon truyện dài, và cũng là tác phẩm đã được chuyển thể thành phim hoạt hình.
Câu chuyện xảy ra trên trái đất thời hiện đại, tại một vùng đất xa xôi nằm sâu trong lục địa Châu Phi. Nhóm bạn Doraemon đã không quản hiểm nguy, lên đường đi tìm lời giải đáp cho bí mật về pho tượng thần khổng lồ. Đặc biệt lần này, cả nhóm hầu như phải tự lực cánh sinh, bởi các bảo bối không giúp được gì mấy.
Nào, chúng ta cùng theo chân nhóm bạn Doraemon, bước vào cuộc hành trình đầy thử thách này nhé!', 100, 16000, 10, N'https://product.hstatic.net/200000343865/product/3_3eed061920534fa7834885a04656db05_b70cd32c59264117b316de9b83404a55_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (19, N'DORAEMON TRUYỆN DÀI - TẬP 4 - NOBITA VÀ LÂU ĐÀI DƯỚI ĐÁY BIỂN', N'Các em đang cầm trên tay nguyên tác của bộ phim hoạt hình “Nobita và lâu đài dưới đáy biển” được công chiếu vào năm 1984. Đây là tác phẩm thứ 4 trong xêri Doraemon truyện dài, và cũng là câu chuyện lấy bối cảnh về đại dương đầu tiên của tôi.
Dưới đáy đại dương sâu thẳm, nhóm bạn Nobita phải đương đầu với mối nguy hiểm đe dọa toàn thể sinh vật trên trái đất. Các em hãy cùng tham gia vào chuyến phiêu lưu li kì ở vùng biển huyền bí này để được sống trong những giây phút hồi hộp và hùng tráng nhé!', 100, 16000, 10, N'https://product.hstatic.net/200000343865/product/4_cd3218616775408c841a4571e63dccc4_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (21, N'DORAEMON TRUYỆN DÀI - TẬP 5 - NOBITA VÀ CHUYẾN PHIÊU LƯU VÀO XỨ QUỶ ', N'Tập truyện “Nobita và chuyến phiêu lưu vào xứ quỷ” là nguyên tác của bộ phim hoạt hình cùng tên. Câu chuyện lấy bối cảnh là một thế giới phép thuật do Nobita tạo ra, thế giới này tồn tại song song với thế giới hiện thực. Tại đây, nhóm bạn Doraemon, Nobita đã chiến đấu anh dũng để cứu trái đất khỏi mối nguy hiểm cận kề. Chúng ta hãy bước vào thế giới phép thuật kì lạ này và phiêu lưu cùng nhóm bạn Doraemon nhé!', 100, 16000, 10, N'https://product.hstatic.net/200000343865/product/5_8900f271f70742d39ebbd4243cef544b_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (22, N'DORAEMON TRUYỆN DÀI - TẬP 6 - NOBITA VÀ CUỘC CHIẾN VŨ TRỤ', N'Các em đang cầm trên tay nguyên tác của bộ phim hoạt hình “Nobita và cuộc chiến vũ trụ” được công chiếu vào mùa xuân năm 1985, đây là tác phẩm thứ 6 trong xêri Doraemon truyện dài.
Lần này, một người vũ trụ tí hon đã xuất hiện và đưa nhóm bạn Doraemon bước vào chuyến phiêu lưu mới ở hành tinh Pirika xa lạ. Cả nhóm Doraemon đã tự biến mình thành tí hon bằng đèn pin thu nhỏ và chiến đấu rất anh dũng. Nào, chúng ta hãy cùng theo dõi nhé!', 100, 16000, 10, N'https://product.hstatic.net/200000343865/product/6_c118ae7e2ddf43738189673b23a5029a_dc27529282e0479ca203aa2830813a41_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (23, N'DORAEMON TRUYỆN DÀI - TẬP 7 - NOBITA VÀ BINH ĐOÀN NGƯỜI SẮT', N'Đây là tác phẩm thứ 7 trong xêri Doraemon truyện dài. Một chuyến phiêu lưu mới lại bắt đầu với “Doraemon” – nhân vật của cả cuộc đời tôi!
Trong tác phẩm này, Nobita và các bạn đã hợp sức đánh đuổi Binh đoàn người sắt – những kẻ từ vũ trụ tới trái đất với dã tâm biến người địa cầu thành nô lệ. Tôi đã khắc họa câu chuyện nổi bật lên là lòng dũng cảm và tình bạn cao cả của những cô bé cậu bé phi thường.', 100, 16000, 10, N'https://product.hstatic.net/200000343865/product/7_108bf31287d94f80a075bd9c4ed7fd2d_master.jpg', 1, NULL, 2, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Series] ON 

INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (1, N'Truyện ngắn')
INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (2, N'Truyện dài')
SET IDENTITY_INSERT [dbo].[Series] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [UserEmail], [Password], [Phone], [Address], [Status]) VALUES (2, N'duc', NULL, N'a', N'1', N'a', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [IX_Cart_UserId]    Script Date: 1/21/2024 10:57:00 PM ******/
CREATE NONCLUSTERED INDEX [IX_Cart_UserId] ON [dbo].[Cart]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getutcdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
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
