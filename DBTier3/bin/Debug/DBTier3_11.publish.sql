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
/*
The type for column AddressId in table [dbo].[AddressTable] is currently  CHAR (4) NOT NULL but is being changed to  INT IDENTITY (1, 1) NOT NULL. Data loss could occur.
*/

IF EXISTS (select top 1 1 from [dbo].[AddressTable])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The type for column DateId in table [dbo].[Date] is currently  CHAR (4) NOT NULL but is being changed to  INT IDENTITY (1, 1) NOT NULL. Data loss could occur.

The type for column day in table [dbo].[Date] is currently  NCHAR (10) NULL but is being changed to  NCHAR (2) NULL. Data loss could occur.

The type for column month in table [dbo].[Date] is currently  NCHAR (10) NULL but is being changed to  NCHAR (1) NULL. Data loss could occur.
*/

IF EXISTS (select top 1 1 from [dbo].[Date])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The type for column drinkId in table [dbo].[DrinkTable] is currently  CHAR (4) NOT NULL but is being changed to  INT IDENTITY (1, 1) NOT NULL. Data loss could occur.
*/

IF EXISTS (select top 1 1 from [dbo].[DrinkTable])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The type for column addressId in table [dbo].[EventTable] is currently  CHAR (4) NOT NULL but is being changed to  INT NOT NULL. Data loss could occur.

The type for column dateId in table [dbo].[EventTable] is currently  CHAR (4) NOT NULL but is being changed to  INT NOT NULL. Data loss could occur.

The type for column drinkId in table [dbo].[EventTable] is currently  CHAR (4) NOT NULL but is being changed to  INT NOT NULL. Data loss could occur.

The type for column eventId in table [dbo].[EventTable] is currently  CHAR (10) NOT NULL but is being changed to  INT IDENTITY (1, 1) NOT NULL. Data loss could occur.

The type for column foodId in table [dbo].[EventTable] is currently  CHAR (4) NOT NULL but is being changed to  INT NOT NULL. Data loss could occur.

The type for column userId in table [dbo].[EventTable] is currently  CHAR (4) NOT NULL but is being changed to  INT NOT NULL. Data loss could occur.
*/

IF EXISTS (select top 1 1 from [dbo].[EventTable])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The type for column foodId in table [dbo].[FoodTable] is currently  CHAR (4) NOT NULL but is being changed to  INT IDENTITY (1, 1) NOT NULL. Data loss could occur.
*/

IF EXISTS (select top 1 1 from [dbo].[FoodTable])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The type for column UserID in table [dbo].[User] is currently  CHAR (4) NOT NULL but is being changed to  INT IDENTITY (1, 1) NOT NULL. Data loss could occur.
*/

IF EXISTS (select top 1 1 from [dbo].[User])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The type for column addressId in table [dbo].[UserTable] is currently  CHAR (4) NULL but is being changed to  INT NULL. Data loss could occur.

The type for column userId in table [dbo].[UserTable] is currently  CHAR (4) NOT NULL but is being changed to  INT IDENTITY (1, 1) NOT NULL. Data loss could occur.
*/

IF EXISTS (select top 1 1 from [dbo].[UserTable])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'The following operation was generated from a refactoring log file ad824447-8f35-4f5d-b9b9-f8474d44b82b';

PRINT N'Rename [dbo].[EventTable].[description] to descriptions';


GO
EXECUTE sp_rename @objname = N'[dbo].[EventTable].[description]', @newname = N'descriptions', @objtype = N'COLUMN';


GO
PRINT N'Rename refactoring operation with key fdd5e641-cb60-4951-b96d-aca3f8bdb13e is skipped, element [dbo].[EventTable].[AddressId] (SqlSimpleColumn) will not be renamed to addressId';


GO
PRINT N'Rename refactoring operation with key 10a2efb1-a781-4156-a2c5-cdf31c537f65 is skipped, element [dbo].[EventTable].[DateId] (SqlSimpleColumn) will not be renamed to dateId';


GO
PRINT N'Dropping [dbo].[FK_UserTable_AddressTable]...';


GO
ALTER TABLE [dbo].[UserTable] DROP CONSTRAINT [FK_UserTable_AddressTable];


GO
PRINT N'Dropping [dbo].[FK_EventTable_AddressTable]...';


GO
ALTER TABLE [dbo].[EventTable] DROP CONSTRAINT [FK_EventTable_AddressTable];


GO
PRINT N'Dropping [dbo].[FK_EventTable_Date]...';


GO
ALTER TABLE [dbo].[EventTable] DROP CONSTRAINT [FK_EventTable_Date];


GO
PRINT N'Dropping [dbo].[FK_EventTable_DrinkTable]...';


GO
ALTER TABLE [dbo].[EventTable] DROP CONSTRAINT [FK_EventTable_DrinkTable];


GO
PRINT N'Dropping [dbo].[FK_EventTable_UserTable]...';


GO
ALTER TABLE [dbo].[EventTable] DROP CONSTRAINT [FK_EventTable_UserTable];


GO
PRINT N'Dropping [dbo].[FK_EventTable_FoodTable]...';


GO
ALTER TABLE [dbo].[EventTable] DROP CONSTRAINT [FK_EventTable_FoodTable];


GO
PRINT N'Starting rebuilding table [dbo].[AddressTable]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_AddressTable] (
    [AddressId] INT          IDENTITY (1, 1) NOT NULL,
    [city]      VARCHAR (50) NULL,
    [street]    VARCHAR (50) NULL,
    [streetNr]  VARCHAR (50) NULL,
    [doorSide]  VARCHAR (50) NULL,
    [postCode]  CHAR (4)     NULL,
    PRIMARY KEY CLUSTERED ([AddressId] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[AddressTable])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_AddressTable] ON;
        INSERT INTO [dbo].[tmp_ms_xx_AddressTable] ([AddressId], [city], [street], [streetNr], [doorSide], [postCode])
        SELECT   [AddressId],
                 [city],
                 [street],
                 [streetNr],
                 [doorSide],
                 [postCode]
        FROM     [dbo].[AddressTable]
        ORDER BY [AddressId] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_AddressTable] OFF;
    END

DROP TABLE [dbo].[AddressTable];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_AddressTable]', N'AddressTable';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[Date]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Date] (
    [DateId] INT        IDENTITY (1, 1) NOT NULL,
    [day]    NCHAR (2)  NULL,
    [month]  NCHAR (1)  NULL,
    [year]   NCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([DateId] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Date])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Date] ON;
        INSERT INTO [dbo].[tmp_ms_xx_Date] ([DateId], [day], [month], [year])
        SELECT   [DateId],
                 [day],
                 [month],
                 [year]
        FROM     [dbo].[Date]
        ORDER BY [DateId] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_Date] OFF;
    END

DROP TABLE [dbo].[Date];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Date]', N'Date';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[DrinkTable]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_DrinkTable] (
    [drinkId]      INT           IDENTITY (1, 1) NOT NULL,
    [alcoholic]    NVARCHAR (50) NULL,
    [nonAlcoholic] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([drinkId] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[DrinkTable])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_DrinkTable] ON;
        INSERT INTO [dbo].[tmp_ms_xx_DrinkTable] ([drinkId], [alcoholic], [nonAlcoholic])
        SELECT   [drinkId],
                 [alcoholic],
                 [nonAlcoholic]
        FROM     [dbo].[DrinkTable]
        ORDER BY [drinkId] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_DrinkTable] OFF;
    END

DROP TABLE [dbo].[DrinkTable];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_DrinkTable]', N'DrinkTable';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[EventTable]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_EventTable] (
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

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[EventTable])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_EventTable] ON;
        INSERT INTO [dbo].[tmp_ms_xx_EventTable] ([eventId], [userId], [AddressId], [DateId], [foodId], [drinkId], [startTime], [endTime], [descriptions], [ageLimit], [pets], [entertainment], [guests], [welcomeFee])
        SELECT   [eventId],
                 [userId],
                 [AddressId],
                 [DateId],
                 [foodId],
                 [drinkId],
                 [startTime],
                 [endTime],
                 [descriptions],
                 [ageLimit],
                 [pets],
                 [entertainment],
                 [guests],
                 [welcomeFee]
        FROM     [dbo].[EventTable]
        ORDER BY [eventId] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_EventTable] OFF;
    END

DROP TABLE [dbo].[EventTable];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_EventTable]', N'EventTable';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[FoodTable]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_FoodTable] (
    [foodId]     INT           IDENTITY (1, 1) NOT NULL,
    [starter]    NVARCHAR (50) NULL,
    [mainCourse] NVARCHAR (50) NULL,
    [dessert]    NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([foodId] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[FoodTable])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_FoodTable] ON;
        INSERT INTO [dbo].[tmp_ms_xx_FoodTable] ([foodId], [starter], [mainCourse], [dessert])
        SELECT   [foodId],
                 [starter],
                 [mainCourse],
                 [dessert]
        FROM     [dbo].[FoodTable]
        ORDER BY [foodId] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_FoodTable] OFF;
    END

DROP TABLE [dbo].[FoodTable];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_FoodTable]', N'FoodTable';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[User]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_User] (
    [UserID]       INT          IDENTITY (1, 1) NOT NULL,
    [FirstName]    VARCHAR (50) NOT NULL,
    [LastName]     VARCHAR (50) NOT NULL,
    [EmailAddress] VARCHAR (50) NOT NULL,
    [Age]          NCHAR (10)   NOT NULL,
    PRIMARY KEY CLUSTERED ([UserID] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[User])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_User] ON;
        INSERT INTO [dbo].[tmp_ms_xx_User] ([UserID], [FirstName], [LastName], [EmailAddress], [Age])
        SELECT   [UserID],
                 [FirstName],
                 [LastName],
                 [EmailAddress],
                 [Age]
        FROM     [dbo].[User]
        ORDER BY [UserID] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_User] OFF;
    END

DROP TABLE [dbo].[User];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_User]', N'User';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Starting rebuilding table [dbo].[UserTable]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_UserTable] (
    [userId]    INT          IDENTITY (1, 1) NOT NULL,
    [fName]     VARCHAR (50) NOT NULL,
    [lName]     VARCHAR (50) NOT NULL,
    [email]     VARCHAR (50) NOT NULL,
    [age]       INT          NOT NULL,
    [addressId] INT          NULL,
    PRIMARY KEY CLUSTERED ([userId] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[UserTable])
    BEGIN
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_UserTable] ON;
        INSERT INTO [dbo].[tmp_ms_xx_UserTable] ([userId], [fName], [lName], [email], [age], [addressId])
        SELECT   [userId],
                 [fName],
                 [lName],
                 [email],
                 [age],
                 [addressId]
        FROM     [dbo].[UserTable]
        ORDER BY [userId] ASC;
        SET IDENTITY_INSERT [dbo].[tmp_ms_xx_UserTable] OFF;
    END

DROP TABLE [dbo].[UserTable];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_UserTable]', N'UserTable';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Creating [dbo].[FK_UserTable_AddressTable]...';


GO
ALTER TABLE [dbo].[UserTable] WITH NOCHECK
    ADD CONSTRAINT [FK_UserTable_AddressTable] FOREIGN KEY ([addressId]) REFERENCES [dbo].[AddressTable] ([AddressId]);


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
PRINT N'Creating [dbo].[FK_EventTable_DrinkTable]...';


GO
ALTER TABLE [dbo].[EventTable] WITH NOCHECK
    ADD CONSTRAINT [FK_EventTable_DrinkTable] FOREIGN KEY ([drinkId]) REFERENCES [dbo].[DrinkTable] ([drinkId]);


GO
PRINT N'Creating [dbo].[FK_EventTable_UserTable]...';


GO
ALTER TABLE [dbo].[EventTable] WITH NOCHECK
    ADD CONSTRAINT [FK_EventTable_UserTable] FOREIGN KEY ([userId]) REFERENCES [dbo].[UserTable] ([userId]);


GO
PRINT N'Creating [dbo].[FK_EventTable_FoodTable]...';


GO
ALTER TABLE [dbo].[EventTable] WITH NOCHECK
    ADD CONSTRAINT [FK_EventTable_FoodTable] FOREIGN KEY ([foodId]) REFERENCES [dbo].[FoodTable] ([foodId]);


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
ALTER TABLE [dbo].[UserTable] WITH CHECK CHECK CONSTRAINT [FK_UserTable_AddressTable];

ALTER TABLE [dbo].[EventTable] WITH CHECK CHECK CONSTRAINT [FK_EventTable_AddressTable];

ALTER TABLE [dbo].[EventTable] WITH CHECK CHECK CONSTRAINT [FK_EventTable_Date];

ALTER TABLE [dbo].[EventTable] WITH CHECK CHECK CONSTRAINT [FK_EventTable_DrinkTable];

ALTER TABLE [dbo].[EventTable] WITH CHECK CHECK CONSTRAINT [FK_EventTable_UserTable];

ALTER TABLE [dbo].[EventTable] WITH CHECK CHECK CONSTRAINT [FK_EventTable_FoodTable];


GO
PRINT N'Update complete.';


GO
