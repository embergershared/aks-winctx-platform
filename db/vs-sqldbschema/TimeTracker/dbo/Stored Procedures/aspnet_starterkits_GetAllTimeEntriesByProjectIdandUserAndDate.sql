
/****** Object:  Stored Procedure dbo.aspnet_starterkits_GetAllTimeEntriesByProjectIdandUserAndDate    Script Date: 11/8/2004 9:21:35 PM ******/









CREATE  PROCEDURE aspnet_starterkits_GetAllTimeEntriesByProjectIdandUserAndDate
 @TimeEntryUserName nvarchar(256),
 @StartingDate 		datetime,
 @EndDate		datetime
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
WHERE
	aspnet_starterkits_TimeEntry.TimeEntryUserId = @TimeEntryUserId 
	AND
	aspnet_starterkits_TimeEntry.TimeEntryDate BETWEEN  @StartingDate And @EndDate
ORDER BY 
	TimeEntryId ASC