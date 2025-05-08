
CREATE PROCEDURE RemoveCategory
(
	@Id int
)
AS
SET NOCOUNT ON;

DECLARE @returnval int
SELECT @returnval = 1

-- cannot remove a category with ads in it (they must be moved first)
---- return -1
IF EXISTS(SELECT Id FROM Ads WHERE
			(Ads.CategoryId IN 
				(SELECT Id FROM Categories
				WHERE Path LIKE
					(SELECT Path
					FROM Categories
					WHERE Id = @Id ) + '%')))
	SELECT @returnval = -1

-- cannot remove category if it is a parent of other categories
---- return -2
IF EXISTS(SELECT Id FROM Categories WHERE ParentCategoryId = @Id)
    SELECT @returnval = -2

-- can remove category
IF (@returnval = 1)
  DELETE FROM [Categories] WHERE [Id] = @Id

SELECT @returnval

RETURN 0