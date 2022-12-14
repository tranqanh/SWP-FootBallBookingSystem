drop database SWPDatabase
USE [master]
GO
/****** Object:  Database [SWPDatabase]    Script Date: 8/2/2022 7:16:16 PM ******/
CREATE DATABASE [SWPDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWPDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LAUCHPAD\MSSQL\DATA\SWPDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWPDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LAUCHPAD\MSSQL\DATA\SWPDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWPDatabase] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWPDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWPDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWPDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWPDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWPDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWPDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWPDatabase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWPDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWPDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWPDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWPDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWPDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWPDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWPDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWPDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWPDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWPDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWPDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWPDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWPDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWPDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWPDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWPDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWPDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWPDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [SWPDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWPDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWPDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWPDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWPDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWPDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWPDatabase] SET QUERY_STORE = OFF
GO
USE [SWPDatabase]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/2/2022 7:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [nvarchar](50) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 8/2/2022 7:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[FeedBackID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Phone] [nvarchar](10) NULL,
	[DateFB] [date] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__FeedBack__E2CB3867A5FD351E] PRIMARY KEY CLUSTERED 
(
	[FeedBackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Field]    Script Date: 8/2/2022 7:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Field](
	[FieldID] [nvarchar](50) NOT NULL,
	[CategoryID] [nvarchar](50) NULL,
	[Img] [nvarchar](max) NULL,
	[FieldName] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 8/2/2022 7:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[DateNF] [date] NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 8/2/2022 7:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[SlotID] [int] NULL,
	[DateOder] [date] NOT NULL,
	[StandbyState] [nvarchar](10) NOT NULL,
	[Price] [money] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__OrderDet__D3B9D30C7F3AE151] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderTable]    Script Date: 8/2/2022 7:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderTable](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[CategoryID] [nvarchar](50) NULL,
	[OrderNote] [nvarchar](max) NULL,
	[RoleID] [nvarchar](50) NOT NULL,
	[TotalSlot] [int] NULL,
	[TotalPrice] [money] NULL,
	[Phone] [nvarchar](10) NOT NULL,
	[NameGuest] [nvarchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK__OrderTab__C3905BAF8DE0A6A7] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/2/2022 7:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [nvarchar](50) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slot]    Script Date: 8/2/2022 7:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slot](
	[SlotID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [nvarchar](50) NULL,
	[SlotName] [nvarchar](50) NOT NULL,
	[TimeStart] [nvarchar](20) NOT NULL,
	[TimeEnd] [nvarchar](20) NOT NULL,
	[Price] [money] NOT NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 8/2/2022 7:16:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTable](
	[UserID] [nvarchar](50) NOT NULL,
	[RoleID] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPassword] [nvarchar](50) NULL,
	[Phone] [nvarchar](10) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Point] [money] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK__UserTabl__1788CCAC3D332FA2] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status]) VALUES (N'F5', N'sân 5', 1)
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Status]) VALUES (N'F7', N'sân 7', 1)
GO
SET IDENTITY_INSERT [dbo].[FeedBack] ON 

INSERT [dbo].[FeedBack] ([FeedBackID], [UserName], [Phone], [DateFB], [Content], [Status]) VALUES (1, N'chien', N'0374857473', CAST(N'2022-07-25' AS Date), N'Người không quan tâm đến tôi, bạn dựa vào cái gì mà bảo tôi phải tiếp Người ta nghĩ sao về bạn, không có liên quan gì đến bạn. Bạn sống thế nào, cũng không có liên quan gì đến người ta', 1)
INSERT [dbo].[FeedBack] ([FeedBackID], [UserName], [Phone], [DateFB], [Content], [Status]) VALUES (5, N'thi', N'1', CAST(N'2022-07-25' AS Date), N'<p>1</p>', 1)
INSERT [dbo].[FeedBack] ([FeedBackID], [UserName], [Phone], [DateFB], [Content], [Status]) VALUES (8, N'thi', N'1', CAST(N'2022-07-25' AS Date), N'<p>j</p><p>&nbsp;</p>', 1)
INSERT [dbo].[FeedBack] ([FeedBackID], [UserName], [Phone], [DateFB], [Content], [Status]) VALUES (9, N'a', N'a', CAST(N'2022-07-30' AS Date), N'a', 1)
INSERT [dbo].[FeedBack] ([FeedBackID], [UserName], [Phone], [DateFB], [Content], [Status]) VALUES (10, N'a', N'a', CAST(N'2022-07-30' AS Date), N'a', 0)
SET IDENTITY_INSERT [dbo].[FeedBack] OFF
GO
INSERT [dbo].[Field] ([FieldID], [CategoryID], [Img], [FieldName], [Status]) VALUES (N'5A', N'F5', NULL, N'Sân 5', 1)
INSERT [dbo].[Field] ([FieldID], [CategoryID], [Img], [FieldName], [Status]) VALUES (N'5B', N'F5', NULL, N'Sân 5', 1)
INSERT [dbo].[Field] ([FieldID], [CategoryID], [Img], [FieldName], [Status]) VALUES (N'5C', N'F5', NULL, N'Sân 5', 1)
INSERT [dbo].[Field] ([FieldID], [CategoryID], [Img], [FieldName], [Status]) VALUES (N'7A', N'F7', NULL, N'Sân 7', 1)
INSERT [dbo].[Field] ([FieldID], [CategoryID], [Img], [FieldName], [Status]) VALUES (N'7B', N'F7', NULL, N'Sân 7', 1)
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([NotificationID], [DateNF], [Title], [Content], [Status]) VALUES (1, CAST(N'2022-02-08' AS Date), N'test1', N'ko co gi', 1)
INSERT [dbo].[Notification] ([NotificationID], [DateNF], [Title], [Content], [Status]) VALUES (2, CAST(N'2022-02-08' AS Date), N'tes2', N'co gi dau', 1)
INSERT [dbo].[Notification] ([NotificationID], [DateNF], [Title], [Content], [Status]) VALUES (3, CAST(N'2022-08-08' AS Date), N'test3', N'co me gi dau', 0)
INSERT [dbo].[Notification] ([NotificationID], [DateNF], [Title], [Content], [Status]) VALUES (4, CAST(N'2022-08-02' AS Date), N'ko co gi', N'a
', 1)
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
INSERT [dbo].[Role] ([RoleID], [RoleName], [Status]) VALUES (N'AD', N'Admin', 1)
INSERT [dbo].[Role] ([RoleID], [RoleName], [Status]) VALUES (N'GS', N'Guest', 1)
INSERT [dbo].[Role] ([RoleID], [RoleName], [Status]) VALUES (N'US', N'User', 1)
GO
SET IDENTITY_INSERT [dbo].[Slot] ON 

INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (1, N'F5', N'Slot 1', N'7:00', N'8:00', 1600000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (2, N'F5', N'Slot 2', N'8:00', N'9:00', 1600000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (3, N'F5', N'Slot 3', N'9:00', N'10:00', 1600000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (4, N'F5', N'Slot 4', N'10:00', N'11:00', 1600000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (5, N'F5', N'Slot 5', N'11:00', N'12:00', 1200000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (6, N'F5', N'Slot 6', N'12:15', N'13:15', 1200000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (7, N'F5', N'Slot 7', N'13:30', N'14:30', 1200000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (8, N'F5', N'Slot 8', N'15:00', N'16:00', 2500000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (9, N'F5', N'Slot 9', N'16:00', N'17:00', 2500000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (10, N'F5', N'Slot 10', N'17:00', N'18:00', 2500000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (11, N'F5', N'Slot 11', N'18:00', N'19:00', 3000000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (12, N'F5', N'Slot 12', N'19:00', N'20:00', 3000000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (13, N'F5', N'Slot 13', N'20:00', N'21:00', 2400000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (14, N'F5', N'Slot 14', N'21:00', N'22:00', 2400000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (15, N'F7', N'Slot 1', N'7:00', N'8:30', 3000000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (16, N'F7', N'Slot 2', N'8:30', N'10:00', 300000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (17, N'F7', N'Slot 3', N'10:00', N'11:30', 300000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (18, N'F7', N'Slot 4', N'12:00', N'13:30', 250000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (19, N'F7', N'Slot 5', N'13:30', N'15:00', 250000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (20, N'F7', N'Slot 6', N'15:00', N'16:30', 450000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (21, N'F7', N'Slot 7', N'16:30', N'18:00', 450000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (22, N'F7', N'Slot 8', N'18:00', N'19:30', 600000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (23, N'F7', N'Slot 9', N'19:30', N'21:00', 600000.0000, 1)
INSERT [dbo].[Slot] ([SlotID], [CategoryID], [SlotName], [TimeStart], [TimeEnd], [Price], [Status]) VALUES (24, N'F7', N'Slot 10', N'21:00', N'22:30', 450000.0000, 1)
SET IDENTITY_INSERT [dbo].[Slot] OFF
GO
INSERT [dbo].[UserTable] ([UserID], [RoleID], [UserName], [UserPassword], [Phone], [Email], [Address], [Point], [Status]) VALUES (N'admin', N'AD', N'toi la admin', N'1', N'0837445567', N'admin@gmail.com', N'TP HCM', NULL, 1)
INSERT [dbo].[UserTable] ([UserID], [RoleID], [UserName], [UserPassword], [Phone], [Email], [Address], [Point], [Status]) VALUES (N'GID', N'US', NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[UserTable] ([UserID], [RoleID], [UserName], [UserPassword], [Phone], [Email], [Address], [Point], [Status]) VALUES (N'test', N'US', N'tester', N'1', N'0473859387', N'test@gmail.com', N'Binh Duong', NULL, 1)
INSERT [dbo].[UserTable] ([UserID], [RoleID], [UserName], [UserPassword], [Phone], [Email], [Address], [Point], [Status]) VALUES (N'test2', N'US', N'tester2', N'1', N'048593839', N'chiennhse150667@fpt.edu.vn', N'Sky 9', NULL, 1)
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF__FeedBack__DateFB__32E0915F]  DEFAULT (getdate()) FOR [DateFB]
GO
ALTER TABLE [dbo].[Notification] ADD  CONSTRAINT [DF__Notificat__DateN__33D4B598]  DEFAULT (getdate()) FOR [DateNF]
GO
ALTER TABLE [dbo].[OrderTable] ADD  CONSTRAINT [df_RoleID_OrderTB]  DEFAULT ('GS') FOR [RoleID]
GO
ALTER TABLE [dbo].[UserTable] ADD  CONSTRAINT [df_RoleID]  DEFAULT ('US') FOR [RoleID]
GO
ALTER TABLE [dbo].[Field]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__38996AB5] FOREIGN KEY([OrderID])
REFERENCES [dbo].[OrderTable] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__Order__38996AB5]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__SlotI__398D8EEE] FOREIGN KEY([SlotID])
REFERENCES [dbo].[Slot] ([SlotID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__SlotI__398D8EEE]
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD  CONSTRAINT [FK__OrderTabl__Field__3A81B327] FOREIGN KEY([FieldID])
REFERENCES [dbo].[Field] ([FieldID])
GO
ALTER TABLE [dbo].[OrderTable] CHECK CONSTRAINT [FK__OrderTabl__Field__3A81B327]
GO
ALTER TABLE [dbo].[OrderTable]  WITH CHECK ADD  CONSTRAINT [FK__OrderTabl__UserI__3B75D760] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserTable] ([UserID])
GO
ALTER TABLE [dbo].[OrderTable] CHECK CONSTRAINT [FK__OrderTabl__UserI__3B75D760]
GO
ALTER TABLE [dbo].[Slot]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK__UserTable__RoleI__3D5E1FD2] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK__UserTable__RoleI__3D5E1FD2]
GO
USE [master]
GO
ALTER DATABASE [SWPDatabase] SET  READ_WRITE 
GO
SELECT OrderDetailID, OrderID, NameGuest, Phone, Price, DateOder, categoryID, slotID, StandbyState FROM (OrderDetail od left join OrderTable o ON od.OrderID=o.OrderID) where StandbyState = Paid
SELECT * from OrderDetail