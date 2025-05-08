
CREATE PROCEDURE CountAdResponsesByStatus
(
	@AdStatus int = NULL
)
AS
SET NOCOUNT ON;

	SELECT      ISNULL(SUM(NumResponses), 0) AS Count
	FROM         Ads
	WHERE (@AdStatus IS NULL OR AdStatus = @AdStatus)