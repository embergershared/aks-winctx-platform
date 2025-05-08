
CREATE PROCEDURE CountAdViewsByStatus
(
	@AdStatus int
)
AS
SET NOCOUNT ON;

	SELECT     SUM(NumViews) AS Count
	FROM         Ads
	WHERE     (@AdStatus IS NULL OR AdStatus = @AdStatus)