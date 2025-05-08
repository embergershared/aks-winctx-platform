
CREATE PROCEDURE InsertSavedAd 
@AdId int,
@MemberId int
AS
SET NOCOUNT ON;
SELECT AdId FROM SavedAds WHERE AdId = @AdId AND MemberId = @MemberId
IF @@ROWCOUNT = 0
INSERT INTO SavedAds
	(AdId, MemberId, DateCreated)
VALUES
	(@AdId, @MemberId, getdate())