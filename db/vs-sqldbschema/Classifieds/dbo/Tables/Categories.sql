CREATE TABLE [dbo].[Categories] (
    [Id]               INT           IDENTITY (1, 1) NOT NULL,
    [ParentCategoryId] INT           NULL,
    [Path]             VARCHAR (800) NULL,
    [Name]             NVARCHAR (50) NOT NULL,
    [NumActiveAds]     INT           CONSTRAINT [DF_Categories_NumActiveAds] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Categories_Categories] FOREIGN KEY ([ParentCategoryId]) REFERENCES [dbo].[Categories] ([Id])
);


GO

CREATE TRIGGER OnCategoryInsert
ON Categories
FOR INSERT 
AS
DECLARE @numrows AS int
SET @numrows = @@rowcount
IF @numrows > 1
BEGIN
  RAISERROR('Only single row inserts are supported', 16, 1)
  ROLLBACK TRAN
END
ELSE
IF @numrows = 1
BEGIN
UPDATE Categories
SET    
    Path = 
      CASE
          WHEN Inserted.ParentCategoryId IS NULL THEN '.' 
          ELSE ParentCategory.Path
          END + CAST(Inserted.Id AS varchar(10)) + '.'
FROM        Inserted INNER JOIN
                      Categories ON Inserted.Id = Categories.Id 
                      LEFT OUTER JOIN
                      Categories AS ParentCategory ON Categories.ParentCategoryId = ParentCategory.Id
                    
END