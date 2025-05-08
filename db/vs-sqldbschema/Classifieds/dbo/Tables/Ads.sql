CREATE TABLE [dbo].[Ads] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [MemberId]       INT            NOT NULL,
    [CategoryId]     INT            NOT NULL,
    [Title]          NVARCHAR (100) NOT NULL,
    [Description]    NTEXT          NOT NULL,
    [URL]            NVARCHAR (500) NOT NULL,
    [Price]          MONEY          CONSTRAINT [DF_Ads_Price] DEFAULT ((0)) NOT NULL,
    [Location]       NVARCHAR (50)  NOT NULL,
    [ExpirationDate] SMALLDATETIME  NULL,
    [DateCreated]    SMALLDATETIME  CONSTRAINT [DF_Ads_DateAdded] DEFAULT (getdate()) NOT NULL,
    [DateApproved]   SMALLDATETIME  NULL,
    [NumViews]       INT            CONSTRAINT [DF_Ads_NumViews] DEFAULT ((0)) NOT NULL,
    [NumResponses]   INT            CONSTRAINT [DF_Ads_NumResponses] DEFAULT ((0)) NOT NULL,
    [AdLevel]        INT            CONSTRAINT [DF_Ads_AdLevel] DEFAULT ((0)) NOT NULL,
    [AdStatus]       INT            CONSTRAINT [DF_Ads_AdStatus] DEFAULT ((0)) NOT NULL,
    [AdType]         INT            CONSTRAINT [DF_Ads_IsForSale] DEFAULT ((1)) NOT NULL,
    [PreviewImageId] INT            NULL,
    CONSTRAINT [PK_Ads] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Ads_Categories] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Categories] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_Ads_Members] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO

CREATE TRIGGER AdUpdated
ON Ads
FOR	UPDATE
AS

DECLARE @CurrentAdId AS int

SET @CurrentAdId = 	(SELECT TOP 1 [Id]
			FROM Inserted
			ORDER BY [Id])


	-- loop through each row	
	WHILE @CurrentAdId IS NOT NULL
	BEGIN

		DECLARE	@AdStatus	        int;
		DECLARE	@CategoryId	        int;
		DECLARE	@OldAdStatus	    int;
		DECLARE	@OldCategoryId	    int;
	
		SELECT      @AdStatus = Inserted.AdStatus,
			      @CategoryId = Inserted.CategoryId
		FROM        Inserted
		WHERE Id = @CurrentAdId
		                    
		SELECT      @OldAdStatus = Deleted.AdStatus,
		            @OldCategoryId = Deleted.CategoryId
		FROM        Deleted
		WHERE Id = @CurrentAdId

		IF UPDATE(AdStatus) 
		BEGIN
		    IF (@AdStatus < 100 AND @OldAdStatus >= 100)
		        EXEC UpdateCategoryAdCounts @OldCategoryId, -1
		    ELSE IF (@AdStatus >= 100 AND @OldAdStatus < 100)
		        EXEC UpdateCategoryAdCounts @OldCategoryId, 1
		END
		
		IF UPDATE(CategoryId)
		BEGIN
		  IF (@OldCategoryId <> @CategoryId)
		     BEGIN
		         EXEC UpdateCategoryAdCounts @CategoryId, 1
		         EXEC UpdateCategoryAdCounts @OldCategoryId, -1
		     END
		END
			
		SET @CurrentAdId = 	(SELECT TOP 1 [Id]
					FROM Inserted
					WHERE [Id] > @CurrentAdId
					ORDER BY [Id])

	END
GO

CREATE TRIGGER AdInserted
ON Ads
FOR INSERT
AS

DECLARE @CurrentAdId AS int

SET @CurrentAdId = 	(SELECT TOP 1 [Id]
			FROM Inserted
			ORDER BY [Id])


	-- loop through each row	
	WHILE @CurrentAdId IS NOT NULL
	BEGIN
		
		
		DECLARE	@AdStatus   int;
		DECLARE	@CategoryId int;

		SELECT @AdStatus = AdStatus, @CategoryId = CategoryId
		FROM Inserted
		WHERE Id = @CurrentAdId;

		IF @AdStatus >= 100
		BEGIN
		    -- increment the affected category counts by adding +1
		    EXEC UpdateCategoryAdCounts @CategoryId, 1
		END

		SET @CurrentAdId = 	(SELECT TOP 1 [Id]
						FROM Inserted
						WHERE [Id] > @CurrentAdId
						ORDER BY [Id])

	END
GO

CREATE TRIGGER AdDeleted
ON Ads
FOR	DELETE
AS

DECLARE @CurrentAdId AS int
SET @CurrentAdId = 	(SELECT TOP 1 [Id]
			FROM Deleted
			ORDER BY [Id])


	-- loop through each row	
	WHILE @CurrentAdId IS NOT NULL
	BEGIN
	
		DECLARE	@AdStatus	    int;
		DECLARE	@CategoryId	int;
		
		SELECT @AdStatus = AdStatus, @CategoryId = CategoryId
		FROM Deleted
		WHERE Id = @CurrentAdId
		
		IF @AdStatus >= 100
		BEGIN
		    -- decrement the affected category counts by adding a -1
		    EXEC UpdateCategoryAdCounts @CategoryId, -1
		END

		SET @CurrentAdId = 	(SELECT TOP 1 [Id]
					FROM Deleted
					WHERE [Id] > @CurrentAdId
					ORDER BY [Id])

END