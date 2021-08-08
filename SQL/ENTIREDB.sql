USE [master]
GO
/****** Object:  Database [WMDATABSE]    Script Date: 08.08.2021 18:25:55 ******/
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
/****** Object:  User [frr4mke_SQLLogin_1]    Script Date: 08.08.2021 18:25:58 ******/
CREATE USER [frr4mke_SQLLogin_1] FOR LOGIN [frr4mke_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [frr4mke_SQLLogin_1]
GO
/****** Object:  Schema [frr4mke_SQLLogin_1]    Script Date: 08.08.2021 18:25:58 ******/
CREATE SCHEMA [frr4mke_SQLLogin_1]
GO
/****** Object:  Table [dbo].[AuthOption]    Script Date: 08.08.2021 18:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthOption](
	[issuer] [varchar](max) NOT NULL,
	[audience] [varchar](max) NOT NULL,
	[secret] [varchar](max) NOT NULL,
	[tokenLifetime] [int] NOT NULL,
	[authOption_id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CitiesServed]    Script Date: 08.08.2021 18:25:58 ******/
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
/****** Object:  Table [dbo].[DeliveryMethods]    Script Date: 08.08.2021 18:25:58 ******/
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
/****** Object:  Table [dbo].[employee]    Script Date: 08.08.2021 18:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [numeric](19, 0) IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NULL,
	[employee_code] [varchar](255) NOT NULL,
	[image_url] [varchar](255) NULL,
	[job_title] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 08.08.2021 18:25:58 ******/
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
/****** Object:  Table [dbo].[GiftGoods]    Script Date: 08.08.2021 18:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiftGoods](
	[giftGoods_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[giftproduct_id] [int] NOT NULL,
 CONSTRAINT [PK_GiftGoods] PRIMARY KEY CLUSTERED 
(
	[giftGoods_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 08.08.2021 18:25:58 ******/
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
/****** Object:  Table [dbo].[Manufacturers]    Script Date: 08.08.2021 18:25:58 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 08.08.2021 18:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(999,1) NOT NULL,
	[fio] [varchar](max) NOT NULL,
	[phoneNumber] [varchar](max) NOT NULL,
	[payment_id] [int] NOT NULL,
	[city_id] [int] NOT NULL,
	[deliveryAddress] [varchar](max) NOT NULL,
	[delivery_id] [int] NOT NULL,
	[orderdatetime] [datetime] NOT NULL,
	[device] [varchar](20) NOT NULL,
	[orderstate_id] [int] NOT NULL,
	[paymenttype_id] [int] NOT NULL,
	[comment] [varchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 08.08.2021 18:25:58 ******/
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
/****** Object:  Table [dbo].[OrderStates]    Script Date: 08.08.2021 18:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStates](
	[orderstate_id] [int] IDENTITY(1,1) NOT NULL,
	[orderstate_title] [varchar](30) NOT NULL,
 CONSTRAINT [PK_OrderStates] PRIMARY KEY CLUSTERED 
(
	[orderstate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethods]    Script Date: 08.08.2021 18:25:58 ******/
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
/****** Object:  Table [dbo].[PaymentType]    Script Date: 08.08.2021 18:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[paymenttype_id] [int] IDENTITY(1,1) NOT NULL,
	[paymenttype_title] [varchar](30) NOT NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[paymenttype_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PercentageDiscount]    Script Date: 08.08.2021 18:25:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PercentageDiscount](
	[percentageDiscount_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[percentage] [int] NOT NULL,
 CONSTRAINT [PK_PercentageDiscount] PRIMARY KEY CLUSTERED 
(
	[percentageDiscount_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAttributes]    Script Date: 08.08.2021 18:25:58 ******/
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
	[sort] [int] NOT NULL,
 CONSTRAINT [PK_ProductAttributes] PRIMARY KEY CLUSTERED 
(
	[productAttributes_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductOptions]    Script Date: 08.08.2021 18:25:58 ******/
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
	[size] [varchar](max) NULL,
 CONSTRAINT [PK_ProductOptions] PRIMARY KEY CLUSTERED 
(
	[productOptions_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 08.08.2021 18:25:58 ******/
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
	[product_price] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 08.08.2021 18:25:58 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 08.08.2021 18:25:58 ******/
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
SET IDENTITY_INSERT [dbo].[AuthOption] ON 

INSERT [dbo].[AuthOption] ([issuer], [audience], [secret], [tokenLifetime], [authOption_id]) VALUES (N'authServer', N'resourceServer', N'secretKey1234567789', 10800, 1)
SET IDENTITY_INSERT [dbo].[AuthOption] OFF
GO
SET IDENTITY_INSERT [dbo].[CitiesServed] ON 

INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (6, N'Архангельск')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (7, N'Астрахань')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (8, N'Брянск')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (9, N'Владимир')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (10, N'Волгоград')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (11, N'Вологда')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (12, N'Воронеж')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (13, N'Иваново')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (14, N'Ижевск')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (15, N'Йошкар-Ола')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (16, N'Казань')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (17, N'Калининград')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (18, N'Калуга')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (19, N'Киров')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (20, N'Кострома')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (21, N'Курск')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (22, N'Липецк')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (23, N'Москва')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (24, N'Мурманск')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (25, N'Нарьян-Мар')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (26, N'Нижний Новгород')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (27, N'Новгород Великий')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (28, N'Орёл')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (29, N'Оренбург')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (30, N'Пенза')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (31, N'Пермь')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (32, N'Петрозаводск')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (33, N'Псков')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (34, N'Ростов-на-Дону')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (35, N'Рязань')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (36, N'Самара')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (37, N'Санкт-Петербург')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (38, N'Саранск')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (39, N'Саратов')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (40, N'Севастополь')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (41, N'Симферополь')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (42, N'Смоленск')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (43, N'Сыктывкар')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (44, N'Тамбов')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (45, N'Тверь')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (46, N'Тула')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (47, N'Ульяновск')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (48, N'Уфа')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (49, N'Чебоксары')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (50, N'Элиста')
INSERT [dbo].[CitiesServed] ([city_id], [city_title]) VALUES (51, N'Ярославль')
SET IDENTITY_INSERT [dbo].[CitiesServed] OFF
GO
SET IDENTITY_INSERT [dbo].[DeliveryMethods] ON 

INSERT [dbo].[DeliveryMethods] ([delivery_id], [delivery_title]) VALUES (1, N'Самовывоз')
INSERT [dbo].[DeliveryMethods] ([delivery_id], [delivery_title]) VALUES (2, N'Курьером')
SET IDENTITY_INSERT [dbo].[DeliveryMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[ErrorLog] ON 

INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (1, CAST(N'2021-05-04T03:07:17.433' AS DateTime), N'   at System.Net.Mail.MailAddress..ctor(String address, String displayName, Encoding displayNameEncoding)
   at System.Net.Mail.MailAddress..ctor(String address, String displayName)
   at Mail.NetMail.SendFromTo(String senderName, String fromAdress, String toAdress, String subject, String text, String credentials) in D:\Projects\WM2\WMServer\Mail\NetMail.cs:line 13
   at Mail.MailHandler.SendToYourSelf(String subject, String text) in D:\Projects\WM2\WMServer\Mail\MailHandler.cs:line 25', N'Value cannot be null. (Parameter ''address'')', N'?????? ??????????? ??????, ??? ??????????? ??????', N'System.Net.Mail')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (2, CAST(N'2021-05-04T05:11:30.087' AS DateTime), N'   at System.Net.Mail.MailAddress..ctor(String address, String displayName, Encoding displayNameEncoding)
   at System.Net.Mail.MailAddress..ctor(String address, String displayName)
   at Mail.NetMail.SendFromTo(String senderName, String fromAdress, String toAdress, String subject, String text, String credentials) in D:\Projects\WM2\WMServer\Mail\NetMail.cs:line 13
   at Mail.MailHandler.SendToYourSelf(String subject, String text) in D:\Projects\WM2\WMServer\Mail\MailHandler.cs:line 25', N'Value cannot be null. (Parameter ''address'')', N'?????? ??????????? ??????, ??? ??????????? ??????', N'System.Net.Mail')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (3, CAST(N'2021-07-28T18:19:53.613' AS DateTime), N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1055
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1083
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 725
   at WMBLogic.Services.ProductsService.GetDTOProducts() in D:\Projects\WM2\WMServer\WMBLogic\Services\ProductsService.cs:line 48
   at WMServer.Controllers.ProductsController.Get() in D:\Projects\WM2\WMServer\WMServer\Controllers\ProductsController.cs:line 38', N'Invalid column name ''product_id????????''.', N'?????? ????????? ?????? ?????????', N'Core .Net SqlClient Data Provider')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (4, CAST(N'2021-07-28T19:50:57.757' AS DateTime), N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction) in System.Data.SqlClient.dll:token 0x6000b30+0x4e
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction) in System.Data.SqlClient.dll:token 0x6000d86+0x13
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose) in System.Data.SqlClient.dll:token 0x6001016+0x157
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady) in System.Data.SqlClient.dll:token 0x6001025+0x876
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData() in System.Data.SqlClient.dll:token 0x6000c57+0x40
   at System.Data.SqlClient.SqlDataReader.get_MetaData() in System.Data.SqlClient.dll:token 0x6000c44+0x31
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString) in System.Data.SqlClient.dll:token 0x6000a88+0x92
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds) in System.Data.SqlClient.dll:token 0x6000a84+0x33c
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method) in System.Data.SqlClient.dll:token 0x6000a83+0x79
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method) in System.Data.SqlClient.dll:token 0x6000a82+0xb
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior) in System.Data.SqlClient.dll:token 0x6000a68+0x2a
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior) in System.Data.SqlClient.dll:token 0x6000a66+0x0
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior) in System.Data.Common.dll:token 0x60015cf+0x0
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1055
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1083
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection) in System.Private.CoreLib.dll:token 0x6006848+0x71
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source) in System.Linq.dll:token 0x600011b+0x14
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 725
   at WMBLogic.Services.ProductsService.GetDTOProducts() in D:\Projects\WM2\WMServer\WMBLogic\Services\ProductsService.cs:line 48
   at WMServer.Controllers.ProductsController.Get() in D:\Projects\WM2\WMServer\WMServer\Controllers\ProductsController.cs:line 40', N'Invalid column name ''product_idasd''.', N'Core .Net SqlClient Data Provider', N'Ошибка получения списка продуктов')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (5, CAST(N'2021-07-29T13:45:48.420' AS DateTime), N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction) in System.Data.SqlClient.dll:token 0x6000b30+0x4e
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction) in System.Data.SqlClient.dll:token 0x6000d86+0x13
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose) in System.Data.SqlClient.dll:token 0x6001016+0x157
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady) in System.Data.SqlClient.dll:token 0x6001025+0x876
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData() in System.Data.SqlClient.dll:token 0x6000c57+0x40
   at System.Data.SqlClient.SqlDataReader.get_MetaData() in System.Data.SqlClient.dll:token 0x6000c44+0x31
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString) in System.Data.SqlClient.dll:token 0x6000a88+0x92
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds) in System.Data.SqlClient.dll:token 0x6000a84+0x33c
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method) in System.Data.SqlClient.dll:token 0x6000a83+0x79
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method) in System.Data.SqlClient.dll:token 0x6000a82+0xb
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior) in System.Data.SqlClient.dll:token 0x6000a68+0x2a
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior) in System.Data.SqlClient.dll:token 0x6000a66+0x0
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior) in System.Data.Common.dll:token 0x60015cf+0x0
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1055
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1083
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection) in System.Private.CoreLib.dll:token 0x6006848+0x71
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source) in System.Linq.dll:token 0x600011b+0x14
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 725
   at WMBLogic.Services.ProductsService.GetDTOProducts() in D:\Projects\WM2\WMServer\WMBLogic\Services\ProductsService.cs:line 48
   at WMServer.Controllers.ProductsController.Get() in D:\Projects\WM2\WMServer\WMServer\Controllers\ProductsController.cs:line 38', N'Invalid column name ''product_idasd''.', N'Core .Net SqlClient Data Provider', N'Ошибка получения списка продуктов')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (6, CAST(N'2021-07-29T13:46:40.517' AS DateTime), N'   at WMBLogic.Repository.EF.Repository[T]() in D:\Projects\WM2\WMServer\WMBLogic\Repository\EFRepository.cs:line 18
   at WMBLogic.Services.RepositoryService.CreateEntity[T](T entity) in D:\Projects\WM2\WMServer\WMBLogic\Services\RepositoryService.cs:line 16
   at WMServer.Controllers.PromotionsController.AddPromotion(PercentageDiscount promotions) in D:\Projects\WM2\WMServer\WMServer\Controllers\PromotionsController.cs:line 129', N'The method or operation is not implemented.', N'WMBLogic', N'Ошибка добавления акции')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (7, CAST(N'2021-07-29T13:46:52.260' AS DateTime), N'   at WMBLogic.Repository.EF.Repository[T]() in D:\Projects\WM2\WMServer\WMBLogic\Repository\EFRepository.cs:line 18
   at WMBLogic.Services.RepositoryService.CreateEntity[T](T entity) in D:\Projects\WM2\WMServer\WMBLogic\Services\RepositoryService.cs:line 16
   at WMServer.Controllers.PromotionsController.AddPromotion(PercentageDiscount promotions) in D:\Projects\WM2\WMServer\WMServer\Controllers\PromotionsController.cs:line 129', N'The method or operation is not implemented.', N'WMBLogic', N'Ошибка добавления акции')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (8, CAST(N'2021-07-29T13:49:22.453' AS DateTime), N'   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.GetOrCreateEntry(Object entity) in Microsoft.EntityFrameworkCore.dll:token 0x600249d+0x6c
   at Microsoft.EntityFrameworkCore.DbContext.EntryWithoutDetectChanges[TEntity](TEntity entity) in Microsoft.EntityFrameworkCore.dll:token 0x60000a4+0xb
   at Microsoft.EntityFrameworkCore.DbContext.SetEntityState[TEntity](TEntity entity, EntityState entityState) in Microsoft.EntityFrameworkCore.dll:token 0x60000ae+0x0
   at Microsoft.EntityFrameworkCore.DbContext.Add[TEntity](TEntity entity) in Microsoft.EntityFrameworkCore.dll:token 0x60000a9+0x12
   at WMBLogic.Repository.EFRepository`1.CreateEntity(T entity) in D:\Projects\WM2\WMServer\WMBLogic\Repository\EFRepository.cs:line 35
   at WMBLogic.Services.RepositoryService.CreateEntity[T](T entity) in D:\Projects\WM2\WMServer\WMBLogic\Services\RepositoryService.cs:line 19
   at WMServer.Controllers.PromotionsController.AddPromotion(PercentageDiscount promotions) in D:\Projects\WM2\WMServer\WMServer\Controllers\PromotionsController.cs:line 129', N'The entity type ''PercentageDiscount'' was not found. Ensure that the entity type has been added to the model.', N'Microsoft.EntityFrameworkCore', N'Ошибка добавления акции')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (9, CAST(N'2021-07-29T13:49:22.453' AS DateTime), N'   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.GetOrCreateEntry(Object entity) in Microsoft.EntityFrameworkCore.dll:token 0x600249d+0x6c
   at Microsoft.EntityFrameworkCore.DbContext.EntryWithoutDetectChanges[TEntity](TEntity entity) in Microsoft.EntityFrameworkCore.dll:token 0x60000a4+0xb
   at Microsoft.EntityFrameworkCore.DbContext.SetEntityState[TEntity](TEntity entity, EntityState entityState) in Microsoft.EntityFrameworkCore.dll:token 0x60000ae+0x0
   at Microsoft.EntityFrameworkCore.DbContext.Add[TEntity](TEntity entity) in Microsoft.EntityFrameworkCore.dll:token 0x60000a9+0x12
   at WMBLogic.Repository.EFRepository`1.CreateEntity(T entity) in D:\Projects\WM2\WMServer\WMBLogic\Repository\EFRepository.cs:line 35
   at WMBLogic.Services.RepositoryService.CreateEntity[T](T entity) in D:\Projects\WM2\WMServer\WMBLogic\Services\RepositoryService.cs:line 19
   at WMServer.Controllers.PromotionsController.AddPromotion(PercentageDiscount promotions) in D:\Projects\WM2\WMServer\WMServer\Controllers\PromotionsController.cs:line 129', N'The entity type ''PercentageDiscount'' was not found. Ensure that the entity type has been added to the model.', N'Microsoft.EntityFrameworkCore', N'Ошибка добавления акции')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (10, CAST(N'2021-07-29T13:49:48.893' AS DateTime), N'   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.GetOrCreateEntry(Object entity) in Microsoft.EntityFrameworkCore.dll:token 0x600249d+0x6c
   at Microsoft.EntityFrameworkCore.DbContext.EntryWithoutDetectChanges[TEntity](TEntity entity) in Microsoft.EntityFrameworkCore.dll:token 0x60000a4+0xb
   at Microsoft.EntityFrameworkCore.DbContext.SetEntityState[TEntity](TEntity entity, EntityState entityState) in Microsoft.EntityFrameworkCore.dll:token 0x60000ae+0x0
   at Microsoft.EntityFrameworkCore.DbContext.Add[TEntity](TEntity entity) in Microsoft.EntityFrameworkCore.dll:token 0x60000a9+0x12
   at WMBLogic.Repository.EFRepository`1.CreateEntity(T entity) in D:\Projects\WM2\WMServer\WMBLogic\Repository\EFRepository.cs:line 35
   at WMBLogic.Services.RepositoryService.CreateEntity[T](T entity) in D:\Projects\WM2\WMServer\WMBLogic\Services\RepositoryService.cs:line 19
   at WMServer.Controllers.PromotionsController.AddPromotion(PercentageDiscount promotions) in D:\Projects\WM2\WMServer\WMServer\Controllers\PromotionsController.cs:line 129', N'The entity type ''PercentageDiscount'' was not found. Ensure that the entity type has been added to the model.', N'Microsoft.EntityFrameworkCore', N'Ошибка добавления акции')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (11, CAST(N'2021-07-29T13:49:48.900' AS DateTime), N'   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.GetOrCreateEntry(Object entity) in Microsoft.EntityFrameworkCore.dll:token 0x600249d+0x6c
   at Microsoft.EntityFrameworkCore.DbContext.EntryWithoutDetectChanges[TEntity](TEntity entity) in Microsoft.EntityFrameworkCore.dll:token 0x60000a4+0xb
   at Microsoft.EntityFrameworkCore.DbContext.SetEntityState[TEntity](TEntity entity, EntityState entityState) in Microsoft.EntityFrameworkCore.dll:token 0x60000ae+0x0
   at Microsoft.EntityFrameworkCore.DbContext.Add[TEntity](TEntity entity) in Microsoft.EntityFrameworkCore.dll:token 0x60000a9+0x12
   at WMBLogic.Repository.EFRepository`1.CreateEntity(T entity) in D:\Projects\WM2\WMServer\WMBLogic\Repository\EFRepository.cs:line 35
   at WMBLogic.Services.RepositoryService.CreateEntity[T](T entity) in D:\Projects\WM2\WMServer\WMBLogic\Services\RepositoryService.cs:line 19
   at WMServer.Controllers.PromotionsController.AddPromotion(PercentageDiscount promotions) in D:\Projects\WM2\WMServer\WMServer\Controllers\PromotionsController.cs:line 129', N'The entity type ''PercentageDiscount'' was not found. Ensure that the entity type has been added to the model.', N'Microsoft.EntityFrameworkCore', N'Ошибка добавления акции')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (12, CAST(N'2021-08-01T17:59:45.160' AS DateTime), N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1055
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1083
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 725
   at WMBLogic.Services.ProductsService.GetDTOProducts() in D:\Projects\WM2\WMServer\WMBLogic\Services\ProductsService.cs:line 48
   at WMServer.Controllers.ProductsController.Get() in D:\Projects\WM2\WMServer\WMServer\Controllers\ProductsController.cs:line 38', N'Invalid column name ''product_idasda''.', N'Core .Net SqlClient Data Provider', N'Ошибка получения списка продуктов')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (13, CAST(N'2021-08-01T18:01:01.350' AS DateTime), N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1055
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1083
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 725
   at WMBLogic.Services.ProductsService.GetDTOProducts() in D:\Projects\WM2\WMServer\WMBLogic\Services\ProductsService.cs:line 48
   at WMServer.Controllers.ProductsController.Get() in D:\Projects\WM2\WMServer\WMServer\Controllers\ProductsController.cs:line 38', N'Invalid column name ''product_idasda''.', N'Core .Net SqlClient Data Provider', N'Ошибка получения списка продуктов')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (14, CAST(N'2021-08-01T18:01:15.090' AS DateTime), N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1055
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1083
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 725
   at WMBLogic.Services.ProductsService.GetDTOProducts() in D:\Projects\WM2\WMServer\WMBLogic\Services\ProductsService.cs:line 48
   at WMServer.Controllers.ProductsController.Get() in D:\Projects\WM2\WMServer\WMServer\Controllers\ProductsController.cs:line 38', N'Invalid column name ''product_idasda''.', N'Core .Net SqlClient Data Provider', N'Ошибка получения списка продуктов')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (15, CAST(N'2021-08-01T18:01:36.653' AS DateTime), N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1055
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1083
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 725
   at WMBLogic.Services.ProductsService.GetDTOProducts() in D:\Projects\WM2\WMServer\WMBLogic\Services\ProductsService.cs:line 48
   at WMServer.Controllers.ProductsController.Get() in D:\Projects\WM2\WMServer\WMServer\Controllers\ProductsController.cs:line 38', N'Invalid column name ''product_idasda''.', N'Core .Net SqlClient Data Provider', N'Ошибка получения списка продуктов')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (16, CAST(N'2021-08-01T18:01:44.860' AS DateTime), N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1055
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1083
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 725
   at WMBLogic.Services.ProductsService.GetDTOProducts() in D:\Projects\WM2\WMServer\WMBLogic\Services\ProductsService.cs:line 48
   at WMServer.Controllers.ProductsController.Get() in D:\Projects\WM2\WMServer\WMServer\Controllers\ProductsController.cs:line 38', N'Invalid column name ''product_idasda''.', N'Core .Net SqlClient Data Provider', N'Ошибка получения списка продуктов')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (17, CAST(N'2021-08-01T18:02:08.917' AS DateTime), N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1055
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1083
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 725
   at WMBLogic.Services.ProductsService.GetDTOProducts() in D:\Projects\WM2\WMServer\WMBLogic\Services\ProductsService.cs:line 48
   at WMServer.Controllers.ProductsController.Get() in D:\Projects\WM2\WMServer\WMServer\Controllers\ProductsController.cs:line 38', N'Invalid column name ''product_idasda''.', N'Core .Net SqlClient Data Provider', N'Ошибка получения списка продуктов')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (18, CAST(N'2021-08-01T18:02:26.880' AS DateTime), N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1055
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1083
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 725
   at WMBLogic.Services.ProductsService.GetDTOProducts() in D:\Projects\WM2\WMServer\WMBLogic\Services\ProductsService.cs:line 48
   at WMServer.Controllers.ProductsController.Get() in D:\Projects\WM2\WMServer\WMServer\Controllers\ProductsController.cs:line 38', N'Invalid column name ''product_idasda''.', N'Core .Net SqlClient Data Provider', N'Ошибка получения списка продуктов')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (19, CAST(N'2021-08-01T18:04:53.047' AS DateTime), N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1055
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1083
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 725
   at WMBLogic.Services.ProductsService.GetDTOProducts() in D:\Projects\WM2\WMServer\WMBLogic\Services\ProductsService.cs:line 48
   at WMServer.Controllers.ProductsController.Get() in D:\Projects\WM2\WMServer\WMServer\Controllers\ProductsController.cs:line 38', N'Invalid column name ''product_idasda''.', N'Core .Net SqlClient Data Provider', N'Ошибка получения списка продуктов')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (20, CAST(N'2021-08-01T18:11:40.033' AS DateTime), N'   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite, String method)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.System.Data.IDbCommand.ExecuteReader(CommandBehavior behavior)
   at Dapper.SqlMapper.ExecuteReaderWithFlagsFallback(IDbCommand cmd, Boolean wasClosed, CommandBehavior behavior) in /_/Dapper/SqlMapper.cs:line 1055
   at Dapper.SqlMapper.QueryImpl[T](IDbConnection cnn, CommandDefinition command, Type effectiveType)+MoveNext() in /_/Dapper/SqlMapper.cs:line 1083
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at Dapper.SqlMapper.Query[T](IDbConnection cnn, String sql, Object param, IDbTransaction transaction, Boolean buffered, Nullable`1 commandTimeout, Nullable`1 commandType) in /_/Dapper/SqlMapper.cs:line 725
   at WMBLogic.Services.ProductsService.GetDTOProducts() in D:\Projects\WM2\WMServer\WMBLogic\Services\ProductsService.cs:line 48
   at WMServer.Controllers.ProductsController.Get() in D:\Projects\WM2\WMServer\WMServer\Controllers\ProductsController.cs:line 38', N'Invalid column name ''product_idasda''.', N'Core .Net SqlClient Data Provider', N'Ошибка получения списка продуктов')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (21, CAST(N'2021-08-01T08:16:25.097' AS DateTime), N'   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.GetOrCreateEntry(Object entity)
   at Microsoft.EntityFrameworkCore.DbContext.EntryWithoutDetectChanges[TEntity](TEntity entity)
   at Microsoft.EntityFrameworkCore.DbContext.SetEntityState[TEntity](TEntity entity, EntityState entityState)
   at Microsoft.EntityFrameworkCore.DbContext.Add[TEntity](TEntity entity)
   at WMBLogic.Repository.EFRepository`1.CreateEntity(T entity) in D:\Projects\WM2\WMServer\WMBLogic\Repository\EFRepository.cs:line 35
   at WMBLogic.Services.OrderService.SaveOrder(DTOOrderEdit formOrder, String url) in D:\Projects\WM2\WMServer\WMBLogic\Services\OrderService.cs:line 85
   at WMServer.Controllers.OrdersController.Post(DTOOrderEdit formOrder) in D:\Projects\WM2\WMServer\WMServer\Controllers\OrderController.cs:line 36', N'The entity type ''Orders'' was not found. Ensure that the entity type has been added to the model.', N'Microsoft.EntityFrameworkCore', N'Ошибка сохранения заказа')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (22, CAST(N'2021-08-01T08:16:33.860' AS DateTime), N'   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.GetOrCreateEntry(Object entity)
   at Microsoft.EntityFrameworkCore.DbContext.EntryWithoutDetectChanges[TEntity](TEntity entity)
   at Microsoft.EntityFrameworkCore.DbContext.SetEntityState[TEntity](TEntity entity, EntityState entityState)
   at Microsoft.EntityFrameworkCore.DbContext.Add[TEntity](TEntity entity)
   at WMBLogic.Repository.EFRepository`1.CreateEntity(T entity) in D:\Projects\WM2\WMServer\WMBLogic\Repository\EFRepository.cs:line 35
   at WMBLogic.Services.OrderService.SaveOrder(DTOOrderEdit formOrder, String url) in D:\Projects\WM2\WMServer\WMBLogic\Services\OrderService.cs:line 85
   at WMServer.Controllers.OrdersController.Post(DTOOrderEdit formOrder) in D:\Projects\WM2\WMServer\WMServer\Controllers\OrderController.cs:line 36', N'The entity type ''Orders'' was not found. Ensure that the entity type has been added to the model.', N'Microsoft.EntityFrameworkCore', N'Ошибка сохранения заказа')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (23, CAST(N'2021-08-01T18:17:04.163' AS DateTime), N'   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.GetOrCreateEntry(Object entity)
   at Microsoft.EntityFrameworkCore.DbContext.EntryWithoutDetectChanges[TEntity](TEntity entity)
   at Microsoft.EntityFrameworkCore.DbContext.SetEntityState[TEntity](TEntity entity, EntityState entityState)
   at Microsoft.EntityFrameworkCore.DbContext.Add[TEntity](TEntity entity)
   at WMBLogic.Repository.EFRepository`1.CreateEntity(T entity) in D:\Projects\WM2\WMServer\WMBLogic\Repository\EFRepository.cs:line 35
   at WMBLogic.Services.OrderService.SaveOrder(DTOOrderEdit formOrder, String url) in D:\Projects\WM2\WMServer\WMBLogic\Services\OrderService.cs:line 88
   at WMServer.Controllers.OrdersController.Post(DTOOrderEdit formOrder) in D:\Projects\WM2\WMServer\WMServer\Controllers\OrderController.cs:line 36', N'The entity type ''Orders'' was not found. Ensure that the entity type has been added to the model.', N'Microsoft.EntityFrameworkCore', N'Ошибка сохранения заказа')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (24, CAST(N'2021-08-01T18:18:19.667' AS DateTime), N'   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.GetOrCreateEntry(Object entity)
   at Microsoft.EntityFrameworkCore.DbContext.EntryWithoutDetectChanges[TEntity](TEntity entity)
   at Microsoft.EntityFrameworkCore.DbContext.SetEntityState[TEntity](TEntity entity, EntityState entityState)
   at Microsoft.EntityFrameworkCore.DbContext.Add[TEntity](TEntity entity)
   at WMBLogic.Repository.EFRepository`1.CreateEntity(T entity) in D:\Projects\WM2\WMServer\WMBLogic\Repository\EFRepository.cs:line 35
   at WMBLogic.Services.OrderService.SaveOrder(DTOOrderEdit formOrder, String url) in D:\Projects\WM2\WMServer\WMBLogic\Services\OrderService.cs:line 93
   at WMServer.Controllers.OrdersController.Post(DTOOrderEdit formOrder) in D:\Projects\WM2\WMServer\WMServer\Controllers\OrderController.cs:line 36', N'The entity type ''OrdersDetails'' was not found. Ensure that the entity type has been added to the model.', N'Microsoft.EntityFrameworkCore', N'Ошибка сохранения заказа')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (25, CAST(N'2021-08-01T18:18:44.123' AS DateTime), N'   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.GetOrCreateEntry(Object entity)
   at Microsoft.EntityFrameworkCore.DbContext.EntryWithoutDetectChanges[TEntity](TEntity entity)
   at Microsoft.EntityFrameworkCore.DbContext.SetEntityState[TEntity](TEntity entity, EntityState entityState)
   at Microsoft.EntityFrameworkCore.DbContext.Add[TEntity](TEntity entity)
   at WMBLogic.Repository.EFRepository`1.CreateEntity(T entity) in D:\Projects\WM2\WMServer\WMBLogic\Repository\EFRepository.cs:line 35
   at WMBLogic.Services.OrderService.SaveOrder(DTOOrderEdit formOrder, String url) in D:\Projects\WM2\WMServer\WMBLogic\Services\OrderService.cs:line 93
   at WMServer.Controllers.OrdersController.Post(DTOOrderEdit formOrder) in D:\Projects\WM2\WMServer\WMServer\Controllers\OrderController.cs:line 36', N'The entity type ''OrdersDetails'' was not found. Ensure that the entity type has been added to the model.', N'Microsoft.EntityFrameworkCore', N'Ошибка сохранения заказа')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (26, CAST(N'2021-08-01T08:24:15.560' AS DateTime), N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at System.Net.Mail.MailAddress..ctor(String address, String displayName)
   at Mail.NetMail.SendFromTo(String senderName, String fromAdress, String toAdress, String subject, String text, String credentials) in D:\Projects\WM2\WMServer\Mail\NetMail.cs:line 13
   at Mail.MailHandler.SendToYourSelf(String subject, String text) in D:\Projects\WM2\WMServer\Mail\MailHandler.cs:line 22
   at WMBLogic.Services.OrderService.SendEmailToAdmin(Int32 order_id, String url) in D:\Projects\WM2\WMServer\WMBLogic\Services\OrderService.cs:line 169
   at WMBLogic.Services.OrderService.SaveOrder(DTOOrderEdit formOrder, String url) in D:\Projects\WM2\WMServer\WMBLogic\Services\OrderService.cs:line 90
   at WMServer.Controllers.OrdersController.Post(DTOOrderEdit formOrder) in D:\Projects\WM2\WMServer\WMServer\Controllers\OrderController.cs:line 36', N'Value cannot be null. (Parameter ''address'')', N'System.Net.Mail', N'Ошибка сохранения заказа')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (27, CAST(N'2021-08-01T08:25:26.200' AS DateTime), N'   at System.Net.Mail.MailAddress.TryParse(String address, String displayName, Encoding displayNameEncoding, ValueTuple`4& parsedData, Boolean throwExceptionIfFail)
   at System.Net.Mail.MailAddress..ctor(String address, String displayName)
   at Mail.NetMail.SendFromTo(String senderName, String fromAdress, String toAdress, String subject, String text, String credentials) in D:\Projects\WM2\WMServer\Mail\NetMail.cs:line 13
   at Mail.MailHandler.SendToYourSelf(String subject, String text) in D:\Projects\WM2\WMServer\Mail\MailHandler.cs:line 22
   at WMBLogic.Services.OrderService.SendEmailToAdmin(Int32 order_id, String url) in D:\Projects\WM2\WMServer\WMBLogic\Services\OrderService.cs:line 169
   at WMBLogic.Services.OrderService.SaveOrder(DTOOrderEdit formOrder, String url) in D:\Projects\WM2\WMServer\WMBLogic\Services\OrderService.cs:line 90
   at WMServer.Controllers.OrdersController.Post(DTOOrderEdit formOrder) in D:\Projects\WM2\WMServer\WMServer\Controllers\OrderController.cs:line 36', N'Value cannot be null. (Parameter ''address'')', N'System.Net.Mail', N'Ошибка сохранения заказа')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (28, CAST(N'2021-08-02T07:19:23.597' AS DateTime), N'   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.GetOrCreateEntry(Object entity)
   at Microsoft.EntityFrameworkCore.DbContext.EntryWithoutDetectChanges[TEntity](TEntity entity)
   at Microsoft.EntityFrameworkCore.DbContext.SetEntityState[TEntity](TEntity entity, EntityState entityState)
   at Microsoft.EntityFrameworkCore.DbContext.Add[TEntity](TEntity entity)
   at WMBLogic.Repository.EFRepository`1.CreateEntity(T entity) in D:\Projects\WM2\WMServer\WMBLogic\Repository\EFRepository.cs:line 35
   at WMBLogic.Services.RepositoryService.CreateEntity[T](T entity) in D:\Projects\WM2\WMServer\WMBLogic\Services\RepositoryService.cs:line 17
   at WMServer.Controllers.PromotionsController.AddPromotion(PercentageDiscount promotions) in D:\Projects\WM2\WMServer\WMServer\Controllers\PromotionsController.cs:line 129', N'The entity type ''PercentageDiscount'' was not found. Ensure that the entity type has been added to the model.', N'Microsoft.EntityFrameworkCore', N'Ошибка добавления акции')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (29, CAST(N'2021-08-02T17:20:48.013' AS DateTime), N'   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.GetOrCreateEntry(Object entity)
   at Microsoft.EntityFrameworkCore.DbContext.EntryWithoutDetectChanges[TEntity](TEntity entity)
   at Microsoft.EntityFrameworkCore.DbContext.SetEntityState[TEntity](TEntity entity, EntityState entityState)
   at Microsoft.EntityFrameworkCore.DbContext.Add[TEntity](TEntity entity)
   at WMBLogic.Repository.EFRepository`1.CreateEntity(T entity) in D:\Projects\WM2\WMServer\WMBLogic\Repository\EFRepository.cs:line 35
   at WMBLogic.Services.RepositoryService.CreateEntity[T](T entity) in D:\Projects\WM2\WMServer\WMBLogic\Services\RepositoryService.cs:line 19
   at WMServer.Controllers.PromotionsController.AddPromotion(PercentageDiscount promotions) in D:\Projects\WM2\WMServer\WMServer\Controllers\PromotionsController.cs:line 129', N'The entity type ''PercentageDiscount'' was not found. Ensure that the entity type has been added to the model.', N'Microsoft.EntityFrameworkCore', N'Ошибка добавления акции')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (30, CAST(N'2021-08-02T07:51:21.900' AS DateTime), N'   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.GetOrCreateEntry(Object entity)
   at Microsoft.EntityFrameworkCore.DbContext.EntryWithoutDetectChanges[TEntity](TEntity entity)
   at Microsoft.EntityFrameworkCore.DbContext.SetEntityState[TEntity](TEntity entity, EntityState entityState)
   at Microsoft.EntityFrameworkCore.DbContext.Add[TEntity](TEntity entity)
   at WMBLogic.Repository.EFRepository`1.CreateEntity(T entity)
   at WMBLogic.Services.RepositoryService.CreateEntity[T](T entity)
   at WMServer.Controllers.PromotionsController.AddPromotion(PercentageDiscount promotions) in D:\Projects\WM2\WMServer\WMServer\Controllers\PromotionsController.cs:line 129', N'The entity type ''PercentageDiscount'' was not found. Ensure that the entity type has been added to the model.', N'Microsoft.EntityFrameworkCore', N'Ошибка добавления акции')
INSERT [dbo].[ErrorLog] ([error_id], [eventdatetime], [stacktrace], [message], [source], [errordescription]) VALUES (31, CAST(N'2021-08-02T07:51:31.107' AS DateTime), N'   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.GetOrCreateEntry(Object entity)
   at Microsoft.EntityFrameworkCore.DbContext.EntryWithoutDetectChanges[TEntity](TEntity entity)
   at Microsoft.EntityFrameworkCore.DbContext.SetEntityState[TEntity](TEntity entity, EntityState entityState)
   at Microsoft.EntityFrameworkCore.DbContext.Add[TEntity](TEntity entity)
   at WMBLogic.Repository.EFRepository`1.CreateEntity(T entity)
   at WMBLogic.Services.RepositoryService.CreateEntity[T](T entity)
   at WMServer.Controllers.PromotionsController.AddPromotion(PercentageDiscount promotions) in D:\Projects\WM2\WMServer\WMServer\Controllers\PromotionsController.cs:line 129', N'The entity type ''PercentageDiscount'' was not found. Ensure that the entity type has been added to the model.', N'Microsoft.EntityFrameworkCore', N'Ошибка добавления акции')
SET IDENTITY_INSERT [dbo].[ErrorLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (164, 10, N'../../../assets/images/FENIX/FenixUltraCM.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (165, 11, N'../../../assets/images/FENIX/FenixUltraLTDSM.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (166, 12, N'../../../assets/images/FENIX/FenixUltraLTDS.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (167, 13, N'../../../assets/images/FENIX/FenixAD.JPG', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (168, 14, N'../../../assets/images/FENIX/FenixAD.JPG', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (170, 16, N'../../../assets/images/FENIX/Fenix.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (171, 17, N'../../../assets/images/FENIX/FenixAD.JPG', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (172, 18, N'../../../assets/images/FENIX/FenixAD.JPG', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (173, 1, N'../../../assets/images/HEMSTEDT/HemDH.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (174, 2, N'../../../assets/images/HEMSTEDT/HemDR.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (175, 3, N'../../../assets/images/HEMSTEDT/HemBR-IM.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (176, 4, N'../../../assets/images/HEMSTEDT/HemBRF.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (177, 5, N'../../../assets/images/HEMSTEDT/HemBRF.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (178, 6, N'../../../assets/images/HEMSTEDT/HemDAS.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (179, 7, N'../../../assets/images/HEMSTEDT/HemDAS.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (180, 8, N'../../../assets/images/HEMSTEDT/HemFS.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (181, 9, N'../../../assets/images/HEMSTEDT/HemDI.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (188, 19, N'../../../assets/images/INTHERM/INTHERM200.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (189, 20, N'../../../assets/images/INTHERM/INTHERM20.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (191, 22, N'../../../assets/images/INTHERM/INTHERMECO.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (192, 23, N'../../../assets/images/INTHERM/INTHERMAFMAT.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (196, 25, N'../../../assets/images/TERMOSTATS/INTHERMRTC70.JPG', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (197, 26, N'../../../assets/images/TERMOSTATS/INTHERME51.JPG', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (198, 27, N'../../../assets/images/TERMOSTATS/INTHERMPWT002.png', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (199, 28, N'../../../assets/images/TERMOSTATS/INTHERME91.JPG', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (200, 29, N'../../../assets/images/TERMOSTATS/WARMLIFE.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (209, 30, N'../../../assets/images/CABLES/ELTRACE.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (210, 31, N'../../../assets/images/CABLES/INTHERMSRL.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (211, 32, N'../../../assets/images/CABLES/INTHERMSRL.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (212, 33, N'../../../assets/images/CABLES/INTHERMSRL.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (225, 34, N'../../../assets/images/TERMOSTATS/NeoClimaNCTR-55E.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (226, 35, N'../../../assets/images/TERMOSTATS/NeoClimaNCTR20CM.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (227, 36, N'../../../assets/images/TERMOSTATS/EberleRTRE6121.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (228, 37, N'../../../assets/images/TERMOSTATS/EberleRTRE3563.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (229, 38, N'../../../assets/images/TERMOSTATS/EberleDTRE3102.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (230, 39, N'../../../assets/images/TERMOSTATS/EberleITR3.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (231, 40, N'../../../assets/images/TERMOSTATS/EberleFRe52531.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (232, 41, N'../../../assets/images/TERMOSTATS/EberleFRe52522.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (233, 42, N'../../../assets/images/TERMOSTATS/EberleF2A50.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (234, 43, N'../../../assets/images/TERMOSTATS/EberleFIT3F.jpg', 1)
INSERT [dbo].[Images] ([image_id], [product_id], [image_title], [sort]) VALUES (235, 44, N'../../../assets/images/TERMOSTATS/EberleEM52489.jpg', 1)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturers] ON 

INSERT [dbo].[Manufacturers] ([manufacturer_id], [manufacturer_title]) VALUES (1, N'HEMSTEDT')
INSERT [dbo].[Manufacturers] ([manufacturer_id], [manufacturer_title]) VALUES (2, N'FENIX')
INSERT [dbo].[Manufacturers] ([manufacturer_id], [manufacturer_title]) VALUES (3, N'IN-THERM')
INSERT [dbo].[Manufacturers] ([manufacturer_id], [manufacturer_title]) VALUES (4, N'UNIFLOOR')
INSERT [dbo].[Manufacturers] ([manufacturer_id], [manufacturer_title]) VALUES (5, N'WARM LIFE')
INSERT [dbo].[Manufacturers] ([manufacturer_id], [manufacturer_title]) VALUES (6, N'ELTRACE')
INSERT [dbo].[Manufacturers] ([manufacturer_id], [manufacturer_title]) VALUES (7, N'NEOCLIMA')
INSERT [dbo].[Manufacturers] ([manufacturer_id], [manufacturer_title]) VALUES (8, N'EBERLE ')
SET IDENTITY_INSERT [dbo].[Manufacturers] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [fio], [phoneNumber], [payment_id], [city_id], [deliveryAddress], [delivery_id], [orderdatetime], [device], [orderstate_id], [paymenttype_id], [comment]) VALUES (999, N'????', N'79998071913', 2, 7, N'adsa', 2, CAST(N'2021-08-01T15:53:32.813' AS DateTime), N'desktop', 1, 2, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrdersDetails] ON 

INSERT [dbo].[OrdersDetails] ([orderDetails_id], [order_id], [product_id], [quantity], [price], [productOptions_id]) VALUES (1, 999, 1, 1, 4492, 2310)
SET IDENTITY_INSERT [dbo].[OrdersDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStates] ON 

INSERT [dbo].[OrderStates] ([orderstate_id], [orderstate_title]) VALUES (1, N'В обработке')
INSERT [dbo].[OrderStates] ([orderstate_id], [orderstate_title]) VALUES (2, N'Подтвержден')
INSERT [dbo].[OrderStates] ([orderstate_id], [orderstate_title]) VALUES (3, N'Оплачен')
INSERT [dbo].[OrderStates] ([orderstate_id], [orderstate_title]) VALUES (4, N'Доставлен')
SET IDENTITY_INSERT [dbo].[OrderStates] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentMethods] ON 

INSERT [dbo].[PaymentMethods] ([payment_id], [payment_title]) VALUES (1, N'При получении')
INSERT [dbo].[PaymentMethods] ([payment_id], [payment_title]) VALUES (2, N'Картой')
SET IDENTITY_INSERT [dbo].[PaymentMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([paymenttype_id], [paymenttype_title]) VALUES (1, N'Физическое')
INSERT [dbo].[PaymentType] ([paymenttype_id], [paymenttype_title]) VALUES (2, N'Юридическое')
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[PercentageDiscount] ON 

INSERT [dbo].[PercentageDiscount] ([percentageDiscount_id], [product_id], [percentage]) VALUES (14, 1, 50)
SET IDENTITY_INSERT [dbo].[PercentageDiscount] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductAttributes] ON 

INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (974, 10, N'Технические характеристики', N'Мощность удельная ', N'150 Вт/м кв.', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (975, 10, N'Технические характеристики', N'Мощность кабеля погонная ', N'около 10 Вт/м', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (976, 10, N'Технические характеристики', N'Шаг укладки кабеля на сетке ', N'0.065 м', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (977, 10, N'Технические характеристики', N'Питающий провод ', N'2.5 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (978, 10, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (979, 10, N'Технические характеристики', N'Наружная изоляция ', N'ПВДФ-фторопаст (темп. плавления 170 C)', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (980, 10, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (981, 10, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 2.7 мм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (982, 10, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (983, 10, N'Технические характеристики', N'Ширина мата', N' 0.5 м', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (984, 11, N'Технические характеристики', N'Мощность удельная ', N'160 Вт/м кв.', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (985, 11, N'Технические характеристики', N'Мощность кабеля погонная ', N'12 Вт/м', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (986, 11, N'Технические характеристики', N'Шаг укладки кабеля на сетке ', N'0.075 м', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (987, 11, N'Технические характеристики', N'Питающий провод ', N'3 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (988, 11, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (989, 11, N'Технические характеристики', N'Наружная изоляция ', N'ПВДФ-фторопаст (темп. плавления 105 C)', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (990, 11, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (991, 11, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 4 мм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (992, 11, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (993, 11, N'Технические характеристики', N'Ширина мата', N' 0.5 м', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (994, 11, N'Технические характеристики', N'Мощность удельная ', N'160 Вт/м кв.', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (995, 11, N'Технические характеристики', N'Мощность кабеля погонная ', N'до 7.6 м кв. - 12 Вт/м, после 8.8 м кв. - 18 Вт/м', 12)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (996, 11, N'Технические характеристики', N'Шаг укладки кабеля на сетке ', N'до 7.6 м кв. - 0.075 м, после 8.8 м кв. - 0.11 м', 13)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (997, 11, N'Технические характеристики', N'Питающий провод ', N'3 м', 14)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (998, 11, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое', 15)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (999, 11, N'Технические характеристики', N'Наружная изоляция ', N'ПВДФ-фторопаст (темп. плавления 105 C)', 16)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1000, 11, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)', 17)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1001, 11, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 3.5 мм', 18)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1002, 11, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя', 19)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1003, 11, N'Технические характеристики', N'Ширина мата', N' 0.5 м', 20)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1004, 13, N'Технические характеристики', N'Мощность кабеля погонная', N'около 10 Вт/м', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1005, 13, N'Технические характеристики', N'Питающий провод ', N'3 м', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1006, 13, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1007, 13, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 C)', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1008, 13, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1009, 13, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 4.2 мм', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1010, 13, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1011, 14, N'Технические характеристики', N'Мощность кабеля погонная', N'около 18 Вт/м', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1012, 14, N'Технические характеристики', N'Питающий провод ', N'3 м', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1013, 14, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1014, 14, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 C)', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1015, 14, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1016, 14, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 4.2 мм', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1017, 14, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1025, 16, N'Технические характеристики', N'Мощность кабеля удельная', N'140 Вт/м кв.', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1026, 16, N'Технические характеристики', N'Мощность кабеля погонная', N'около 9 Вт/м', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1027, 16, N'Технические характеристики', N'Шаг укладки кабеля на сетке', N'0.06 м', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1028, 16, N'Технические характеристики', N'Питающий провод ', N'2.5 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1029, 16, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1030, 16, N'Технические характеристики', N'Наружная изоляция ', N'фторопласт (темп. плавления 250 С)', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1031, 16, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1032, 16, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 1.7 мм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1033, 16, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1034, 17, N'Технические характеристики', N'Мощность кабеля погонная', N'30 Вт/м', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1035, 17, N'Технические характеристики', N'Питающий провод ', N'5 м', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1036, 17, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1037, 17, N'Технические характеристики', N'Наружная изоляция ', N'фторопласт (темп. плавления 250 С)', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1038, 17, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С) + полиэтилен (дополнительная изоляция)', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1039, 17, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'6 мм', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1040, 17, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1041, 18, N'Технические характеристики', N'Мощность кабеля погонная', N'30 Вт/м', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1042, 18, N'Технические характеристики', N'Питающий провод ', N'5 м', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1043, 18, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1044, 18, N'Технические характеристики', N'Наружная изоляция ', N'фторопласт (темп. плавления 250 С)', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1045, 18, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С) + полиэтилен (дополнительная изоляция)', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1046, 18, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'6 мм', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1047, 18, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1048, 1, N'Технические характеристики', N'Мощность удельная', N' 150 Вт/м кв', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1049, 1, N'Технические характеристики', N'Мощность кабеля погонная', N' 12.5 Вт/м', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1050, 1, N'Технические характеристики', N'Шаг укладки кабеля на мате', N' 0.08 м', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1051, 1, N'Технические характеристики', N'Питающий провод ', N'4 м', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1052, 1, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1053, 1, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1054, 1, N'Технические характеристики', N'Внутрення изоляция ', N'фторполимер (темп. плавления 250 С)', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1055, 1, N'Технические характеристики', N'Диаметр кабеля ', N'около 4.5 мм', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1056, 1, N'Технические характеристики', N'Ширина мата площадью более 1 м кв. ', N'0.46 м', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1057, 1, N'Технические характеристики', N'Ширина мата площалью менее 0.45 м кв. ', N'0.3 м', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1058, 1, N'Технические характеристики', N'Класс механической прочности ', N'М1', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1059, 1, N'Технические характеристики', N'Гарантия ', N'20 лет', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1060, 1, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие требования)', 12)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1061, 2, N'Технические характеристики', N'Мощность удельная', N'от 104 до 208 Вт/м кв', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1062, 2, N'Технические характеристики', N'Мощность кабеля погонная', N' 12.5 Вт/м', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1063, 2, N'Технические характеристики', N'Шаг укладки кабеля на мате', N'от 6 см до 12 см', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1064, 2, N'Технические характеристики', N'Питающий провод ', N'4 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1065, 2, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1066, 2, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1067, 2, N'Технические характеристики', N'Внутрення изоляция ', N'фторполимер (темп. плавления 250 С)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1068, 2, N'Технические характеристики', N'Диаметр кабеля ', N'около 4.5 мм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1069, 2, N'Технические характеристики', N'Ширина мата площадью более 1 м кв. ', N'0.46 м', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1070, 2, N'Технические характеристики', N'Ширина мата площалью менее 0.45 м кв. ', N'0.3 м', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1071, 2, N'Технические характеристики', N'Класс механической прочности ', N'М1', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1072, 2, N'Технические характеристики', N'Гарантия ', N'20 лет', 12)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1073, 2, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие требования)', 13)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1074, 3, N'Технические характеристики', N'Мощность кабеля погонная', N' 17 Вт/м', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1075, 3, N'Технические характеристики', N'Класс механической прочности ', N'М2', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1076, 3, N'Технические характеристики', N'Питающий провод двужильный кабель', N' 4 м', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1077, 3, N'Технические характеристики', N'Питающий провод ', N'одножильный кабель 2.5 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1078, 3, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1079, 3, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)', 6)
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1080, 3, N'Технические характеристики', N'Внутрення изоляция ', N'полиэтилен (темп. плавления 105 С)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1081, 3, N'Технические характеристики', N'Диаметр кабеля ', N'около 8 мм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1082, 3, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие в мире требования)', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1083, 3, N'Технические характеристики', N'Гарантия ', N'20 лет', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1084, 4, N'Технические характеристики', N'Мощность кабеля погонная', N' 27 Вт/м', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1085, 4, N'Технические характеристики', N'Класс механической прочности ', N'М2', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1086, 4, N'Технические характеристики', N'Питающий провод двужильный кабель', N' 7 м', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1087, 4, N'Технические характеристики', N'Питающий провод ', N'двухжильный кабель 2.5 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1088, 4, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1089, 4, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1090, 4, N'Технические характеристики', N'Внутрення изоляция ', N'полиэтилен (темп. плавления 105 С)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1091, 4, N'Технические характеристики', N'Диаметр кабеля ', N'около 8 мм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1092, 4, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие в мире требования)', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1093, 4, N'Технические характеристики', N'Гарантия ', N'10 лет', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1094, 5, N'Технические характеристики', N'Мощность кабеля погонная', N' 27 Вт/м', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1095, 5, N'Технические характеристики', N'Класс механической прочности ', N'М2', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1096, 5, N'Технические характеристики', N'Питающий провод двужильный кабель', N' 7 м', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1097, 5, N'Технические характеристики', N'Питающий провод ', N'одножильный кабель 2.5 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1098, 5, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1099, 5, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1100, 5, N'Технические характеристики', N'Внутрення изоляция ', N'полиэтилен (темп. плавления 105 С)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1101, 5, N'Технические характеристики', N'Диаметр кабеля ', N'около 8 мм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1102, 5, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие в мире требования)', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1103, 5, N'Технические характеристики', N'Гарантия ', N'10 лет', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1104, 6, N'Технические характеристики', N'Мощность кабеля погонная', N'30 Вт/м', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1105, 6, N'Технические характеристики', N'Класс механической прочности ', N'М2', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1106, 6, N'Технические характеристики', N'Питающий провод двужильный кабель', N'4 м', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1107, 6, N'Технические характеристики', N'Питающий провод ', N'одножильный кабель 2.5 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1108, 6, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1109, 6, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1110, 6, N'Технические характеристики', N'Внутрення изоляция ', N'полиэтилен (темп. плавления 105 С)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1111, 6, N'Технические характеристики', N'Диаметр кабеля ', N'около 8 мм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1112, 6, N'Технические характеристики', N'Гарантия ', N'10 лет', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1113, 6, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие в мире требования)', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1114, 7, N'Технические характеристики', N'Мощность кабеля погонная', N'30 Вт/м', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1115, 7, N'Технические характеристики', N'Класс механической прочности ', N'М2', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1116, 7, N'Технические характеристики', N'Питающий провод двужильный кабель', N'4 м', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1117, 7, N'Технические характеристики', N'Питающий провод ', N'одножильный кабель 2.5 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1118, 7, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1119, 7, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1120, 7, N'Технические характеристики', N'Внутрення изоляция ', N'полиэтилен (темп. плавления 105 С)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1121, 7, N'Технические характеристики', N'Диаметр кабеля ', N'около 8 мм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1122, 7, N'Технические характеристики', N'Гарантия ', N'10 лет', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1123, 7, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие в мире требования)', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1124, 8, N'Технические характеристики', N'Мощность кабеля погонная', N'10 Вт/м', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1125, 8, N'Технические характеристики', N'Класс механической прочности ', N'М2', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1126, 8, N'Технические характеристики', N'Питающий провод двужильный кабель', N'4 м', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1127, 8, N'Технические характеристики', N'Питающий провод ', N'одножильный кабель 2.5 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1128, 8, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'безмуфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1129, 8, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 с)', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1130, 8, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1131, 8, N'Технические характеристики', N'Диаметр кабеля ', N'около 8 мм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1132, 8, N'Технические характеристики', N'Гарантия ', N'10 лет', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1133, 8, N'Технические характеристики', N'Допуск к эксплуатации ', N'VDE (самые строгие в мире требования)', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1146, 19, N'Технические характеристики', N'Напряжение ', N'230 В', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1147, 19, N'Технические характеристики', N'Мощность удельная ', N'200 Вт/м кв.', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1148, 19, N'Технические характеристики', N'Шаг укладки кабеля ', N'10 см', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1149, 19, N'Технические характеристики', N'Питающий провод', N' 1.5 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1150, 19, N'Технические характеристики', N'Соединение нагревательного и питающего проводов', N' муфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1151, 19, N'Технические характеристики', N'Диаметр кабеля ', N'4 мм', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1152, 19, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 C)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1153, 19, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1154, 19, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 3.5 мм', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1155, 19, N'Технические характеристики', N'Гарантия ', N'20 лет', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1156, 19, N'Технические характеристики', N'Соответствие международному сертификату', N'IEC 60800', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1157, 20, N'Технические характеристики', N'Мощность удельная ', N'200 Вт/м кв.', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1158, 20, N'Технические характеристики', N'Мощность кабеля погонная', N'20 Вт/м', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1160, 20, N'Технические характеристики', N'Питающий провод', N' 1.5 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1161, 20, N'Технические характеристики', N'Соединение нагревательного и питающего проводов', N' муфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1162, 20, N'Технические характеристики', N'Диаметр кабеля ', N'4 мм', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1163, 20, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 C)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1164, 20, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1165, 20, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 3.5 мм', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1166, 20, N'Технические характеристики', N'Гарантия ', N'20 лет', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1167, 20, N'Технические характеристики', N'Ширина мата', N'0.5 м', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1168, 20, N'Технические характеристики', N'Соответствие международному сертификату', N'IEC 60800', 12)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1181, 22, N'Технические характеристики', N'Мощность удельная ', N'160 Вт/м кв', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1182, 22, N'Технические характеристики', N'Мощность кабеля погонная ', N'16 Вт/м', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1183, 22, N'Технические характеристики', N'Шаг укладки кабеля ', N'0.1 м', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1184, 22, N'Технические характеристики', N'Питающий провод ', N'1.5 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1185, 22, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1186, 22, N'Технические характеристики', N'Наружная изоляция ', N'ПВХ (темп. плавления 105 C)', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1187, 22, N'Технические характеристики', N'Внутрення изоляция', N' полиэтилен (темп. плавления 110 С)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1188, 22, N'Технические характеристики', N'Сечение кабеля ', N'6.5х4 мм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1189, 22, N'Технические характеристики', N'Гарантия ', N'15 лет', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1190, 22, N'Технические характеристики', N'Ширина мата ', N'0.5 м', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1191, 22, N'Технические характеристики', N'Соответствие международному сертификату', N' IEC 60800', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1192, 23, N'Технические характеристики', N'Мощность удельная ', N'150 Вт/м кв.', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1193, 23, N'Технические характеристики', N'Мощность кабеля погонная ', N'9 Вт/м', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1194, 23, N'Технические характеристики', N'Шаг укладки кабеля на сетке ', N'0.06 м', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1195, 23, N'Технические характеристики', N'Питающий провод ', N'2.5 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1196, 23, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1197, 23, N'Технические характеристики', N'Ширина мата ', N'0.5 м', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1198, 23, N'Технические характеристики', N'Изоляция кабеля', N'фторопласт (темп. плавления 250 С)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1199, 23, N'Технические характеристики', N'Диаметр нагревательного кабеля', N' 1.0 мм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1200, 23, N'Технические характеристики', N'Толщина экрана ', N'0.7 мм', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1201, 23, N'Технические характеристики', N'Гарантия ', N'20 лет', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1202, 23, N'Технические характеристики', N'Толщина экрана ', N'0.7 мм', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1228, 25, N'Технические характеристики', N'Тип', N'аналоговый', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1229, 25, N'Технические характеристики', N'Адаптивная функция', N'нет', 3)
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1230, 25, N'Технические характеристики', N'Удаленное управление', N'нет', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1231, 25, N'Технические характеристики', N'Датчик воздуха', N'нет', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1232, 25, N'Технические характеристики', N'Датчик пола', N'да', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1233, 25, N'Технические характеристики', N'Диапазон температур', N'5 - 40 С', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1234, 25, N'Технические характеристики', N'Нагрузка, А', N'16 А', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1235, 25, N'Технические характеристики', N'Степень защиты', N'IP 20', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1236, 25, N'Технические характеристики', N'Способ монтажа', N'в подрозетник', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1237, 25, N'Технические характеристики', N'Гарантия', N'2 года', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1238, 26, N'Технические характеристики', N'Тип', N'программируемый', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1239, 26, N'Технические характеристики', N'Адаптивная функция', N'да', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1240, 26, N'Технические характеристики', N'Удаленное управление', N'нет', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1241, 26, N'Технические характеристики', N'Датчик воздуха', N'да', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1242, 26, N'Технические характеристики', N'Датчик пола', N'да', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1243, 26, N'Технические характеристики', N'Диапазон температур', N'5 - 95 С', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1244, 26, N'Технические характеристики', N'Нагрузка, А', N'16 А', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1245, 26, N'Технические характеристики', N'Степень защиты', N'IP 20', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1246, 26, N'Технические характеристики', N'Способ монтажа', N'в подрозетник', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1247, 26, N'Технические характеристики', N'Гарантия', N'2 года', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1248, 27, N'Технические характеристики', N'Тип', N'программируемый', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1249, 27, N'Технические характеристики', N'Адаптивная функция', N'да', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1250, 27, N'Технические характеристики', N'Удаленное управление', N'WIFI', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1251, 27, N'Технические характеристики', N'Датчик воздуха', N'да', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1252, 27, N'Технические характеристики', N'Датчик пола', N'да', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1253, 27, N'Технические характеристики', N'Диапазон температур', N'5 - 95 С', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1254, 27, N'Технические характеристики', N'Нагрузка, А', N'16 А', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1255, 27, N'Технические характеристики', N'Степень защиты', N'IP 20', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1256, 27, N'Технические характеристики', N'Способ монтажа', N'в подрозетник', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1257, 27, N'Технические характеристики', N'Гарантия', N'2 года', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1258, 28, N'Технические характеристики', N'Тип', N'программируемый', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1259, 28, N'Технические характеристики', N'Дисплей', N'сенсорный', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1260, 28, N'Технические характеристики', N'Адаптивная функция', N'да', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1261, 28, N'Технические характеристики', N'Удаленное управление', N'нет', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1262, 28, N'Технические характеристики', N'Датчик воздуха', N'да', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1263, 28, N'Технические характеристики', N'Датчик пола', N'да', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1264, 28, N'Технические характеристики', N'Диапазон температур', N'5 - 95 С', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1265, 28, N'Технические характеристики', N'Нагрузка, А', N'16 А', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1266, 28, N'Технические характеристики', N'Степень защиты', N'IP 20', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1267, 28, N'Технические характеристики', N'Способ монтажа', N'в подрозетник', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1268, 28, N'Технические характеристики', N'Гарантия', N'2 года', 12)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1269, 29, N'Технические характеристики', N'Тип', N'программируемый', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1270, 29, N'Технические характеристики', N'Дисплей', N'сенсорный', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1271, 29, N'Технические характеристики', N'Адаптивная функция', N'да', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1272, 29, N'Технические характеристики', N'Удаленное управление', N'нет', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1273, 29, N'Технические характеристики', N'Датчик воздуха', N'да', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1274, 29, N'Технические характеристики', N'Датчик пола', N'да', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1275, 29, N'Технические характеристики', N'Диапазон температур', N'5 - 40 С', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1276, 29, N'Технические характеристики', N'Нагрузка, А', N'16 А', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1277, 29, N'Технические характеристики', N'Степень защиты', N'IP 20', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1278, 29, N'Технические характеристики', N'Способ монтажа', N'в подрозетник', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1279, 29, N'Технические характеристики', N'Гарантия', N'2 года', 12)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1280, 9, N'Техническиехарактеристики', N'Мощность кабеля погонная', N'12.5Вт/м', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1281, 9, N'Техническиехарактеристики', N'Шаг укладки кабелянамате', N'0.08м', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1282, 9, N'Техническиехарактеристики', N'Питающ ийпровод', N'2.5м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1283, 9, N'Техническиехарактеристики', N'Соединение нагревательного и питающего проводов', N'безмуфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1284, 9, N'Техническиехарактеристики', N'Наружная изоляция', N'ПВХ(темп.плавления105с)', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1285, 9, N'Техническиехарактеристики', N'Внутрення изоляция', N'фторполимер(темп.плавления250С)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1286, 9, N'Техническиехарактеристики', N'Диаметр кабеля', N'около4.5мм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1287, 9, N'Техническиехарактеристики', N'Ширина мата площадью более 1мкв.', N'0.46м', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1288, 9, N'Техническиехарактеристики', N'Ширина мата площалью менее 0.45мкв.', N'0.3м', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1289, 9, N'Техническиехарактеристики', N'Класс механической прочности', N'М1', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1290, 9, N'Техническиехарактеристики', N'Гарантия', N'20лет', 12)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1291, 9, N'Техническиехарактеристики', N'Допуск к эксплуатации', N'VDE(самые строгие требования)', 13)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1292, 9, N'Техническиехарактеристики', N'Мощность удельная', N'150 Вт/м кв', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1293, 12, N'Технические характеристики', N'Мощность удельная ', N'160 Вт/м кв.', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1294, 12, N'Технические характеристики', N'Мощность кабеля погонная ', N'12 Вт/м', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1295, 12, N'Технические характеристики', N'Шаг укладки кабеля на сетке ', N'0.075 м', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1296, 12, N'Технические характеристики', N'Питающий провод ', N'3 м', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1297, 12, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1298, 12, N'Технические характеристики', N'Наружная изоляция ', N'ПВДФ-фторопаст (темп. плавления 105 C)', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1299, 12, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1300, 12, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 4 мм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1301, 12, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1302, 12, N'Технические характеристики', N'Ширина мата', N' 0.5 м', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1303, 12, N'Технические характеристики', N'Мощность удельная ', N'160 Вт/м кв.', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1304, 12, N'Технические характеристики', N'Мощность кабеля погонная ', N'до 7.6 м кв. - 12 Вт/м, после 8.8 м кв. - 18 Вт/м', 12)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1305, 12, N'Технические характеристики', N'Шаг укладки кабеля на сетке ', N'до 7.6 м кв. - 0.075 м, после 8.8 м кв. - 0.11 м', 13)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1306, 12, N'Технические характеристики', N'Питающий провод ', N'3 м', 14)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1307, 12, N'Технические характеристики', N'Соединение нагревательного и питающего проводов ', N'муфтовое', 15)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1308, 12, N'Технические характеристики', N'Наружная изоляция ', N'ПВДФ-фторопаст (темп. плавления 105 C)', 16)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1309, 12, N'Технические характеристики', N'Внутрення изоляция ', N'фторопласт (темп. плавления 250 С)', 17)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1310, 12, N'Технические характеристики', N'Диаметр нагревательного кабеля ', N'около 3.5 мм', 18)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1311, 12, N'Технические характеристики', N'Гарантия', N'пожизненна от производителя', 19)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1312, 12, N'Технические характеристики', N'Ширина мата', N' 0.5 м', 20)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1313, 25, N'Технические характеристики', N'Цвета ', N'белый, бежевый', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1314, 26, N'Технические характеристики', N'Цвета ', N'белый, черный, бежевый, серебро, золото', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1315, 27, N'Технические характеристики', N'Цвета ', N'белый, черный', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1316, 28, N'Технические характеристики', N'Цвета ', N'белый, черный, бежевый, серебро, золото', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1317, 29, N'Технические характеристики', N'Цвета ', N'черный, зеркальный', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1542, 34, N'Технические характеристики', N'Тип', N'встраивыемый цифровой', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1543, 34, N'Технические характеристики', N'Напряжение питания', N'200-240 В ~50/60 Гц', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1544, 34, N'Технические характеристики', N'Максимальный ток нагрузки', N'16 А, 3,6 кВт', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1545, 34, N'Технические характеристики', N'Точность поддержания температуры', N'+/- 0,1 C', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1546, 34, N'Технические характеристики', N'Задаваемый температурный диапазон', N'от +5 до +35 C', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1547, 34, N'Технические характеристики', N'Ограничение температурного диапазона', N'от 0 до +40 C', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1548, 34, N'Технические характеристики', N'Потребление', N'<0,3 Вт', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1549, 34, N'Технические характеристики', N'Датчик температуры', N'NTC 10 кОм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1550, 34, N'Технические характеристики', N'Размер', N'86 мм * 86 мм * 41 мм', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1551, 34, N'Технические характеристики', N'Материал корпуса', N'негорючий пластполимер', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1552, 34, N'Технические характеристики', N'Защита корпуса', N'IP 20', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1553, 35, N'Технические характеристики', N'Тип', N'встраивыемый цифровой', 1)
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1554, 35, N'Технические характеристики', N'Напряжение питания', N'200-240 В ~50/60 Гц', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1555, 35, N'Технические характеристики', N'Максимальный ток нагрузки', N'16 А, 3,6 кВт', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1556, 35, N'Технические характеристики', N'Точность поддержания температуры', N'+/- 0,5 C', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1557, 35, N'Технические характеристики', N'Задаваемый температурный диапазон', N'от +5 до +60 C', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1558, 35, N'Технические характеристики', N'Ограничение температурного диапазона', N'от +5 до +60 C', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1559, 35, N'Технические характеристики', N'Потребление', N'<0,3 Вт', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1560, 35, N'Технические характеристики', N'Датчик температуры', N'NTC 10 кОм', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1561, 35, N'Технические характеристики', N'Размер', N'86 мм * 86 мм * 40 мм', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1562, 35, N'Технические характеристики', N'Материал корпуса', N'негорючий пластполимер', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1563, 35, N'Технические характеристики', N'Защита корпуса', N'IP 20', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1564, 36, N'Технические характеристики', N'Тип управления', N'механическое', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1565, 36, N'Технические характеристики', N'Способ монтажа', N'накладной', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1566, 36, N'Технические характеристики', N'Минимальная температура', N'5 C', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1567, 36, N'Технические характеристики', N'Максимальная температура', N'30 C', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1568, 36, N'Технические характеристики', N'Ток комутации', N'16 А', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1569, 36, N'Технические характеристики', N'Класс защиты', N'IP30', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1570, 36, N'Технические характеристики', N'Подходит для радиаторного отопления', N'есть', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1571, 37, N'Технические характеристики', N'Тип управления', N'механическое', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1572, 37, N'Технические характеристики', N'Способ монтажа', N'накладной', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1573, 37, N'Технические характеристики', N'Минимальная температура', N'5 C', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1574, 37, N'Технические характеристики', N'Максимальная нагрузка', N'3520 Вт', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1575, 37, N'Технические характеристики', N'Максимальная температура', N'30 C', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1576, 37, N'Технические характеристики', N'Ток комутации', N'16 А', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1577, 37, N'Технические характеристики', N'Класс защиты', N'IP30', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1578, 37, N'Технические характеристики', N'Регулирование температуры воздуха', N'есть', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1579, 37, N'Технические характеристики', N'Подходит для инфракрасного отопления', N'есть', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1580, 37, N'Технические характеристики', N'Гарантийный срок', N'2 г., монтаж и эксплуатация в соответствии с инструкцией по монтажу и рекомендациями производителя.', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1581, 38, N'Технические характеристики', N'Тип управления', N'механическое', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1582, 38, N'Технические характеристики', N'Тип связи', N'проводной', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1583, 38, N'Технические характеристики', N'Способ монтажа', N'накладной', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1584, 38, N'Технические характеристики', N'Минимальная температура', N'- 15 C', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1585, 38, N'Технические характеристики', N'Максимальная нагрузка', N'230 Вт', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1586, 38, N'Технические характеристики', N'Максимальная температура', N'15 C', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1587, 38, N'Технические характеристики', N'Ток комутации', N'16 А', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1588, 38, N'Технические характеристики', N'Класс защиты', N'IP65', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1589, 38, N'Технические характеристики', N'Гарантийный срок', N'2 г., монтаж и эксплуатация в соответствии с инструкцией по монтажу и рекомендациями производителя.', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1590, 39, N'Технические характеристики', N'Тип управления', N'механическое', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1591, 39, N'Технические характеристики', N'Тип связи', N'проводной', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1592, 39, N'Технические характеристики', N'Способ монтажа', N'накладной', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1593, 39, N'Технические характеристики', N'Минимальная температура', N'- 15 C', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1594, 39, N'Технические характеристики', N'Максимальная нагрузка', N'230 Вт', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1595, 39, N'Технические характеристики', N'Максимальная температура', N'15 C', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1596, 39, N'Технические характеристики', N'Ток комутации', N'16 А', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1597, 39, N'Технические характеристики', N'Класс защиты', N'IP65', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1598, 39, N'Технические характеристики', N'Гарантийный срок', N'2 г., монтаж и эксплуатация в соответствии с инструкцией по монтажу и рекомендациями производителя.', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1599, 40, N'Технические характеристики', N'Тип управления', N'механическое', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1600, 40, N'Технические характеристики', N'Тип связи', N'проводной', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1601, 40, N'Технические характеристики', N'Способ монтажа', N'скрытый', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1602, 40, N'Технические характеристики', N'Минимальная температура', N'10 C', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1603, 40, N'Технические характеристики', N'Максимальная температура', N'60 C', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1604, 40, N'Технические характеристики', N'Датчик теплого пола', N'в комплекте', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1605, 40, N'Технические характеристики', N'Ток комутации', N'14 А', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1606, 40, N'Технические характеристики', N'Регулирование температуры теплого пола', N'есть', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1607, 40, N'Технические характеристики', N'Подходит для электрического теплого пола', N'есть', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1608, 40, N'Технические характеристики', N'Гарантийный срок', N'2 г., монтаж и эксплуатация в соответствии с инструкцией по монтажу и рекомендациями производителя.', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1609, 41, N'Технические характеристики', N'Тип управления', N'механическое', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1610, 41, N'Технические характеристики', N'Тип связи', N'проводной', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1611, 41, N'Технические характеристики', N'Способ монтажа', N'скрытый', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1612, 41, N'Технические характеристики', N'Минимальная температура', N'10 C', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1613, 41, N'Технические характеристики', N'Максимальная температура', N'50 C', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1614, 41, N'Технические характеристики', N'Датчик теплого пола', N'в комплекте', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1615, 41, N'Технические характеристики', N'Ток комутации', N'10 А', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1616, 41, N'Технические характеристики', N'Регулирование температуры теплого пола', N'есть', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1617, 41, N'Технические характеристики', N'Подходит для электрического теплого пола', N'есть', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1618, 41, N'Технические характеристики', N'Класс защиты', N'IP30', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1619, 41, N'Технические характеристики', N'Гарантийный срок', N'2 г., монтаж и эксплуатация в соответствии с инструкцией по монтажу и рекомендациями производителя.', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1620, 42, N'Технические характеристики', N'Тип управления', N'механическое', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1621, 42, N'Технические характеристики', N'Тип связи', N'проводной', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1622, 42, N'Технические характеристики', N'Способ монтажа', N'скрытый', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1623, 42, N'Технические характеристики', N'Минимальная температура', N'10 C', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1624, 42, N'Технические характеристики', N'Максимальная температура', N'50 C', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1625, 42, N'Технические характеристики', N'Датчик теплого пола', N'в комплекте', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1626, 42, N'Технические характеристики', N'Ток комутации', N'16 А', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1627, 42, N'Технические характеристики', N'Подходит для электрического теплого пола', N'есть', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1628, 42, N'Технические характеристики', N'Класс защиты', N'IP30', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1629, 42, N'Технические характеристики', N'Гарантийный срок', N'2 г., монтаж и эксплуатация в соответствии с инструкцией по монтажу и рекомендациями производителя.', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1630, 43, N'Технические характеристики', N'Тип управления', N'механическое', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1631, 43, N'Технические характеристики', N'Тип связи', N'проводной', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1632, 43, N'Технические характеристики', N'Способ монтажа', N'скрытый', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1633, 43, N'Технические характеристики', N'Минимальная температура', N'10 C', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1634, 43, N'Технические характеристики', N'Максимальная температура', N'40 C', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1635, 43, N'Технические характеристики', N'Датчик теплого пола', N'в комплекте', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1636, 43, N'Технические характеристики', N'Ток комутации', N'16 А', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1637, 43, N'Технические характеристики', N'Класс защиты', N'IP30', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1638, 43, N'Технические характеристики', N'Программируемый', N'да', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1639, 43, N'Технические характеристики', N'Регулирование температуры теплого пола', N'есть', 10)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1640, 43, N'Технические характеристики', N'Регулирование температуры воздуха', N'есть', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1641, 43, N'Технические характеристики', N'Подходит для электрического теплого пола', N'есть', 12)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1642, 43, N'Технические характеристики', N'Подходит для систем кондиционирования', N'есть', 13)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1643, 43, N'Технические характеристики', N'Гарантийный срок', N'2 г., монтаж и эксплуатация в соответствии с инструкцией по монтажу и рекомендациями производителя.', 14)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1644, 44, N'Технические характеристики', N'Тип устройства', N'контроллер', 1)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1645, 44, N'Технические характеристики', N'Назначение', N'для кровельного антиобледенения, для обогрева желобов и водостоков', 2)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1646, 44, N'Технические характеристики', N'Цвет', N'светло-серый', 3)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1647, 44, N'Технические характеристики', N'Материал', N'ABS пластик', 4)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1648, 44, N'Технические характеристики', N'Тип управления', N'механическое', 5)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1649, 44, N'Технические характеристики', N'Режим управления', N'обогрев', 6)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1650, 44, N'Технические характеристики', N'Количество зон', N'1', 7)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1651, 44, N'Технические характеристики', N'Канал связи', N'проводной', 8)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1652, 44, N'Технические характеристики', N'Программируемый', N'Нет', 9)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1653, 44, N'Технические характеристики', N'Тип отображения информации', N'ЖК-дисплей с подсветкой', 10)
GO
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1654, 44, N'Технические характеристики', N'Тип монтажа', N'накладной', 11)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1655, 44, N'Технические характеристики', N'Рабочие температуры °С', N'-20 — 50', 12)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1656, 44, N'Технические характеристики', N'Источник питания', N'сеть', 13)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1657, 44, N'Технические характеристики', N'Частота', N'50 Гц', 14)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1658, 44, N'Технические характеристики', N'Датчики', N'встроенный', 15)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1659, 44, N'Технические характеристики', N'Коммутируемый ток нагрузки', N'15 А', 16)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1661, 44, N'Технические характеристики', N'Потребляемая мощность', N'15 Вт', 18)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1662, 44, N'Технические характеристики', N'Напряжение питания', N'230 В', 19)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1663, 44, N'Технические характеристики', N'Параметр сети', N'50 Гц', 20)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1664, 44, N'Технические характеристики', N'Класс защиты', N'IP20', 21)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1665, 44, N'Технические характеристики', N'Функции', N'задержки отключения нагрева от 10 до 120 минут', 22)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1666, 44, N'Технические характеристики', N'Гарантия', N'2 года', 23)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1667, 44, N'Технические характеристики', N'Размеры в упаковке', N'109x90x58 мм', 24)
INSERT [dbo].[ProductAttributes] ([productAttributes_id], [product_id], [attribute_group], [attribute], [text], [sort]) VALUES (1668, 44, N'Технические характеристики', N'Вес в упаковке', N'480 г', 25)
SET IDENTITY_INSERT [dbo].[ProductAttributes] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductOptions] ON 

INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2187, 10, CAST(150 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)), NULL, CAST(4544 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2188, 10, CAST(225 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), NULL, CAST(5329 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2189, 10, CAST(300 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), NULL, CAST(7910 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2190, 10, CAST(375 AS Numeric(18, 0)), CAST(2.50 AS Numeric(10, 2)), NULL, CAST(8640 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2191, 10, CAST(450 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), NULL, CAST(10042 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2192, 10, CAST(525 AS Numeric(18, 0)), CAST(3.50 AS Numeric(10, 2)), NULL, CAST(10759 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2193, 10, CAST(600 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), NULL, CAST(13352 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2194, 10, CAST(675 AS Numeric(18, 0)), CAST(4.50 AS Numeric(10, 2)), NULL, CAST(13871 AS Numeric(18, 0)), CAST(9.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2195, 10, CAST(750 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), NULL, CAST(14923 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2196, 10, CAST(900 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), NULL, CAST(16157 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2197, 10, CAST(1050 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), NULL, CAST(17222 AS Numeric(18, 0)), CAST(14.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2198, 10, CAST(1200 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), NULL, CAST(18401 AS Numeric(18, 0)), CAST(16.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2199, 10, CAST(1350 AS Numeric(18, 0)), CAST(9.00 AS Numeric(10, 2)), NULL, CAST(23808 AS Numeric(18, 0)), CAST(18.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2200, 10, CAST(1500 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), NULL, CAST(25925 AS Numeric(18, 0)), CAST(20.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2201, 10, CAST(1800 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)), NULL, CAST(29088 AS Numeric(18, 0)), CAST(24.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2202, 10, CAST(2250 AS Numeric(18, 0)), CAST(15.00 AS Numeric(10, 2)), NULL, CAST(34143 AS Numeric(18, 0)), CAST(30.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2203, 11, CAST(80 AS Numeric(18, 0)), CAST(0.50 AS Numeric(10, 2)), NULL, CAST(2746 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2204, 11, CAST(160 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)), NULL, CAST(3679 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2205, 11, CAST(240 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), NULL, CAST(5410 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2206, 11, CAST(320 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), NULL, CAST(6645 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2207, 11, CAST(400 AS Numeric(18, 0)), CAST(2.50 AS Numeric(10, 2)), NULL, CAST(7305 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2208, 11, CAST(480 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), NULL, CAST(8760 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2209, 11, CAST(560 AS Numeric(18, 0)), CAST(3.50 AS Numeric(10, 2)), NULL, CAST(9254 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2210, 11, CAST(640 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), NULL, CAST(11507 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2211, 11, CAST(800 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), NULL, CAST(13208 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2212, 11, CAST(960 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), NULL, CAST(16641 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2213, 11, CAST(1120 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), NULL, CAST(16834 AS Numeric(18, 0)), CAST(14.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2214, 11, CAST(1280 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), NULL, CAST(17959 AS Numeric(18, 0)), CAST(16.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2215, 11, CAST(1600 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), NULL, CAST(19553 AS Numeric(18, 0)), CAST(20.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2216, 11, CAST(1920 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)), NULL, CAST(24083 AS Numeric(18, 0)), CAST(24.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2217, 12, CAST(70 AS Numeric(18, 0)), CAST(0.50 AS Numeric(10, 2)), NULL, CAST(2831 AS Numeric(18, 0)), CAST(0.90 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2218, 12, CAST(130 AS Numeric(18, 0)), CAST(0.80 AS Numeric(10, 2)), NULL, CAST(3161 AS Numeric(18, 0)), CAST(1.60 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2219, 12, CAST(210 AS Numeric(18, 0)), CAST(1.30 AS Numeric(10, 2)), NULL, CAST(4454 AS Numeric(18, 0)), CAST(2.60 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2220, 12, CAST(260 AS Numeric(18, 0)), CAST(1.60 AS Numeric(10, 2)), NULL, CAST(5388 AS Numeric(18, 0)), CAST(3.20 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2221, 12, CAST(340 AS Numeric(18, 0)), CAST(2.10 AS Numeric(10, 2)), NULL, CAST(6653 AS Numeric(18, 0)), CAST(4.20 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2222, 12, CAST(410 AS Numeric(18, 0)), CAST(2.60 AS Numeric(10, 2)), NULL, CAST(7396 AS Numeric(18, 0)), CAST(5.20 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2223, 12, CAST(500 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), NULL, CAST(8715 AS Numeric(18, 0)), CAST(6.10 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2224, 12, CAST(560 AS Numeric(18, 0)), CAST(3.35 AS Numeric(10, 2)), NULL, CAST(9429 AS Numeric(18, 0)), CAST(6.70 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2225, 12, CAST(670 AS Numeric(18, 0)), CAST(4.15 AS Numeric(10, 2)), NULL, CAST(11573 AS Numeric(18, 0)), CAST(8.30 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2226, 12, CAST(810 AS Numeric(18, 0)), CAST(5.10 AS Numeric(10, 2)), NULL, CAST(13196 AS Numeric(18, 0)), CAST(10.20 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2227, 12, CAST(1000 AS Numeric(18, 0)), CAST(6.15 AS Numeric(10, 2)), NULL, CAST(16495 AS Numeric(18, 0)), CAST(12.30 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2228, 12, CAST(1210 AS Numeric(18, 0)), CAST(7.55 AS Numeric(10, 2)), NULL, CAST(19683 AS Numeric(18, 0)), CAST(15.10 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2229, 12, CAST(1400 AS Numeric(18, 0)), CAST(8.80 AS Numeric(10, 2)), NULL, CAST(19767 AS Numeric(18, 0)), CAST(17.60 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2230, 12, CAST(1800 AS Numeric(18, 0)), CAST(11.00 AS Numeric(10, 2)), NULL, CAST(24000 AS Numeric(18, 0)), CAST(22.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2231, 12, CAST(2150 AS Numeric(18, 0)), CAST(13.30 AS Numeric(10, 2)), NULL, CAST(31890 AS Numeric(18, 0)), CAST(26.60 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2232, 12, CAST(2600 AS Numeric(18, 0)), CAST(16.30 AS Numeric(10, 2)), NULL, CAST(41842 AS Numeric(18, 0)), CAST(32.50 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2233, 13, CAST(120 AS Numeric(18, 0)), CAST(1.14 AS Numeric(10, 2)), CAST(11.40 AS Numeric(10, 2)), CAST(2733 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2234, 13, CAST(200 AS Numeric(18, 0)), CAST(1.42 AS Numeric(10, 2)), CAST(18.90 AS Numeric(10, 2)), CAST(3405 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2235, 13, CAST(250 AS Numeric(18, 0)), CAST(1.77 AS Numeric(10, 2)), CAST(23.60 AS Numeric(10, 2)), CAST(3981 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2236, 13, CAST(320 AS Numeric(18, 0)), CAST(2.37 AS Numeric(10, 2)), CAST(31.60 AS Numeric(10, 2)), CAST(4641 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2237, 13, CAST(400 AS Numeric(18, 0)), CAST(2.77 AS Numeric(10, 2)), CAST(36.90 AS Numeric(10, 2)), CAST(4998 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2238, 13, CAST(450 AS Numeric(18, 0)), CAST(3.44 AS Numeric(10, 2)), CAST(45.90 AS Numeric(10, 2)), CAST(5877 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2239, 13, CAST(520 AS Numeric(18, 0)), CAST(3.72 AS Numeric(10, 2)), CAST(49.60 AS Numeric(10, 2)), CAST(6152 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2240, 13, CAST(600 AS Numeric(18, 0)), CAST(4.79 AS Numeric(10, 2)), CAST(63.90 AS Numeric(10, 2)), CAST(7964 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2241, 13, CAST(750 AS Numeric(18, 0)), CAST(5.69 AS Numeric(10, 2)), CAST(75.80 AS Numeric(10, 2)), CAST(8348 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2242, 13, CAST(950 AS Numeric(18, 0)), CAST(6.53 AS Numeric(10, 2)), CAST(87.00 AS Numeric(10, 2)), CAST(9968 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2243, 13, CAST(1100 AS Numeric(18, 0)), CAST(8.59 AS Numeric(10, 2)), CAST(114.50 AS Numeric(10, 2)), CAST(12275 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2244, 13, CAST(1300 AS Numeric(18, 0)), CAST(9.85 AS Numeric(10, 2)), CAST(131.30 AS Numeric(10, 2)), CAST(13812 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2245, 13, CAST(1700 AS Numeric(18, 0)), CAST(11.89 AS Numeric(10, 2)), CAST(158.50 AS Numeric(10, 2)), CAST(16696 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2246, 13, CAST(2000 AS Numeric(18, 0)), CAST(14.59 AS Numeric(10, 2)), CAST(194.50 AS Numeric(10, 2)), CAST(22106 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2247, 14, CAST(160 AS Numeric(18, 0)), CAST(1.36 AS Numeric(10, 2)), CAST(8.50 AS Numeric(10, 2)), CAST(2529 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2248, 14, CAST(260 AS Numeric(18, 0)), CAST(2.32 AS Numeric(10, 2)), CAST(14.50 AS Numeric(10, 2)), CAST(3075 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2249, 14, CAST(320 AS Numeric(18, 0)), CAST(2.96 AS Numeric(10, 2)), CAST(18.50 AS Numeric(10, 2)), CAST(3543 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2250, 14, CAST(420 AS Numeric(18, 0)), CAST(3.84 AS Numeric(10, 2)), CAST(24.00 AS Numeric(10, 2)), CAST(4009 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2251, 14, CAST(520 AS Numeric(18, 0)), CAST(4.54 AS Numeric(10, 2)), CAST(28.40 AS Numeric(10, 2)), CAST(4284 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2252, 14, CAST(600 AS Numeric(18, 0)), CAST(5.50 AS Numeric(10, 2)), CAST(34.40 AS Numeric(10, 2)), CAST(4888 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2253, 14, CAST(680 AS Numeric(18, 0)), CAST(6.06 AS Numeric(10, 2)), CAST(37.90 AS Numeric(10, 2)), CAST(5162 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2254, 14, CAST(830 AS Numeric(18, 0)), CAST(7.38 AS Numeric(10, 2)), CAST(46.10 AS Numeric(10, 2)), CAST(6288 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2255, 14, CAST(1000 AS Numeric(18, 0)), CAST(9.20 AS Numeric(10, 2)), CAST(57.50 AS Numeric(10, 2)), CAST(6810 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2256, 14, CAST(1200 AS Numeric(18, 0)), CAST(11.02 AS Numeric(10, 2)), CAST(68.90 AS Numeric(10, 2)), CAST(8430 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2257, 14, CAST(1500 AS Numeric(18, 0)), CAST(13.31 AS Numeric(10, 2)), CAST(83.20 AS Numeric(10, 2)), CAST(9474 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2258, 14, CAST(1700 AS Numeric(18, 0)), CAST(16.06 AS Numeric(10, 2)), CAST(100.40 AS Numeric(10, 2)), CAST(11809 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2259, 14, CAST(2200 AS Numeric(18, 0)), CAST(19.55 AS Numeric(10, 2)), CAST(122.20 AS Numeric(10, 2)), CAST(13346 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2260, 14, CAST(2600 AS Numeric(18, 0)), CAST(23.94 AS Numeric(10, 2)), CAST(149.60 AS Numeric(10, 2)), CAST(17438 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2271, 16, CAST(140 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)), NULL, CAST(4792 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2272, 16, CAST(210 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), NULL, CAST(6389 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2273, 16, CAST(280 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), NULL, CAST(7628 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2274, 16, CAST(420 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), NULL, CAST(10542 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2275, 16, CAST(560 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), NULL, CAST(13242 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2276, 16, CAST(700 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), NULL, CAST(15091 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2277, 16, CAST(840 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), NULL, CAST(18073 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2278, 16, CAST(980 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), NULL, CAST(22651 AS Numeric(18, 0)), CAST(14.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2279, 16, CAST(1120 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), NULL, CAST(23919 AS Numeric(18, 0)), CAST(16.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2280, 16, CAST(1260 AS Numeric(18, 0)), CAST(9.00 AS Numeric(10, 2)), NULL, CAST(27027 AS Numeric(18, 0)), CAST(18.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2281, 16, CAST(1400 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), NULL, CAST(28808 AS Numeric(18, 0)), CAST(20.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2282, 17, CAST(195 AS Numeric(18, 0)), CAST(0.84 AS Numeric(10, 2)), CAST(7.00 AS Numeric(10, 2)), CAST(3213 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2283, 17, CAST(340 AS Numeric(18, 0)), CAST(1.32 AS Numeric(10, 2)), CAST(11.00 AS Numeric(10, 2)), CAST(3872 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2284, 17, CAST(420 AS Numeric(18, 0)), CAST(1.68 AS Numeric(10, 2)), CAST(14.00 AS Numeric(10, 2)), CAST(4229 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2285, 17, CAST(560 AS Numeric(18, 0)), CAST(2.16 AS Numeric(10, 2)), CAST(18.00 AS Numeric(10, 2)), CAST(4778 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2286, 17, CAST(670 AS Numeric(18, 0)), CAST(2.64 AS Numeric(10, 2)), CAST(22.00 AS Numeric(10, 2)), CAST(5135 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2287, 17, CAST(800 AS Numeric(18, 0)), CAST(3.12 AS Numeric(10, 2)), CAST(26.00 AS Numeric(10, 2)), CAST(5657 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2288, 17, CAST(970 AS Numeric(18, 0)), CAST(3.84 AS Numeric(10, 2)), CAST(32.00 AS Numeric(10, 2)), CAST(6810 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2289, 17, CAST(1060 AS Numeric(18, 0)), CAST(4.32 AS Numeric(10, 2)), CAST(36.00 AS Numeric(10, 2)), CAST(7689 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2290, 17, CAST(1300 AS Numeric(18, 0)), CAST(5.28 AS Numeric(10, 2)), CAST(44.00 AS Numeric(10, 2)), CAST(8211 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2291, 17, CAST(1600 AS Numeric(18, 0)), CAST(6.24 AS Numeric(10, 2)), CAST(52.00 AS Numeric(10, 2)), CAST(9611 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2292, 17, CAST(1940 AS Numeric(18, 0)), CAST(7.80 AS Numeric(10, 2)), CAST(65.00 AS Numeric(10, 2)), CAST(10930 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2293, 17, CAST(2250 AS Numeric(18, 0)), CAST(9.12 AS Numeric(10, 2)), CAST(76.00 AS Numeric(10, 2)), CAST(12577 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2294, 17, CAST(2800 AS Numeric(18, 0)), CAST(11.52 AS Numeric(10, 2)), CAST(96.00 AS Numeric(10, 2)), CAST(15790 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2295, 17, CAST(3400 AS Numeric(18, 0)), CAST(13.68 AS Numeric(10, 2)), CAST(114.00 AS Numeric(10, 2)), CAST(19662 AS Numeric(18, 0)), NULL, NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2296, 18, CAST(195 AS Numeric(18, 0)), CAST(0.84 AS Numeric(10, 2)), CAST(7.00 AS Numeric(10, 2)), CAST(3213 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2297, 18, CAST(340 AS Numeric(18, 0)), CAST(1.32 AS Numeric(10, 2)), CAST(11.00 AS Numeric(10, 2)), CAST(3872 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2298, 18, CAST(420 AS Numeric(18, 0)), CAST(1.68 AS Numeric(10, 2)), CAST(14.00 AS Numeric(10, 2)), CAST(4229 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2299, 18, CAST(560 AS Numeric(18, 0)), CAST(2.16 AS Numeric(10, 2)), CAST(18.00 AS Numeric(10, 2)), CAST(4778 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2300, 18, CAST(670 AS Numeric(18, 0)), CAST(2.64 AS Numeric(10, 2)), CAST(22.00 AS Numeric(10, 2)), CAST(5135 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2301, 18, CAST(800 AS Numeric(18, 0)), CAST(3.12 AS Numeric(10, 2)), CAST(26.00 AS Numeric(10, 2)), CAST(5657 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2302, 18, CAST(970 AS Numeric(18, 0)), CAST(3.84 AS Numeric(10, 2)), CAST(32.00 AS Numeric(10, 2)), CAST(6810 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2303, 18, CAST(1060 AS Numeric(18, 0)), CAST(4.32 AS Numeric(10, 2)), CAST(36.00 AS Numeric(10, 2)), CAST(7689 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2304, 18, CAST(1300 AS Numeric(18, 0)), CAST(5.28 AS Numeric(10, 2)), CAST(44.00 AS Numeric(10, 2)), CAST(8211 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2305, 18, CAST(1600 AS Numeric(18, 0)), CAST(6.24 AS Numeric(10, 2)), CAST(52.00 AS Numeric(10, 2)), CAST(9611 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2306, 18, CAST(1940 AS Numeric(18, 0)), CAST(7.80 AS Numeric(10, 2)), CAST(65.00 AS Numeric(10, 2)), CAST(10930 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2307, 18, CAST(2250 AS Numeric(18, 0)), CAST(9.12 AS Numeric(10, 2)), CAST(76.00 AS Numeric(10, 2)), CAST(12577 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2308, 18, CAST(2800 AS Numeric(18, 0)), CAST(11.52 AS Numeric(10, 2)), CAST(96.00 AS Numeric(10, 2)), CAST(15790 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2309, 18, CAST(3400 AS Numeric(18, 0)), CAST(13.68 AS Numeric(10, 2)), CAST(114.00 AS Numeric(10, 2)), CAST(19662 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2310, 1, CAST(45 AS Numeric(18, 0)), CAST(0.30 AS Numeric(10, 2)), CAST(4.00 AS Numeric(10, 2)), CAST(4492 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2311, 1, CAST(68 AS Numeric(18, 0)), CAST(0.45 AS Numeric(10, 2)), CAST(5.00 AS Numeric(10, 2)), CAST(5053 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2312, 1, CAST(150 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)), CAST(12.00 AS Numeric(10, 2)), CAST(7396 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2313, 1, CAST(225 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), CAST(18.00 AS Numeric(10, 2)), CAST(9060 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2314, 1, CAST(300 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), CAST(24.00 AS Numeric(10, 2)), CAST(9128 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2315, 1, CAST(375 AS Numeric(18, 0)), CAST(2.50 AS Numeric(10, 2)), CAST(30.00 AS Numeric(10, 2)), CAST(10590 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2316, 1, CAST(450 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), CAST(36.00 AS Numeric(10, 2)), CAST(12574 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2317, 1, CAST(525 AS Numeric(18, 0)), CAST(3.50 AS Numeric(10, 2)), CAST(42.00 AS Numeric(10, 2)), CAST(14820 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2318, 1, CAST(600 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), CAST(48.00 AS Numeric(10, 2)), CAST(15323 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2319, 1, CAST(675 AS Numeric(18, 0)), CAST(4.50 AS Numeric(10, 2)), CAST(54.00 AS Numeric(10, 2)), CAST(16969 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2320, 1, CAST(750 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), CAST(60.00 AS Numeric(10, 2)), CAST(18189 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2321, 1, CAST(900 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), CAST(72.00 AS Numeric(10, 2)), CAST(21180 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2322, 1, CAST(1050 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), CAST(84.00 AS Numeric(10, 2)), CAST(25042 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2323, 1, CAST(1200 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), CAST(96.00 AS Numeric(10, 2)), CAST(28033 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2324, 1, CAST(1350 AS Numeric(18, 0)), CAST(9.00 AS Numeric(10, 2)), CAST(108.00 AS Numeric(10, 2)), CAST(28827 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2325, 1, CAST(1500 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), CAST(120.00 AS Numeric(10, 2)), CAST(33115 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2326, 1, CAST(1800 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)), CAST(144.00 AS Numeric(10, 2)), CAST(36697 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2327, 1, CAST(2250 AS Numeric(18, 0)), CAST(15.00 AS Numeric(10, 2)), CAST(180.00 AS Numeric(10, 2)), CAST(46677 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2328, 2, CAST(150 AS Numeric(18, 0)), CAST(1.44 AS Numeric(10, 2)), CAST(12.00 AS Numeric(10, 2)), CAST(5363 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2329, 2, CAST(225 AS Numeric(18, 0)), CAST(2.16 AS Numeric(10, 2)), CAST(18.00 AS Numeric(10, 2)), CAST(6553 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2330, 2, CAST(300 AS Numeric(18, 0)), CAST(2.88 AS Numeric(10, 2)), CAST(24.00 AS Numeric(10, 2)), CAST(6737 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2331, 2, CAST(375 AS Numeric(18, 0)), CAST(3.60 AS Numeric(10, 2)), CAST(30.00 AS Numeric(10, 2)), CAST(7570 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2332, 2, CAST(450 AS Numeric(18, 0)), CAST(4.32 AS Numeric(10, 2)), CAST(36.00 AS Numeric(10, 2)), CAST(8954 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2333, 2, CAST(525 AS Numeric(18, 0)), CAST(5.04 AS Numeric(10, 2)), CAST(42.00 AS Numeric(10, 2)), CAST(9777 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2334, 2, CAST(600 AS Numeric(18, 0)), CAST(5.76 AS Numeric(10, 2)), CAST(48.00 AS Numeric(10, 2)), CAST(10387 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2335, 2, CAST(675 AS Numeric(18, 0)), CAST(6.48 AS Numeric(10, 2)), CAST(54.00 AS Numeric(10, 2)), CAST(11306 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2336, 2, CAST(750 AS Numeric(18, 0)), CAST(7.20 AS Numeric(10, 2)), CAST(60.00 AS Numeric(10, 2)), CAST(12226 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2337, 2, CAST(900 AS Numeric(18, 0)), CAST(8.64 AS Numeric(10, 2)), CAST(72.00 AS Numeric(10, 2)), CAST(14278 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2338, 2, CAST(1050 AS Numeric(18, 0)), CAST(10.08 AS Numeric(10, 2)), CAST(84.00 AS Numeric(10, 2)), CAST(16388 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2339, 2, CAST(1200 AS Numeric(18, 0)), CAST(11.52 AS Numeric(10, 2)), CAST(96.00 AS Numeric(10, 2)), CAST(18237 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2340, 2, CAST(1350 AS Numeric(18, 0)), CAST(12.96 AS Numeric(10, 2)), CAST(108.00 AS Numeric(10, 2)), CAST(19786 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2341, 2, CAST(1500 AS Numeric(18, 0)), CAST(14.40 AS Numeric(10, 2)), CAST(120.00 AS Numeric(10, 2)), CAST(24161 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2342, 2, CAST(1800 AS Numeric(18, 0)), CAST(17.28 AS Numeric(10, 2)), CAST(144.00 AS Numeric(10, 2)), CAST(28875 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2343, 2, CAST(2250 AS Numeric(18, 0)), CAST(21.60 AS Numeric(10, 2)), CAST(180.00 AS Numeric(10, 2)), CAST(39233 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2344, 3, CAST(150 AS Numeric(18, 0)), CAST(1.33 AS Numeric(10, 2)), CAST(9.00 AS Numeric(10, 2)), CAST(4472 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2345, 3, CAST(220 AS Numeric(18, 0)), CAST(2.06 AS Numeric(10, 2)), CAST(14.00 AS Numeric(10, 2)), CAST(5392 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2346, 3, CAST(300 AS Numeric(18, 0)), CAST(2.78 AS Numeric(10, 2)), CAST(19.00 AS Numeric(10, 2)), CAST(6660 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2347, 3, CAST(400 AS Numeric(18, 0)), CAST(3.72 AS Numeric(10, 2)), CAST(25.00 AS Numeric(10, 2)), CAST(6640 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2348, 3, CAST(500 AS Numeric(18, 0)), CAST(4.65 AS Numeric(10, 2)), CAST(31.00 AS Numeric(10, 2)), CAST(7454 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2349, 3, CAST(600 AS Numeric(18, 0)), CAST(5.21 AS Numeric(10, 2)), CAST(35.00 AS Numeric(10, 2)), CAST(8102 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2350, 3, CAST(700 AS Numeric(18, 0)), CAST(6.09 AS Numeric(10, 2)), CAST(41.00 AS Numeric(10, 2)), CAST(8760 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2351, 3, CAST(850 AS Numeric(18, 0)), CAST(7.41 AS Numeric(10, 2)), CAST(49.00 AS Numeric(10, 2)), CAST(10290 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2352, 3, CAST(1000 AS Numeric(18, 0)), CAST(8.72 AS Numeric(10, 2)), CAST(58.00 AS Numeric(10, 2)), CAST(12410 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2353, 3, CAST(1250 AS Numeric(18, 0)), CAST(10.91 AS Numeric(10, 2)), CAST(73.00 AS Numeric(10, 2)), CAST(14394 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2354, 3, CAST(1500 AS Numeric(18, 0)), CAST(13.10 AS Numeric(10, 2)), CAST(87.00 AS Numeric(10, 2)), CAST(17298 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2355, 3, CAST(1700 AS Numeric(18, 0)), CAST(14.85 AS Numeric(10, 2)), CAST(99.00 AS Numeric(10, 2)), CAST(19012 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2356, 3, CAST(1900 AS Numeric(18, 0)), CAST(16.61 AS Numeric(10, 2)), CAST(111.00 AS Numeric(10, 2)), CAST(21180 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2357, 3, CAST(2100 AS Numeric(18, 0)), CAST(18.36 AS Numeric(10, 2)), CAST(122.00 AS Numeric(10, 2)), CAST(22612 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2358, 3, CAST(2300 AS Numeric(18, 0)), CAST(20.12 AS Numeric(10, 2)), CAST(134.00 AS Numeric(10, 2)), CAST(24277 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2359, 3, CAST(2600 AS Numeric(18, 0)), CAST(22.74 AS Numeric(10, 2)), CAST(152.00 AS Numeric(10, 2)), CAST(28072 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2360, 3, CAST(3350 AS Numeric(18, 0)), CAST(29.55 AS Numeric(10, 2)), CAST(197.00 AS Numeric(10, 2)), CAST(36106 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2361, 4, CAST(135 AS Numeric(18, 0)), CAST(0.63 AS Numeric(10, 2)), CAST(5.00 AS Numeric(10, 2)), CAST(5266 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2362, 4, CAST(300 AS Numeric(18, 0)), CAST(1.31 AS Numeric(10, 2)), CAST(10.00 AS Numeric(10, 2)), CAST(6369 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2363, 4, CAST(405 AS Numeric(18, 0)), CAST(1.88 AS Numeric(10, 2)), CAST(15.00 AS Numeric(10, 2)), CAST(7434 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2364, 4, CAST(569 AS Numeric(18, 0)), CAST(2.64 AS Numeric(10, 2)), CAST(21.00 AS Numeric(10, 2)), CAST(7938 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2365, 4, CAST(891 AS Numeric(18, 0)), CAST(4.02 AS Numeric(10, 2)), CAST(32.00 AS Numeric(10, 2)), CAST(8838 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2366, 4, CAST(1068 AS Numeric(18, 0)), CAST(4.76 AS Numeric(10, 2)), CAST(38.00 AS Numeric(10, 2)), CAST(10028 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2367, 4, CAST(1350 AS Numeric(18, 0)), CAST(6.04 AS Numeric(10, 2)), CAST(48.00 AS Numeric(10, 2)), CAST(12042 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2368, 4, CAST(1593 AS Numeric(18, 0)), CAST(7.21 AS Numeric(10, 2)), CAST(58.00 AS Numeric(10, 2)), CAST(14588 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2369, 4, CAST(1905 AS Numeric(18, 0)), CAST(8.59 AS Numeric(10, 2)), CAST(69.00 AS Numeric(10, 2)), CAST(15624 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2370, 4, CAST(2080 AS Numeric(18, 0)), CAST(9.42 AS Numeric(10, 2)), CAST(75.00 AS Numeric(10, 2)), CAST(17743 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2371, 4, CAST(2430 AS Numeric(18, 0)), CAST(10.92 AS Numeric(10, 2)), CAST(87.00 AS Numeric(10, 2)), CAST(19302 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2372, 4, CAST(2608 AS Numeric(18, 0)), CAST(12.08 AS Numeric(10, 2)), CAST(97.00 AS Numeric(10, 2)), CAST(21315 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2373, 4, CAST(2895 AS Numeric(18, 0)), CAST(13.40 AS Numeric(10, 2)), CAST(107.00 AS Numeric(10, 2)), CAST(23610 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2374, 4, CAST(3197 AS Numeric(18, 0)), CAST(14.80 AS Numeric(10, 2)), CAST(118.00 AS Numeric(10, 2)), CAST(25729 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2375, 4, CAST(3474 AS Numeric(18, 0)), CAST(16.13 AS Numeric(10, 2)), CAST(129.00 AS Numeric(10, 2)), CAST(27936 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2376, 5, CAST(135 AS Numeric(18, 0)), CAST(0.63 AS Numeric(10, 2)), CAST(5.00 AS Numeric(10, 2)), CAST(5266 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2377, 5, CAST(300 AS Numeric(18, 0)), CAST(1.31 AS Numeric(10, 2)), CAST(10.00 AS Numeric(10, 2)), CAST(6369 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2378, 5, CAST(405 AS Numeric(18, 0)), CAST(1.88 AS Numeric(10, 2)), CAST(15.00 AS Numeric(10, 2)), CAST(7434 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2379, 5, CAST(569 AS Numeric(18, 0)), CAST(2.64 AS Numeric(10, 2)), CAST(21.00 AS Numeric(10, 2)), CAST(7938 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2380, 5, CAST(891 AS Numeric(18, 0)), CAST(4.02 AS Numeric(10, 2)), CAST(32.00 AS Numeric(10, 2)), CAST(8838 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2381, 5, CAST(1068 AS Numeric(18, 0)), CAST(4.76 AS Numeric(10, 2)), CAST(38.00 AS Numeric(10, 2)), CAST(10028 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2382, 5, CAST(1350 AS Numeric(18, 0)), CAST(6.04 AS Numeric(10, 2)), CAST(48.00 AS Numeric(10, 2)), CAST(12042 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2383, 5, CAST(1593 AS Numeric(18, 0)), CAST(7.21 AS Numeric(10, 2)), CAST(58.00 AS Numeric(10, 2)), CAST(14588 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2384, 5, CAST(1905 AS Numeric(18, 0)), CAST(8.59 AS Numeric(10, 2)), CAST(69.00 AS Numeric(10, 2)), CAST(15624 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2385, 5, CAST(2080 AS Numeric(18, 0)), CAST(9.42 AS Numeric(10, 2)), CAST(75.00 AS Numeric(10, 2)), CAST(17743 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2386, 5, CAST(2430 AS Numeric(18, 0)), CAST(10.92 AS Numeric(10, 2)), CAST(87.00 AS Numeric(10, 2)), CAST(19302 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2387, 5, CAST(2608 AS Numeric(18, 0)), CAST(12.08 AS Numeric(10, 2)), CAST(97.00 AS Numeric(10, 2)), CAST(21315 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2388, 5, CAST(2895 AS Numeric(18, 0)), CAST(13.40 AS Numeric(10, 2)), CAST(107.00 AS Numeric(10, 2)), CAST(23610 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2389, 5, CAST(3197 AS Numeric(18, 0)), CAST(14.80 AS Numeric(10, 2)), CAST(118.00 AS Numeric(10, 2)), CAST(25729 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2390, 5, CAST(3474 AS Numeric(18, 0)), CAST(16.13 AS Numeric(10, 2)), CAST(129.00 AS Numeric(10, 2)), CAST(27936 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2391, 6, CAST(30 AS Numeric(18, 0)), NULL, CAST(3.00 AS Numeric(10, 2)), CAST(4027 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2392, 6, CAST(40 AS Numeric(18, 0)), NULL, CAST(4.00 AS Numeric(10, 2)), CAST(4201 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2393, 6, CAST(50 AS Numeric(18, 0)), NULL, CAST(5.00 AS Numeric(10, 2)), CAST(4656 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2394, 6, CAST(60 AS Numeric(18, 0)), NULL, CAST(6.00 AS Numeric(10, 2)), CAST(4869 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2395, 6, CAST(80 AS Numeric(18, 0)), NULL, CAST(8.00 AS Numeric(10, 2)), CAST(5460 AS Numeric(18, 0)), NULL, NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2396, 6, CAST(100 AS Numeric(18, 0)), NULL, CAST(10.00 AS Numeric(10, 2)), CAST(5982 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2397, 6, CAST(120 AS Numeric(18, 0)), NULL, CAST(12.00 AS Numeric(10, 2)), CAST(6582 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2398, 6, CAST(140 AS Numeric(18, 0)), NULL, CAST(14.00 AS Numeric(10, 2)), CAST(6853 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2399, 6, CAST(180 AS Numeric(18, 0)), NULL, CAST(18.00 AS Numeric(10, 2)), CAST(7589 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2400, 6, CAST(220 AS Numeric(18, 0)), NULL, CAST(22.00 AS Numeric(10, 2)), CAST(7899 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2401, 6, CAST(240 AS Numeric(18, 0)), NULL, CAST(24.00 AS Numeric(10, 2)), CAST(8693 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2402, 6, CAST(280 AS Numeric(18, 0)), NULL, CAST(28.00 AS Numeric(10, 2)), CAST(9051 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2403, 6, CAST(320 AS Numeric(18, 0)), NULL, CAST(32.00 AS Numeric(10, 2)), CAST(9941 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2404, 6, CAST(360 AS Numeric(18, 0)), NULL, CAST(36.00 AS Numeric(10, 2)), CAST(11180 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2405, 6, CAST(500 AS Numeric(18, 0)), NULL, CAST(50.00 AS Numeric(10, 2)), CAST(15565 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2406, 6, CAST(600 AS Numeric(18, 0)), NULL, CAST(60.00 AS Numeric(10, 2)), CAST(18702 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2407, 7, CAST(30 AS Numeric(18, 0)), NULL, CAST(3.00 AS Numeric(10, 2)), CAST(4027 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2408, 7, CAST(40 AS Numeric(18, 0)), NULL, CAST(4.00 AS Numeric(10, 2)), CAST(4201 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2409, 7, CAST(50 AS Numeric(18, 0)), NULL, CAST(5.00 AS Numeric(10, 2)), CAST(4656 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2410, 7, CAST(60 AS Numeric(18, 0)), NULL, CAST(6.00 AS Numeric(10, 2)), CAST(4869 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2411, 7, CAST(80 AS Numeric(18, 0)), NULL, CAST(8.00 AS Numeric(10, 2)), CAST(5460 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2412, 7, CAST(100 AS Numeric(18, 0)), NULL, CAST(10.00 AS Numeric(10, 2)), CAST(5982 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2413, 7, CAST(120 AS Numeric(18, 0)), NULL, CAST(12.00 AS Numeric(10, 2)), CAST(6582 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2414, 7, CAST(140 AS Numeric(18, 0)), NULL, CAST(14.00 AS Numeric(10, 2)), CAST(6853 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2415, 7, CAST(180 AS Numeric(18, 0)), NULL, CAST(18.00 AS Numeric(10, 2)), CAST(7589 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2416, 7, CAST(220 AS Numeric(18, 0)), NULL, CAST(22.00 AS Numeric(10, 2)), CAST(7899 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2417, 7, CAST(240 AS Numeric(18, 0)), NULL, CAST(24.00 AS Numeric(10, 2)), CAST(8693 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2418, 7, CAST(280 AS Numeric(18, 0)), NULL, CAST(28.00 AS Numeric(10, 2)), CAST(9051 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2419, 7, CAST(320 AS Numeric(18, 0)), NULL, CAST(32.00 AS Numeric(10, 2)), CAST(9941 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2420, 7, CAST(360 AS Numeric(18, 0)), NULL, CAST(36.00 AS Numeric(10, 2)), CAST(11180 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2421, 7, CAST(500 AS Numeric(18, 0)), NULL, CAST(50.00 AS Numeric(10, 2)), CAST(15565 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2422, 7, CAST(600 AS Numeric(18, 0)), NULL, CAST(60.00 AS Numeric(10, 2)), CAST(18702 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2423, 8, CAST(30 AS Numeric(18, 0)), NULL, CAST(3.00 AS Numeric(10, 2)), CAST(4027 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2424, 8, CAST(40 AS Numeric(18, 0)), NULL, CAST(4.00 AS Numeric(10, 2)), CAST(4201 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2425, 8, CAST(50 AS Numeric(18, 0)), NULL, CAST(5.00 AS Numeric(10, 2)), CAST(4656 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2426, 8, CAST(60 AS Numeric(18, 0)), NULL, CAST(6.00 AS Numeric(10, 2)), CAST(4869 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2427, 8, CAST(80 AS Numeric(18, 0)), NULL, CAST(8.00 AS Numeric(10, 2)), CAST(5460 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2428, 8, CAST(100 AS Numeric(18, 0)), NULL, CAST(10.00 AS Numeric(10, 2)), CAST(5982 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2429, 8, CAST(120 AS Numeric(18, 0)), NULL, CAST(12.00 AS Numeric(10, 2)), CAST(6582 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2430, 8, CAST(140 AS Numeric(18, 0)), NULL, CAST(14.00 AS Numeric(10, 2)), CAST(6853 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2431, 8, CAST(180 AS Numeric(18, 0)), NULL, CAST(18.00 AS Numeric(10, 2)), CAST(7589 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2432, 8, CAST(220 AS Numeric(18, 0)), NULL, CAST(22.00 AS Numeric(10, 2)), CAST(7899 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2433, 8, CAST(240 AS Numeric(18, 0)), NULL, CAST(24.00 AS Numeric(10, 2)), CAST(8693 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2434, 8, CAST(280 AS Numeric(18, 0)), NULL, CAST(28.00 AS Numeric(10, 2)), CAST(9051 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2435, 8, CAST(320 AS Numeric(18, 0)), NULL, CAST(32.00 AS Numeric(10, 2)), CAST(9941 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2436, 8, CAST(360 AS Numeric(18, 0)), NULL, CAST(36.00 AS Numeric(10, 2)), CAST(11180 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2437, 8, CAST(500 AS Numeric(18, 0)), NULL, CAST(50.00 AS Numeric(10, 2)), CAST(15565 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2438, 8, CAST(600 AS Numeric(18, 0)), NULL, CAST(60.00 AS Numeric(10, 2)), CAST(18702 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2439, 9, CAST(150 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)), CAST(12.00 AS Numeric(10, 2)), CAST(5691 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2440, 9, CAST(225 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), CAST(18.00 AS Numeric(10, 2)), CAST(7014 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2441, 9, CAST(300 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), CAST(24.00 AS Numeric(10, 2)), CAST(7081 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2442, 9, CAST(375 AS Numeric(18, 0)), CAST(2.50 AS Numeric(10, 2)), CAST(30.00 AS Numeric(10, 2)), CAST(8256 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2443, 9, CAST(450 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), CAST(36.00 AS Numeric(10, 2)), CAST(9833 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2444, 9, CAST(525 AS Numeric(18, 0)), CAST(3.50 AS Numeric(10, 2)), CAST(42.00 AS Numeric(10, 2)), CAST(11610 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2445, 9, CAST(600 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), CAST(48.00 AS Numeric(10, 2)), CAST(12024 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2446, 9, CAST(675 AS Numeric(18, 0)), CAST(4.50 AS Numeric(10, 2)), CAST(54.00 AS Numeric(10, 2)), CAST(13360 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2447, 9, CAST(750 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), CAST(60.00 AS Numeric(10, 2)), CAST(14322 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2448, 9, CAST(900 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), CAST(72.00 AS Numeric(10, 2)), CAST(16687 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2449, 9, CAST(1050 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), CAST(84.00 AS Numeric(10, 2)), CAST(19773 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2450, 9, CAST(1200 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), CAST(96.00 AS Numeric(10, 2)), CAST(22151 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2451, 9, CAST(1350 AS Numeric(18, 0)), CAST(9.00 AS Numeric(10, 2)), CAST(108.00 AS Numeric(10, 2)), CAST(22806 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2452, 9, CAST(1500 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), CAST(120.00 AS Numeric(10, 2)), CAST(26212 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2453, 9, CAST(1800 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)), CAST(144.00 AS Numeric(10, 2)), CAST(30073 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2454, 9, CAST(2250 AS Numeric(18, 0)), CAST(15.00 AS Numeric(10, 2)), CAST(180.00 AS Numeric(10, 2)), CAST(37114 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2455, 19, CAST(170 AS Numeric(18, 0)), CAST(0.80 AS Numeric(10, 2)), NULL, CAST(2653 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2456, 19, CAST(270 AS Numeric(18, 0)), CAST(1.40 AS Numeric(10, 2)), NULL, CAST(3765 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2457, 19, CAST(350 AS Numeric(18, 0)), CAST(1.70 AS Numeric(10, 2)), NULL, CAST(4134 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2458, 19, CAST(460 AS Numeric(18, 0)), CAST(2.20 AS Numeric(10, 2)), NULL, CAST(4999 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2459, 19, CAST(550 AS Numeric(18, 0)), CAST(2.70 AS Numeric(10, 2)), NULL, CAST(5554 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2460, 19, CAST(640 AS Numeric(18, 0)), CAST(3.20 AS Numeric(10, 2)), NULL, CAST(6356 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2461, 19, CAST(720 AS Numeric(18, 0)), CAST(3.60 AS Numeric(10, 2)), NULL, CAST(7220 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2462, 19, CAST(870 AS Numeric(18, 0)), CAST(4.40 AS Numeric(10, 2)), NULL, CAST(9195 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2463, 19, CAST(1080 AS Numeric(18, 0)), CAST(5.30 AS Numeric(10, 2)), NULL, CAST(10058 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2464, 19, CAST(1300 AS Numeric(18, 0)), CAST(6.40 AS Numeric(10, 2)), NULL, CAST(11725 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2465, 19, CAST(1580 AS Numeric(18, 0)), CAST(7.90 AS Numeric(10, 2)), NULL, CAST(14441 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2466, 19, CAST(1850 AS Numeric(18, 0)), CAST(9.20 AS Numeric(10, 2)), NULL, CAST(18328 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2467, 19, CAST(2330 AS Numeric(18, 0)), CAST(11.60 AS Numeric(10, 2)), NULL, CAST(22771 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2468, 20, CAST(170 AS Numeric(18, 0)), CAST(1.28 AS Numeric(10, 2)), CAST(8.00 AS Numeric(10, 2)), CAST(2037 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2469, 20, CAST(270 AS Numeric(18, 0)), CAST(2.24 AS Numeric(10, 2)), CAST(14.00 AS Numeric(10, 2)), CAST(2715 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2470, 20, CAST(350 AS Numeric(18, 0)), CAST(2.72 AS Numeric(10, 2)), CAST(17.00 AS Numeric(10, 2)), CAST(3024 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2471, 20, CAST(460 AS Numeric(18, 0)), CAST(3.52 AS Numeric(10, 2)), CAST(22.00 AS Numeric(10, 2)), CAST(3456 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2472, 20, CAST(550 AS Numeric(18, 0)), CAST(4.32 AS Numeric(10, 2)), CAST(27.00 AS Numeric(10, 2)), CAST(3703 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2473, 20, CAST(640 AS Numeric(18, 0)), CAST(5.12 AS Numeric(10, 2)), CAST(32.00 AS Numeric(10, 2)), CAST(4258 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2474, 20, CAST(720 AS Numeric(18, 0)), CAST(5.76 AS Numeric(10, 2)), CAST(36.00 AS Numeric(10, 2)), CAST(4814 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2475, 20, CAST(870 AS Numeric(18, 0)), CAST(7.04 AS Numeric(10, 2)), CAST(44.00 AS Numeric(10, 2)), CAST(5801 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2476, 20, CAST(1080 AS Numeric(18, 0)), CAST(8.48 AS Numeric(10, 2)), CAST(53.00 AS Numeric(10, 2)), CAST(6295 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2477, 20, CAST(1300 AS Numeric(18, 0)), CAST(10.24 AS Numeric(10, 2)), CAST(64.00 AS Numeric(10, 2)), CAST(7467 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2478, 20, CAST(1580 AS Numeric(18, 0)), CAST(12.64 AS Numeric(10, 2)), CAST(79.00 AS Numeric(10, 2)), CAST(8824 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2479, 20, CAST(1850 AS Numeric(18, 0)), CAST(14.72 AS Numeric(10, 2)), CAST(92.00 AS Numeric(10, 2)), CAST(10861 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2480, 20, CAST(2330 AS Numeric(18, 0)), CAST(18.56 AS Numeric(10, 2)), CAST(116.00 AS Numeric(10, 2)), CAST(13391 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2481, 20, CAST(2790 AS Numeric(18, 0)), CAST(22.24 AS Numeric(10, 2)), CAST(139.00 AS Numeric(10, 2)), CAST(17156 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2496, 22, CAST(80 AS Numeric(18, 0)), CAST(0.50 AS Numeric(10, 2)), CAST(5.00 AS Numeric(10, 2)), CAST(3280 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2497, 22, CAST(145 AS Numeric(18, 0)), CAST(0.90 AS Numeric(10, 2)), CAST(9.00 AS Numeric(10, 2)), CAST(3317 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2498, 22, CAST(240 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), CAST(16.00 AS Numeric(10, 2)), CAST(4543 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2499, 22, CAST(300 AS Numeric(18, 0)), CAST(1.90 AS Numeric(10, 2)), CAST(20.00 AS Numeric(10, 2)), CAST(5241 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2500, 22, CAST(395 AS Numeric(18, 0)), CAST(2.40 AS Numeric(10, 2)), CAST(26.00 AS Numeric(10, 2)), CAST(6108 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2501, 22, CAST(475 AS Numeric(18, 0)), CAST(2.90 AS Numeric(10, 2)), CAST(31.00 AS Numeric(10, 2)), CAST(6937 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2502, 22, CAST(560 AS Numeric(18, 0)), CAST(3.50 AS Numeric(10, 2)), CAST(37.00 AS Numeric(10, 2)), CAST(7936 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2503, 22, CAST(625 AS Numeric(18, 0)), CAST(3.90 AS Numeric(10, 2)), CAST(41.00 AS Numeric(10, 2)), CAST(8558 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2504, 22, CAST(760 AS Numeric(18, 0)), CAST(4.80 AS Numeric(10, 2)), CAST(50.00 AS Numeric(10, 2)), CAST(10368 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2505, 22, CAST(925 AS Numeric(18, 0)), CAST(5.80 AS Numeric(10, 2)), CAST(62.00 AS Numeric(10, 2)), CAST(11593 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2506, 22, CAST(1120 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), CAST(74.00 AS Numeric(10, 2)), CAST(14157 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2507, 22, CAST(1380 AS Numeric(18, 0)), CAST(8.60 AS Numeric(10, 2)), CAST(91.00 AS Numeric(10, 2)), CAST(17626 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2508, 22, CAST(1600 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), CAST(107.00 AS Numeric(10, 2)), CAST(19850 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2509, 22, CAST(2000 AS Numeric(18, 0)), CAST(12.50 AS Numeric(10, 2)), CAST(135.00 AS Numeric(10, 2)), CAST(23979 AS Numeric(18, 0)), NULL, NULL)
GO
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2510, 22, CAST(2400 AS Numeric(18, 0)), CAST(15.00 AS Numeric(10, 2)), CAST(162.00 AS Numeric(10, 2)), CAST(30256 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2511, 23, CAST(150 AS Numeric(18, 0)), CAST(1.00 AS Numeric(10, 2)), NULL, CAST(2306 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2512, 23, CAST(225 AS Numeric(18, 0)), CAST(1.50 AS Numeric(10, 2)), NULL, CAST(2781 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2513, 23, CAST(300 AS Numeric(18, 0)), CAST(2.00 AS Numeric(10, 2)), NULL, CAST(3458 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2514, 23, CAST(375 AS Numeric(18, 0)), CAST(2.50 AS Numeric(10, 2)), NULL, CAST(4145 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2515, 23, CAST(450 AS Numeric(18, 0)), CAST(3.00 AS Numeric(10, 2)), NULL, CAST(4822 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2516, 23, CAST(525 AS Numeric(18, 0)), CAST(3.50 AS Numeric(10, 2)), NULL, CAST(5509 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2517, 23, CAST(600 AS Numeric(18, 0)), CAST(4.00 AS Numeric(10, 2)), NULL, CAST(6186 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2518, 23, CAST(675 AS Numeric(18, 0)), CAST(4.50 AS Numeric(10, 2)), NULL, CAST(6864 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2519, 23, CAST(750 AS Numeric(18, 0)), CAST(5.00 AS Numeric(10, 2)), NULL, CAST(7550 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2520, 23, CAST(900 AS Numeric(18, 0)), CAST(6.00 AS Numeric(10, 2)), NULL, CAST(8914 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2521, 23, CAST(1050 AS Numeric(18, 0)), CAST(7.00 AS Numeric(10, 2)), NULL, CAST(10278 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2522, 23, CAST(1200 AS Numeric(18, 0)), CAST(8.00 AS Numeric(10, 2)), NULL, CAST(11642 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2523, 23, CAST(1350 AS Numeric(18, 0)), CAST(9.00 AS Numeric(10, 2)), NULL, CAST(12998 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2524, 23, CAST(1500 AS Numeric(18, 0)), CAST(10.00 AS Numeric(10, 2)), NULL, CAST(14362 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2525, 23, CAST(1800 AS Numeric(18, 0)), CAST(12.00 AS Numeric(10, 2)), NULL, CAST(17090 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2542, 26, NULL, NULL, NULL, CAST(1830 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2543, 27, NULL, NULL, NULL, CAST(3784 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2545, 29, NULL, NULL, NULL, CAST(3718 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2548, 25, NULL, NULL, NULL, CAST(625 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2550, 28, NULL, NULL, NULL, CAST(2253 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2596, 30, CAST(10 AS Numeric(18, 0)), NULL, CAST(200.00 AS Numeric(10, 2)), CAST(624 AS Numeric(18, 0)), NULL, N'4,9x13')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2597, 30, CAST(20 AS Numeric(18, 0)), NULL, CAST(155.00 AS Numeric(10, 2)), CAST(624 AS Numeric(18, 0)), NULL, N'4,9x13')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2598, 30, CAST(30 AS Numeric(18, 0)), NULL, CAST(120.00 AS Numeric(10, 2)), CAST(624 AS Numeric(18, 0)), NULL, N'5,3x15,6')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2599, 30, CAST(40 AS Numeric(18, 0)), NULL, CAST(100.00 AS Numeric(10, 2)), CAST(624 AS Numeric(18, 0)), NULL, N'5,3x15,6')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2600, 31, CAST(10 AS Numeric(18, 0)), NULL, CAST(196.00 AS Numeric(10, 2)), CAST(167 AS Numeric(18, 0)), NULL, N'5x13')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2601, 31, CAST(24 AS Numeric(18, 0)), NULL, CAST(110.00 AS Numeric(10, 2)), CAST(167 AS Numeric(18, 0)), NULL, N'5x13')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2602, 31, CAST(30 AS Numeric(18, 0)), NULL, CAST(96.00 AS Numeric(10, 2)), CAST(167 AS Numeric(18, 0)), NULL, N'5,5x15')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2603, 31, CAST(40 AS Numeric(18, 0)), NULL, CAST(94.00 AS Numeric(10, 2)), CAST(167 AS Numeric(18, 0)), NULL, N'5,5x15')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2604, 32, CAST(10 AS Numeric(18, 0)), NULL, CAST(196.00 AS Numeric(10, 2)), CAST(123 AS Numeric(18, 0)), NULL, N'4.5x11')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2605, 32, CAST(16 AS Numeric(18, 0)), NULL, CAST(110.00 AS Numeric(10, 2)), CAST(123 AS Numeric(18, 0)), NULL, N'4.5x11')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2606, 32, CAST(24 AS Numeric(18, 0)), NULL, CAST(96.00 AS Numeric(10, 2)), CAST(123 AS Numeric(18, 0)), NULL, N'4.5x11')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2607, 32, CAST(30 AS Numeric(18, 0)), NULL, CAST(94.00 AS Numeric(10, 2)), CAST(123 AS Numeric(18, 0)), NULL, N'4.5x11')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2608, 33, CAST(11 AS Numeric(18, 0)), NULL, CAST(196.00 AS Numeric(10, 2)), CAST(343 AS Numeric(18, 0)), NULL, N'5.1x8')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2609, 33, CAST(17 AS Numeric(18, 0)), NULL, CAST(110.00 AS Numeric(10, 2)), CAST(343 AS Numeric(18, 0)), NULL, N'5.1x8')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2610, 33, CAST(25 AS Numeric(18, 0)), NULL, CAST(96.00 AS Numeric(10, 2)), CAST(343 AS Numeric(18, 0)), NULL, N'5.1x8')
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2611, 36, NULL, NULL, NULL, CAST(1438 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2612, 37, NULL, NULL, NULL, CAST(1000 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2613, 38, NULL, NULL, NULL, CAST(5200 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2614, 39, NULL, NULL, NULL, CAST(6600 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2615, 40, NULL, NULL, NULL, CAST(4200 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2616, 41, NULL, NULL, NULL, CAST(3600 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2617, 42, NULL, NULL, NULL, CAST(4810 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2618, 43, NULL, NULL, NULL, CAST(9040 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2619, 44, NULL, NULL, NULL, CAST(27167 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2620, 34, NULL, NULL, NULL, CAST(4070 AS Numeric(18, 0)), NULL, NULL)
INSERT [dbo].[ProductOptions] ([productOptions_id], [product_id], [power], [layingArea], [wireLength], [price], [matLength], [size]) VALUES (2621, 35, NULL, NULL, NULL, CAST(2645 AS Numeric(18, 0)), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProductOptions] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (1, N'HEMSTEDT DH 150 Вт/м кв', 1, 1, N'Маты DH  используются, когда необходимо минимально поднять уровень пола. Монтаж производится на готовую стяжку под напольное покрытие в клеевой раствор или самовыравнивающую смесь. Сетка мата имеет клеевую основу и легко приклеивается к стяжке, что упрощает монтаж. За счет безмуфтового соединения греющего и питающего кабеля (уникальной технологии лазерной спайки Hemstadt), кабель абсолютно герметичен, в отличии от кабелей с муфтой, абсолютно не подвержен коррозии и окислению и дальнейшему перегоранию в месте муфторования,  что обеспечивает долговечность работы на десятилетия. Мат утапливается в клеевой раствор, не повышая высоту пола. Перед залитием стяжки рекомендуется укладывать теплоизолятор. Имеет три преимущества над кабелем для укладки в стяжку: 1) более быстрый прогрев пола (незначительно экономичнее); 2) более простой монтаж; 3) имеет более высокую температуру плавления внутренней изоляции.', N'Нагревательный мат DH 150 Вт/м кв. для укладки в плиточный клей', 1, 1, N'Германия', 11, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (2, N'HEMSTEDT DR 12,5 Вт/м', 1, 1, N'Тонкий кабель DR используются, когда необходимо минимально поднять уровень пола. Также в случае необходимости получить более высокую либо более низкую удельную мощность Вт/м кв. А так же, в случае когда помещение не является прямоугольным, например полукруглый эркер или угловая ванная. Т.к. кабелем можно выстелить любую геометрию пола, в отличии от прямоугольных матов. Так же, кабель на треть дешевле в сравнении с матами аналогичной удельной мощности. Из недостатков, только неудобство монтажа, т.к. кабель приходится крепить самостоятельно на монтажную ленту. За счет безмуфтового соединения греющего и питающего кабеля (уникальной технологии лазерной спайки Hemstadt), кабель абсолютно герметичен, в отличии от кабелей с муфтой, абсолютно не подвержен коррозии и окислению и дальнейшему перегоранию в месте муфторования,  что обеспечивает долговечность работы на десятилетия. Монтаж производится на готовую стяжку под напольное покрытие, на монтажную ленту, в клеевой раствор или самовыравнивающую смесь, а так же непосредственно в стяжку.  Кабель DR имеет универсальное назначение. За счет различного шага укладки этот кабель можно использовать как для полноценного отопления (до 250 Вт/м.кв.), так и для укладки под деревянные напольные покрытия (100 Вт/м.кв.). Кабель утапливается в клеевой раствор, не повышая высоту пола. Перед залитием стяжки рекомендуется укладывать теплоизолятор. Имеет три преимущества над кабелем для укладки в стяжку: 1) более быстрый прогрев пола (незначительно экономичнее); 2) более простой монтаж; 3) имеет более высокую температуру плавления внутренней изоляции.', N'Тонкий кабель DR 12,5 Вт/м для укладки в плиточный клей', 1, 1, N'Германия', 11, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (3, N'HEMSTEDT BR-IM 17 Вт/м', 1, 1, N'Кабель BR-IM для теплого пола используются для укладки в стяжку 3-8 см. Они также идеально подходят для полного обогрева помещений, в системах снеготаяния на открытых площадках, в системах антиоблединения на крышах, для обогрева труб и грунта. Перед укладкой кабеля необходимо укладывать теплоизолятор (рекомендуется экструдированный пенополистирол от 2 см, в крайнем случае подложку для ламината 5 мм). Кабель не рекомендуется укладывать напрямую на теплоизолятор. Теплоизолятор необходимо залить черновой стяжкой, в крайнем случае покласть сверху металлическую сетку (армированную или просечно-вытяжную). В случае укладки сетки необходимо оставить пространство между кабелем и теплоизолятором, чтобы при залитии жидким раствором для стяжки заполнить данное пространство смесью. Стяжка должна быть с минимальным количеством воздушных пустот.', N'Двужильный кабель BR-IM 17 Вт/м для укладки в стяжку', 1, 1, N'Германия', 12, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (4, N'HEMSTEDT BRF-IM 27 Вт/м', 1, 1, N'Кабель BRF-IM используется для обогрева водостоков, открытых площадей, балконов. Для обогрева открытых площадей рекомендуется укладывать шагом 7.5 см (10 см при наличии теплоизолятора). Для более быстрого нагрева рекомендуется укладывать как можно ближе к поверхности. При укладки в стяжку на улице необходимо добавлять пластификатор. В водостоки (трубы) диаметром 100-120 мм кабель укладывается в 2 нити, меньшим диметром в 1 нить.', N'Двужильный кабель BRF-IM 27 Вт/м для обогрева водостоков, кровли, открытых площадей и балконов', 1, 3, N'Германия', NULL, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (5, N'HEMSTEDT BRF-IM 27 Вт/м', 1, 1, N'Кабель BRF-IM используется для обогрева водостоков, открытых площадей, балконов. Для обогрева открытых площадей рекомендуется укладывать шагом 7.5 см (10 см при наличии теплоизолятора). Для более быстрого нагрева рекомендуется укладывать как можно ближе к поверхности. При укладки в стяжку на улице необходимо добавлять пластификатор. В водостоки (трубы) диаметром 100-120 мм кабель укладывается в 2 нити, меньшим диметром в 1 нить.', N'Двужильный кабель BRF-IM 27 Вт/м для обогрева водостоков, кровли, открытых площадей и балконов', 1, 4, N'Германия', NULL, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (6, N'HEMSTEDT DAS 30 Вт/м', 1, 1, N'Кабель DAS со встроенным термостатом для обогрева крыш, водостоков и труб большого диаметра. Биметаллический термостат включает кабель при понижении температуры ниже 5 С на датчике, выключет при повышении выже 15 С. В водостоки (трубы) диаметром 100-120 мм кабель укладывается в 2 нити, меньшим диметром в 1 нить. При обогреве трубы ее необходимо теплоизолировать. Толщина телоизоляции должна быть не меньше радиуса обогреваемой трубы.', N'Двужильный кабель DAS 30 Вт/м со встроенным термостатом и вилкой для обогрева труб и водостоков.', 1, 3, N'Германия', NULL, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (7, N'HEMSTEDT DAS 30 Вт/м', 1, 1, N'Кабель DAS со встроенным термостатом для обогрева крыш, водостоков и труб большого диаметра. Биметаллический термостат включает кабель при понижении температуры ниже 5 С на датчике, выключет при повышении выже 15 С. В водостоки (трубы) диаметром 100-120 мм кабель укладывается в 2 нити, меньшим диметром в 1 нить. При обогреве трубы ее необходимо теплоизолировать. Толщина телоизоляции должна быть не меньше радиуса обогреваемой трубы.', N'Двужильный кабель DAS 30 Вт/м со встроенным термостатом и вилкой для обогрева труб и водостоков.', 1, 5, N'Германия', NULL, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (8, N'HEMSTEDT FS 10 Вт/м', 1, 1, N'Кабель FS со встроенным термостатом для обогрева труб и водопроводов. Биметаллический термостат включает кабель при пониженни температуры ниже 5 С на датчике, выключает при повышении выше 15 С. При обогреве трубы необходимо ее теплоизолировать. Толщина теплоизолятора должна быть не меньше радиуса обогреваемой трубы.', N'Кабель двужильный FS 10 Вт/м со встроенным термостатом и вилкой для оборева труб', 1, 5, N'Германия', NULL, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (9, N'HEMSTEDT DI SI H 150 Вт/м кв', 1, 1, N'Маты Di Si H  используются, когда необходимо минимально поднять уровень пола. Монтаж производится на готовую стяжку под напольное покрытие в клеевой раствор или самовыравнивающую смесь. Сетка мата в отличии от матов серии DH не имеет клеевую основу, а так же более короткий питающий кабель 2,5 м. За счет безмуфтового соединения греющего и питающего кабеля (уникальной технологии лазерной спайки Hemstadt), кабель абсолютно герметичен, в отличии от кабелей с муфтой, абсолютно не подвержен коррозии и окислению и дальнейшему перегоранию в месте муфторования,  что обеспечивает долговечность работы на десятилетия. Мат утапливается в клеевой раствор, не повышая высоту пола. Перед залитием стяжки рекомендуется укладывать теплоизолятор. Имеет три преимущества над кабелем для укладки в стяжку: 1) более быстрый прогрев пола (незначительно экономичнее); 2) более простой монтаж; 3) имеет более высокую температуру плавления внутренней изоляции.', N'Нагревательный мат DI SI H 150 Вт/м кв. для укладки в плиточный клей ', 1, 1, N'Германия', 11, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (10, N'Fenix Ultra CM 150 Вт/м кв', 1, 2, N'Ультратонкий нагревательный мат для укладки в плиточный клей для плитки или самовыравнивающую смесь. За счет толщины кабеля 2.7 мм необходимо в 1.5 раза меньше плиточного клея, чем при укладке стандартного мата. Монтируется на готовую стяжку, утапливается в клеевой раствор для плитки. Рекомендется, чтобы плиточный клей имел минимальное количество воздушных пустот.', N'Ультратонкий нагревательный мат двужильный Fenix Ultra CM 150 Вт/м кв. для укладки под плитку', 1, 1, N'Чехия', 11, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (11, N'Fenix LDTS M 160 Вт/м кв', 1, 2, N'Нагревательный мат для укладки под плитку. Монтируется на готовую стяжку, утапливается в клеевой раствор для плитки или самовырвнивающую смесь. Рекомендется, чтобы плиточный клей имел минимальное количество воздушных пустот.', N'Нагревательный мат Fenix LDTS M 160 Вт/м кв. для укладки под плитку (метрическая линейка, импортируем эксклюзивно)', 1, 1, N'Чехия', 11, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (12, N'Fenix LDTS 160 Вт/м кв', 1, 2, N'Нагревательный мат для укладки под плитку. Монтируется на готовую стяжку, утапливается в клеевой раствор для плитки или самовырвнивающую смесь. Рекомендутся, чтобы плиточный клей имел минимальное количество воздушных пустот. Данная линейка матов является неметрической, что позволяет подобрать маты наиболее близкие по площади к желаемой площади обогрева. Например 5,1 кв м, или 8,8 кв м', N'Нагревательный мат Fenix LDTS M 160 Вт/м кв. для укладки под плитку ', 1, 1, N'Чехия', 11, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (13, N'Fenix ADSV 10 Вт/м', 1, 2, N'Тонкий кабель для укладки под плитку. Монтаж производится на готовую стяжку под напольное покрытие в клеевой раствор или самовыравнивающую смесь. За счет различного шага укладки этот кабель можно использовать как для полноценного отопления (до 250 Вт/м.кв.), так и для укладки под деревянные напольные покрытия (100 Вт/м.кв.). Кабель утапливается в клеевой раствор, не повышая высоту пола. Перед залитием стяжки рекомендуется укладывать теплоизолятор. Имеет два преимущества над кабелем для укладки в стяжку: 1) более быстрый прогрев пола (незначительно экономичнее); 2) более простой монтаж. ', N'Тонкий нагревательный кабель двужильный Fenix ADSV 10 Вт/м для укладки в плиточный клей (импортируем эксклюзивно)', 1, 1, N'Чехия', 11, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (14, N'Fenix ADSV 18 Вт/м', 1, 2, N'Кабель для теплого пола используются для укладки в стяжку 3-8 см. Перед укладкой кабеля необходимо укладывать теплоизолятор (рекомендуется экструдированный пенополистирол от 2 см, в крайнем случае подложку для ламината 5 мм). Кабель не рекомендуется укладывать напрямую на теплоизолятор. Теплоизолятор необходимо залить черновой стяжкой, в крайнем случае покласть сверху металлическую сетку (армированную или просечно-вытяжную). В случае укладки сетки необходимо оставить пространство между кабелем и теплоизолятором, чтобы при залитии жидким раствором для стяжки заполнить данное пространство смесью. Стяжка должна быть с минимальным количеством воздушных пустот.', N'Универсальный нагревательный кабель двужильный Fenix ADSV 18 Вт/м для укладки в стяжку ', 1, 1, N'Чехия', 12, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (16, N'Fenix', 1, 2, N'Алюминиевые маты используются для укладки под ламинат, паркетную доску, линолеум и ковролин. За счет фольгированного основания тепло равномерно распределяется вдоль поверхности. Мощность 140 Вт/м не позволяет осуществлять быстрый нагрев. При использовании с паркетной доской необходимо поставить максимальный предел температуры на термостате 24 С, а также не нагревать (охлаждать) паркетную доску более, чем на 2 С за 12 часов. ', N'Алюминиевые маты Fenix для укладки под ламинат и паркетную доску (монтаж на подложку, импортируем эксклюзивно)', 1, 1, N'Чехия', 13, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (17, N'Fenix ADPSV 30 Вт/м', 1, 2, N'Ультратонкий нагревательный мат для укладки в плиточный клей для плитки или самовыравнивающую смесь. За счет толщины кабеля 2.7 мм необходимо в 1.5 раза меньше плиточного клея, чем при укладке стандартного мата. Монтируется на готовую стяжку, утапливается в клеевой раствор для плитки. Рекомендется, чтобы плиточный клей имел минимальное количество воздушных пустот.', N'Нагревательный кабель двужильный ADPSV 30 Вт/м для наружного обогрева (обогрев кровли, водостоков, наружных площадей, импортируем эксклюзивно)', 1, 3, N'Чехия', NULL, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (18, N'Fenix ADPSV 30 Вт/м', 1, 2, N'Ультратонкий нагревательный мат для укладки в плиточный клей для плитки или самовыравнивающую смесь. За счет толщины кабеля 2.7 мм необходимо в 1.5 раза меньше плиточного клея, чем при укладке стандартного мата. Монтируется на готовую стяжку, утапливается в клеевой раствор для плитки. Рекомендется, чтобы плиточный клей имел минимальное количество воздушных пустот.', N'Нагревательный кабель двужильный ADPSV 30 Вт/м для наружного обогрева (обогрев кровли, водостоков, наружных площадей, импортируем эксклюзивно)', 1, 4, N'Чехия', NULL, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (19, N'IN-THERM 200 Вт/м кв', 1, 3, N'Нагревательный мат для укладки под плитку. Монтируется на готовую стяжку, утапливается в клеевой раствор для плитки или самовырвнивающую смесь. Рекомендется, чтобы плиточный клей имел минимальное количество воздушных пустот.', N'Нагревательный мат двужильный IN-THERM 200 Вт/м кв. (импортируем эксклюзивно)', 1, 1, N'Чехия', 11, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (20, N'IN-THERM 20 Вт/м', 1, 3, N'Нагревательный мат для укладки под плитку. Монтируется на готовую стяжку, утапливается в клеевой раствор для плитки или самовырвнивающую смесь. Рекомендется, чтобы плиточный клей имел минимальное количество воздушных пустот.', N'Универсальный нагревательный кабель двужильный IN-THERM 20 Вт/м кв. (импортируем эксклюзивно)', 1, 1, N'Чехия', 11, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (22, N'IN-THERM ECO 160 Вт/м кв', 1, 3, N'Нагревательные маты IN-THERM ECO в сравнении снагревательными матами IN-THERM имеют более большую площадь на подобные единицы (+10%) и более низкую стоимость (-5%). Средняя экономия на 1 м кв. составляет около 15%.', N'Нагревательный мат двужильный IN-THERM ECO 160 Вт/м кв. для укладки под плитку в плиточный клей', 1, 1, N'Чехия', 11, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (23, N'IN-THERM AFMAT 150 Вт/м кв', 2, 3, N'', N'Алюминиевые маты IN-THERM AFMAT 150 Вт/м кв', 1, 1, N'Китай', 13, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (25, N'IN-THERM RTC 70', 1, 3, N'Терморегулятор Ин-терм РТС 70 с механическим управлением температуры поверхности пола. Регулировка происходит от 10 до 40 град. Кратность шкалы делений составляет 5 град. Терморегулятор можно применять как нагревательному кабелю для теплого пола любого производителя. А так же применим к нагревательной углеродной или карбоновой инфракрасной пленке. Механический терморегулятор In_therm 70 имеет в комплекте датчик пола, длина провода 3 м. И инструкцию подключения на русском языке. Очень простое подключение и не менее сложное управление.', N'IN-THERM RTC 70', 1, 2, N'Китай', NULL, 625)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (26, N'IN-THERM E 51', 1, 3, N'Программируемый терморегулятор E51.716, имеющей систему управления качеством ISO9001:2000, и получившей сертификат СЕ для собственной продукции. Терморегулятор E51.716 снабжён большим жидкокристаллическим дисплеем. На передней панели удобно расположены кнопки управления с помощью которых можно устанавливать желаемую температуру, переходить в режим расширенных настроек или в режим программирования разных температурных периодов по дням недели и времени суток. Также имеется кнопка включения/выключения прибора. Терморегулятор предназначен для управления температурой нагрева тёплого пола (выносной термодатчик на проводе). Так же есть возможность контролировать только температуру воздуха в помещении (внутренний термодатчик) или настроить совместную работу обоих датчиков. Мы, чаще всего, используем эту модель для управления греющим потолком на основе низкотемпературных потолочных ИК ПлЭН. Корпус терморегулятора предполагает монтаж для внутренней проводки и встраивается в стандартную монтажную коробку.', N'IN-THERM E 51', 1, 2, N'Китай', NULL, 1830)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (27, N'IN-THERM PWT 002', 1, 3, N'Терморегулятор IN-THERM PWT 002 WIFI позволяет управлять, настраивать и контролировать температуру со смартфона в любом месте, где есть наличие интернета (Wi-Fi, 3G, LTE). Бесплатное приложение на iOS и Android. К приложению можно подключить несколько терморегуляторов. Подключается при наличии домашнего Wi-Fi. Большой графический дисплей с подсветкой и кнопками управления, встроенное меню. Терморегулятор с WIFI позволяет программировать следующие режимы: постоянное поддержание комфортной температуры, суточный цикл, недельный цикл. Наличие блокировки клавиш (защита от детей). Режим управления питанием после отключения электроэнергии. Возможны три режима контроля температуры: только по датчику пола, только по датчику воздуха, оба датчика. ', N'IN-THERM RTC 72', 1, 2, N'Китай', NULL, 3784)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (28, N'IN-THERM E 91', 1, 3, N'Это программируемый сенсорный прибор, который контролирует заданные температурные параметры в помещениях и обеспечивает их поддержание. Прибор китайского производства, сертифицирован для использования в РФ.Прибор служит для автоматического регулирования температурных параметров в помещениях с электрическими системами отопления типа «греющий потолок» и/или «теплый пол». Терморегулятор Е 91.716 для систем теплого пола снабжен выносным датчиком температуры. Воздушный датчик для работы с греющим потолком и другими обогревателями встроен в корпус устройства. Е 91.716 встраиваемый компактный прибор, который монтируется и использованием стандартной коробки типа К-201 или УХЛ4. Габариты устройства 86 х 90 х 43 мм, что делает его малозаметным в любом интерьере. При необходимости можно выполнить накладной монтаж (используется накладная коробка RTC, MENRED). Программируемый терморегулятор Е 91.716 оснащен удобным ЖК-дисплеем на сенсорном управлении. На экране отображаются текущие параметры функционирования прибора, календарь и время. Устройство рассчитано на 3 режима работы: автоматический, ручной или комфортный.', N'IN-THERM RTC 73', 1, 2, N'Китай', NULL, 2253)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (29, N'WARM LIFE', 1, 5, N'Терморегулятор WarmLife программируемый с сенсорным ЖК-дисплеем и двумя датчиками применяется для автоматического поддержания температуры теплого пола в диапазоне от +5 °С до +40 °С. Максимальная мощность нагрузки составляет 3,5 кВт. <br>На передней панели терморегулятора WarmLife располагается большой информативный сенсорный ЖК-дисплей.<br>Работать терморегулятор может в трех режимах: ручном, программируемом и комфортном. Программировать терморегулятор можно на каждый день и неделю, используя шесть временных интервалов. Также имеются два дополнительных режима работы: «Антизамерзание» (актуален для загородных домов) и «Отпуск». <br>В терморегуляторе имеется независимый элемент питания для сохранения настроек. После отключения и включения электропитания терморегулятор автоматически включится в режим работы подогрева теплого пола, который был ранее задан пользователем.<br>Для определения температуры используется выносной датчик температуры (10 кОм), который размещается непосредственно в теплом полу. Длина провода датчика температуры 3 метра. <br>Терморегулятор WarmLife предназначен для стандартного скрытого монтажа в стенной коробке диаметром 65 мм.', N'IN-THERM RTC 74', 1, 2, N'Китай', NULL, 3718)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (30, N'ELTRACE TRACECO', 1, 6, N'Кабель используется для обогрева крыш, труб и водостоков. Самрег. кабель меняет локально мощность в зависимости от температуры. Рекомендуется использовать вместе с термостатом. В водостоки диаметром 100-120 мм укладывается кабель 40 Вм. В водостоки меньшим диаметром укладывается кабель 30 Вт/м. Для водопроводных труб используется кабель 10-20 Вт/м.', N'Саморегулируемый кабель экранированный ELTRACE', 1, 3, N'Франция', NULL, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (31, N'IN-THERM SRL', 1, 3, N'Кабель используется для обогрева крыш, труб и водостоков. Самрег. кабель меняет локально мощность в зависимости от температуры. Рекомендуется использовать вместе с термостатом. В водостоки диаметром 100-120 мм укладывается кабель 40 Вм. В водостоки меньшим диаметром укладывается кабель 30 Вт/м. Для водопроводных труб используется кабель 10-20 Вт/м.', N'Саморегулируемый кабель экранированный IN-THERM', 1, 3, N'Корея', NULL, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (32, N'IN-THERM SRL', 1, 3, N'Кабель используется для обогрева крыш, труб и водостоков. Самрег. кабель меняет локально мощность в зависимости от температуры. Рекомендуется использовать вместе с термостатом. В водостоки диаметром 100-120 мм укладывается кабель 40 Вм. В водостоки меньшим диаметром укладывается кабель 30 Вт/м. Для водопроводных труб используется кабель 10-20 Вт/м.', N'Саморегулируемый кабель экранированный IN-THERM', 1, 5, N'Корея', NULL, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (33, N'IN-THERM HTM2-CT', 1, 3, N'Кабель используется для обогрева крыш, труб и водостоков. Самрег. кабель меняет локально мощность в зависимости от температуры. Рекомендуется использовать вместе с термостатом. В водостоки диаметром 100-120 мм укладывается кабель 40 Вм. В водостоки меньшим диаметром укладывается кабель 30 Вт/м. Для водопроводных труб используется кабель 10-20 Вт/м.', N'Саморегулируемый кабель экранированный IN-THERM', 1, 5, N'Корея', NULL, NULL)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (34, N'NeoClima NCTR-55E', 2, 7, N'Цифровой программируемый терморегулятор NEOCLIMA NCTR-55E с жидкокристаллическим дисплеем, предназначен для использования совместно с электрическими тёплыми полами. Контролирует температуру покрытия пола при помощи датчика NTC и, сравнивая её с заданной пользователем температурой – управляет обогревом помещения в автоматическом режиме. Прост в использовании и удобен в управлении. Терморегулятор NEOCLIMA NCTR-55E может управлять нагревателем, электрическим тёплым полом из резистивного кабеля, электрическим тёплым полом из инфракрасной тепловой плёнки, электрическим тёплым полом из карбоновых и углеродных нагревательных элементов. Может использоваться с любыми видами электрических тёплых полов. Встроена функция «Антизаморозка» - режим, позволяющий автоматически включать нагрев при падении температуры в помещении ниже 5°C .Сохраняет память настроек при отключении питания. Программируется по следующим сценариям: 4 режима работы в день, недельные интервалы: 5/2, 6/1, 7. В терморегуляторе NEOCLIMA NCTR-55E встроена функция блокировки кнопок от случайного включения.', N'NeoClima NCTR-55E', 2, 2, N'Россия', NULL, 4070)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (35, N'NeoClima NCTR-20CM', 3, 7, N'Цифровой программируемый терморегулятор NEOCLIMA NCTR-20CM с жидкокристаллическим дисплеем и механической регулировкой настроек, предназначен для использования совместно с электрическими тёплыми полами. Контролирует температуру покрытия пола при помощи датчика температуры поверхности пола и, сравнивая её с заданной пользователем температурой – управляет обогревом помещения в автоматическом режиме. Прост в использовании и удобен в управлении. Терморегулятор NEOCLIMA NCTR-20CM может управлять нагревателем, электрическим тёплым полом из резистивного кабеля, электрическим тёплым полом из инфракрасной тепловой плёнки, электрическим тёплым полом из карбоновых и углеродных нагревательных элементов. Может использоваться с любыми видами электрических тёплых полов.', N'NeoClima NCTR-20CM', 3, 2, N'Россия', NULL, 2645)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (36, N'Eberle RTR-E 6121', 1, 8, N'Новинка - последнее 6-е поколение терморегулятора. Надежный механический терморегулятор настенного (накладного) типа. Применяется для управления электрическим обогревателями, конвекторами и другими система отопления. Диапазон регулирования температуры: +5...+30 °C.Термостат имеет встроенный в корпус датчик температуры. Поэтому во избежании некорректного замера показаний, рекомендуется размещать прибор так, чтобы на него не попадали прямые солнечные лучи, не воздействовали сквозняки или источники тепла / холода. Кроме этого должно быть обеспечено свободное движение воздуха вокруг термостата, т.е. нельзя прятать терморегулятор за мебелью.Необходимая температура воздуха в помещении задается с помощью колесика. Включение / отключение прибора осуществляется с помощью кнопки на корпусе термостата.Терморегулятор можно использовать во влажных помещениях, при этом допустимый уровень влажности должен составлять не более 95% (при наличии постоянной конденсации в помещении использование прибора может быть опасно).', N'Eberle RTR-E 6121', 1, 2, N'Германия', NULL, 1438)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (37, N'Eberle RTR-E 3563', 1, 8, N'Терморегулятор EBERLE RTR-E 3563 представляет собой комнатный электромеханический термостат с кнопкой Вкл/Выкл. Он используется в качестве автоматического регулятора температуры воздуха в различных помещениях, подключается к инфракрасным обогревателям и другим электрическим системам отопления. Данный комнатный термостат легко подключается и им просто пользоваться. Необходимая температура воздуха в помещении задается с помощью колесика в диапазоне от +5 до +30 °С. К терморегулятору EBERLE RTR-E 3563 можно подключить несколько обогревателей суммарной мощностью не более 2,5 кВт. Его можно использовать во влажных помещениях при влажности воздуха не более 95%, конденсация не допускается.', N'Eberle RTR-E 3563', 1, 2, N'Германия', NULL, 1000)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (38, N'Eberle DTR -E 3102', 1, 8, N'Терморегулятор-датчик для систем снеготаяния EBERLE DTRE 3102 используется для отопления водостоков. Диапазон критической температуры установлен двумя контроллерами, обеспечивающими отопление только в случае возможного замораживания. Первый (синяя шкала) выключающий (+20...-20°C) – при падении температуры ниже заданного значения контакт расцепляет, второй (красная шкала) включающий (+25...0°C) – при  падении температуры ниже заданного значения контакт сцепляет. Таким образом температурный интервал можно настроить «От – До» (например, от -10°C до +5°C), в котором присоединенный прибор (например, нагревательный кабель) остается под напряжением. ', N'Eberle DTR -E 3102', 1, 2, N'Германия', NULL, 5200)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (39, N'Eberle ITR 3', 1, 8, N'Терморегулятор EBERLE ITR-3 528 800 — используется для управления температурным режимом производственных помещений, распределительных щитов и крыш, а также для защиты трубопроводов от промерзания. Диапазон управления температурой 0 — 60°С. Терморегулятор монтируется в боксах на DIN-рейку. Работает в режиме обогрев и охлаждение.
Параметры необходимой температуры задаются регулирующим диском, на котором можно ограничить диапазон и заблокировать прибор. На корпусе отображается индикатор состояния. Максимальная возможная длина кабеля датчика составляет 50 м ', N'Eberle ITR 3', 1, 2, N'Германия', NULL, 6600)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (40, N'Eberle FRe 525 31', 1, 8, N'Термостат с датчиком пола, предназначен для настенного монтажа в жилых помещениях для регулировки прямого и инфракрасного отопления, а также в местах, где требуется использование телеметрического датчика.', N'Eberle FRe 525 31', 1, 2, N'Германия', NULL, 4200)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (41, N'Eberle FRe 525 22', 1, 8, N'Устройство представляет собой терморегулятор прямого напольного отопления с выносным датчиком температуры длиной 4 метра. Благодаря скрытому монтажу прибор не изменит интерьер любого, даже самого изысканного помещения. Отличительные особенности: индикация режима, возможность подключения внешнего таймера, встроенный (скрытый) монтаж, возможность подключения дополнительного датчика.', N'Eberle FRe 525 22', 1, 2, N'Германия', NULL, 3600)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (42, N'Eberle F2A-50', 1, 8, N'Eberle Fre F2A-50 - регулятор температуры с выносным датчиком температуры пола. Винтовые зажимы проводов. Ограничение температурного режима посредством колесика регулировки температуры. Возможность подключения внешнего таймера. Используется с системами электрического теплого пола. Регулировка температуры пола.', N'Eberle F2A-50', 1, 2, N'Германия', NULL, 4810)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (43, N'Eberle FIT3F', 1, 8, N'Электронный программируемый терморегулятор нового поколения, с продвинутой системой экономии энергии. Термостат автоматически осуществляет поддержание температуры на постоянном уровне. Две заранее установленные программы специально адаптированы для использования дома или на рабочем месте (в офисе). Также можно выставлять программу в зависимости ото дня (будний или выходной), в соответствии с текущими требованиями. Eberle FIT 3F оснащен ЖК дисплеем с тремя видами фоновой подсветкой(синий, красный, зеленый и белый). Простой интерфейс делает его удобным в использовании. Eberle FIT 3F относится к разряду энергосберегающей продукции.', N'Eberle FIT3F', 1, 2, N'Германия', NULL, 9040)
INSERT [dbo].[Products] ([product_id], [product_title], [quantity], [manufacturer_id], [description], [full_product_title], [sort_order], [productType_id], [country], [subProductType_id], [product_price]) VALUES (44, N'Eberle EM 524 89', 1, 8, N'Метеостанция EBERLE EM 524 89 предназначена для автоматического электроподогрева открытых поверхностей, гаражных пандусов, лестниц, рамп, желобов, водостоков, ступеней, открытых площадок. По сравнению с устройствами с ручным управлением, ориентированными на чувства оператора, а также термостатическими, ориентированными только на температуру, данный прибор обеспечивает подогрев не только при гололедице, но и при снеге, льде, влажности. Автоматически включается в случае необходимости и самостоятельно выключается после оттаивания. Это позволяет сэкономить (по сравнению с термостатическим оборудованием) до 80% электроэнергии. Комплектуется комплектом выносных датчиков для систем антиобледенения кровли или открытых площадок. Имеет индикацию на ЖК дисплее. Функция задержки отключения нагрева от 10 до 120 минут.', N'Eberle EM 524 89', 1, 2, N'Германия', NULL, 27167)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [username], [password]) VALUES (2, N'admin', N'$2y$12$eYL/BBLZYGl.o.TxnddocOdvbufMNotbrRZbTYrwLXcnNm2vE6OOi')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [PK_AuthOption]    Script Date: 08.08.2021 18:26:13 ******/
ALTER TABLE [dbo].[AuthOption] ADD  CONSTRAINT [PK_AuthOption] PRIMARY KEY NONCLUSTERED 
(
	[authOption_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductAttributes] ADD  DEFAULT ((1)) FOR [sort]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [productType_id]
GO
ALTER TABLE [dbo].[GiftGoods]  WITH CHECK ADD  CONSTRAINT [FK_GiftGoodsGiftProducts] FOREIGN KEY([giftproduct_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[GiftGoods] CHECK CONSTRAINT [FK_GiftGoodsGiftProducts]
GO
ALTER TABLE [dbo].[GiftGoods]  WITH CHECK ADD  CONSTRAINT [FK_GiftGoodsProducts] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GiftGoods] CHECK CONSTRAINT [FK_GiftGoodsProducts]
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
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrdersOrderStates] FOREIGN KEY([orderstate_id])
REFERENCES [dbo].[OrderStates] ([orderstate_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_OrdersOrderStates]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrdersPaymentMethods] FOREIGN KEY([payment_id])
REFERENCES [dbo].[PaymentMethods] ([payment_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_OrdersPaymentMethods]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrdersPaymentType] FOREIGN KEY([paymenttype_id])
REFERENCES [dbo].[PaymentType] ([paymenttype_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_OrdersPaymentType]
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetailsOrders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[OrdersDetails] CHECK CONSTRAINT [FK_OrdersDetailsOrders]
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetailsProducts] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[OrdersDetails] CHECK CONSTRAINT [FK_OrdersDetailsProducts]
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdersProductOptions] FOREIGN KEY([productOptions_id])
REFERENCES [dbo].[ProductOptions] ([productOptions_id])
GO
ALTER TABLE [dbo].[OrdersDetails] CHECK CONSTRAINT [FK_OrdersProductOptions]
GO
ALTER TABLE [dbo].[PercentageDiscount]  WITH CHECK ADD  CONSTRAINT [FK_PercentageDiscountProducts] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PercentageDiscount] CHECK CONSTRAINT [FK_PercentageDiscountProducts]
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
