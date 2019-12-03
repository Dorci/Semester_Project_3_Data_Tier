CREATE TABLE [dbo].[Date]
(
	[DateId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    [day] NCHAR(2) NULL, 
    [month] NCHAR(1) NULL, 
    [year] NCHAR(10) NULL
)
