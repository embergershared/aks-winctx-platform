
CREATE PROCEDURE InsertMember
	@AspNetUsername nvarchar(256),
	@AspNetApplicationName nvarchar(256),
	@DateCreated smalldatetime = getdate
AS
DECLARE @Id int;
SET NOCOUNT ON;
INSERT INTO [Members] ([AspNetUsername], [AspNetApplicationName], [DateCreated]) VALUES (@AspNetUsername, @AspNetApplicationName, @DateCreated);
SET @Id = @@IDENTITY
SELECT  @Id  AS [Id]