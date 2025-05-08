
CREATE PROCEDURE GetPhotosByAdId
(
	@AdId int
)
AS
	SET NOCOUNT ON;
SELECT     Photos.Id, Photos.AdId, IsMainPreview, DateCreated
FROM         Photos
WHERE     (AdId = @AdId)
ORDER BY IsMainPreview DESC, DateCreated