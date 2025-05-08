
/****** Object:  Stored Procedure dbo.aspnet_starterkits_GetTimeEntryUserReportByCategoryId    Script Date: 11/8/2004 9:21:35 PM ******/





Create  PROCEDURE aspnet_starterkits_GetTimeEntryUserReportByCategoryId
 @CategoryId Int 
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
 category.categoryId =@CategoryId  
GROUP BY
category.categoryId,
 Users.UserName
ORDER BY 
 category.categoryId