
CREATE PROCEDURE GetAdsByRandomOrder
@NumRecords int,
@AdStatus int,
@AdLevel int
AS
SET ROWCOUNT @NumRecords
SELECT * FROM ClassifiedsView_Ads
WHERE AdStatus = @AdStatus AND AdLevel = @AdLevel And PreviewImageId IS NOT NULL
ORDER BY newid()
SET ROWCOUNT 0