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


CREATE USER [%%MANAGED_IDENTITY_ID%%] FROM EXTERNAL PROVIDER;
GO
ALTER ROLE db_datareader ADD MEMBER [%%MANAGED_IDENTITY_ID%%];
GO
ALTER ROLE db_datawriter ADD MEMBER [%%MANAGED_IDENTITY_ID%%];
GO
GRANT EXECUTE TO [%%MANAGED_IDENTITY_ID%%]
GO

-- =======================================================
-- INSERT INITIAL DATA INTO DB
-- =======================================================

--- aspnet_Applications
DELETE FROM [aspnet_Applications]
GO
SET IDENTITY_INSERT [aspnet_Applications] ON
GO
INSERT INTO [aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', '5C57E07A-D49C-4132-A2D0-E3EDE63A1795', NULL)
GO
SET IDENTITY_INSERT [aspnet_Applications] OFF
GO




--- aspnet_Roles
DELETE FROM [aspnet_Roles]
GO
SET IDENTITY_INSERT [aspnet_Roles] ON
GO
INSERT INTO [aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'5C57E07A-D49C-4132-A2D0-E3EDE63A1795', '8207E294-0B0F-4182-9E74-67DA12AE77CC', N'Administators', N'administrators',	NULL)
GO
INSERT INTO [aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'5C57E07A-D49C-4132-A2D0-E3EDE63A1795', '89F9E71A-606C-42DB-B91E-66114B0EB732', N'Guests', N'guests', NULL)
GO

--- SchemaVersions
DELETE FROM [SchemaVersions]
GO
SET IDENTITY_INSERT [SchemaVersions] ON
GO
INSERT INTO [SchemaVersions] ([Featue], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', 1, 1)
GO
INSERT INTO [SchemaVersions] ([Featue], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'health monitoring', 1, 1)
GO
INSERT INTO [SchemaVersions] ([Featue], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', 1, 1)
GO
INSERT INTO [SchemaVersions] ([Featue], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'personalization', 1, 1)
GO
INSERT INTO [SchemaVersions] ([Featue], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'profile', 1, 1)
GO
INSERT INTO [SchemaVersions] ([Featue], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', 1, 1)
GO
SET IDENTITY_INSERT [SchemaVersions] OFF
GO

---Categories
DELETE FROM [Categories]
GO
SET IDENTITY_INSERT [Categories] ON
GO
INSERT INTO [Categories] ([Id], [ParentCategoryId],[Path], [Name], [NumActiveAds]) VALUES (1, NULL, '.1.', 'Antiques & Collectibles', 0)
GO
INSERT INTO [Categories] ([Id], [ParentCategoryId],[Path], [Name], [NumActiveAds]) VALUES (2, 1, '.2.', 'Arts & Crafts', 0)
GO
INSERT INTO [Categories] ([Id], [ParentCategoryId],[Path], [Name], [NumActiveAds]) VALUES (3, 1, '.3.', 'Auto', 0)
GO
INSERT INTO [Categories] ([Id], [ParentCategoryId],[Path], [Name], [NumActiveAds]) VALUES (4, 1, '.4.', 'Electronics', 0)
GO
INSERT INTO [Categories] ([Id], [ParentCategoryId],[Path], [Name], [NumActiveAds]) VALUES (5, 1, '.5.', 'Garden', 0)
GO
INSERT INTO [Categories] ([Id], [ParentCategoryId],[Path], [Name], [NumActiveAds]) VALUES (6, 1, '.6.', 'Home', 0)
GO
INSERT INTO [Categories] ([Id], [ParentCategoryId],[Path], [Name], [NumActiveAds]) VALUES (6, 1, '.7.', 'Music', 0)
GO

--
-- End load data
-- 
