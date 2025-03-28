USE [SWP_Project]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NULL,
	[BlogTitle] [varchar](255) NULL,
	[BlogImage] [varchar](255) NULL,
	[BlogDetail] [text] NULL,
	[BlogDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[ProductId] [int] NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [decimal](10, 2) NULL,
	[Color] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartDetail]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartDetail](
	[CartDetailId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](10, 2) NULL,
	[AddDate] [datetime] NULL,
	[ProductName] [nvarchar](255) NULL,
	[CategoryId] [int] NULL,
	[Images] [nvarchar](255) NULL,
	[OriginalPrice] [decimal](10, 2) NULL,
	[SalePrice] [decimal](10, 2) NULL,
	[Description] [nvarchar](500) NULL,
	[Color] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CartDetailId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](100) NOT NULL,
	[CusBirthDate] [date] NULL,
	[CusGender] [varchar](10) NULL,
	[Phone] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](255) NULL,
	[Status] [varchar](50) NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAddress]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Address] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [varchar](100) NOT NULL,
	[EmpBirthDate] [date] NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[EmpGender] [varchar](10) NULL,
	[RoleId] [int] NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[CustomerId] [int] NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[TotalPrice] [decimal](18, 0) NULL,
	[Date] [datetime] NULL,
	[Message] [nvarchar](max) NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK__Order__C3905BCF2CB1CA27] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](500) NULL,
	[CategoryId] [int] NULL,
	[Price] [decimal](18, 0) NULL,
	[Quantity] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Discontinued] [bit] NOT NULL,
	[IsHot] [bit] NULL,
	[SoldQuantity] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[SalePrice] [decimal](18, 0) NULL,
	[image] [varchar](255) NULL,
 CONSTRAINT [PK__Product__B40CC6CDE97F1666] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[Color] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[ShippingId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ShippingAddress] [text] NULL,
	[ShippingStatus] [varchar](50) NULL,
	[ShippingDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShippingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 3/28/2025 4:14:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[SlideId] [int] IDENTITY(1,1) NOT NULL,
	[SlideImg] [varchar](255) NULL,
	[SlideTitle] [varchar](255) NULL,
	[SlideDetail] [text] NULL,
	[SlideDate] [datetime] NULL,
	[EmployeeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SlideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogId], [EmployeeId], [BlogTitle], [BlogImage], [BlogDetail], [BlogDate]) VALUES (1, 1, N'Blog Post 1', N'image1.jpg', N'This is the first blog post detail.', CAST(N'2025-02-17T21:44:37.133' AS DateTime))
INSERT [dbo].[Blog] ([BlogId], [EmployeeId], [BlogTitle], [BlogImage], [BlogDetail], [BlogDate]) VALUES (2, 2, N'Blog Post 2', N'image2.jpg', N'This is the second blog post detail.', CAST(N'2025-02-17T21:44:37.133' AS DateTime))
INSERT [dbo].[Blog] ([BlogId], [EmployeeId], [BlogTitle], [BlogImage], [BlogDetail], [BlogDate]) VALUES (3, 3, N'Blog Post 3', N'image3.jpg', N'This is the third blog post detail.', CAST(N'2025-02-17T21:44:37.133' AS DateTime))
INSERT [dbo].[Blog] ([BlogId], [EmployeeId], [BlogTitle], [BlogImage], [BlogDetail], [BlogDate]) VALUES (4, 4, N'Blog Post 4', N'image4.jpg', N'This is the fourth blog post detail.', CAST(N'2025-02-17T21:44:37.133' AS DateTime))
INSERT [dbo].[Blog] ([BlogId], [EmployeeId], [BlogTitle], [BlogImage], [BlogDetail], [BlogDate]) VALUES (5, 5, N'Blog Post 5', N'image5.jpg', N'This is the fifth blog post detail.', CAST(N'2025-02-17T21:44:37.133' AS DateTime))
INSERT [dbo].[Blog] ([BlogId], [EmployeeId], [BlogTitle], [BlogImage], [BlogDetail], [BlogDate]) VALUES (6, 6, N'Blog Post 6', N'image6.jpg', N'This is the sixth blog post detail.', CAST(N'2025-02-17T21:44:37.133' AS DateTime))
INSERT [dbo].[Blog] ([BlogId], [EmployeeId], [BlogTitle], [BlogImage], [BlogDetail], [BlogDate]) VALUES (7, 7, N'Blog Post 7', N'image7.jpg', N'This is the seventh blog post detail.', CAST(N'2025-02-17T21:44:37.133' AS DateTime))
INSERT [dbo].[Blog] ([BlogId], [EmployeeId], [BlogTitle], [BlogImage], [BlogDetail], [BlogDate]) VALUES (8, 8, N'Blog Post 8', N'image8.jpg', N'This is the eighth blog post detail.', CAST(N'2025-02-17T21:44:37.133' AS DateTime))
INSERT [dbo].[Blog] ([BlogId], [EmployeeId], [BlogTitle], [BlogImage], [BlogDetail], [BlogDate]) VALUES (9, 9, N'Blog Post 9', N'image9.jpg', N'This is the ninth blog post detail.', CAST(N'2025-02-17T21:44:37.133' AS DateTime))
INSERT [dbo].[Blog] ([BlogId], [EmployeeId], [BlogTitle], [BlogImage], [BlogDetail], [BlogDate]) VALUES (10, 10, N'Blog Post 10', N'image10.jpg', N'This is the tenth blog post detail.', CAST(N'2025-02-17T21:44:37.133' AS DateTime))
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (1, 1, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (2, 2, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (3, 3, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (4, 4, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (5, 5, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (6, 6, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (7, 7, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (8, 8, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (9, 9, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (10, 10, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (11, 1, 101, 2, CAST(6400000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (12, 2, 102, 1, CAST(3200000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (13, 3, 103, 3, CAST(9600000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (14, 4, 104, 4, CAST(12800000.00 AS Decimal(10, 2)), NULL, NULL)
INSERT [dbo].[Cart] ([CartId], [CustomerId], [ProductId], [Quantity], [TotalPrice], [Color], [Size]) VALUES (15, 5, 105, 2, CAST(6400000.00 AS Decimal(10, 2)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
INSERT [dbo].[CartDetail] ([CartDetailId], [ProductId], [Quantity], [Price], [AddDate], [ProductName], [CategoryId], [Images], [OriginalPrice], [SalePrice], [Description], [Color], [Size]) VALUES (1, 1, 2, CAST(100.50 AS Decimal(10, 2)), CAST(N'2025-02-17T22:05:55.923' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CartDetail] ([CartDetailId], [ProductId], [Quantity], [Price], [AddDate], [ProductName], [CategoryId], [Images], [OriginalPrice], [SalePrice], [Description], [Color], [Size]) VALUES (1, 2, 1, CAST(250.75 AS Decimal(10, 2)), CAST(N'2025-02-17T22:05:55.923' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CartDetail] ([CartDetailId], [ProductId], [Quantity], [Price], [AddDate], [ProductName], [CategoryId], [Images], [OriginalPrice], [SalePrice], [Description], [Color], [Size]) VALUES (2, 3, 3, CAST(300.00 AS Decimal(10, 2)), CAST(N'2025-02-17T22:05:55.923' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CartDetail] ([CartDetailId], [ProductId], [Quantity], [Price], [AddDate], [ProductName], [CategoryId], [Images], [OriginalPrice], [SalePrice], [Description], [Color], [Size]) VALUES (2, 4, 2, CAST(120.30 AS Decimal(10, 2)), CAST(N'2025-02-17T22:05:55.923' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CartDetail] ([CartDetailId], [ProductId], [Quantity], [Price], [AddDate], [ProductName], [CategoryId], [Images], [OriginalPrice], [SalePrice], [Description], [Color], [Size]) VALUES (3, 5, 5, CAST(450.20 AS Decimal(10, 2)), CAST(N'2025-02-17T22:05:55.923' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CartDetail] ([CartDetailId], [ProductId], [Quantity], [Price], [AddDate], [ProductName], [CategoryId], [Images], [OriginalPrice], [SalePrice], [Description], [Color], [Size]) VALUES (3, 6, 4, CAST(99.99 AS Decimal(10, 2)), CAST(N'2025-02-17T22:05:55.923' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CartDetail] ([CartDetailId], [ProductId], [Quantity], [Price], [AddDate], [ProductName], [CategoryId], [Images], [OriginalPrice], [SalePrice], [Description], [Color], [Size]) VALUES (4, 7, 6, CAST(190.00 AS Decimal(10, 2)), CAST(N'2025-02-17T22:05:55.923' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CartDetail] ([CartDetailId], [ProductId], [Quantity], [Price], [AddDate], [ProductName], [CategoryId], [Images], [OriginalPrice], [SalePrice], [Description], [Color], [Size]) VALUES (4, 8, 1, CAST(85.50 AS Decimal(10, 2)), CAST(N'2025-02-17T22:05:55.923' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CartDetail] ([CartDetailId], [ProductId], [Quantity], [Price], [AddDate], [ProductName], [CategoryId], [Images], [OriginalPrice], [SalePrice], [Description], [Color], [Size]) VALUES (5, 9, 2, CAST(60.10 AS Decimal(10, 2)), CAST(N'2025-02-17T22:05:55.923' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CartDetail] ([CartDetailId], [ProductId], [Quantity], [Price], [AddDate], [ProductName], [CategoryId], [Images], [OriginalPrice], [SalePrice], [Description], [Color], [Size]) VALUES (5, 10, 1, CAST(220.00 AS Decimal(10, 2)), CAST(N'2025-02-17T22:05:55.923' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Bóng đá')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Cầu lông')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Bóng bàn')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (4, N'Tenis')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (5, N'Phụ kiện thể thao')
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (6, N'Quần áo')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (1, N'Sophia', CAST(N'1985-05-15' AS Date), N'Female', N'123-456-7890', N'sophia@email.com', N'sophia123', N'password123', N'Active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (2, N'James', CAST(N'1990-03-25' AS Date), N'Male', N'123-555-7891', N'james@email.com', N'james123', N'password123', N'Active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (3, N'Liam', CAST(N'1988-07-11' AS Date), N'Male', N'123-666-7892', N'liam@email.com', N'liam123', N'password123', N'Active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (4, N'Ethan', CAST(N'1987-02-18' AS Date), N'Male', N'123-777-7893', N'ethan@email.com', N'ethan123', N'password123', N'Inactive', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (5, N'Olivia', CAST(N'1992-08-05' AS Date), N'Female', N'123-888-7894', N'olivia@email.com', N'olivia123', N'password123', N'Active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (6, N'Mason', CAST(N'1980-12-22' AS Date), N'Male', N'123-999-7895', N'mason@email.com', N'mason123', N'password123', N'Active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (7, N'Amelia', CAST(N'1995-01-10' AS Date), N'Female', N'123-000-7896', N'amelia@email.com', N'amelia123', N'password123', N'Active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (8, N'Ava', CAST(N'1993-04-02' AS Date), N'Female', N'123-111-7897', N'ava@email.com', N'ava123', N'password123', N'Inactive', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (9, N'Lucas', CAST(N'1986-09-12' AS Date), N'Male', N'123-222-7898', N'lucas@email.com', N'lucas123', N'password123', N'Active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (10, N'Madison', CAST(N'1989-11-30' AS Date), N'Female', N'123-333-7899', N'madison@email.com', N'madison123', N'password123', N'Active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (11, N'Benjamin', CAST(N'1991-02-20' AS Date), N'Male', N'123-444-7890', N'benjamin@email.com', N'benjamin123', N'password123', N'Active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (12, N'Charlotte', CAST(N'1994-03-03' AS Date), N'Female', N'123-666-7891', N'charlotte@email.com', N'charlotte123', N'password123', N'Active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (13, N'Henry', CAST(N'1983-05-18' AS Date), N'Male', N'123-777-7892', N'henry@email.com', N'henry123', N'password123', N'Active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (14, N'Isabella', CAST(N'1987-07-08' AS Date), N'Female', N'123-888-7893', N'isabella@email.com', N'isabella123', N'password123', N'Active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (15, N'Jack', CAST(N'1989-11-30' AS Date), N'Male', N'123-333-7899', N'jack@email.com', N'jack123', N'password123', N'Active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (26, N'NgoTrungKien', CAST(N'2004-02-26' AS Date), N'Male', N'0352656519', N'ngotrungkien26004@gmail.com', N'Kien', N'123456', N'Active', 1)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (27, N'TranHoangDung', CAST(N'2004-07-21' AS Date), N'Male', N'0362758193', N'DungTran@gmail.com', N'Dung', N'12345678', N'Active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (32, N'Ngo Trung Kien', CAST(N'2004-10-13' AS Date), N'Male', N'0352656514', N'trungkien26204@gmail.com', N'trungkien26', N'123456', N'active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (33, N'Nguyen Ngoc Linh', CAST(N'2004-10-15' AS Date), N'Female', N'0387072376', N'nguyenngoclinh@gmail.com', N'LTL', N'151024', N'active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (34, N'Nguy?n Van A', CAST(N'2006-06-17' AS Date), N'Male', N'0362947206', N'nguyenvanA@gmail.com', N'nguyenvanA', N'abcdef', N'active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (35, N'Nguyen Van B', CAST(N'2004-07-24' AS Date), N'Male', N'0362758190', N'nguyenvanB@gmail.com', N'nguyenvanB', N'1234567', N'active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (36, N'NguyenVanC', CAST(N'2003-11-11' AS Date), N'Male', N'0387072372', N'nguyenvanC@gmail.com', N'nguyenvanC', N'11111111', N'active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (37, N'Trung Kien', CAST(N'2004-06-18' AS Date), N'Male', N'0352656512', N'ngotrungkien262004@gmail.com', N'trungkiensp', N'1234567890', N'active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (38, N'Nguyen Thi Hanh', CAST(N'2008-07-25' AS Date), N'Female', N'abc', N'hanhnt84@fpt.edu.vn', N'Hanhnt84', N'123456', N'active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (39, N'Ngô Trung Kiên', CAST(N'2004-02-03' AS Date), N'Male', N'abc', N'ngotrungkientest1@gmail.com', N'trungkientest1', N'123456', N'active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (40, N'Nguyen Van D', CAST(N'2006-10-20' AS Date), N'Male', N'abc', N'nguyenvand@gmail.com', N'nguyenvanD', N'123456', N'active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (41, N'Nguy?n Van E', CAST(N'2004-09-28' AS Date), N'Male', N'abc', N'nguyenvane@gmail.com', N'nguyenvane', N'123456', N'active', 3)
INSERT [dbo].[Customer] ([CustomerId], [CustomerName], [CusBirthDate], [CusGender], [Phone], [Email], [Username], [Password], [Status], [RoleId]) VALUES (42, N'Nguyen Van G', CAST(N'1900-01-01' AS Date), N'Male', N'0352768481', N'nguyenvang@gmail.com', N'nguyenvang', N'G123456', N'active', 3)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerAddress] ON 

INSERT [dbo].[CustomerAddress] ([AddressId], [CustomerId], [Address]) VALUES (1, 1, N'123 Main Street')
INSERT [dbo].[CustomerAddress] ([AddressId], [CustomerId], [Address]) VALUES (2, 2, N'456 Oak Avenue')
INSERT [dbo].[CustomerAddress] ([AddressId], [CustomerId], [Address]) VALUES (3, 3, N'789 Pine Road')
INSERT [dbo].[CustomerAddress] ([AddressId], [CustomerId], [Address]) VALUES (4, 4, N'101 Maple Drive')
INSERT [dbo].[CustomerAddress] ([AddressId], [CustomerId], [Address]) VALUES (5, 5, N'202 Birch Street')
INSERT [dbo].[CustomerAddress] ([AddressId], [CustomerId], [Address]) VALUES (6, 6, N'303 Cedar Lane')
INSERT [dbo].[CustomerAddress] ([AddressId], [CustomerId], [Address]) VALUES (7, 7, N'404 Elm Street')
INSERT [dbo].[CustomerAddress] ([AddressId], [CustomerId], [Address]) VALUES (8, 8, N'505 Willow Avenue')
INSERT [dbo].[CustomerAddress] ([AddressId], [CustomerId], [Address]) VALUES (9, 9, N'606 Ash Road')
INSERT [dbo].[CustomerAddress] ([AddressId], [CustomerId], [Address]) VALUES (10, 10, N'707 Redwood Drive')
SET IDENTITY_INSERT [dbo].[CustomerAddress] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmpBirthDate], [PhoneNumber], [Email], [EmpGender], [RoleId], [UserName], [Password]) VALUES (1, N'Alice', CAST(N'1985-05-15' AS Date), N'123-456-7890', N'alice@email.com', N'Female', 1, N'alice', N'password123')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmpBirthDate], [PhoneNumber], [Email], [EmpGender], [RoleId], [UserName], [Password]) VALUES (2, N'Bob', CAST(N'1990-03-25' AS Date), N'123-555-7891', N'bob@email.com', N'Male', 2, N'bob', N'password123')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmpBirthDate], [PhoneNumber], [Email], [EmpGender], [RoleId], [UserName], [Password]) VALUES (3, N'Charlie', CAST(N'1988-07-11' AS Date), N'123-666-7892', N'charlie@email.com', N'Male', 2, N'charlie', N'password123')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmpBirthDate], [PhoneNumber], [Email], [EmpGender], [RoleId], [UserName], [Password]) VALUES (4, N'David', CAST(N'1987-02-18' AS Date), N'123-777-7893', N'david@email.com', N'Male', 3, N'david', N'password123')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmpBirthDate], [PhoneNumber], [Email], [EmpGender], [RoleId], [UserName], [Password]) VALUES (5, N'Eva', CAST(N'1992-08-05' AS Date), N'123-888-7894', N'eva@email.com', N'Female', 2, N'eva', N'password123')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmpBirthDate], [PhoneNumber], [Email], [EmpGender], [RoleId], [UserName], [Password]) VALUES (6, N'Frank', CAST(N'1980-12-22' AS Date), N'123-999-7895', N'frank@email.com', N'Male', 1, N'frank', N'password123')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmpBirthDate], [PhoneNumber], [Email], [EmpGender], [RoleId], [UserName], [Password]) VALUES (7, N'Grace', CAST(N'1995-01-10' AS Date), N'123-000-7896', N'grace@email.com', N'Female', 2, N'grace', N'password123')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmpBirthDate], [PhoneNumber], [Email], [EmpGender], [RoleId], [UserName], [Password]) VALUES (8, N'Helen', CAST(N'1993-04-02' AS Date), N'123-111-7897', N'helen@email.com', N'Female', 3, N'helen', N'password123')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmpBirthDate], [PhoneNumber], [Email], [EmpGender], [RoleId], [UserName], [Password]) VALUES (9, N'Ivy', CAST(N'1986-09-12' AS Date), N'123-222-7898', N'ivy@email.com', N'Female', 2, N'ivy', N'password123')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeName], [EmpBirthDate], [PhoneNumber], [Email], [EmpGender], [RoleId], [UserName], [Password]) VALUES (10, N'Jack', CAST(N'1989-11-30' AS Date), N'123-333-7899', N'jack@email.com', N'Male', 1, N'jack', N'password123')
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackId], [ProductId], [CustomerId], [Description]) VALUES (1, 1, 1, N'Excellent product, very satisfied with the quality!')
INSERT [dbo].[Feedback] ([FeedbackId], [ProductId], [CustomerId], [Description]) VALUES (2, 2, 2, N'Good value for the price, would recommend it to others.')
INSERT [dbo].[Feedback] ([FeedbackId], [ProductId], [CustomerId], [Description]) VALUES (3, 3, 3, N'Not as expected, the product quality is lower than anticipated.')
INSERT [dbo].[Feedback] ([FeedbackId], [ProductId], [CustomerId], [Description]) VALUES (4, 4, 4, N'Amazing performance, really pleased with the results.')
INSERT [dbo].[Feedback] ([FeedbackId], [ProductId], [CustomerId], [Description]) VALUES (5, 5, 5, N'Product is fine, but it arrived later than expected.')
INSERT [dbo].[Feedback] ([FeedbackId], [ProductId], [CustomerId], [Description]) VALUES (6, 6, 6, N'Affordable and reliable, will definitely buy again.')
INSERT [dbo].[Feedback] ([FeedbackId], [ProductId], [CustomerId], [Description]) VALUES (7, 7, 7, N'Didn’t meet my expectations, I was hoping for more features.')
INSERT [dbo].[Feedback] ([FeedbackId], [ProductId], [CustomerId], [Description]) VALUES (8, 8, 8, N'Highly recommended! The product works perfectly for my needs.')
INSERT [dbo].[Feedback] ([FeedbackId], [ProductId], [CustomerId], [Description]) VALUES (9, 9, 9, N'Average product, nothing extraordinary but works fine.')
INSERT [dbo].[Feedback] ([FeedbackId], [ProductId], [CustomerId], [Description]) VALUES (10, 10, 10, N'Great product, works exactly as described, happy with my purchase.')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [CustomerId], [TotalPrice], [Date], [Message], [EmployeeId]) VALUES (1, 1, CAST(550000 AS Decimal(18, 0)), CAST(N'2025-02-12T00:00:00.000' AS DateTime), N'Order for Nike Shoes', 2)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [TotalPrice], [Date], [Message], [EmployeeId]) VALUES (2, 3, CAST(2900000 AS Decimal(18, 0)), CAST(N'2025-02-12T00:00:00.000' AS DateTime), N'Order for Puma Shoes', 1)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [TotalPrice], [Date], [Message], [EmployeeId]) VALUES (3, 4, CAST(2000000 AS Decimal(18, 0)), CAST(N'2025-02-13T00:00:00.000' AS DateTime), N'Order for Mizuno Shoes', 2)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [TotalPrice], [Date], [Message], [EmployeeId]) VALUES (4, 5, CAST(4500000 AS Decimal(18, 0)), CAST(N'2025-02-13T00:00:00.000' AS DateTime), N'Order for New Balance Shoes', 2)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [TotalPrice], [Date], [Message], [EmployeeId]) VALUES (5, 7, CAST(5100000 AS Decimal(18, 0)), CAST(N'2025-02-14T00:00:00.000' AS DateTime), N'Order for Adidas Shoes', 1)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [TotalPrice], [Date], [Message], [EmployeeId]) VALUES (6, 8, CAST(4000000 AS Decimal(18, 0)), CAST(N'2025-02-15T00:00:00.000' AS DateTime), N'Order for Puma Shoes', 1)
INSERT [dbo].[Order] ([OrderId], [CustomerId], [TotalPrice], [Date], [Message], [EmployeeId]) VALUES (7, 9, CAST(3200000 AS Decimal(18, 0)), CAST(N'2025-02-15T00:00:00.000' AS DateTime), N'Order for Mizuno Shoes', 2)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (1, 1, 2, CAST(3200000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (2, 3, 1, CAST(2900000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (3, 4, 3, CAST(3000000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (4, 5, 2, CAST(3300000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (5, 7, 1, CAST(3050000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (6, 8, 3, CAST(2950000 AS Decimal(18, 0)))
INSERT [dbo].[OrderDetail] ([OrderId], [ProductId], [Quantity], [Price]) VALUES (7, 9, 2, CAST(3250000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (1, N'Giày Nike Mercurial Vapor 15', 2, CAST(3200000 AS Decimal(18, 0)), 50, N'Giày đá bóng cao cấp của Nike, thiết kế cho tốc độ tối đa.', 0, 0, 0, CAST(N'2025-03-04T16:14:00.000' AS DateTime), CAST(2880000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product1.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (2, N'Giày Adidas Predator Freak', 1, CAST(3100000 AS Decimal(18, 0)), 45, N'Dòng giày kiểm soát bóng tối ưu của Adidas, hỗ trợ sút xoáy.', 0, 0, 21, CAST(N'2025-01-08T16:28:05.513' AS DateTime), CAST(2511000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product2.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (3, N'Giày Puma Future Z 1.2', 1, CAST(2900000 AS Decimal(18, 0)), 40, N'Giày đá bóng linh hoạt với công nghệ FUZIONFIT+ của Puma.', 1, 0, 82, CAST(N'2025-03-15T06:42:43.513' AS DateTime), CAST(2349000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product3.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (4, N'Giày Nike Tiempo Legend 9', 1, CAST(3000000 AS Decimal(18, 0)), 55, N'Dòng giày da thật, mang đến sự thoải mái và kiểm soát bóng tuyệt vời.', 1, 0, 356, CAST(N'2025-02-08T03:52:47.513' AS DateTime), CAST(2430000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product4.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (5, N'Giày Mizuno Morelia Neo 3', 1, CAST(3300000 AS Decimal(18, 0)), 35, N'Giày đá bóng da kangaroo siêu nhẹ, phù hợp cho cầu thủ kỹ thuật.', 1, 0, 32, CAST(N'2024-12-21T17:04:58.513' AS DateTime), CAST(2673000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product5.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (6, N'Giày Adidas X Speedflow', 1, CAST(3150000 AS Decimal(18, 0)), 48, N'Dòng giày Adidas dành cho cầu thủ tốc độ như Messi.', 1, 0, 302, CAST(N'2025-02-15T13:17:08.513' AS DateTime), CAST(2551500 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product6.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (7, N'Giày Nike Phantom GT2', 1, CAST(3050000 AS Decimal(18, 0)), 50, N'Thiết kế đặc biệt giúp kiểm soát bóng tốt hơn khi sút và chuyền.', 1, 1, 472, CAST(N'2024-12-24T20:47:12.513' AS DateTime), CAST(2470500 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product7.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (8, N'Giày Puma Ultra 1.3', 1, CAST(2950000 AS Decimal(18, 0)), 38, N'Dòng giày nhẹ nhất của Puma, giúp tăng tốc tối đa.', 1, 0, 203, CAST(N'2024-12-26T05:58:48.513' AS DateTime), CAST(2389500 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product8.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (9, N'Giày Adidas Copa Sense.1', 1, CAST(3250000 AS Decimal(18, 0)), 42, N'Dòng giày giúp kiểm soát bóng và cảm giác bóng hoàn hảo.', 1, 0, 265, CAST(N'2025-02-13T04:25:19.513' AS DateTime), CAST(2632500 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product9.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (10, N'Giày New Balance Furon v6', 1, CAST(2850000 AS Decimal(18, 0)), 30, N'Dòng giày New Balance giúp tối ưu khả năng dứt điểm.', 1, 0, 440, CAST(N'2024-12-24T09:57:14.513' AS DateTime), CAST(2308500 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product10.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (11, N'Giày Mizuno Rebula 3', 1, CAST(3100000 AS Decimal(18, 0)), 25, N'Dòng giày da kangaroo hỗ trợ kiểm soát bóng tối đa.', 0, 0, 94, CAST(N'2025-03-11T03:07:47.513' AS DateTime), CAST(2511000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (12, N'Giày Nike Zoom Mercurial Superfly', 1, CAST(3400000 AS Decimal(18, 0)), 60, N'Công nghệ Zoom Air giúp tăng tốc và linh hoạt hơn.', 1, 0, 145, CAST(N'2025-03-07T02:30:22.513' AS DateTime), CAST(2754000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (13, N'Giày Adidas Nemeziz 19', 1, CAST(2950000 AS Decimal(18, 0)), 50, N'Dòng giày chuyên dành cho các cầu thủ rê bóng và kỹ thuật.', 1, 1, 442, CAST(N'2024-12-16T22:12:39.513' AS DateTime), CAST(2389500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (14, N'Giày Nike Vapor 14', 1, CAST(3200000 AS Decimal(18, 0)), 45, N'Giày đá bóng siêu nhẹ, giúp tăng tốc và bứt phá.', 1, 0, 378, CAST(N'2025-02-17T16:12:07.513' AS DateTime), CAST(2592000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (15, N'Giày Puma King Platinum', 1, CAST(2850000 AS Decimal(18, 0)), 33, N'Dòng giày da thật giúp tối ưu kiểm soát bóng và sự thoải mái.', 1, 0, 423, CAST(N'2025-03-11T06:12:14.513' AS DateTime), CAST(2308500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (16, N'Giày Adidas Predator 20', 1, CAST(3100000 AS Decimal(18, 0)), 47, N'Giày đá bóng với công nghệ Demonskin giúp kiểm soát bóng tốt hơn.', 1, 0, 344, CAST(N'2024-12-18T01:18:35.513' AS DateTime), CAST(2511000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (17, N'Giày Nike Magista Obra 2', 1, CAST(3300000 AS Decimal(18, 0)), 28, N'Dòng giày cổ cao giúp kiểm soát bóng và sáng tạo trên sân.', 1, 1, 450, CAST(N'2025-02-27T20:45:47.513' AS DateTime), CAST(2673000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (18, N'Giày Mizuno Wave Ignitus', 1, CAST(3000000 AS Decimal(18, 0)), 40, N'Dòng giày hỗ trợ lực sút mạnh, phù hợp với cầu thủ đá phạt.', 0, 1, 453, CAST(N'2024-12-24T23:32:47.513' AS DateTime), CAST(2430000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (19, N'Giày Puma evoPOWER 1.3', 1, CAST(2900000 AS Decimal(18, 0)), 38, N'Giày giúp tối ưu lực sút, phù hợp với tiền đạo và tiền vệ tấn công.', 1, 0, 150, CAST(N'2025-03-10T15:47:32.513' AS DateTime), CAST(2349000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (20, N'Giày Nike Hypervenom Phantom', 1, CAST(3150000 AS Decimal(18, 0)), 50, N'Dòng giày dành cho cầu thủ tấn công, hỗ trợ sút bóng xoáy.', 1, 0, 194, CAST(N'2025-02-01T06:39:51.513' AS DateTime), CAST(2551500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (21, N'Áo thi đấu Nike VaporKnit', 6, CAST(1200000 AS Decimal(18, 0)), 100, N'Áo thi đấu công nghệ VaporKnit, giúp vận động linh hoạt.', 1, 0, 104, CAST(N'2025-01-19T11:32:31.513' AS DateTime), CAST(972000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product21.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (22, N'Áo thi đấu Adidas Condivo 21', 6, CAST(1150000 AS Decimal(18, 0)), 90, N'Áo thi đấu Adidas Condivo 21 với thiết kế nhẹ, thoáng khí.', 1, 0, 377, CAST(N'2025-03-01T03:30:38.513' AS DateTime), CAST(931500 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product22.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (23, N'Áo thi đấu Puma Cup Jersey', 6, CAST(1100000 AS Decimal(18, 0)), 80, N'Áo thi đấu Puma Cup Jersey, phù hợp cho các trận đấu quan trọng.', 1, 0, 83, CAST(N'2025-01-21T05:50:19.513' AS DateTime), CAST(891000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product23.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (24, N'Quần short Nike Academy Pro', 6, CAST(750000 AS Decimal(18, 0)), 120, N'Quần short Nike Academy Pro, chất liệu thoáng khí.', 1, 0, 381, CAST(N'2025-02-19T23:41:22.513' AS DateTime), CAST(607500 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product24.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (25, N'Quần short Adidas Tiro 21', 6, CAST(730000 AS Decimal(18, 0)), 110, N'Quần short Adidas Tiro 21 với thiết kế thể thao năng động.', 1, 0, 164, CAST(N'2024-12-25T19:32:18.513' AS DateTime), CAST(591300 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product25.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (26, N'Áo thun thể thao Under Armour', 6, CAST(890000 AS Decimal(18, 0)), 95, N'Áo thun thể thao Under Armour giúp thoáng khí và khô nhanh.', 1, 0, 147, CAST(N'2024-12-22T22:11:16.513' AS DateTime), CAST(720900 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product26.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (27, N'Áo tập thể thao Puma Essentials', 6, CAST(800000 AS Decimal(18, 0)), 100, N'Áo tập thể thao Puma Essentials phù hợp cho mọi hoạt động.', 1, 0, 179, CAST(N'2024-12-21T09:40:36.513' AS DateTime), CAST(648000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product27.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (28, N'Quần short Adidas Core 18', 6, CAST(700000 AS Decimal(18, 0)), 110, N'Quần short Adidas Core 18 đơn giản nhưng đầy phong cách.', 1, 0, 126, CAST(N'2025-02-17T21:05:47.513' AS DateTime), CAST(567000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product28.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (29, N'Áo khoác thể thao Nike', 6, CAST(2000000 AS Decimal(18, 0)), 75, N'Áo khoác thể thao Nike giúp giữ ấm và chống gió hiệu quả.', 1, 0, 104, CAST(N'2025-03-12T05:48:16.513' AS DateTime), CAST(1620000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product29.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (30, N'Áo thi đấu Mizuno Global', 6, CAST(1250000 AS Decimal(18, 0)), 80, N'Áo thi đấu Mizuno Global dành cho cầu thủ chuyên nghiệp.', 1, 0, 336, CAST(N'2025-03-11T09:13:41.513' AS DateTime), CAST(1012500 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product30.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (31, N'Áo thun thể thao Nike Pro', 6, CAST(950000 AS Decimal(18, 0)), 105, N'Áo thun thể thao Nike Pro giúp tối ưu hiệu suất thi đấu.', 1, 0, 275, CAST(N'2025-01-04T17:40:22.513' AS DateTime), CAST(769500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (32, N'Quần short Puma Future', 6, CAST(770000 AS Decimal(18, 0)), 95, N'Quần short Puma Future mang đến sự thoải mái tối đa.', 1, 0, 230, CAST(N'2025-01-26T17:27:01.513' AS DateTime), CAST(623700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (33, N'Áo thi đấu Manchester United 2022', 1, CAST(1350000 AS Decimal(18, 0)), 70, N'Áo thi đấu chính thức của Manchester United mùa giải 2022.', 0, 0, 432, CAST(N'2025-01-15T11:08:57.513' AS DateTime), CAST(1093500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (34, N'Áo bảo vệ cơ thể Nike Pro Combat', 6, CAST(1650000 AS Decimal(18, 0)), 50, N'Áo bảo vệ cơ thể Nike Pro Combat giúp hỗ trợ vận động mạnh.', 1, 0, 30, CAST(N'2025-01-27T22:14:15.513' AS DateTime), CAST(1336500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (35, N'Áo dài tay Adidas Climacool', 6, CAST(1400000 AS Decimal(18, 0)), 65, N'Áo dài tay Adidas Climacool giúp giữ ấm mà vẫn thoáng khí.', 1, 0, 99, CAST(N'2025-01-06T21:50:55.513' AS DateTime), CAST(1134000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (36, N'Quần Nike Sportswear Tech Fleece', 6, CAST(1800000 AS Decimal(18, 0)), 80, N'Quần Nike Sportswear Tech Fleece với chất liệu cao cấp.', 1, 0, 324, CAST(N'2024-12-24T01:35:12.513' AS DateTime), CAST(1458000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (37, N'Áo thun Puma Suede', 6, CAST(950000 AS Decimal(18, 0)), 110, N'Áo thun Puma Suede với thiết kế đơn giản, phong cách.', 1, 0, 268, CAST(N'2024-12-16T16:24:04.513' AS DateTime), CAST(769500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (38, N'Áo sơ mi thể thao Nike Teamwear', 6, CAST(1100000 AS Decimal(18, 0)), 85, N'Áo sơ mi thể thao Nike Teamwear phù hợp cho các đội bóng.', 1, 0, 107, CAST(N'2024-12-25T01:23:09.513' AS DateTime), CAST(891000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (39, N'Quả bóng đá Nike Flight', 1, CAST(3200000 AS Decimal(18, 0)), 50, N'Bóng đá Nike Flight với thiết kế cải tiến cho độ ổn định cao.', 1, 1, 448, CAST(N'2025-02-10T06:02:41.513' AS DateTime), CAST(2592000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (40, N'Quả bóng đá Adidas Tango España', 1, CAST(3100000 AS Decimal(18, 0)), 45, N'Bóng Adidas Tango España cổ điển, sử dụng cho các giải đấu chuyên nghiệp.', 1, 0, 378, CAST(N'2024-12-31T14:56:18.513' AS DateTime), CAST(2511000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (41, N'Quả bóng đá Puma Future Grip', 1, CAST(2900000 AS Decimal(18, 0)), 40, N'Bóng đá Puma Future Grip với lớp phủ chống thấm nước, bám dính tốt.', 1, 0, 195, CAST(N'2025-01-29T11:46:04.513' AS DateTime), CAST(2349000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (42, N'Quả bóng đá Mizuno Morelia', 1, CAST(2700000 AS Decimal(18, 0)), 35, N'Bóng đá Mizuno Morelia với thiết kế tối ưu cho độ chính xác khi sút.', 1, 1, 499, CAST(N'2024-12-12T04:39:20.513' AS DateTime), CAST(2187000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (43, N'Quả bóng đá Adidas Conext 21', 1, CAST(3000000 AS Decimal(18, 0)), 48, N'Bóng Adidas Conext 21 được FIFA chứng nhận sử dụng trong các giải đấu lớn.', 1, 0, 278, CAST(N'2025-02-17T23:02:07.513' AS DateTime), CAST(2430000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (44, N'Quả bóng đá Nike Total 90', 1, CAST(3200000 AS Decimal(18, 0)), 50, N'Bóng Nike Total 90 với độ bền cao, phù hợp thi đấu ngoài trời.', 1, 0, 259, CAST(N'2025-03-15T17:15:58.513' AS DateTime), CAST(2592000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (45, N'Quả bóng đá Adidas Brazuca', 1, CAST(3500000 AS Decimal(18, 0)), 60, N'Bóng Adidas Brazuca chính thức của World Cup 2014, thiết kế 6 tấm ghép.', 1, 0, 187, CAST(N'2025-03-05T00:09:11.513' AS DateTime), CAST(2835000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (46, N'Quả bóng đá Puma Powercat', 1, CAST(3300000 AS Decimal(18, 0)), 38, N'Bóng Puma Powercat với độ nảy ổn định và kiểm soát bóng tốt.', 1, 0, 219, CAST(N'2025-02-04T09:23:36.513' AS DateTime), CAST(2673000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (47, N'Quả bóng đá Nike Mercurial', 1, CAST(2800000 AS Decimal(18, 0)), 45, N'Bóng Nike Mercurial dành cho các cầu thủ ưa thích tốc độ và kiểm soát bóng.', 1, 0, 151, CAST(N'2025-02-01T00:24:05.513' AS DateTime), CAST(2268000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (48, N'Quả bóng đá Adidas Tango 12', 1, CAST(3200000 AS Decimal(18, 0)), 50, N'Bóng Adidas Tango 12 chính thức của Euro 2012, nổi bật với thiết kế ba màu.', 1, 1, 491, CAST(N'2025-01-09T04:52:28.513' AS DateTime), CAST(2592000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (49, N'Quả bóng đá Nike Strike Premier League', 1, CAST(3300000 AS Decimal(18, 0)), 55, N'Bóng Nike Strike Premier League, phù hợp thi đấu trên sân cỏ tự nhiên.', 1, 0, 218, CAST(N'2025-01-21T08:41:07.513' AS DateTime), CAST(2673000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (50, N'Quả bóng đá Adidas UCL Finale', 1, CAST(2700000 AS Decimal(18, 0)), 40, N'Bóng Adidas UCL Finale chính thức của Champions League, họa tiết ngôi sao.', 1, 0, 388, CAST(N'2025-01-16T10:24:36.513' AS DateTime), CAST(2187000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (51, N'Quả bóng đá Nike Ordem V', 1, CAST(2600000 AS Decimal(18, 0)), 42, N'Bóng Nike Ordem V với thiết kế đa lớp giúp tối ưu kiểm soát.', 1, 0, 336, CAST(N'2025-03-09T18:23:48.513' AS DateTime), CAST(2106000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (52, N'Quả bóng đá Puma evoPOWER 1', 1, CAST(3200000 AS Decimal(18, 0)), 45, N'Bóng Puma evoPOWER 1 với lớp vỏ mềm giúp tăng lực sút.', 1, 1, 489, CAST(N'2025-01-19T12:46:21.513' AS DateTime), CAST(2592000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (53, N'Quả bóng đá Adidas Predator 20', 1, CAST(3100000 AS Decimal(18, 0)), 48, N'Bóng Adidas Predator 20 giúp tối ưu độ xoáy và kiểm soát bóng.', 1, 0, 192, CAST(N'2025-01-09T13:56:18.513' AS DateTime), CAST(2511000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (54, N'Quả bóng đá Nike Vapor', 1, CAST(3300000 AS Decimal(18, 0)), 50, N'Bóng Nike Vapor với cấu trúc giảm thiểu ma sát không khí.', 1, 0, 231, CAST(N'2025-01-26T19:55:21.513' AS DateTime), CAST(2673000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (55, N'Quả bóng đá Adidas Finale 19', 1, CAST(3400000 AS Decimal(18, 0)), 35, N'Bóng Adidas Finale 19 với họa tiết Champions League 2019.', 1, 0, 335, CAST(N'2024-12-16T14:14:25.513' AS DateTime), CAST(2754000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (56, N'Quả bóng đá Puma Liga', 1, CAST(2900000 AS Decimal(18, 0)), 40, N'Bóng Puma Liga với lớp vỏ PU chất lượng cao, phù hợp thi đấu chuyên nghiệp.', 1, 0, 344, CAST(N'2025-01-28T21:00:27.513' AS DateTime), CAST(2349000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (57, N'Quả bóng đá Nike Club', 1, CAST(3200000 AS Decimal(18, 0)), 60, N'Bóng Nike Club với thiết kế dành cho tập luyện và thi đấu bán chuyên.', 1, 0, 225, CAST(N'2025-02-01T00:54:04.513' AS DateTime), CAST(2592000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (58, N'Quả bóng đá Adidas Champions League', 1, CAST(3300000 AS Decimal(18, 0)), 30, N'Bóng Adidas Champions League phiên bản đặc biệt, độ bền cao.', 1, 0, 34, CAST(N'2024-12-30T18:40:48.513' AS DateTime), CAST(2673000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (59, N'Vợt cầu lông Yonex Astrox 100 ZZ', 2, CAST(3500000 AS Decimal(18, 0)), 40, N'Vợt Yonex Astrox 100 ZZ dành cho người chơi chuyên nghiệp, trợ lực mạnh mẽ.', 1, 1, 456, CAST(N'2025-01-21T21:27:30.513' AS DateTime), CAST(2835000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product59.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (60, N'Vợt cầu lông Victor Brave Sword 12', 2, CAST(3600000 AS Decimal(18, 0)), 50, N'Vợt Victor Brave Sword 12 có thiết kế khí động học giúp tốc độ vung nhanh hơn.', 1, 1, 455, CAST(N'2024-12-30T19:56:55.513' AS DateTime), CAST(2916000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product60.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (61, N'Vợt cầu lông Yonex Duora 10', 2, CAST(3200000 AS Decimal(18, 0)), 38, N'Vợt Yonex Duora 10 hỗ trợ tấn công mạnh và phòng thủ tốt.', 1, 0, 283, CAST(N'2024-12-29T09:04:02.513' AS DateTime), CAST(2592000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product61.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (62, N'Vợt cầu lông Victor Thruster K 9900', 2, CAST(3100000 AS Decimal(18, 0)), 42, N'Vợt Victor Thruster K 9900 giúp tối ưu lực đập mạnh và kiểm soát tốt.', 1, 0, 257, CAST(N'2025-02-22T15:15:19.513' AS DateTime), CAST(2511000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product62.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (63, N'Vợt cầu lông Yonex Nanoflare 700', 2, CAST(3000000 AS Decimal(18, 0)), 47, N'Vợt Yonex Nanoflare 700 cho tốc độ vung nhanh, phù hợp lối đánh phản công.', 1, 0, 26, CAST(N'2025-03-01T13:11:17.513' AS DateTime), CAST(2430000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product63.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (64, N'Vợt cầu lông Yonex Voltric Z Force II', 2, CAST(3400000 AS Decimal(18, 0)), 40, N'Vợt Yonex Voltric Z Force II dành cho người chơi ưa thích sức mạnh.', 1, 0, 434, CAST(N'2025-01-22T04:13:37.513' AS DateTime), CAST(2754000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product64.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (65, N'Vợt Victor Jetspeed S 12', 2, CAST(3000000 AS Decimal(18, 0)), 48, N'Vợt Victor Jetspeed S 12 kết hợp tốc độ và sự chính xác.', 0, 1, 448, CAST(N'2025-03-04T05:24:36.513' AS DateTime), CAST(2430000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product65.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (66, N'Vợt cầu lông Yonex Arcsaber 11', 2, CAST(3200000 AS Decimal(18, 0)), 42, N'Vợt Yonex Arcsaber 11 cho khả năng kiểm soát bóng tối ưu.', 1, 0, 293, CAST(N'2025-01-02T23:02:33.513' AS DateTime), CAST(2592000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product66.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (67, N'Vợt cầu lông Victor Hypernano X 8000', 2, CAST(3300000 AS Decimal(18, 0)), 38, N'Vợt Victor Hypernano X 8000 cân bằng giữa sức mạnh và độ chính xác.', 1, 0, 73, CAST(N'2024-12-23T17:24:29.513' AS DateTime), CAST(2673000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (68, N'Vợt cầu lông Yonex Nanoray 900', 2, CAST(3500000 AS Decimal(18, 0)), 45, N'Vợt Yonex Nanoray 900 phù hợp cho lối chơi nhanh và phản công.', 1, 0, 248, CAST(N'2025-01-14T11:30:08.513' AS DateTime), CAST(2835000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (69, N'Vợt cầu lông Yonex Voltric 7', 2, CAST(3400000 AS Decimal(18, 0)), 60, N'Vợt Yonex Voltric 7 với trợ lực mạnh mẽ, phù hợp cho người mới chơi.', 1, 0, 273, CAST(N'2025-01-21T16:46:06.513' AS DateTime), CAST(2754000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (70, N'Vợt cầu lông Victor Voltrix 60', 2, CAST(3200000 AS Decimal(18, 0)), 55, N'Vợt Victor Voltrix 60 giúp kiểm soát cầu chính xác và dễ điều khiển.', 1, 0, 176, CAST(N'2025-02-19T01:29:32.513' AS DateTime), CAST(2592000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (71, N'Vợt cầu lông Yonex Astrox 77', 2, CAST(3100000 AS Decimal(18, 0)), 48, N'Vợt Yonex Astrox 77 với công nghệ trợ lực giúp smash mạnh hơn.', 1, 0, 110, CAST(N'2025-02-23T06:41:19.513' AS DateTime), CAST(2511000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (72, N'Quả cầu lông Yonex AS 50', 2, CAST(3300000 AS Decimal(18, 0)), 100, N'Quả cầu Yonex AS 50 cao cấp, sử dụng trong thi đấu chuyên nghiệp.', 1, 0, 128, CAST(N'2025-03-04T07:17:24.513' AS DateTime), CAST(2673000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (73, N'Quả cầu lông Li-Ning A+ 1000', 2, CAST(3200000 AS Decimal(18, 0)), 120, N'Quả cầu Li-Ning A+ 1000 với độ bền cao, đường bay ổn định.', 1, 0, 246, CAST(N'2024-12-26T02:18:40.513' AS DateTime), CAST(2592000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (74, N'Quả cầu lông Victor Master', 2, CAST(3100000 AS Decimal(18, 0)), 110, N'Quả cầu Victor Master thiết kế chuyên dụng cho các giải đấu.', 1, 0, 243, CAST(N'2025-01-10T08:19:03.513' AS DateTime), CAST(2511000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (75, N'Quả cầu lông Yonex Aerosensa 50', 2, CAST(3000000 AS Decimal(18, 0)), 90, N'Quả cầu Yonex Aerosensa 50 dành cho người chơi chuyên nghiệp.', 1, 0, 430, CAST(N'2025-02-14T02:27:39.513' AS DateTime), CAST(2430000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (76, N'Quả cầu lông Li-Ning 2000', 2, CAST(2900000 AS Decimal(18, 0)), 130, N'Quả cầu Li-Ning 2000 được thiết kế để tăng tuổi thọ sử dụng.', 1, 0, 6, CAST(N'2025-01-19T07:59:26.513' AS DateTime), CAST(2349000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (77, N'Quả cầu lông Victor Shuttlecock', 2, CAST(2800000 AS Decimal(18, 0)), 115, N'Quả cầu Victor Shuttlecock có tốc độ bay chính xác, thích hợp cho mọi điều kiện thời tiết.', 1, 1, 478, CAST(N'2025-02-17T11:42:55.513' AS DateTime), CAST(2268000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (78, N'Quả cầu lông Yonex Mavis 350', 2, CAST(3300000 AS Decimal(18, 0)), 150, N'Quả cầu Yonex Mavis 350 bằng nhựa, phù hợp cho tập luyện và giải trí.', 1, 0, 420, CAST(N'2024-12-31T13:55:07.513' AS DateTime), CAST(2673000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (79, N'Quả cầu lông Li-Ning No. 1', 2, CAST(3000000 AS Decimal(18, 0)), 140, N'Quả cầu Li-Ning No. 1 được làm từ lông ngỗng tự nhiên, giúp đường bay ổn định.', 1, 0, 291, CAST(N'2025-03-17T02:09:30.513' AS DateTime), CAST(2430000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (80, N'Quả cầu lông Yonex AS 40', 2, CAST(3100000 AS Decimal(18, 0)), 95, N'Quả cầu Yonex AS 40 có độ bền cao, được nhiều tuyển thủ tin dùng.', 1, 0, 262, CAST(N'2025-01-07T19:04:52.513' AS DateTime), CAST(2511000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (81, N'Quả cầu lông Li-Ning No. 2', 2, CAST(3500000 AS Decimal(18, 0)), 125, N'Quả cầu Li-Ning No. 2 với thiết kế tiêu chuẩn thi đấu.', 1, 0, 375, CAST(N'2025-03-04T10:22:25.513' AS DateTime), CAST(2835000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (82, N'Quả cầu lông Victor Champion', 2, CAST(3400000 AS Decimal(18, 0)), 100, N'Quả cầu Victor Champion giúp kiểm soát cầu tốt và đường bay ổn định.', 1, 0, 93, CAST(N'2025-03-13T06:10:03.513' AS DateTime), CAST(2754000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (83, N'Quả cầu lông Yonex AS 30', 2, CAST(3200000 AS Decimal(18, 0)), 110, N'Quả cầu Yonex AS 30 được sử dụng phổ biến trong các trận đấu chuyên nghiệp.', 1, 0, 320, CAST(N'2025-03-03T08:55:25.513' AS DateTime), CAST(2592000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (84, N'Quả cầu lông Li-Ning A+ 500', 2, CAST(3000000 AS Decimal(18, 0)), 135, N'Quả cầu Li-Ning A+ 500 phù hợp cho các trận đấu bán chuyên.', 1, 0, 64, CAST(N'2024-12-29T20:55:46.513' AS DateTime), CAST(2430000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (85, N'Quả cầu lông Victor Victory', 2, CAST(3100000 AS Decimal(18, 0)), 120, N'Quả cầu Victor Victory với tốc độ ổn định, thích hợp cho mọi lối chơi.', 1, 0, 331, CAST(N'2025-01-28T11:37:35.513' AS DateTime), CAST(2511000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (86, N'Quả cầu lông Yonex Mavis 2000', 2, CAST(3300000 AS Decimal(18, 0)), 145, N'Quả cầu Yonex Mavis 2000 làm từ nhựa tổng hợp, độ bền cao.', 1, 0, 362, CAST(N'2025-01-15T05:42:31.513' AS DateTime), CAST(2673000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (87, N'Quả cầu lông Li-Ning A+ 2000', 2, CAST(3200000 AS Decimal(18, 0)), 130, N'Quả cầu Li-Ning A+ 2000 dành cho thi đấu chuyên nghiệp và bán chuyên.', 1, 1, 446, CAST(N'2025-02-16T04:08:51.513' AS DateTime), CAST(2592000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (88, N'Quả cầu lông Victor Eco Shuttlecock', 2, CAST(3100000 AS Decimal(18, 0)), 140, N'Quả cầu Victor Eco Shuttlecock được làm từ vật liệu thân thiện với môi trường.', 1, 0, 360, CAST(N'2025-01-23T15:04:06.513' AS DateTime), CAST(2511000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (89, N'Quả cầu lông Yonex Mavis 10', 2, CAST(3300000 AS Decimal(18, 0)), 160, N'Quả cầu Yonex Mavis 10 phù hợp cho người mới chơi và tập luyện.', 1, 0, 377, CAST(N'2025-01-07T02:46:42.513' AS DateTime), CAST(2673000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (90, N'Quả cầu lông Li-Ning No. 3', 2, CAST(3200000 AS Decimal(18, 0)), 125, N'Quả cầu Li-Ning No. 3 với thiết kế khí động học tối ưu.', 1, 0, 75, CAST(N'2025-01-31T03:27:47.513' AS DateTime), CAST(2592000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (91, N'Quả cầu lông Yonex AS 20', 2, CAST(3100000 AS Decimal(18, 0)), 110, N'Quả cầu Yonex AS 20 với độ bền cao và tốc độ bay chính xác.', 1, 0, 197, CAST(N'2025-02-22T22:04:18.513' AS DateTime), CAST(2511000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (92, N'Vợt tenis Wilson Pro Staff RF97 Autograph', 4, CAST(3300000 AS Decimal(18, 0)), 30, N'Vợt Wilson Pro Staff RF97 Autograph do Roger Federer sử dụng, độ kiểm soát cao.', 1, 0, 312, CAST(N'2025-01-07T17:31:02.513' AS DateTime), CAST(2673000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product92.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (93, N'Vợt tenis Babolat Pure Drive 2021', 4, CAST(3400000 AS Decimal(18, 0)), 40, N'Vợt Babolat Pure Drive 2021 với công nghệ FSI Power cho độ chính xác cao.', 1, 1, 486, CAST(N'2025-03-07T07:42:50.513' AS DateTime), CAST(2754000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product93.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (94, N'Vợt tenis Head Radical MP', 4, CAST(3500000 AS Decimal(18, 0)), 35, N'Vợt Head Radical MP có khả năng kiểm soát bóng và sức mạnh tuyệt vời.', 1, 0, 1, CAST(N'2025-03-08T06:29:11.513' AS DateTime), CAST(2835000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product94.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (95, N'Vợt tenis Yonex EZONE 98', 4, CAST(3600000 AS Decimal(18, 0)), 45, N'Vợt Yonex EZONE 98 dành cho người chơi thích lối đánh tấn công.', 1, 1, 481, CAST(N'2024-12-23T11:59:22.513' AS DateTime), CAST(2916000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product95.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (96, N'Vợt tenis Wilson Clash 100', 4, CAST(3700000 AS Decimal(18, 0)), 38, N'Vợt Wilson Clash 100 với độ linh hoạt và trợ lực cao.', 1, 0, 161, CAST(N'2025-02-21T12:11:43.513' AS DateTime), CAST(2997000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product96.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (97, N'Vợt tenis Babolat Pure Aero', 4, CAST(3800000 AS Decimal(18, 0)), 32, N'Vợt Babolat Pure Aero, phiên bản Rafael Nadal sử dụng, hỗ trợ xoáy mạnh.', 1, 0, 2, CAST(N'2025-02-06T21:31:38.513' AS DateTime), CAST(3078000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product97.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (98, N'Vợt tenis Head Speed Pro', 4, CAST(3900000 AS Decimal(18, 0)), 36, N'Vợt Head Speed Pro dành cho các tay vợt thích tốc độ và kiểm soát.', 1, 0, 192, CAST(N'2024-12-21T18:10:45.513' AS DateTime), CAST(3159000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product98.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (99, N'Vợt tenis Prince Textreme Tour 100P', 4, CAST(4000000 AS Decimal(18, 0)), 42, N'Vợt Prince Textreme Tour 100P giúp tối ưu độ xoáy và kiểm soát bóng.', 1, 0, 312, CAST(N'2025-02-25T00:54:59.513' AS DateTime), CAST(3240000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product99.jpg')
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (100, N'Vợt tenis Yonex VCORE 98', 4, CAST(4100000 AS Decimal(18, 0)), 39, N'Vợt Yonex VCORE 98 có thiết kế khí động học giúp tốc độ vung vợt nhanh hơn.', 1, 0, 189, CAST(N'2025-02-20T01:50:41.513' AS DateTime), CAST(3321000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product100.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (101, N'Vợt tenis Wilson Blade 98', 4, CAST(3500000 AS Decimal(18, 0)), 34, N'Vợt Wilson Blade 98 được các tay vợt chuyên nghiệp ưa chuộng.', 1, 1, 481, CAST(N'2025-02-21T02:14:56.513' AS DateTime), CAST(2835000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product101.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (102, N'Vợt tenis Babolat Pure Strike 16x19', 4, CAST(3400000 AS Decimal(18, 0)), 40, N'Vợt Babolat Pure Strike 16x19 kết hợp giữa sức mạnh và kiểm soát bóng.', 1, 0, 237, CAST(N'2024-12-27T06:10:00.513' AS DateTime), CAST(2754000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product102.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (103, N'Vợt tenis Head Prestige MP', 4, CAST(3300000 AS Decimal(18, 0)), 37, N'Vợt Head Prestige MP giúp tăng độ chính xác và cảm giác bóng.', 1, 0, 112, CAST(N'2025-03-09T17:19:20.513' AS DateTime), CAST(2673000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product103.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (104, N'Vợt tenis Wilson Burn 100S', 4, CAST(3200000 AS Decimal(18, 0)), 45, N'Vợt Wilson Burn 100S mang đến lực đánh mạnh mẽ.', 1, 0, 47, CAST(N'2024-12-29T06:38:53.513' AS DateTime), CAST(2592000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product104.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (105, N'Vợt tenis Yonex VCORE Pro 97', 4, CAST(3100000 AS Decimal(18, 0)), 31, N'Vợt Yonex VCORE Pro 97 cho cảm giác bóng tốt và kiểm soát vượt trội.', 1, 0, 157, CAST(N'2024-12-24T01:31:46.513' AS DateTime), CAST(2511000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product105.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (106, N'Vợt tenis Babolat Pure Control', 4, CAST(3000000 AS Decimal(18, 0)), 33, N'Vợt Babolat Pure Control với công nghệ cải tiến giúp tăng độ chính xác.', 1, 0, 377, CAST(N'2025-01-08T06:55:23.513' AS DateTime), CAST(2430000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product106.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (107, N'Vợt tenis Head Gravity MP', 4, CAST(3100000 AS Decimal(18, 0)), 41, N'Vợt Head Gravity MP giúp tối ưu cú đánh và tốc độ vung vợt.', 1, 0, 360, CAST(N'2025-02-07T04:40:58.513' AS DateTime), CAST(2511000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product107.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (108, N'Vợt tenis Wilson Ultra 100L', 4, CAST(3000000 AS Decimal(18, 0)), 44, N'Vợt Wilson Ultra 100L có trọng lượng nhẹ, dễ kiểm soát.', 1, 0, 85, CAST(N'2025-02-23T01:26:02.513' AS DateTime), CAST(2430000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (109, N'Vợt tenis Yonex Astrel 105', 4, CAST(2800000 AS Decimal(18, 0)), 38, N'Vợt Yonex Astrel 105 phù hợp với người chơi có kỹ thuật trung bình.', 1, 1, 496, CAST(N'2024-12-23T21:17:22.513' AS DateTime), CAST(2268000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (110, N'Vợt tenis Prince Phantom 100P', 4, CAST(2700000 AS Decimal(18, 0)), 30, N'Vợt Prince Phantom 100P với thiết kế mỏng giúp kiểm soát bóng tốt.', 1, 0, 268, CAST(N'2025-03-10T07:16:37.513' AS DateTime), CAST(2187000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (111, N'Vợt tenis Wilson Pro Staff 97L', 4, CAST(2600000 AS Decimal(18, 0)), 29, N'Vợt Wilson Pro Staff 97L nhẹ hơn bản RF97, phù hợp với nhiều cấp độ người chơi.', 1, 0, 348, CAST(N'2025-02-01T21:49:13.513' AS DateTime), CAST(2106000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (112, N'Quả tennis Wilson US Open', 4, CAST(2500000 AS Decimal(18, 0)), 120, N'Quả tennis Wilson US Open chính thức sử dụng tại giải Mỹ Mở Rộng.', 1, 0, 26, CAST(N'2024-12-17T18:32:27.513' AS DateTime), CAST(2025000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (113, N'Quả tennis Babolat French Open', 4, CAST(2400000 AS Decimal(18, 0)), 110, N'Quả tennis Babolat French Open được sử dụng tại Roland Garros.', 1, 0, 299, CAST(N'2025-01-27T06:44:46.513' AS DateTime), CAST(1944000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (114, N'Quả tennis Dunlop ATP', 4, CAST(2300000 AS Decimal(18, 0)), 130, N'Quả tennis Dunlop ATP với độ bền cao, dùng trong hệ thống ATP.', 1, 0, 324, CAST(N'2025-02-19T15:38:35.513' AS DateTime), CAST(1863000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (115, N'Quả tennis Head ATP', 4, CAST(2200000 AS Decimal(18, 0)), 125, N'Quả tennis Head ATP chuyên dụng cho thi đấu chuyên nghiệp.', 1, 0, 369, CAST(N'2025-02-28T07:37:41.513' AS DateTime), CAST(1782000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (116, N'Quả tennis Wilson Championship', 4, CAST(2100000 AS Decimal(18, 0)), 140, N'Quả tennis Wilson Championship có độ nảy chuẩn, bền bỉ.', 1, 0, 119, CAST(N'2025-02-09T14:56:58.513' AS DateTime), CAST(1701000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (117, N'Quả tennis Prince Tour', 4, CAST(2000000 AS Decimal(18, 0)), 135, N'Quả tennis Prince Tour phù hợp cho thi đấu và tập luyện nâng cao.', 1, 0, 130, CAST(N'2025-03-03T11:53:34.513' AS DateTime), CAST(1620000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (118, N'Quả tennis Yonex Tour', 4, CAST(1900000 AS Decimal(18, 0)), 150, N'Quả tennis Yonex Tour với thiết kế khí động học giúp kiểm soát tốt.', 1, 0, 3, CAST(N'2025-01-24T18:39:37.513' AS DateTime), CAST(1539000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (119, N'Quả tennis Babolat Championship', 4, CAST(1800000 AS Decimal(18, 0)), 160, N'Quả tennis Babolat Championship dành cho mọi mặt sân.', 1, 1, 478, CAST(N'2025-01-04T00:21:42.513' AS DateTime), CAST(1458000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (120, N'Quả tennis Dunlop Fort All Court', 4, CAST(1700000 AS Decimal(18, 0)), 120, N'Quả tennis Dunlop Fort All Court có độ bền cao, sử dụng trên nhiều loại sân.', 1, 0, 395, CAST(N'2025-02-23T04:15:09.513' AS DateTime), CAST(1377000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (121, N'Quả tennis Wilson NXT Tour', 4, CAST(1600000 AS Decimal(18, 0)), 110, N'Quả tennis Wilson NXT Tour cho cảm giác bóng êm và độ nảy chuẩn.', 1, 0, 403, CAST(N'2025-02-02T18:08:15.513' AS DateTime), CAST(1296000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (122, N'Quả tennis Head Tip 2', 4, CAST(1500000 AS Decimal(18, 0)), 140, N'Quả tennis Head Tip 2 dành cho người mới chơi và tập luyện.', 1, 0, 286, CAST(N'2025-02-26T03:23:26.513' AS DateTime), CAST(1215000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (123, N'Quả tennis Prince Premier', 4, CAST(1400000 AS Decimal(18, 0)), 130, N'Quả tennis Prince Premier với công nghệ tối ưu độ nảy.', 1, 0, 303, CAST(N'2025-01-17T15:06:54.513' AS DateTime), CAST(1134000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (124, N'Quả tennis Wilson Team', 4, CAST(1300000 AS Decimal(18, 0)), 115, N'Quả tennis Wilson Team dành cho các giải đấu nhỏ và bán chuyên.', 1, 0, 345, CAST(N'2024-12-21T15:58:17.513' AS DateTime), CAST(1053000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (125, N'Quả tennis Dunlop Grand Prix', 4, CAST(1200000 AS Decimal(18, 0)), 125, N'Quả tennis Dunlop Grand Prix được cải tiến về độ bền và kiểm soát.', 1, 0, 252, CAST(N'2025-01-17T14:37:03.513' AS DateTime), CAST(972000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (126, N'Quả tennis Yonex PolyTour Pro', 4, CAST(1100000 AS Decimal(18, 0)), 140, N'Quả tennis Yonex PolyTour Pro có độ xoáy và tốc độ bay tốt.', 1, 0, 367, CAST(N'2024-12-19T18:42:04.513' AS DateTime), CAST(891000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (127, N'Quả tennis Wilson Revolve', 4, CAST(1000000 AS Decimal(18, 0)), 110, N'Quả tennis Wilson Revolve phù hợp với các tay vợt có lực đánh mạnh.', 1, 1, 499, CAST(N'2025-01-10T01:04:24.513' AS DateTime), CAST(810000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (128, N'Quả tennis Babolat Gold', 4, CAST(900000 AS Decimal(18, 0)), 150, N'Quả tennis Babolat Gold với thiết kế tối ưu cho mặt sân cứng.', 1, 0, 360, CAST(N'2025-02-14T22:05:31.513' AS DateTime), CAST(729000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (129, N'Quả tennis Head Pro', 4, CAST(850000 AS Decimal(18, 0)), 135, N'Quả tennis Head Pro sử dụng trong các giải đấu chuyên nghiệp.', 1, 0, 319, CAST(N'2025-01-26T14:28:19.513' AS DateTime), CAST(688500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (130, N'Quả tennis Dunlop Pro', 4, CAST(800000 AS Decimal(18, 0)), 140, N'Quả tennis Dunlop Pro với công nghệ chống mài mòn vượt trội.', 1, 0, 112, CAST(N'2025-02-26T06:54:05.513' AS DateTime), CAST(648000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (131, N'Quả tennis Yonex EZONE', 4, CAST(750000 AS Decimal(18, 0)), 125, N'Quả tennis Yonex EZONE tối ưu cho cả tập luyện và thi đấu.', 1, 0, 266, CAST(N'2025-01-05T01:35:26.513' AS DateTime), CAST(607500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (132, N'Vợt bóng bàn Butterfly Timo Boll ALC', 3, CAST(700000 AS Decimal(18, 0)), 30, N'Vợt Butterfly Timo Boll ALC giúp kiểm soát bóng tốt và tăng độ xoáy.', 1, 0, 327, CAST(N'2025-01-23T11:41:41.513' AS DateTime), CAST(567000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product132.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (133, N'Vợt bóng bàn Donic Waldner Senso Carbon', 3, CAST(650000 AS Decimal(18, 0)), 35, N'Vợt Donic Waldner Senso Carbon mang lại tốc độ và cảm giác tuyệt vời.', 1, 0, 293, CAST(N'2025-01-30T16:38:38.513' AS DateTime), CAST(526500 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product133.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (134, N'Vợt bóng bàn Stiga Infinity VPS', 3, CAST(600000 AS Decimal(18, 0)), 40, N'Vợt Stiga Infinity VPS với cấu trúc ván gỗ 5 lớp, tối ưu độ bám bóng.', 1, 0, 366, CAST(N'2025-01-06T17:39:21.513' AS DateTime), CAST(486000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product134.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (135, N'Vợt bóng bàn Joola Rossi Emotion', 3, CAST(550000 AS Decimal(18, 0)), 38, N'Vợt Joola Rossi Emotion với thiết kế khí động học giúp tăng lực đánh.', 1, 1, 444, CAST(N'2025-01-01T14:45:22.513' AS DateTime), CAST(445500 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product135.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (136, N'Vợt bóng bàn Butterfly Viscaria', 3, CAST(500000 AS Decimal(18, 0)), 32, N'Vợt Butterfly Viscaria được nhiều tuyển thủ chuyên nghiệp sử dụng.', 1, 0, 252, CAST(N'2025-02-08T23:48:08.513' AS DateTime), CAST(405000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product136.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (137, N'Vợt bóng bàn Donic Ovtcharov True Carbon', 3, CAST(450000 AS Decimal(18, 0)), 34, N'Vợt Donic Ovtcharov True Carbon giúp tối ưu tốc độ và độ xoáy.', 1, 0, 383, CAST(N'2025-01-08T01:16:48.513' AS DateTime), CAST(364500 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product137.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (138, N'Vợt bóng bàn Stiga Carbonado 45', 3, CAST(400000 AS Decimal(18, 0)), 36, N'Vợt Stiga Carbonado 45 với công nghệ Carbon giúp tăng cường lực đánh.', 1, 0, 5, CAST(N'2025-03-01T09:37:15.513' AS DateTime), CAST(324000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product138.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (139, N'Vợt bóng bàn Joola AR', 3, CAST(350000 AS Decimal(18, 0)), 42, N'Vợt Joola AR dành cho người chơi có phong cách tấn công mạnh mẽ.', 1, 0, 282, CAST(N'2024-12-24T22:23:00.513' AS DateTime), CAST(283500 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product139.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (140, N'Vợt bóng bàn Tibhar Samsonov Force Pro', 3, CAST(300000 AS Decimal(18, 0)), 30, N'Vợt Tibhar Samsonov Force Pro có độ kiểm soát cao và tốc độ ổn định.', 1, 0, 40, CAST(N'2025-02-01T06:38:33.513' AS DateTime), CAST(243000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product140.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (141, N'Vợt bóng bàn Andro Super Core Carbon', 3, CAST(300000 AS Decimal(18, 0)), 33, N'Vợt Andro Super Core Carbon dành cho người chơi thích sự ổn định.', 1, 0, 298, CAST(N'2025-01-10T12:08:47.513' AS DateTime), CAST(243000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (142, N'Vợt bóng bàn Butterfly Zhang Jike ZLC', 3, CAST(310000 AS Decimal(18, 0)), 28, N'Vợt Butterfly Zhang Jike ZLC với công nghệ tiên tiến tăng độ bám bóng.', 1, 0, 431, CAST(N'2024-12-26T23:26:24.513' AS DateTime), CAST(251100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (143, N'Vợt bóng bàn Donic Persson Power AR', 3, CAST(320000 AS Decimal(18, 0)), 40, N'Vợt Donic Persson Power AR giúp tăng cường tốc độ đánh bóng.', 1, 1, 476, CAST(N'2025-01-06T06:13:43.513' AS DateTime), CAST(259200 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (144, N'Vợt bóng bàn Stiga Clipper CR WRB', 3, CAST(330000 AS Decimal(18, 0)), 38, N'Vợt Stiga Clipper CR WRB mang đến sự linh hoạt trong lối chơi.', 1, 0, 257, CAST(N'2025-02-20T03:54:29.513' AS DateTime), CAST(267300 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (145, N'Vợt bóng bàn Joola Rosskopf Allround', 3, CAST(340000 AS Decimal(18, 0)), 45, N'Vợt Joola Rosskopf Allround dành cho người chơi có phong cách toàn diện.', 1, 0, 382, CAST(N'2025-02-28T16:58:39.513' AS DateTime), CAST(275400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (146, N'Vợt bóng bàn DHS Hurricane Long 5', 3, CAST(350000 AS Decimal(18, 0)), 25, N'Vợt DHS Hurricane Long 5 giúp tối ưu cú đánh có lực mạnh.', 1, 0, 346, CAST(N'2025-02-03T20:50:55.513' AS DateTime), CAST(283500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (147, N'Vợt bóng bàn Butterfly Timo Boll Spirit', 3, CAST(360000 AS Decimal(18, 0)), 30, N'Vợt Butterfly Timo Boll Spirit giúp tối ưu độ kiểm soát bóng.', 1, 0, 33, CAST(N'2025-02-05T07:28:48.513' AS DateTime), CAST(291600 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (148, N'Vợt bóng bàn Donic Acuda S1', 3, CAST(370000 AS Decimal(18, 0)), 35, N'Vợt Donic Acuda S1 với công nghệ hiện đại giúp giảm rung động.', 1, 0, 272, CAST(N'2025-03-09T07:01:13.513' AS DateTime), CAST(299700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (149, N'Vợt bóng bàn Stiga Allround Classic', 3, CAST(380000 AS Decimal(18, 0)), 50, N'Vợt Stiga Allround Classic với thiết kế gỗ truyền thống giúp cảm giác bóng tốt hơn.', 1, 0, 385, CAST(N'2025-03-01T01:17:03.513' AS DateTime), CAST(307800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (150, N'Vợt bóng bàn Joola Energy Cell', 3, CAST(390000 AS Decimal(18, 0)), 48, N'Vợt Joola Energy Cell giúp người chơi có những cú đánh chính xác hơn.', 1, 0, 123, CAST(N'2025-02-10T19:34:09.513' AS DateTime), CAST(315900 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (151, N'Vợt bóng bàn Andro Ligna 7', 3, CAST(400000 AS Decimal(18, 0)), 34, N'Vợt Andro Ligna 7 với thiết kế 7 lớp gỗ giúp tăng độ bền và kiểm soát.', 1, 0, 363, CAST(N'2025-01-15T17:37:12.513' AS DateTime), CAST(324000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (152, N'Quả bóng bàn DHS 40+', 3, CAST(410000 AS Decimal(18, 0)), 200, N'Quả bóng bàn DHS 40+ có độ bền cao và phù hợp thi đấu.', 1, 0, 109, CAST(N'2025-02-18T22:19:50.513' AS DateTime), CAST(332100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (153, N'Quả bóng bàn Butterfly G40+', 3, CAST(420000 AS Decimal(18, 0)), 180, N'Quả bóng bàn Butterfly G40+ với tốc độ bay ổn định.', 1, 0, 231, CAST(N'2024-12-29T18:46:14.513' AS DateTime), CAST(340200 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (154, N'Quả bóng bàn Joola Flash', 3, CAST(430000 AS Decimal(18, 0)), 190, N'Quả bóng bàn Joola Flash có độ nảy chuẩn và độ bền cao.', 1, 0, 14, CAST(N'2025-01-08T14:04:07.513' AS DateTime), CAST(348300 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (155, N'Quả bóng bàn Stiga Optimum', 3, CAST(440000 AS Decimal(18, 0)), 210, N'Quả bóng bàn Stiga Optimum giúp tăng cường kiểm soát khi chơi.', 1, 0, 59, CAST(N'2025-03-11T05:11:48.513' AS DateTime), CAST(356400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (156, N'Quả bóng bàn Nittaku Premium', 3, CAST(450000 AS Decimal(18, 0)), 170, N'Quả bóng bàn Nittaku Premium được sử dụng trong các giải đấu chuyên nghiệp.', 1, 0, 114, CAST(N'2025-01-15T12:24:49.513' AS DateTime), CAST(364500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (157, N'Quả bóng bàn Donic Schildkröt', 3, CAST(460000 AS Decimal(18, 0)), 220, N'Quả bóng bàn Donic Schildkröt phù hợp cho cả thi đấu và tập luyện.', 1, 0, 240, CAST(N'2025-03-11T22:06:57.513' AS DateTime), CAST(372600 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (158, N'Quả bóng bàn Tibhar 40+', 3, CAST(470000 AS Decimal(18, 0)), 230, N'Quả bóng bàn Tibhar 40+ mang lại độ xoáy và độ nảy ổn định.', 1, 0, 78, CAST(N'2025-03-16T08:40:09.513' AS DateTime), CAST(380700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (159, N'Quả bóng bàn Andro Cell', 3, CAST(480000 AS Decimal(18, 0)), 200, N'Quả bóng bàn Andro Cell với thiết kế khí động học tối ưu.', 1, 0, 175, CAST(N'2025-02-28T11:36:11.513' AS DateTime), CAST(388800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (160, N'Quả bóng bàn Ping Pong 40+', 3, CAST(490000 AS Decimal(18, 0)), 250, N'Quả bóng bàn Ping Pong 40+ phù hợp cho người mới tập chơi.', 1, 1, 496, CAST(N'2024-12-20T14:09:46.513' AS DateTime), CAST(396900 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (161, N'Quả bóng bàn JOOLA 3-Star', 3, CAST(500000 AS Decimal(18, 0)), 180, N'Quả bóng bàn JOOLA 3-Star với độ bền cao, phù hợp cho giải đấu.', 1, 0, 328, CAST(N'2025-02-17T20:28:29.513' AS DateTime), CAST(405000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (162, N'Quả bóng bàn TSP 40+', 3, CAST(510000 AS Decimal(18, 0)), 230, N'Quả bóng bàn TSP 40+ giúp kiểm soát bóng chính xác hơn.', 1, 0, 263, CAST(N'2025-02-23T21:45:59.513' AS DateTime), CAST(413100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (163, N'Quả bóng bàn RITC', 3, CAST(520000 AS Decimal(18, 0)), 240, N'Quả bóng bàn RITC phù hợp với người chơi bán chuyên.', 1, 0, 364, CAST(N'2025-02-26T11:28:15.513' AS DateTime), CAST(421200 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (164, N'Quả bóng bàn DHS 3-Star', 3, CAST(530000 AS Decimal(18, 0)), 190, N'Quả bóng bàn DHS 3-Star giúp tối ưu tốc độ bóng.', 1, 0, 162, CAST(N'2025-01-01T02:16:26.513' AS DateTime), CAST(429300 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (165, N'Quả bóng bàn Xiom Vega Pro', 3, CAST(540000 AS Decimal(18, 0)), 220, N'Quả bóng bàn Xiom Vega Pro với độ ổn định cao.', 1, 0, 22, CAST(N'2025-01-11T07:27:18.513' AS DateTime), CAST(437400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (166, N'Quả bóng bàn Butterfly 40+', 3, CAST(550000 AS Decimal(18, 0)), 175, N'Quả bóng bàn Butterfly 40+ với công nghệ chống mài mòn.', 1, 0, 196, CAST(N'2025-02-01T13:40:56.513' AS DateTime), CAST(445500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (167, N'Quả bóng bàn Nittaku SHA', 3, CAST(560000 AS Decimal(18, 0)), 160, N'Quả bóng bàn Nittaku SHA dành cho các tay vợt chuyên nghiệp.', 1, 1, 496, CAST(N'2025-01-23T23:52:04.513' AS DateTime), CAST(453600 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (168, N'Quả bóng bàn Stiga 3-Star', 3, CAST(570000 AS Decimal(18, 0)), 195, N'Quả bóng bàn Stiga 3-Star được sử dụng trong các giải đấu lớn.', 1, 0, 333, CAST(N'2025-02-05T23:55:53.513' AS DateTime), CAST(461700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (169, N'Quả bóng bàn Xiom 40+', 3, CAST(580000 AS Decimal(18, 0)), 210, N'Quả bóng bàn Xiom 40+ với công nghệ giảm ma sát.', 1, 0, 380, CAST(N'2025-01-31T10:12:59.513' AS DateTime), CAST(469800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (170, N'Quả bóng bàn DHS W 40+', 3, CAST(590000 AS Decimal(18, 0)), 185, N'Quả bóng bàn DHS W 40+ phù hợp cho cả tập luyện và thi đấu.', 1, 1, 461, CAST(N'2024-12-12T03:13:07.513' AS DateTime), CAST(477900 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (171, N'Quả bóng bàn Donic Bluestorm', 3, CAST(600000 AS Decimal(18, 0)), 200, N'Quả bóng bàn Donic Bluestorm giúp tối ưu lực đánh.', 1, 1, 469, CAST(N'2025-03-01T04:22:08.513' AS DateTime), CAST(486000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (172, N'Mũ Nike Dri-FIT', 5, CAST(150000 AS Decimal(18, 0)), 120, N'Mũ Nike Dri-FIT với chất liệu thoáng khí giúp thấm hút mồ hôi tốt.', 1, 0, 135, CAST(N'2025-03-12T09:14:49.513' AS DateTime), CAST(121500 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product172.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (173, N'Mũ Adidas Performance', 5, CAST(140000 AS Decimal(18, 0)), 110, N'Mũ Adidas Performance phù hợp cho hoạt động thể thao và hàng ngày.', 1, 0, 234, CAST(N'2025-03-07T14:14:11.513' AS DateTime), CAST(113400 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product173.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (174, N'Mũ Under Armour Iso-Chill', 5, CAST(130000 AS Decimal(18, 0)), 100, N'Mũ Under Armour Iso-Chill giúp làm mát khi vận động.', 1, 0, 4, CAST(N'2025-03-09T16:22:07.513' AS DateTime), CAST(105300 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product174.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (175, N'Mũ Puma Golf', 5, CAST(120000 AS Decimal(18, 0)), 95, N'Mũ Puma Golf thiết kế tối giản nhưng sang trọng.', 1, 0, 10, CAST(N'2025-01-11T16:31:34.513' AS DateTime), CAST(97200 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product175.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (176, N'Mũ Reebok Classic', 5, CAST(110000 AS Decimal(18, 0)), 105, N'Mũ Reebok Classic với phong cách thể thao cổ điển.', 1, 0, 192, CAST(N'2025-02-22T08:28:19.513' AS DateTime), CAST(89100 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product176.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (177, N'Mũ New Era Sports', 5, CAST(100000 AS Decimal(18, 0)), 85, N'Mũ New Era Sports dành cho người yêu thích phong cách thể thao.', 1, 0, 306, CAST(N'2025-01-05T03:27:07.513' AS DateTime), CAST(81000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product177.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (178, N'Mũ Wilson Tour', 5, CAST(95000 AS Decimal(18, 0)), 115, N'Mũ Wilson Tour chuyên dụng cho vận động viên tennis.', 1, 0, 229, CAST(N'2025-02-22T16:49:19.513' AS DateTime), CAST(76950 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product178.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (179, N'Mũ The North Face', 5, CAST(85000 AS Decimal(18, 0)), 90, N'Mũ The North Face với chất liệu bền bỉ, phù hợp cho hoạt động ngoài trời.', 1, 0, 418, CAST(N'2025-03-12T01:28:11.513' AS DateTime), CAST(68850 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product179.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (180, N'Mũ Columbia Sportswear', 5, CAST(90000 AS Decimal(18, 0)), 100, N'Mũ Columbia Sportswear chống nắng, thích hợp cho mọi điều kiện thời tiết.', 1, 0, 385, CAST(N'2024-12-19T02:23:20.513' AS DateTime), CAST(72900 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product180.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (181, N'Mũ Oakley Golf', 5, CAST(100000 AS Decimal(18, 0)), 80, N'Mũ Oakley Golf với thiết kế hiện đại giúp bảo vệ khỏi tia UV.', 1, 0, 327, CAST(N'2025-01-29T01:04:48.513' AS DateTime), CAST(81000 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product181.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (182, N'Mũ Patagonia Hat', 5, CAST(105000 AS Decimal(18, 0)), 85, N'Mũ Patagonia Hat có phong cách tối giản, phù hợp với nhiều loại trang phục.', 1, 0, 186, CAST(N'2025-01-20T12:20:06.513' AS DateTime), CAST(85050 AS Decimal(18, 0)), N'C:\\Users\\Kien\\Pictures\\SWP391\\product182.jpg')
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (183, N'Mũ Under Armour Storm', 5, CAST(95000 AS Decimal(18, 0)), 95, N'Mũ Under Armour Storm giúp chống thấm nước và giữ đầu khô thoáng.', 1, 0, 211, CAST(N'2025-01-22T16:36:26.513' AS DateTime), CAST(76950 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (184, N'Mũ Nike Aerobill', 5, CAST(80000 AS Decimal(18, 0)), 70, N'Mũ Nike Aerobill với thiết kế nhẹ, hỗ trợ vận động linh hoạt.', 1, 0, 128, CAST(N'2025-02-28T03:41:33.513' AS DateTime), CAST(64800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (185, N'Mũ Adidas Climacool', 5, CAST(85000 AS Decimal(18, 0)), 75, N'Mũ Adidas Climacool giúp thoáng khí và giảm nhiệt khi chơi thể thao.', 1, 0, 70, CAST(N'2025-01-03T05:01:01.513' AS DateTime), CAST(68850 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (186, N'Mũ Dickies Work Hat', 5, CAST(120000 AS Decimal(18, 0)), 120, N'Mũ Dickies Work Hat với thiết kế đơn giản nhưng bền bỉ.', 1, 1, 486, CAST(N'2025-01-13T20:04:26.513' AS DateTime), CAST(97200 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (187, N'Mũ Columbia Hat', 5, CAST(110000 AS Decimal(18, 0)), 110, N'Mũ Columbia Hat giúp bảo vệ khỏi nắng và gió khi di chuyển ngoài trời.', 1, 0, 48, CAST(N'2025-02-22T01:26:14.513' AS DateTime), CAST(89100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (188, N'Mũ Nike Heritage86', 5, CAST(100000 AS Decimal(18, 0)), 100, N'Mũ Nike Heritage86 với thiết kế cổ điển, phù hợp với mọi phong cách.', 1, 0, 323, CAST(N'2025-02-08T01:34:50.513' AS DateTime), CAST(81000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (189, N'Mũ Puma Golf Tour', 5, CAST(90000 AS Decimal(18, 0)), 80, N'Mũ Puma Golf Tour dành riêng cho người chơi golf chuyên nghiệp.', 1, 0, 75, CAST(N'2025-03-10T02:24:30.513' AS DateTime), CAST(72900 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (190, N'Mũ Converse All Star', 5, CAST(110000 AS Decimal(18, 0)), 130, N'Mũ Converse All Star với thiết kế năng động, dễ phối đồ.', 1, 0, 191, CAST(N'2025-03-11T06:42:36.513' AS DateTime), CAST(89100 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (191, N'Mũ Nike Classic99', 5, CAST(95000 AS Decimal(18, 0)), 75, N'Mũ Nike Classic99 với thiết kế thời trang và phong cách.', 1, 0, 200, CAST(N'2025-02-02T19:12:45.513' AS DateTime), CAST(76950 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (192, N'Băng đô Nike Headband', 5, CAST(120000 AS Decimal(18, 0)), 150, N'Băng đô Nike giúp thấm hút mồ hôi và giữ tóc gọn gàng khi tập luyện.', 1, 0, 412, CAST(N'2025-02-01T01:43:41.513' AS DateTime), CAST(97200 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (193, N'Băng đô Adidas Performance', 5, CAST(160000 AS Decimal(18, 0)), 160, N'Băng đô Adidas Performance dành cho vận động viên.', 1, 1, 493, CAST(N'2025-02-17T17:42:21.513' AS DateTime), CAST(129600 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (194, N'Băng đô Under Armour', 5, CAST(150000 AS Decimal(18, 0)), 140, N'Băng đô Under Armour có khả năng co giãn tốt, phù hợp với mọi loại đầu.', 1, 0, 194, CAST(N'2025-02-10T05:52:23.513' AS DateTime), CAST(121500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (195, N'Băng đô Reebok Classic', 5, CAST(140000 AS Decimal(18, 0)), 170, N'Băng đô Reebok Classic có thiết kế phong cách, phù hợp khi chạy bộ.', 1, 1, 485, CAST(N'2024-12-13T01:43:31.513' AS DateTime), CAST(113400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (196, N'Băng đô Puma Gym', 5, CAST(170000 AS Decimal(18, 0)), 150, N'Băng đô Puma Gym hỗ trợ tập luyện cường độ cao.', 1, 0, 6, CAST(N'2025-01-15T18:05:28.513' AS DateTime), CAST(137700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (197, N'Băng đô Asics', 5, CAST(150000 AS Decimal(18, 0)), 145, N'Băng đô Asics giúp giữ tóc gọn gàng và thấm hút mồ hôi tốt.', 1, 1, 489, CAST(N'2025-03-11T04:21:56.513' AS DateTime), CAST(121500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (198, N'Băng đô Wilson Pro', 5, CAST(130000 AS Decimal(18, 0)), 130, N'Băng đô Wilson Pro dành cho người chơi tennis chuyên nghiệp.', 1, 1, 471, CAST(N'2025-03-01T20:27:52.513' AS DateTime), CAST(105300 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (199, N'Băng đô New Balance', 5, CAST(160000 AS Decimal(18, 0)), 160, N'Băng đô New Balance phù hợp cho mọi môn thể thao.', 1, 0, 341, CAST(N'2025-02-16T20:58:41.513' AS DateTime), CAST(129600 AS Decimal(18, 0)), NULL)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (200, N'Băng đô Fila', 5, CAST(180000 AS Decimal(18, 0)), 180, N'Băng đô Fila có thiết kế đơn giản, phong cách.', 1, 0, 52, CAST(N'2024-12-13T20:11:27.513' AS DateTime), CAST(145800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (201, N'Băng đô Yonex', 5, CAST(170000 AS Decimal(18, 0)), 170, N'Băng đô Yonex giúp thấm hút mồ hôi hiệu quả cho người chơi cầu lông.', 1, 0, 153, CAST(N'2024-12-27T00:00:13.513' AS DateTime), CAST(137700 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (202, N'Băng đô Babolat', 5, CAST(150000 AS Decimal(18, 0)), 150, N'Băng đô Babolat phù hợp với vận động viên tennis.', 1, 0, 440, CAST(N'2025-01-31T04:56:37.513' AS DateTime), CAST(121500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (203, N'Băng đô Mizuno', 5, CAST(160000 AS Decimal(18, 0)), 160, N'Băng đô Mizuno giúp giữ tóc gọn gàng khi thi đấu.', 1, 0, 311, CAST(N'2025-02-10T20:19:57.513' AS DateTime), CAST(129600 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (204, N'Băng đô Joma', 5, CAST(190000 AS Decimal(18, 0)), 190, N'Băng đô Joma phù hợp cho các hoạt động thể thao.', 1, 0, 408, CAST(N'2025-01-22T00:44:38.513' AS DateTime), CAST(153900 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (205, N'Băng đô Converse', 5, CAST(175000 AS Decimal(18, 0)), 175, N'Băng đô Converse với thiết kế phong cách trẻ trung.', 1, 0, 193, CAST(N'2025-02-06T00:40:07.513' AS DateTime), CAST(141750 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (206, N'Băng đô Skechers', 5, CAST(160000 AS Decimal(18, 0)), 160, N'Băng đô Skechers giúp hỗ trợ tập luyện hiệu quả.', 1, 0, 209, CAST(N'2025-01-14T13:59:44.513' AS DateTime), CAST(129600 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (207, N'Băng đô Kappa', 5, CAST(180000 AS Decimal(18, 0)), 180, N'Băng đô Kappa có thiết kế cổ điển nhưng hiện đại.', 1, 0, 255, CAST(N'2024-12-14T20:08:29.513' AS DateTime), CAST(145800 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (208, N'Băng đô Lotto', 5, CAST(140000 AS Decimal(18, 0)), 140, N'Băng đô Lotto với chất liệu co giãn thoải mái.', 1, 0, 2, CAST(N'2024-12-18T05:38:32.513' AS DateTime), CAST(113400 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (209, N'Băng đô Wilson Advantage', 5, CAST(130000 AS Decimal(18, 0)), 130, N'Băng đô Wilson Advantage dành cho người chơi tennis.', 1, 0, 45, CAST(N'2025-01-07T00:37:03.513' AS DateTime), CAST(105300 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (210, N'Băng đô Le Coq Sportif', 5, CAST(150000 AS Decimal(18, 0)), 150, N'Băng đô Le Coq Sportif với thiết kế thời trang thể thao.', 1, 0, 96, CAST(N'2025-01-19T18:32:13.513' AS DateTime), CAST(121500 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (211, N'Băng đô Nike Vapor', 5, CAST(125000 AS Decimal(18, 0)), 125, N'Băng đô Nike Vapor dành cho những buổi tập luyện cường độ cao.', 1, 0, 182, CAST(N'2025-01-12T18:21:48.513' AS DateTime), CAST(101250 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (225, N'Chai', 1, CAST(200000 AS Decimal(18, 0)), 20, N'test', 1, 0, 0, CAST(N'2025-03-25T21:19:00.000' AS DateTime), CAST(180000 AS Decimal(18, 0)), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [CategoryId], [Price], [Quantity], [Description], [Discontinued], [IsHot], [SoldQuantity], [CreateTime], [SalePrice], [image]) VALUES (227, N'test3', 2, CAST(2000000 AS Decimal(18, 0)), 5, N'test2', 1, 0, 0, CAST(N'2025-03-28T12:41:00.000' AS DateTime), CAST(1800000 AS Decimal(18, 0)), NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (1, 1, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (2, 1, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (3, 1, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (4, 1, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (5, 1, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (6, 1, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (7, 1, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (8, 1, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (9, 1, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (10, 1, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (11, 1, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (12, 1, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (13, 2, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (14, 2, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (15, 2, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (16, 2, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (18, 2, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (19, 2, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (20, 2, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (21, 2, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (22, 2, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (23, 2, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (24, 2, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (25, 3, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (26, 3, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (27, 3, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (28, 3, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (29, 3, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (30, 3, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (31, 3, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (32, 3, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (33, 3, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (34, 3, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (36, 3, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (37, 4, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (38, 4, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (39, 4, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (40, 4, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (41, 4, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (42, 4, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (43, 4, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (44, 4, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (45, 4, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (46, 4, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (47, 4, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (48, 4, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (49, 5, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (50, 5, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (51, 5, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (52, 5, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (53, 5, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (54, 5, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (55, 5, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (56, 5, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (57, 5, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (58, 5, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (59, 5, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (60, 5, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (61, 6, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (62, 6, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (63, 6, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (64, 6, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (65, 6, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (66, 6, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (67, 6, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (68, 6, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (69, 6, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (70, 6, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (71, 6, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (72, 6, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (73, 7, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (74, 7, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (75, 7, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (76, 7, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (77, 7, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (78, 7, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (79, 7, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (80, 7, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (81, 7, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (82, 7, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (83, 7, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (84, 7, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (85, 8, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (86, 8, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (87, 8, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (88, 8, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (89, 8, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (90, 8, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (91, 8, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (92, 8, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (93, 8, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (94, 8, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (95, 8, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (96, 8, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (97, 9, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (98, 9, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (99, 9, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (100, 9, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (101, 9, N'Vàng', N'40')
GO
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (102, 9, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (103, 9, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (104, 9, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (105, 9, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (106, 9, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (107, 9, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (108, 9, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (109, 10, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (110, 10, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (111, 10, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (112, 10, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (113, 10, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (114, 10, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (115, 10, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (116, 10, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (117, 10, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (118, 10, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (119, 10, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (120, 10, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (121, 11, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (122, 11, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (123, 11, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (124, 11, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (125, 11, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (126, 11, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (127, 11, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (128, 11, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (129, 11, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (130, 11, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (131, 11, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (132, 11, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (133, 12, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (134, 12, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (135, 12, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (136, 12, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (137, 12, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (138, 12, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (139, 12, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (140, 12, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (141, 12, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (142, 12, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (143, 12, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (144, 12, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (145, 13, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (146, 13, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (147, 13, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (148, 13, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (149, 13, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (150, 13, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (151, 13, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (152, 13, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (153, 13, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (154, 13, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (155, 13, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (156, 13, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (157, 14, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (158, 14, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (159, 14, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (160, 14, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (161, 14, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (162, 14, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (163, 14, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (164, 14, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (165, 14, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (166, 14, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (167, 14, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (168, 14, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (169, 15, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (170, 15, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (171, 15, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (172, 15, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (173, 15, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (174, 15, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (175, 15, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (176, 15, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (177, 15, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (178, 15, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (179, 15, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (180, 15, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (181, 16, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (182, 16, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (183, 16, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (184, 16, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (185, 16, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (186, 16, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (187, 16, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (188, 16, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (189, 16, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (190, 16, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (191, 16, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (192, 16, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (193, 17, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (194, 17, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (195, 17, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (196, 17, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (197, 17, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (198, 17, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (199, 17, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (200, 17, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (201, 17, N'Trắng', N'41')
GO
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (202, 17, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (203, 17, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (204, 17, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (205, 18, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (206, 18, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (207, 18, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (208, 18, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (209, 18, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (210, 18, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (211, 18, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (212, 18, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (213, 18, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (214, 18, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (215, 18, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (216, 18, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (217, 19, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (218, 19, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (219, 19, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (220, 19, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (221, 19, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (222, 19, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (223, 19, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (224, 19, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (225, 19, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (226, 19, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (227, 19, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (228, 19, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (229, 20, N'Đen', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (230, 20, N'Vàng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (231, 20, N'Trắng', N'39')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (232, 20, N'Đen', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (233, 20, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (234, 20, N'Trắng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (235, 20, N'Đen', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (236, 20, N'Vàng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (237, 20, N'Trắng', N'41')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (238, 20, N'Đen', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (239, 20, N'Vàng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (240, 20, N'Trắng', N'42')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (241, 21, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (242, 21, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (243, 21, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (244, 21, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (245, 21, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (246, 21, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (247, 21, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (248, 21, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (249, 21, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (250, 21, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (251, 21, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (252, 21, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (253, 22, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (254, 22, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (255, 22, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (256, 22, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (257, 22, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (258, 22, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (259, 22, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (260, 22, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (261, 22, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (262, 22, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (263, 22, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (264, 22, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (265, 23, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (266, 23, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (267, 23, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (268, 23, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (269, 23, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (270, 23, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (271, 23, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (272, 23, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (273, 23, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (274, 23, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (275, 23, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (276, 23, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (277, 24, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (278, 24, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (279, 24, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (280, 24, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (281, 24, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (282, 24, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (283, 24, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (284, 24, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (285, 24, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (286, 24, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (287, 24, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (288, 24, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (289, 25, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (290, 25, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (291, 25, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (292, 25, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (293, 25, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (294, 25, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (295, 25, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (296, 25, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (297, 25, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (298, 25, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (299, 25, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (300, 25, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (301, 26, N'Đen', N'S')
GO
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (302, 26, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (303, 26, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (304, 26, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (305, 26, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (306, 26, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (307, 26, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (308, 26, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (309, 26, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (310, 26, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (311, 26, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (312, 26, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (313, 27, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (314, 27, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (315, 27, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (316, 27, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (317, 27, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (318, 27, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (319, 27, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (320, 27, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (321, 27, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (322, 27, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (323, 27, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (324, 27, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (325, 28, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (326, 28, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (327, 28, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (328, 28, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (329, 28, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (330, 28, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (331, 28, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (332, 28, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (333, 28, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (334, 28, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (335, 28, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (336, 28, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (337, 29, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (338, 29, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (339, 29, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (340, 29, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (341, 29, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (342, 29, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (343, 29, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (344, 29, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (345, 29, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (346, 29, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (347, 29, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (348, 29, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (349, 30, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (350, 30, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (351, 30, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (352, 30, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (353, 30, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (354, 30, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (355, 30, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (356, 30, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (357, 30, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (358, 30, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (359, 30, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (360, 30, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (361, 31, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (362, 31, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (363, 31, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (364, 31, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (365, 31, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (366, 31, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (367, 31, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (368, 31, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (369, 31, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (370, 31, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (371, 31, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (372, 31, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (373, 32, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (374, 32, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (375, 32, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (376, 32, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (377, 32, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (378, 32, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (379, 32, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (380, 32, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (381, 32, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (382, 32, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (383, 32, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (384, 32, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (385, 33, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (386, 33, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (387, 33, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (388, 33, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (389, 33, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (390, 33, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (391, 33, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (392, 33, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (393, 33, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (394, 33, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (395, 33, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (396, 33, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (397, 34, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (398, 34, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (399, 34, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (400, 34, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (401, 34, N'Vàng', N'M')
GO
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (402, 34, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (403, 34, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (404, 34, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (405, 34, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (406, 34, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (407, 34, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (408, 34, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (409, 35, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (410, 35, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (411, 35, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (412, 35, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (413, 35, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (414, 35, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (415, 35, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (416, 35, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (417, 35, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (418, 35, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (419, 35, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (420, 35, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (421, 36, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (422, 36, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (423, 36, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (424, 36, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (425, 36, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (426, 36, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (427, 36, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (428, 36, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (429, 36, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (430, 36, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (431, 36, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (432, 36, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (433, 37, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (434, 37, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (435, 37, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (436, 37, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (437, 37, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (438, 37, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (439, 37, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (440, 37, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (441, 37, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (442, 37, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (443, 37, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (444, 37, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (445, 38, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (446, 38, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (447, 38, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (448, 38, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (449, 38, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (450, 38, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (451, 38, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (452, 38, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (453, 38, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (454, 38, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (455, 38, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (456, 38, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (457, 39, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (458, 39, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (459, 39, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (460, 39, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (461, 39, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (462, 39, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (463, 39, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (464, 39, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (465, 39, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (466, 39, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (467, 39, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (468, 39, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (469, 40, N'Đen', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (470, 40, N'Vàng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (471, 40, N'Trắng', N'S')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (472, 40, N'Đen', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (473, 40, N'Vàng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (474, 40, N'Trắng', N'M')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (475, 40, N'Đen', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (476, 40, N'Vàng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (477, 40, N'Trắng', N'L')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (478, 40, N'Đen', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (479, 40, N'Vàng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (480, 40, N'Trắng', N'XL')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (481, 41, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (482, 41, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (483, 41, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (484, 42, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (485, 42, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (486, 42, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (487, 43, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (488, 43, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (489, 43, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (490, 44, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (491, 44, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (492, 44, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (493, 45, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (494, 45, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (495, 45, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (496, 46, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (497, 46, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (498, 46, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (499, 47, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (500, 47, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (501, 47, N'Trắng', NULL)
GO
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (502, 48, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (503, 48, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (504, 48, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (505, 49, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (506, 49, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (507, 49, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (508, 50, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (509, 50, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (510, 50, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (511, 51, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (512, 51, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (513, 51, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (514, 52, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (515, 52, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (516, 52, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (517, 53, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (518, 53, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (519, 53, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (520, 54, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (521, 54, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (522, 54, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (523, 55, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (524, 55, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (525, 55, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (526, 56, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (527, 56, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (528, 56, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (529, 57, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (530, 57, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (531, 57, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (532, 58, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (533, 58, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (534, 58, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (535, 59, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (536, 59, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (537, 59, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (538, 60, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (539, 60, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (540, 60, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (541, 61, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (542, 61, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (543, 61, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (544, 62, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (545, 62, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (546, 62, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (547, 63, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (548, 63, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (549, 63, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (550, 64, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (551, 64, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (552, 64, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (553, 65, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (554, 65, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (555, 65, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (556, 66, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (557, 66, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (558, 66, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (559, 67, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (560, 67, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (561, 67, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (562, 68, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (563, 68, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (564, 68, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (565, 69, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (566, 69, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (567, 69, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (568, 70, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (569, 70, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (570, 70, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (571, 71, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (572, 71, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (573, 71, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (574, 72, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (575, 72, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (576, 72, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (577, 73, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (578, 73, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (579, 73, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (580, 74, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (581, 74, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (582, 74, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (583, 75, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (584, 75, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (585, 75, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (586, 76, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (587, 76, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (588, 76, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (589, 77, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (590, 77, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (591, 77, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (592, 78, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (593, 78, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (594, 78, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (595, 79, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (596, 79, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (597, 79, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (598, 80, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (599, 80, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (600, 80, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (601, 81, N'Đen', NULL)
GO
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (602, 81, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (603, 81, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (604, 82, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (605, 82, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (606, 82, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (607, 83, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (608, 83, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (609, 83, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (610, 84, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (611, 84, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (612, 84, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (613, 85, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (614, 85, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (615, 85, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (616, 86, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (617, 86, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (618, 86, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (619, 87, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (620, 87, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (621, 87, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (622, 88, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (623, 88, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (624, 88, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (625, 89, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (626, 89, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (627, 89, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (628, 90, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (629, 90, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (630, 90, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (631, 91, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (632, 91, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (633, 91, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (634, 92, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (635, 92, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (636, 92, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (637, 93, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (638, 93, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (639, 93, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (640, 94, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (641, 94, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (642, 94, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (643, 95, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (644, 95, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (645, 95, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (646, 96, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (647, 96, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (648, 96, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (649, 97, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (650, 97, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (651, 97, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (652, 98, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (653, 98, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (654, 98, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (655, 99, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (656, 99, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (657, 99, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (658, 100, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (659, 100, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (660, 100, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (661, 101, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (662, 101, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (663, 101, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (664, 102, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (665, 102, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (666, 102, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (667, 103, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (668, 103, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (669, 103, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (670, 104, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (671, 104, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (672, 104, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (673, 105, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (674, 105, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (675, 105, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (676, 106, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (677, 106, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (678, 106, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (679, 107, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (680, 107, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (681, 107, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (682, 108, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (683, 108, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (684, 108, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (685, 109, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (686, 109, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (687, 109, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (688, 110, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (689, 110, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (690, 110, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (691, 111, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (692, 111, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (693, 111, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (694, 112, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (695, 112, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (696, 112, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (697, 113, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (698, 113, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (699, 113, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (700, 114, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (701, 114, N'Vàng', NULL)
GO
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (702, 114, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (703, 115, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (704, 115, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (705, 115, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (706, 116, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (707, 116, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (708, 116, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (709, 117, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (710, 117, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (711, 117, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (712, 118, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (713, 118, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (714, 118, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (715, 119, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (716, 119, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (717, 119, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (718, 120, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (719, 120, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (720, 120, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (721, 121, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (722, 121, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (723, 121, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (724, 122, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (725, 122, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (726, 122, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (727, 123, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (728, 123, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (729, 123, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (730, 124, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (731, 124, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (732, 124, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (733, 125, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (734, 125, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (735, 125, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (736, 126, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (737, 126, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (738, 126, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (739, 127, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (740, 127, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (741, 127, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (742, 128, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (743, 128, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (744, 128, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (745, 129, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (746, 129, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (747, 129, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (748, 130, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (749, 130, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (750, 130, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (751, 131, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (752, 131, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (753, 131, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (754, 132, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (755, 132, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (756, 132, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (757, 133, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (758, 133, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (759, 133, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (760, 134, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (761, 134, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (762, 134, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (763, 135, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (764, 135, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (765, 135, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (766, 136, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (767, 136, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (768, 136, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (769, 137, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (770, 137, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (771, 137, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (772, 138, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (773, 138, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (774, 138, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (775, 139, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (776, 139, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (777, 139, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (778, 140, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (779, 140, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (780, 140, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (781, 141, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (782, 141, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (783, 141, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (784, 142, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (785, 142, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (786, 142, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (787, 143, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (788, 143, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (789, 143, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (790, 144, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (791, 144, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (792, 144, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (793, 145, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (794, 145, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (795, 145, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (796, 146, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (797, 146, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (798, 146, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (799, 147, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (800, 147, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (801, 147, N'Trắng', NULL)
GO
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (802, 148, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (803, 148, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (804, 148, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (805, 149, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (806, 149, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (807, 149, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (808, 150, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (809, 150, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (810, 150, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (811, 151, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (812, 151, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (813, 151, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (814, 152, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (815, 152, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (816, 152, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (817, 153, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (818, 153, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (819, 153, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (820, 154, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (821, 154, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (822, 154, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (823, 155, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (824, 155, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (825, 155, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (826, 156, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (827, 156, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (828, 156, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (829, 157, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (830, 157, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (831, 157, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (832, 158, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (833, 158, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (834, 158, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (835, 159, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (836, 159, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (837, 159, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (838, 160, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (839, 160, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (840, 160, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (841, 161, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (842, 161, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (843, 161, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (844, 162, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (845, 162, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (846, 162, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (847, 163, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (848, 163, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (849, 163, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (850, 164, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (851, 164, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (852, 164, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (853, 165, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (854, 165, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (855, 165, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (856, 166, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (857, 166, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (858, 166, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (859, 167, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (860, 167, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (861, 167, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (862, 168, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (863, 168, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (864, 168, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (865, 169, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (866, 169, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (867, 169, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (868, 170, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (869, 170, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (870, 170, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (871, 171, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (872, 171, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (873, 171, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (874, 172, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (875, 172, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (876, 172, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (877, 173, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (878, 173, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (879, 173, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (880, 174, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (881, 174, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (882, 174, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (883, 175, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (884, 175, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (885, 175, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (886, 176, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (887, 176, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (888, 176, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (889, 177, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (890, 177, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (891, 177, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (892, 178, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (893, 178, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (894, 178, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (895, 179, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (896, 179, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (897, 179, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (898, 180, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (899, 180, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (900, 180, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (901, 181, N'Đen', NULL)
GO
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (902, 181, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (903, 181, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (904, 182, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (905, 182, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (906, 182, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (907, 183, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (908, 183, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (909, 183, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (910, 184, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (911, 184, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (912, 184, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (913, 185, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (914, 185, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (915, 185, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (916, 186, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (917, 186, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (918, 186, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (919, 187, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (920, 187, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (921, 187, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (922, 188, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (923, 188, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (924, 188, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (925, 189, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (926, 189, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (927, 189, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (928, 190, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (929, 190, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (930, 190, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (931, 191, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (932, 191, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (933, 191, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (934, 192, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (935, 192, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (936, 192, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (937, 193, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (938, 193, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (939, 193, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (940, 194, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (941, 194, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (942, 194, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (943, 195, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (944, 195, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (945, 195, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (946, 196, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (947, 196, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (948, 196, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (949, 197, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (950, 197, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (951, 197, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (952, 198, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (953, 198, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (954, 198, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (955, 199, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (956, 199, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (957, 199, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (958, 200, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (959, 200, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (960, 200, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (961, 201, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (962, 201, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (963, 201, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (964, 202, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (965, 202, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (966, 202, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (967, 203, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (968, 203, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (969, 203, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (970, 204, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (971, 204, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (972, 204, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (973, 205, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (974, 205, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (975, 205, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (976, 206, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (977, 206, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (978, 206, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (979, 207, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (980, 207, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (981, 207, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (982, 208, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (983, 208, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (984, 208, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (985, 209, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (986, 209, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (987, 209, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (988, 210, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (989, 210, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (990, 210, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (991, 211, N'Đen', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (992, 211, N'Vàng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (993, 211, N'Trắng', NULL)
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (1006, 2, N'Vàng', N'40')
INSERT [dbo].[ProductDetail] ([DetailId], [ProductId], [Color], [Size]) VALUES (1007, 3, N'Vàng', N'42')
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Staff')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([ShippingId], [OrderId], [ShippingAddress], [ShippingStatus], [ShippingDate]) VALUES (1, 1, N'123 Main Street, Hanoi', N'Pending', CAST(N'2025-02-17T21:13:02.537' AS DateTime))
INSERT [dbo].[Shipping] ([ShippingId], [OrderId], [ShippingAddress], [ShippingStatus], [ShippingDate]) VALUES (2, 2, N'456 Oak Avenue, Ho Chi Minh City', N'Shipped', CAST(N'2025-02-17T21:13:02.537' AS DateTime))
INSERT [dbo].[Shipping] ([ShippingId], [OrderId], [ShippingAddress], [ShippingStatus], [ShippingDate]) VALUES (3, 3, N'789 Pine Road, Da Nang', N'Pending', CAST(N'2025-02-17T21:13:02.537' AS DateTime))
INSERT [dbo].[Shipping] ([ShippingId], [OrderId], [ShippingAddress], [ShippingStatus], [ShippingDate]) VALUES (4, 4, N'101 Maple Drive, Hai Phong', N'Shipped', CAST(N'2025-02-17T21:13:02.537' AS DateTime))
INSERT [dbo].[Shipping] ([ShippingId], [OrderId], [ShippingAddress], [ShippingStatus], [ShippingDate]) VALUES (5, 5, N'202 Birch Street, Nha Trang', N'Pending', CAST(N'2025-02-17T21:13:02.537' AS DateTime))
INSERT [dbo].[Shipping] ([ShippingId], [OrderId], [ShippingAddress], [ShippingStatus], [ShippingDate]) VALUES (6, 6, N'303 Cedar Lane, Can Tho', N'Shipped', CAST(N'2025-02-17T21:13:02.537' AS DateTime))
INSERT [dbo].[Shipping] ([ShippingId], [OrderId], [ShippingAddress], [ShippingStatus], [ShippingDate]) VALUES (7, 7, N'404 Elm Street, Hue', N'Pending', CAST(N'2025-02-17T21:13:02.537' AS DateTime))
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([SlideId], [SlideImg], [SlideTitle], [SlideDetail], [SlideDate], [EmployeeId]) VALUES (1, N'slide1.jpg', N'Slide Title 1', N'This is the first slide detail.', CAST(N'2025-02-17T21:48:07.410' AS DateTime), 1)
INSERT [dbo].[Slide] ([SlideId], [SlideImg], [SlideTitle], [SlideDetail], [SlideDate], [EmployeeId]) VALUES (2, N'slide2.jpg', N'Slide Title 2', N'This is the second slide detail.', CAST(N'2025-02-17T21:48:07.410' AS DateTime), 2)
INSERT [dbo].[Slide] ([SlideId], [SlideImg], [SlideTitle], [SlideDetail], [SlideDate], [EmployeeId]) VALUES (3, N'slide3.jpg', N'Slide Title 3', N'This is the third slide detail.', CAST(N'2025-02-17T21:48:07.410' AS DateTime), 3)
INSERT [dbo].[Slide] ([SlideId], [SlideImg], [SlideTitle], [SlideDetail], [SlideDate], [EmployeeId]) VALUES (4, N'slide4.jpg', N'Slide Title 4', N'This is the fourth slide detail.', CAST(N'2025-02-17T21:48:07.410' AS DateTime), 4)
INSERT [dbo].[Slide] ([SlideId], [SlideImg], [SlideTitle], [SlideDetail], [SlideDate], [EmployeeId]) VALUES (5, N'slide5.jpg', N'Slide Title 5', N'This is the fifth slide detail.', CAST(N'2025-02-17T21:48:07.410' AS DateTime), 5)
INSERT [dbo].[Slide] ([SlideId], [SlideImg], [SlideTitle], [SlideDetail], [SlideDate], [EmployeeId]) VALUES (6, N'slide6.jpg', N'Slide Title 6', N'This is the sixth slide detail.', CAST(N'2025-02-17T21:48:07.410' AS DateTime), 6)
INSERT [dbo].[Slide] ([SlideId], [SlideImg], [SlideTitle], [SlideDetail], [SlideDate], [EmployeeId]) VALUES (7, N'slide7.jpg', N'Slide Title 7', N'This is the seventh slide detail.', CAST(N'2025-02-17T21:48:07.410' AS DateTime), 7)
INSERT [dbo].[Slide] ([SlideId], [SlideImg], [SlideTitle], [SlideDetail], [SlideDate], [EmployeeId]) VALUES (8, N'slide8.jpg', N'Slide Title 8', N'This is the eighth slide detail.', CAST(N'2025-02-17T21:48:07.410' AS DateTime), 8)
INSERT [dbo].[Slide] ([SlideId], [SlideImg], [SlideTitle], [SlideDetail], [SlideDate], [EmployeeId]) VALUES (9, N'slide9.jpg', N'Slide Title 9', N'This is the ninth slide detail.', CAST(N'2025-02-17T21:48:07.410' AS DateTime), 9)
INSERT [dbo].[Slide] ([SlideId], [SlideImg], [SlideTitle], [SlideDetail], [SlideDate], [EmployeeId]) VALUES (10, N'slide10.jpg', N'Slide Title 10', N'This is the tenth slide detail.', CAST(N'2025-02-17T21:48:07.410' AS DateTime), 10)
SET IDENTITY_INSERT [dbo].[Slide] OFF
GO
ALTER TABLE [dbo].[Blog] ADD  DEFAULT (getdate()) FOR [BlogDate]
GO
ALTER TABLE [dbo].[CartDetail] ADD  DEFAULT (getdate()) FOR [AddDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF__Order__Date__74AE54BC]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [Discontinued]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((0)) FOR [SoldQuantity]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Shipping] ADD  DEFAULT (getdate()) FOR [ShippingDate]
GO
ALTER TABLE [dbo].[Slide] ADD  DEFAULT (getdate()) FOR [SlideDate]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD FOREIGN KEY([CartDetailId])
REFERENCES [dbo].[Cart] ([CartId])
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD FOREIGN KEY([CartDetailId])
REFERENCES [dbo].[Cart] ([CartId])
GO
ALTER TABLE [dbo].[CartDetail]  WITH CHECK ADD  CONSTRAINT [FK__CartDetai__Produ__71D1E811] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[CartDetail] CHECK CONSTRAINT [FK__CartDetai__Produ__71D1E811]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Role]
GO
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK__Feedback__Produc__05D8E0BE] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK__Feedback__Produc__05D8E0BE]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK__Order__CustomerI__75A278F5] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK__Order__CustomerI__75A278F5]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employees]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__787EE5A0] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Order__787EE5A0]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Produ__797309D9] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Produ__797309D9]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Category_Product] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Category_Product]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK__ProductDe__Produ__37703C52] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK__ProductDe__Produ__37703C52]
GO
ALTER TABLE [dbo].[Shipping]  WITH CHECK ADD  CONSTRAINT [FK__Shipping__OrderI__02FC7413] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[Shipping] CHECK CONSTRAINT [FK__Shipping__OrderI__02FC7413]
GO
ALTER TABLE [dbo].[Slide]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
ALTER TABLE [dbo].[Slide]  WITH CHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
GO
