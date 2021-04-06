CREATE TABLE [dbo].[ProductType](
	[productType_id] [int] IDENTITY(1,1) NOT NULL,
	[productType_title] [varchar](max) NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[productType_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


ALTER TABLE Products add [productType_id] int not null default 1