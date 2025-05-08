
CREATE PROCEDURE UpdateAdStatus
@Id int,
@AdStatus int
AS
UPDATE Ads
SET 
	AdStatus = @AdStatus
WHERE
	Id = @Id