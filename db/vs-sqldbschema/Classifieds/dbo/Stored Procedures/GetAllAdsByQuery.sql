
CREATE PROCEDURE GetAllAdsByQuery
@LimitResultCount int = 50,
@CategoryId int = 0,
@MemberId int = 0,
@MaxPrice money = -1,
@SearchTerm nvarchar(50) = N'',
@Location nvarchar(50) = N'',
@AdType int = 0,
@AdStatus int = 0,
@AdLevel int = 0,
@MinDateCreated smalldatetime = NULL,
@MustHaveImage bit = false
AS
	SET ROWCOUNT @LimitResultCount

	SELECT *
	FROM ClassifiedsView_Ads
	WHERE
	(@CategoryId = 0 OR 
	CategoryId IN (
	SELECT Id FROM Categories
	WHERE Path LIKE
	  (SELECT Path
	   FROM Categories
	   WHERE Id = @CategoryId ) + '%'
	)) AND 
	(@MaxPrice = -1 OR Price <= @MaxPrice) AND
	(@MustHaveImage = 0 OR PreviewImageId IS NOT NULL) AND
	(@AdStatus = 0 OR AdStatus = @AdStatus) AND
	(@AdLevel = 0 OR AdLevel = @AdLevel) AND
	(@AdType = 0 OR AdType = @AdType) AND 
	(@MemberId = 0 OR MemberId = @MemberId) AND 
	(@MinDateCreated IS NULL OR DateCreated > @MinDateCreated) AND
	Title LIKE '%' + @SearchTerm + '%' AND 
	Location LIKE '%' + @Location + '%'
    ORDER BY DateCreated DESC
    
	SET ROWCOUNT 0