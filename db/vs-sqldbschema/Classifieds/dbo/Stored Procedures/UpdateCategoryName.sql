
CREATE PROCEDURE UpdateCategoryName 
@Id int,
@Name nvarchar(50)
AS
UPDATE Categories
SET Name = @Name
WHERE Id = @Id