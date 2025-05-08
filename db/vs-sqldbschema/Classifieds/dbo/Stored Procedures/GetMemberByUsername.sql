
CREATE PROCEDURE GetMemberByUsername
(
	@AspNetUsername nvarchar(256),
	@AspNetApplicationName nvarchar(256)
)
AS
	SET NOCOUNT ON;
SELECT     Id, AspNetUsername, AspNetApplicationName, DateCreated
FROM         Members
WHERE     (AspNetUsername = @AspNetUsername) AND (AspNetApplicationName = @AspNetApplicationName)