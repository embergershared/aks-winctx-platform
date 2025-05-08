CREATE TABLE [dbo].[aspnet_starterkits_TimeEntry] (
    [TimeEntryId]          INT              IDENTITY (1, 1) NOT NULL,
    [TimeEntryCreated]     DATETIME         CONSTRAINT [DF_TimeTracker_TimeEntry_TimeEntryEntered] DEFAULT (getdate()) NOT NULL,
    [TimeEntryDuration]    DECIMAL (18)     CONSTRAINT [DF_TimeTracker_TimeEntry_TimeEntryDuration] DEFAULT ((0)) NOT NULL,
    [TimeEntryDescription] NVARCHAR (1000)  NULL,
    [CategoryId]           INT              CONSTRAINT [DF_TimeTracker_TimeEntry_CategoryId] DEFAULT ((0)) NOT NULL,
    [TimeEntryDate]        DATETIME         NULL,
    [TimeEntryCreatorId]   UNIQUEIDENTIFIER NOT NULL,
    [TimeEntryUserId]      UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_TimeTracker_TimeEntry] PRIMARY KEY CLUSTERED ([TimeEntryId] ASC),
    CONSTRAINT [FK_TimeTracker_TimeEntry_aspnet_Users] FOREIGN KEY ([TimeEntryUserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]),
    CONSTRAINT [FK_TimeTracker_TimeEntry_IssueTracker_ProjectCategories] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[aspnet_starterkits_ProjectCategories] ([CategoryId])
);


GO
CREATE NONCLUSTERED INDEX [EntryUserId]
    ON [dbo].[aspnet_starterkits_TimeEntry]([TimeEntryUserId] ASC);


GO
CREATE NONCLUSTERED INDEX [CreatorId]
    ON [dbo].[aspnet_starterkits_TimeEntry]([TimeEntryCreatorId] ASC);


GO
CREATE NONCLUSTERED INDEX [CategoryIDIndex]
    ON [dbo].[aspnet_starterkits_TimeEntry]([CategoryId] ASC);

