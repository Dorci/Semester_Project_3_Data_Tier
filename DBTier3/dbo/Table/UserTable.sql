CREATE TABLE [dbo].[UserTable]
(
	[userId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY , 
    [fName] VARCHAR(50) NOT NULL, 
    [lName] VARCHAR(50) NOT NULL, 
    [email] VARCHAR(50) NOT NULL, 
    [age] INT NOT NULL, 
    [addressId] INT NULL, 
    CONSTRAINT [FK_UserTable_AddressTable] FOREIGN KEY ([addressId]) REFERENCES [AddressTable]([AddressId]) 
)
