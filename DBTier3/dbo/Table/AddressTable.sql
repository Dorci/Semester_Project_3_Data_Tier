CREATE TABLE [dbo].[AddressTable]
(
	[AddressId] INT NOT NULL  IDENTITY (1, 1) PRIMARY KEY, 
    [city] VARCHAR(50) NULL, 
    [streeName] VARCHAR(50) NULL, 
    [floor] INT NULL, 
    [block] VARCHAR(50) NULL, 
    [flat] VARCHAR(50) NULL, 
    [buildingNr] INT NULL, 
    [postalCode] CHAR(4) NULL
)
