
CREATE PROCEDURE GetCategoryById
(
	@Id int
)
AS
	SET NOCOUNT ON;
SELECT Id, ParentCategoryId, Name, NumActiveAds FROM Categories WHERE Id = @Id