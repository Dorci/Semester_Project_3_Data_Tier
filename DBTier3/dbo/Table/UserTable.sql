CREATE TABLE [dbo].[UserTable]
(
	[userId] INT NOT NULL  IDENTITY (1, 1) PRIMARY KEY, 
    [fName] VARCHAR(50) NOT NULL, 
    [lName] VARCHAR(50) NOT NULL, 
    [email] VARCHAR(50) NOT NULL, 
    [dob] DATE NOT NULL, 
    [passwordq] VARCHAR(50) NOT NULL
)
