USE [library]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 4/13/2018 4:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 4/13/2018 4:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[PublishedOn] [date] NULL,
	[AuthorId] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([AuthorId], [FirstName], [LastName]) VALUES (1, N'Frankelly ', N'Veras')
INSERT [dbo].[Author] ([AuthorId], [FirstName], [LastName]) VALUES (2, N'Ivan', N'Stojanov')
SET IDENTITY_INSERT [dbo].[Author] OFF
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookId], [Title], [PublishedOn], [AuthorId]) VALUES (1, N'7 Deadly Sins', CAST(N'2018-04-13' AS Date), 1)
INSERT [dbo].[Book] ([BookId], [Title], [PublishedOn], [AuthorId]) VALUES (2, N'Ivan The Interviewer', CAST(N'2018-04-13' AS Date), 2)
INSERT [dbo].[Book] ([BookId], [Title], [PublishedOn], [AuthorId]) VALUES (4, N'Frankelly The Chosen One', CAST(N'2018-04-13' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Book] OFF
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
/****** Object:  StoredProcedure [dbo].[GetBookList]    Script Date: 4/13/2018 4:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetBookList]
AS
SELECT b.BookId , b.Title , b.PublishedOn , b.AuthorId , a.FirstName , a.LastName , CONCAT(a.FirstName,' ', a.LastName) as 'AuthorFullName'
FROM Book b
LEFT JOIN Author a ON a.AuthorId = b.AuthorId
GO
