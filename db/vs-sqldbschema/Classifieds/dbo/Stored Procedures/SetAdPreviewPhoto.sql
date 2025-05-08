
CREATE PROCEDURE SetAdPreviewPhoto
@PhotoId int,
@AdId int
AS
UPDATE Photos SET
	IsMainPreview = 1 - ABS(SIGN(@PhotoId - Id))
WHERE AdId = @AdId

UPDATE Ads
	SET PreviewImageId = @PhotoId
WHERE
	Id = @AdId