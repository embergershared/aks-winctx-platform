
/****** Object:  Stored Procedure dbo.aspnet_starterkits_GetTimeEntryById    Script Date: 11/8/2004 9:21:35 PM ******/










create PROCEDURE aspnet_starterkits_GetTimeEntryById
 @TimeEntryId int
AS

SELECT	
	aspnet_starterkits_TimeEntry.*,
	Creators.UserName TimeEntryCreatorDisplayName,
	TEUserName.UserName TimeEntryUserName
FROM 
	aspnet_starterkits_TimeEntry 
	INNER JOIN aspnet_users AS Creators ON Creators.UserId = aspnet_starterkits_TimeEntry.TimeEntryCreatorId	
	INNER JOIN aspnet_users AS TEUserName ON TEUserName.UserId = aspnet_starterkits_TimeEntry.TimeEntryCreatorId	
WHERE
	aspnet_starterkits_TimeEntry.TimeEntryId = @TimeEntryId