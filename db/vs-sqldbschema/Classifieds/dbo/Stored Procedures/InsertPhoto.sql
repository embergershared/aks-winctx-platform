
CREATE PROCEDURE InsertPhoto
@AdId int,
@BytesFull image = NULL,
@BytesMedium image = NULL,
@BytesSmall image = NULL,
@IsMainPreview bit = 0,
@DateCreated smalldatetime = getdate
AS
DECLARE @Id int;
INSERT Photos
(AdId, BytesFull, BytesMedium, BytesSmall, IsMainPreview, DateCreated)
VALUES
(@AdId, @BytesFull, @BytesMedium, @BytesSmall, @IsMainPreview, @DateCreated)
SET @Id = @@IDENTITY;

IF @IsMainPreview = 1
UPDATE Ads SET PreviewImageId = @Id WHERE Id = @AdId	

RETURN @Id