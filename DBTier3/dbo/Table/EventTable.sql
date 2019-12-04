CREATE TABLE [dbo].[EventTable]
(
	[eventId] INT NOT NULL  IDENTITY (1, 1) PRIMARY KEY, 
    [userId] INT NOT NULL, 
    [addressId] INT NOT NULL, 
    [alcoholicDrink] BIT NULL, 
    [startTime] VARCHAR(50) NOT NULL, 
    [endTime] VARCHAR(50) NOT NULL, 
    [description] VARCHAR(50) NULL, 
    [ageLimit] INT NULL, 
    [pets] BIT NULL, 
    [entertainment] BIT NULL, 
    [MaxNoOfGuests] INT NULL, 
    [entryFee] FLOAT NULL, 
    [dateT] DATE NOT NULL, 
    [starter] VARCHAR(50) NULL, 
    [mainCourse] NCHAR(10) NOT NULL, 
    [dessert] VARCHAR(50) NULL, 
    CONSTRAINT [FK_EventTable_UserTable] FOREIGN KEY ([userId]) REFERENCES [UserTable]([userId]), 
    CONSTRAINT [FK_EventTable_AddressTable] FOREIGN KEY ([addressId]) REFERENCES [AddressTable]([AddressId])
)
