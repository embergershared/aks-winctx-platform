CREATE TABLE [dbo].[SavedAds] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [MemberId]    INT           NOT NULL,
    [AdId]        INT           NOT NULL,
    [DateCreated] SMALLDATETIME CONSTRAINT [DF_SavedAds_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SavedAds] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_SavedAds_Ads] FOREIGN KEY ([AdId]) REFERENCES [dbo].[Ads] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_SavedAds_Members] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Members] ([Id])
);

