
CREATE PROCEDURE GetPhotosByAdStatus
@AdStatus int
AS
DECLARE @NullBytes binary
SET @NullBytes = NULL

SELECT     Photos.Id, Photos.AdId, Photos.IsMainPreview, 
                      Photos.DateCreated
FROM         Photos INNER JOIN
                      Ads ON Photos.Id = Ads.Id
WHERE     (Ads.AdStatus = @AdStatus)