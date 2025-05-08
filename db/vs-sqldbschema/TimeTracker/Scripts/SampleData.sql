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

--- aspnet_Roles
DELETE FROM [aspnet_Roles]
GO
SET IDENTITY_INSERT [aspnet_Roles] ON
GO
INSERT INTO [aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'251DB45C-A7A5-4DE5-8456-85BFF1C55FC2', '3511E3F3-C2DA-4ECC-9477-3062D9FBCB99', N'Consultant', N'consultant',	NULL)
GO
INSERT INTO [aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'251DB45C-A7A5-4DE5-8456-85BFF1C55FC2', '6887DA3D-C118-4816-B06F-D8CF5C65591B', N'ProjectAdministrator', N'projectadministrator', NULL)
GO
INSERT INTO [aspnet_Roles] ([ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]) VALUES (N'251DB45C-A7A5-4DE5-8456-85BFF1C55FC2', '338F090B-23AB-4D9C-B429-F8F18A6E9E30', N'ProjectManager', N'projectmanager', NULL)
GO

--- aspnet_Applications
DELETE FROM [aspnet_Applications]
GO
SET IDENTITY_INSERT [aspnet_Applications] ON
GO
INSERT INTO [aspnet_Applications] ([ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]) VALUES (N'/', N'/', '251DB45C-A7A5-4DE5-8456-85BFF1C55FC2', NULL)
GO
SET IDENTITY_INSERT [aspnet_Applications] OFF
GO

--- SchemaVersions
DELETE FROM [SchemaVersions]
GO
SET IDENTITY_INSERT [SchemaVersions] ON
GO
INSERT INTO [SchemaVersions] ([Featue], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'common', 1, 1)
GO
INSERT INTO [SchemaVersions] ([Featue], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'membership', 1, 1)
GO
INSERT INTO [SchemaVersions] ([Featue], [CompatibleSchemaVersion], [IsCurrentVersion]) VALUES (N'role manager', 1, 1)
GO
SET IDENTITY_INSERT [SchemaVersions] OFF
GO

--
-- End load data
-- 
