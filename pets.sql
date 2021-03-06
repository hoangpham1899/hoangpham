USE [master]
GO
/****** Object:  Database [DBPetShop]    Script Date: 12/20/2019 4:08:03 PM ******/
CREATE DATABASE [DBPetShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBPetShop', FILENAME = N'D:\DBPetShop.mdf' )
 LOG ON 
( NAME = N'DBPetShop_log', FILENAME = N'D:\DBPetShop_log.ldf')
GO
ALTER DATABASE [DBPetShop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBPetShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBPetShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBPetShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBPetShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBPetShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBPetShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBPetShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBPetShop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DBPetShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBPetShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBPetShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBPetShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBPetShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBPetShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBPetShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBPetShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBPetShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBPetShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBPetShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBPetShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBPetShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBPetShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBPetShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBPetShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBPetShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBPetShop] SET  MULTI_USER 
GO
ALTER DATABASE [DBPetShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBPetShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBPetShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBPetShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DBPetShop]
GO

/****** Object:  Table [dbo].[Order]    Script Date: 07/20/2020 4:08:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[IDOrder] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NULL,
	[TotalMoney] [money] NULL,
	[Status] [bit] NULL,
	[PhoneNumber] [varchar](14) NULL,
	[Address] [nvarchar](max) NULL,
	[DateOrder] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[IDOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 07/20/2020 4:08:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[IDOrderDetails] [int] IDENTITY(1,1) NOT NULL,
	[IDOrder] [int] NULL,
	[IDPet] [int] NULL,
	[Quantity] [int] NULL,
	[TotalMoney] [money] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[IDOrderDetails] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pet]    Script Date: 07/20/2020 4:08:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet](
	[IDPet] [int] IDENTITY(1,1) NOT NULL,
	[PetName] [nvarchar](max) NULL,
	[Sex] [bit] NULL,
	[Descreptions] [nvarchar](max) NULL,
	[Age] [int] NULL,
	[IDSpecies] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[DateCreate] [datetime] NULL,
	[Price] [money] NULL,
	[Views] [int] NULL,
	[Rate] [float] NULL,
	[Vote] [int] NULL,
	[Summary] [nvarchar](max) NULL,
 CONSTRAINT [PK_Pet] PRIMARY KEY CLUSTERED 
(
	[IDPet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rep]    Script Date: 07/20/2020 4:08:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rep](
	[IDRep] [int] IDENTITY(1,1) NOT NULL,
	[IDComments] [int] NULL,
	[IDUser] [int] NULL,
	[Reply] [nvarchar](max) NULL,
	[DatePost] [datetime] NULL,
 CONSTRAINT [PK_Rep] PRIMARY KEY CLUSTERED 
(
	[IDRep] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Species]    Script Date: 07/20/2020 4:08:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Species](
	[IDSpecies] [int] IDENTITY(1,1) NOT NULL,
	[SpeciesName] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED 
(
	[IDSpecies] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Top]    Script Date: 07/20/2020 4:08:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Top](
	[IDTop] [int] IDENTITY(1,1) NOT NULL,
	[IDPet] [int] NULL,
	[Quanity] [int] NULL,
 CONSTRAINT [PK_Top] PRIMARY KEY CLUSTERED 
(
	[IDTop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 07/20/2020 4:08:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[DisplayName] [nvarchar](max) NULL,
	[Email] [varchar](100) NULL,
	[Password] [nvarchar](50) NULL,
	[Token] [nvarchar](max) NULL,
	[Role] [int] NULL,
	[PhoneNumber] [varchar](14) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Pet] ON 

INSERT [dbo].[Pet] ([IDPet], [PetName], [Sex], [Descreptions], [Age], [IDSpecies], [Image], [DateCreate], [Price], [Views], [Rate], [Vote], [Summary]) VALUES (1, N'Mèo', 0, N'meomeo', 1, 2, N'meo-meo.jpg', NULL, 1000000.0000, 0, 3, 1, N'meomeo')
INSERT [dbo].[Pet] ([IDPet], [PetName], [Sex], [Descreptions], [Age], [IDSpecies], [Image], [DateCreate], [Price], [Views], [Rate], [Vote], [Summary]) VALUES (2, N'Mèo', 1, N'meomeo', 2, 2, N'meo-meo.jpg', CAST(0x0000AB2800000000 AS DateTime), 1000000.0000, 0, 4, 1, N'meomeo')
INSERT [dbo].[Pet] ([IDPet], [PetName], [Sex], [Descreptions], [Age], [IDSpecies], [Image], [DateCreate], [Price], [Views], [Rate], [Vote], [Summary]) VALUES (3, N'Mèo', 1, N'meomeo', 1, 2, N'meo-meo.jpg', CAST(0x0000AB2800000000 AS DateTime), 1000000.0000, 0, 1, 2, N'meomeo')
INSERT [dbo].[Pet] ([IDPet], [PetName], [Sex], [Descreptions], [Age], [IDSpecies], [Image], [DateCreate], [Price], [Views], [Rate], [Vote], [Summary]) VALUES (4, N'Mèo', 1, N'meomeo', 1, 2, N'meo-meo.jpg', CAST(0x0000AB2800000000 AS DateTime), 1000000.0000, 3, 2, 1, N'meomeo')
INSERT [dbo].[Pet] ([IDPet], [PetName], [Sex], [Descreptions], [Age], [IDSpecies], [Image], [DateCreate], [Price], [Views], [Rate], [Vote], [Summary]) VALUES (5, N'Mèo', 0, N'meomeo', 1, 2, N'meo-meo.jpg', CAST(0x0000AB2800000000 AS DateTime), 1000000.0000, 1, 4.1000001089913507, 14, N'meomeo')
INSERT [dbo].[Pet] ([IDPet], [PetName], [Sex], [Descreptions], [Age], [IDSpecies], [Image], [DateCreate], [Price], [Views], [Rate], [Vote], [Summary]) VALUES (6, N'Mèo', 0, N'meomeo', 1, 2, N'meo-meo.jpg', CAST(0x0000AB2800000000 AS DateTime), 1000000.0000, 2, 3, 2, N'meomeo')
INSERT [dbo].[Pet] ([IDPet], [PetName], [Sex], [Descreptions], [Age], [IDSpecies], [Image], [DateCreate], [Price], [Views], [Rate], [Vote], [Summary]) VALUES (7, N'Chó1', 1, N'chó', 1, 5, N'cho-cho.jpg', NULL, 100000.0000, 0, 1, 1, N'chó')
INSERT [dbo].[Pet] ([IDPet], [PetName], [Sex], [Descreptions], [Age], [IDSpecies], [Image], [DateCreate], [Price], [Views], [Rate], [Vote], [Summary]) VALUES (8, N'Chim1', 0, N'chíp chíp', 1, 3, N'chim-chim.jpg', CAST(0x0000AB2900EE77EE AS DateTime), 100000.0000, 1, 1, 1, N'chíp')
INSERT [dbo].[Pet] ([IDPet], [PetName], [Sex], [Descreptions], [Age], [IDSpecies], [Image], [DateCreate], [Price], [Views], [Rate], [Vote], [Summary]) VALUES (9, N'cá1', 0, N'éc éc', 1, 4, N'ca-ca.jpg', CAST(0x0000AB2900EE9878 AS DateTime), 100000.0000, 1, 1, 1, N'1')
SET IDENTITY_INSERT [dbo].[Pet] OFF
SET IDENTITY_INSERT [dbo].[Species] ON 

INSERT [dbo].[Species] ([IDSpecies], [SpeciesName], [Image]) VALUES (2, N'Mèo', N'meo-meo.jpg')
INSERT [dbo].[Species] ([IDSpecies], [SpeciesName], [Image]) VALUES (3, N'Chim', N'chim-chim.jpg')
INSERT [dbo].[Species] ([IDSpecies], [SpeciesName], [Image]) VALUES (4, N'Cá', N'ca-ca.jpg')
INSERT [dbo].[Species] ([IDSpecies], [SpeciesName], [Image]) VALUES (5, N'Chó ', N'cho-cho.jpg')
SET IDENTITY_INSERT [dbo].[Species] OFF
SET IDENTITY_INSERT [dbo].[Top] ON 

INSERT [dbo].[Top] ([IDTop], [IDPet], [Quanity]) VALUES (1, 6, 1)
INSERT [dbo].[Top] ([IDTop], [IDPet], [Quanity]) VALUES (2, 9, 1)
INSERT [dbo].[Top] ([IDTop], [IDPet], [Quanity]) VALUES (1002, 8, 1)
SET IDENTITY_INSERT [dbo].[Top] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IDUser], [DisplayName], [Email], [Password], [Token], [Role], [PhoneNumber], [Address]) VALUES (1, N'Admin', N'Admin@1', N'1', NULL, 1, NULL, NULL)
INSERT [dbo].[User] ([IDUser], [DisplayName], [Email], [Password], [Token], [Role], [PhoneNumber], [Address]) VALUES (2, N'User', N'User@1', N'1', NULL, 0, NULL, NULL)
INSERT [dbo].[User] ([IDUser], [DisplayName], [Email], [Password], [Token], [Role], [PhoneNumber], [Address]) VALUES (3, N'Hoang', N'Hoang.1999.legend@gmail.com', N'1', N'5f91e5f9-a72f-4fc1-952b-ac9483ec27f1', 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Pet] FOREIGN KEY([IDPet])
REFERENCES [dbo].[Pet] ([IDPet])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Pet]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([IDOrder])
REFERENCES [dbo].[Order] ([IDOrder])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Pet] FOREIGN KEY([IDPet])
REFERENCES [dbo].[Pet] ([IDPet])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Pet]
GO
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Species] FOREIGN KEY([IDSpecies])
REFERENCES [dbo].[Species] ([IDSpecies])
GO
ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [FK_Pet_Species]
GO
ALTER TABLE [dbo].[Rep]  WITH CHECK ADD  CONSTRAINT [FK_Rep_Comments] FOREIGN KEY([IDComments])
REFERENCES [dbo].[Comments] ([IDComment])
GO
ALTER TABLE [dbo].[Rep] CHECK CONSTRAINT [FK_Rep_Comments]
GO
ALTER TABLE [dbo].[Rep]  WITH CHECK ADD  CONSTRAINT [FK_Rep_User] FOREIGN KEY([IDUser])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Rep] CHECK CONSTRAINT [FK_Rep_User]
GO
ALTER TABLE [dbo].[Top]  WITH CHECK ADD  CONSTRAINT [FK_Top_Pet] FOREIGN KEY([IDPet])
REFERENCES [dbo].[Pet] ([IDPet])
GO
ALTER TABLE [dbo].[Top] CHECK CONSTRAINT [FK_Top_Pet]
GO
USE [master]
GO
ALTER DATABASE [DBPetShop] SET  READ_WRITE 
GO
