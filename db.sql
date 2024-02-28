USE [MyDoreamonStore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/28/2024 3:48:13 PM ******/
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
/****** Object:  Table [dbo].[Cart]    Script Date: 2/28/2024 3:48:13 PM ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 2/28/2024 3:48:13 PM ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2/28/2024 3:48:13 PM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 2/28/2024 3:48:13 PM ******/
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
/****** Object:  Table [dbo].[Series]    Script Date: 2/28/2024 3:48:13 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 2/28/2024 3:48:13 PM ******/
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
INSERT [dbo].[Cart] ([ProductId], [UserId], [Quantity]) VALUES (3, 2, 3)
INSERT [dbo].[Cart] ([ProductId], [UserId], [Quantity]) VALUES (6, 2, 4)
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
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (66, N'DORAEMON PLUS - TẬP 2', N'Dù bạn có là ai, có đọc bao nhiêu lần thì vẫn thấy thú vị!! Vượt qua thời gian, vượt qua thế hệ, đây là danh tác luôn được yêu quý và đón nhận!! Doraemon Plus là tuyển tập những truyện ngắn về Doraemon và các bạn của tác giả Fujiko F Fujio từng được đăng rải rác trên các tạp chí học tập Nhật Bản.

Doraemon Plus tập hợp những truyện ngắn chưa từng có trong bộ truyện Doraemon 45 tập đã rất quen thuộc với tất cả chúng ta. Đặc biệt Doraemon Plus tập 6 còn giới thiệu 21 truyện ngắn cực kì hấp dẫn và chưa từng được công bố!

Đừng bỏ lỡ ấn bản giới hạn siêu siêu đẹp và thú vị này nhé!!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/2_81847d3601e84e33947cdbdab2de0fa6_master.jpg', 1, NULL, 3, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (68, N'DORAEMON PLUS - TẬP 3', N'Dù bạn có là ai, có đọc bao nhiêu lần thì vẫn thấy thú vị!! Vượt qua thời gian, vượt qua thế hệ, đây là danh tác luôn được yêu quý và đón nhận!! Doraemon Plus là tuyển tập những truyện ngắn về Doraemon và các bạn của tác giả Fujiko F Fujio từng được đăng rải rác trên các tạp chí học tập Nhật Bản.

Doraemon Plus tập hợp những truyện ngắn chưa từng có trong bộ truyện Doraemon 45 tập đã rất quen thuộc với tất cả chúng ta. Đặc biệt Doraemon Plus tập 6 còn giới thiệu 21 truyện ngắn cực kì hấp dẫn và chưa từng được công bố!

Đừng bỏ lỡ ấn bản giới hạn siêu siêu đẹp và thú vị này nhé!!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/3_a5c82503d9134f579c61652514fb7ad0_master.jpg', 1, NULL, 3, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (69, N'DORAEMON PLUS - TẬP 4', N'Dù bạn có là ai, có đọc bao nhiêu lần thì vẫn thấy thú vị!! Vượt qua thời gian, vượt qua thế hệ, đây là danh tác luôn được yêu quý và đón nhận!! Doraemon Plus là tuyển tập những truyện ngắn về Doraemon và các bạn của tác giả Fujiko F Fujio từng được đăng rải rác trên các tạp chí học tập Nhật Bản.

Doraemon Plus tập hợp những truyện ngắn chưa từng có trong bộ truyện Doraemon 45 tập đã rất quen thuộc với tất cả chúng ta. Đặc biệt Doraemon Plus tập 6 còn giới thiệu 21 truyện ngắn cực kì hấp dẫn và chưa từng được công bố!

Đừng bỏ lỡ ấn bản giới hạn siêu siêu đẹp và thú vị này nhé!!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/4_80d9fdc5eab64df29885417daf6a0c45_master.jpg', 1, NULL, 3, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (70, N'DORAEMON PLUS - TẬP 5', N'
Dù bạn có là ai, có đọc bao nhiêu lần thì vẫn thấy thú vị!! Vượt qua thời gian, vượt qua thế hệ, đây là danh tác luôn được yêu quý và đón nhận!! Doraemon Plus là tuyển tập những truyện ngắn về Doraemon và các bạn của tác giả Fujiko F Fujio từng được đăng rải rác trên các tạp chí học tập Nhật Bản.

Doraemon Plus tập hợp những truyện ngắn chưa từng có trong bộ truyện Doraemon 45 tập đã rất quen thuộc với tất cả chúng ta. Đặc biệt Doraemon Plus tập 6 còn giới thiệu 21 truyện ngắn cực kì hấp dẫn và chưa từng được công bố!

Đừng bỏ lỡ ấn bản giới hạn siêu siêu đẹp và thú vị này nhé!!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/5_26df3b2457224519b817fa1197aa3927_master.jpg', 1, NULL, 3, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (71, N'DORAEMON PLUS - TẬP 6', N'
Dù bạn có là ai, có đọc bao nhiêu lần thì vẫn thấy thú vị!! Vượt qua thời gian, vượt qua thế hệ, đây là danh tác luôn được yêu quý và đón nhận!! Doraemon Plus là tuyển tập những truyện ngắn về Doraemon và các bạn của tác giả Fujiko F Fujio từng được đăng rải rác trên các tạp chí học tập Nhật Bản.

Doraemon Plus tập hợp những truyện ngắn chưa từng có trong bộ truyện Doraemon 45 tập đã rất quen thuộc với tất cả chúng ta. Đặc biệt Doraemon Plus tập 6 còn giới thiệu 21 truyện ngắn cực kì hấp dẫn và chưa từng được công bố!

Đừng bỏ lỡ ấn bản giới hạn siêu siêu đẹp và thú vị này nhé!!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/6_d91ef9bac70846f5926fd159c24d6aa9_master.jpg', 1, NULL, 3, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (77, N'DORAEMON TRUYỆN DÀI - TẬP 8 - NOBITA VÀ HIỆP SĨ RỒNG', N'
Đây là câu chuyện về cuộc phiêu lưu thần kì của nhóm bạn Nobita tới thế giới bí ẩn trong lòng đất.
Nơi họ tới chính là vương quốc của khủng long do những người lòng đất thống trị… Điều gì đang đợi Nobita và các ban?... Chúng ta hãy cùng hồi hộp theo dõi nhé!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/8_1cfe27ec18344ed7b27b50fb8170d2e8_274154b2b3024b7eab4bc2b26270f11e_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (78, N'DORAEMON TRUYỆN DÀI - TẬP 9 - NOBITA VÀ NƯỚC NHẬT THỜI NGUYÊN THỦY', N'
“Nobita và nước Nhật thời nguyên thủy” là tác phẩm đánh dấu 10 năm ra đời của xêri Doraemon truyện dài. Mỗi tác phẩm truyện dài là một câu chuyện phiêu lưu thần kì vô cùng lôi cuốn.
Lần này, nhóm bạn Doraemon đã lên cỗ máy thời gian trở về thời kì đồ đá cách đây hàng chục ngàn năm, thời mà người nguyên thủy sinh sống. Chuyến phiêu lưu của Doraemon và nhóm bạn càng lúc càng gay cấn, các em đừng bỏ lỡ nhé!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/9_c6373a0443ed49b9bdaa562f4059cb25_6a5fcb9c872f42848f4a90e4d26ddc50_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (80, N'DORAEMON TRUYỆN DÀI - TẬP 10 - NOBITA VÀ HÀNH TINH MUÔNG THÚ', N'
Cám ơn sự ủng hộ nhiệt tình của độc giả trong suốt thời gian qua. Tôi xin gửi tới các bạn tác phẩm thứ 10 thuộc xêri Doraemon truyện dài.
Lần này, nhóm bạn Nobita đã phiêu lưu tới một hành tinh cổ tích. Những gì đang chờ đợi nhóm bạn ở thế giới kì diệu ấy?... Mời tất cả các em cùng dõi theo hành trình đầy mạo hiểm này!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/10_3939be0189024370ae332845ef04cafd_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (81, N'DORAEMON TRUYỆN DÀI - TẬP 11 - NOBITA Ở XỨ SỞ NGHÌN LẺ MỘT ĐÊM', N'Câu chuyện lần này lấy bối cảnh là thế giới “Nghìn lẻ một đêm” mà tôi vô cùng yêu thích từ khi còn nhỏ. Suốt một thời gian dài, tôi đã ấp ủ dự định lồng ghép thế giới hư cấu đầy bí ẩn này vào trong thể loại truyện tranh.
Và bây giờ, mời các em cùng tham gia chuyến phiêu lưu  tới xứ sở phép thuật của nhóm bạn Doraemon!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/11_21e94a482db74aa9ab1e14c8dbc5abe6_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (82, N'DORAEMON TRUYỆN DÀI - TẬP 12 - NOBITA VÀ VƯƠNG QUỐC TRÊN MÂY', N'Fujiko F Fujio
Các em có cho rằng thiên đường tồn tại hay không? Câu chuyện lần này kể về một thế giới trên mây có người trời sinh sống. Nơi ấy là một vương quốc trong mơ có nền văn minh tiến bộ, thiên nhiên tươi đẹp, nhưng không chỉ đơn giản như thế…
Chúng ta hãy cùng dõi theo chuyến phiêu lưu kì lạ của nhóm bạn Nobita nhé!
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/12_903e4bd3ee9041629fcc7bdbdf44aaa3_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (84, N'DORAEMON TRUYỆN DÀI - TẬP 13 - NOBITA VÀ MÊ CUNG THIẾC', N'
Câu chuyện này sẽ đưa các em bước vào một thế giới đồ chơi mang đầy màu sắc bí ẩn, bắt đầu từ việc Nobita và Doraemon được mời đến nghỉ dưỡng tại một khách sạn tuyệt vời như trong mơ… Ở đó có những con búp bê bằng thiếc biết nói, biết cử động. Thực chất chúng là ai, là kẻ thù hay bạn?... Rất nhiều ẩn số đang chờ chúng ta khám phá đấy!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/13_afd28ccb6c0e4e7aaa15aa7dbaa63d8f_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (85, N'DORAEMON TRUYỆN DÀI - TẬP 14 - NOBITA VÀ BA CHÀNG HIỆP SĨ MỘNG MƠ', N'Lần này, nhóm bạn Nobita sẽ trở thành những chàng hiệp sĩ trong thế giới mộng mơ và chiến đấu vô cùng anh dũng.
Thế giới mộng mơ đang bị bọn yêu quái tà ma thống trị… Liệu Nobita và các bạn có tiêu diệt được binh đoàn yêu ma để đem lại sự bình yên cho thế giới này hay không… chúng ta cùng theo dõi nhé!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/14_9abba37d3657412bb496a51c397c07d3_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (86, N'DORAEMON TRUYỆN DÀI - TẬP 15 - ĐẤNG TOÀN NĂNG NOBITA', N'
Trong truyện này, nhóm bạn Nobita đã trở thành những vị thần tạo ra một trái đất hoàn toàn mới. Ở trái đất mới, chủng người tiến hóa từ côn trùng phát triển cực thịnh trong lòng đất, họ có một nền văn minh vượt xa thế giới loài người mặt đất. Nhưng chủng người này quyết tâm giành lại thế giới trên mặt đất… câu chuyện sẽ diễn biến ra sao? Số phận của người mặt đất thế nào?... Mời các em cùng theo dõi!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/15_803147484f9b4df192c0d3ccc4ea1199_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (87, N'DORAEMON TRUYỆN DÀI - TẬP 16 - NOBITA VÀ CHUYẾN TÀU TỐC HÀNH NGÂN HÀ', N'“Đoàn tàu bí ẩn” đã khởi hành vào vũ trụ bao la! Đích đến của đoàn tàu chính là khu vui chơi giải trí “Đảo ước mơ”. Các hành khách vô cùng thích thú vì được vui chơi thoải mái ở nhiều tiểu hành tinh khác nhau, mà không ngờ mình đang là con mồi của một loài sinh vật có tên: Yadori.
Đoàn tàu đã bị bọn Yadori phá hoại… Liệu Nobita và các bạn có thể trở về trái đất an toàn?... Chúng ta cùng tham gia vào chuyến du lịch vũ trụ mạo hiểm này nhé!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/16_08884cdf68ec482fa45c46672976958f_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (88, N'DORAEMON TRUYỆN DÀI - TẬP 17 - NOBITA VÀ CUỘC PHIÊU LƯU Ở THÀNH PHỐ DÂY CÓT', N'Xêri Doraemon truyện dài đã được xuất bản đến tập thứ 17, tôi xin cảm ơn sự ủng hộ nhiệt tình của bạn đọc suốt thời gian qua.
Lần này, nhóm Nobita đã “thổi hồn” vào những món đồ chơi vô tri vô giác và kết bạn với chúng. Tình bạn đặc biệt này giúp Nobita ngộ ra rất nhiều điều… Cụ thể như thế nào thì các em hãy đọc truyện và tìm hiểu nhé. Chắc chắn cuộc phiêu lưu của Nobita sẽ rất hấp dẫn đấy!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/17_0282e4c7e25c4f6995df9d89830dac46_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (90, N'DORAEMON TRUYỆN DÀI - TẬP 18 - NOBITA DU HÀNH BIỂN PHƯƠNG NAM', N'Đây là tác phẩm thứ 19 trong loạt phim hoạt hình "Doraemon" rất được yêu thích của tác giả Fujiko.F.Fujio, được công chiếu vào mùa xuân năm 1998. Vô tình nhặt được bản đồ kho báu, Nobita đã phát hiện ra đảo châu báu. Nhóm bạn dùng bảo bối của Doraemon, giong thuyền nhắm thẳng hướng đại dương bao la. Nhưng do biến cố của siêu không gian, mọi người đã bị lạc vào thời đại hải tặc...!?

Đây là phiên bản tranh truyện màu được vẽ lại từ tập phim hoạt hình cùng tên của tác giả Fujiko.F.Fujio.

', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/18_2564dbc9fd054f9ba8783ee1e36eed93_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (91, N'DORAEMON TRUYỆN DÀI - TẬP 19 - NOBITA - VŨ TRỤ PHIÊU LƯU KÍ', N'Mỗi tập truyện là một cuộc phưu lưu khám phá những chân trời mới lạ. Hãy để trí tưởng tượng của bạn bay bổng cùng nhóm bạn Doraemon, Nobita, Shizuka, Jaian, Suneo đến các vùng đất xa xôi, kì bí và cảm nhận những khoảnh khắc tình bạn tươi đẹp của cuộc đời!

24 tập Doraemon truyện dài phiên bản mới với nội dung và hình thức trung thành với nguyên tác của hoạ sĩ Fujiko.F.Fujio kể về 24 chuyến phiêu lưu của nhóm bạn. Những bảo bối trong chiếc túi thần kỳ của Doraemon đã biến những điều không thể thành có thể, biến ước mơ thành hiện thực.

Những chuyến phiêu lưu không bị hạn chế bởi không gian và thời gian. Đó là chuyến du hành vượt qua thời gian trở về thời tiền sử của vũ trụ (Nobita và lịch sử khai phá vũ trụ), của trái đất (Chú khủng long của Nobita), của nước Nhật (Nobita và nước Nhật thời nguyên thủy), đến tương lai (Nobita và cuộc phiêu lưu ở thành phố dây cót, Nobita và vương quốc robot)... 24 chuyến phiêu lưu của nhóm bạn có đích đến là 24 địa điểm kỳ thú, chỉ có trí tưởng tượng và ước mơ có thể vươn tới (Nobita và hành tinh muông thú, Nobita và chuyến du hành xứ quỷ...).

Những câu chuyện về chú mèo máy thông minh Doraemon và các bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi đưa độc giả bước vào thế giới hồn nhiên, trong sáng, đầy ắp tiếng cười với một kho bảo bối biến ước mơ thành sự thật. Doraemon chính là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.

 ', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/19_516248d554cc456fb7103cc3ee526163_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (92, N'DORAEMON TRUYỆN DÀI - TẬP 20 - NOBITA VÀ TRUYỀN THUYẾT VUA MẶT TRỜI', N'Bảo bối "máy chiếu không gian" đã đưa Doraemon và Nobita đến vương quốc Mặt trời Mayana. Thế nhưng, một mụ phù thủy ác độc với pháp lực cao cường đãng tìm mọi cách thông trị Mayana. Cùng hợp lực với hoàng tử Tio giống Nobita như hai giọt nước, nhóm Doraemon đang hướng tới thần điện bóng đêm, hang ổ của mụ phù thủy độc ác... Đây là phiền bản tranh truyện màu được vẽ lại từ tập phim hoạt hình cùng tên của tác giả Fujiko.F.Fujio. Mời các bạn tiếp tục theo dõi diễn biến của câu chuyện trong tập hai này.
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/20_76d756037dae433ca85aba504f4fc2b5_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (93, N'DORAEMON TRUYỆN DÀI - TẬP 21 - NOBITA VÀ NHỮNG DŨNG SĨ CÓ CÁNH', N'Mỗi tập truyện là một cuộc phưu lưu khám phá những chân trời mới lạ. Hãy để trí tưởng tượng của bạn bay bổng cùng nhóm bạn Doraemon, Nobita, Shizuka, Jaian, Suneo đến các vùng đất xa xôi, kì bí và cảm nhận những khoảnh khắc tình bạn tươi đẹp của cuộc đời!

24 tập Doraemon truyện dài phiên bản mới với nội dung và hình thức trung thành với nguyên tác của hoạ sĩ Fujiko.F.Fujio kể về 24 chuyến phiêu lưu của nhóm bạn. Những bảo bối trong chiếc túi thần kỳ của Doraemon đã biến những điều không thể thành có thể, biến ước mơ thành hiện thực.

Những chuyến phiêu lưu không bị hạn chế bởi không gian và thời gian. Đó là chuyến du hành vượt qua thời gian trở về thời tiền sử của vũ trụ (Nobita và lịch sử khai phá vũ trụ), của trái đất (Chú khủng long của Nobita), của nước Nhật (Nobita và nước Nhật thời nguyên thủy), đến tương lai (Nobita và cuộc phiêu lưu ở thành phố dây cót, Nobita và vương quốc robot)... 24 chuyến phiêu lưu của nhóm bạn có đích đến là 24 địa điểm kỳ thú, chỉ có trí tưởng tượng và ước mơ có thể vươn tới (Nobita và hành tinh muông thú, Nobita và chuyến du hành xứ quỷ...).

Những câu chuyện về chú mèo máy thông minh Doraemon và các bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi đưa độc giả bước vào thế giới hồn nhiên, trong sáng, đầy ắp tiếng cười với một kho bảo bối biến ước mơ thành sự thật. Doraemon chính là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/21_c0289c3468584a269533fb6fb28877b1_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (94, N'DORAEMON TRUYỆN DÀI - TẬP 22 - NOBITA VÀ VƯƠNG QUỐC ROBOT', N'Những câu chuyện về chú mèo máy thông minh Doraemon và nhóm bạn Nobita, Shizuka, Suneo, Jaian, Dekisugi sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/22_7ef58c19092b4df5bb045e4fd007c44d_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (95, N'DORAEMON TRUYỆN DÀI - TẬP 23 - NOBITA VÀ NHỮNG PHÁP SƯ GIÓ BÍ ẨN', N'Chuyện nổi tiếng về chú mèo máy thông minh Doraemon và các bạn', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/23_51d62ab97fed4a2ab87dbce931a8ec87_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (96, N'DORAEMON TRUYỆN DÀI - TẬP 24 - NOBITA Ở VƯƠNG QUỐC CHÓ MÈO', N'"Nobita ở vương quốc chó mèo" là tập thứ 24 trong series truyện dài Doraemon được vẽ và sáng tác bởi Fujiko.F.Fujio. Đây cũng là một trong những tập cảm động nhất trong tất cả 24 tập của series truyện dài.

Truyện kể về tình bạn gắn bó giữa cậu bé Nobita loài người và chú chó Ichi, sau 1000 năm xa cách cả hai vẫn không quên người kia.

Ở thế giới của mình, Nobita đã nhặt được một chú chó con đáng yêu và đặt tên là Ichi, không bao lâu sau Nobita và các bạn của mình phát hiện rất nhiều chó mèo bị bỏ rơi; thế nhưng mẹ của Nobita không cho phép cậu bé nuôi thú trong nhà. Nobita đã dùng cỗ máy thời gian của Doraemon để đưa tất cả về quá khứ - trước cả thời kỳ khủng long xuất hiện để bọn chó mèo có thể sống vui vẻ.

Lúc Nobita, Doraemon và các bạn của mình quay lại thăm Ichi và những con vật khác thì bị cuốn vào một cơn lốc xoáy thời gian khiến thời gian thay đổi - cả bọn bước vào thế giới chó mèo 1000 năm sau - lúc này nơi đây đã trở thành một thành phố phồn hoa và thịnh vượng. Trải qua nhiều khó khăn và biến cố cùng với nhau, qua những hiểu lầm ban đầu, Nobita cùng Ichi cuối cùng đã nhận ra nhau.', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/24_896c179942354940b2f5bb47cb50da70_master.jpg', 1, NULL, 2, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (97, N'DORAEMON BÓNG CHÀY - TRUYỀN KÌ VỀ BÓNG CHÀY SIÊU CẤP - TẬP 1', N'Doraemon Bóng Chày là bộ truyện tranh về bóng chày do Mugiwara Shintaro sáng tác dựa trên hình ảnh chú mèo máy Doraemon trong bộ truyện tranh cùng tên của tác giả Fujiko.F.Fujio.

Dù Doraemon có xuất hiện trong một vài chương đầu, nhưng câu chuyện lại không xoay quanh cậu và những người bạn ở thế kỷ 20, mà lại xoay quanh một đội bóng chày gồm các chú mèo máy ở thế kỷ 22 (vì Doraemon phải trở về quá khứ để giúp Nobita). Trưởng đội bóng là Kuroemon, một mèo máy khá giống Doraemon trừ đôi tai và bộ lông đen. Trận bóng cho phép sử dụng 3 bảo bối được quy định từ trước đó. 

Edogawa Doras là đội bóng chính của truyện. Ban đầu đội Doras chơi rất kém, nhưng nhờ Hiroshi gia nhập thì đội bóng mới có trận thắng đầu tiên. Sau đó đội bóng phải luyện tập ở đảo hoang. Sau khi luyện tập, đội Doras đã có rất nhiều thành tích đáng kể và trở thành một trong những đội bóng nghiệp dư mạnh nhất Nhật Bản.

Doraemon Bóng Chày - Truyền Kì Về Bóng Chày Siêu Cấp (Tập 1) kể về Kuroemon, mặc dù sinh ra ở thế kỷ 22 nhưng rất mê bộ môn bóng chày. Cậu đang đầu quân cho đội bóng Doras nổi tiếng là... chơi dở ẹc. Nhưng chính tình bạn và lòng dũng cảm, ý chí tiến thủ của các thành viên trong đội bóng đã giúp Doras mạnh dần lên.', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/1_35facbd03b9f4452a1881cd3fb75a77a_master.jpg', 1, NULL, 4, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (98, N'ĐỘI QUÂN DORAEMON - TẬP 1', N'Tập truyện là cuộc phiêu lưu đầy thử thách, thú vị của Doremon, Nobita và các bạn. Qua mỗi câu chuyện, người đọc đều cảm thấy trách nhiệm của những nhân vật nhỏ tuổi với trái đất, với môi trường, với thiên nhiên, với việc bảo tồn động vật. Xuyên suốt các tập truyện là sợi chỉ đỏ: Cái thiện sẽ thắng cái ác, sự cố gắng sẽ được đền đáp xứng đáng.

Cuốn sách sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/1_a159e21ef7dc47c6bc5682a1069d2c9a_master.jpg', 1, NULL, 5, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (100, N'DORAEMON - ĐỘI THÁM HIỂM TẠI SAO - TẬP 1', N'
Đội thám hiểm tại sao" đã lên đường bảo vệ lịch sử khoa học cũng như các phát minh, phát kiến. Gặp gỡ rất nhiều vĩ nhân trong quá khứ, Doraemon và Nobita không khỏi tròn mắt ngạc nhiên trước những sự thật vô cùng bất ngờ...?', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/doi-tham-hiem-tai-sao-1-_cbc4540346824073a34051fb2d9a4b6f_master.jpg', 1, NULL, 6, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (101, N'DORAEMON PHIÊN BẢN ĐIỆN ẢNH MÀU - CHÚ KHỦNG LONG CỦA NOBITA', N'“Chú khủng long của Nobita” là tác phẩm đầu tiên trong loạt phim hoạt hình rất được mến mộ “Doraemon” được chuyển thể từ nguyên tác truyện tranh của tác giả Fujiko.F.Fujio. (Tác phẩm được công chiếu vào mùa xuân năm 1980).

Nobita tình cờ phát hiện thấy một quả trứng khủng long hóa thạch, và quả trứng này đã nở ra chú khủng long cổ dài có tên Pisuke. Nobita và Doraemon quyết định đưa Pisuke trở về thời đại của khủng long, thế nhưng rắc rối đã xảy đến...

Diễn biến tiếp theo ra sao, mời các bạn cùng đọc truyện!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/1_222_e20e8da3579c49d0a2a796f30a6a5411_b1c58dfc416b4d55a61eae491eede09d_master.jpg', 1, NULL, 7, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (102, N'DORAEMON ĐỐ VUI - TẬP 1 (2022)', N'Tuyển tập 126 câu đố thú vị về 11 tập đầu của bộ Doraemon truyện ngắn. Cùng xem các bạn giải được bao nhiêu câu nào!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/do-vui-1_7838c76bf1864cabb997bac6269e22bc_master.jpg', 1, NULL, 8, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (103, N'DORAEMON HỌC TẬP - THIÊN THỂ', N'Trẻ em rất thích câu đố và những điều bí ẩn. Đó là vì quá trình suy luận ra kết quả, tức là suy nghĩ "Vì sao lại thế?" rất thú vị. Nếu nắm bắt được cách suy luận thì môn này sẽ trở nên hấp dẫn, lôi cuốn.

Cuốn sách này không đưa ra những lời giải thích một chiều, mà các nhân vật trong truyện sẽ hóa thân thành độc giả, giải đố sai, mang nghi vấn về những vấn đề và đưa ra những lí giải hết sức hồn nhiên... Qua những tình tiết mang đầy chất truyện tranh đó, các em sẽ hiểu vấn đề nhanh và dễ hơn. Ngoài ra tập sách cũng cung cấp đầy đủ những kiến thức cơ bản, nền tảng quan trọng trong bộ môn mà các em cần nắm chắc', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/thien-the_cc709da0b49542f583acadd6500b5101_master.jpg', 1, NULL, 9, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (104, N'DORAEMON TUYỂN TẬP TRANH TRUYỆN MÀU - TẬP 1 (2022)', N'Tuyển tập tranh truyện màu về chú mèo máy thông minh đến từ tương lai Doraemon và những người bạn…

“Doraemon tuyển tập tranh truyện màu” ra mắt độc giả dựa trên nguyên tắc tuyệt đối trung thành với bản thảo gốc. Vì thế trong truyện có phần in màu, có phần chỉ in hai màu đỏ - đen, và có cả những trang đen trắng. “Tuyển tập tranh truyện màu” sẽ giúp độc giả khám phá rộng hơn, sâu sắc hơn về thế giới của chú mèo máu Doraemon.

Chúc các bạn có những giờ phút thư giãn vui vẻ cùng chú mèo máy dễ thương.', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/1_d942c5b5a1ec43a6b8cc1b8b23e48cae_master.jpg', 1, NULL, 10, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (105, N'DORAEMON THẾ GIỚI KHOA HỌC - THẾ GIỚI DIỆU KÌ', N'Hi vọng với cuốn sách này, các bạn có thể vừa thưởng thức truyện tranh Doraemon vừa thu được những kiến thức khoa học. Chắc chắn cuốn sách sẽ chứa nhiều “điều kì diệu” mà các bạn chưa từng biết tới.

Khi các bạn nảy sinh cảm giác tò mò, muốn tìm câu trả lời cho câu hỏi “Tại sao?”, nghĩa là các bạn đã đặt bước chân đầu tiên trên con đường chạm đến “điều kì diệu”. Hiển nhiên là trong cuộc sống thường ngày của chúng ta vẫn ẩn chứa rất nhiều “điều kì diệu”, từ thế giới siêu vi nhỏ bé mà mắt thường không thể nhìn thấy cho đến những ngôi sao xa xăm.

Các nhà khoa học nhí hãy thử sức mình để tìm hiểu bao điều kì diệu trong cuộc sống nhé!

Giám sát: BẢO TÀNG KHOA HỌC TƯƠNG LAI NHẬT BẢN (MIRAIKAN)

Bảo tàng Khoa học Tương lai Nhật Bản trưng bày sự kết nối giữa con người với khoa học và công nghệ tiên tiến. Thông qua các hình thức như triển lãm kiểu trải nghiệm, tham dự sự kiện có diễn giả là nhà khoa học… chúng ta biết được cuộc sống tương lai sẽ thay đổi ra sao và ứng dụng của công nghệ khoa học kĩ thuật tân tiến trong đời sống con người. Tại bảo tàng nổi tiếng này, cả người lớn lẫn trẻ em đều có thể trải nghiệm nhiều trang thiết bị hiện đại như rạp chiếu phim mái vòm hay các buổi trình diễn của robot ASIMO.', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/the-gioi-dieu-ki_1312422f1f7a479ea77c456cebaa9cca_master.jpg', 1, NULL, 11, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (106, N'DORAEMON BÓNG CHÀY - TRUYỀN KÌ VỀ BÓNG CHÀY SIÊU CẤP - TẬP 2 (2022)', N'Đội Doras do Kuroemon dẫn đầu đã quyết định tham gia giải đấu bóng chày nghiệp dư của thế kỉ 22, giải Big Dome Cup. Nhưng, liệu họ có thể vượt qua các đối thủ đáng gờm như Pokoemon biết sử dụng phép thuật khi ném bóng và Dorae Ichiro có tỉ lệ phát bóng 10/10? Và họ có đạt được điều mình mong muốn đó là trở thành đối thủ của Shiroemon?', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/2_8b4b6626fb61478789b8b5d76d8163a7_master.jpg', 1, NULL, 4, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (107, N'DORAEMON BÓNG CHÀY - TRUYỀN KÌ VỀ BÓNG CHÀY SIÊU CẤP - TẬP 3 (2022)', N'Đội bóng Doras bước vào trận đấu thứ 3 trong khuôn khổ giải Big Dome Cup. Đối thủ lần này của họ là đội bóng Whiters dưới sựdẫn dắt của đội trưởng là Shiroemon có cú ném bóng hình zíc zắc W khá lợi hại. Trước đây, Kuroemon chưa từng thắng đối thủ truyền kiếp này, vì thế cậu đã hạ quyết tâm luyện cho kì được cú đánh bóng hình “trăng rằm”. Kết quả ra sao, mời các bạn cùng theo dõi!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/3_d0ed2a62c31c46cf9d61f2f08ca242e9_master.jpg', 1, NULL, 4, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (108, N'DORAEMON BÓNG CHÀY - TRUYỀN KÌ VỀ BÓNG CHÀY SIÊU CẤP - TẬP 4 (2022)', N'Cuối cùng Kuroemon cũng đã hóa giải cú ném hình zíc zắc W của Shiroemon và giành chiến thắng. Nhưng Shiroemon lại bị chấn thương vai do mất sức trong lúc cố ném quả bóng hình zíc zắc W đó. Kuroemon đã chấp nhận thi đấu một trận bóng chày với đội bóng siêu cường đến từ nước Mĩ do Drump dẫn đầu để giúp Shiroemon chữa khỏi vai. Cố lên đội bóng chày đến từ Nhật Bản!!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/4_328828180d834bcdbf368c5f476862bb_master.jpg', 1, NULL, 4, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (109, N'DORAEMON BÓNG CHÀY - TRUYỀN KÌ VỀ BÓNG CHÀY SIÊU CẤP - TẬP 5 (2022)', N'Hóa ra tay ném chủ lực của đội Devil Kings lại chính là Drump. Tất cả cầu thủ của đội Doras đều phải bó tay trước cú ném hình chữ Q của hắn. Cảm phục trước tinh thần thi đấu kiên cường của Kuroemon, Shiroemon đã quyết tâm ra sân thi đấu. Nào, các bạn hãy xem kết quả trận đấu ra sao nhé!!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/5_a299bc114a3143488f479ad9948aec66_master.jpg', 1, NULL, 4, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (110, N'DORAEMON BÓNG CHÀY - TRUYỀN KÌ VỀ BÓNG CHÀY SIÊU CẤP - TẬP 6', N'Câu chuyện về chú mèo máy Doraemon chơi bóng chày
', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/6_2ed3c790906446988cee366fc7492784_master.jpg', 1, NULL, 4, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (111, N'ĐỘI QUÂN DORAEMON - TẬP 2', N'Tập truyện là cuộc phiêu lưu đầy thử thách, thú vị của Doremon, Nobita và các bạn. Qua mỗi câu chuyện, người đọc đều cảm thấy trách nhiệm của những nhân vật nhỏ tuổi với trái đất, với môi trường, với thiên nhiên, với việc bảo tồn động vật. Xuyên suốt các tập truyện là sợi chỉ đỏ: Cái thiện sẽ thắng cái ác, sự cố gắng sẽ được đền đáp xứng đáng.

Cuốn sách sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/2_328c74d9f9494c70a71d98722ed975d7_56b4c56d7ce147ee915112ce2a064319_master.jpg', 1, NULL, 5, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (112, N'ĐỘI QUÂN DORAEMON - TẬP 3', N'Tập truyện là cuộc phiêu lưu đầy thử thách, thú vị của Doremon, Nobita và các bạn. Qua mỗi câu chuyện, người đọc đều cảm thấy trách nhiệm của những nhân vật nhỏ tuổi với trái đất, với môi trường, với thiên nhiên, với việc bảo tồn động vật. Xuyên suốt các tập truyện là sợi chỉ đỏ: Cái thiện sẽ thắng cái ác, sự cố gắng sẽ được đền đáp xứng đáng.

Cuốn sách sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/3_a73b75916d224f23bbf48c5621300245_7d834ce6c417451ba98cffde3c1e4e7a_master.jpg', 1, NULL, 5, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (113, N'ĐỘI QUÂN DORAEMON - TẬP 4', N'Tập truyện là cuộc phiêu lưu đầy thử thách, thú vị của Doremon, Nobita và các bạn. Qua mỗi câu chuyện, người đọc đều cảm thấy trách nhiệm của những nhân vật nhỏ tuổi với trái đất, với môi trường, với thiên nhiên, với việc bảo tồn động vật. Xuyên suốt các tập truyện là sợi chỉ đỏ: Cái thiện sẽ thắng cái ác, sự cố gắng sẽ được đền đáp xứng đáng.

Cuốn sách sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/4_bcf60765874841e18dfd81230a64f58d_ddcfd048818340ffa5c41e07b77deb77_master.jpg', 1, NULL, 5, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (114, N'ĐỘI QUÂN DORAEMON - TẬP 5
', N'Tập truyện là cuộc phiêu lưu đầy thử thách, thú vị của Doremon, Nobita và các bạn. Qua mỗi câu chuyện, người đọc đều cảm thấy trách nhiệm của những nhân vật nhỏ tuổi với trái đất, với môi trường, với thiên nhiên, với việc bảo tồn động vật. Xuyên suốt các tập truyện là sợi chỉ đỏ: Cái thiện sẽ thắng cái ác, sự cố gắng sẽ được đền đáp xứng đáng.

Cuốn sách sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/5_b8998e6ed6ee44ac80d5df813115361a_02d0008a6ab548009f27af2f76dd0b2f_master.jpg', 1, NULL, 5, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (115, N'ĐỘI QUÂN DORAEMON - TẬP 6', N'Tập truyện là cuộc phiêu lưu đầy thử thách, thú vị của Doremon, Nobita và các bạn. Qua mỗi câu chuyện, người đọc đều cảm thấy trách nhiệm của những nhân vật nhỏ tuổi với trái đất, với môi trường, với thiên nhiên, với việc bảo tồn động vật. Xuyên suốt các tập truyện là sợi chỉ đỏ: Cái thiện sẽ thắng cái ác, sự cố gắng sẽ được đền đáp xứng đáng.

Cuốn sách sẽ đưa chúng ta bước vào thế giới hồn nhiên, trong sáng đầy ắp tiếng cười với một kho bảo bối kì diệu - những bảo bối biến ước mơ của chúng ta thành sự thật. Nhưng trên tất cả Doraemon là hiện thân của tình bạn cao đẹp, của niềm khát khao vươn tới những tầm cao.', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/6_dd3d7fcef1984274b9c73607c94700c6_b79ca71fe4ac4d3983a78c074c2d2f7b_master.jpg', 1, NULL, 5, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (116, N'DORAEMON - ĐỘI THÁM HIỂM TẠI SAO - TẬP 2', N'Hainnine là nhà bác học xấu xa có dã tâm chiếm đoạt "linh hồn vĩ nhân" của các vĩ nhân trong lịch sử. Nhóm bạn Doraemon đã lập ra "Đội thám hiểm tại sao", trải qua nhiều cuộc hành trình về quá khứ và đến tương lai để tuổi theo Hainnine... Và trong mỗi chuyến hành trình, nhóm bạn của chúng ta lại khám phá ra nhiều bí mật bất ngờ về các vĩ nhân đấy. Mời các bạn vừa thưởng thức bộ truyện vừa tìm hiểu thêm về các nhân vật nổi tiếng trong lịch sử nhé!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/2_a2b991a74d25480ca4b1ba3d2ea2658f_master.jpg', 1, NULL, 6, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (117, N'DORAEMON - ĐỘI THÁM HIỂM TẠI SAO - TẬP 2 (2019)', N'Hainnine là nhà bác học xấu xa có dã tâm chiếm đoạt "linh hồn vĩ nhân" của các vĩ nhân trong lịch sử. Nhóm bạn Doraemon đã lập ra "Đội thám hiểm tại sao", trải qua nhiều cuộc hành trình về quá khứ và đến tương lai để tuổi theo Hainnine... Và trong mỗi chuyến hành trình, nhóm bạn của chúng ta lại khám phá ra nhiều bí mật bất ngờ về các vĩ nhân đấy. Mời các bạn vừa thưởng thức bộ truyện vừa tìm hiểu thêm về các nhân vật nổi tiếng trong lịch sử nhé!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/doi-tham-hiem-tai-sao-2_03a7791bff484db18f418bb64f3f3a5f_master.jpg', 1, NULL, 6, NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Quantity], [Price], [DiscountPrice], [ImagesUrl], [Status], [CreatedAt], [Series_Id], [UpdatedAt]) VALUES (120, N'DORAEMON - ĐỘI THÁM HIỂM TẠI SAO - TẬP 1 (2019)', N'Hainnine là nhà bác học xấu xa có dã tâm chiếm đoạt "linh hồn vĩ nhân" của các vĩ nhân trong lịch sử. Nhóm bạn Doraemon đã lập ra "Đội thám hiểm tại sao", trải qua nhiều cuộc hành trình về quá khứ và đến tương lai để tuổi theo Hainnine... Và trong mỗi chuyến hành trình, nhóm bạn của chúng ta lại khám phá ra nhiều bí mật bất ngờ về các vĩ nhân đấy. Mời các bạn vừa thưởng thức bộ truyện vừa tìm hiểu thêm về các nhân vật nổi tiếng trong lịch sử nhé!', 100, 22000, 10, N'https://product.hstatic.net/200000343865/product/doi-tham-hiem-tai-sao-1-_cbc4540346824073a34051fb2d9a4b6f_master.jpg', 1, NULL, 6, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Series] ON 

INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (1, N'TRUYỆN NGẮN')
INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (2, N'TRUYỆN DÀI')
INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (3, N'DORAEMON PLUS')
INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (4, N'DORAEMON BÓNG CHÀY')
INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (5, N'ĐỘI QUÂN DORAEMON')
INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (6, N'DORAEMON - ĐỘI THÁM HIỂM TẠI SAO')
INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (7, N'DORAEMON PHIÊN BẢN ĐIỆN ẢNH MÀU')
INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (8, N'DORAEMON ĐỐ VUI')
INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (9, N'DORAEMON HỌC TẬP')
INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (10, N'DORAEMON TRANH TRUYỆN MÀU')
INSERT [dbo].[Series] ([Series_Id], [Series_Name]) VALUES (11, N'DORAEMON THẾ GIỚI KHOA HỌC')
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
