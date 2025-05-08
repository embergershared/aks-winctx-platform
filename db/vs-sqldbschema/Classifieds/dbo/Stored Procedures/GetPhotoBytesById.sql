
CREATE PROCEDURE GetPhotoBytesById 
@Id int,
@Size int
AS
IF @Size = 3
	SELECT     	BytesFull AS Bytes
	FROM         Photos
	WHERE Id = @Id
ELSE IF @Size = 2
	SELECT     	BytesMedium AS Bytes
	FROM         Photos
	WHERE Id = @Id
ELSE
	SELECT     	BytesSmall AS Bytes
	FROM         Photos
	WHERE Id = @Id