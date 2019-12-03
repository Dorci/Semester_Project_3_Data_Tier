CREATE TABLE [dbo].[DrinkTable]
(
	[drinkId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    [alcoholic] NVARCHAR(50) NULL, 
    [nonAlcoholic] NVARCHAR(50) NULL
)
