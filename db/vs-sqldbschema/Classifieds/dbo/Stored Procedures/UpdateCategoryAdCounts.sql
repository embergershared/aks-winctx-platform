
CREATE PROCEDURE UpdateCategoryAdCounts
@LeafCategoryId int,
@NumberToAdd int
AS

SET NOCOUNT ON

UPDATE Categories SET NumActiveAds = NumActiveAds + @NumberToAdd
WHERE Id IN
	(SELECT Id
	FROM Categories
	WHERE (SELECT Path
	       FROM Categories
	       WHERE Id = @LeafCategoryId) LIKE Path + '%')