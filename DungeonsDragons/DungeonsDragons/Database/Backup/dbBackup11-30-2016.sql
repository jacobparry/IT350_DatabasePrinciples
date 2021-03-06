USE [master]
GO
/****** Object:  Database [DungeonsDragons]    Script Date: 11/30/2016 3:32:00 PM ******/
CREATE DATABASE [DungeonsDragons]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DungeonsDragons', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\DungeonsDragons.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DungeonsDragons_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\DungeonsDragons_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[DD_Action]    Script Date: 11/30/2016 3:32:01 PM ******/
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
/****** Object:  Table [dbo].[DD_Adventure]    Script Date: 11/30/2016 3:32:02 PM ******/
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
/****** Object:  Table [dbo].[DD_Beastiary]    Script Date: 11/30/2016 3:32:02 PM ******/
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
/****** Object:  Table [dbo].[DD_Character]    Script Date: 11/30/2016 3:32:02 PM ******/
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
	[StrengthModifier] [int] NOT NULL,
	[DexterityModifier] [int] NOT NULL,
	[ConstitutionModifer] [int] NOT NULL,
	[IntelligenceModifier] [int] NOT NULL,
	[WisdomModifier] [int] NOT NULL,
	[CharismaModifier] [int] NOT NULL,
	[StrengthSavingThrow] [int] NOT NULL,
	[DexteritySavingThrow] [int] NOT NULL,
	[ConstitutinSavingThrow] [int] NOT NULL,
	[IntelligenceSavingThrow] [int] NOT NULL,
	[WisdomSavingThrow] [int] NOT NULL,
	[CharismaSavingThrow] [int] NOT NULL,
	[Background] [varchar](255) NULL,
	[Faction] [varchar](255) NULL,
	[Alignment] [varchar](255) NULL,
	[ExperiencePoints] [int] NULL,
 CONSTRAINT [PK_DD_Character] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_CharacterHasAction]    Script Date: 11/30/2016 3:32:02 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasAdventure]    Script Date: 11/30/2016 3:32:02 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasItem]    Script Date: 11/30/2016 3:32:03 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasPack]    Script Date: 11/30/2016 3:32:03 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasSkill]    Script Date: 11/30/2016 3:32:03 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasSpell]    Script Date: 11/30/2016 3:32:03 PM ******/
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
/****** Object:  Table [dbo].[DD_Class]    Script Date: 11/30/2016 3:32:03 PM ******/
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
/****** Object:  Table [dbo].[DD_Creep]    Script Date: 11/30/2016 3:32:03 PM ******/
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
/****** Object:  Table [dbo].[DD_Item]    Script Date: 11/30/2016 3:32:03 PM ******/
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
/****** Object:  Table [dbo].[DD_Pack]    Script Date: 11/30/2016 3:32:03 PM ******/
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
/****** Object:  Table [dbo].[DD_Race]    Script Date: 11/30/2016 3:32:03 PM ******/
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
/****** Object:  Table [dbo].[DD_Skill]    Script Date: 11/30/2016 3:32:03 PM ******/
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
/****** Object:  Table [dbo].[DD_Spell]    Script Date: 11/30/2016 3:32:03 PM ******/
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
/****** Object:  Table [dbo].[DD_User]    Script Date: 11/30/2016 3:32:03 PM ******/
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

INSERT [dbo].[DD_Character] ([ID], [UserID], [CharacterName], [DateCreated], [LastPlayed], [RaceID], [ClassID], [CharacterLevel], [MaxHitPoints], [TempHitPoints], [Strength], [Dexterity], [Constitution], [Intelligence], [Wisdom], [Charisma], [ArmorClass], [StrengthModifier], [DexterityModifier], [ConstitutionModifer], [IntelligenceModifier], [WisdomModifier], [CharismaModifier], [StrengthSavingThrow], [DexteritySavingThrow], [ConstitutinSavingThrow], [IntelligenceSavingThrow], [WisdomSavingThrow], [CharismaSavingThrow], [Background], [Faction], [Alignment], [ExperiencePoints]) VALUES (2, 1, N'Rand Al''Thor', CAST(N'2016-11-25' AS Date), CAST(N'2016-11-25' AS Date), 1, 1, 1, 15, 15, 18, 18, 18, 18, 18, 18, 15, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, N'Tragic', N'dunno', N'Chaotic Good', 1)
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
SET IDENTITY_INSERT [dbo].[DD_Creep] ON 

INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (1, N'Aarakocra')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (2, N'Aboleth')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (3, N'Angels')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (4, N'Animated Objects')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (5, N'Ankheg')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (6, N'Azer')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (7, N'Banshee')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (8, N'Basilisk')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (9, N'Behir')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (10, N'Beholders')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (11, N'Blights')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (12, N'Bugbears')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (13, N'Bulette')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (14, N'Bullywug')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (15, N'Cambion')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (16, N'Carrion Crawler')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (17, N'Centaur')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (18, N'Chimera')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (19, N'Chuul')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (20, N'Cloaker')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (21, N'Cockatrice')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (22, N'Couatl')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (23, N'Crawling Claw')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (24, N'Cyclops')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (25, N'Darkmantle')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (26, N'Death Knight')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (27, N'Demilich')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (28, N'Demons')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (29, N'Devils')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (30, N'Dinosaurs')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (31, N'Displacer Beast')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (32, N'Doppelganger')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (33, N'Dragon, Shadow')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (34, N'Dragons')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (35, N'Dragon Turtle')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (36, N'Drider')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (37, N'Dryad')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (38, N'Duergar')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (39, N'Elementals')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (40, N'Elves: Drow')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (41, N'Empyrean')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (42, N'Ettercap')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (43, N'Ettin')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (44, N'Faerie Dragon')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (45, N'Flameskull')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (46, N'Flumph')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (47, N'Fomorian')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (48, N'Fungi')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (49, N'Galeb Duhr')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (50, N'Gargoyle')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (51, N'Genies')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (52, N'Ghost')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (53, N'Ghouls')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (54, N'Giants')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (55, N'Gibbering Mouther')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (56, N'Gith')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (57, N'Gnolls')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (58, N'Gnome, Deep (Svirfneblin)')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (59, N'Goblins')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (60, N'Golems')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (61, N'Gorgon')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (62, N'Grell')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (63, N'Grick')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (64, N'Griffon')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (65, N'Grimlock')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (66, N'Hags')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (67, N'Half-Dragon')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (68, N'Harpy')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (69, N'Hell Hound')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (70, N'Helmed Horror')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (71, N'Hippogriff')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (72, N'Hobgoblins')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (73, N'Homunculus')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (74, N'Hook Horror')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (75, N'Hydra')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (76, N'Intellect Devourer')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (77, N'Invisible Stalker')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (78, N'Jackalwere')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (79, N'Kenku')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (80, N'Kobolds')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (81, N'Kraken')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (82, N'Kuo-toa')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (83, N'Lamia')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (84, N'Lich')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (85, N'Lizardfolk')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (86, N'Lycanthropes')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (87, N'Magmin')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (88, N'Manticore')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (89, N'Medusa')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (90, N'Mephits')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (91, N'Merfolk')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (92, N'Merrow')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (93, N'Mimic')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (94, N'Mind Flayer')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (95, N'Minotaur')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (96, N'Modrons')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (97, N'Mummies')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (98, N'Myconids')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (99, N'Nagas')
GO
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (100, N'Nightmare')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (101, N'Nothic')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (102, N'Ogres')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (103, N'Oni')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (104, N'Oozes')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (105, N'Orcs')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (106, N'Otyugh')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (107, N'Owlbear')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (108, N'Pegasus')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (109, N'Peryton')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (110, N'Piercer')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (111, N'Pixie')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (112, N'Pseudodragon')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (113, N'Purple Worm')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (114, N'Quaggoth')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (115, N'Rakshasa')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (116, N'Remorhazes')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (117, N'Revenant')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (118, N'Roc')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (119, N'Roper')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (120, N'Rust Monster')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (121, N'Sahuagin')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (122, N'Salamanders')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (123, N'Satyr')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (124, N'Scarecrow')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (125, N'Shadow')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (126, N'Shambling Mound')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (127, N'Shield Guardian')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (128, N'Skeletons')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (129, N'Slaadi')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (130, N'Specter')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (131, N'Sphinxes')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (132, N'Sprite')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (133, N'Stirge')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (134, N'Succubus/Incubus')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (135, N'Tarrasque')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (136, N'Thri-kreen')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (137, N'Treant')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (138, N'Troglodyte')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (139, N'Troll')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (140, N'Umber Hulk')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (141, N'Unicorn')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (142, N'Vampires')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (143, N'Water Weird')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (144, N'Wight')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (145, N'Will-o-wisp')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (146, N'Wraith')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (147, N'Wyvern')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (148, N'Xorn')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (149, N'Yetis')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (150, N'Yuan-ti')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (151, N'Yugoloths')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (152, N'Zombies')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (153, N'Ape')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (154, N'Awakened Shrub')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (155, N'Awakened Tree')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (156, N'Axe Beak')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (157, N'Baboon')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (158, N'Badger')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (159, N'Bat')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (160, N'Black Bear')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (161, N'Blink Dog')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (162, N'Blood Hawk')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (163, N'Boar')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (164, N'Brown Bear')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (165, N'Camel')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (166, N'Cat')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (167, N'Constrictor Snake')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (168, N'Crab')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (169, N'Crocodile')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (170, N'Death Dog')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (171, N'Deer')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (172, N'Dire Wolf')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (173, N'Draft Horse')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (174, N'Eagle')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (175, N'Elephant')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (176, N'Elk')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (177, N'Flying Snake')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (178, N'Frog')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (179, N'Giant Ape')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (180, N'Giant Badger')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (181, N'Giant Bat')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (182, N'Giant Boar')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (183, N'Giant Centipede')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (184, N'Giant Constrictor Snake')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (185, N'Giant Crab')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (186, N'Giant Crocodile')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (187, N'Giant Eagle')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (188, N'Giant Elk')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (189, N'Giant Fire Beetle')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (190, N'Giant Frog')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (191, N'Giant Goat')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (192, N'Giant Hyena')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (193, N'Giant Lizard')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (194, N'Giant Octopus')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (195, N'Giant Owl')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (196, N'Giant POisonous Snake')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (197, N'Giant Rat')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (198, N'Giant Scorpian')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (199, N'Giant Sea Horse')
GO
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (200, N'Giant Shark')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (201, N'Giant Spider')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (202, N'Giant Toad')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (203, N'Giant Vulture')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (204, N'Giant Wasp')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (205, N'Giant Weasel')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (206, N'Giant Wolf Spider')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (207, N'Goat')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (208, N'Hawk')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (209, N'Hunter Shark')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (210, N'Hyena')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (211, N'Jackal')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (212, N'Killer Whale')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (213, N'Lion')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (214, N'Lizard')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (215, N'Mammoth')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (216, N'Mastiff')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (217, N'Mule')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (218, N'Octopus')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (219, N'Owl')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (220, N'Panther')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (221, N'Phase Spider')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (222, N'Poisonous Snake')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (223, N'Polar Bear')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (224, N'Pony')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (225, N'Quipper')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (226, N'Rat')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (227, N'Raven')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (228, N'Reef Shark')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (229, N'Rhinoceros')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (230, N'Riding Horse')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (231, N'Saber-Toothed Tiger')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (232, N'Scorpian')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (233, N'Sea Horse')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (234, N'Spider')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (235, N'Swarm of Bats')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (236, N'Swarm of Insects')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (237, N'Swarm of Poisonous Snakes')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (238, N'Swarm of Quippers')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (239, N'Swarm of Rats')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (240, N'Tiger')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (241, N'Swarm of Ravens')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (242, N'Vulture')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (243, N'Warhorse')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (244, N'Weasel')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (245, N'Winter Wolf')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (246, N'Wolf')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (247, N'Worg')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (248, N'Acolyte')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (249, N'Archmage')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (250, N'Assassin')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (251, N'Bandit')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (252, N'Bandit Captain')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (253, N'Berserker')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (254, N'Commoner')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (255, N'Cultist')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (256, N'Cult Fanatic')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (257, N'Druid')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (258, N'Gladiator')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (259, N'Guard')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (260, N'Knight')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (261, N'Mage')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (262, N'Noble')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (263, N'Priest')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (264, N'Scout')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (265, N'Spy')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (266, N'Thug')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (267, N'Tribal Warrior')
INSERT [dbo].[DD_Creep] ([ID], [Name]) VALUES (268, N'Veteran')
SET IDENTITY_INSERT [dbo].[DD_Creep] OFF
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
/****** Object:  Trigger [dbo].[DungeonsDragons_StatModifier]    Script Date: 11/30/2016 3:32:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[DungeonsDragons_StatModifier]
       ON [dbo].[DD_Character]
AFTER INSERT, UPDATE
AS
BEGIN
     Update DD_Character
	 Set StrengthModifier = (Strength -10)/2;
	 Update DD_Character
	 Set DexterityModifier = (Dexterity - 10) /2;
	 Update DD_Character
	 Set ConstitutionModifer = (Constitution - 10) /2;
	 Update DD_Character
	 Set IntelligenceModifier = (Intelligence - 10) /2;
	 Update DD_Character
	 Set WisdomModifier = (Wisdom - 10) /2;
	 Update DD_Character
	 Set CharismaModifier = (Charisma - 10) /2;

	 Update DD_Character
	 Set StrengthSavingThrow = StrengthModifier;
	 Update DD_Character
	 Set DexteritySavingThrow = DexterityModifier;
	 Update DD_Character
	 Set ConstitutinSavingThrow = ConstitutionModifer;
	 Update DD_Character
	 Set IntelligenceSavingThrow = IntelligenceModifier;
	 Update DD_Character
	 Set WisdomSavingThrow = WisdomModifier;
	 Update DD_Character
	 Set CharismaSavingThrow = CharismaModifier;
END

GO
ALTER TABLE [dbo].[DD_Character] ENABLE TRIGGER [DungeonsDragons_StatModifier]
GO
USE [master]
GO
ALTER DATABASE [DungeonsDragons] SET  READ_WRITE 
GO
