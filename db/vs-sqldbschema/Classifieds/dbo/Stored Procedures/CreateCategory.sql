
CREATE PROCEDURE CreateCategory
(
	@ParentCategoryId int,
	@Name nvarchar(50)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Categories] ([ParentCategoryId], [Name] ) VALUES (@ParentCategoryId, @Name)