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


insert into CitiesServed values(N'Архангельск'),
(N'Астрахань'),
(N'Брянск'),
(N'Владимир'),
(N'Волгоград'),
(N'Вологда'),
(N'Воронеж'),
(N'Иваново'),
(N'Ижевск'),
(N'Йошкар-Ола'),
(N'Казань'),
(N'Калининград'),
(N'Калуга'),
(N'Киров'),
(N'Кострома'),
(N'Курск'),
(N'Липецк'),
(N'Москва'),
(N'Мурманск'),
(N'Нарьян-Мар'),
(N'Нижний Новгород'),
(N'Новгород Великий'),
(N'Орёл'),
(N'Оренбург'),
(N'Пенза'),
(N'Пермь'),
(N'Петрозаводск'),
(N'Псков'),
(N'Ростов-на-Дону'),
(N'Рязань'),
(N'Самара'),
(N'Санкт-Петербург'),
(N'Саранск'),
(N'Саратов'),
(N'Севастополь'),
(N'Симферополь'),
(N'Смоленск'),
(N'Сыктывкар'),
(N'Тамбов'),
(N'Тверь'),
(N'Тула'),
(N'Ульяновск'),
(N'Уфа'),
(N'Чебоксары'),
(N'Элиста'),
(N'Ярославль')


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

IF NOT EXISTS(
  SELECT TOP 1 1
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE 
    [TABLE_NAME] = 'OrderStates')
   
BEGIN
  
CREATE TABLE [dbo].[OrderStates](
	[orderstate_id] [int] IDENTITY(1,1) NOT NULL,
	[orderstate_title] [varchar](30) collate Cyrillic_General_CI_AS  NOT NULL
 CONSTRAINT [PK_OrderStates] PRIMARY KEY CLUSTERED 
(
	[orderstate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
  

insert into OrderStates values(N'В обработке')
insert into OrderStates values(N'Подтвержден')
insert into OrderStates values(N'Оплачен')
insert into OrderStates values(N'Доставлен')
END

IF NOT EXISTS(
  SELECT TOP 1 1
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE 
    [TABLE_NAME] = 'PaymentType')
   
BEGIN
  
CREATE TABLE [dbo].[PaymentType](
	[paymenttype_id] [int] IDENTITY(1,1) NOT NULL,
	[paymenttype_title] [varchar](30) collate Cyrillic_General_CI_AS  NOT NULL
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[paymenttype_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
  

insert into PaymentType values(N'Физическое')
insert into PaymentType values(N'Юридическое')

END


