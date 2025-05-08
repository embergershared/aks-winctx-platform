
/****** Object:  Stored Procedure dbo.aspnet_starterkits_DeleteCategory    Script Date: 11/8/2004 9:21:35 PM ******/





CREATE PROCEDURE aspnet_starterkits_DeleteCategory
	@CategoryIdToDelete Int
AS
DELETE 
	aspnet_starterkits_ProjectCategories
WHERE
	CategoryId = @CategoryIdToDelete