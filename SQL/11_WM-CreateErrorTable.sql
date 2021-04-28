IF EXISTS(
  SELECT TOP 1 1
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE 
    [TABLE_NAME] = 'ErrorLog')
   
BEGIN

CREATE TABLE [dbo].[ErrorLog](
	[error_id] [int] IDENTITY(1,1) NOT NULL,
	[eventdatetime] [datetime] NOT NULL,
	[stacktrace] [varchar](max) NOT NULL,
	[message] [varchar](max) NOT NULL,
	[source] [varchar](max) NOT NULL,
	[errordescription] [varchar](max) collate Cyrillic_General_CI_AS  NOT NULL
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[error_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]




END
