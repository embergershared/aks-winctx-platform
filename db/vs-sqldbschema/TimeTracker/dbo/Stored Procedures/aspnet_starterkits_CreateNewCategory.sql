
/****** Object:  Stored Procedure dbo.aspnet_starterkits_CreateNewCategory    Script Date: 11/8/2004 9:21:35 PM ******/









CREATE     PROCEDURE aspnet_starterkits_CreateNewCategory
  @CategoryName NVARCHAR(256),
  @ProjectId INT,
/*  @ParentCategoryId INT,*/
  @CategoryAbbreviation  NVARCHAR(256),
  @CategoryEstimateDuration DECIMAL
AS
IF NOT EXISTS(SELECT CategoryId FROM aspnet_starterkits_ProjectCategories WHERE ProjectId = @ProjectId AND CategoryName = @CategoryName /*AND ParentCategoryId = @ParentCategoryId*/)
BEGIN
	INSERT aspnet_starterkits_ProjectCategories
	(
		CategoryName,
		ProjectId,
	/*	ParentCategoryId,*/
		CategoryAbbreviation,
		CategoryEstimateDuration
	)
	VALUES
	(
		@CategoryName,
		@ProjectId,
		/*@ParentCategoryId,*/
		@CategoryAbbreviation,
		@CategoryEstimateDuration
	)
	RETURN @@IDENTITY
END