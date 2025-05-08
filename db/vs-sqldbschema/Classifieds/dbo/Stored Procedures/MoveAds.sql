
CREATE PROCEDURE MoveAds
@CurrentCategoryId int,
@NewCategoryId int
AS
UPDATE Ads
SET
	CategoryId = @NewCategoryId
WHERE
	CategoryId = @CurrentCategoryId