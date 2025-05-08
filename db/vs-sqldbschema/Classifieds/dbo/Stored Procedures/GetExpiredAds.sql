
CREATE PROCEDURE GetExpiredAds
@ExpirationDate smalldatetime = getdate,
@AdStatus int = 0
AS
SELECT * FROM ClassifiedsView_Ads
WHERE
ExpirationDate < @ExpirationDate AND
(@AdStatus = 0 OR AdStatus = @AdStatus)