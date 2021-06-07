USE [master]
GO
/****** Object:  Database [WMDATABSE]    Script Date: 04.06.2021 14:19:51 ******/
CREATE DATABASE [WMDATABSE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WMDATABSE_Data', FILENAME = N'c:\dzsqls\WMDATABSE.mdf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 LOG ON 
( NAME = N'WMDATABSE_Logs', FILENAME = N'c:\dzsqls\WMDATABSE.ldf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
GO
ALTER DATABASE [WMDATABSE] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WMDATABSE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WMDATABSE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WMDATABSE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WMDATABSE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WMDATABSE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WMDATABSE] SET ARITHABORT OFF 
GO
ALTER DATABASE [WMDATABSE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WMDATABSE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WMDATABSE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WMDATABSE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WMDATABSE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WMDATABSE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WMDATABSE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WMDATABSE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WMDATABSE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WMDATABSE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WMDATABSE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WMDATABSE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WMDATABSE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WMDATABSE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WMDATABSE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WMDATABSE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WMDATABSE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WMDATABSE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WMDATABSE] SET  MULTI_USER 
GO
ALTER DATABASE [WMDATABSE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WMDATABSE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WMDATABSE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WMDATABSE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WMDATABSE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WMDATABSE] SET QUERY_STORE = OFF
GO
USE [WMDATABSE]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [WMDATABSE]
GO
/****** Object:  User [frr4mke_SQLLogin_1]    Script Date: 04.06.2021 14:19:53 ******/
CREATE USER [frr4mke_SQLLogin_1] FOR LOGIN [frr4mke_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [frr4mke_SQLLogin_1]
GO
/****** Object:  Schema [frr4mke_SQLLogin_1]    Script Date: 04.06.2021 14:19:53 ******/
CREATE SCHEMA [frr4mke_SQLLogin_1]
GO
/****** Object:  Table [dbo].[AuthOption]    Script Date: 04.06.2021 14:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthOption](
	[issuer] [varchar](max) NOT NULL,
	[audience] [varchar](max) NOT NULL,
	[secret] [varchar](max) NOT NULL,
	[tokenLifetime] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CitiesServed]    Script Date: 04.06.2021 14:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CitiesServed](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_title] [varchar](30) NOT NULL,
 CONSTRAINT [PK_CitiesServed] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryMethods]    Script Date: 04.06.2021 14:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryMethods](
	[delivery_id] [int] IDENTITY(1,1) NOT NULL,
	[delivery_title] [varchar](30) NOT NULL,
 CONSTRAINT [PK_DeliveryMethods] PRIMARY KEY CLUSTERED 
(
	[delivery_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 04.06.2021 14:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[error_id] [int] IDENTITY(1,1) NOT NULL,
	[eventdatetime] [datetime] NOT NULL,
	[stacktrace] [varchar](max) NOT NULL,
	[message] [varchar](max) NOT NULL,
	[source] [varchar](max) NOT NULL,
	[errordescription] [varchar](max) NOT NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[error_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 04.06.2021 14:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[image_title] [varchar](max) NOT NULL,
	[sort] [int] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 04.06.2021 14:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturers](
	[manufacturer_id] [int] IDENTITY(1,1) NOT NULL,
	[manufacturer_title] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[manufacturer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 04.06.2021 14:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[fio] [varchar](max) NOT NULL,
	[phoneNumber] [varchar](max) NOT NULL,
	[payment_id] [int] NOT NULL,
	[city_id] [int] NOT NULL,
	[deliveryAddress] [varchar](max) NOT NULL,
	[delivery_id] [int] NOT NULL,
	[orderdatetime] [datetime] NOT NULL,
	[device] [varchar](20) NOT NULL,
	[orderstate] [int] NOT NULL,
	[comment] [varchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 04.06.2021 14:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetails](
	[orderDetails_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
	[productOptions_id] [int] NOT NULL,
 CONSTRAINT [PK_OrdersDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetails_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 04.06.2021 14:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethods](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_title] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Paymentmethods] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAttributes]    Script Date: 04.06.2021 14:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttributes](
	[productAttributes_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[attribute_group] [varchar](max) NOT NULL,
	[attribute] [varchar](max) NOT NULL,
	[text] [varchar](max) NOT NULL,
 CONSTRAINT [PK_ProductAttributes] PRIMARY KEY CLUSTERED 
(
	[productAttributes_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductOptions]    Script Date: 04.06.2021 14:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductOptions](
	[productOptions_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[power] [numeric](18, 0) NULL,
	[layingArea] [numeric](10, 2) NULL,
	[wireLength] [numeric](10, 2) NULL,
	[price] [numeric](18, 0) NOT NULL,
	[matLength] [numeric](10, 2) NULL,
 CONSTRAINT [PK_ProductOptions] PRIMARY KEY CLUSTERED 
(
	[productOptions_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 04.06.2021 14:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_title] [varchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
	[manufacturer_id] [int] NOT NULL,
	[description] [varchar](max) NOT NULL,
	[full_product_title] [varchar](max) NOT NULL,
	[sort_order] [int] NOT NULL,
	[productType_id] [int] NOT NULL,
	[country] [varchar](max) NULL,
	[subProductType_id] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 04.06.2021 14:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[productType_id] [int] IDENTITY(1,1) NOT NULL,
	[productType_title] [varchar](max) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[productType_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04.06.2021 14:19:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](40) NOT NULL,
	[password] [varchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AuthOption] ([issuer], [audience], [secret], [tokenLifetime]) VALUES (N'authServer', N'resourceServer', N'secretKey1234567789', 10800)
GO
SET IDENTITY_INSERT [dbo].[CitiesServed] ON 
GO
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (1, N'Москва')
GO
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (2, N'Балашиха')
GO
SET IDENTITY_INSERT [dbo].[CitiesServed] OFF
GO
SET IDENTITY_INSERT [dbo].[DeliveryMethods] ON 
GO
INSERT [dbo].[DeliveryMethods] ([delivery_id], [delivery_title]) VALUES (1, N'Самовывоз')
GO
INSERT [dbo].[DeliveryMethods] ([delivery_id], [delivery_title]) VALUES (2, N'Курьером')
GO
SET IDENTITY_INSERT [dbo].[DeliveryMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[ErrorLog] ON 
GO
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (1, CAST(N'2021-05-04T03:07:17.433' AS DateTime), N'   at System.Net.Mail.MailAddress..ctor(String address, String displayName, Encoding displayNameEncoding)
   at System.Net.Mail.MailAddress..ctor(String address, String displayName)
   at Mail.NetMail.SendFromTo(String senderName, String fromAdress, String toAdress, String subject, String text, String credentials) in D:\Projects\WM2\WMServer\Mail\NetMail.cs:line 13
   at Mail.MailHandler.SendToYourSelf(String subject, String text) in D:\Projects\WM2\WMServer\Mail\MailHandler.cs:line 25', N'Value cannot be null. (Parameter ''address'')', N'?????? ??????????? ??????, ??? ??????????? ??????', N'System.Net.Mail')
GO
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (2, CAST(N'2021-05-04T05:11:30.087' AS DateTime), N'   at System.Net.Mail.MailAddress..ctor(String address, String displayName, Encoding displayNameEncoding)
   at System.Net.Mail.MailAddress..ctor(String address, String displayName)
   at Mail.NetMail.SendFromTo(String senderName, String fromAdress, String toAdress, String subject, String text, String credentials) in D:\Projects\WM2\WMServer\Mail\NetMail.cs:line 13
   at Mail.MailHandler.SendToYourSelf(String subject, String text) in D:\Projects\WM2\WMServer\Mail\MailHandler.cs:line 25', N'Value cannot be null. (Parameter ''address'')', N'?????? ??????????? ??????, ??? ??????????? ??????', N'System.Net.Mail')
GO
SET IDENTITY_INSERT [dbo].[ErrorLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (164, 10, N'../../../assets/images/FENIX/FenixUltraCM.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (165, 11, N'../../../assets/images/FENIX/FenixUltraLTDSM.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (166, 12, N'../../../assets/images/FENIX/FenixUltraLTDS.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (167, 13, N'../../../assets/images/FENIX/FenixAD.JPG', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (168, 14, N'../../../assets/images/FENIX/FenixAD.JPG', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (169, 15, N'../../../assets/images/FENIX/FenixAD.JPG', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (170, 16, N'../../../assets/images/FENIX/Fenix.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (171, 17, N'../../../assets/images/FENIX/FenixAD.JPG', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (172, 18, N'../../../assets/images/FENIX/FenixAD.JPG', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (173, 1, N'../../../assets/images/HEMSTEDT/HemDH.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (174, 2, N'../../../assets/images/HEMSTEDT/HemDR.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (175, 3, N'../../../assets/images/HEMSTEDT/HemBR-IM.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (176, 4, N'../../../assets/images/HEMSTEDT/HemBRF.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (177, 5, N'../../../assets/images/HEMSTEDT/HemBRF.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (178, 6, N'../../../assets/images/HEMSTEDT/HemDAS.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (179, 7, N'../../../assets/images/HEMSTEDT/HemDAS.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (180, 8, N'../../../assets/images/HEMSTEDT/HemFS.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (181, 9, N'../../../assets/images/HEMSTEDT/HemDI.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (188, 19, N'../../../assets/images/INTHERM/INTHERM200.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (189, 20, N'../../../assets/images/INTHERM/INTHERM20.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (190, 21, N'../../../assets/images/INTHERM/INTHERM20.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (191, 22, N'../../../assets/images/INTHERM/INTHERMECO.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (192, 23, N'../../../assets/images/INTHERM/INTHERMAFMAT.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (193, 24, N'../../../assets/images/INTHERM/INTHERMAFMAT.jpg', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (196, 25, N'../../../assets/images/TERMOSTATS/INTHERMRTC70.JPG', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (197, 26, N'../../../assets/images/TERMOSTATS/INTHERME51.JPG', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (198, 27, N'../../../assets/images/TERMOSTATS/INTHERMPWT002.png', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (199, 28, N'../../../assets/images/TERMOSTATS/INTHERME91.JPG', 1)
GO
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (200, 29, N'../../../assets/images/TERMOSTATS/WARMLIFE.jpg', 1)
GO
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturers] ON 
GO
INSERT [dbo].[Manufacturers] ([manufacturer_id], [manufacturer_title]) VALUES (1, N'HEMSTEDT')
GO
INSERT [dbo].[Manufacturers] ([manufacturer_id], [manufacturer_title]) VALUES (2, N'FENIX')
GO
INSERT [dbo].[Manufacturers] ([manufacturer_id], [manufacturer_title]) VALUES (3, N'IN-THERM')
GO
INSERT [dbo].[Manufacturers] ([manufacturer_id], [manufacturer_title]) VALUES (4, N'UNIFLOOR')
GO
INSERT [dbo].[Manufacturers] ([manufacturer_id], [manufacturer_title]) VALUES (5, N'WARM LIFE')
GO
SET IDENTITY_INSERT [dbo].[Manufacturers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([order_id], [fio], [phoneNumber], [payment_id], [city_id], [deliveryAddress], [delivery_id], [orderdatetime], [device], [orderstate], [comment]) VALUES (26, N'admin', N'9998071913', 1, 2, N'asda', 2, CAST(N'2021-06-01T17:01:21.013' AS DateTime), N'desktop', 0, N'')
GO
INSERT [dbo].[Orders] ([order_id], [fio], [phoneNumber], [payment_id], [city_id], [deliveryAddress], [delivery_id], [orderdatetime], [device], [orderstate], [comment]) VALUES (27, N'Пётр', N'79998071913', 2, 2, N'1', 2, CAST(N'2021-06-02T12:32:20.273' AS DateTime), N'desktop', 0, N'')
GO
INSERT [dbo].[Orders] ([order_id], [fio], [phoneNumber], [payment_id], [city_id], [deliveryAddress], [delivery_id], [orderdatetime], [device], [orderstate], [comment]) VALUES (28, N'1', N'1', 2, 2, N'1', 2, CAST(N'2021-06-02T18:21:25.740' AS DateTime), N'desktop', 0, N'')
GO
INSERT [dbo].[Orders] ([order_id], [fio], [phoneNumber], [payment_id], [city_id], [deliveryAddress], [delivery_id], [orderdatetime], [device], [orderstate], [comment]) VALUES (29, N'Пётр', N'79998071913', 2, 2, N'1', 2, CAST(N'2021-06-04T10:53:51.497' AS DateTime), N'desktop', 1, N'')
GO
INSERT [dbo].[Orders] ([order_id], [fio], [phoneNumber], [payment_id], [city_id], [deliveryAddress], [delivery_id], [orderdatetime], [device], [orderstate], [comment]) VALUES (30, N'Петр', N'79998071913', 2, 2, N'1', 2, CAST(N'2021-06-04T10:20:03.393' AS DateTime), N'desktop', 1, N'')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdersDetails] ON 
GO
INSERT [dbo].[OrdersDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [productOptions_id]) VALUES (28, 26, 1, 1, 9128, 2314)
GO
INSERT [dbo].[OrdersDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [productOptions_id]) VALUES (31, 28, 1, 2, 5053, 2311)
GO
INSERT [dbo].[OrdersDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [productOptions_id]) VALUES (32, 29, 1, 5, 50530, 2311)
GO
INSERT [dbo].[OrdersDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [productOptions_id]) VALUES (37, 29, 5, 2, 20056, 2381)
GO
INSERT [dbo].[OrdersDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [productOptions_id]) VALUES (38, 30, 1, 1, 10590, 2315)
GO
INSERT [dbo].[OrdersDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [productOptions_id]) VALUES (39, 30, 19, 1, 6356, 2460)
GO
SET IDENTITY_INSERT [dbo].[OrdersDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 
GO
INSERT [dbo].[PaymentMethods] ([payment_id], [payment_title]) VALUES (1, N'При получении')
GO
INSERT [dbo].[PaymentMethods] ([payment_id], [payment_title]) VALUES (2, N'Картой')
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductAttributes] ON 
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (974, 10, N'Технические характеристики', N'Мощность удельная ', N'150 Вт/м кв.')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (975, 10, N'Технические характеристики', N'Мощность кабеля погонная ', N'около 10 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (976, 10, N'Технические характеристики', N'Шаг укладки кабеля на сетке ', N'0.065 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (977, 10, N'Технические характеристики', N'Питающий провод ', N'2.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (978, 10, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (979, 10, N'Технические характеристики', N'Наружная изоляция ', N'ПВДФ-фторопаст (темп. плавления 170 C)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (980, 10, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (981, 10, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 2.7 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (982, 10, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (983, 10, N'Технические характеристики', N'Ширина мата', N' 0.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (984, 11, N'Технические характеристики', N'Мощность удельная ', N'160 Вт/м кв.')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (985, 11, N'Технические характеристики', N'Мощность кабеля погонная ', N'12 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (986, 11, N'Технические характеристики', N'Шаг укладки кабеля на сетке ', N'0.075 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (987, 11, N'Технические характеристики', N'Питающий провод ', N'3 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (988, 11, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (989, 11, N'Технические характеристики', N'Наружная изоляция ', N'ПВДФ-фторопаст (темп. плавления 105 C)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (990, 11, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (991, 11, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 4 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (992, 11, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (993, 11, N'Технические характеристики', N'Ширина мата', N' 0.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (994, 11, N'Технические характеристики', N'Мощность удельная ', N'160 Вт/м кв.')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (995, 11, N'Технические характеристики', N'Мощность кабеля погонная ', N'до 7.6 м кв. - 12 Вт/м, после 8.8 м кв. - 18 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (996, 11, N'Технические характеристики', N'Шаг укладки кабеля на сетке ', N'до 7.6 м кв. - 0.075 м, после 8.8 м кв. - 0.11 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (997, 11, N'Технические характеристики', N'Питающий провод ', N'3 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (998, 11, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (999, 11, N'Технические характеристики', N'Наружная изоляция ', N'ПВДФ-фторопаст (темп. плавления 105 C)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1000, 11, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1001, 11, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 3.5 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1002, 11, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1003, 11, N'Технические характеристики', N'Ширина мата', N' 0.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1004, 13, N'Технические характеристики', N'Мощность кабеля погонная', N'около 10 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1005, 13, N'Технические характеристики', N'Питающий провод ', N'3 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1006, 13, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1007, 13, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 C)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1008, 13, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1009, 13, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 4.2 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1010, 13, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1011, 14, N'Технические характеристики', N'Мощность кабеля погонная', N'около 18 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1012, 14, N'Технические характеристики', N'Питающий провод ', N'3 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1013, 14, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1014, 14, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 C)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1015, 14, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1016, 14, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 4.2 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1017, 14, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1018, 15, N'Технические характеристики', N'Мощность кабеля погонная', N'около 10 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1019, 15, N'Технические характеристики', N'Питающий провод ', N'2.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1020, 15, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1021, 15, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 C)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1022, 15, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1023, 15, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 4.2 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1024, 15, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1025, 16, N'Технические характеристики', N'Мощность кабеля удельная', N'140 Вт/м кв.')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1026, 16, N'Технические характеристики', N'Мощность кабеля погонная', N'около 9 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1027, 16, N'Технические характеристики', N'Шаг укладки кабеля на сетке', N'0.06 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1028, 16, N'Технические характеристики', N'Питающий провод ', N'2.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1029, 16, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1030, 16, N'Технические характеристики', N'Наружная изоляция ', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1031, 16, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1032, 16, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 1.7 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1033, 16, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1034, 17, N'Технические характеристики', N'Мощность кабеля погонная', N'30 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1035, 17, N'Технические характеристики', N'Питающий провод ', N'5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1036, 17, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1037, 17, N'Технические характеристики', N'Наружная изоляция ', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1038, 17, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С) + полиэтилен (дополнительная изоляция)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1039, 17, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'6 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1040, 17, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1041, 18, N'Технические характеристики', N'Мощность кабеля погонная', N'30 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1042, 18, N'Технические характеристики', N'Питающий провод ', N'5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1043, 18, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1044, 18, N'Технические характеристики', N'Наружная изоляция ', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1045, 18, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С) + полиэтилен (дополнительная изоляция)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1046, 18, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'6 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1047, 18, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1048, 1, N'Технические характеристики', N'Мощность удельная', N' 150 Вт/м кв')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1049, 1, N'Технические характеристики', N'Мощность кабеля погонная', N' 12.5 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1050, 1, N'Технические характеристики', N'Шаг укладки кабеля на мате', N' 0.08 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1051, 1, N'Технические характеристики', N'Питающий провод ', N'4 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1052, 1, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1053, 1, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1054, 1, N'Технические характеристики', N'Внутрення изоляция ', N'фторполимер (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1055, 1, N'Технические характеристики', N'Диаметр кабеля ', N'около 4.5 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1056, 1, N'Технические характеристики', N'Ширина мата площадью более 1 м кв. ', N'0.46 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1057, 1, N'Технические характеристики', N'Ширина мата площалью менее 0.45 м кв. ', N'0.3 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1058, 1, N'Технические характеристики', N'Класс механической прочности ', N'М1')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1059, 1, N'Технические характеристики', N'Гарантия ', N'20 лет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1060, 1, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие требования)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1061, 2, N'Технические характеристики', N'Мощность удельная', N' 150 Вт/м кв')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1062, 2, N'Технические характеристики', N'Мощность кабеля погонная', N' 12.5 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1063, 2, N'Технические характеристики', N'Шаг укладки кабеля на мате', N' 0.08 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1064, 2, N'Технические характеристики', N'Питающий провод ', N'4 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1065, 2, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1066, 2, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1067, 2, N'Технические характеристики', N'Внутрення изоляция ', N'фторполимер (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1068, 2, N'Технические характеристики', N'Диаметр кабеля ', N'около 4.5 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1069, 2, N'Технические характеристики', N'Ширина мата площадью более 1 м кв. ', N'0.46 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1070, 2, N'Технические характеристики', N'Ширина мата площалью менее 0.45 м кв. ', N'0.3 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1071, 2, N'Технические характеристики', N'Класс механической прочности ', N'М1')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1072, 2, N'Технические характеристики', N'Гарантия ', N'20 лет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1073, 2, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие требования)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1074, 3, N'Технические характеристики', N'Мощность кабеля погонная', N' 17 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1075, 3, N'Технические характеристики', N'Класс механической прочности ', N'М2')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1076, 3, N'Технические характеристики', N'Питающий провод двужильный кабель', N' 4 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1077, 3, N'Технические характеристики', N'Питающий провод ', N'одножильный кабель 2.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1078, 3, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1079, 3, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1080, 3, N'Технические характеристики', N'Внутрення изоляция ', N'полиэтилен (темп. плавления 105 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1081, 3, N'Технические характеристики', N'Диаметр кабеля ', N'около 8 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1082, 3, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие в мире требования)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1083, 3, N'Технические характеристики', N'Гарантия ', N'20 лет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1084, 4, N'Технические характеристики', N'Мощность кабеля погонная', N' 27 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1085, 4, N'Технические характеристики', N'Класс механической прочности ', N'М2')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1086, 4, N'Технические характеристики', N'Питающий провод двужильный кабель', N' 7 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1087, 4, N'Технические характеристики', N'Питающий провод ', N'одножильный кабель 2.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1088, 4, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1089, 4, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1090, 4, N'Технические характеристики', N'Внутрення изоляция ', N'полиэтилен (темп. плавления 105 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1091, 4, N'Технические характеристики', N'Диаметр кабеля ', N'около 8 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1092, 4, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие в мире требования)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1093, 4, N'Технические характеристики', N'Гарантия ', N'10 лет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1094, 5, N'Технические характеристики', N'Мощность кабеля погонная', N' 27 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1095, 5, N'Технические характеристики', N'Класс механической прочности ', N'М2')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1096, 5, N'Технические характеристики', N'Питающий провод двужильный кабель', N' 7 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1097, 5, N'Технические характеристики', N'Питающий провод ', N'одножильный кабель 2.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1098, 5, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1099, 5, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1100, 5, N'Технические характеристики', N'Внутрення изоляция ', N'полиэтилен (темп. плавления 105 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1101, 5, N'Технические характеристики', N'Диаметр кабеля ', N'около 8 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1102, 5, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие в мире требования)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1103, 5, N'Технические характеристики', N'Гарантия ', N'10 лет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1104, 6, N'Технические характеристики', N'Мощность кабеля погонная', N'30 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1105, 6, N'Технические характеристики', N'Класс механической прочности ', N'М2')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1106, 6, N'Технические характеристики', N'Питающий провод двужильный кабель', N'4 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1107, 6, N'Технические характеристики', N'Питающий провод ', N'одножильный кабель 2.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1108, 6, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1109, 6, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1110, 6, N'Технические характеристики', N'Внутрення изоляция ', N'полиэтилен (темп. плавления 105 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1111, 6, N'Технические характеристики', N'Диаметр кабеля ', N'около 8 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1112, 6, N'Технические характеристики', N'Гарантия ', N'10 лет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1113, 6, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие в мире требования)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1114, 7, N'Технические характеристики', N'Мощность кабеля погонная', N'30 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1115, 7, N'Технические характеристики', N'Класс механической прочности ', N'М2')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1116, 7, N'Технические характеристики', N'Питающий провод двужильный кабель', N'4 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1117, 7, N'Технические характеристики', N'Питающий провод ', N'одножильный кабель 2.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1118, 7, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1119, 7, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1120, 7, N'Технические характеристики', N'Внутрення изоляция ', N'полиэтилен (темп. плавления 105 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1121, 7, N'Технические характеристики', N'Диаметр кабеля ', N'около 8 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1122, 7, N'Технические характеристики', N'Гарантия ', N'10 лет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1123, 7, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие в мире требования)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1124, 8, N'Технические характеристики', N'Мощность кабеля погонная', N'10 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1125, 8, N'Технические характеристики', N'Класс механической прочности ', N'М2')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1126, 8, N'Технические характеристики', N'Питающий провод двужильный кабель', N'4 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1127, 8, N'Технические характеристики', N'Питающий провод ', N'одножильный кабель 2.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1128, 8, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1129, 8, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1130, 8, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1131, 8, N'Технические характеристики', N'Диаметр кабеля ', N'около 8 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1132, 8, N'Технические характеристики', N'Гарантия ', N'10 лет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1133, 8, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие в мире требования)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1146, 19, N'Технические характеристики', N'Напряжение ', N'230 В')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1147, 19, N'Технические характеристики', N'Мощность удельная ', N'200 Вт/м кв.')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1148, 19, N'Технические характеристики', N'Шаг укладки кабеля ', N'10 см')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1149, 19, N'Технические характеристики', N'Питающий провод', N' 1.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1150, 19, N'Технические характеристики', N'Соединение нагревательного и питающего проводов', N' муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1151, 19, N'Технические характеристики', N'Диаметр кабеля ', N'4 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1152, 19, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 C)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1153, 19, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1154, 19, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 3.5 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1155, 19, N'Технические характеристики', N'Гарантия ', N'20 лет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1156, 19, N'Технические характеристики', N'Соответствие международному сертификату', N'IEC 60800')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1157, 20, N'Технические характеристики', N'Мощность удельная ', N'200 Вт/м кв.')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1158, 20, N'Технические характеристики', N'Мощность кабеля погонная', N'20 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1159, 20, N'Технические характеристики', N'Шаг укладки кабеля на сетке ', N'0.1 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1160, 20, N'Технические характеристики', N'Питающий провод', N' 1.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1161, 20, N'Технические характеристики', N'Соединение нагревательного и питающего проводов', N' муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1162, 20, N'Технические характеристики', N'Диаметр кабеля ', N'4 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1163, 20, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 C)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1164, 20, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1165, 20, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 3.5 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1166, 20, N'Технические характеристики', N'Гарантия ', N'20 лет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1167, 20, N'Технические характеристики', N'Ширина мата', N'0.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1168, 20, N'Технические характеристики', N'Соответствие международному сертификату', N'IEC 60800')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1169, 21, N'Технические характеристики', N'Мощность удельная ', N'200 Вт/м кв.')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1170, 21, N'Технические характеристики', N'Мощность кабеля погонная', N'20 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1171, 21, N'Технические характеристики', N'Шаг укладки кабеля на сетке ', N'0.1 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1172, 21, N'Технические характеристики', N'Питающий провод', N' 1.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1173, 21, N'Технические характеристики', N'Соединение нагревательного и питающего проводов', N' муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1174, 21, N'Технические характеристики', N'Диаметр кабеля ', N'4 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1175, 21, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 C)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1176, 21, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1177, 21, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 3.5 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1178, 21, N'Технические характеристики', N'Гарантия ', N'20 лет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1179, 21, N'Технические характеристики', N'Ширина мата', N'0.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1180, 21, N'Технические характеристики', N'Соответствие международному сертификату', N'IEC 60800')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1181, 22, N'Технические характеристики', N'Мощность удельная ', N'200 Вт/м кв.')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1182, 22, N'Технические характеристики', N'Мощность кабеля погонная ', N'20 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1183, 22, N'Технические характеристики', N'Шаг укладки кабеля ', N'0.1 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1184, 22, N'Технические характеристики', N'Питающий провод ', N'1.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1185, 22, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1186, 22, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 C)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1187, 22, N'Технические характеристики', N'Внутрення изоляция', N' полиэтилен (темп. плавления 110 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1188, 22, N'Технические характеристики', N'Сечение кабеля ', N'6.5х4 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1189, 22, N'Технические характеристики', N'Гарантия ', N'15 лет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1190, 22, N'Технические характеристики', N'Ширина мата ', N'0.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1191, 22, N'Технические характеристики', N'Соответствие международному сертификату', N' IEC 60800')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1192, 23, N'Технические характеристики', N'Мощность удельная ', N'150 Вт/м кв.')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1193, 23, N'Технические характеристики', N'Мощность кабеля погонная ', N'9 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1194, 23, N'Технические характеристики', N'Шаг укладки кабеля на сетке ', N'0.06 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1195, 23, N'Технические характеристики', N'Питающий провод ', N'2.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1196, 23, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1197, 23, N'Технические характеристики', N'Ширина мата ', N'0.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1198, 23, N'Технические характеристики', N'Изоляция кабеля', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1199, 23, N'Технические характеристики', N'Диаметр нагревательного кабеля', N' 1.0 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1200, 23, N'Технические характеристики', N'Толщина экрана ', N'0.7 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1201, 23, N'Технические характеристики', N'Гарантия ', N'20 лет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1202, 23, N'Технические характеристики', N'Толщина экрана ', N'0.7 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1203, 24, N'Технические характеристики', N'Мощность удельная ', N'140 Вт/м кв.')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1204, 24, N'Технические характеристики', N'Мощность кабеля погонная ', N'8.5 Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1205, 24, N'Технические характеристики', N'Шаг укладки кабеля на сетке ', N'0.06 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1206, 24, N'Технические характеристики', N'Питающий провод ', N'2.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1207, 24, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1208, 24, N'Технические характеристики', N'Ширина мата ', N'0.5 м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1209, 24, N'Технические характеристики', N'Изоляция кабеля', N'фторопласт (темп. плавления 250 С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1210, 24, N'Технические характеристики', N'Диаметр нагревательного кабеля', N' 1.0 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1211, 24, N'Технические характеристики', N'Толщина экрана ', N'0.7 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1212, 24, N'Технические характеристики', N'Гарантия ', N'пожизненная от производителя')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1213, 24, N'Технические характеристики', N'Толщина экрана ', N'0.7 мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1228, 25, N'Технические характеристики', N'Тип', N'аналоговый')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1229, 25, N'Технические характеристики', N'Адаптивная функция', N'нет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1230, 25, N'Технические характеристики', N'Удаленное управление', N'нет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1231, 25, N'Технические характеристики', N'Датчик воздуха', N'нет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1232, 25, N'Технические характеристики', N'Датчик пола', N'да')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1233, 25, N'Технические характеристики', N'Диапазон температур', N'5 - 40 С')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1234, 25, N'Технические характеристики', N'Нагрузка, А', N'16 А')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1235, 25, N'Технические характеристики', N'Степень защиты', N'IP 20')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1236, 25, N'Технические характеристики', N'Способ монтажа', N'в подрозетник')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1237, 25, N'Технические характеристики', N'Гарантия', N'2 года')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1238, 26, N'Технические характеристики', N'Тип', N'программируемый')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1239, 26, N'Технические характеристики', N'Адаптивная функция', N'да')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1240, 26, N'Технические характеристики', N'Удаленное управление', N'нет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1241, 26, N'Технические характеристики', N'Датчик воздуха', N'да')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1242, 26, N'Технические характеристики', N'Датчик пола', N'да')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1243, 26, N'Технические характеристики', N'Диапазон температур', N'5 - 95 С')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1244, 26, N'Технические характеристики', N'Нагрузка, А', N'16 А')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1245, 26, N'Технические характеристики', N'Степень защиты', N'IP 20')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1246, 26, N'Технические характеристики', N'Способ монтажа', N'в подрозетник')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1247, 26, N'Технические характеристики', N'Гарантия', N'2 года')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1248, 27, N'Технические характеристики', N'Тип', N'программируемый')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1249, 27, N'Технические характеристики', N'Адаптивная функция', N'да')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1250, 27, N'Технические характеристики', N'Удаленное управление', N'WIFI')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1251, 27, N'Технические характеристики', N'Датчик воздуха', N'да')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1252, 27, N'Технические характеристики', N'Датчик пола', N'да')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1253, 27, N'Технические характеристики', N'Диапазон температур', N'5 - 95 С')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1254, 27, N'Технические характеристики', N'Нагрузка, А', N'16 А')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1255, 27, N'Технические характеристики', N'Степень защиты', N'IP 20')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1256, 27, N'Технические характеристики', N'Способ монтажа', N'в подрозетник')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1257, 27, N'Технические характеристики', N'Гарантия', N'2 года')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1258, 28, N'Технические характеристики', N'Тип', N'программируемый')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1259, 28, N'Технические характеристики', N'Дисплей', N'сенсорный')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1260, 28, N'Технические характеристики', N'Адаптивная функция', N'да')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1261, 28, N'Технические характеристики', N'Удаленное управление', N'нет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1262, 28, N'Технические характеристики', N'Датчик воздуха', N'да')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1263, 28, N'Технические характеристики', N'Датчик пола', N'да')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1264, 28, N'Технические характеристики', N'Диапазон температур', N'5 - 95 С')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1265, 28, N'Технические характеристики', N'Нагрузка, А', N'16 А')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1266, 28, N'Технические характеристики', N'Степень защиты', N'IP 20')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1267, 28, N'Технические характеристики', N'Способ монтажа', N'в подрозетник')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1268, 28, N'Технические характеристики', N'Гарантия', N'2 года')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1269, 29, N'Технические характеристики', N'Тип', N'программируемый')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1270, 29, N'Технические характеристики', N'Дисплей', N'сенсорный')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1271, 29, N'Технические характеристики', N'Адаптивная функция', N'да')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1272, 29, N'Технические характеристики', N'Удаленное управление', N'нет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1273, 29, N'Технические характеристики', N'Датчик воздуха', N'да')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1274, 29, N'Технические характеристики', N'Датчик пола', N'да')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1275, 29, N'Технические характеристики', N'Диапазон температур', N'5 - 40 С')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1276, 29, N'Технические характеристики', N'Нагрузка, А', N'16 А')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1277, 29, N'Технические характеристики', N'Степень защиты', N'IP 20')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1278, 29, N'Технические характеристики', N'Способ монтажа', N'в подрозетник')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1279, 29, N'Технические характеристики', N'Гарантия', N'2 года')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1280, 9, N'Техническиехарактеристики', N'Мощность кабеля погонная', N'12.5Вт/м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1281, 9, N'Техническиехарактеристики', N'Шаг укладки кабелянамате', N'0.08м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1282, 9, N'Техническиехарактеристики', N'Питающ ийпровод', N'2.5м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1283, 9, N'Техническиехарактеристики', N'Соединение нагревательного и питающего проводов', N'безмуфтовое')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1284, 9, N'Техническиехарактеристики', N'Наружная изоляция', N'ПВХ(темп.плавления105с)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1285, 9, N'Техническиехарактеристики', N'Внутрення изоляция', N'фторполимер(темп.плавления250С)')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1286, 9, N'Техническиехарактеристики', N'Диаметр кабеля', N'около4.5мм')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1287, 9, N'Техническиехарактеристики', N'Ширина мата площадью более 1мкв.', N'0.46м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1288, 9, N'Техническиехарактеристики', N'Ширина мата площалью менее 0.45мкв.', N'0.3м')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1289, 9, N'Техническиехарактеристики', N'Класс механической прочности', N'М1')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1290, 9, N'Техническиехарактеристики', N'Гарантия', N'20лет')
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text]) VALUES (1291, 9, N'Техническиехарактеристики', N'Допуск к эксплуатации', N'VDE(самые строгие требования)')
GO
SET IDENTITY_INSERT [dbo].[ProductAttributes] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductOptions] ON 
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2187, 10, CAST(150 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)), NULL, CAST(4544 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2188, 10, CAST(225 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), NULL, CAST(5329 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2189, 10, CAST(300 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), NULL, CAST(7910 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2190, 10, CAST(375 AS Numeric(18, 0)), CAST(2.50 AS Numeric(10, 2)), NULL, CAST(8640 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2191, 10, CAST(450 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), NULL, CAST(10042 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2192, 10, CAST(525 AS Numeric(18, 0)), CAST(3.50 AS Numeric(10, 2)), NULL, CAST(10759 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2193, 10, CAST(600 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), NULL, CAST(13352 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2194, 10, CAST(675 AS Numeric(18, 0)), CAST(4.50 AS Numeric(10, 2)), NULL, CAST(13871 AS Numeric(18, 0)), CAST(9.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2195, 10, CAST(750 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), NULL, CAST(14923 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2196, 10, CAST(900 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), NULL, CAST(16157 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2197, 10, CAST(1050 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), NULL, CAST(17222 AS Numeric(18, 0)), CAST(14.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2198, 10, CAST(1200 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), NULL, CAST(18401 AS Numeric(18, 0)), CAST(16.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2199, 10, CAST(1350 AS Numeric(18, 0)), CAST(9.00 AS Numeric(10, 2)), NULL, CAST(23808 AS Numeric(18, 0)), CAST(18.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2200, 10, CAST(1500 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), NULL, CAST(25925 AS Numeric(18, 0)), CAST(20.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2201, 10, CAST(1800 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)), NULL, CAST(29088 AS Numeric(18, 0)), CAST(24.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2202, 10, CAST(2250 AS Numeric(18, 0)), CAST(15.00 AS Numeric(10, 2)), NULL, CAST(34143 AS Numeric(18, 0)), CAST(30.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2203, 11, CAST(80 AS Numeric(18, 0)), CAST(0.50 AS Numeric(10, 2)), NULL, CAST(2746 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2204, 11, CAST(160 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)), NULL, CAST(3679 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2205, 11, CAST(240 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), NULL, CAST(5410 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2206, 11, CAST(320 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), NULL, CAST(6645 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2207, 11, CAST(400 AS Numeric(18, 0)), CAST(2.50 AS Numeric(10, 2)), NULL, CAST(7305 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2208, 11, CAST(480 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), NULL, CAST(8760 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2209, 11, CAST(560 AS Numeric(18, 0)), CAST(3.50 AS Numeric(10, 2)), NULL, CAST(9254 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2210, 11, CAST(640 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), NULL, CAST(11507 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2211, 11, CAST(800 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), NULL, CAST(13208 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2212, 11, CAST(960 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), NULL, CAST(16641 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2213, 11, CAST(1120 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), NULL, CAST(16834 AS Numeric(18, 0)), CAST(14.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2214, 11, CAST(1280 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), NULL, CAST(17959 AS Numeric(18, 0)), CAST(16.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2215, 11, CAST(1600 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), NULL, CAST(19553 AS Numeric(18, 0)), CAST(20.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2216, 11, CAST(1920 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)), NULL, CAST(24083 AS Numeric(18, 0)), CAST(24.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2217, 12, CAST(70 AS Numeric(18, 0)), CAST(0.50 AS Numeric(10, 2)), NULL, CAST(2831 AS Numeric(18, 0)), CAST(0.90 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2218, 12, CAST(130 AS Numeric(18, 0)), CAST(0.80 AS Numeric(10, 2)), NULL, CAST(3161 AS Numeric(18, 0)), CAST(1.60 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2219, 12, CAST(210 AS Numeric(18, 0)), CAST(1.30 AS Numeric(10, 2)), NULL, CAST(4454 AS Numeric(18, 0)), CAST(2.60 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2220, 12, CAST(260 AS Numeric(18, 0)), CAST(1.60 AS Numeric(10, 2)), NULL, CAST(5388 AS Numeric(18, 0)), CAST(3.20 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2221, 12, CAST(340 AS Numeric(18, 0)), CAST(2.10 AS Numeric(10, 2)), NULL, CAST(6653 AS Numeric(18, 0)), CAST(4.20 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2222, 12, CAST(410 AS Numeric(18, 0)), CAST(2.60 AS Numeric(10, 2)), NULL, CAST(7396 AS Numeric(18, 0)), CAST(5.20 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2223, 12, CAST(500 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), NULL, CAST(8715 AS Numeric(18, 0)), CAST(6.10 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2224, 12, CAST(560 AS Numeric(18, 0)), CAST(3.35 AS Numeric(10, 2)), NULL, CAST(9429 AS Numeric(18, 0)), CAST(6.70 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2225, 12, CAST(670 AS Numeric(18, 0)), CAST(4.15 AS Numeric(10, 2)), NULL, CAST(11573 AS Numeric(18, 0)), CAST(8.30 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2226, 12, CAST(810 AS Numeric(18, 0)), CAST(5.10 AS Numeric(10, 2)), NULL, CAST(13196 AS Numeric(18, 0)), CAST(10.20 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2227, 12, CAST(1000 AS Numeric(18, 0)), CAST(6.15 AS Numeric(10, 2)), NULL, CAST(16495 AS Numeric(18, 0)), CAST(12.30 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2228, 12, CAST(1210 AS Numeric(18, 0)), CAST(7.55 AS Numeric(10, 2)), NULL, CAST(19683 AS Numeric(18, 0)), CAST(15.10 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2229, 12, CAST(1400 AS Numeric(18, 0)), CAST(8.80 AS Numeric(10, 2)), NULL, CAST(19767 AS Numeric(18, 0)), CAST(17.60 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2230, 12, CAST(1800 AS Numeric(18, 0)), CAST(11.00 AS Numeric(10, 2)), NULL, CAST(24000 AS Numeric(18, 0)), CAST(22.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2231, 12, CAST(2150 AS Numeric(18, 0)), CAST(13.30 AS Numeric(10, 2)), NULL, CAST(31890 AS Numeric(18, 0)), CAST(26.60 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2232, 12, CAST(2600 AS Numeric(18, 0)), CAST(16.30 AS Numeric(10, 2)), NULL, CAST(41842 AS Numeric(18, 0)), CAST(32.50 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2233, 13, CAST(120 AS Numeric(18, 0)), CAST(1.14 AS Numeric(10, 2)), CAST(11.40 AS Numeric(10, 2)), CAST(2733 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2234, 13, CAST(200 AS Numeric(18, 0)), CAST(1.42 AS Numeric(10, 2)), CAST(18.90 AS Numeric(10, 2)), CAST(3405 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2235, 13, CAST(250 AS Numeric(18, 0)), CAST(1.77 AS Numeric(10, 2)), CAST(23.60 AS Numeric(10, 2)), CAST(3981 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2236, 13, CAST(320 AS Numeric(18, 0)), CAST(2.37 AS Numeric(10, 2)), CAST(31.60 AS Numeric(10, 2)), CAST(4641 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2237, 13, CAST(400 AS Numeric(18, 0)), CAST(2.77 AS Numeric(10, 2)), CAST(36.90 AS Numeric(10, 2)), CAST(4998 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2238, 13, CAST(450 AS Numeric(18, 0)), CAST(3.44 AS Numeric(10, 2)), CAST(45.90 AS Numeric(10, 2)), CAST(5877 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2239, 13, CAST(520 AS Numeric(18, 0)), CAST(3.72 AS Numeric(10, 2)), CAST(49.60 AS Numeric(10, 2)), CAST(6152 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2240, 13, CAST(600 AS Numeric(18, 0)), CAST(4.79 AS Numeric(10, 2)), CAST(63.90 AS Numeric(10, 2)), CAST(7964 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2241, 13, CAST(750 AS Numeric(18, 0)), CAST(5.69 AS Numeric(10, 2)), CAST(75.80 AS Numeric(10, 2)), CAST(8348 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2242, 13, CAST(950 AS Numeric(18, 0)), CAST(6.53 AS Numeric(10, 2)), CAST(87.00 AS Numeric(10, 2)), CAST(9968 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2243, 13, CAST(1100 AS Numeric(18, 0)), CAST(8.59 AS Numeric(10, 2)), CAST(114.50 AS Numeric(10, 2)), CAST(12275 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2244, 13, CAST(1300 AS Numeric(18, 0)), CAST(9.85 AS Numeric(10, 2)), CAST(131.30 AS Numeric(10, 2)), CAST(13812 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2245, 13, CAST(1700 AS Numeric(18, 0)), CAST(11.89 AS Numeric(10, 2)), CAST(158.50 AS Numeric(10, 2)), CAST(16696 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2246, 13, CAST(2000 AS Numeric(18, 0)), CAST(14.59 AS Numeric(10, 2)), CAST(194.50 AS Numeric(10, 2)), CAST(22106 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2247, 14, CAST(160 AS Numeric(18, 0)), CAST(1.36 AS Numeric(10, 2)), CAST(8.50 AS Numeric(10, 2)), CAST(2529 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2248, 14, CAST(260 AS Numeric(18, 0)), CAST(2.32 AS Numeric(10, 2)), CAST(14.50 AS Numeric(10, 2)), CAST(3075 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2249, 14, CAST(320 AS Numeric(18, 0)), CAST(2.96 AS Numeric(10, 2)), CAST(18.50 AS Numeric(10, 2)), CAST(3543 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2250, 14, CAST(420 AS Numeric(18, 0)), CAST(3.84 AS Numeric(10, 2)), CAST(24.00 AS Numeric(10, 2)), CAST(4009 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2251, 14, CAST(520 AS Numeric(18, 0)), CAST(4.54 AS Numeric(10, 2)), CAST(28.40 AS Numeric(10, 2)), CAST(4284 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2252, 14, CAST(600 AS Numeric(18, 0)), CAST(5.50 AS Numeric(10, 2)), CAST(34.40 AS Numeric(10, 2)), CAST(4888 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2253, 14, CAST(680 AS Numeric(18, 0)), CAST(6.06 AS Numeric(10, 2)), CAST(37.90 AS Numeric(10, 2)), CAST(5162 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2254, 14, CAST(830 AS Numeric(18, 0)), CAST(7.38 AS Numeric(10, 2)), CAST(46.10 AS Numeric(10, 2)), CAST(6288 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2255, 14, CAST(1000 AS Numeric(18, 0)), CAST(9.20 AS Numeric(10, 2)), CAST(57.50 AS Numeric(10, 2)), CAST(6810 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2256, 14, CAST(1200 AS Numeric(18, 0)), CAST(11.02 AS Numeric(10, 2)), CAST(68.90 AS Numeric(10, 2)), CAST(8430 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2257, 14, CAST(1500 AS Numeric(18, 0)), CAST(13.31 AS Numeric(10, 2)), CAST(83.20 AS Numeric(10, 2)), CAST(9474 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2258, 14, CAST(1700 AS Numeric(18, 0)), CAST(16.06 AS Numeric(10, 2)), CAST(100.40 AS Numeric(10, 2)), CAST(11809 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2259, 14, CAST(2200 AS Numeric(18, 0)), CAST(19.55 AS Numeric(10, 2)), CAST(122.20 AS Numeric(10, 2)), CAST(13346 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2260, 14, CAST(2600 AS Numeric(18, 0)), CAST(23.94 AS Numeric(10, 2)), CAST(149.60 AS Numeric(10, 2)), CAST(17438 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2261, 15, CAST(210 AS Numeric(18, 0)), CAST(1.90 AS Numeric(10, 2)), CAST(11.90 AS Numeric(10, 2)), CAST(2468 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2262, 15, CAST(350 AS Numeric(18, 0)), CAST(3.15 AS Numeric(10, 2)), CAST(19.70 AS Numeric(10, 2)), CAST(2993 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2263, 15, CAST(450 AS Numeric(18, 0)), CAST(3.84 AS Numeric(10, 2)), CAST(24.00 AS Numeric(10, 2)), CAST(3323 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2264, 15, CAST(570 AS Numeric(18, 0)), CAST(5.20 AS Numeric(10, 2)), CAST(32.50 AS Numeric(10, 2)), CAST(4009 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2265, 15, CAST(820 AS Numeric(18, 0)), CAST(7.36 AS Numeric(10, 2)), CAST(46.00 AS Numeric(10, 2)), CAST(5328 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2266, 15, CAST(1100 AS Numeric(18, 0)), CAST(10.19 AS Numeric(10, 2)), CAST(63.70 AS Numeric(10, 2)), CAST(6206 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2267, 15, CAST(1400 AS Numeric(18, 0)), CAST(11.95 AS Numeric(10, 2)), CAST(74.70 AS Numeric(10, 2)), CAST(6316 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2268, 15, CAST(2000 AS Numeric(18, 0)), CAST(18.27 AS Numeric(10, 2)), CAST(114.20 AS Numeric(10, 2)), CAST(8348 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2269, 15, CAST(2400 AS Numeric(18, 0)), CAST(20.82 AS Numeric(10, 2)), CAST(130.10 AS Numeric(10, 2)), CAST(9227 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2270, 15, CAST(3000 AS Numeric(18, 0)), CAST(26.34 AS Numeric(10, 2)), CAST(164.60 AS Numeric(10, 2)), CAST(11753 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2271, 16, CAST(140 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)), NULL, CAST(4792 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2272, 16, CAST(210 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), NULL, CAST(6389 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2273, 16, CAST(280 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), NULL, CAST(7628 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2274, 16, CAST(420 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), NULL, CAST(10542 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2275, 16, CAST(560 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), NULL, CAST(13242 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2276, 16, CAST(700 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), NULL, CAST(15091 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2277, 16, CAST(840 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), NULL, CAST(18073 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2278, 16, CAST(980 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), NULL, CAST(22651 AS Numeric(18, 0)), CAST(14.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2279, 16, CAST(1120 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), NULL, CAST(23919 AS Numeric(18, 0)), CAST(16.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2280, 16, CAST(1260 AS Numeric(18, 0)), CAST(9.00 AS Numeric(10, 2)), NULL, CAST(27027 AS Numeric(18, 0)), CAST(18.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2281, 16, CAST(1400 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), NULL, CAST(28808 AS Numeric(18, 0)), CAST(20.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2282, 17, CAST(195 AS Numeric(18, 0)), CAST(0.84 AS Numeric(10, 2)), CAST(7.00 AS Numeric(10, 2)), CAST(3213 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2283, 17, CAST(340 AS Numeric(18, 0)), CAST(1.32 AS Numeric(10, 2)), CAST(11.00 AS Numeric(10, 2)), CAST(3872 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2284, 17, CAST(420 AS Numeric(18, 0)), CAST(1.68 AS Numeric(10, 2)), CAST(14.00 AS Numeric(10, 2)), CAST(4229 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2285, 17, CAST(560 AS Numeric(18, 0)), CAST(2.16 AS Numeric(10, 2)), CAST(18.00 AS Numeric(10, 2)), CAST(4778 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2286, 17, CAST(670 AS Numeric(18, 0)), CAST(2.64 AS Numeric(10, 2)), CAST(22.00 AS Numeric(10, 2)), CAST(5135 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2287, 17, CAST(800 AS Numeric(18, 0)), CAST(3.12 AS Numeric(10, 2)), CAST(26.00 AS Numeric(10, 2)), CAST(5657 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2288, 17, CAST(970 AS Numeric(18, 0)), CAST(3.84 AS Numeric(10, 2)), CAST(32.00 AS Numeric(10, 2)), CAST(6810 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2289, 17, CAST(1060 AS Numeric(18, 0)), CAST(4.32 AS Numeric(10, 2)), CAST(36.00 AS Numeric(10, 2)), CAST(7689 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2290, 17, CAST(1300 AS Numeric(18, 0)), CAST(5.28 AS Numeric(10, 2)), CAST(44.00 AS Numeric(10, 2)), CAST(8211 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2291, 17, CAST(1600 AS Numeric(18, 0)), CAST(6.24 AS Numeric(10, 2)), CAST(52.00 AS Numeric(10, 2)), CAST(9611 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2292, 17, CAST(1940 AS Numeric(18, 0)), CAST(7.80 AS Numeric(10, 2)), CAST(65.00 AS Numeric(10, 2)), CAST(10930 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2293, 17, CAST(2250 AS Numeric(18, 0)), CAST(9.12 AS Numeric(10, 2)), CAST(76.00 AS Numeric(10, 2)), CAST(12577 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2294, 17, CAST(2800 AS Numeric(18, 0)), CAST(11.52 AS Numeric(10, 2)), CAST(96.00 AS Numeric(10, 2)), CAST(15790 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2295, 17, CAST(3400 AS Numeric(18, 0)), CAST(13.68 AS Numeric(10, 2)), CAST(114.00 AS Numeric(10, 2)), CAST(19662 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2296, 18, CAST(195 AS Numeric(18, 0)), CAST(0.84 AS Numeric(10, 2)), CAST(7.00 AS Numeric(10, 2)), CAST(3213 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2297, 18, CAST(340 AS Numeric(18, 0)), CAST(1.32 AS Numeric(10, 2)), CAST(11.00 AS Numeric(10, 2)), CAST(3872 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2298, 18, CAST(420 AS Numeric(18, 0)), CAST(1.68 AS Numeric(10, 2)), CAST(14.00 AS Numeric(10, 2)), CAST(4229 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2299, 18, CAST(560 AS Numeric(18, 0)), CAST(2.16 AS Numeric(10, 2)), CAST(18.00 AS Numeric(10, 2)), CAST(4778 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2300, 18, CAST(670 AS Numeric(18, 0)), CAST(2.64 AS Numeric(10, 2)), CAST(22.00 AS Numeric(10, 2)), CAST(5135 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2301, 18, CAST(800 AS Numeric(18, 0)), CAST(3.12 AS Numeric(10, 2)), CAST(26.00 AS Numeric(10, 2)), CAST(5657 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2302, 18, CAST(970 AS Numeric(18, 0)), CAST(3.84 AS Numeric(10, 2)), CAST(32.00 AS Numeric(10, 2)), CAST(6810 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2303, 18, CAST(1060 AS Numeric(18, 0)), CAST(4.32 AS Numeric(10, 2)), CAST(36.00 AS Numeric(10, 2)), CAST(7689 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2304, 18, CAST(1300 AS Numeric(18, 0)), CAST(5.28 AS Numeric(10, 2)), CAST(44.00 AS Numeric(10, 2)), CAST(8211 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2305, 18, CAST(1600 AS Numeric(18, 0)), CAST(6.24 AS Numeric(10, 2)), CAST(52.00 AS Numeric(10, 2)), CAST(9611 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2306, 18, CAST(1940 AS Numeric(18, 0)), CAST(7.80 AS Numeric(10, 2)), CAST(65.00 AS Numeric(10, 2)), CAST(10930 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2307, 18, CAST(2250 AS Numeric(18, 0)), CAST(9.12 AS Numeric(10, 2)), CAST(76.00 AS Numeric(10, 2)), CAST(12577 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2308, 18, CAST(2800 AS Numeric(18, 0)), CAST(11.52 AS Numeric(10, 2)), CAST(96.00 AS Numeric(10, 2)), CAST(15790 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2309, 18, CAST(3400 AS Numeric(18, 0)), CAST(13.68 AS Numeric(10, 2)), CAST(114.00 AS Numeric(10, 2)), CAST(19662 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2310, 1, CAST(45 AS Numeric(18, 0)), CAST(0.30 AS Numeric(10, 2)), CAST(4.00 AS Numeric(10, 2)), CAST(4492 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2311, 1, CAST(68 AS Numeric(18, 0)), CAST(0.45 AS Numeric(10, 2)), CAST(5.00 AS Numeric(10, 2)), CAST(5053 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2312, 1, CAST(150 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)), CAST(12.00 AS Numeric(10, 2)), CAST(7396 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2313, 1, CAST(225 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), CAST(18.00 AS Numeric(10, 2)), CAST(9060 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2314, 1, CAST(300 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), CAST(24.00 AS Numeric(10, 2)), CAST(9128 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2315, 1, CAST(375 AS Numeric(18, 0)), CAST(2.50 AS Numeric(10, 2)), CAST(30.00 AS Numeric(10, 2)), CAST(10590 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2316, 1, CAST(450 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), CAST(36.00 AS Numeric(10, 2)), CAST(12574 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2317, 1, CAST(525 AS Numeric(18, 0)), CAST(3.50 AS Numeric(10, 2)), CAST(42.00 AS Numeric(10, 2)), CAST(14820 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2318, 1, CAST(600 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), CAST(48.00 AS Numeric(10, 2)), CAST(15323 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2319, 1, CAST(675 AS Numeric(18, 0)), CAST(4.50 AS Numeric(10, 2)), CAST(54.00 AS Numeric(10, 2)), CAST(16969 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2320, 1, CAST(750 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), CAST(60.00 AS Numeric(10, 2)), CAST(18189 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2321, 1, CAST(900 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), CAST(72.00 AS Numeric(10, 2)), CAST(21180 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2322, 1, CAST(1050 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), CAST(84.00 AS Numeric(10, 2)), CAST(25042 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2323, 1, CAST(1200 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), CAST(96.00 AS Numeric(10, 2)), CAST(28033 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2324, 1, CAST(1350 AS Numeric(18, 0)), CAST(9.00 AS Numeric(10, 2)), CAST(108.00 AS Numeric(10, 2)), CAST(28827 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2325, 1, CAST(1500 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), CAST(120.00 AS Numeric(10, 2)), CAST(33115 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2326, 1, CAST(1800 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)), CAST(144.00 AS Numeric(10, 2)), CAST(36697 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2327, 1, CAST(2250 AS Numeric(18, 0)), CAST(15.00 AS Numeric(10, 2)), CAST(180.00 AS Numeric(10, 2)), CAST(46677 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2328, 2, CAST(150 AS Numeric(18, 0)), CAST(1.44 AS Numeric(10, 2)), CAST(12.00 AS Numeric(10, 2)), CAST(5363 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2329, 2, CAST(225 AS Numeric(18, 0)), CAST(2.16 AS Numeric(10, 2)), CAST(18.00 AS Numeric(10, 2)), CAST(6553 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2330, 2, CAST(300 AS Numeric(18, 0)), CAST(2.88 AS Numeric(10, 2)), CAST(24.00 AS Numeric(10, 2)), CAST(6737 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2331, 2, CAST(375 AS Numeric(18, 0)), CAST(3.60 AS Numeric(10, 2)), CAST(30.00 AS Numeric(10, 2)), CAST(7570 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2332, 2, CAST(450 AS Numeric(18, 0)), CAST(4.32 AS Numeric(10, 2)), CAST(36.00 AS Numeric(10, 2)), CAST(8954 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2333, 2, CAST(525 AS Numeric(18, 0)), CAST(5.04 AS Numeric(10, 2)), CAST(42.00 AS Numeric(10, 2)), CAST(9777 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2334, 2, CAST(600 AS Numeric(18, 0)), CAST(5.76 AS Numeric(10, 2)), CAST(48.00 AS Numeric(10, 2)), CAST(10387 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2335, 2, CAST(675 AS Numeric(18, 0)), CAST(6.48 AS Numeric(10, 2)), CAST(54.00 AS Numeric(10, 2)), CAST(11306 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2336, 2, CAST(750 AS Numeric(18, 0)), CAST(7.20 AS Numeric(10, 2)), CAST(60.00 AS Numeric(10, 2)), CAST(12226 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2337, 2, CAST(900 AS Numeric(18, 0)), CAST(8.64 AS Numeric(10, 2)), CAST(72.00 AS Numeric(10, 2)), CAST(14278 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2338, 2, CAST(1050 AS Numeric(18, 0)), CAST(10.08 AS Numeric(10, 2)), CAST(84.00 AS Numeric(10, 2)), CAST(16388 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2339, 2, CAST(1200 AS Numeric(18, 0)), CAST(11.52 AS Numeric(10, 2)), CAST(96.00 AS Numeric(10, 2)), CAST(18237 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2340, 2, CAST(1350 AS Numeric(18, 0)), CAST(12.96 AS Numeric(10, 2)), CAST(108.00 AS Numeric(10, 2)), CAST(19786 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2341, 2, CAST(1500 AS Numeric(18, 0)), CAST(14.40 AS Numeric(10, 2)), CAST(120.00 AS Numeric(10, 2)), CAST(24161 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2342, 2, CAST(1800 AS Numeric(18, 0)), CAST(17.28 AS Numeric(10, 2)), CAST(144.00 AS Numeric(10, 2)), CAST(28875 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2343, 2, CAST(2250 AS Numeric(18, 0)), CAST(21.60 AS Numeric(10, 2)), CAST(180.00 AS Numeric(10, 2)), CAST(39233 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2344, 3, CAST(150 AS Numeric(18, 0)), CAST(1.33 AS Numeric(10, 2)), CAST(9.00 AS Numeric(10, 2)), CAST(4472 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2345, 3, CAST(220 AS Numeric(18, 0)), CAST(2.06 AS Numeric(10, 2)), CAST(14.00 AS Numeric(10, 2)), CAST(5392 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2346, 3, CAST(300 AS Numeric(18, 0)), CAST(2.78 AS Numeric(10, 2)), CAST(19.00 AS Numeric(10, 2)), CAST(6660 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2347, 3, CAST(400 AS Numeric(18, 0)), CAST(3.72 AS Numeric(10, 2)), CAST(25.00 AS Numeric(10, 2)), CAST(6640 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2348, 3, CAST(500 AS Numeric(18, 0)), CAST(4.65 AS Numeric(10, 2)), CAST(31.00 AS Numeric(10, 2)), CAST(7454 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2349, 3, CAST(600 AS Numeric(18, 0)), CAST(5.21 AS Numeric(10, 2)), CAST(35.00 AS Numeric(10, 2)), CAST(8102 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2350, 3, CAST(700 AS Numeric(18, 0)), CAST(6.09 AS Numeric(10, 2)), CAST(41.00 AS Numeric(10, 2)), CAST(8760 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2351, 3, CAST(850 AS Numeric(18, 0)), CAST(7.41 AS Numeric(10, 2)), CAST(49.00 AS Numeric(10, 2)), CAST(10290 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2352, 3, CAST(1000 AS Numeric(18, 0)), CAST(8.72 AS Numeric(10, 2)), CAST(58.00 AS Numeric(10, 2)), CAST(12410 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2353, 3, CAST(1250 AS Numeric(18, 0)), CAST(10.91 AS Numeric(10, 2)), CAST(73.00 AS Numeric(10, 2)), CAST(14394 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2354, 3, CAST(1500 AS Numeric(18, 0)), CAST(13.10 AS Numeric(10, 2)), CAST(87.00 AS Numeric(10, 2)), CAST(17298 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2355, 3, CAST(1700 AS Numeric(18, 0)), CAST(14.85 AS Numeric(10, 2)), CAST(99.00 AS Numeric(10, 2)), CAST(19012 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2356, 3, CAST(1900 AS Numeric(18, 0)), CAST(16.61 AS Numeric(10, 2)), CAST(111.00 AS Numeric(10, 2)), CAST(21180 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2357, 3, CAST(2100 AS Numeric(18, 0)), CAST(18.36 AS Numeric(10, 2)), CAST(122.00 AS Numeric(10, 2)), CAST(22612 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2358, 3, CAST(2300 AS Numeric(18, 0)), CAST(20.12 AS Numeric(10, 2)), CAST(134.00 AS Numeric(10, 2)), CAST(24277 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2359, 3, CAST(2600 AS Numeric(18, 0)), CAST(22.74 AS Numeric(10, 2)), CAST(152.00 AS Numeric(10, 2)), CAST(28072 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2360, 3, CAST(3350 AS Numeric(18, 0)), CAST(29.55 AS Numeric(10, 2)), CAST(197.00 AS Numeric(10, 2)), CAST(36106 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2361, 4, CAST(135 AS Numeric(18, 0)), CAST(0.63 AS Numeric(10, 2)), CAST(5.00 AS Numeric(10, 2)), CAST(5266 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2362, 4, CAST(300 AS Numeric(18, 0)), CAST(1.31 AS Numeric(10, 2)), CAST(10.00 AS Numeric(10, 2)), CAST(6369 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2363, 4, CAST(405 AS Numeric(18, 0)), CAST(1.88 AS Numeric(10, 2)), CAST(15.00 AS Numeric(10, 2)), CAST(7434 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2364, 4, CAST(569 AS Numeric(18, 0)), CAST(2.64 AS Numeric(10, 2)), CAST(21.00 AS Numeric(10, 2)), CAST(7938 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2365, 4, CAST(891 AS Numeric(18, 0)), CAST(4.02 AS Numeric(10, 2)), CAST(32.00 AS Numeric(10, 2)), CAST(8838 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2366, 4, CAST(1068 AS Numeric(18, 0)), CAST(4.76 AS Numeric(10, 2)), CAST(38.00 AS Numeric(10, 2)), CAST(10028 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2367, 4, CAST(1350 AS Numeric(18, 0)), CAST(6.04 AS Numeric(10, 2)), CAST(48.00 AS Numeric(10, 2)), CAST(12042 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2368, 4, CAST(1593 AS Numeric(18, 0)), CAST(7.21 AS Numeric(10, 2)), CAST(58.00 AS Numeric(10, 2)), CAST(14588 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2369, 4, CAST(1905 AS Numeric(18, 0)), CAST(8.59 AS Numeric(10, 2)), CAST(69.00 AS Numeric(10, 2)), CAST(15624 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2370, 4, CAST(2080 AS Numeric(18, 0)), CAST(9.42 AS Numeric(10, 2)), CAST(75.00 AS Numeric(10, 2)), CAST(17743 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2371, 4, CAST(2430 AS Numeric(18, 0)), CAST(10.92 AS Numeric(10, 2)), CAST(87.00 AS Numeric(10, 2)), CAST(19302 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2372, 4, CAST(2608 AS Numeric(18, 0)), CAST(12.08 AS Numeric(10, 2)), CAST(97.00 AS Numeric(10, 2)), CAST(21315 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2373, 4, CAST(2895 AS Numeric(18, 0)), CAST(13.40 AS Numeric(10, 2)), CAST(107.00 AS Numeric(10, 2)), CAST(23610 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2374, 4, CAST(3197 AS Numeric(18, 0)), CAST(14.80 AS Numeric(10, 2)), CAST(118.00 AS Numeric(10, 2)), CAST(25729 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2375, 4, CAST(3474 AS Numeric(18, 0)), CAST(16.13 AS Numeric(10, 2)), CAST(129.00 AS Numeric(10, 2)), CAST(27936 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2376, 5, CAST(135 AS Numeric(18, 0)), CAST(0.63 AS Numeric(10, 2)), CAST(5.00 AS Numeric(10, 2)), CAST(5266 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2377, 5, CAST(300 AS Numeric(18, 0)), CAST(1.31 AS Numeric(10, 2)), CAST(10.00 AS Numeric(10, 2)), CAST(6369 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2378, 5, CAST(405 AS Numeric(18, 0)), CAST(1.88 AS Numeric(10, 2)), CAST(15.00 AS Numeric(10, 2)), CAST(7434 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2379, 5, CAST(569 AS Numeric(18, 0)), CAST(2.64 AS Numeric(10, 2)), CAST(21.00 AS Numeric(10, 2)), CAST(7938 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2380, 5, CAST(891 AS Numeric(18, 0)), CAST(4.02 AS Numeric(10, 2)), CAST(32.00 AS Numeric(10, 2)), CAST(8838 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2381, 5, CAST(1068 AS Numeric(18, 0)), CAST(4.76 AS Numeric(10, 2)), CAST(38.00 AS Numeric(10, 2)), CAST(10028 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2382, 5, CAST(1350 AS Numeric(18, 0)), CAST(6.04 AS Numeric(10, 2)), CAST(48.00 AS Numeric(10, 2)), CAST(12042 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2383, 5, CAST(1593 AS Numeric(18, 0)), CAST(7.21 AS Numeric(10, 2)), CAST(58.00 AS Numeric(10, 2)), CAST(14588 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2384, 5, CAST(1905 AS Numeric(18, 0)), CAST(8.59 AS Numeric(10, 2)), CAST(69.00 AS Numeric(10, 2)), CAST(15624 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2385, 5, CAST(2080 AS Numeric(18, 0)), CAST(9.42 AS Numeric(10, 2)), CAST(75.00 AS Numeric(10, 2)), CAST(17743 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2386, 5, CAST(2430 AS Numeric(18, 0)), CAST(10.92 AS Numeric(10, 2)), CAST(87.00 AS Numeric(10, 2)), CAST(19302 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2387, 5, CAST(2608 AS Numeric(18, 0)), CAST(12.08 AS Numeric(10, 2)), CAST(97.00 AS Numeric(10, 2)), CAST(21315 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2388, 5, CAST(2895 AS Numeric(18, 0)), CAST(13.40 AS Numeric(10, 2)), CAST(107.00 AS Numeric(10, 2)), CAST(23610 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2389, 5, CAST(3197 AS Numeric(18, 0)), CAST(14.80 AS Numeric(10, 2)), CAST(118.00 AS Numeric(10, 2)), CAST(25729 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2390, 5, CAST(3474 AS Numeric(18, 0)), CAST(16.13 AS Numeric(10, 2)), CAST(129.00 AS Numeric(10, 2)), CAST(27936 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2391, 6, CAST(30 AS Numeric(18, 0)), NULL, CAST(3.00 AS Numeric(10, 2)), CAST(4027 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2392, 6, CAST(40 AS Numeric(18, 0)), NULL, CAST(4.00 AS Numeric(10, 2)), CAST(4201 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2393, 6, CAST(50 AS Numeric(18, 0)), NULL, CAST(5.00 AS Numeric(10, 2)), CAST(4656 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2394, 6, CAST(60 AS Numeric(18, 0)), NULL, CAST(6.00 AS Numeric(10, 2)), CAST(4869 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2395, 6, CAST(80 AS Numeric(18, 0)), NULL, CAST(8.00 AS Numeric(10, 2)), CAST(5460 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2396, 6, CAST(100 AS Numeric(18, 0)), NULL, CAST(10.00 AS Numeric(10, 2)), CAST(5982 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2397, 6, CAST(120 AS Numeric(18, 0)), NULL, CAST(12.00 AS Numeric(10, 2)), CAST(6582 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2398, 6, CAST(140 AS Numeric(18, 0)), NULL, CAST(14.00 AS Numeric(10, 2)), CAST(6853 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2399, 6, CAST(180 AS Numeric(18, 0)), NULL, CAST(18.00 AS Numeric(10, 2)), CAST(7589 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2400, 6, CAST(220 AS Numeric(18, 0)), NULL, CAST(22.00 AS Numeric(10, 2)), CAST(7899 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2401, 6, CAST(240 AS Numeric(18, 0)), NULL, CAST(24.00 AS Numeric(10, 2)), CAST(8693 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2402, 6, CAST(280 AS Numeric(18, 0)), NULL, CAST(28.00 AS Numeric(10, 2)), CAST(9051 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2403, 6, CAST(320 AS Numeric(18, 0)), NULL, CAST(32.00 AS Numeric(10, 2)), CAST(9941 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2404, 6, CAST(360 AS Numeric(18, 0)), NULL, CAST(36.00 AS Numeric(10, 2)), CAST(11180 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2405, 6, CAST(500 AS Numeric(18, 0)), NULL, CAST(50.00 AS Numeric(10, 2)), CAST(15565 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2406, 6, CAST(600 AS Numeric(18, 0)), NULL, CAST(60.00 AS Numeric(10, 2)), CAST(18702 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2407, 7, CAST(30 AS Numeric(18, 0)), NULL, CAST(3.00 AS Numeric(10, 2)), CAST(4027 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2408, 7, CAST(40 AS Numeric(18, 0)), NULL, CAST(4.00 AS Numeric(10, 2)), CAST(4201 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2409, 7, CAST(50 AS Numeric(18, 0)), NULL, CAST(5.00 AS Numeric(10, 2)), CAST(4656 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2410, 7, CAST(60 AS Numeric(18, 0)), NULL, CAST(6.00 AS Numeric(10, 2)), CAST(4869 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2411, 7, CAST(80 AS Numeric(18, 0)), NULL, CAST(8.00 AS Numeric(10, 2)), CAST(5460 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2412, 7, CAST(100 AS Numeric(18, 0)), NULL, CAST(10.00 AS Numeric(10, 2)), CAST(5982 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2413, 7, CAST(120 AS Numeric(18, 0)), NULL, CAST(12.00 AS Numeric(10, 2)), CAST(6582 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2414, 7, CAST(140 AS Numeric(18, 0)), NULL, CAST(14.00 AS Numeric(10, 2)), CAST(6853 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2415, 7, CAST(180 AS Numeric(18, 0)), NULL, CAST(18.00 AS Numeric(10, 2)), CAST(7589 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2416, 7, CAST(220 AS Numeric(18, 0)), NULL, CAST(22.00 AS Numeric(10, 2)), CAST(7899 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2417, 7, CAST(240 AS Numeric(18, 0)), NULL, CAST(24.00 AS Numeric(10, 2)), CAST(8693 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2418, 7, CAST(280 AS Numeric(18, 0)), NULL, CAST(28.00 AS Numeric(10, 2)), CAST(9051 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2419, 7, CAST(320 AS Numeric(18, 0)), NULL, CAST(32.00 AS Numeric(10, 2)), CAST(9941 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2420, 7, CAST(360 AS Numeric(18, 0)), NULL, CAST(36.00 AS Numeric(10, 2)), CAST(11180 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2421, 7, CAST(500 AS Numeric(18, 0)), NULL, CAST(50.00 AS Numeric(10, 2)), CAST(15565 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2422, 7, CAST(600 AS Numeric(18, 0)), NULL, CAST(60.00 AS Numeric(10, 2)), CAST(18702 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2423, 8, CAST(30 AS Numeric(18, 0)), NULL, CAST(3.00 AS Numeric(10, 2)), CAST(4027 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2424, 8, CAST(40 AS Numeric(18, 0)), NULL, CAST(4.00 AS Numeric(10, 2)), CAST(4201 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2425, 8, CAST(50 AS Numeric(18, 0)), NULL, CAST(5.00 AS Numeric(10, 2)), CAST(4656 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2426, 8, CAST(60 AS Numeric(18, 0)), NULL, CAST(6.00 AS Numeric(10, 2)), CAST(4869 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2427, 8, CAST(80 AS Numeric(18, 0)), NULL, CAST(8.00 AS Numeric(10, 2)), CAST(5460 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2428, 8, CAST(100 AS Numeric(18, 0)), NULL, CAST(10.00 AS Numeric(10, 2)), CAST(5982 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2429, 8, CAST(120 AS Numeric(18, 0)), NULL, CAST(12.00 AS Numeric(10, 2)), CAST(6582 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2430, 8, CAST(140 AS Numeric(18, 0)), NULL, CAST(14.00 AS Numeric(10, 2)), CAST(6853 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2431, 8, CAST(180 AS Numeric(18, 0)), NULL, CAST(18.00 AS Numeric(10, 2)), CAST(7589 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2432, 8, CAST(220 AS Numeric(18, 0)), NULL, CAST(22.00 AS Numeric(10, 2)), CAST(7899 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2433, 8, CAST(240 AS Numeric(18, 0)), NULL, CAST(24.00 AS Numeric(10, 2)), CAST(8693 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2434, 8, CAST(280 AS Numeric(18, 0)), NULL, CAST(28.00 AS Numeric(10, 2)), CAST(9051 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2435, 8, CAST(320 AS Numeric(18, 0)), NULL, CAST(32.00 AS Numeric(10, 2)), CAST(9941 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2436, 8, CAST(360 AS Numeric(18, 0)), NULL, CAST(36.00 AS Numeric(10, 2)), CAST(11180 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2437, 8, CAST(500 AS Numeric(18, 0)), NULL, CAST(50.00 AS Numeric(10, 2)), CAST(15565 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2438, 8, CAST(600 AS Numeric(18, 0)), NULL, CAST(60.00 AS Numeric(10, 2)), CAST(18702 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2439, 9, CAST(150 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)), CAST(12.00 AS Numeric(10, 2)), CAST(5691 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2440, 9, CAST(225 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), CAST(18.00 AS Numeric(10, 2)), CAST(7014 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2441, 9, CAST(300 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), CAST(24.00 AS Numeric(10, 2)), CAST(7081 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2442, 9, CAST(375 AS Numeric(18, 0)), CAST(2.50 AS Numeric(10, 2)), CAST(30.00 AS Numeric(10, 2)), CAST(8256 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2443, 9, CAST(450 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), CAST(36.00 AS Numeric(10, 2)), CAST(9833 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2444, 9, CAST(525 AS Numeric(18, 0)), CAST(3.50 AS Numeric(10, 2)), CAST(42.00 AS Numeric(10, 2)), CAST(11610 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2445, 9, CAST(600 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), CAST(48.00 AS Numeric(10, 2)), CAST(12024 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2446, 9, CAST(675 AS Numeric(18, 0)), CAST(4.50 AS Numeric(10, 2)), CAST(54.00 AS Numeric(10, 2)), CAST(13360 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2447, 9, CAST(750 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), CAST(60.00 AS Numeric(10, 2)), CAST(14322 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2448, 9, CAST(900 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), CAST(72.00 AS Numeric(10, 2)), CAST(16687 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2449, 9, CAST(1050 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), CAST(84.00 AS Numeric(10, 2)), CAST(19773 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2450, 9, CAST(1200 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), CAST(96.00 AS Numeric(10, 2)), CAST(22151 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2451, 9, CAST(1350 AS Numeric(18, 0)), CAST(9.00 AS Numeric(10, 2)), CAST(108.00 AS Numeric(10, 2)), CAST(22806 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2452, 9, CAST(1500 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), CAST(120.00 AS Numeric(10, 2)), CAST(26212 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2453, 9, CAST(1800 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)), CAST(144.00 AS Numeric(10, 2)), CAST(30073 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2454, 9, CAST(2250 AS Numeric(18, 0)), CAST(15.00 AS Numeric(10, 2)), CAST(180.00 AS Numeric(10, 2)), CAST(37114 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2455, 19, CAST(170 AS Numeric(18, 0)), CAST(0.80 AS Numeric(10, 2)), NULL, CAST(2653 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2456, 19, CAST(270 AS Numeric(18, 0)), CAST(1.40 AS Numeric(10, 2)), NULL, CAST(3765 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2457, 19, CAST(350 AS Numeric(18, 0)), CAST(1.70 AS Numeric(10, 2)), NULL, CAST(4134 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2458, 19, CAST(460 AS Numeric(18, 0)), CAST(2.20 AS Numeric(10, 2)), NULL, CAST(4999 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2459, 19, CAST(550 AS Numeric(18, 0)), CAST(2.70 AS Numeric(10, 2)), NULL, CAST(5554 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2460, 19, CAST(640 AS Numeric(18, 0)), CAST(3.20 AS Numeric(10, 2)), NULL, CAST(6356 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2461, 19, CAST(720 AS Numeric(18, 0)), CAST(3.60 AS Numeric(10, 2)), NULL, CAST(7220 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2462, 19, CAST(870 AS Numeric(18, 0)), CAST(4.40 AS Numeric(10, 2)), NULL, CAST(9195 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2463, 19, CAST(1080 AS Numeric(18, 0)), CAST(5.30 AS Numeric(10, 2)), NULL, CAST(10058 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2464, 19, CAST(1300 AS Numeric(18, 0)), CAST(6.40 AS Numeric(10, 2)), NULL, CAST(11725 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2465, 19, CAST(1580 AS Numeric(18, 0)), CAST(7.90 AS Numeric(10, 2)), NULL, CAST(14441 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2466, 19, CAST(1850 AS Numeric(18, 0)), CAST(9.20 AS Numeric(10, 2)), NULL, CAST(18328 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2467, 19, CAST(2330 AS Numeric(18, 0)), CAST(11.60 AS Numeric(10, 2)), NULL, CAST(22771 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2468, 20, CAST(170 AS Numeric(18, 0)), CAST(1.28 AS Numeric(10, 2)), CAST(8.00 AS Numeric(10, 2)), CAST(2037 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2469, 20, CAST(270 AS Numeric(18, 0)), CAST(2.24 AS Numeric(10, 2)), CAST(14.00 AS Numeric(10, 2)), CAST(2715 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2470, 20, CAST(350 AS Numeric(18, 0)), CAST(2.72 AS Numeric(10, 2)), CAST(17.00 AS Numeric(10, 2)), CAST(3024 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2471, 20, CAST(460 AS Numeric(18, 0)), CAST(3.52 AS Numeric(10, 2)), CAST(22.00 AS Numeric(10, 2)), CAST(3456 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2472, 20, CAST(550 AS Numeric(18, 0)), CAST(4.32 AS Numeric(10, 2)), CAST(27.00 AS Numeric(10, 2)), CAST(3703 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2473, 20, CAST(640 AS Numeric(18, 0)), CAST(5.12 AS Numeric(10, 2)), CAST(32.00 AS Numeric(10, 2)), CAST(4258 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2474, 20, CAST(720 AS Numeric(18, 0)), CAST(5.76 AS Numeric(10, 2)), CAST(36.00 AS Numeric(10, 2)), CAST(4814 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2475, 20, CAST(870 AS Numeric(18, 0)), CAST(7.04 AS Numeric(10, 2)), CAST(44.00 AS Numeric(10, 2)), CAST(5801 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2476, 20, CAST(1080 AS Numeric(18, 0)), CAST(8.48 AS Numeric(10, 2)), CAST(53.00 AS Numeric(10, 2)), CAST(6295 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2477, 20, CAST(1300 AS Numeric(18, 0)), CAST(10.24 AS Numeric(10, 2)), CAST(64.00 AS Numeric(10, 2)), CAST(7467 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2478, 20, CAST(1580 AS Numeric(18, 0)), CAST(12.64 AS Numeric(10, 2)), CAST(79.00 AS Numeric(10, 2)), CAST(8824 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2479, 20, CAST(1850 AS Numeric(18, 0)), CAST(14.72 AS Numeric(10, 2)), CAST(92.00 AS Numeric(10, 2)), CAST(10861 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2480, 20, CAST(2330 AS Numeric(18, 0)), CAST(18.56 AS Numeric(10, 2)), CAST(116.00 AS Numeric(10, 2)), CAST(13391 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2481, 20, CAST(2790 AS Numeric(18, 0)), CAST(22.24 AS Numeric(10, 2)), CAST(139.00 AS Numeric(10, 2)), CAST(17156 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2482, 21, CAST(170 AS Numeric(18, 0)), CAST(1.28 AS Numeric(10, 2)), CAST(8.00 AS Numeric(10, 2)), CAST(2037 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2483, 21, CAST(270 AS Numeric(18, 0)), CAST(2.24 AS Numeric(10, 2)), CAST(14.00 AS Numeric(10, 2)), CAST(2715 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2484, 21, CAST(350 AS Numeric(18, 0)), CAST(2.72 AS Numeric(10, 2)), CAST(17.00 AS Numeric(10, 2)), CAST(3024 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2485, 21, CAST(460 AS Numeric(18, 0)), CAST(3.52 AS Numeric(10, 2)), CAST(22.00 AS Numeric(10, 2)), CAST(3456 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2486, 21, CAST(550 AS Numeric(18, 0)), CAST(4.32 AS Numeric(10, 2)), CAST(27.00 AS Numeric(10, 2)), CAST(3703 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2487, 21, CAST(640 AS Numeric(18, 0)), CAST(5.12 AS Numeric(10, 2)), CAST(32.00 AS Numeric(10, 2)), CAST(4258 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2488, 21, CAST(720 AS Numeric(18, 0)), CAST(5.76 AS Numeric(10, 2)), CAST(36.00 AS Numeric(10, 2)), CAST(4814 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2489, 21, CAST(870 AS Numeric(18, 0)), CAST(7.04 AS Numeric(10, 2)), CAST(44.00 AS Numeric(10, 2)), CAST(5801 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2490, 21, CAST(1080 AS Numeric(18, 0)), CAST(8.48 AS Numeric(10, 2)), CAST(53.00 AS Numeric(10, 2)), CAST(6295 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2491, 21, CAST(1300 AS Numeric(18, 0)), CAST(10.24 AS Numeric(10, 2)), CAST(64.00 AS Numeric(10, 2)), CAST(7467 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2492, 21, CAST(1580 AS Numeric(18, 0)), CAST(12.64 AS Numeric(10, 2)), CAST(79.00 AS Numeric(10, 2)), CAST(8824 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2493, 21, CAST(1850 AS Numeric(18, 0)), CAST(14.72 AS Numeric(10, 2)), CAST(92.00 AS Numeric(10, 2)), CAST(10861 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2494, 21, CAST(2330 AS Numeric(18, 0)), CAST(18.56 AS Numeric(10, 2)), CAST(116.00 AS Numeric(10, 2)), CAST(13391 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2495, 21, CAST(2790 AS Numeric(18, 0)), CAST(22.24 AS Numeric(10, 2)), CAST(139.00 AS Numeric(10, 2)), CAST(17156 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2496, 22, CAST(80 AS Numeric(18, 0)), CAST(0.50 AS Numeric(10, 2)), CAST(5.00 AS Numeric(10, 2)), CAST(3280 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2497, 22, CAST(145 AS Numeric(18, 0)), CAST(0.90 AS Numeric(10, 2)), CAST(9.00 AS Numeric(10, 2)), CAST(3317 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2498, 22, CAST(240 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), CAST(16.00 AS Numeric(10, 2)), CAST(4543 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2499, 22, CAST(300 AS Numeric(18, 0)), CAST(1.90 AS Numeric(10, 2)), CAST(20.00 AS Numeric(10, 2)), CAST(5241 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2500, 22, CAST(395 AS Numeric(18, 0)), CAST(2.40 AS Numeric(10, 2)), CAST(26.00 AS Numeric(10, 2)), CAST(6108 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2501, 22, CAST(475 AS Numeric(18, 0)), CAST(2.90 AS Numeric(10, 2)), CAST(31.00 AS Numeric(10, 2)), CAST(6937 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2502, 22, CAST(560 AS Numeric(18, 0)), CAST(3.50 AS Numeric(10, 2)), CAST(37.00 AS Numeric(10, 2)), CAST(7936 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2503, 22, CAST(625 AS Numeric(18, 0)), CAST(3.90 AS Numeric(10, 2)), CAST(41.00 AS Numeric(10, 2)), CAST(8558 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2504, 22, CAST(760 AS Numeric(18, 0)), CAST(4.80 AS Numeric(10, 2)), CAST(50.00 AS Numeric(10, 2)), CAST(10368 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2505, 22, CAST(925 AS Numeric(18, 0)), CAST(5.80 AS Numeric(10, 2)), CAST(62.00 AS Numeric(10, 2)), CAST(11593 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2506, 22, CAST(1120 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), CAST(74.00 AS Numeric(10, 2)), CAST(14157 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2507, 22, CAST(1380 AS Numeric(18, 0)), CAST(8.60 AS Numeric(10, 2)), CAST(91.00 AS Numeric(10, 2)), CAST(17626 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2508, 22, CAST(1600 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), CAST(107.00 AS Numeric(10, 2)), CAST(19850 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2509, 22, CAST(2000 AS Numeric(18, 0)), CAST(12.50 AS Numeric(10, 2)), CAST(135.00 AS Numeric(10, 2)), CAST(23979 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2510, 22, CAST(2400 AS Numeric(18, 0)), CAST(15.00 AS Numeric(10, 2)), CAST(162.00 AS Numeric(10, 2)), CAST(30256 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2511, 23, CAST(150 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)), NULL, CAST(2306 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2512, 23, CAST(225 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), NULL, CAST(2781 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2513, 23, CAST(300 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), NULL, CAST(3458 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2514, 23, CAST(375 AS Numeric(18, 0)), CAST(2.50 AS Numeric(10, 2)), NULL, CAST(4145 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2515, 23, CAST(450 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), NULL, CAST(4822 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2516, 23, CAST(525 AS Numeric(18, 0)), CAST(3.50 AS Numeric(10, 2)), NULL, CAST(5509 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2517, 23, CAST(600 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), NULL, CAST(6186 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2518, 23, CAST(675 AS Numeric(18, 0)), CAST(4.50 AS Numeric(10, 2)), NULL, CAST(6864 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2519, 23, CAST(750 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), NULL, CAST(7550 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2520, 23, CAST(900 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), NULL, CAST(8914 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2521, 23, CAST(1050 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), NULL, CAST(10278 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2522, 23, CAST(1200 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), NULL, CAST(11642 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2523, 23, CAST(1350 AS Numeric(18, 0)), CAST(9.00 AS Numeric(10, 2)), NULL, CAST(12998 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2524, 23, CAST(1500 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), NULL, CAST(14362 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2525, 23, CAST(1800 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)), NULL, CAST(17090 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2526, 24, CAST(140 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)), NULL, CAST(4792 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2527, 24, CAST(210 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), NULL, CAST(6389 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2528, 24, CAST(280 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), NULL, CAST(7628 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2529, 24, CAST(420 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), NULL, CAST(10542 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2530, 24, CAST(560 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), NULL, CAST(13242 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2531, 24, CAST(700 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), NULL, CAST(15091 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2532, 24, CAST(840 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), NULL, CAST(18073 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2533, 24, CAST(980 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), NULL, CAST(22651 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2534, 24, CAST(1120 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), NULL, CAST(23919 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2535, 24, CAST(1260 AS Numeric(18, 0)), CAST(9.00 AS Numeric(10, 2)), NULL, CAST(27027 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2536, 24, CAST(1400 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), NULL, CAST(28808 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2542, 26, NULL, NULL, NULL, CAST(1830 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2543, 27, NULL, NULL, NULL, CAST(3784 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2544, 28, NULL, NULL, NULL, CAST(2253 AS Numeric(18, 0)), NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength]) VALUES (2545, 29, NULL, NULL, NULL, CAST(3718 AS Numeric(18, 0)), NULL)
GO
SET IDENTITY_INSERT [dbo].[ProductOptions] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (1, N'HEMSTEDT DH 150 Вт/м кв', 1, 1, N'Маты DH и тонкий кабель DR используются, когда необходимо минимально поднять уровень пола. Монтаж производится на готовую стяжку под напольное покрытие в клеевой раствор или самовыравнивающую смесь. Кабель для мата DR имеет унирсальное назначение. За счет различного шага укладки этот кабель можно использовать как для полноценного отопления (до 250 Вт/м.кв.), так и для укладки под деревянные напольные покрытия (100 Вт/м.кв.). Кабель утапливается в клеевой раствор, не повышая высоту пола. Перед залитием стяжки рекомендуется укладывать теплоизолятор. Имеет три преимущества над кабелем для укладки в стяжку: 1) более быстрый прогрев пола (незначительно экономичнее); 2) более простой монтаж; 3) имеет более высокую температуру плавления внутренней изоляции.', N'Нагревательный мат DH 150 Вт/м кв. для укладки в плиточный клей', 1, 1, N'Германия', 11)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (2, N'HEMSTEDT DR 12,5 Вт/м', 1, 1, N'Маты DH и тонкий кабель DR используются, когда необходимо минимально поднять уровень пола. Монтаж производится на готовую стяжку под напольное покрытие в клеевой раствор или самовыравнивающую смесь. Кабель для мата DR имеет унирсальное назначение. За счет различного шага укладки этот кабель можно использовать как для полноценного отопления (до 250 Вт/м.кв.), так и для укладки под деревянные напольные покрытия (100 Вт/м.кв.). Кабель утапливается в клеевой раствор, не повышая высоту пола. Перед залитием стяжки рекомендуется укладывать теплоизолятор. Имеет три преимущества над кабелем для укладки в стяжку: 1) более быстрый прогрев пола (незначительно экономичнее); 2) более простой монтаж; 3) имеет более высокую температуру плавления внутренней изоляции.', N'Тонкий кабель DR 12,5 Вт/м для укладки в плиточный клей', 1, 1, N'Германия', 11)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (3, N'HEMSTEDT BR-IM 17 Вт/м', 1, 1, N'Кабель BR-IM для теплого пола используются для укладки в стяжку 3-8 см. Они также идеально подходят для полного обогрева помещений, в системах снеготаяния на открытых площадках, в системах антиоблединения на крышах, для обогрева труб и грунта. Перед укладкой кабеля необходимо укладывать теплоизолятор (рекомендуется экструдированный пенополистирол от 2 см, в крайнем случае подложку для ламината 5 мм). Кабель не рекомендуется укладывать напрямую на теплоизолятор. Теплоизолятор необходимо залить черновой стяжкой, в крайнем случае покласть сверху металлическую сетку (армированную или просечно-вытяжную). В случае укладки сетки необходимо оставить пространство между кабелем и теплоизолятором, чтобы при залитии жидким раствором для стяжки заполнить данное пространство смесью. Стяжка должна быть с минимальным количеством воздушных пустот.', N'Двужильный кабель BR-IM 17 Вт/м для укладки в стяжку', 1, 1, N'Германия', 12)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (4, N'HEMSTEDT BRF-IM 27 Вт/м', 1, 1, N'Кабель BRF-IM используется для обогрева водостоков, открытых площадей, балконов. Для обогрева открытых площадей рекомендуется укладывать шагом 7.5 см (10 см при наличии теплоизолятора). Для более быстрого нагрева рекомендуется укладывать как можно ближе к поверхности. При укладки в стяжку на улице необходимо добавлять пластификатор. В водостоки (трубы) диаметром 100-120 мм кабель укладывается в 2 нити, меньшим диметром в 1 нить.', N'Двужильный кабель BRF-IM 27 Вт/м для обогрева водостоков, кровли, открытых площадей и балконов', 1, 3, N'Германия', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (5, N'HEMSTEDT BRF-IM 27 Вт/м', 1, 1, N'Кабель BRF-IM используется для обогрева водостоков, открытых площадей, балконов. Для обогрева открытых площадей рекомендуется укладывать шагом 7.5 см (10 см при наличии теплоизолятора). Для более быстрого нагрева рекомендуется укладывать как можно ближе к поверхности. При укладки в стяжку на улице необходимо добавлять пластификатор. В водостоки (трубы) диаметром 100-120 мм кабель укладывается в 2 нити, меньшим диметром в 1 нить.', N'Двужильный кабель BRF-IM 27 Вт/м для обогрева водостоков, кровли, открытых площадей и балконов', 1, 4, N'Германия', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (6, N'HEMSTEDT DAS 30 Вт/м', 1, 1, N'Кабель DAS со встроенным термостатом для обогрева крыш, водостоков и труб большого диаметра. Биметаллический термостат включает кабель при понижении температуры ниже 5 С на датчике, выключет при повышении выже 15 С. В водостоки (трубы) диаметром 100-120 мм кабель укладывается в 2 нити, меньшим диметром в 1 нить. При обогреве трубы ее необходимо теплоизолировать. Толщина телоизоляции должна быть не меньше радиуса обогреваемой трубы.', N'Двужильный кабель DAS 30 Вт/м со встроенным термостатом и вилкой для обогрева труб и водостоков.', 1, 3, N'Германия', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (7, N'HEMSTEDT DAS 30 Вт/м', 1, 1, N'Кабель DAS со встроенным термостатом для обогрева крыш, водостоков и труб большого диаметра. Биметаллический термостат включает кабель при понижении температуры ниже 5 С на датчике, выключет при повышении выже 15 С. В водостоки (трубы) диаметром 100-120 мм кабель укладывается в 2 нити, меньшим диметром в 1 нить. При обогреве трубы ее необходимо теплоизолировать. Толщина телоизоляции должна быть не меньше радиуса обогреваемой трубы.', N'Двужильный кабель DAS 30 Вт/м со встроенным термостатом и вилкой для обогрева труб и водостоков.', 1, 5, N'Германия', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (8, N'HEMSTEDT FS 10 Вт/м', 1, 1, N'Кабель FS со встроенным термостатом для обогрева труб и водопроводов. Биметаллический термостат включает кабель при пониженни температуры ниже 5 С на датчике, выключает при повышении выше 15 С. При обогреве трубы необходимо ее теплоизолировать. Толщина теплоизолятора должна быть не меньше радиуса обогреваемой трубы.', N'Кабель двужильный FS 10 Вт/м со встроенным термостатом и вилкой для оборева труб', 1, 5, N'Германия', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (9, N'HEMSTEDT DI SI H 150 Вт/м кв', 1, 2, N'Маты DH и тонкий кабель DR используются, когда необходимо минимально поднять уровень пола. Монтаж производится на готовую стяжку под напольное покрытие в клеевой раствор или самовыравнивающую смесь. Кабель для мата DR имеет унирсальное назначение. За счет различного шага укладки этот кабель можно использовать как для полноценного отопления (до 250 Вт/м.кв.), так и для укладки под деревянные напольные покрытия (100 Вт/м.кв.). Кабель утапливается в клеевой раствор, не повышая высоту пола. Перед залитием стяжки рекомендуется укладывать теплоизолятор. Имеет три преимущества над кабелем для укладки в стяжку: 1) более быстрый прогрев пола (незначительно экономичнее); 2) более простой монтаж; 3) имеет более высокую температуру плавления внутренней изоляции.', N'Нагревательный мат DI SI H 150 Вт/м кв. для укладки в плиточный клей ', 1, 1, N'Германия', 11)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (10, N'Fenix Ultra CM 150 Вт/м кв', 1, 2, N'Ультратонкий нагревательный мат для укладки в плиточный клей для плитки или самовыравнивающую смесь. За счет толщины кабеля 2.7 мм необходимо в 1.5 раза меньше плиточного клея, чем при укладке стандартного мата. Монтируется на готовую стяжку, утапливается в клеевой раствор для плитки. Рекомендется, чтобы плиточный клей имел минимальное количество воздушных пустот.', N'Ультратонкий нагревательный мат двужильный Fenix Ultra CM 150 Вт/м кв. для укладки под плитку', 1, 1, N'Чехия', 11)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (11, N'Fenix LDTS M 160 Вт/м кв', 1, 2, N'Нагревательный мат для укладки под плитку. Монтируется на готовую стяжку, утапливается в клеевой раствор для плитки или самовырвнивающую смесь. Рекомендется, чтобы плиточный клей имел минимальное количество воздушных пустот.', N'Нагревательный мат Fenix LDTS M 160 Вт/м кв. для укладки под плитку (метрическая линейка, импортируем эксклюзивно)', 1, 1, N'Чехия', 11)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (12, N'Fenix LDTS 160 Вт/м кв', 1, 2, N'Нагревательный мат для укладки под плитку. Монтируется на готовую стяжку, утапливается в клеевой раствор для плитки или самовырвнивающую смесь. Рекомендется, чтобы плиточный клей имел минимальное количество воздушных пустот.', N'Нагревательный мат Fenix LDTS M 160 Вт/м кв. для укладки под плитку ', 1, 1, N'Чехия', 11)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (13, N'Fenix ADSV 10 Вт/м', 1, 2, N'Тонкий кабель для укладки под плитку. Монтаж производится на готовую стяжку под напольное покрытие в клеевой раствор или самовыравнивающую смесь. За счет различного шага укладки этот кабель можно использовать как для полноценного отопления (до 250 Вт/м.кв.), так и для укладки под деревянные напольные покрытия (100 Вт/м.кв.). Кабель утапливается в клеевой раствор, не повышая высоту пола. Перед залитием стяжки рекомендуется укладывать теплоизолятор. Имеет два преимущества над кабелем для укладки в стяжку: 1) более быстрый прогрев пола (незначительно экономичнее); 2) более простой монтаж. ', N'Тонкий нагревательный кабель двужильный Fenix ADSV 10 Вт/м для укладки в плиточный клей (импортируем эксклюзивно)', 1, 1, N'Чехия', 11)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (14, N'Fenix ADSV 18 Вт/м', 1, 2, N'Кабель для теплого пола используются для укладки в стяжку 3-8 см. Перед укладкой кабеля необходимо укладывать теплоизолятор (рекомендуется экструдированный пенополистирол от 2 см, в крайнем случае подложку для ламината 5 мм). Кабель не рекомендуется укладывать напрямую на теплоизолятор. Теплоизолятор необходимо залить черновой стяжкой, в крайнем случае покласть сверху металлическую сетку (армированную или просечно-вытяжную). В случае укладки сетки необходимо оставить пространство между кабелем и теплоизолятором, чтобы при залитии жидким раствором для стяжки заполнить данное пространство смесью. Стяжка должна быть с минимальным количеством воздушных пустот.', N'Универсальный нагревательный кабель двужильный Fenix ADSV 18 Вт/м для укладки в стяжку ', 1, 1, N'Чехия', 12)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (15, N'Fenix ASL1P 18 Вт/м', 1, 2, N'Кабель для теплого пола используются для укладки в стяжку 3-8 см. Перед укладкой кабеля необходимо укладывать теплоизолятор (рекомендуется экструдированный пенополистирол от 2 см, в крайнем случае подложку для ламината 5 мм). Кабель не рекомендуется укладывать напрямую на теплоизолятор. Теплоизолятор необходимо залить черновой стяжкой, в крайнем случае покласть сверху металлическую сетку (армированную или просечно-вытяжную). В случае укладки сетки необходимо оставить пространство между кабелем и теплоизолятором, чтобы при залитии жидким раствором для стяжки заполнить данное пространство смесью. Стяжка должна быть с минимальным количеством воздушных пустот.', N'Универсальный нагревательный кабель одножильный Fenix ASL1P 18 Вт/м для укладки в стяжку (импортируем эксклюзивно)', 1, 1, N'Чехия', 12)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (16, N'Fenix', 1, 2, N'Алюминиевые маты используются для укладки под ламинат, паркетную доску, линолеум и ковролин. За счет фольгированного основания тепло равномерно распределяется вдоль поверхности. Мощность 140 Вт/м не позволяет осуществлять быстрый нагрев. При использовании с паркетной доской необходимо поставить максимальный предел температуры на термостате 24 С, а также не нагревать (охлаждать) паркетную доску более, чем на 2 С за 12 часов. ', N'Алюминиевые маты Fenix для укладки под ламинат и паркетную доску (монтаж на подложку, импортируем эксклюзивно)', 1, 1, N'Чехия', 13)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (17, N'Fenix ADPSV 30 Вт/м', 1, 2, N'Ультратонкий нагревательный мат для укладки в плиточный клей для плитки или самовыравнивающую смесь. За счет толщины кабеля 2.7 мм необходимо в 1.5 раза меньше плиточного клея, чем при укладке стандартного мата. Монтируется на готовую стяжку, утапливается в клеевой раствор для плитки. Рекомендется, чтобы плиточный клей имел минимальное количество воздушных пустот.', N'Нагревательный кабель двужильный ADPSV 30 Вт/м для наружного обогрева (обогрев кровли, водостоков, наружных площадей, импортируем эксклюзивно)', 1, 3, N'Чехия', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (18, N'Fenix ADPSV 30 Вт/м', 1, 2, N'Ультратонкий нагревательный мат для укладки в плиточный клей для плитки или самовыравнивающую смесь. За счет толщины кабеля 2.7 мм необходимо в 1.5 раза меньше плиточного клея, чем при укладке стандартного мата. Монтируется на готовую стяжку, утапливается в клеевой раствор для плитки. Рекомендется, чтобы плиточный клей имел минимальное количество воздушных пустот.', N'Нагревательный кабель двужильный ADPSV 30 Вт/м для наружного обогрева (обогрев кровли, водостоков, наружных площадей, импортируем эксклюзивно)', 1, 4, N'Чехия', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (19, N'IN-THERM 200 Вт/м кв', 1, 3, N'Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! ', N'Нагревательный мат двужильный IN-THERM 200 Вт/м кв. (импортируем эксклюзивно)', 1, 1, N'Чехия', 11)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (20, N'IN-THERM 20 Вт/м кв', 1, 3, N'Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! ', N'Универсальный нагревательный кабель двужильный IN-THERM 20 Вт/м кв. (импортируем эксклюзивно)', 1, 1, N'Чехия', 11)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (21, N'IN-THERM 20 Вт/м кв', 1, 3, N'Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! Необходимо добавить описание! ', N'Универсальный нагревательный кабель двужильный IN-THERM 20 Вт/м кв. (импортируем эксклюзивно)', 1, 1, N'Чехия', 12)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (22, N'IN-THERM ECO 160 Вт/м кв', 1, 3, N'Нагревательные маты IN-THERM ECO в сравнении снагревательными матами IN-THERM имеют более большую площадь на подобные единицы (+10%) и более низкую стоимость (-5%). Средняя экономия на 1 м кв. составляет около 15%.', N'Нагревательный мат двужильный IN-THERM ECO 160 Вт/м кв. для укладки под плитку в плиточный клей', 1, 1, N'Чехия', 11)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (23, N'IN-THERM AFMAT 150 Вт/м кв', 2, 3, N'Нагревательные маты IN-THERM ECO в сравнении снагревательными матами IN-THERM имеют более большую площадь на подобные единицы (+10%) и более низкую стоимость (-5%). Средняя экономия на 1 м кв. составляет около 15%.', N'Алюминиевые маты IN-THERM AFMAT 150 Вт/м кв', 1, 1, N'Китай', 13)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (24, N'IN-THERM AFMAT 140 Вт/м кв', 3, 3, N'Нагревательные маты IN-THERM ECO в сравнении снагревательными матами IN-THERM имеют более большую площадь на подобные единицы (+10%) и более низкую стоимость (-5%). Средняя экономия на 1 м кв. составляет около 15%.', N'Алюминиевые маты Fenix  для укладки под ламинат, паркетную доску', 1, 1, N'Чехия', 13)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (25, N'IN-THERM RTC 70', 1, 3, N'', N'IN-THERM RTC 70', 1, 2, N'Китай', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (26, N'IN-THERM E 51', 1, 3, N'', N'IN-THERM E 51', 1, 2, N'Китай', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (27, N'IN-THERM PWT 002', 1, 3, N'', N'IN-THERM RTC 72', 1, 2, N'Китай', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (28, N'IN-THERM E 91', 1, 3, N'', N'IN-THERM RTC 73', 1, 2, N'Китай', NULL)
GO
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id]) VALUES (29, N'WARM LIFE', 1, 5, N'', N'IN-THERM RTC 74', 1, 2, N'Китай', NULL)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([user_id], [username], [password]) VALUES (2, N'admin', N'$2y$12$eYL/BBLZYGl.o.TxnddocOdvbufMNotbrRZbTYrwLXcnNm2vE6OOi')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [productType_id]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_ImagesProducts] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_ImagesProducts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrdersCitiesServed] FOREIGN KEY([city_id])
REFERENCES [dbo].[CitiesServed] ([city_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_OrdersCitiesServed]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDeliveryMethods] FOREIGN KEY([delivery_id])
REFERENCES [dbo].[DeliveryMethods] ([delivery_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_OrdersDeliveryMethods]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrdersPaymentMethods] FOREIGN KEY([payment_id])
REFERENCES [dbo].[PaymentMethods] ([payment_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_OrdersPaymentMethods]
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetailsOrders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdersDetails] CHECK CONSTRAINT [FK_OrdersDetailsOrders]
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetailsProducts] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdersDetails] CHECK CONSTRAINT [FK_OrdersDetailsProducts]
GO
ALTER TABLE [dbo].[ProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributesProducts] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductAttributes] CHECK CONSTRAINT [FK_ProductAttributesProducts]
GO
ALTER TABLE [dbo].[ProductOptions]  WITH CHECK ADD  CONSTRAINT [FK_ProductOptionsProducts] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductOptions] CHECK CONSTRAINT [FK_ProductOptionsProducts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_ProductsManufacturers] FOREIGN KEY([manufacturer_id])
REFERENCES [dbo].[Manufacturers] ([manufacturer_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_ProductsManufacturers]
GO
USE [master]
GO
ALTER DATABASE [WMDATABSE] SET  READ_WRITE 
GO
