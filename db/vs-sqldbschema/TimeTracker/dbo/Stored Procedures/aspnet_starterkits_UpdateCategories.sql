
/****** Object:  Stored Procedure dbo.aspnet_starterkits_UpdateCategories    Script Date: 11/8/2004 9:21:35 PM ******/











CREATE      PROCEDURE aspnet_starterkits_UpdateCategories
 @CategoryId		 	INT,
 @CategoryAbbreviation 	  	NVARCHAR(1000),
 @CategoryEstimateDuration 	DECIMAL,
 @CategoryName  		NVARCHAR(256),
 @ProjectId			INT
AS
DECLARE @CategoryIdFound INT
SELECT @CategoryIdFound = CategoryId  FROM aspnet_starterkits_ProjectCategories WHERE CategoryId = @CategoryId
IF (@CategoryIdFound IS NOT NULL)
BEGIN
	UPDATE aspnet_starterkits_ProjectCategories SET
		CategoryAbbreviation = @CategoryAbbreviation,
		CategoryEstimateDuration=@CategoryEstimateDuration,
		CategoryName =@CategoryName,
		ProjectId = @ProjectId
	WHERE
		CategoryId = @CategoryId
	RETURN 0
END
ELSE
	RETURN 1