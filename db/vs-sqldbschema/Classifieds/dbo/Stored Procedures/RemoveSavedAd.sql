
CREATE PROCEDURE RemoveSavedAd
@AdId int,
@MemberId int
AS
DELETE FROM SavedAds
WHERE AdId = @AdId AND MemberId = @MemberId