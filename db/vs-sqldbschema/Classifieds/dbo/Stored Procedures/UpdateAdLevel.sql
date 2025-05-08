
CREATE PROCEDURE UpdateAdLevel
@Id int,
@AdLevel int
AS
UPDATE Ads
SET 
	AdLevel = @AdLevel
WHERE
	Id = @Id