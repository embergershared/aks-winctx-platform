CREATE TABLE [dbo].[aspnet_starterkits_ProjectCategories] (
    [CategoryId]               INT            IDENTITY (1, 1) NOT NULL,
    [CategoryName]             NVARCHAR (256) NOT NULL,
    [ProjectId]                INT            NOT NULL,
    [ParentCategoryId]         INT            CONSTRAINT [DF_IssueTracker_ProjectCategories_ParentCategoryId] DEFAULT ((0)) NULL,
    [CategoryAbbreviation]     NVARCHAR (256) NULL,
    [CategoryEstimateDuration] DECIMAL (18)   CONSTRAINT [DF_IssueTracker_ProjectCategories_CategoryEstimateDuration] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_IssueTracker_ProjectCategories] PRIMARY KEY CLUSTERED ([CategoryId] ASC),
    CONSTRAINT [FK_IssueTracker_ProjectCategories_IssueTracker_Projects] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[aspnet_starterkits_Projects] ([ProjectId])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UniqueNamePerProject]
    ON [dbo].[aspnet_starterkits_ProjectCategories]([CategoryName] ASC, [ProjectId] ASC);

