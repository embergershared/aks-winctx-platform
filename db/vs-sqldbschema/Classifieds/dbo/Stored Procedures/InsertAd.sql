
CREATE PROCEDURE InsertAd
(
	@MemberId int,
	@CategoryId int,
	@Title nvarchar(100),
	@Description ntext,
	@URL nvarchar(500),
	@Price money,
	@Location nvarchar(50),
	@ExpirationDate smalldatetime = NULL,
	@DateCreated smalldatetime = NULL,
	@DateApproved smalldatetime = NULL,
	@NumViews int,
	@NumResponses int,
	@AdLevel int,
	@AdStatus int,
	@AdType int
)
AS
DECLARE @Id int;
SET NOCOUNT OFF;
INSERT INTO Ads
                      (MemberId, CategoryId, Title, Description, URL, Price, Location, ExpirationDate, DateCreated, DateApproved, NumViews, NumResponses, AdLevel, 
                      AdStatus, AdType)
VALUES     (@MemberId,@CategoryId,@Title,@Description,@URL,@Price,@Location,@ExpirationDate,@DateCreated,@DateApproved,@NumViews,@NumResponses,@AdLevel,@AdStatus,@AdType)
SET @Id = @@IDENTITY
SELECT  @Id  AS [Id]