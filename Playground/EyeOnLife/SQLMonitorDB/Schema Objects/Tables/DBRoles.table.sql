﻿CREATE TABLE [dbo].[DBRoles]
(
	[ID] UNIQUEIDENTIFIER NOT NULL, 
    [Database_ID] UNIQUEIDENTIFIER NULL, 
    [SnapShotDate] DATETIME NULL, 
    [SnapShotError] VARCHAR(256) NULL,
    [CreateDate]       DATETIME         NULL,
    [DateLastModified] DATETIME         NULL,
    [IsFixedRole]   BIT     NULL,
    [Name_Role]         VARCHAR (256)     NULL,
    CONSTRAINT [PK_DBRoles] PRIMARY KEY ([ID]),
    CONSTRAINT [FK_DBRoles_Databases] FOREIGN KEY ([Database_ID]) REFERENCES [dbo].[Databases] ([ID])
)
