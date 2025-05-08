
/****** Object:  Stored Procedure dbo.aspnet_starterkits_GetProjectByUserName    Script Date: 11/8/2004 9:21:35 PM ******/



CREATE     PROCEDURE aspnet_starterkits_GetProjectByUserName
	@UserName NVarChar(255) 
AS
DECLARE @UserId UNIQUEIDENTIFIER
SELECT @UserId = UserId FROM aspnet_users WHERE Username = @UserName

SELECT
	
	aspnet_starterkits_Projects.*,
	Managers.UserName ProjectManagerDisplayName,
	Creators.UserName ProjectCreatorDisplayName,
	sum (TimeEntryDuration) as ProjectActualDuration
FROM 
	aspnet_starterkits_Projects 
	INNER JOIN aspnet_users AS Managers ON Managers.UserId = aspnet_starterkits_Projects.ProjectManagerId	
	INNER JOIN aspnet_users AS Creators ON Creators.UserId = aspnet_starterkits_Projects.ProjectCreatorId	
	INNER JOIN aspnet_starterkits_ProjectMembers AS Members ON 	aspnet_starterkits_Projects.ProjectId = Members.ProjectId
	LEFT JOIN aspnet_starterkits_Projectcategories AS cat ON aspnet_starterkits_Projects.ProjectId= cat.ProjectId
	left JOIN aspnet_starterkits_TimeEntry as timeEntry 	ON cat.CategoryId = timeEntry.CategoryId
WHERE
	Members.UserId =@UserId
	AND ProjectDisabled = 0

group by 
	aspnet_starterkits_Projects.ProjectId,
	aspnet_starterkits_Projects.ProjectName,
	aspnet_starterkits_Projects.ProjectDescription,
	aspnet_starterkits_Projects.ProjectCreationDate,
aspnet_starterkits_Projects.ProjectDisabled,
aspnet_starterkits_Projects.ProjectEstimateDuration,
aspnet_starterkits_Projects.ProjectCompletionDate,
aspnet_starterkits_Projects.ProjectCreatorId,
aspnet_starterkits_Projects.ProjectManagerId,
Managers.UserName,
Creators.UserName


ORDER BY 
	ProjectName ASC