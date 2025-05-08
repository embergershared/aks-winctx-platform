
CREATE PROCEDURE InsertLocation 
@Name nvarchar(50)
AS
INSERT INTO Locations (Name)
VALUES (@Name)