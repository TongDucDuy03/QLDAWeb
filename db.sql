USE [MyDoreamonStore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/25/2024 9:40:04 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 2/25/2024 9:40:04 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 2/25/2024 9:40:04 PM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/25/2024 9:40:04 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 2/25/2024 9:40:04 PM ******/
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
/****** Object:  Table [dbo].[Series]    Script Date: 2/25/2024 9:40:04 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2/25/2024 9:40:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[UserEmail] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240224090514_UpdateUser', N'8.0.1')
GO
INSERT [dbo].[Cart] ([ProductId], [UserId], [Quantity]) VALUES (3, 2, 9)
INSERT [dbo].[Cart] ([ProductId], [UserId], [Quantity]) VALUES (6, 2, 11)
INSERT [dbo].[Cart] ([ProductId], [UserId], [Quantity]) VALUES (8, 2, 12)
INSERT [dbo].[Cart] ([ProductId], [UserId], [Quantity]) VALUES (15, 2, 1)
INSERT [dbo].[Cart] ([ProductId], [UserId], [Quantity]) VALUES (65, 2, 2)
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (3, N'DORAEMON TRUYỆN NGẮN - TẬP 1
', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/1_9544a3ba5bd64806ab59f7fd9fafcf13_ea18ba498dbf48458655f34dd7c049e8_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (6, N'DORAEMON TRUYỆN NGẮN - TẬP 2
', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/2_59a0dfb7943f48c6ba247935d05c25f4_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (8, N'DORAEMON TRUYỆN NGẮN - TẬP 3
', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/3_e53adee87c4e4779b4fea9e4a4e38459_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (10, N'DORAEMON TRUYỆN DÀI - TẬP 1 - CHÚ KHỦNG LONG CỦA NOBITA', N'“Chú khủng long của Nobita” là tác phẩm mở đầu cho xêri Doraemon truyện dài, và đã được chuyển thể thành phim hoạt hình.
Trong tác phẩm này, 5 người nhóm bạn Doraemon đã ngược dòng thời gian, trở về thế giới khủng long Kỉ Bạch Á. Tất cả đã sát cánh bên nhau trải qua bao nhiêu sóng gió hiểm nguy để bảo vệ chú khủng long mới nở Pisuke.
Các em hãy cùng dõi theo câu chuyện phiêu lưu đầy tình thương yêu và tình bạn này nhé!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/1_b7e049659e234c1bb108c966a9a90621_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (12, N'DORAEMON TRUYỆN DÀI - TẬP 2 - NOBITA VÀ LỊCH SỬ KHAI PHÁ VŨ TRỤ', N'“Nobita và lịch sử khai phá vũ trụ” là tác phẩm thứ 2 trong xêri Doraemon truyện dài, và cũng đã được chuyển thể thành phim hoạt hình.
Ở trên trái đất, Nobita hậu đậu làm việc gì cũng thất bại, nhưng khi đến hành tinh Koyakoya nơi lực hút rất yếu thì cậu bỗng trở nên mạnh mẽ phi thường. Bằng sức mạnh ấy, Nobita đã chiến đấu với bọn người xấu để bảo vệ hòa bình cho hành tinh này.
Tập truyện sẽ đưa chúng ta bước vào vũ trụ bao la rộng lớn, và chắc chắn các em sẽ vô cùng cảm động trước những hành động dũng cảm của Nobita, Doraemon cùng các bạn!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/2_18d9073704a64be4a8da85cbcb6a9fb4_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (14, N'DORAEMON TRUYỆN NGẮN - TẬP 4', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/4_70e08fe22f5845109d0f94ea9e1dd093_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (15, N'DORAEMON TRUYỆN NGẮN - TẬP 5
', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/5_f4771034b6f8429798dad32010f37213_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (16, N'DORAEMON TRUYỆN NGẮN - TẬP 6
', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/6_9879230e6c3943fcba0fabf75fdaf54c_0807d39e42d34af9acdd8eb4ef3d2b6f_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (17, N'DORAEMON TRUYỆN NGẮN - TẬP 7
', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/7_d0679027f89245489635bedcc41cdd7b_df8ff6f3c4794ed092cda80b15b348e1_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (18, N'DORAEMON TRUYỆN DÀI - TẬP 3 - NOBITA THÁM HIỂM VÙNG ĐẤT MỚI', N'“Nobita thám hiểm vùng đất mới” là tác phẩm thứ 3 trong xêri Doraemon truyện dài, và cũng là tác phẩm đã được chuyển thể thành phim hoạt hình.
Câu chuyện xảy ra trên trái đất thời hiện đại, tại một vùng đất xa xôi nằm sâu trong lục địa Châu Phi. Nhóm bạn Doraemon đã không quản hiểm nguy, lên đường đi tìm lời giải đáp cho bí mật về pho tượng thần khổng lồ. Đặc biệt lần này, cả nhóm hầu như phải tự lực cánh sinh, bởi các bảo bối không giúp được gì mấy.
Nào, chúng ta cùng theo chân nhóm bạn Doraemon, bước vào cuộc hành trình đầy thử thách này nhé!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/3_3eed061920534fa7834885a04656db05_b70cd32c59264117b316de9b83404a55_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (19, N'DORAEMON TRUYỆN DÀI - TẬP 4 - NOBITA VÀ LÂU ĐÀI DƯỚI ĐÁY BIỂN', N'Các em đang cầm trên tay nguyên tác của bộ phim hoạt hình “Nobita và lâu đài dưới đáy biển” được công chiếu vào năm 1984. Đây là tác phẩm thứ 4 trong xêri Doraemon truyện dài, và cũng là câu chuyện lấy bối cảnh về đại dương đầu tiên của tôi.
Dưới đáy đại dương sâu thẳm, nhóm bạn Nobita phải đương đầu với mối nguy hiểm đe dọa toàn thể sinh vật trên trái đất. Các em hãy cùng tham gia vào chuyến phiêu lưu li kì ở vùng biển huyền bí này để được sống trong những giây phút hồi hộp và hùng tráng nhé!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/4_cd3218616775408c841a4571e63dccc4_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (21, N'DORAEMON TRUYỆN DÀI - TẬP 5 - NOBITA VÀ CHUYẾN PHIÊU LƯU VÀO XỨ QUỶ ', N'Tập truyện “Nobita và chuyến phiêu lưu vào xứ quỷ” là nguyên tác của bộ phim hoạt hình cùng tên. Câu chuyện lấy bối cảnh là một thế giới phép thuật do Nobita tạo ra, thế giới này tồn tại song song với thế giới hiện thực. Tại đây, nhóm bạn Doraemon, Nobita đã chiến đấu anh dũng để cứu trái đất khỏi mối nguy hiểm cận kề. Chúng ta hãy bước vào thế giới phép thuật kì lạ này và phiêu lưu cùng nhóm bạn Doraemon nhé!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/5_8900f271f70742d39ebbd4243cef544b_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (22, N'DORAEMON TRUYỆN DÀI - TẬP 6 - NOBITA VÀ CUỘC CHIẾN VŨ TRỤ', N'Các em đang cầm trên tay nguyên tác của bộ phim hoạt hình “Nobita và cuộc chiến vũ trụ” được công chiếu vào mùa xuân năm 1985, đây là tác phẩm thứ 6 trong xêri Doraemon truyện dài.
Lần này, một người vũ trụ tí hon đã xuất hiện và đưa nhóm bạn Doraemon bước vào chuyến phiêu lưu mới ở hành tinh Pirika xa lạ. Cả nhóm Doraemon đã tự biến mình thành tí hon bằng đèn pin thu nhỏ và chiến đấu rất anh dũng. Nào, chúng ta hãy cùng theo dõi nhé!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/6_c118ae7e2ddf43738189673b23a5029a_dc27529282e0479ca203aa2830813a41_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (23, N'DORAEMON TRUYỆN DÀI - TẬP 7 - NOBITA VÀ BINH ĐOÀN NGƯỜI SẮT', N'Đây là tác phẩm thứ 7 trong xêri Doraemon truyện dài. Một chuyến phiêu lưu mới lại bắt đầu với “Doraemon” – nhân vật của cả cuộc đời tôi!
Trong tác phẩm này, Nobita và các bạn đã hợp sức đánh đuổi Binh đoàn người sắt – những kẻ từ vũ trụ tới trái đất với dã tâm biến người địa cầu thành nô lệ. Tôi đã khắc họa câu chuyện nổi bật lên là lòng dũng cảm và tình bạn cao cả của những cô bé cậu bé phi thường.', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/7_108bf31287d94f80a075bd9c4ed7fd2d_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (25, N'DORAEMON TRUYỆN NGẮN - TẬP 8
', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/8_962efffde6de44659185b8b6e7fdb9eb_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (27, N'DORAEMON TRUYỆN NGẮN - TẬP 9', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/9_e03b5db8dca0498cafc3e5073b0cdfed_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (28, N'DORAEMON TRUYỆN NGẮN - TẬP 10', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/10_b80c99069c0d4e6a8e307b24ed0e930e_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (29, N'DORAEMON TRUYỆN NGẮN - TẬP 11', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/11_32c0b432f1b64102bb51ef57156f9a63_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (30, N'DORAEMON TRUYỆN NGẮN - TẬP 12', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/12_0cb5f1a2e9624a1f9490d8acc4caebaf_389a725001ed45ff873ab5a5ddbd79e7_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (31, N'DORAEMON TRUYỆN NGẮN - TẬP 13', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/13_938b5fb005434ce3bb119e2d7c9bad61_05a6c2e833b0429f82d0712421508577_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (32, N'DORAEMON TRUYỆN NGẮN - TẬP 14', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/14_42fd3e6b8d8746048cb5c9061adf5699_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (33, N'DORAEMON TRUYỆN NGẮN - TẬP 15', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/15_cdba94a94a42491da3525b98ae1389ed_d28f3ecf7c3547e89f3b2d947b94b192_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (34, N'DORAEMON TRUYỆN NGẮN - TẬP 16', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/16_68fac01a136b4aa4aeeef748f102dbe5_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (35, N'DORAEMON TRUYỆN NGẮN - TẬP 17', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/17_f8450e2dd160491c974e5bcb008394ea_5ba1bea267514026a6478f85b1e48b34_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (36, N'DORAEMON TRUYỆN NGẮN - TẬP 18', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/18_53b5d0fd9de044ff8fe92fd5f6220a3d_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (37, N'DORAEMON TRUYỆN NGẮN - TẬP 19', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/19_fce4b40b69434ebe9b01e9aea7c10f9b_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (38, N'DORAEMON TRUYỆN NGẮN - TẬP 20', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/20_53d81502d9e24a958c0374a5e0c4a4d9_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (39, N'DORAEMON TRUYỆN NGẮN - TẬP 21', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/21_0ddf963f7387401dbfae69c98d5a0f0e_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (40, N'DORAEMON TRUYỆN NGẮN - TẬP 22', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/22_471e76ac367544b295798067775d7c79_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (41, N'DORAEMON TRUYỆN NGẮN - TẬP 23', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/23_5fe1b63f839043c59f9fc5244b763556_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (42, N'DORAEMON TRUYỆN NGẮN - TẬP 24', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/24_547178ee781f46f3954db90892519161_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (43, N'DORAEMON TRUYỆN NGẮN - TẬP 25', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/25_862a397b79f141df8d271b4189f8c340_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (44, N'DORAEMON TRUYỆN NGẮN - TẬP 26', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/26_266f6b2557ed482ab9959b71809c87ad_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (45, N'DORAEMON TRUYỆN NGẮN - TẬP 27', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/27_d55c5a3f109449d3993d7d2a537dd756_5f4ad095ec7640b395775857b25db59a_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (46, N'DORAEMON TRUYỆN NGẮN - TẬP 28', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/28_a75e3f6ae2bc4c98b3000051ebc40135_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (47, N'DORAEMON TRUYỆN NGẮN - TẬP 29', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/29_188d71b431f14e37b2177d15dde99f88_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (49, N'DORAEMON TRUYỆN NGẮN - TẬP 30', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/30_d2821aa74e6f4e9d876e33596158f20c_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (50, N'DORAEMON TRUYỆN NGẮN - TẬP 31', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/31_dcc4ce2cbefa4140a3045fbcb4f1a5eb_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (51, N'DORAEMON TRUYỆN NGẮN - TẬP 32', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/32_f97b2cd87f3a44a3886a8c213c579e7d_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (52, N'DORAEMON TRUYỆN NGẮN - TẬP 33', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/33_1a3c9bf9dbda4d898c46040879ea6d4b_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (53, N'DORAEMON TRUYỆN NGẮN - TẬP 34', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/34_b056f58c02ca4abbba263d5dc488f4e1_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (54, N'DORAEMON TRUYỆN NGẮN - TẬP 35', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/35_a65505b9a9aa4b94b95522d822de589b_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (55, N'DORAEMON TRUYỆN NGẮN - TẬP 36', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/36_580c6330bb5b41b59bc0f70e99627e35_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (56, N'DORAEMON TRUYỆN NGẮN - TẬP 37', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/37_9e8431a55bbf4034a7eba968fe8d2e1b_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (57, N'DORAEMON TRUYỆN NGẮN - TẬP 38', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/38_a8d6078e5f54459e926f4243706cd0c5_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (58, N'DORAEMON TRUYỆN NGẮN - TẬP 39', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/39_d88eab85fc4445d9a987c10b55f0b586_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (59, N'DORAEMON TRUYỆN NGẮN - TẬP 40', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/40_60c041f35c6f44d4b28081d2a0b4f139_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (60, N'DORAEMON TRUYỆN NGẮN - TẬP 41', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/41_e96c6d4b7d804a67b4ea2d892f546a54_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (61, N'DORAEMON TRUYỆN NGẮN - TẬP 42', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/42_a01571babdb54175b0d50acb8c897774_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (62, N'DORAEMON TRUYỆN NGẮN - TẬP 43', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/43_394c173196744729a147edd3d577c44b_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (63, N'DORAEMON TRUYỆN NGẮN - TẬP 44', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/44_6a61ccbacff040ceab7608d2d982bae6_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (64, N'DORAEMON TRUYỆN NGẮN - TẬP 45', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

TÁC GIẢ - HỌA SĨ FUJIKO F FUJIO 
Tên thật là Fujimoto Hiroshi. Ông sinh ngày 1 tháng 12 năm 1933 tại tỉnh Toyama, Nhật Bản. Năm 1951 ông cho ra đời tác phẩm đầu tay “Thiên thần Tama” (đăng dài kì trên báo học sinh tiểu học hằng ngày).
Sau đó, ông công bố các tác phẩm sáng tác cùng Abiko Motoo với bút danh “Fujiko Fujio”.
Năm 1987, ông ngừng hợp tác với Abiko, lấy bút danh là FUJIKO F FUJIO và bắt đầu chuyển sang sáng tác truyện tranh hướng tới đối tượng nhi đồng.
Những tác phẩm tiêu biểu nhất có thể kể đến là “Doraemon”, “Con ma Q-taro (chung bút danh)”, “Perman-Cậu bé siêu nhân”, “Cuốn từ điển kì bí”, “Siêu nhân Mami”…

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/45_371246c6fb3c49d8999f817550cea614_master.jpg', 1, NULL, 1, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (65, N'DORAEMON PLUS - TẬP 1
', N'Dù bạn có là ai, có đọc bao nhiêu lần thì vẫn thấy thú vị!! Vượt qua thời gian, vượt qua thế hệ, đây là danh tác luôn được yêu quý và đón nhận!! Doraemon Plus là tuyển tập những truyện ngắn về Doraemon và các bạn của tác giả Fujiko F Fujio từng được đăng rải rác trên các tạp chí học tập Nhật Bản.

Doraemon Plus tập hợp những truyện ngắn chưa từng có trong bộ truyện Doraemon 45 tập đã rất quen thuộc với tất cả chúng ta. Đặc biệt Doraemon Plus tập 6 còn giới thiệu 21 truyện ngắn cực kì hấp dẫn và chưa từng được công bố!

Đừng bỏ lỡ ấn bản giới hạn siêu siêu đẹp và thú vị này nhé!!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/1_06489b8d0994463a8cbdc9287f287113_master.jpg', 1, NULL, 3, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Series] ON 

INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (1, N'Doraemon truyện ngắn')
INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (2, N'Doraemon truyện dài')
INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (3, N'Doraemon Plus')
SET IDENTITY_INSERT [dbo].[Series] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserName], [UserEmail], [Password], [Phone], [Address], [Status]) VALUES (2, N'duc', NULL, N'a', N'1', N'a', 1)
INSERT [dbo].[User] ([UserId], [UserName], [UserEmail], [Password], [Phone], [Address], [Status]) VALUES (6, N'tam', NULL, N'a', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
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
