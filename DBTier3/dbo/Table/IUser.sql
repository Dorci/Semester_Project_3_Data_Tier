CREATE TABLE [dbo].[User]
(
	[UserID] INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    [FirstName] VARCHAR(50) NOT NULL, 
    [LastName] VARCHAR(50) NOT NULL, 
    [EmailAddress] VARCHAR(50) NOT NULL, 
    [Age] NCHAR(10) NOT NULL
)
