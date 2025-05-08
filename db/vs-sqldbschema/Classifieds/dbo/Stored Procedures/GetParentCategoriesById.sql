
CREATE PROCEDURE GetParentCategoriesById 
@Id int
AS
SELECT Id, ParentCategoryId, Name, NumActiveAds
FROM Categories
WHERE (SELECT Path
       FROM Categories
       WHERE Id = @Id) LIKE Path + '%'
ORDER BY Path