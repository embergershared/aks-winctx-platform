
CREATE PROCEDURE GetPhotoById 
@Id int,
@Size int
AS
IF @Size = 1
	SELECT     	*
	FROM         PhotosView
	WHERE Id = @Id
ELSE
	SELECT     	*
	FROM         PhotosView
	WHERE Id = @Id