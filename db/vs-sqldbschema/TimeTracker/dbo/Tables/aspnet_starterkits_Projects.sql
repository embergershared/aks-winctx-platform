CREATE TABLE [dbo].[aspnet_starterkits_Projects] (
    [ProjectId]               INT              IDENTITY (1, 1) NOT NULL,
    [ProjectName]             NVARCHAR (255)   NOT NULL,
    [ProjectDescription]      NVARCHAR (255)   NULL,
    [ProjectCreationDate]     DATETIME         CONSTRAINT [DF_IssueTracker_Projects_ProjectCreationDate] DEFAULT (getdate()) NOT NULL,
    [ProjectDisabled]         BIT              CONSTRAINT [DF_IssueTracker_Projects_ProjectDisabled] DEFAULT ((0)) NOT NULL,
    [ProjectEstimateDuration] DECIMAL (18)     CONSTRAINT [DF_IssueTracker_Projects_ProjectDuration] DEFAULT ((0)) NOT NULL,
    [ProjectCompletionDate]   DATETIME         CONSTRAINT [DF_IssueTracker_Projects_ProjectCompletionDate] DEFAULT (getdate()) NOT NULL,
    [ProjectCreatorId]        UNIQUEIDENTIFIER NOT NULL,
    [ProjectManagerId]        UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_IssueTracker_Projects] PRIMARY KEY CLUSTERED ([ProjectId] ASC),
    CONSTRAINT [FK_IssueTracker_Projects_aspnet_Users] FOREIGN KEY ([ProjectCreatorId]) REFERENCES [dbo].[aspnet_Users] ([UserId]),
    CONSTRAINT [FK_IssueTracker_Projects_aspnet_Users1] FOREIGN KEY ([ProjectManagerId]) REFERENCES [dbo].[aspnet_Users] ([UserId])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UniqueProjectName]
    ON [dbo].[aspnet_starterkits_Projects]([ProjectName] ASC);

