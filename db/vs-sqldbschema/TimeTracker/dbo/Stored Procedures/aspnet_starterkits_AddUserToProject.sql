
/****** Object:  Stored Procedure dbo.aspnet_starterkits_AddUserToProject    Script Date: 11/8/2004 9:21:35 PM ******/







CREATE   PROCEDURE aspnet_starterkits_AddUserToProject
  @MemberUserName NVARCHAR (256),	
	@ProjectId Int 
AS
DECLARE @UserId UNIQUEIDENTIFIER
SELECT @UserId = UserId
	FROM aspnet_users 
where lower(UserName) = lower(@MemberUserName)

IF NOT EXISTS (SELECT UserId FROM aspnet_starterkits_ProjectMembers WHERE UserId = @UserId AND ProjectId = @ProjectId)
BEGIN
	INSERT aspnet_starterkits_ProjectMembers
	(
		UserId,
		ProjectId
	)
	VALUES
	(
		@UserId,
		@ProjectId
	)
/* RETURN @@IDENTITY*/
END