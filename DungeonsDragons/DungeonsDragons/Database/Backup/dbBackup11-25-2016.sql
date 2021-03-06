USE [master]
GO
/****** Object:  Database [DungeonsDragons]    Script Date: 11/25/2016 4:23:03 PM ******/
CREATE DATABASE [DungeonsDragons]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DungeonsDragons', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DungeonsDragons.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DungeonsDragons_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DungeonsDragons_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DungeonsDragons] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DungeonsDragons].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DungeonsDragons] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DungeonsDragons] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DungeonsDragons] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DungeonsDragons] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DungeonsDragons] SET ARITHABORT OFF 
GO
ALTER DATABASE [DungeonsDragons] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DungeonsDragons] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DungeonsDragons] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DungeonsDragons] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DungeonsDragons] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DungeonsDragons] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DungeonsDragons] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DungeonsDragons] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DungeonsDragons] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DungeonsDragons] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DungeonsDragons] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DungeonsDragons] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DungeonsDragons] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DungeonsDragons] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DungeonsDragons] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DungeonsDragons] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DungeonsDragons] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DungeonsDragons] SET RECOVERY FULL 
GO
ALTER DATABASE [DungeonsDragons] SET  MULTI_USER 
GO
ALTER DATABASE [DungeonsDragons] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DungeonsDragons] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DungeonsDragons] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DungeonsDragons] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DungeonsDragons] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DungeonsDragons', N'ON'
GO
ALTER DATABASE [DungeonsDragons] SET QUERY_STORE = OFF
GO
USE [DungeonsDragons]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DungeonsDragons]
GO
/****** Object:  Table [dbo].[DD_Action]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_Action](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[RaceID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[RequiredLevel] [int] NOT NULL,
 CONSTRAINT [PK_DD_Action] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_Adventure]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_Adventure](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Campaign] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DD_Adventure] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_Beastiary]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_Beastiary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CharacterID] [int] NOT NULL,
	[CreepID] [int] NOT NULL,
	[HasSeen] [bit] NOT NULL,
 CONSTRAINT [PK_DD_Beastiary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_Character]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_Character](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CharacterName] [varchar](50) NOT NULL,
	[DateCreated] [date] NOT NULL,
	[LastPlayed] [date] NULL,
	[RaceID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[CharacterLevel] [int] NOT NULL,
	[MaxHitPoints] [int] NOT NULL,
	[TempHitPoints] [int] NOT NULL,
	[Strength] [int] NOT NULL,
	[Dexterity] [int] NOT NULL,
	[Constitution] [int] NOT NULL,
	[Intelligence] [int] NOT NULL,
	[Wisdom] [int] NOT NULL,
	[Charisma] [int] NOT NULL,
	[ArmorClass] [int] NOT NULL,
 CONSTRAINT [PK_DD_Character] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_CharacterHasAction]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_CharacterHasAction](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CharacterID] [int] NOT NULL,
	[ActionID] [int] NOT NULL,
 CONSTRAINT [PK_DD_CharacterHasAction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_CharacterHasAdventure]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_CharacterHasAdventure](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CharacterID] [int] NOT NULL,
	[AdventureID] [int] NOT NULL,
	[StartDate] [int] NOT NULL,
	[IsComplete] [bit] NOT NULL,
	[DungeonMaster] [varchar](50) NULL,
 CONSTRAINT [PK_DD_CharacterHasAdventure] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_CharacterHasItem]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_CharacterHasItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CharacterID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[CurrentDurability] [int] NULL,
 CONSTRAINT [PK_DD_CharacterHasItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_CharacterHasPack]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_CharacterHasPack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CharacterID] [int] NOT NULL,
	[PackID] [int] NOT NULL,
	[CurrentCapacity] [int] NOT NULL,
 CONSTRAINT [PK_DD_CharacterHasPack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_CharacterHasSkill]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_CharacterHasSkill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CharacterID] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_DD_CharacterHasSkill] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_CharacterHasSpell]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_CharacterHasSpell](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CharacterID] [int] NOT NULL,
	[SpellID] [int] NOT NULL,
 CONSTRAINT [PK_DD_CharacterHasSpell] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_Class]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_Class](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DD_Class] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_Creep]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_Creep](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DD_Creep] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_Item]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_Item](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[MaxDurability] [int] NULL,
 CONSTRAINT [PK_DD_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_Pack]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_Pack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[MaxCapacity] [int] NOT NULL,
 CONSTRAINT [PK_DD_Pack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_Race]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_Race](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DD_Race] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_Skill]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_Skill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DD_Skill] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_Spell]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_Spell](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[RaceID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[RequiredLevel] [int] NOT NULL,
	[ManaCost] [int] NULL,
 CONSTRAINT [PK_DD_Spell] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_User]    Script Date: 11/25/2016 4:23:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[DateCreated] [date] NOT NULL,
 CONSTRAINT [PK_DD_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DD_Character] ON 

INSERT [dbo].[DD_Character] ([ID], [UserID], [CharacterName], [DateCreated], [LastPlayed], [RaceID], [ClassID], [CharacterLevel], [MaxHitPoints], [TempHitPoints], [Strength], [Dexterity], [Constitution], [Intelligence], [Wisdom], [Charisma], [ArmorClass]) VALUES (2, 1, N'Rand Al''Thor', CAST(N'2016-11-25' AS Date), CAST(N'2016-11-25' AS Date), 1, 1, 1, 15, 15, 18, 18, 18, 18, 18, 18, 15)
SET IDENTITY_INSERT [dbo].[DD_Character] OFF
SET IDENTITY_INSERT [dbo].[DD_CharacterHasSkill] ON 

INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (1, 2, 1, 1)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (2, 2, 2, 2)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (4, 2, 3, 3)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (5, 2, 4, 4)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (6, 2, 5, 5)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (7, 2, 6, 6)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (8, 2, 7, 7)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (9, 2, 8, 8)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (10, 2, 9, 9)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (11, 2, 10, 10)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (12, 2, 11, 11)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (13, 2, 12, 12)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (14, 2, 13, 13)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (15, 2, 14, 14)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (16, 2, 15, 15)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (17, 2, 16, 16)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (18, 2, 17, 17)
INSERT [dbo].[DD_CharacterHasSkill] ([ID], [CharacterID], [SkillID], [Value]) VALUES (19, 2, 18, 18)
SET IDENTITY_INSERT [dbo].[DD_CharacterHasSkill] OFF
SET IDENTITY_INSERT [dbo].[DD_Class] ON 

INSERT [dbo].[DD_Class] ([ID], [Name]) VALUES (1, N'Barbarian')
SET IDENTITY_INSERT [dbo].[DD_Class] OFF
SET IDENTITY_INSERT [dbo].[DD_Race] ON 

INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1, N'Human')
SET IDENTITY_INSERT [dbo].[DD_Race] OFF
SET IDENTITY_INSERT [dbo].[DD_Skill] ON 

INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (1, N'Acrobatics')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (2, N'Animal Handling')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (3, N'Arcana')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (4, N'Athletics')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (5, N'Deception')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (6, N'History')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (7, N'Insight')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (8, N'Intimidation')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (9, N'Investigation')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (10, N'Medicine')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (11, N'Nature')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (12, N'Perception')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (13, N'Performance')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (14, N'Persuasion')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (15, N'Religion')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (16, N'Sleight of Hand')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (17, N'Stealth')
INSERT [dbo].[DD_Skill] ([ID], [Name]) VALUES (18, N'Survival')
SET IDENTITY_INSERT [dbo].[DD_Skill] OFF
SET IDENTITY_INSERT [dbo].[DD_User] ON 

INSERT [dbo].[DD_User] ([ID], [Username], [Password], [FirstName], [LastName], [Email], [DateCreated]) VALUES (1, N'blah', N'9F-86-D0-81-88-4C-7D-65-9A-2F-EA-A0-C5-5A-D0-15-A3-BF-4F-1B-2B-0B-82-2C-D1-5D-6C-15-B0-F0-0A-08', N'john', N'deere', N'test', CAST(N'0001-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[DD_User] OFF
ALTER TABLE [dbo].[DD_Action]  WITH CHECK ADD  CONSTRAINT [FK_DD_Action_DD_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[DD_Class] ([ID])
GO
ALTER TABLE [dbo].[DD_Action] CHECK CONSTRAINT [FK_DD_Action_DD_Class]
GO
ALTER TABLE [dbo].[DD_Action]  WITH CHECK ADD  CONSTRAINT [FK_DD_Action_DD_Race] FOREIGN KEY([RaceID])
REFERENCES [dbo].[DD_Race] ([ID])
GO
ALTER TABLE [dbo].[DD_Action] CHECK CONSTRAINT [FK_DD_Action_DD_Race]
GO
ALTER TABLE [dbo].[DD_Beastiary]  WITH CHECK ADD  CONSTRAINT [FK_DD_Beastiary_DD_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[DD_Character] ([ID])
GO
ALTER TABLE [dbo].[DD_Beastiary] CHECK CONSTRAINT [FK_DD_Beastiary_DD_Character]
GO
ALTER TABLE [dbo].[DD_Beastiary]  WITH CHECK ADD  CONSTRAINT [FK_DD_Beastiary_DD_Creep] FOREIGN KEY([CreepID])
REFERENCES [dbo].[DD_Creep] ([ID])
GO
ALTER TABLE [dbo].[DD_Beastiary] CHECK CONSTRAINT [FK_DD_Beastiary_DD_Creep]
GO
ALTER TABLE [dbo].[DD_Character]  WITH CHECK ADD  CONSTRAINT [FK_DD_Character_DD_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[DD_Class] ([ID])
GO
ALTER TABLE [dbo].[DD_Character] CHECK CONSTRAINT [FK_DD_Character_DD_Class]
GO
ALTER TABLE [dbo].[DD_Character]  WITH CHECK ADD  CONSTRAINT [FK_DD_Character_DD_Race] FOREIGN KEY([RaceID])
REFERENCES [dbo].[DD_Race] ([ID])
GO
ALTER TABLE [dbo].[DD_Character] CHECK CONSTRAINT [FK_DD_Character_DD_Race]
GO
ALTER TABLE [dbo].[DD_Character]  WITH CHECK ADD  CONSTRAINT [FK_DD_Character_DD_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[DD_User] ([ID])
GO
ALTER TABLE [dbo].[DD_Character] CHECK CONSTRAINT [FK_DD_Character_DD_User]
GO
ALTER TABLE [dbo].[DD_CharacterHasAction]  WITH CHECK ADD  CONSTRAINT [FK_DD_CharacterHasAction_DD_Action] FOREIGN KEY([ActionID])
REFERENCES [dbo].[DD_Action] ([ID])
GO
ALTER TABLE [dbo].[DD_CharacterHasAction] CHECK CONSTRAINT [FK_DD_CharacterHasAction_DD_Action]
GO
ALTER TABLE [dbo].[DD_CharacterHasAction]  WITH CHECK ADD  CONSTRAINT [FK_DD_CharacterHasAction_DD_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[DD_Character] ([ID])
GO
ALTER TABLE [dbo].[DD_CharacterHasAction] CHECK CONSTRAINT [FK_DD_CharacterHasAction_DD_Character]
GO
ALTER TABLE [dbo].[DD_CharacterHasAdventure]  WITH CHECK ADD  CONSTRAINT [FK_DD_CharacterHasAdventure_DD_Adventure] FOREIGN KEY([AdventureID])
REFERENCES [dbo].[DD_Adventure] ([ID])
GO
ALTER TABLE [dbo].[DD_CharacterHasAdventure] CHECK CONSTRAINT [FK_DD_CharacterHasAdventure_DD_Adventure]
GO
ALTER TABLE [dbo].[DD_CharacterHasAdventure]  WITH CHECK ADD  CONSTRAINT [FK_DD_CharacterHasAdventure_DD_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[DD_Character] ([ID])
GO
ALTER TABLE [dbo].[DD_CharacterHasAdventure] CHECK CONSTRAINT [FK_DD_CharacterHasAdventure_DD_Character]
GO
ALTER TABLE [dbo].[DD_CharacterHasItem]  WITH CHECK ADD  CONSTRAINT [FK_DD_CharacterHasItem_DD_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[DD_Character] ([ID])
GO
ALTER TABLE [dbo].[DD_CharacterHasItem] CHECK CONSTRAINT [FK_DD_CharacterHasItem_DD_Character]
GO
ALTER TABLE [dbo].[DD_CharacterHasItem]  WITH CHECK ADD  CONSTRAINT [FK_DD_CharacterHasItem_DD_Item] FOREIGN KEY([ItemID])
REFERENCES [dbo].[DD_Item] ([ID])
GO
ALTER TABLE [dbo].[DD_CharacterHasItem] CHECK CONSTRAINT [FK_DD_CharacterHasItem_DD_Item]
GO
ALTER TABLE [dbo].[DD_CharacterHasPack]  WITH CHECK ADD  CONSTRAINT [FK_DD_CharacterHasPack_DD_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[DD_Character] ([ID])
GO
ALTER TABLE [dbo].[DD_CharacterHasPack] CHECK CONSTRAINT [FK_DD_CharacterHasPack_DD_Character]
GO
ALTER TABLE [dbo].[DD_CharacterHasPack]  WITH CHECK ADD  CONSTRAINT [FK_DD_CharacterHasPack_DD_Pack] FOREIGN KEY([PackID])
REFERENCES [dbo].[DD_Pack] ([ID])
GO
ALTER TABLE [dbo].[DD_CharacterHasPack] CHECK CONSTRAINT [FK_DD_CharacterHasPack_DD_Pack]
GO
ALTER TABLE [dbo].[DD_CharacterHasSkill]  WITH CHECK ADD  CONSTRAINT [FK_DD_CharacterHasSkill_DD_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[DD_Character] ([ID])
GO
ALTER TABLE [dbo].[DD_CharacterHasSkill] CHECK CONSTRAINT [FK_DD_CharacterHasSkill_DD_Character]
GO
ALTER TABLE [dbo].[DD_CharacterHasSkill]  WITH CHECK ADD  CONSTRAINT [FK_DD_CharacterHasSkill_DD_Skill] FOREIGN KEY([SkillID])
REFERENCES [dbo].[DD_Skill] ([ID])
GO
ALTER TABLE [dbo].[DD_CharacterHasSkill] CHECK CONSTRAINT [FK_DD_CharacterHasSkill_DD_Skill]
GO
ALTER TABLE [dbo].[DD_CharacterHasSpell]  WITH CHECK ADD  CONSTRAINT [FK_DD_CharacterHasSpell_DD_Character] FOREIGN KEY([CharacterID])
REFERENCES [dbo].[DD_Character] ([ID])
GO
ALTER TABLE [dbo].[DD_CharacterHasSpell] CHECK CONSTRAINT [FK_DD_CharacterHasSpell_DD_Character]
GO
ALTER TABLE [dbo].[DD_CharacterHasSpell]  WITH CHECK ADD  CONSTRAINT [FK_DD_CharacterHasSpell_DD_Spell] FOREIGN KEY([SpellID])
REFERENCES [dbo].[DD_Spell] ([ID])
GO
ALTER TABLE [dbo].[DD_CharacterHasSpell] CHECK CONSTRAINT [FK_DD_CharacterHasSpell_DD_Spell]
GO
ALTER TABLE [dbo].[DD_Spell]  WITH CHECK ADD  CONSTRAINT [FK_DD_Spell_DD_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[DD_Class] ([ID])
GO
ALTER TABLE [dbo].[DD_Spell] CHECK CONSTRAINT [FK_DD_Spell_DD_Class]
GO
ALTER TABLE [dbo].[DD_Spell]  WITH CHECK ADD  CONSTRAINT [FK_DD_Spell_DD_Race] FOREIGN KEY([RaceID])
REFERENCES [dbo].[DD_Race] ([ID])
GO
ALTER TABLE [dbo].[DD_Spell] CHECK CONSTRAINT [FK_DD_Spell_DD_Race]
GO
USE [master]
GO
ALTER DATABASE [DungeonsDragons] SET  READ_WRITE 
GO

INSERT into dd_creep values('Aarakocra');
INSERT into dd_creep values('Aboleth');
INSERT into dd_creep values('Angels');
INSERT into dd_creep values('Animated Objects');
INSERT into dd_creep values('Ankheg');
INSERT into dd_creep values('Azer');
INSERT into dd_creep values('Banshee');
INSERT into dd_creep values('Basilisk');
INSERT into dd_creep values('Behir');
INSERT into dd_creep values('Beholders');
INSERT into dd_creep values('Blights');
INSERT into dd_creep values('Bugbears');
INSERT into dd_creep values('Bulette');
INSERT into dd_creep values('Bullywug');
INSERT into dd_creep values('Cambion');
INSERT into dd_creep values('Carrion Crawler');
INSERT into dd_creep values('Centaur');
INSERT into dd_creep values('Chimera');
INSERT into dd_creep values('Chuul');
INSERT into dd_creep values('Cloaker');
INSERT into dd_creep values('Cockatrice');
INSERT into dd_creep values('Couatl');
INSERT into dd_creep values('Crawling Claw');
INSERT into dd_creep values('Cyclops');
INSERT into dd_creep values('Darkmantle');
INSERT into dd_creep values('Death Knight');
INSERT into dd_creep values('Demilich');
INSERT into dd_creep values('Demons');
INSERT into dd_creep values('Devils');
INSERT into dd_creep values('Dinosaurs');
INSERT into dd_creep values('Displacer Beast');
INSERT into dd_creep values('Doppelganger');
INSERT into dd_creep values('Dragon, Shadow');
INSERT into dd_creep values('Dragons');
INSERT into dd_creep values('Dragon Turtle');
INSERT into dd_creep values('Drider');
INSERT into dd_creep values('Dryad');
INSERT into dd_creep values('Duergar');
INSERT into dd_creep values('Elementals');
INSERT into dd_creep values('Elves: Drow');
INSERT into dd_creep values('Empyrean');
INSERT into dd_creep values('Ettercap');
INSERT into dd_creep values('Ettin');
INSERT into dd_creep values('Faerie Dragon');
INSERT into dd_creep values('Flameskull');
INSERT into dd_creep values('Flumph');
INSERT into dd_creep values('Fomorian');
INSERT into dd_creep values('Fungi');
INSERT into dd_creep values('Galeb Duhr');
INSERT into dd_creep values('Gargoyle');
INSERT into dd_creep values('Genies');
INSERT into dd_creep values('Ghost');
INSERT into dd_creep values('Ghouls');
INSERT into dd_creep values('Giants');
INSERT into dd_creep values('Gibbering Mouther');
INSERT into dd_creep values('Gith');
INSERT into dd_creep values('Gnolls');
INSERT into dd_creep values('Gnome, Deep (Svirfneblin)');
INSERT into dd_creep values('Goblins');
INSERT into dd_creep values('Golems');
INSERT into dd_creep values('Gorgon');
INSERT into dd_creep values('Grell');
INSERT into dd_creep values('Grick');
INSERT into dd_creep values('Griffon');
INSERT into dd_creep values('Grimlock');
INSERT into dd_creep values('Hags');
INSERT into dd_creep values('Half-Dragon');
INSERT into dd_creep values('Harpy');
INSERT into dd_creep values('Hell Hound');
INSERT into dd_creep values('Helmed Horror');
INSERT into dd_creep values('Hippogriff');
INSERT into dd_creep values('Hobgoblins');
INSERT into dd_creep values('Homunculus');
INSERT into dd_creep values('Hook Horror');
INSERT into dd_creep values('Hydra');
INSERT into dd_creep values('Intellect Devourer');
INSERT into dd_creep values('Invisible Stalker');
INSERT into dd_creep values('Jackalwere');
INSERT into dd_creep values('Kenku');
INSERT into dd_creep values('Kobolds');
INSERT into dd_creep values('Kraken');
INSERT into dd_creep values('Kuo-toa');
INSERT into dd_creep values('Lamia');
INSERT into dd_creep values('Lich');
INSERT into dd_creep values('Lizardfolk');
INSERT into dd_creep values('Lycanthropes');
INSERT into dd_creep values('Magmin');
INSERT into dd_creep values('Manticore');
INSERT into dd_creep values('Medusa');
INSERT into dd_creep values('Mephits');
INSERT into dd_creep values('Merfolk');
INSERT into dd_creep values('Merrow');
INSERT into dd_creep values('Mimic');
INSERT into dd_creep values('Mind Flayer');
INSERT into dd_creep values('Minotaur');
INSERT into dd_creep values('Modrons');
INSERT into dd_creep values('Mummies');
INSERT into dd_creep values('Myconids');
INSERT into dd_creep values('Nagas');
INSERT into dd_creep values('Nightmare');
INSERT into dd_creep values('Nothic');
INSERT into dd_creep values('Ogres');
INSERT into dd_creep values('Oni');
INSERT into dd_creep values('Oozes');
INSERT into dd_creep values('Orcs');
INSERT into dd_creep values('Otyugh');
INSERT into dd_creep values('Owlbear');
INSERT into dd_creep values('Pegasus');
INSERT into dd_creep values('Peryton');
INSERT into dd_creep values('Piercer');
INSERT into dd_creep values('Pixie');
INSERT into dd_creep values('Pseudodragon');
INSERT into dd_creep values('Purple Worm');
INSERT into dd_creep values('Quaggoth');
INSERT into dd_creep values('Rakshasa');
INSERT into dd_creep values('Remorhazes');
INSERT into dd_creep values('Revenant');
INSERT into dd_creep values('Roc');
INSERT into dd_creep values('Roper');
INSERT into dd_creep values('Rust Monster');
INSERT into dd_creep values('Sahuagin');
INSERT into dd_creep values('Salamanders');
INSERT into dd_creep values('Satyr');
INSERT into dd_creep values('Scarecrow');
INSERT into dd_creep values('Shadow');
INSERT into dd_creep values('Shambling Mound');
INSERT into dd_creep values('Shield Guardian');
INSERT into dd_creep values('Skeletons');
INSERT into dd_creep values('Slaadi');
INSERT into dd_creep values('Specter');
INSERT into dd_creep values('Sphinxes');
INSERT into dd_creep values('Sprite');
INSERT into dd_creep values('Stirge');
INSERT into dd_creep values('Succubus/Incubus');
INSERT into dd_creep values('Tarrasque');
INSERT into dd_creep values('Thri-kreen');
INSERT into dd_creep values('Treant');
INSERT into dd_creep values('Troglodyte');
INSERT into dd_creep values('Troll');
INSERT into dd_creep values('Umber Hulk');
INSERT into dd_creep values('Unicorn');
INSERT into dd_creep values('Vampires');
INSERT into dd_creep values('Water Weird');
INSERT into dd_creep values('Wight');
INSERT into dd_creep values('Will-o-wisp');
INSERT into dd_creep values('Wraith');
INSERT into dd_creep values('Wyvern');
INSERT into dd_creep values('Xorn');
INSERT into dd_creep values('Yetis');
INSERT into dd_creep values('Yuan-ti');
INSERT into dd_creep values('Yugoloths');
INSERT into dd_creep values('Zombies');
INSERT into dd_creep values('Ape');
INSERT into dd_creep values('Awakened Shrub');
INSERT into dd_creep values('Awakened Tree');
INSERT into dd_creep values('Axe Beak');
INSERT into dd_creep values('Baboon');
INSERT into dd_creep values('Badger');
INSERT into dd_creep values('Bat');
INSERT into dd_creep values('Black Bear');
INSERT into dd_creep values('Blink Dog');
INSERT into dd_creep values('Blood Hawk');
INSERT into dd_creep values('Boar');
INSERT into dd_creep values('Brown Bear');
INSERT into dd_creep values('Camel');
INSERT into dd_creep values('Cat');
INSERT into dd_creep values('Constrictor Snake');
INSERT into dd_creep values('Crab');
INSERT into dd_creep values('Crocodile');
INSERT into dd_creep values('Death Dog');
INSERT into dd_creep values('Deer');
INSERT into dd_creep values('Dire Wolf');
INSERT into dd_creep values('Draft Horse');
INSERT into dd_creep values('Eagle');
INSERT into dd_creep values('Elephant');
INSERT into dd_creep values('Elk');
INSERT into dd_creep values('Flying Snake');
INSERT into dd_creep values('Frog');
INSERT into dd_creep values('Giant Ape');
INSERT into dd_creep values('Giant Badger');
INSERT into dd_creep values('Giant Bat');
INSERT into dd_creep values('Giant Boar');
INSERT into dd_creep values('Giant Centipede');
INSERT into dd_creep values('Giant Constrictor Snake');
INSERT into dd_creep values('Giant Crab');
INSERT into dd_creep values('Giant Crocodile');
INSERT into dd_creep values('Giant Eagle');
INSERT into dd_creep values('Giant Elk');
INSERT into dd_creep values('Giant Fire Beetle');
INSERT into dd_creep values('Giant Frog');
INSERT into dd_creep values('Giant Goat');
INSERT into dd_creep values('Giant Hyena');
INSERT into dd_creep values('Giant Lizard');
INSERT into dd_creep values('Giant Octopus');
INSERT into dd_creep values('Giant Owl');
INSERT into dd_creep values('Giant POisonous Snake');
INSERT into dd_creep values('Giant Rat');
INSERT into dd_creep values('Giant Scorpian');
INSERT into dd_creep values('Giant Sea Horse');
INSERT into dd_creep values('Giant Shark');
INSERT into dd_creep values('Giant Spider');
INSERT into dd_creep values('Giant Toad');
INSERT into dd_creep values('Giant Vulture');
INSERT into dd_creep values('Giant Wasp');
INSERT into dd_creep values('Giant Weasel');
INSERT into dd_creep values('Giant Wolf Spider');
INSERT into dd_creep values('Goat');
INSERT into dd_creep values('Hawk');
INSERT into dd_creep values('Hunter Shark');
INSERT into dd_creep values('Hyena');
INSERT into dd_creep values('Jackal');
INSERT into dd_creep values('Killer Whale');
INSERT into dd_creep values('Lion');
INSERT into dd_creep values('Lizard');
INSERT into dd_creep values('Mammoth');
INSERT into dd_creep values('Mastiff');
INSERT into dd_creep values('Mule');
INSERT into dd_creep values('Octopus');
INSERT into dd_creep values('Owl');
INSERT into dd_creep values('Panther');
INSERT into dd_creep values('Phase Spider');
INSERT into dd_creep values('Poisonous Snake');
INSERT into dd_creep values('Polar Bear');
INSERT into dd_creep values('Pony');
INSERT into dd_creep values('Quipper');
INSERT into dd_creep values('Rat');
INSERT into dd_creep values('Raven');
INSERT into dd_creep values('Reef Shark');
INSERT into dd_creep values('Rhinoceros');
INSERT into dd_creep values('Riding Horse');
INSERT into dd_creep values('Saber-Toothed Tiger');
INSERT into dd_creep values('Scorpian');
INSERT into dd_creep values('Sea Horse');
INSERT into dd_creep values('Spider');
INSERT into dd_creep values('Swarm of Bats');
INSERT into dd_creep values('Swarm of Insects');
INSERT into dd_creep values('Swarm of Poisonous Snakes');
INSERT into dd_creep values('Swarm of Quippers');
INSERT into dd_creep values('Swarm of Rats');
INSERT into dd_creep values('Tiger');
INSERT into dd_creep values('Swarm of Ravens');
INSERT into dd_creep values('Vulture');
INSERT into dd_creep values('Warhorse');
INSERT into dd_creep values('Weasel');
INSERT into dd_creep values('Winter Wolf');
INSERT into dd_creep values('Wolf');
INSERT into dd_creep values('Worg');
INSERT into dd_creep values('Acolyte');
INSERT into dd_creep values('Archmage');
INSERT into dd_creep values('Assassin');
INSERT into dd_creep values('Bandit');
INSERT into dd_creep values('Bandit Captain');
INSERT into dd_creep values('Berserker');
INSERT into dd_creep values('Commoner');
INSERT into dd_creep values('Cultist');
INSERT into dd_creep values('Cult Fanatic');
INSERT into dd_creep values('Druid');
INSERT into dd_creep values('Gladiator');
INSERT into dd_creep values('Guard');
INSERT into dd_creep values('Knight');
INSERT into dd_creep values('Mage');
INSERT into dd_creep values('Noble');
INSERT into dd_creep values('Priest');
INSERT into dd_creep values('Scout');
INSERT into dd_creep values('Spy');
INSERT into dd_creep values('Thug');
INSERT into dd_creep values('Tribal Warrior');
INSERT into dd_creep values('Veteran');
