
CREATE PROCEDURE UpdateAdCategory
@Id int,
@CategoryId int
AS
UPDATE Ads
SET 
	CategoryId = @CategoryId
WHERE
	Id = @Id