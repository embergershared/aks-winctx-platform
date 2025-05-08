
CREATE PROCEDURE InsertCategory
(
	@ParentCategoryId int,
	@Name nvarchar(50)
)
AS
SET NOCOUNT OFF;
DECLARE @Id int;
INSERT INTO Categories
                      (ParentCategoryId, Name)
VALUES     (@ParentCategoryId,@Name)
SET @Id = @@IDENTITY;
SELECT @Id AS [Id]