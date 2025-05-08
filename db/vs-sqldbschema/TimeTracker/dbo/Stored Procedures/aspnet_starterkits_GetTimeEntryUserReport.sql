
/****** Object:  Stored Procedure dbo.aspnet_starterkits_GetTimeEntryUserReport    Script Date: 11/8/2004 9:21:35 PM ******/




create PROCEDURE aspnet_starterkits_GetTimeEntryUserReport
 @ProjectId Int 
AS 
SELECT
 category.categoryId AS CategoryId, 
 Users.UserName AS UserName,
 SUM  (timeentryDuration) AS Duration
FROM
 aspnet_starterkits_TimeEntry AS timeEntry
 INNER JOIN aspnet_starterkits_ProjectCategories AS category 	ON category.CategoryId = timeEntry.CategoryId
 INNER JOIN aspnet_users AS Users ON timeEntry.TimeEntryUserId=Users.UserId
WHERE 
 category.ProjectId = @ProjectId 
GROUP BY
category.categoryId,
 Users.UserName
ORDER BY 
 category.categoryId