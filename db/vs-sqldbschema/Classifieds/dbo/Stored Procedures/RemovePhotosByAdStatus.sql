
CREATE PROCEDURE RemovePhotosByAdStatus
@AdStatus int
AS
UPDATE Ads SET PreviewImageId = NULL WHERE AdStatus = @AdStatus
DELETE FROM Photos
WHERE AdId IN
	(SELECT Id FROM Ads WHERE AdStatus = @AdStatus)