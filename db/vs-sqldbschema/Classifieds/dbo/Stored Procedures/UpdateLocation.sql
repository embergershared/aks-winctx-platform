
CREATE PROCEDURE UpdateLocation 
@Id int,
@Name nvarchar(50)
AS
UPDATE Locations
SET [Name] = @Name
WHERE [Id] = @Id