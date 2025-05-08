
CREATE PROCEDURE RelistAd
	@AdId int,
	@CategoryId int,
	@Title nvarchar(100),
	@Description ntext,
	@URL nvarchar(500),
	@Price money,
	@Location nvarchar(50),
	@ExpirationDate smalldatetime = NULL,
	@DateCreated smalldatetime = NULL,
	@DateApproved smalldatetime = NULL,
	@AdLevel int,
	@AdStatus int,
	@AdType int
AS
UPDATE Ads
SET

	CategoryId = @CategoryId,
	Title = @Title ,
	Description = @Description ,
	URL = @URL,
	Price = @Price, 
	Location = @Location, 
	ExpirationDate = @ExpirationDate ,
	-- @DateCreated smalldatetime = NULL,
	DateApproved = @DateApproved, 
	AdLevel = @AdLevel, 
	AdStatus = @AdStatus, 
	AdType = @AdType,
	NumResponses = 0,
	NumViews = 0	

WHERE Id = @AdId