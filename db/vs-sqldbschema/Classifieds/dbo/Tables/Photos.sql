CREATE TABLE [dbo].[Photos] (
    [Id]            INT           IDENTITY (1, 1) NOT NULL,
    [AdId]          INT           NOT NULL,
    [BytesFull]     IMAGE         NULL,
    [BytesSmall]    IMAGE         NULL,
    [BytesMedium]   IMAGE         NULL,
    [IsMainPreview] BIT           CONSTRAINT [DF_Photos_IsMainPreview] DEFAULT ((0)) NOT NULL,
    [DateCreated]   SMALLDATETIME CONSTRAINT [DF_Photos_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Photos] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Photos_Ads] FOREIGN KEY ([AdId]) REFERENCES [dbo].[Ads] ([Id]) ON DELETE CASCADE ON UPDATE CASCADE
);

