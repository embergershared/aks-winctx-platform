
/****** Object:  Stored Procedure dbo.aspnet_starterkits_CreateNewProject    Script Date: 11/8/2004 9:21:35 PM ******/








CREATE       PROCEDURE aspnet_starterkits_CreateNewProject
 @ProjectCreatorUserName  NVARCHAR(256),
 @ProjectCompletionDate		DATETIME,
 @ProjectDescription 	  NVARCHAR(1000),
 @ProjectEstimateDuration DECIMAL,
 @ProjectManagerUserName  NVARCHAR(256),
 @ProjectName		  NVARCHAR(256)

AS
DECLARE @ProjectCreatorId UNIQUEIDENTIFIER 
SELECT @ProjectCreatorId = UserId FROM aspnet_users WHERE Username = @ProjectCreatorUserName
DECLARE @ProjectManagerId UNIQUEIDENTIFIER
SELECT @ProjectManagerId = UserId FROM aspnet_users WHERE Username = @ProjectManagerUserName

IF NOT EXISTS( SELECT ProjectId  FROM aspnet_starterkits_Projects WHERE LOWER(ProjectName) = LOWER(@ProjectName))
BEGIN
	INSERT aspnet_starterkits_Projects 
	(
		ProjectCreatorId,
		ProjectCompletionDate,
		ProjectDescription,
		ProjectEstimateDuration,
		ProjectManagerId,
		ProjectName
	) 
	VALUES
	(
		@ProjectCreatorId,		
		@ProjectCompletionDate,
		@ProjectDescription,
		@ProjectEstimateDuration,
		@ProjectManagerId,
		@ProjectName
	)
 RETURN @@IDENTITY
END
ELSE
 RETURN 1