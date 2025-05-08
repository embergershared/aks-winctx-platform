
CREATE PROCEDURE CountAdsByCategory
@CategoryId int,
@AdStatus int = 0
AS
SELECT Count(Id) AS AdCount FROM Ads
WHERE
	(@AdStatus = 0 OR AdStatus = @AdStatus) AND
	(@CategoryId = 0
		OR 
		CategoryId IN (
		SELECT Id FROM Categories
		WHERE Path LIKE
			  (SELECT Path
			   FROM Categories
			   WHERE Id = @CategoryId ) + '%'))