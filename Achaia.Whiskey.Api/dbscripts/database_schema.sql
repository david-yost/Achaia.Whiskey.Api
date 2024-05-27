DROP TABLE IF EXISTS dbo.Distilleries
DROP TABLE IF EXISTS dbo.Bottles
DROP TABLE IF EXISTS dbo.Barrels
DROP TABLE IF EXISTS dbo.Finishes
DROP TABLE IF EXISTS dbo.FinishTypes
DROP TABLE IF EXISTS dbo.ReleaseTypes
DROP TABLE IF EXISTS dbo.States
DROP TABLE IF EXISTS dbo.WhiskeyTypes

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='WhiskeyTypes' and xtype='U')
BEGIN

    CREATE TABLE [WhiskeyTypes]
    (
        [WhiskeyTypeId] INT IDENTITY (1,1) PRIMARY KEY NOT NULL ,
        [Name]          VARCHAR(250) NOT NULL ,
        [Code]          VARCHAR(50) NOT NULL
    )

    INSERT INTO [WhiskeyTypes] VALUES
    ('Bourbon', 'BOURBON'),
    ('Rye', 'RYE'),
    ('Light Whiskey', 'LIGHT'),
    ('American Whiskey', 'AMERICAN'),
    ('Bourye', 'BOURYE'),
    ('Canadian Whiskey', 'CANADIAN'),
    ('Tennessee Whiskey', 'TENNESSEE'),
    ('Single Malt Scotch', 'SMS'),
    ('American Single Malt', 'AMS'),
    ('Wheat', 'WHEAT')

END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='ReleaseTypes' and xtype='U')
BEGIN

    CREATE TABLE [ReleaseTypes]
    (
        [ReleaseTypeId] INT IDENTITY (1,1) PRIMARY KEY NOT NULL ,
        [Name]          VARCHAR(50) NOT NULL ,
        [Code]          VARCHAR(50) NOT NULL 
    )

    INSERT INTO [ReleaseTypes] ([Name], [Code]) VALUES 
    ('Small Batch', 'SMB'),
    ('Single Barrel', 'SIB'),
    ('Bottled In Bond', 'BIB'),
    ('Special Release', 'SPR'),
    ('Limited Edition', 'LE'),
    ('Unknown', 'UNK')

END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='FinishTypes' and xtype='U')
BEGIN

    CREATE TABLE [FinishTypes]
    (
        [FinishTypeId] INT IDENTITY (1,1) PRIMARY KEY NOT NULL ,
        [Name]         VARCHAR(250) NOT NULL ,
        [Code]         VARCHAR(50) NOT NULL 
    )

    INSERT INTO [FinishTypes] ([Name], [Code]) VALUES
    ('Port Wine Barrel', 'PORT'),
    ('Pinot Noir Casks', 'PINOT'),
    ('Cognac Casks', 'COGNAC'),
    ('Double Oak', 'DBLOAK'),
    ('French Tawny Port', 'TAWNY'),
    ('Oloroso Sherry Casks', 'OLOROSO'),
    ('Rum Barrels', 'RUM'),
    ('Toasted Barrels', 'TOASTED'),
    ('Sherry Oak Casks', 'SHERRY'),
    ('Portwood Casks', 'PORTWOOD'),
    ('Ex-Bourbon Barrels', 'BOURBON'),
    ('Sauternes Desert', 'SAUTERNES')

END


IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Barrels' and xtype='U')
BEGIN

    CREATE TABLE [Barrels]
    (
        [BarrelId]      INT IDENTITY (1,1) PRIMARY KEY NOT NULL ,
        [BarrelNumber]  VARCHAR(50) NULL ,
        [Warehouse]     VARCHAR(50) NULL ,
        [Floor]         VARCHAR(50) NULL ,
        [Rick]          VARCHAR(50) NULL ,
        [WhiskeyTypeId] INT NOT NULL 
    )

END



IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Distilleries' and xtype='U')
BEGIN

    CREATE TABLE [Distilleries]
    (
        [DistilleryId]      INT IDENTITY (1,1) PRIMARY KEY NOT NULL ,
        [Name]              VARCHAR(50) NOT NULL ,
        [StateProvince]     VARCHAR(2) NOT NULL 
    )

END

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Bottles' and xtype='U')
BEGIN

    CREATE TABLE [Bottles]
    (
        [BottleId]      INT IDENTITY (1,1) PRIMARY KEY NOT NULL ,
        [Name]          VARCHAR(255) NOT NULL ,
        [ReleaseTypeId] INT NOT NULL ,
        [DistilleryId]  INT NOT NULL ,
        [Proof]         DECIMAL(18,2) NOT NULL ,
        [AgeYears]      INT NULL ,
        [AgeMonths]     INT NULL 
    )

    CREATE NONCLUSTERED INDEX [FK_1] ON [Bottles] ([ReleaseTypeId] ASC)
    CREATE NONCLUSTERED INDEX [FK_2] ON [Bottles] ([DistilleryId] ASC)

END


IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Finishes' and xtype='U')
BEGIN

    CREATE TABLE [Finishes]
    (
        [FinishId]      INT IDENTITY (1,1) PRIMARY KEY NOT NULL ,
        [BottleId]      INT NOT NULL ,
        [FinishTypeId]  INT NOT NULL 
    )

    CREATE NONCLUSTERED INDEX [FK_1] ON [Finishes] ([BottleId] ASC)
    CREATE NONCLUSTERED INDEX [FK_2] ON [Finishes] ([FinishTypeId] ASC)

END 














