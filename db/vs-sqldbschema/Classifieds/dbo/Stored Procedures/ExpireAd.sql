
CREATE PROCEDURE ExpireAd 
@AdId int,
@MemberId int,
@AdStatus int
AS
UPDATE Ads
SET
	AdStatus = @AdStatus,
	ExpirationDate = getdate()
WHERE
	Id = @AdId AND MemberId = @MemberId