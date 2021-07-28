CREATE TABLE [dbo].[Manufacturers](
	[manufacturer_id] [int] IDENTITY(1,1) NOT NULL,
	[manufacturer_title] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Manufacturers] PRIMARY KEY CLUSTERED 
(
	[manufacturer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_title] [varchar](max) collate Cyrillic_General_CI_AS NOT NULL,	
	[quantity] [int] NOT NULL,
	[manufacturer_id] [int] NOT NULL,
	[description] [varchar](max) collate Cyrillic_General_CI_AS  NOT NULL,
	[full_product_title] [varchar](max) collate Cyrillic_General_CI_AS NOT NULL,
	[sort_order] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_ProductsManufacturers] FOREIGN KEY([manufacturer_id])
REFERENCES [dbo].[Manufacturers] ([manufacturer_id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_ProductsManufacturers]
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

ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_ImagesProducts] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_ImagesProducts]
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

ALTER TABLE [dbo].[ProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributesProducts] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO


CREATE TABLE [dbo].[ProductOptions](
	[productOptions_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[power] [varchar](max) NULL,
	[layingArea] [varchar](max) NULL,
	[wireLength] [varchar](max) NULL,	
	[price] [float] NOT NULL,
 CONSTRAINT [PK_ProductOptions] PRIMARY KEY CLUSTERED 
(
	[productOptions_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductOptions]  WITH CHECK ADD  CONSTRAINT [FK_ProductOptionsProducts] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
ON DELETE CASCADE
GO



ALTER TABLE Products add country varchar(max) collate Cyrillic_General_CI_AS null
ALTER TABLE Products add subProductType_id int null
ALTER TABLE ProductOptions ADD matLength numeric (10,2) null 
ALTER TABLE ProductOptions ADD size varchar (max) null 






