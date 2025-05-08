
/****** Object:  Stored Procedure dbo.aspnet_starterkits_GetProjectMember    Script Date: 11/8/2004 9:21:35 PM ******/






CREATE  PROCEDURE aspnet_starterkits_GetProjectMember
	@ProjectId INT 
AS

SELECT
 Members.UserName
From 
 aspnet_starterkits_ProjectMembers
INNER JOIN aspnet_users Members ON aspnet_starterkits_ProjectMembers.UserId = Members.UserId
WHERE
 ProjectId=@ProjectId
SET QUOTED_IDENTIFIER OFF