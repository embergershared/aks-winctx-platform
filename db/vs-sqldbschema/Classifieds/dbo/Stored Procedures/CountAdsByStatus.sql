
CREATE PROCEDURE CountAdsByStatus
(
	@AdStatus int = NULL,
	@MinDateCreated datetime = NULL
)
AS
SET NOCOUNT ON;

	SELECT     COUNT(*) AS Count
	FROM Ads 
	WHERE (@AdStatus IS NULL OR AdStatus = @AdStatus) AND
	(@MinDateCreated IS NULL OR DateCreated > @MinDateCreated)