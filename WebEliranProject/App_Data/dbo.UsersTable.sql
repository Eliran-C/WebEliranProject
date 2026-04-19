CREATE TABLE [dbo].[UsersTable] (
    [Id]       INT        IDENTITY (1, 1) NOT NULL,
    [UserName] NCHAR (20) NOT NULL,
    [Email]    NCHAR (50) NOT NULL,
    [Password] NCHAR (20) NOT NULL,
    [Gender]   NCHAR (10) NULL,
    [BornYear] INT        NOT NULL,
    [isAdmin]  INT        DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

