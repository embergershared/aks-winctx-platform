
CREATE PROCEDURE RemovePhoto
@Id int
AS
DECLARE @AdId int

SELECT @AdId = AdId
FROM Photos
WHERE Id = @Id

DELETE FROM Photos WHERE Id = @Id

IF NOT EXISTS(SELECT Id FROM Photos WHERE AdId = @AdId AND IsMainPreview = 1)
BEGIN
	UPDATE
		Photos SET IsMainPreview = 1
		WHERE Id =
		(SELECT TOP 1 Id FROM Photos WHERE AdId = @AdId)
	UPDATE    
		Ads SET PreviewImageId =
        (SELECT Id
         FROM Photos
         WHERE (AdId = @AdId) AND (IsMainPreview = 1)
         )
		WHERE (Id = @AdId)
END