
/****** Object:  Stored Procedure dbo.aspnet_starterkits_DeleteProject    Script Date: 11/8/2004 9:21:35 PM ******/





CREATE PROCEDURE aspnet_starterkits_DeleteProject
	@ProjectIdToDelete	INT
AS
UPDATE aspnet_starterkits_Projects SET ProjectDisabled = 1 WHERE ProjectId = @ProjectIdToDelete