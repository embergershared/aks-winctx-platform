
/****** Object:  Stored Procedure dbo.aspnet_starterkits_UpdateProject    Script Date: 11/8/2004 9:21:35 PM ******/








CREATE     PROCEDURE aspnet_starterkits_UpdateProject
 @ProjectId		 Int,
 @ProjectCompletionDate DATETIME,
 @ProjectDescription 	  NVARCHAR(1000),
 @ProjectEstimateDuration DECIMAL,
 @ProjectManagerUserName  NVARCHAR(256),
 @ProjectName		  NVARCHAR(256)
AS
DECLARE @ProjectIdFound INT
SELECT @ProjectIdFound = ProjectId  FROM aspnet_starterkits_Projects WHERE ProjectId = @ProjectId
IF (@ProjectIdFound IS NOT NULL)
BEGIN
	DECLARE @ProjectManagerId UNIQUEIDENTIFIER
	SELECT @ProjectManagerId = UserId FROM aspnet_users WHERE Username = @ProjectManagerUserName

	UPDATE aspnet_starterkits_Projects SET
		ProjectCompletionDate=@ProjectCompletionDate,
		ProjectDescription = @ProjectDescription,
		ProjectEstimateDuration=@ProjectEstimateDuration,
		ProjectManagerId =@ProjectManagerId,
		ProjectName = @ProjectName
	WHERE
		ProjectId = @ProjectId
	RETURN 0
END
ELSE
	RETURN 1