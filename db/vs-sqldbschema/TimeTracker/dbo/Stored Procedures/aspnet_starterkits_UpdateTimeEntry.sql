
/****** Object:  Stored Procedure dbo.aspnet_starterkits_UpdateTimeEntry    Script Date: 11/8/2004 9:21:35 PM ******/








CREATE           PROCEDURE aspnet_starterkits_UpdateTimeEntry
 @CategoryId		    INT,
 @TimeEntryId		    INT,
 @TimeEntryDescription      NVARCHAR(1000),
 @TimeEntryEstimateDuration DECIMAL,
 @TimeEntryEnteredDate	    DATETIME,
 @TimeEntryUserName         NVARCHAR(256)
AS

DECLARE @TimeEntryUserId UNIQUEIDENTIFIER 
SELECT @TimeEntryUserId = UserId FROM aspnet_users WHERE Username = @TimeEntryUserName

IF EXISTS( SELECT categoryid  FROM aspnet_starterkits_ProjectCategories WHERE CategoryId=@CategoryId)
BEGIN
UPDATE aspnet_starterkits_TimeEntry SET
		TimeEntryDuration=@TimeEntryEstimateDuration,
		TimeEntryDescription=@TimeEntryDescription,
		CategoryId=@CategoryId,
		TimeEntryDate=@TimeEntryEnteredDate,
		TimeEntryUserId=@TimeEntryUserId
	WHERE
		TimeEntryId = @TimeEntryId
	RETURN 0
END
ELSE
 RETURN 1