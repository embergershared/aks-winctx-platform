
CREATE PROCEDURE GetAdsByStatus
(
	@AdStatus int,
	@MemberId int = 0
)
AS
SET NOCOUNT ON;

SELECT * FROM ClassifiedsView_Ads
WHERE
	AdStatus = @AdStatus AND
	(@MemberId = 0 OR MemberId = @MemberId)