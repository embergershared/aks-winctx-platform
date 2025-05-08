CREATE TABLE [dbo].[Members] (
    [Id]                    INT            IDENTITY (1, 1) NOT NULL,
    [AspNetUsername]        NVARCHAR (256) NOT NULL,
    [AspNetApplicationName] NVARCHAR (256) NOT NULL,
    [DateCreated]           SMALLDATETIME  CONSTRAINT [DF_Members_DateAdded] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED ([Id] ASC)
);

