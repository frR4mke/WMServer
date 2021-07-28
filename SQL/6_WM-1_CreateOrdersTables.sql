IF NOT EXISTS(
  SELECT TOP 1 1
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE 
    [TABLE_NAME] = 'Orders')
   
BEGIN

CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,	
	[fio] [varchar](max) collate Cyrillic_General_CI_AS NOT NULL,	
	[phoneNumber] [varchar](max) NOT NULL,
	[payment_id] [int] NOT NULL,
	[city_id] [int] NOT NULL,
	[deliveryAddress] [varchar](max) collate Cyrillic_General_CI_AS NOT NULL,
	[delivery_id] [int] NOT NULL,
	[orderdatetime] [datetime] NOT NULL,
	[device] [varchar] (20) NOT NULL,
	[orderstate_id] [int] NOT NULL,
	[comment] [varchar](max) NULL	
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrdersPaymentMethods] FOREIGN KEY([payment_id])
REFERENCES [dbo].[PaymentMethods] ([payment_id])

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrdersCitiesServed] FOREIGN KEY([city_id])
REFERENCES [dbo].[CitiesServed] ([city_id])

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDeliveryMethods] FOREIGN KEY([delivery_id])
REFERENCES [dbo].[DeliveryMethods] ([delivery_id])

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_OrdersOrderStates] FOREIGN KEY([orderstate_id])
REFERENCES [dbo].[OrderStates] ([orderstate_id])



END


IF NOT EXISTS(
  SELECT TOP 1 1
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE 
    [TABLE_NAME] = 'OrdersDetails')
   
BEGIN

CREATE TABLE [dbo].[OrdersDetails](
	[orderDetails_id] [int] IDENTITY(1,1) NOT NULL,	
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL	
 CONSTRAINT [PK_OrdersDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetails_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 


ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetailsProducts] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE


ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetailsOrders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
ON DELETE CASCADE

END




