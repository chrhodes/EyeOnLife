﻿/*
Deployment script for SQLMonitorDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "SQLMonitorDB"
:setvar DefaultFilePrefix "SQLMonitorDB"
:setvar DefaultDataPath "C:\SQL Data\"
:setvar DefaultLogPath "C:\SQL Data\"

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
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
GO

GO
PRINT N'Dropping DF__Instances__Defau__02FC7413...';


GO
ALTER TABLE [dbo].[Instances] DROP CONSTRAINT [DF__Instances__Defau__02FC7413];


GO
PRINT N'Dropping DF__tmp_ms_xx_In__ID__68487DD7...';


GO
ALTER TABLE [dbo].[Instances] DROP CONSTRAINT [DF__tmp_ms_xx_In__ID__68487DD7];


GO
PRINT N'Dropping DF__tmp_ms_xx__IsMon__693CA210...';


GO
ALTER TABLE [dbo].[Instances] DROP CONSTRAINT [DF__tmp_ms_xx__IsMon__693CA210];


GO
PRINT N'Dropping DF__tmp_ms_xx__Expan__6A30C649...';


GO
ALTER TABLE [dbo].[Instances] DROP CONSTRAINT [DF__tmp_ms_xx__Expan__6A30C649];


GO
PRINT N'Dropping DF__tmp_ms_xx__Expan__6B24EA82...';


GO
ALTER TABLE [dbo].[Instances] DROP CONSTRAINT [DF__tmp_ms_xx__Expan__6B24EA82];


GO
PRINT N'Dropping DF__tmp_ms_xx__Expan__6C190EBB...';


GO
ALTER TABLE [dbo].[Instances] DROP CONSTRAINT [DF__tmp_ms_xx__Expan__6C190EBB];


GO
PRINT N'Dropping DF__tmp_ms_xx__Expan__6D0D32F4...';


GO
ALTER TABLE [dbo].[Instances] DROP CONSTRAINT [DF__tmp_ms_xx__Expan__6D0D32F4];


GO
PRINT N'Dropping DF__tmp_ms_xx__Expan__6E01572D...';


GO
ALTER TABLE [dbo].[Instances] DROP CONSTRAINT [DF__tmp_ms_xx__Expan__6E01572D];


GO
PRINT N'Dropping FK_InstanceInfo_Instances...';


GO
ALTER TABLE [dbo].[InstanceInfo] DROP CONSTRAINT [FK_InstanceInfo_Instances];


GO
PRINT N'Dropping FK_Jobs_Instances...';


GO
ALTER TABLE [dbo].[Jobs] DROP CONSTRAINT [FK_Jobs_Instances];


GO
PRINT N'Dropping FK_Logins_Instances...';


GO
ALTER TABLE [dbo].[Logins] DROP CONSTRAINT [FK_Logins_Instances];


GO
PRINT N'Dropping FK_Roles_Instances...';


GO
ALTER TABLE [dbo].[ServerRoles] DROP CONSTRAINT [FK_Roles_Instances];


GO
PRINT N'Dropping FK_Databases_Instances...';


GO
ALTER TABLE [dbo].[Databases] DROP CONSTRAINT [FK_Databases_Instances];


GO
PRINT N'Dropping FK_Instances_Servers...';


GO
ALTER TABLE [dbo].[Instances] DROP CONSTRAINT [FK_Instances_Servers];


GO
PRINT N'Dropping FK_DatabaseInfo_Instances...';


GO
ALTER TABLE [dbo].[DatabaseInfo] DROP CONSTRAINT [FK_DatabaseInfo_Instances];


GO
PRINT N'Altering [dbo].[DBDataFiles]...';


GO
ALTER TABLE [dbo].[DBDataFiles] ALTER COLUMN [BytesReadFromDisk] BIGINT NULL;

ALTER TABLE [dbo].[DBDataFiles] ALTER COLUMN [BytesWrittenToDisk] BIGINT NULL;

ALTER TABLE [dbo].[DBDataFiles] ALTER COLUMN [NumberOfDiskReads] BIGINT NULL;

ALTER TABLE [dbo].[DBDataFiles] ALTER COLUMN [NumberOfDiskWrites] BIGINT NULL;


GO
PRINT N'Altering [dbo].[DBLogFiles]...';


GO
ALTER TABLE [dbo].[DBLogFiles] ALTER COLUMN [BytesReadFromDisk] BIGINT NULL;

ALTER TABLE [dbo].[DBLogFiles] ALTER COLUMN [BytesWrittenToDisk] BIGINT NULL;

ALTER TABLE [dbo].[DBLogFiles] ALTER COLUMN [MaxSize] BIGINT NULL;

ALTER TABLE [dbo].[DBLogFiles] ALTER COLUMN [NumberOfDiskReads] BIGINT NULL;

ALTER TABLE [dbo].[DBLogFiles] ALTER COLUMN [NumberOfDiskWrites] BIGINT NULL;


GO
PRINT N'Altering [dbo].[DBStoredProcedures]...';


GO
ALTER TABLE [dbo].[DBStoredProcedures]
    ADD [RetrieveStoredProcedureContent] BIT DEFAULT 0 NULL;


GO
PRINT N'Starting rebuilding table [dbo].[Instances]...';


GO
BEGIN TRANSACTION;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

SET XACT_ABORT ON;

CREATE TABLE [dbo].[tmp_ms_xx_Instances] (
    [ID]                        UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [Server_ID]                 UNIQUEIDENTIFIER NULL,
    [SnapShotDate]              DATETIME         NULL,
    [SnapShotError]             VARCHAR (256)    NULL,
    [Name_Instance]             VARCHAR (256)    NOT NULL,
    [BrowserStartMode]          VARCHAR (50)     NULL,
    [Collation]                 VARCHAR (50)     NULL,
    [Edition]                   VARCHAR (50)     NULL,
    [EngineEdition]             VARCHAR (50)     NULL,
    [IsClustered]               BIT              NULL,
    [NetName]                   VARCHAR (50)     NULL,
    [OSVersion]                 VARCHAR (50)     NULL,
    [PerfMonMode]               VARCHAR (20)     NULL,
    [PhysicalMemory]            INT              NULL,
    [Platform]                  VARCHAR (50)     NULL,
    [Processors]                INT              NULL,
    [Product]                   VARCHAR (50)     NULL,
    [ProductLevel]              VARCHAR (50)     NULL,
    [ServiceInstanceId]         VARCHAR (50)     NULL,
    [ServiceName]               VARCHAR (50)     NULL,
    [ServiceAccount]            VARCHAR (50)     NULL,
    [Status]                    VARCHAR (20)     NULL,
    [Version]                   VARCHAR (50)     NULL,
    [IsMonitored]               BIT              DEFAULT 0 NULL,
    [ExpandContent]             BIT              DEFAULT 0 NULL,
    [ExpandStorage]             BIT              DEFAULT 0 NULL,
    [ExpandJobs]                BIT              DEFAULT 0 NULL,
    [ExpandLogins]              BIT              DEFAULT 0 NULL,
    [ExpandServerRoles]         BIT              DEFAULT 0 NULL,
    [ExpandTriggers]            BIT              DEFAULT 0 NULL,
    [DefaultDatabaseExpandMask] INT              DEFAULT 0 NOT NULL,
    CONSTRAINT [tmp_ms_xx_constraint_PK_Instances] PRIMARY KEY CLUSTERED ([ID] ASC)
);

IF EXISTS (SELECT TOP 1 1 
           FROM   [dbo].[Instances])
    BEGIN
        
        INSERT INTO [dbo].[tmp_ms_xx_Instances] ([ID], [Server_ID], [SnapShotDate], [SnapShotError], [Name_Instance], [BrowserStartMode], [Collation], [Edition], [EngineEdition], [IsClustered], [NetName], [OSVersion], [PerfMonMode], [PhysicalMemory], [Platform], [Processors], [Product], [ProductLevel], [ServiceInstanceId], [ServiceName], [ServiceAccount], [Status], [Version], [IsMonitored], [ExpandContent], [ExpandStorage], [ExpandLogins], [ExpandServerRoles], [ExpandTriggers], [DefaultDatabaseExpandMask])
        SELECT   [ID],
                 [Server_ID],
                 [SnapShotDate],
                 [SnapShotError],
                 [Name_Instance],
                 [BrowserStartMode],
                 [Collation],
                 [Edition],
                 [EngineEdition],
                 [IsClustered],
                 [NetName],
                 [OSVersion],
                 [PerfMonMode],
                 [PhysicalMemory],
                 [Platform],
                 [Processors],
                 [Product],
                 [ProductLevel],
                 [ServiceInstanceId],
                 [ServiceName],
                 [ServiceAccount],
                 [Status],
                 [Version],
                 [IsMonitored],
                 [ExpandContent],
                 [ExpandStorage],
                 [ExpandLogins],
                 [ExpandServerRoles],
                 [ExpandTriggers],
                 [DefaultDatabaseExpandMask]
        FROM     [dbo].[Instances]
        ORDER BY [ID] ASC;
        
    END

DROP TABLE [dbo].[Instances];

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_Instances]', N'Instances';

EXECUTE sp_rename N'[dbo].[tmp_ms_xx_constraint_PK_Instances]', N'PK_Instances', N'OBJECT';

COMMIT TRANSACTION;

SET TRANSACTION ISOLATION LEVEL READ COMMITTED;


GO
PRINT N'Altering [dbo].[Servers]...';


GO
ALTER TABLE [dbo].[Servers]
    ADD [DefaultInstanceExpandMask] INT DEFAULT 0 NOT NULL;


GO
PRINT N'Creating FK_InstanceInfo_Instances...';


GO
ALTER TABLE [dbo].[InstanceInfo] WITH NOCHECK
    ADD CONSTRAINT [FK_InstanceInfo_Instances] FOREIGN KEY ([Instance_ID]) REFERENCES [dbo].[Instances] ([ID]);


GO
PRINT N'Creating FK_Jobs_Instances...';


GO
ALTER TABLE [dbo].[Jobs] WITH NOCHECK
    ADD CONSTRAINT [FK_Jobs_Instances] FOREIGN KEY ([Instance_ID]) REFERENCES [dbo].[Instances] ([ID]);


GO
PRINT N'Creating FK_Logins_Instances...';


GO
ALTER TABLE [dbo].[Logins] WITH NOCHECK
    ADD CONSTRAINT [FK_Logins_Instances] FOREIGN KEY ([Instance_ID]) REFERENCES [dbo].[Instances] ([ID]);


GO
PRINT N'Creating FK_Roles_Instances...';


GO
ALTER TABLE [dbo].[ServerRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_Roles_Instances] FOREIGN KEY ([Instance_ID]) REFERENCES [dbo].[Instances] ([ID]);


GO
PRINT N'Creating FK_Databases_Instances...';


GO
ALTER TABLE [dbo].[Databases] WITH NOCHECK
    ADD CONSTRAINT [FK_Databases_Instances] FOREIGN KEY ([Instance_ID]) REFERENCES [dbo].[Instances] ([ID]);


GO
PRINT N'Creating FK_Instances_Servers...';


GO
ALTER TABLE [dbo].[Instances] WITH NOCHECK
    ADD CONSTRAINT [FK_Instances_Servers] FOREIGN KEY ([Server_ID]) REFERENCES [dbo].[Servers] ([ID]);


GO
PRINT N'Creating FK_DatabaseInfo_Instances...';


GO
ALTER TABLE [dbo].[DatabaseInfo] WITH NOCHECK
    ADD CONSTRAINT [FK_DatabaseInfo_Instances] FOREIGN KEY ([Instance_ID]) REFERENCES [dbo].[Instances] ([ID]);


GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[InstanceInfo] WITH CHECK CHECK CONSTRAINT [FK_InstanceInfo_Instances];

ALTER TABLE [dbo].[Jobs] WITH CHECK CHECK CONSTRAINT [FK_Jobs_Instances];

ALTER TABLE [dbo].[Logins] WITH CHECK CHECK CONSTRAINT [FK_Logins_Instances];

ALTER TABLE [dbo].[ServerRoles] WITH CHECK CHECK CONSTRAINT [FK_Roles_Instances];

ALTER TABLE [dbo].[Databases] WITH CHECK CHECK CONSTRAINT [FK_Databases_Instances];

ALTER TABLE [dbo].[Instances] WITH CHECK CHECK CONSTRAINT [FK_Instances_Servers];

ALTER TABLE [dbo].[DatabaseInfo] WITH CHECK CHECK CONSTRAINT [FK_DatabaseInfo_Instances];


GO
PRINT N'Update complete.'
GO
