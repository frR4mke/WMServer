IF NOT EXISTS(
  SELECT TOP 1 1
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE 
    [TABLE_NAME] = 'PaymentMethods')
   
BEGIN

CREATE TABLE [dbo].[PaymentMethods](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_title] [varchar](20) collate Cyrillic_General_CI_AS  NOT NULL
 CONSTRAINT [PK_Paymentmethods] PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 


insert into PaymentMethods values(N'При получении')
insert into PaymentMethods values(N'Картой')

END


IF NOT EXISTS(
  SELECT TOP 1 1
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE 
    [TABLE_NAME] = 'CitiesServed')
   
BEGIN

CREATE TABLE [dbo].[CitiesServed](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_title] [varchar](30) collate Cyrillic_General_CI_AS  NOT NULL	
 CONSTRAINT [PK_CitiesServed] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 

insert into CitiesServed values(N'Москва')
insert into CitiesServed values(N'Балашиха')

END


IF NOT EXISTS(
  SELECT TOP 1 1
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE 
    [TABLE_NAME] = 'DeliveryMethods')
   
BEGIN
  
CREATE TABLE [dbo].[DeliveryMethods](
	[delivery_id] [int] IDENTITY(1,1) NOT NULL,
	[delivery_title] [varchar](30) collate Cyrillic_General_CI_AS  NOT NULL
 CONSTRAINT [PK_DeliveryMethods] PRIMARY KEY CLUSTERED 
(
	[delivery_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
  

insert into DeliveryMethods values(N'Самовывоз')
insert into DeliveryMethods values(N'Курьером')

END

