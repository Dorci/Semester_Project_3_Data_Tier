CREATE TABLE [dbo].[AddressTable]
(
	[AddressId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    [city] VARCHAR(50) NULL, 
    [street] VARCHAR(50) NULL, 
    [streetNr] VARCHAR(50) NULL, 
    [doorSide] VARCHAR(50) NULL, 
    [postCode] CHAR(4) NULL
)
