
/****** Object:  Stored Procedure dbo.aspnet_starterkits_GetAllTimeEntriesByProjectIdandUser    Script Date: 11/8/2004 9:21:35 PM ******/









CREATE       PROCEDURE aspnet_starterkits_GetAllTimeEntriesByProjectIdandUser
 @ProjectId int,
 @TimeEntryUserName nvarchar(256)
AS

DECLARE @TimeEntryUserId UNIQUEIDENTIFIER
SELECT @TimeEntryUserId = UserId FROM aspnet_users WHERE UserName = @TimeEntryUserName

SELECT	
	aspnet_starterkits_TimeEntry.*,
	Creators.UserName TimeEntryCreatorDisplayName,
	TEUserName.UserName TimeEntryUserName
FROM 
	aspnet_starterkits_TimeEntry 
	INNER JOIN aspnet_users AS Creators ON Creators.UserId = aspnet_starterkits_TimeEntry.TimeEntryCreatorId	
	INNER JOIN aspnet_users AS TEUserName ON TEUserName.UserId = aspnet_starterkits_TimeEntry.TimeEntryCreatorId	
	INNER JOIN aspnet_starterkits_ProjectCategories AS Category ON Category.CategoryId = aspnet_starterkits_TimeEntry.CategoryId
WHERE
	aspnet_starterkits_TimeEntry.TimeEntryUserId = @TimeEntryUserId AND
	Category.ProjectId = @ProjectId

ORDER BY 
	TimeEntryId ASC