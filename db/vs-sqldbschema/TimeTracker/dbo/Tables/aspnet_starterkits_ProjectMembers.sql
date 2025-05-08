CREATE TABLE [dbo].[aspnet_starterkits_ProjectMembers] (
    [UserId]    UNIQUEIDENTIFIER NOT NULL,
    [ProjectId] INT              NOT NULL,
    CONSTRAINT [PK_aspnet_starterkits_ProjectMembers] PRIMARY KEY CLUSTERED ([UserId] ASC, [ProjectId] ASC),
    CONSTRAINT [FK_IssueTracker_ProjectMembers_aspnet_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]),
    CONSTRAINT [FK_IssueTracker_ProjectMembers_IssueTracker_Projects] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[aspnet_starterkits_Projects] ([ProjectId])
);

