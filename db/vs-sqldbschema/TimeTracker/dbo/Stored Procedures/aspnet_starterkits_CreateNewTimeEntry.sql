
/****** Object:  Stored Procedure dbo.aspnet_starterkits_CreateNewTimeEntry    Script Date: 11/8/2004 9:21:35 PM ******/







CREATE           PROCEDURE aspnet_starterkits_CreateNewTimeEntry
 @CategoryId		    INT,
 @TimeEntryCreatorUserName  NVARCHAR(256),
 @TimeEntryDescription      NVARCHAR(1000),
 @TimeEntryEstimateDuration DECIMAL,
 @TimeEntryEnteredDate	    DATETIME,
 @TimeEntryUserName         NVARCHAR(256)
AS
DECLARE @TimeEntryCreatorId UNIQUEIDENTIFIER 
DECLARE @TimeEntryUserId UNIQUEIDENTIFIER 

SELECT @TimeEntryCreatorId = UserId FROM aspnet_users WHERE Username = @TimeEntryCreatorUserName
SELECT @TimeEntryUserId = UserId FROM aspnet_users WHERE Username = @TimeEntryUserName

IF EXISTS( SELECT categoryid  FROM aspnet_starterkits_ProjectCategories WHERE CategoryId=@CategoryId)
BEGIN
	INSERT  aspnet_starterkits_TimeEntry 
	(
		TimeEntryDuration,
		TimeEntryDescription,
		CategoryId,
		TimeEntryCreatorId,
		TimeEntryDate,
		TimeEntryUserId
	) 
	VALUES
	(
		@TimeEntryEstimateDuration,	
		@TimeEntryDescription,
		@CategoryId,
		@TimeEntryCreatorId,
		@TimeEntryEnteredDate,
		@TimeEntryUserId
	)
 RETURN @@IDENTITY
END
ELSE
 RETURN 1