USE [scrum]
GO
/****** Object:  Table [dbo].[area]    Script Date: 2/20/2019 4:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[area](
	[areaId] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_area] PRIMARY KEY CLUSTERED 
(
	[areaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[backlog]    Script Date: 2/20/2019 4:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[backlog](
	[backlogId] [int] IDENTITY(1,1) NOT NULL,
	[boardId] [int] NOT NULL,
	[stateBacklogId] [int] NOT NULL,
	[name] [varchar](250) NOT NULL,
	[description] [varchar](2000) NOT NULL,
	[priority] [int] NOT NULL,
	[remainingWork] [int] NOT NULL,
	[addLink] [varchar](250) NULL,
 CONSTRAINT [PK_backlog] PRIMARY KEY CLUSTERED 
(
	[backlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[backlogItem]    Script Date: 2/20/2019 4:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[backlogItem](
	[backlogItemId] [int] IDENTITY(1,1) NOT NULL,
	[sprintCapacityId] [int] NOT NULL,
	[day] [int] NOT NULL,
 CONSTRAINT [PK_backlogItem] PRIMARY KEY CLUSTERED 
(
	[backlogItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[board]    Script Date: 2/20/2019 4:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[board](
	[boardId] [int] NOT NULL,
	[title] [varchar](250) NOT NULL,
	[userId] [int] NOT NULL,
	[stateBoardId] [int] NOT NULL,
	[effort] [int] NOT NULL,
	[areaId] [tinyint] NOT NULL,
	[iterationId] [tinyint] NOT NULL,
	[tagId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_board] PRIMARY KEY CLUSTERED 
(
	[boardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[iteration]    Script Date: 2/20/2019 4:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[iteration](
	[iterationId] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_iteration] PRIMARY KEY CLUSTERED 
(
	[iterationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sprint]    Script Date: 2/20/2019 4:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sprint](
	[sprintId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](250) NOT NULL,
	[iterationId] [tinyint] NOT NULL,
	[dateBegin] [datetime] NOT NULL,
	[dateEnd] [datetime] NOT NULL,
 CONSTRAINT [PK_sprint] PRIMARY KEY CLUSTERED 
(
	[sprintId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sprintCapacity]    Script Date: 2/20/2019 4:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sprintCapacity](
	[sprintCapacityId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[capacity] [int] NOT NULL,
 CONSTRAINT [PK_sprintCapacity] PRIMARY KEY CLUSTERED 
(
	[sprintCapacityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stateBacklog]    Script Date: 2/20/2019 4:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stateBacklog](
	[stateBacklogId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[color] [varchar](30) NOT NULL,
	[image] [varchar](250) NOT NULL,
 CONSTRAINT [PK_stateBacklog] PRIMARY KEY CLUSTERED 
(
	[stateBacklogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[stateBoard]    Script Date: 2/20/2019 4:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[stateBoard](
	[stateBoardId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[color] [varchar](30) NOT NULL,
	[image] [varchar](250) NULL,
 CONSTRAINT [PK_stateBoard] PRIMARY KEY CLUSTERED 
(
	[stateBoardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tag]    Script Date: 2/20/2019 4:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tag](
	[tagId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](80) NOT NULL,
	[color] [varchar](20) NOT NULL,
	[image] [varchar](250) NULL,
 CONSTRAINT [PK_tag] PRIMARY KEY CLUSTERED 
(
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo]    Script Date: 2/20/2019 4:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo](
	[tipoId] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](80) NOT NULL,
	[color] [varchar](30) NOT NULL,
 CONSTRAINT [PK_tipo] PRIMARY KEY CLUSTERED 
(
	[tipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user]    Script Date: 2/20/2019 4:15:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](70) NOT NULL,
	[email] [varchar](80) NOT NULL,
	[password] [varbinary](50) NULL,
	[state] [bit] NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[backlog]  WITH CHECK ADD  CONSTRAINT [FK_backlog_board] FOREIGN KEY([boardId])
REFERENCES [dbo].[board] ([boardId])
GO
ALTER TABLE [dbo].[backlog] CHECK CONSTRAINT [FK_backlog_board]
GO
ALTER TABLE [dbo].[backlog]  WITH CHECK ADD  CONSTRAINT [FK_backlog_stateBacklog] FOREIGN KEY([stateBacklogId])
REFERENCES [dbo].[stateBacklog] ([stateBacklogId])
GO
ALTER TABLE [dbo].[backlog] CHECK CONSTRAINT [FK_backlog_stateBacklog]
GO
ALTER TABLE [dbo].[backlogItem]  WITH CHECK ADD  CONSTRAINT [FK_backlogItem_sprintCapacity] FOREIGN KEY([sprintCapacityId])
REFERENCES [dbo].[sprintCapacity] ([sprintCapacityId])
GO
ALTER TABLE [dbo].[backlogItem] CHECK CONSTRAINT [FK_backlogItem_sprintCapacity]
GO
ALTER TABLE [dbo].[board]  WITH CHECK ADD  CONSTRAINT [FK_board_area] FOREIGN KEY([areaId])
REFERENCES [dbo].[area] ([areaId])
GO
ALTER TABLE [dbo].[board] CHECK CONSTRAINT [FK_board_area]
GO
ALTER TABLE [dbo].[board]  WITH CHECK ADD  CONSTRAINT [FK_board_iteration] FOREIGN KEY([iterationId])
REFERENCES [dbo].[iteration] ([iterationId])
GO
ALTER TABLE [dbo].[board] CHECK CONSTRAINT [FK_board_iteration]
GO
ALTER TABLE [dbo].[board]  WITH CHECK ADD  CONSTRAINT [FK_board_stateBoard] FOREIGN KEY([stateBoardId])
REFERENCES [dbo].[stateBoard] ([stateBoardId])
GO
ALTER TABLE [dbo].[board] CHECK CONSTRAINT [FK_board_stateBoard]
GO
ALTER TABLE [dbo].[board]  WITH CHECK ADD  CONSTRAINT [FK_board_tag] FOREIGN KEY([tagId])
REFERENCES [dbo].[tag] ([tagId])
GO
ALTER TABLE [dbo].[board] CHECK CONSTRAINT [FK_board_tag]
GO
ALTER TABLE [dbo].[board]  WITH CHECK ADD  CONSTRAINT [FK_board_user] FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([userId])
GO
ALTER TABLE [dbo].[board] CHECK CONSTRAINT [FK_board_user]
GO
ALTER TABLE [dbo].[sprint]  WITH CHECK ADD  CONSTRAINT [FK_sprint_iteration] FOREIGN KEY([iterationId])
REFERENCES [dbo].[iteration] ([iterationId])
GO
ALTER TABLE [dbo].[sprint] CHECK CONSTRAINT [FK_sprint_iteration]
GO
ALTER TABLE [dbo].[sprintCapacity]  WITH CHECK ADD  CONSTRAINT [FK_sprintCapacity_user] FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([userId])
GO
ALTER TABLE [dbo].[sprintCapacity] CHECK CONSTRAINT [FK_sprintCapacity_user]
GO
