CREATE TABLE [dbo].[FoodTable]
(
	[foodId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY, 
    [starter] NVARCHAR(50) NULL, 
    [mainCourse] NVARCHAR(50) NULL, 
    [dessert] NVARCHAR(50) NULL
)
