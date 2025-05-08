
CREATE PROCEDURE RemoveLocation
@Id int
AS
DELETE FROM Locations
WHERE [Id] = @Id