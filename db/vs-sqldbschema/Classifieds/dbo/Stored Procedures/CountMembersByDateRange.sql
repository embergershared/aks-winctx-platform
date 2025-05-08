
CREATE PROCEDURE CountMembersByDateRange
(
	@StartDate smalldatetime = NULL,
	@EndDate smalldatetime = NULL
)
AS
SET NOCOUNT ON;

	SELECT     COUNT(*) AS Count
	FROM         Members
	WHERE   
	(@StartDate IS NULL OR DateCreated > @StartDate) AND
	(@EndDate IS NULL OR DateCreated < @EndDate)