
/****** Object:  Stored Procedure dbo.aspnet_starterkits_GetCategoryByNameAndProjectId    Script Date: 11/8/2004 9:21:35 PM ******/





CREATE    PROCEDURE aspnet_starterkits_GetCategoryByNameAndProjectId
	@CategoryName nvarchar(256),
	@ProjectId	int 
AS
SELECT
	category.*,
	sum (TimeEntryDuration) as CategoryActualDuration
FROM 
	aspnet_starterkits_ProjectCategories  as category
	left JOIN aspnet_starterkits_TimeEntry as timeEntry 	ON category.CategoryId = timeEntry.CategoryId
WHERE
	category.CategoryName = @CategoryName and 
	category.ProjectId = @ProjectId
GROUP BY 
 category.CategoryId,
 category.CategoryName,
 category.ParentCategoryId,
 category.ProjectId,
 category.CategoryAbbreviation,
 category.CategoryEstimateDuration

ORDER BY
	CategoryName