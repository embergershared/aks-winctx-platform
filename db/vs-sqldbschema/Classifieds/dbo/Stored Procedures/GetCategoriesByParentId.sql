
CREATE PROCEDURE GetCategoriesByParentId
(
	@ParentCategoryId int = 0
)
AS
SET NOCOUNT ON;
SELECT     [Id], [ParentCategoryId], [Name], NumActiveAds
FROM         Categories
WHERE    (ParentCategoryId = @ParentCategoryId)
	OR (@ParentCategoryId = 0 AND ParentCategoryId IS NULL)
ORDER BY Name