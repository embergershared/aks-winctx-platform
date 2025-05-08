
CREATE PROCEDURE MoveCategory
@CategoryId int,
@NewParentCategoryId int
AS
declare @NumActiveAdsInCategory int;
declare @OldPath varchar(800);
declare @NewPath varchar(800);

-- Stored Procedure will not execute, if:

-- 1st case: Current Category = New Parent Category (it cannot become a parent of itself)
IF @CategoryId = @NewParentCategoryId
	RETURN -1

-- 2nd case: the input category is a parent of the new category
-- (a parent category cannot become a child category under one of its own children)
IF EXISTS 	(SELECT Id FROM Categories
		WHERE
			(SELECT Path
			FROM Categories
			WHERE
			Id = @CategoryId) LIKE Path + '%'
		AND
			Id = @NewParentCategoryId)
	RETURN -1 -- exits

SELECT @OldPath = ParentCategories.Path

FROM         Categories INNER JOIN
                      Categories ParentCategories ON Categories.ParentCategoryId = ParentCategories.Id
WHERE     (Categories.Id = @CategoryId)

SELECT @NewPath =
	CASE WHEN
		@NewParentCategoryId IS NULL THEN '.'
	ELSE 
		Path
	END
	FROM Categories
	WHERE @NewParentCategoryId is NULL OR Id = @NewParentCategoryId

IF @OldPath IS NULL
BEGIN
	SELECT @OldPath = Path FROM Categories WHERE Id = @CategoryId
	SET @NewPath = @NewPath + CAST(@CategoryId AS VARCHAR(10)) + '.'
END


SELECT @NumActiveAdsInCategory  = Count(Id) FROM ClassifiedsView_Ads WHERE 
AdStatus >= 100 AND 
ExpirationDate > getdate() AND
ClassifiedsView_Ads.CategoryId IN (SELECT Id FROM Categories
WHERE Path LIKE
  (SELECT Path
   FROM Categories
   WHERE Id = @CategoryId ) + '%' )

DECLARE @NegativeCount int;
SET @NegativeCount = 0 - @NumActiveAdsInCategory 
EXEC UpdateCategoryAdCounts @CategoryId, @NegativeCount 

UPDATE Categories
SET Path = 
	REPLACE(Path, @OldPath, @NewPath)

WHERE Path LIKE

  (SELECT Path
   FROM Categories
   WHERE Id = @CategoryId ) + '%'

EXEC UpdateCategoryAdCounts @CategoryId, @NumActiveAdsInCategory 

UPDATE Categories SET ParentCategoryId = @NewParentCategoryId WHERE Id = @CategoryId

RETURN 1