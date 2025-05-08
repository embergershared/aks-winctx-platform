
CREATE PROCEDURE UpdateCategory
(
	@Id int,
	@ParentCategoryId int = NULL,
	@Name nvarchar(50),
	@NumActiveAds int
)
AS
	SET NOCOUNT OFF;
UPDATE [Categories] SET [ParentCategoryId] = @ParentCategoryId,  [Name] = @Name, [NumActiveAds] = @NumActiveAds WHERE (([Id] = @Id))