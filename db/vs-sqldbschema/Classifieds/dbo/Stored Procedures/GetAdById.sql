
CREATE PROCEDURE GetAdById
(
	@Id int
)
AS
	SET NOCOUNT ON;
SELECT     Ads.Id, Ads.MemberId, Ads.CategoryId, Ads.Title, Ads.Description, Ads.URL, Ads.Price, Ads.Location, 
                      Ads.ExpirationDate, Ads.DateCreated, Ads.DateApproved, Ads.NumViews, Ads.NumResponses, Ads.AdLevel, 
                      Ads.AdStatus, Ads.AdType, Ads.PreviewImageId, Members.AspNetUsername AS MemberName, 
                      Categories.Name AS CategoryName
FROM         Ads INNER JOIN
                      Members ON Ads.MemberId = Members.Id INNER JOIN
                      Categories ON Ads.CategoryId = Categories.Id
WHERE Ads.Id = @Id