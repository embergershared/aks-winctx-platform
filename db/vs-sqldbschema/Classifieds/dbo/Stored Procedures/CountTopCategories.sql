
CREATE PROCEDURE CountTopCategories
AS
	SET NOCOUNT ON;
SELECT     COUNT(*) AS Count
FROM         Categories
WHERE     (ParentCategoryId IS NULL)