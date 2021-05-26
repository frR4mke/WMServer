IF NOT EXISTS(
  SELECT TOP 1 1
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE 
    [TABLE_NAME] = 'Users')
   
BEGIN

CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](40) NOT NULL,
	[password] [varchar](max) NOT NULL
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 


insert into Users values('admin','$2y$12$eYL/BBLZYGl.o.TxnddocOdvbufMNotbrRZbTYrwLXcnNm2vE6OOi')

END


IF NOT EXISTS(
  SELECT TOP 1 1
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE 
    [TABLE_NAME] = 'AuthOption')
   
BEGIN

CREATE TABLE [dbo].[AuthOption](	
	[issuer] [varchar](max) NOT NULL,
	[audience] [varchar](max) NOT NULL,
	[secret] [varchar](max) NOT NULL,
	[tokenLifetime] int NOT NULL,
) 

insert into AuthOption values ('authServer','resourceServer','EC4AD4A24AF99F98A2B01D04EB708265B7E1FD1D7750F7F0C4FA5741AE0EA056BCFD1BCC8389806586099C0CED099B00',10800)

END
