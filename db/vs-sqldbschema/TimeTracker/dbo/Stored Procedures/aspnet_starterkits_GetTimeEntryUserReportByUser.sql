
/****** Object:  Stored Procedure dbo.aspnet_starterkits_GetTimeEntryUserReportByUser    Script Date: 11/8/2004 9:21:35 PM ******/








CREATE     PROCEDURE aspnet_starterkits_GetTimeEntryUserReportByUser
 @UserName NVARCHAR(256)
AS 
DECLARE @UserId AS UNIQUEIDENTIFIER

SELECT @UserId=UserId FROM aspnet_users WHERE UserName=@UserName

SELECT
 @UserName as UserName,
 SUM  (timeentryDuration) AS TotalDuration
FROM
 aspnet_starterkits_TimeEntry 
WHERE 
 aspnet_starterkits_TimeEntry.TimeEntryUserId=@UserId