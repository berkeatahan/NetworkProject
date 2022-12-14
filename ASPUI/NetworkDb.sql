USE [NetworkDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 24.11.2022 18:53:04 ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 24.11.2022 18:53:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 24.11.2022 18:53:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221122201148_first', N'6.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221123172405_AddImageMig', N'6.0.11')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (1, N'Jacket')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (2, N'Hoodie')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (3, N'Tshirt')
INSERT [dbo].[Categories] ([CategoryId], [CategoryName]) VALUES (4, N'Pants')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (1, 2, N'BelgiumHoodie.png', N'Belgium Hoodie', N'Belgium Hoodie', CAST(1000.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (2, 2, N'South85Hoodie.png', N'South 85 Hoodie', N'South 85 Hoodie', CAST(800.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (3, 2, N'BlackHoodie2.png', N'Black Hoodie', N'Black Hoodie', CAST(750.00 AS Decimal(18, 2)), 9)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (4, 2, N'NikeHoodie.png', N'Nike Hoodie', N'Nike Hoodie', CAST(1250.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (5, 1, N'GreyJacket.png', N'Grey Jacket', N'Grey Jacket', CAST(2000.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (7, 1, N'HHJacket.png', N'Helly Henson Jacket', N'Helly Henson Jacket', CAST(2250.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (8, 1, N'LeatherJacket.png', N'Leather Jacket', N'Leather Jacket', CAST(1890.00 AS Decimal(18, 2)), 6)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (9, 1, N'BrownJacket.png', N'Brown Jacket', N'Brown Jacket', CAST(2400.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (10, 3, N'PoloRedTshirt.png', N'Polo Red Tshirt', N'Polo Red Tshirt', CAST(200.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (11, 3, N'WhiteTshirt.png', N'White Tshirt', N'White Shirt', CAST(150.00 AS Decimal(18, 2)), 20)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (12, 3, N'BarcelonaTshirt.png', N'Barcelona Tshirt', N'Barcelona Tshirt', CAST(500.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (13, 3, N'BlackTshirt.png', N'Black Tshirt', N'Black Tshirt', CAST(250.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (14, 4, N'CargoPant.png', N'Cargo Pant', N'Cargo Pant', CAST(750.00 AS Decimal(18, 2)), 7)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (15, 4, N'GreenPant.png', N'Green Pant', N'Green Pant', CAST(450.00 AS Decimal(18, 2)), 9)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (16, 4, N'CreamColorPant.png', N'Cream Color Pant', N'Cream Color Pant', CAST(700.00 AS Decimal(18, 2)), 8)
INSERT [dbo].[Products] ([Id], [CategoryId], [ImageUrl], [Name], [Description], [Price], [Stock]) VALUES (17, 4, N'Jean.png', N'Mom Jean', N'Mom Jean', CAST(600.00 AS Decimal(18, 2)), 6)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF__Products__ImageU__5AEE82B9]  DEFAULT (N'') FOR [ImageUrl]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
