﻿/*
Deployment script for DBTier3

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "DBTier3"
:setvar DefaultFilePrefix "DBTier3"
:setvar DefaultDataPath "C:\Users\Tibor Fekete\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"
:setvar DefaultLogPath "C:\Users\Tibor Fekete\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key ad824447-8f35-4f5d-b9b9-f8474d44b82b is skipped, element [dbo].[EventTable].[description] (SqlSimpleColumn) will not be renamed to descriptions';


GO
PRINT N'Rename refactoring operation with key fdd5e641-cb60-4951-b96d-aca3f8bdb13e is skipped, element [dbo].[EventTable].[AddressId] (SqlSimpleColumn) will not be renamed to addressId';


GO
PRINT N'Rename refactoring operation with key 10a2efb1-a781-4156-a2c5-cdf31c537f65 is skipped, element [dbo].[EventTable].[DateId] (SqlSimpleColumn) will not be renamed to dateId';


GO
PRINT N'Creating [dbo].[AddressTable]...';


GO
CREATE TABLE [dbo].[AddressTable] (
    [AddressId] INT          IDENTITY (1, 1) NOT NULL,
    [city]      VARCHAR (50) NULL,
    [street]    VARCHAR (50) NULL,
    [streetNr]  VARCHAR (50) NULL,
    [doorSide]  VARCHAR (50) NULL,
    [postCode]  CHAR (4)     NULL,
    PRIMARY KEY CLUSTERED ([AddressId] ASC)
);


GO
PRINT N'Creating [dbo].[Date]...';


GO
CREATE TABLE [dbo].[Date] (
    [DateId] INT        IDENTITY (1, 1) NOT NULL,
    [day]    NCHAR (2)  NULL,
    [month]  NCHAR (1)  NULL,
    [year]   NCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([DateId] ASC)
);


GO
PRINT N'Creating [dbo].[DrinkTable]...';


GO
CREATE TABLE [dbo].[DrinkTable] (
    [drinkId]      INT           IDENTITY (1, 1) NOT NULL,
    [alcoholic]    NVARCHAR (50) NULL,
    [nonAlcoholic] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([drinkId] ASC)
);


GO
PRINT N'Creating [dbo].[EventTable]...';


GO
CREATE TABLE [dbo].[EventTable] (
    [eventId]       INT          IDENTITY (1, 1) NOT NULL,
    [userId]        INT          NOT NULL,
    [addressId]     INT          NOT NULL,
    [dateId]        INT          NOT NULL,
    [foodId]        INT          NOT NULL,
    [drinkId]       INT          NOT NULL,
    [startTime]     VARCHAR (50) NOT NULL,
    [endTime]       VARCHAR (50) NOT NULL,
    [descriptions]  VARCHAR (50) NULL,
    [ageLimit]      VARCHAR (50) NULL,
    [pets]          VARCHAR (50) NULL,
    [entertainment] VARCHAR (50) NULL,
    [guests]        INT          NOT NULL,
    [welcomeFee]    INT          NULL,
    PRIMARY KEY CLUSTERED ([eventId] ASC)
);


GO
PRINT N'Creating [dbo].[FoodTable]...';


GO
CREATE TABLE [dbo].[FoodTable] (
    [foodId]     INT           IDENTITY (1, 1) NOT NULL,
    [starter]    NVARCHAR (50) NULL,
    [mainCourse] NVARCHAR (50) NULL,
    [dessert]    NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([foodId] ASC)
);


GO
PRINT N'Creating [dbo].[User]...';


GO
CREATE TABLE [dbo].[User] (
    [UserID]       INT          IDENTITY (1, 1) NOT NULL,
    [FirstName]    VARCHAR (50) NOT NULL,
    [LastName]     VARCHAR (50) NOT NULL,
    [EmailAddress] VARCHAR (50) NOT NULL,
    [Age]          NCHAR (10)   NOT NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC)
);


GO
PRINT N'Creating [dbo].[UserTable]...';


GO
CREATE TABLE [dbo].[UserTable] (
    [userId]    INT          IDENTITY (1, 1) NOT NULL,
    [fName]     VARCHAR (50) NOT NULL,
    [lName]     VARCHAR (50) NOT NULL,
    [email]     VARCHAR (50) NOT NULL,
    [age]       INT          NOT NULL,
    [addressId] INT          NULL,
    PRIMARY KEY CLUSTERED ([userId] ASC)
);


GO
PRINT N'Creating [dbo].[FK_EventTable_UserTable]...';


GO
ALTER TABLE [dbo].[EventTable] WITH NOCHECK
    ADD CONSTRAINT [FK_EventTable_UserTable] FOREIGN KEY ([userId]) REFERENCES [dbo].[UserTable] ([userId]);


GO
PRINT N'Creating [dbo].[FK_EventTable_AddressTable]...';


GO
ALTER TABLE [dbo].[EventTable] WITH NOCHECK
    ADD CONSTRAINT [FK_EventTable_AddressTable] FOREIGN KEY ([addressId]) REFERENCES [dbo].[AddressTable] ([AddressId]);


GO
PRINT N'Creating [dbo].[FK_EventTable_Date]...';


GO
ALTER TABLE [dbo].[EventTable] WITH NOCHECK
    ADD CONSTRAINT [FK_EventTable_Date] FOREIGN KEY ([dateId]) REFERENCES [dbo].[Date] ([DateId]);


GO
PRINT N'Creating [dbo].[FK_EventTable_FoodTable]...';


GO
ALTER TABLE [dbo].[EventTable] WITH NOCHECK
    ADD CONSTRAINT [FK_EventTable_FoodTable] FOREIGN KEY ([foodId]) REFERENCES [dbo].[FoodTable] ([foodId]);


GO
PRINT N'Creating [dbo].[FK_EventTable_DrinkTable]...';


GO
ALTER TABLE [dbo].[EventTable] WITH NOCHECK
    ADD CONSTRAINT [FK_EventTable_DrinkTable] FOREIGN KEY ([drinkId]) REFERENCES [dbo].[DrinkTable] ([drinkId]);


GO
PRINT N'Creating [dbo].[FK_UserTable_AddressTable]...';


GO
ALTER TABLE [dbo].[UserTable] WITH NOCHECK
    ADD CONSTRAINT [FK_UserTable_AddressTable] FOREIGN KEY ([addressId]) REFERENCES [dbo].[AddressTable] ([AddressId]);


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ad824447-8f35-4f5d-b9b9-f8474d44b82b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ad824447-8f35-4f5d-b9b9-f8474d44b82b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fdd5e641-cb60-4951-b96d-aca3f8bdb13e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fdd5e641-cb60-4951-b96d-aca3f8bdb13e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '10a2efb1-a781-4156-a2c5-cdf31c537f65')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('10a2efb1-a781-4156-a2c5-cdf31c537f65')

GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[EventTable] WITH CHECK CHECK CONSTRAINT [FK_EventTable_UserTable];

ALTER TABLE [dbo].[EventTable] WITH CHECK CHECK CONSTRAINT [FK_EventTable_AddressTable];

ALTER TABLE [dbo].[EventTable] WITH CHECK CHECK CONSTRAINT [FK_EventTable_Date];

ALTER TABLE [dbo].[EventTable] WITH CHECK CHECK CONSTRAINT [FK_EventTable_FoodTable];

ALTER TABLE [dbo].[EventTable] WITH CHECK CHECK CONSTRAINT [FK_EventTable_DrinkTable];

ALTER TABLE [dbo].[UserTable] WITH CHECK CHECK CONSTRAINT [FK_UserTable_AddressTable];


GO
PRINT N'Update complete.';


GO
