
/****** Object:  Stored Procedure dbo.aspnet_starterkits_DeleteTimeEntry    Script Date: 11/8/2004 9:21:35 PM ******/








CREATE   PROCEDURE aspnet_starterkits_DeleteTimeEntry
	@TimeentryIdToDelete Int
AS
DELETE 
	aspnet_starterkits_TimeEntry 
WHERE
	TimeEntryId = @TimeentryIdToDelete