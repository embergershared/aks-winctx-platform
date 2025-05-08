
/****** Object:  Stored Procedure dbo.aspnet_starterkits_RemoveUserFromProject    Script Date: 11/8/2004 9:21:35 PM ******/

CREATE    PROCEDURE aspnet_starterkits_RemoveUserFromProject
  @UserName NVARCHAR (256),	
	@ProjectId Int 
AS
DECLARE @UserId UNIQUEIDENTIFIER
SELECT @UserId = UserId
	FROM aspnet_users 
where lower(UserName) = lower(@UserName)

delete from aspnet_starterkits_ProjectMembers where UserId=@UserId AND ProjectId=@ProjectId