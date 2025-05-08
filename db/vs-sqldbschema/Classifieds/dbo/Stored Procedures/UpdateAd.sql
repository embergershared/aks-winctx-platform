
CREATE PROCEDURE UpdateAd
	@Id int,
	@MemberId int,
	@Title nvarchar(100),
	@Description ntext,
	@URL nvarchar(500),
	@Price money,
	@Location nvarchar(50)
AS
UPDATE Ads
SET
	Title = @Title,
	[Description] = @Description,
	Url = @URL,
	Price = @Price,
	Location = @Location
WHERE
	Id = @Id