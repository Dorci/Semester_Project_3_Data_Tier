CREATE TABLE [dbo].[EventTable]
(
	[eventId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    [userId] INT NOT NULL, 
    [addressId] INT NOT NULL, 
    [dateId] INT NOT NULL, 
    [foodId] INT NOT NULL, 
    [drinkId] INT NOT NULL, 
    [startTime] VARCHAR(50) NOT NULL, 
    [endTime] VARCHAR(50) NOT NULL, 
    [descriptions] VARCHAR(50) NULL, 
    [ageLimit] VARCHAR(50) NULL, 
    [pets] VARCHAR(50) NULL, 
    [entertainment] VARCHAR(50) NULL, 
    [guests] INT NOT NULL, 
    [welcomeFee] INT NULL, 
    CONSTRAINT [FK_EventTable_UserTable] FOREIGN KEY ([userId]) REFERENCES [UserTable]([userId]), 
    CONSTRAINT [FK_EventTable_AddressTable] FOREIGN KEY ([addressId]) REFERENCES [addressTable]([AddressId]), 
    CONSTRAINT [FK_EventTable_Date] FOREIGN KEY ([dateId]) REFERENCES [Date]([DateId]), 
    CONSTRAINT [FK_EventTable_FoodTable] FOREIGN KEY ([foodId]) REFERENCES [FoodTable]([foodId]), 
    CONSTRAINT [FK_EventTable_DrinkTable] FOREIGN KEY ([drinkId]) REFERENCES [DrinkTable]([drinkId])
)
