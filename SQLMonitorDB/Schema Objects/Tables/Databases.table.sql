﻿CREATE TABLE [dbo].[Databases]
(
	[ID] UNIQUEIDENTIFIER NOT NULL DEFAULT (newid()), 
    [Instance_ID] UNIQUEIDENTIFIER NULL, 

	[Name_Instance] VARCHAR(256) NULL,

	[Name_Database] VARCHAR(256) NULL, 
    [CreateDate] DATETIME NULL, 
    [DataBaseGuid] VARCHAR(50) NULL, 
    [DataSpaceUsage] FLOAT NULL,
	[DefaultFileGroup] VARCHAR(256) NULL,
    [ID_DB] INT NULL, 
    [IndexSpaceUsage] FLOAT NULL, 
    [LastBackupDate] DATETIME NULL, 
    [LastDifferentialBackupDate] DATETIME NULL, 
    [LastLogBackupDate] DATETIME NULL, 
    [Owner] VARCHAR(50) NULL,
    [RecoveryModel] VARCHAR(50) NULL,
    [Size] FLOAT NULL, 
    [SpaceAvailable] FLOAT NULL,

    [EP_Area] VARCHAR(50) NULL, 
    [EP_Team] VARCHAR(50) NULL, 
    [EP_PrimaryDBContact] VARCHAR(50) NULL, 
    [EP_DBApprover] VARCHAR(50) NULL, 
    [EP_DRTier] VARCHAR(50) NULL, 

    [IsMonitored] BIT NULL DEFAULT 0, 
	[ExpandDataFiles] BIT NULL DEFAULT 0,
	[ExpandFileGroups] BIT NULL DEFAULT 0,
	[ExpandLogFiles] BIT NULL DEFAULT 0,
	[ExpandRoles] BIT NULL DEFAULT 0,
    [ExpandStoredProcedures] BIT NULL DEFAULT 0,
    [ExpandTables] BIT NULL DEFAULT 0,
    [ExpandTriggers] BIT NULL DEFAULT 0,
    [ExpandUserDefinedFunctions] BIT NULL DEFAULT 0,
    [ExpandUsers] BIT NULL DEFAULT 0,
    [ExpandViews] BIT NULL DEFAULT 0,

    [DefaultTableExpandMask] INT NULL DEFAULT 0, 
    [DefaultViewExpandMask] INT NULL DEFAULT 0,

    [SnapShotDate] DATETIME NULL, 
    [SnapShotError] VARCHAR(256) NULL,
	[SnapShotDuration] FLOAT NULL,
    [NotFound] BIT NULL DEFAULT 0, 

    CONSTRAINT [PK_Databases] PRIMARY KEY NONCLUSTERED ([ID]),
	CONSTRAINT [FK_Databases_Instances] FOREIGN KEY ([Instance_Id]) REFERENCES [dbo].[Instances] ([ID]) ON DELETE CASCADE
)

GO

CREATE INDEX [IX_Databases_Instance_ID] ON [dbo].[Databases] ([Instance_ID])
