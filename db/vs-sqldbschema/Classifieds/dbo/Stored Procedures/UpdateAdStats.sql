
CREATE PROCEDURE UpdateAdStats
@AdId int,
@NumberToAddToViews int = 0,
@NumberToAddToResponses int = 0
AS
UPDATE Ads SET
	NumViews = NumViews + @NumberToAddToViews,
	NumResponses = NumResponses + @NumberToAddToResponses
WHERE
	Id = @AdId