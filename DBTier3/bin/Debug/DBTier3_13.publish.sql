﻿/*
Deployment script for Tier3

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Tier3"
:setvar DefaultFilePrefix "Tier3"
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
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[AddressTable]...';


GO
CREATE TABLE [dbo].[AddressTable] (
    [AddressId]  INT          IDENTITY (1, 1) NOT NULL,
    [city]       VARCHAR (50) NULL,
    [streeName]  VARCHAR (50) NULL,
    [floor]      INT          NULL,
    [block]      VARCHAR (50) NULL,
    [flat]       VARCHAR (50) NULL,
    [buildingNr] INT          NULL,
    [postalCode] CHAR (4)     NULL,
    PRIMARY KEY CLUSTERED ([AddressId] ASC)
);


GO
PRINT N'Creating [dbo].[EventTable]...';


GO
CREATE TABLE [dbo].[EventTable] (
    [eventId]        INT          IDENTITY (1, 1) NOT NULL,
    [userId]         INT          NOT NULL,
    [addressId]      INT          NOT NULL,
    [alcoholicDrink] BIT          NULL,
    [startTime]      VARCHAR (50) NOT NULL,
    [endTime]        VARCHAR (50) NOT NULL,
    [description]    VARCHAR (50) NULL,
    [ageLimit]       INT          NULL,
    [pets]           BIT          NULL,
    [entertainment]  BIT          NULL,
    [MaxNoOfGuests]  INT          NULL,
    [entryFee]       FLOAT (53)   NULL,
    [dateT]          DATE         NOT NULL,
    [starter]        VARCHAR (50) NULL,
    [mainCourse]     NCHAR (10)   NOT NULL,
    [dessert]        VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([eventId] ASC)
);


GO
PRINT N'Creating [dbo].[UserTable]...';


GO
CREATE TABLE [dbo].[UserTable] (
    [userId]    INT          IDENTITY (1, 1) NOT NULL,
    [fName]     VARCHAR (50) NOT NULL,
    [lName]     VARCHAR (50) NOT NULL,
    [email]     VARCHAR (50) NOT NULL,
    [dob]       DATE         NOT NULL,
    [passwordq] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([userId] ASC)
);


GO
PRINT N'Creating [dbo].[FK_EventTable_UserTable]...';


GO
ALTER TABLE [dbo].[EventTable]
    ADD CONSTRAINT [FK_EventTable_UserTable] FOREIGN KEY ([userId]) REFERENCES [dbo].[UserTable] ([userId]);


GO
PRINT N'Creating [dbo].[FK_EventTable_AddressTable]...';


GO
ALTER TABLE [dbo].[EventTable]
    ADD CONSTRAINT [FK_EventTable_AddressTable] FOREIGN KEY ([addressId]) REFERENCES [dbo].[AddressTable] ([AddressId]);


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '030e90ea-d025-4338-a085-4637d4ec51ae')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('030e90ea-d025-4338-a085-4637d4ec51ae')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '92cb692e-1633-4f40-8ea0-bff25869d378')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('92cb692e-1633-4f40-8ea0-bff25869d378')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5d42e47c-08ec-491c-8cdb-bbcd2c382a73')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5d42e47c-08ec-491c-8cdb-bbcd2c382a73')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '55afb53e-d999-47c9-89ef-ec0d1268f356')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('55afb53e-d999-47c9-89ef-ec0d1268f356')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a5529f86-f614-41af-9385-523b6966a6b7')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a5529f86-f614-41af-9385-523b6966a6b7')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '1c5f4e2a-b163-42cb-b560-02e093cd1bb2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('1c5f4e2a-b163-42cb-b560-02e093cd1bb2')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '828f1d16-534c-46d9-8f5a-d404f5ae8131')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('828f1d16-534c-46d9-8f5a-d404f5ae8131')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '0e45e8ea-3d20-4488-9900-20aae2ba8a58')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('0e45e8ea-3d20-4488-9900-20aae2ba8a58')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e5469ddf-0360-4c5c-bf38-ac64a1da27ac')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e5469ddf-0360-4c5c-bf38-ac64a1da27ac')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '6c6d30a8-ae2c-4914-93a5-c8372c5119c1')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('6c6d30a8-ae2c-4914-93a5-c8372c5119c1')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2ad39fe9-7317-48e5-b7ae-75ae96020da3')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2ad39fe9-7317-48e5-b7ae-75ae96020da3')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b3000d7d-7e7c-4cf1-9895-45d44de9e456')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b3000d7d-7e7c-4cf1-9895-45d44de9e456')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd12fe1c3-21eb-4b76-aced-c226f0fa8d69')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d12fe1c3-21eb-4b76-aced-c226f0fa8d69')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '61abc38b-7532-4ce3-ba52-33a8ee6f8514')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('61abc38b-7532-4ce3-ba52-33a8ee6f8514')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5618d69a-0570-4c4c-a0f1-8d5b9b07fb7e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5618d69a-0570-4c4c-a0f1-8d5b9b07fb7e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '9f69f049-e50b-46f5-bd29-4d7eaf1af191')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('9f69f049-e50b-46f5-bd29-4d7eaf1af191')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '11769fb0-f1bf-4cb5-821f-8a251468e463')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('11769fb0-f1bf-4cb5-821f-8a251468e463')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'eb735151-7164-4510-b611-cd3419a123be')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('eb735151-7164-4510-b611-cd3419a123be')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ebd0230f-33be-4d0d-8ca5-f0b23b5158c0')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ebd0230f-33be-4d0d-8ca5-f0b23b5158c0')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a3853f14-c594-424f-baf7-c3e74aa6d246')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a3853f14-c594-424f-baf7-c3e74aa6d246')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c2d42a53-4bdf-4e2b-b170-b14c12bc1288')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c2d42a53-4bdf-4e2b-b170-b14c12bc1288')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '33361b3d-31f3-4b08-9a0b-c25374e44f98')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('33361b3d-31f3-4b08-9a0b-c25374e44f98')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e49194e3-0c38-4de2-a4a7-567c9e40a1bd')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e49194e3-0c38-4de2-a4a7-567c9e40a1bd')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '28aeb674-2922-4ae2-81e7-8c4e62b579ea')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('28aeb674-2922-4ae2-81e7-8c4e62b579ea')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '42891074-4f54-4641-9dd9-daee3d2ced40')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('42891074-4f54-4641-9dd9-daee3d2ced40')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fe69fd87-0c90-4699-8aa9-b2a6a7374803')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fe69fd87-0c90-4699-8aa9-b2a6a7374803')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ad824447-8f35-4f5d-b9b9-f8474d44b82b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ad824447-8f35-4f5d-b9b9-f8474d44b82b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fdd5e641-cb60-4951-b96d-aca3f8bdb13e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fdd5e641-cb60-4951-b96d-aca3f8bdb13e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '10a2efb1-a781-4156-a2c5-cdf31c537f65')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('10a2efb1-a781-4156-a2c5-cdf31c537f65')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '478f1784-4b9a-4e59-b476-0aa9026e33eb')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('478f1784-4b9a-4e59-b476-0aa9026e33eb')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '75de40b4-8bfe-4851-8f74-c1eb27b4d635')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('75de40b4-8bfe-4851-8f74-c1eb27b4d635')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4112e539-0390-4220-ad20-bd500f043933')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4112e539-0390-4220-ad20-bd500f043933')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3840b1f0-55b8-410f-a86e-aeef279bfa5c')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3840b1f0-55b8-410f-a86e-aeef279bfa5c')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'eb6a66f1-61cd-4190-abfb-604f29a19069')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('eb6a66f1-61cd-4190-abfb-604f29a19069')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'eeabd2d7-d5c2-4d1e-b63b-310f8857cd0a')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('eeabd2d7-d5c2-4d1e-b63b-310f8857cd0a')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'fe8260c2-a1fb-4074-9a5c-6ba9361b3cf5')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('fe8260c2-a1fb-4074-9a5c-6ba9361b3cf5')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'e4198108-4406-4597-bdff-513d342286e4')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('e4198108-4406-4597-bdff-513d342286e4')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'ef5071ba-5d2e-419d-878d-ad7f369f3b6b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('ef5071ba-5d2e-419d-878d-ad7f369f3b6b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a22d78c0-a28e-466e-b083-d7a8b8cc9392')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a22d78c0-a28e-466e-b083-d7a8b8cc9392')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'd5a09df1-175c-4337-b018-6ebd50567626')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('d5a09df1-175c-4337-b018-6ebd50567626')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '1e5da4b6-bcca-4ebe-a85a-d38d8868e90e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('1e5da4b6-bcca-4ebe-a85a-d38d8868e90e')

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO