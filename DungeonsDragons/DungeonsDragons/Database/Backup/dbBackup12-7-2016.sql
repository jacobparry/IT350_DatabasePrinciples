USE [master]
GO
/****** Object:  Database [DungeonsDragons]    Script Date: 12/7/2016 12:48:02 PM ******/
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
/****** Object:  Table [dbo].[DD_Action]    Script Date: 12/7/2016 12:48:02 PM ******/
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
/****** Object:  Table [dbo].[DD_Adventure]    Script Date: 12/7/2016 12:48:03 PM ******/
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
/****** Object:  Table [dbo].[DD_Beastiary]    Script Date: 12/7/2016 12:48:03 PM ******/
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
/****** Object:  Table [dbo].[DD_Character]    Script Date: 12/7/2016 12:48:03 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasAction]    Script Date: 12/7/2016 12:48:03 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasAdventure]    Script Date: 12/7/2016 12:48:03 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasItem]    Script Date: 12/7/2016 12:48:03 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasPack]    Script Date: 12/7/2016 12:48:03 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasSkill]    Script Date: 12/7/2016 12:48:03 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasSpell]    Script Date: 12/7/2016 12:48:04 PM ******/
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
/****** Object:  Table [dbo].[DD_Class]    Script Date: 12/7/2016 12:48:04 PM ******/
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
/****** Object:  Table [dbo].[DD_Creep]    Script Date: 12/7/2016 12:48:04 PM ******/
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
/****** Object:  Table [dbo].[DD_Item]    Script Date: 12/7/2016 12:48:04 PM ******/
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
/****** Object:  Table [dbo].[DD_Pack]    Script Date: 12/7/2016 12:48:04 PM ******/
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
/****** Object:  Table [dbo].[DD_Race]    Script Date: 12/7/2016 12:48:04 PM ******/
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
/****** Object:  Table [dbo].[DD_Skill]    Script Date: 12/7/2016 12:48:04 PM ******/
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
/****** Object:  Table [dbo].[DD_Spell]    Script Date: 12/7/2016 12:48:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_Spell](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ClassID] [int] NOT NULL,
	[RequiredLevel] [int] NOT NULL,
	[ManaCost] [int] NULL,
 CONSTRAINT [PK_DD_Spell] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_User]    Script Date: 12/7/2016 12:48:04 PM ******/
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

INSERT [dbo].[DD_Character] ([ID], [UserID], [CharacterName], [DateCreated], [LastPlayed], [RaceID], [ClassID], [CharacterLevel], [MaxHitPoints], [TempHitPoints], [Strength], [Dexterity], [Constitution], [Intelligence], [Wisdom], [Charisma], [ArmorClass], [StrengthModifier], [DexterityModifier], [ConstitutionModifer], [IntelligenceModifier], [WisdomModifier], [CharismaModifier], [StrengthSavingThrow], [DexteritySavingThrow], [ConstitutinSavingThrow], [IntelligenceSavingThrow], [WisdomSavingThrow], [CharismaSavingThrow], [Background], [Faction], [Alignment], [ExperiencePoints]) VALUES (2, 1, N'Aviendha', CAST(N'2016-11-25' AS Date), CAST(N'2016-11-25' AS Date), 2, 2, 9, 15, 15, 12, 11, 14, 8, 12, 10, 15, 1, 0, 2, -1, 1, 0, 1, 0, 2, -1, 1, 0, N'Testy', N'criminal', N'evil', 36000)
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
SET IDENTITY_INSERT [dbo].[DD_CharacterHasSpell] ON 

INSERT [dbo].[DD_CharacterHasSpell] ([ID], [CharacterID], [SpellID]) VALUES (1, 2, 8)
SET IDENTITY_INSERT [dbo].[DD_CharacterHasSpell] OFF
SET IDENTITY_INSERT [dbo].[DD_Class] ON 

INSERT [dbo].[DD_Class] ([ID], [Name]) VALUES (1, N'Barbarian')
INSERT [dbo].[DD_Class] ([ID], [Name]) VALUES (2, N'Ranger')
INSERT [dbo].[DD_Class] ([ID], [Name]) VALUES (3, N'Bard')
INSERT [dbo].[DD_Class] ([ID], [Name]) VALUES (4, N'Cleric')
INSERT [dbo].[DD_Class] ([ID], [Name]) VALUES (5, N'Druid')
INSERT [dbo].[DD_Class] ([ID], [Name]) VALUES (6, N'Fighter')
INSERT [dbo].[DD_Class] ([ID], [Name]) VALUES (7, N'Monk')
INSERT [dbo].[DD_Class] ([ID], [Name]) VALUES (8, N'Paladin')
INSERT [dbo].[DD_Class] ([ID], [Name]) VALUES (9, N'Ranger')
INSERT [dbo].[DD_Class] ([ID], [Name]) VALUES (10, N'Rogue')
INSERT [dbo].[DD_Class] ([ID], [Name]) VALUES (11, N'Sorcerer')
INSERT [dbo].[DD_Class] ([ID], [Name]) VALUES (12, N'Warlock')
INSERT [dbo].[DD_Class] ([ID], [Name]) VALUES (13, N'Wizard')
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
SET IDENTITY_INSERT [dbo].[DD_Item] ON 

INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (135, N'Club', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (136, N'Greatclub', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (137, N'Handaxe', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (138, N'Javelin', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (139, N'Light hammer', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (140, N'Mace', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (141, N'Quarterstaff', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (142, N'Sickle', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (143, N'Spear', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (144, N'Crossbow, light', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (145, N'Dart', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (146, N'Shortbow', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (147, N'Sling', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (148, N'Battleaxe', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (149, N'Flail', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (150, N'Glaive', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (151, N'Greataxe', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (152, N'Greatsword', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (153, N'Halberd', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (154, N'Lance', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (155, N'Longsword', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (156, N'Maul', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (157, N'Morningstar', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (158, N'Pike', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (159, N'Rapier', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (160, N'Scimitar', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (161, N'Shortsword', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (162, N'Trident', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (163, N'War pick', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (164, N'Warhammer', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (165, N'Whip', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (166, N'Blowgun', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (167, N'Crossbow, hand', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (168, N'Crossbow, heavy', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (169, N'Longbow', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (170, N'Net', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (171, N'Abacus', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (172, N'Acid (vial)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (173, N'Alchemists Fire (flask)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (174, N'Arrows', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (175, N'Blowgun Needles', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (176, N'Crossbow bolts', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (177, N'Sling bullets', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (178, N'Antitoxin (vial)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (179, N'Crystal', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (180, N'Orb', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (181, N'Rod', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (182, N'Staff', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (183, N'Wand', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (184, N'Backpack', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (185, N'Ball bearings', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (186, N'Barrel', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (187, N'Basket', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (188, N'Bedroll', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (189, N'Bell', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (190, N'Blanket', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (191, N'Block and tackle', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (192, N'Book', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (193, N'Bottle, glass', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (194, N'Bucket', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (195, N'Caltrops', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (196, N'Candle', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (197, N'Case, crossbow bolt', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (198, N'Case, map or scroll', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (199, N'Chain', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (200, N'Chalk', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (201, N'Chest', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (202, N'Climbers Kit', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (203, N'Clothes, common', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (204, N'Clothes, costume', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (205, N'Clothes, fine', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (206, N'Clothes, travelers', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (207, N'Component Pouch', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (208, N'Crowbar', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (209, N'Sprig of mistletoe', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (210, N'Totem', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (211, N'Wooden Staff', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (212, N'Yew wand', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (213, N'Fishing Tackle', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (214, N'Flask or tankard', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (215, N'Grappling Hook', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (216, N'Hammer', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (217, N'Hammer, sledge', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (218, N'Healers kit', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (219, N'Amulet', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (220, N'Emblem', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (221, N'Reliquary', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (222, N'Holy water (flask)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (223, N'Hourglass', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (224, N'Hunting trap', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (225, N'Ink (1 once bottle)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (226, N'Ink Pen', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (227, N'Jug or pitcher', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (228, N'Ladder (10-foot)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (229, N'Lamp', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (230, N'Lantern, bullseye', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (231, N'Lantern, hooded', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (232, N'Lock', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (233, N'Magnifying Glass', NULL)
GO
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (234, N'Manacles', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (235, N'Mess kit', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (236, N'Mirror, steel', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (237, N'Oil, flask', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (238, N'Paper (one sheet)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (239, N'Perfume (vial)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (240, N'Pick, miners', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (241, N'Piton', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (242, N'Poison, basic (vial)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (243, N'Pole (10 foot)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (244, N'Pot, iron', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (245, N'Potion of Healing', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (246, N'Pouch', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (247, N'Quiver', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (248, N'Ram, Portable', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (249, N'Rations (1 day)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (250, N'Robes', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (251, N'Rope, hempen (50 feet)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (252, N'Rope, silk (50 feet)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (253, N'Slack', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (254, N'Scale, merchants', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (255, N'Sealing wax', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (256, N'Shovel', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (257, N'Signal whistle', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (258, N'Signet ring', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (259, N'Soap', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (260, N'Spellbook', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (261, N'Spikes, iron (10)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (262, N'Spyglass', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (263, N'Ten, two-person', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (264, N'Tinderbox', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (265, N'Torch', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (266, N'Vial', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (267, N'Waterskin', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (268, N'Whetstone', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (269, N'Club', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (270, N'Greatclub', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (271, N'Handaxe', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (272, N'Javelin', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (273, N'Light hammer', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (274, N'Mace', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (275, N'Quarterstaff', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (276, N'Sickle', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (277, N'Spear', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (278, N'Crossbow, light', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (279, N'Dart', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (280, N'Shortbow', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (281, N'Sling', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (282, N'Battleaxe', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (283, N'Flail', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (284, N'Glaive', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (285, N'Greataxe', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (286, N'Greatsword', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (287, N'Halberd', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (288, N'Lance', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (289, N'Longsword', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (290, N'Maul', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (291, N'Morningstar', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (292, N'Pike', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (293, N'Rapier', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (294, N'Scimitar', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (295, N'Shortsword', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (296, N'Trident', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (297, N'War pick', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (298, N'Warhammer', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (299, N'Whip', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (300, N'Blowgun', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (301, N'Crossbow, hand', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (302, N'Crossbow, heavy', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (303, N'Longbow', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (304, N'Net', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (305, N'Abacus', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (306, N'Acid (vial)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (307, N'Alchemists Fire (flask)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (308, N'Arrows', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (309, N'Blowgun Needles', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (310, N'Crossbow bolts', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (311, N'Sling bullets', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (312, N'Antitoxin (vial)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (313, N'Crystal', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (314, N'Orb', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (315, N'Rod', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (316, N'Staff', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (317, N'Wand', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (318, N'Backpack', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (319, N'Ball bearings', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (320, N'Barrel', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (321, N'Basket', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (322, N'Bedroll', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (323, N'Bell', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (324, N'Blanket', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (325, N'Block and tackle', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (326, N'Book', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (327, N'Bottle, glass', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (328, N'Bucket', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (329, N'Caltrops', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (330, N'Candle', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (331, N'Case, crossbow bolt', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (332, N'Case, map or scroll', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (333, N'Chain', NULL)
GO
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (334, N'Chalk', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (335, N'Chest', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (336, N'Climbers Kit', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (337, N'Clothes, common', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (338, N'Clothes, costume', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (339, N'Clothes, fine', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (340, N'Clothes, travelers', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (341, N'Component Pouch', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (342, N'Crowbar', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (343, N'Sprig of mistletoe', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (344, N'Totem', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (345, N'Wooden Staff', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (346, N'Yew wand', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (347, N'Fishing Tackle', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (348, N'Flask or tankard', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (349, N'Grappling Hook', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (350, N'Hammer', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (351, N'Hammer, sledge', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (352, N'Healers kit', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (353, N'Amulet', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (354, N'Emblem', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (355, N'Reliquary', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (356, N'Holy water (flask)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (357, N'Hourglass', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (358, N'Hunting trap', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (359, N'Ink (1 once bottle)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (360, N'Ink Pen', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (361, N'Jug or pitcher', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (362, N'Ladder (10-foot)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (363, N'Lamp', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (364, N'Lantern, bullseye', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (365, N'Lantern, hooded', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (366, N'Lock', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (367, N'Magnifying Glass', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (368, N'Manacles', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (369, N'Mess kit', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (370, N'Mirror, steel', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (371, N'Oil, flask', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (372, N'Paper (one sheet)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (373, N'Perfume (vial)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (374, N'Pick, miners', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (375, N'Piton', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (376, N'Poison, basic (vial)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (377, N'Pole (10 foot)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (378, N'Pot, iron', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (379, N'Potion of Healing', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (380, N'Pouch', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (381, N'Quiver', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (382, N'Ram, Portable', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (383, N'Rations (1 day)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (384, N'Robes', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (385, N'Rope, hempen (50 feet)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (386, N'Rope, silk (50 feet)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (387, N'Slack', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (388, N'Scale, merchants', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (389, N'Sealing wax', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (390, N'Shovel', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (391, N'Signal whistle', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (392, N'Signet ring', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (393, N'Soap', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (394, N'Spellbook', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (395, N'Spikes, iron (10)', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (396, N'Spyglass', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (397, N'Ten, two-person', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (398, N'Tinderbox', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (399, N'Torch', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (400, N'Vial', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (401, N'Waterskin', NULL)
INSERT [dbo].[DD_Item] ([ID], [Name], [MaxDurability]) VALUES (402, N'Whetstone', NULL)
SET IDENTITY_INSERT [dbo].[DD_Item] OFF
SET IDENTITY_INSERT [dbo].[DD_Race] ON 

INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1, N'Human')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (2, N'Dwarf')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (3, N'Orc')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1002, N'Dwarf')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1003, N'Elf')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1004, N'Halfling')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1005, N'Dragonborn')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1006, N'Gnome')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1007, N'Half-Elf')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1008, N'Half-Orc')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1009, N'Tiefling')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1010, N'Dwarf')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1011, N'Elf')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1012, N'Halfling')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1013, N'Dragonborn')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1014, N'Gnome')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1015, N'Half-Elf')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1016, N'Half-Orc')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1017, N'Tiefling')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1018, N'Dwarf')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1019, N'Elf')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1020, N'Halfling')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1021, N'Dragonborn')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1022, N'Gnome')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1023, N'Half-Elf')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1024, N'Half-Orc')
INSERT [dbo].[DD_Race] ([ID], [Name]) VALUES (1025, N'Tiefling')
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
SET IDENTITY_INSERT [dbo].[DD_Spell] ON 

INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (1, N'Blade Ward', 2, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (2, N'Dancing Lights', 2, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (3, N'Friends', 2, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (4, N'Light', 2, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (5, N'Mage Hand', 2, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (6, N'Mending', 2, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (7, N'Message', 2, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (8, N'Minor Illusion', 2, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (9, N'Prestidigitation', 2, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (10, N'True Strike', 2, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (11, N'Vicious Mockery', 2, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (12, N'Animal Friendship', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (13, N'Bane', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (14, N'Charm Person', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (15, N'Comprehend Languages', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (16, N'Cure Wounds', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (17, N'Detect Magic', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (18, N'Disguise Self', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (19, N'Dissonant Whispers', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (20, N'Faerie Fire', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (21, N'Feather Fall', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (22, N'Healing Word', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (23, N'Heroism', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (24, N'Identify', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (25, N'Illusory Script', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (26, N'Longstrider', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (27, N'Silent Image', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (28, N'Sleep', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (29, N'Speak with Animals', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (30, N'Tashas Hideous Laughter', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (31, N'Thunderwave', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (32, N'Unseen Servant', 2, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (33, N'Animal Messenger', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (34, N'Blindness/Deafness', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (35, N'Calm Emotions', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (36, N'Cloud of Daggers', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (37, N'Crown of Madness', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (38, N'Detect Thoughts', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (39, N'Enhance Ability', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (40, N'Enthrall', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (41, N'Heat Metal', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (42, N'Hold Person', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (43, N'Invisibility', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (44, N'Knock', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (45, N'Lesser Restoration', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (46, N'Locate Animals or Plants', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (47, N'Locate Object', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (48, N'Magic Mouth', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (49, N'Phantasmal Force', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (50, N'See Invisibility', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (51, N'Shatter', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (52, N'Silence', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (53, N'Suggestion', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (54, N'Zone of Truth', 2, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (55, N'Bestow Curse', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (56, N'Clairvoyance', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (57, N'Dispel Magic', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (58, N'Fear', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (59, N'Feign Death', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (60, N'Glyph of Warding', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (61, N'Hypnotic Pattern', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (62, N'Leomunds Tiny Hut', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (63, N'Major Image', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (64, N'Nondetection', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (65, N'Plant Growth', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (66, N'Sending', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (67, N'Speak with Dead', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (68, N'Speak with Plants', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (69, N'Stinking Cloud', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (70, N'Tongues', 2, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (71, N'Compulsion', 2, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (72, N'Confusion', 2, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (73, N'Dimension Door', 2, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (74, N'Freedom of Movement', 2, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (75, N'Greater Invisibility', 2, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (76, N'Hallucinatory Terrain', 2, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (77, N'Locate Creature', 2, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (78, N'Polymorph', 2, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (79, N'Animate Objects', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (80, N'Awaken', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (81, N'Dominate Person', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (82, N'Dream', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (83, N'Geas', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (84, N'Greater Restoration', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (85, N'Hold Monster', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (86, N'Legend Lore', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (87, N'Mass Cure Wounds', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (88, N'Mislead', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (89, N'Modify Memory', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (90, N'Planar Binding', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (91, N'Raise Dead', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (92, N'Scrying', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (93, N'Seeming', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (94, N'Teleportation Circle', 2, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (95, N'Eyebite', 2, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (96, N'Find the Path', 2, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (97, N'Guards and Wards', 2, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (98, N'Mass Suggestion', 2, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (99, N'Ottos Irresistible Dance', 2, 6, NULL)
GO
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (100, N'Programmed Illusion', 2, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (101, N'True Seeing', 2, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (102, N'Etherealness', 2, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (103, N'Forcecage', 2, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (104, N'Mirage Arcane', 2, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (105, N'Mordenkainens Magnificent Mansion', 2, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (106, N'Modenkainens Sword', 2, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (107, N'Project Image', 2, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (108, N'Regenerate', 2, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (109, N'Resurrection', 2, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (110, N'Symbol', 2, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (111, N'Teleport', 2, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (112, N'Dominate Monster', 2, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (113, N'Feeblemind', 2, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (114, N'Glibness', 2, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (115, N'Mind Blank', 2, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (116, N'Power Word Stun', 2, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (117, N'Foresight', 2, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (118, N'Power Word Heal', 2, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (119, N'Power Word Kill', 2, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (120, N'True Polymorph', 2, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (121, N'Guidance', 3, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (122, N'Light', 3, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (123, N'Mending', 3, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (124, N'Resistence', 3, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (125, N'Sacred Flame', 3, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (126, N'Spare the Dying', 3, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (127, N'Thaumaturgy', 3, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (128, N'Bane', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (129, N'Bless', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (130, N'Command', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (131, N'Create of Destroy Water', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (132, N'Cure Wounds', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (133, N'Detect Evil and Good', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (134, N'Detect Magic', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (135, N'Detect Poison and Disease', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (136, N'Guiding Bolt', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (137, N'Healing Word', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (138, N'Inflict Wounds', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (139, N'Protection from Evil and Good', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (140, N'Purify Food and Drink', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (141, N'Sanctuary', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (142, N'Shield of Faith', 3, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (143, N'Aid', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (144, N'Augury', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (145, N'Blindness/Deafness', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (146, N'Calm Emotions', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (147, N'Continual Flame', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (148, N'Enhance Ability', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (149, N'Find Traps', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (150, N'Gentle Repose', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (151, N'Hold person', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (152, N'Lesser Restoration', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (153, N'Locate Object', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (154, N'Prayer of Healing', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (155, N'Protection from Poison', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (156, N'Silence', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (157, N'Spiritual Weapon', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (158, N'Warding Bond', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (159, N'Zone of Truth', 3, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (160, N'Animate Dead', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (161, N'Beacon of Hope', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (162, N'Bestow Curse', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (163, N'Clairvoyance', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (164, N'Create Food and Water', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (165, N'Daylight', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (166, N'Dispel Magic', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (167, N'Feign Death', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (168, N'Glyph of Warding', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (169, N'Magic Circle', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (170, N'Mass Healing Word', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (171, N'Meld into Stone', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (172, N'Protection from Energy', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (173, N'Remove Curse', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (174, N'Revivify', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (175, N'Sending', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (176, N'Speak with Dead', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (177, N'Spirit Guardians', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (178, N'Tongues', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (179, N'Water Walk', 3, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (180, N'Banishment', 3, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (181, N'Control Water', 3, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (182, N'Death Ward', 3, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (183, N'Divination', 3, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (184, N'Freedom of Movement', 3, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (185, N'Guardian of Faith', 3, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (186, N'Locate Creature', 3, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (187, N'Stone Shape', 3, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (188, N'Commune', 3, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (189, N'Contagion', 3, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (190, N'Dispel Evil and Good', 3, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (191, N'Flame Strike', 3, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (192, N'Geas', 3, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (193, N'Greater Restoration', 3, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (194, N'Hallow', 3, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (195, N'Insect Plague', 3, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (196, N'Legend Lore', 3, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (197, N'Mass Cure Wounds', 3, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (198, N'Planar Binding', 3, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (199, N'Raise Dead', 3, 5, NULL)
GO
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (200, N'Scrying', 3, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (201, N'Blade Barrier', 3, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (202, N'Create Undead', 3, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (203, N'Find the Path', 3, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (204, N'Forbiddence', 3, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (205, N'Harm', 3, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (206, N'Heal', 3, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (207, N'Heroes Feet', 3, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (208, N'Planar Ally', 3, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (209, N'True Seeing', 3, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (210, N'Word of Recall', 3, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (211, N'Conjure Celestial', 3, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (212, N'Divine Word', 3, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (213, N'Etherealness', 3, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (214, N'Fire Storm', 3, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (215, N'Plane Shift', 3, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (216, N'Regenerate', 3, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (217, N'Resurrection', 3, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (218, N'Symbol', 3, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (219, N'Antimage Field', 3, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (220, N'Control Weather', 3, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (221, N'Earthquake', 3, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (222, N'Holy Aura', 3, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (223, N'Astral Projection', 3, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (224, N'Gate', 3, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (225, N'Mass Heal', 3, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (226, N'True Resurrection', 3, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (227, N'Druidcraft', 4, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (228, N'Guidance', 4, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (229, N'Mending', 4, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (230, N'Poison Spray', 4, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (231, N'Produce Flame', 4, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (232, N'Resistance', 4, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (233, N'Shillelagh', 4, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (234, N'Thorn Whip', 4, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (235, N'Animal Friendship', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (236, N'Charm Person', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (237, N'Create of Destroy Water', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (238, N'Cure Wounds', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (239, N'Detect Magic', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (240, N'Detect Poison and Disease', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (241, N'Entangle', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (242, N'Faerie Fire', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (243, N'Fog Cloud', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (244, N'Goodberry', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (245, N'Healing Word', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (246, N'Jump', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (247, N'Longstrider', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (248, N'Purify Food and Drink', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (249, N'Speak with Animals', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (250, N'Thunderwave', 4, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (251, N'Animal Messenger', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (252, N'Barkskin', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (253, N'Beast Sense', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (254, N'Darkvision', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (255, N'Enhance Ability', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (256, N'Find Traps', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (257, N'Flame Blade', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (258, N'Flaming Sphere', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (259, N'Gust of Wind', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (260, N'Heat Metal', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (261, N'Hold Person', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (262, N'Lesser Restoration', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (263, N'Locate Animals or Plants', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (264, N'Locate Object', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (265, N'Moonbeam', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (266, N'Pass without Trace', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (267, N'Protection from Poison', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (268, N'Spike Growth', 4, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (269, N'Call Lightning', 4, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (270, N'Conjure Animals', 4, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (271, N'Daylight', 4, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (272, N'Dispel Magic', 4, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (273, N'Feign Death', 4, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (274, N'Meld into Stone', 4, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (275, N'Plant Growth', 4, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (276, N'Protection from Energy', 4, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (277, N'Sleet Storm', 4, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (278, N'Speak with Plants', 4, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (279, N'Water Breathing', 4, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (280, N'Water Walk', 4, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (281, N'Wind Wall', 4, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (282, N'Blight', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (283, N'Confusion', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (284, N'Conjure Minor Elementals', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (285, N'Conjure Woodland Beings', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (286, N'Control Water', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (287, N'Dominate Beast', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (288, N'Freedom of Movement', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (289, N'Giant Insect', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (290, N'Grasping Vine', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (291, N'Hallucinatory Terrain', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (292, N'Ice Storm', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (293, N'Locate Creature', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (294, N'Polymorph', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (295, N'Stone Shape', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (296, N'Stoneskin', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (297, N'Wall of Fire', 4, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (298, N'Antilife SHell', 4, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (299, N'Awaken', 4, 5, NULL)
GO
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (300, N'Commune with Nature', 4, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (301, N'Conjure Elemental', 4, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (302, N'Contagion', 4, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (303, N'Geas', 4, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (304, N'Greater Restoration', 4, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (305, N'Insect Plague', 4, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (306, N'Mass Cure Wounds', 4, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (307, N'Planar Binding', 4, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (308, N'Reincarnate', 4, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (309, N'Scrying', 4, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (310, N'Tree Stride', 4, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (311, N'Wall of Stone', 4, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (312, N'Conjure Fey', 4, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (313, N'Find the Path', 4, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (314, N'Heal', 4, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (315, N'Heroes Feast', 4, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (316, N'Move Earth', 4, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (317, N'Sunbeam', 4, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (318, N'Transport via Plants', 4, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (319, N'Wall of Thorns', 4, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (320, N'Wind Walk', 4, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (321, N'Fire Storm', 4, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (322, N'Mirage Arcane', 4, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (323, N'Plane Shift', 4, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (324, N'Regenerate', 4, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (325, N'Reverse Gravity', 4, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (326, N'Animal Shapes', 4, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (327, N'Antipathy/Sympathy', 4, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (328, N'Control Weather', 4, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (329, N'Earthquake', 4, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (330, N'Feeblemind', 4, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (331, N'Sunburst', 4, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (332, N'Tsunami', 4, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (333, N'Foresight', 4, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (334, N'Shapechange', 4, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (335, N'Storm of Vengeance', 4, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (336, N'True Resurrection', 4, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (337, N'Bless', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (338, N'Command', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (339, N'Compelled Duel', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (340, N'Cure Wounds', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (341, N'Detect Evil and Good', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (342, N'Detect Magic', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (343, N'Detect Poison and Disease', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (344, N'Divine Favor', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (345, N'Heroism', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (346, N'Protection from Evil and Good', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (347, N'Purify Food and Drink', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (348, N'Searing Smite', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (349, N'Shield of Faith', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (350, N'Thunderous Smithe', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (351, N'Wrathful Smite', 7, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (352, N'Aid', 7, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (353, N'Branding Smite', 7, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (354, N'Find Steed', 7, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (355, N'Lesser Restoration', 7, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (356, N'Locate Object', 7, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (357, N'Magic Weapon', 7, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (358, N'Protection from Poison', 7, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (359, N'Zone of Truth', 7, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (360, N'Aura of Vitality', 7, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (361, N'Blinding Smite', 7, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (362, N'Create Food and Water', 7, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (363, N'Crusaders Mantle', 7, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (364, N'Daylight', 7, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (365, N'Dispel Magic', 7, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (366, N'Elemental Weapon', 7, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (367, N'Magic Circle', 7, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (368, N'Remove Curse', 7, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (369, N'Revivify', 7, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (370, N'Aura of Life', 7, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (371, N'Aura of Purity', 7, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (372, N'Banishment', 7, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (373, N'Death Ward', 7, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (374, N'Locate Creature', 7, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (375, N'Staggering Smite', 7, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (376, N'Banishing Smite', 7, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (377, N'Circle of Power', 7, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (378, N'Destructive Smite', 7, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (379, N'Dispel Evil and Good', 7, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (380, N'Geas', 7, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (381, N'Raise Dead', 7, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (382, N'Alarm', 8, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (383, N'Animal Friendship', 8, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (384, N'Cure Wounds', 8, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (385, N'Detect Magic', 8, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (386, N'Detect Poison and Disease', 8, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (387, N'Ensnaring Strike', 8, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (388, N'Fog Cloud', 8, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (389, N'Goodberry', 8, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (390, N'Hail of Thorns', 8, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (391, N'Hunters Mark', 8, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (392, N'Jump', 8, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (393, N'Longstrider', 8, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (394, N'Speak with Animals', 8, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (395, N'Animal Messenger', 8, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (396, N'Barkskin', 8, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (397, N'Beast Sense', 8, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (398, N'Cordon of Arrows', 8, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (399, N'Darkvision', 8, 2, NULL)
GO
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (400, N'Find Traps', 8, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (401, N'Lesser Restoration', 8, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (402, N'Locate Animals or Plants', 8, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (403, N'Locate Object', 8, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (404, N'Pass without Trace', 8, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (405, N'Protection from Poison', 8, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (406, N'Silence', 8, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (407, N'Spike Growth', 8, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (408, N'Conjure Animals', 8, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (409, N'Conjure Barrage', 8, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (410, N'Daylight', 8, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (411, N'Lightning Arrow', 8, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (412, N'Nondetection', 8, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (413, N'Plant Growth', 8, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (414, N'Protection from Energy', 8, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (415, N'Speak with Plants', 8, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (416, N'Water Breathing', 8, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (417, N'Water Walk', 8, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (418, N'Wind Wall', 8, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (419, N'Conjure Woodland Beings', 8, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (420, N'Freedom of Movement', 8, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (421, N'Grasping Vine', 8, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (422, N'Locate Creature', 8, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (423, N'Stoneskin', 8, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (424, N'Commune with Nature', 8, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (425, N'Conjure Volley', 8, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (426, N'Swift Quiver', 8, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (427, N'Tree Stride', 8, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (428, N'Acid Splash', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (429, N'Blade Ward', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (430, N'Chill Touch', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (431, N'Dancing Lights', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (432, N'Fire Bolt', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (433, N'Friends', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (434, N'Light', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (435, N'Mage Hand', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (436, N'Mending', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (437, N'Message', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (438, N'Minor Illusion', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (439, N'Poison Spray', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (440, N'Prestidigitation', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (441, N'Ray of Frost', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (442, N'Shocking Grasp', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (443, N'True Strike', 10, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (444, N'Burning Hands', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (445, N'Charm Person', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (446, N'Chromatic Orb', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (447, N'Color Spray', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (448, N'Comprehend Languages', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (449, N'Detect Magic', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (450, N'Disguise Self', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (451, N'Expeditious Retreat', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (452, N'False Life', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (453, N'Feather Fall', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (454, N'Fog Cloud', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (455, N'Jump', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (456, N'Mage Armor', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (457, N'Magic Missle', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (458, N'Ray of Sickness', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (459, N'Shield', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (460, N'Silent Image', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (461, N'Sleep', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (462, N'Thunderwave', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (463, N'Witch Bolt', 10, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (464, N'Alter Self', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (465, N'Blindness/Deafness', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (466, N'Blur', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (467, N'Cloud of Daggers', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (468, N'Crown of Madness', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (469, N'Darkness', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (470, N'Darkvision', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (471, N'Detect Thoughts', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (472, N'Enhance Ability', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (473, N'Enlarge/Reduce', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (474, N'Gust of Wind', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (475, N'Hold Person', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (476, N'Invisibility', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (477, N'Knock', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (478, N'Levitate', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (479, N'Mirror Image', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (480, N'Misty Step', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (481, N'Phantasmal Force', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (482, N'Scorching Ray', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (483, N'See Invisibility', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (484, N'Shatter', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (485, N'Spider Climb', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (486, N'Suggestion', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (487, N'Web', 10, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (488, N'Blink', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (489, N'Clairvoyance', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (490, N'Counterspell', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (491, N'Daylight', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (492, N'Dispel Magic', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (493, N'Fear', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (494, N'Fireball', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (495, N'Fly', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (496, N'Gaseous Form', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (497, N'Haste', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (498, N'Hypnotic Pattern', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (499, N'Lightning Bolt', 10, 3, NULL)
GO
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (500, N'Major Image', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (501, N'Protection from Energy', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (502, N'Sleet Storm', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (503, N'Slow', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (504, N'Stinking Cloud', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (505, N'Tongues', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (506, N'Water Breathing', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (507, N'Water Walk', 10, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (508, N'Banishment', 10, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (509, N'Blight', 10, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (510, N'Confusion', 10, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (511, N'Dimension Door', 10, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (512, N'Dominate Beast', 10, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (513, N'Greater Invisibility', 10, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (514, N'Ice Storm', 10, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (515, N'Polymorph', 10, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (516, N'Stoneskin', 10, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (517, N'Wall of Fire', 10, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (518, N'Animate Objects', 10, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (519, N'Cloudkill', 10, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (520, N'Cone of Cold', 10, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (521, N'Creation', 10, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (522, N'Dominate Person', 10, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (523, N'Hold Person', 10, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (524, N'Hold Monster', 10, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (525, N'Insect Plague', 10, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (526, N'Seeming', 10, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (527, N'Telekinesis', 10, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (528, N'Teleportation Circle', 10, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (529, N'Wall of Stone', 10, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (530, N'Arcane Gate', 10, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (531, N'Chain Lightning', 10, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (532, N'Circle of Death', 10, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (533, N'Disintegrate', 10, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (534, N'Eyebite', 10, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (535, N'Globe of Invulnerability', 10, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (536, N'Mass Suggestion', 10, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (537, N'Move Earth', 10, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (538, N'Sunbeam', 10, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (539, N'True Seeing', 10, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (540, N'Delayed Blast Fireball', 10, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (541, N'Etherealness', 10, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (542, N'Finger of Death', 10, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (543, N'Fire Storm', 10, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (544, N'Plane Shift', 10, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (545, N'Prismatic Spray', 10, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (546, N'Reverse Gravity', 10, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (547, N'Teleport', 10, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (548, N'Dominate Monster', 10, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (549, N'Earthquake', 10, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (550, N'Incendiary Cloud', 10, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (551, N'Power Word Stun', 10, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (552, N'Sunburst', 10, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (553, N'Gate', 10, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (554, N'Meteor Swarm', 10, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (555, N'Power Word Kill', 10, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (556, N'Time Stop', 10, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (557, N'Wish', 10, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (558, N'Blade Ward', 11, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (559, N'Chill Touch', 11, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (560, N'Eldritch Blast', 11, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (561, N'Friends', 11, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (562, N'Mage Hand', 11, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (563, N'Minor Illusion', 11, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (564, N'Poison Spray', 11, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (565, N'Prestidigitation', 11, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (566, N'True Strike', 11, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (567, N'Armor of Agathys', 11, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (568, N'Arms of Hadar', 11, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (569, N'Charm Person', 11, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (570, N'Comprehend Languages', 11, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (571, N'Expeditious Retreat', 11, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (572, N'Hellish Rebuke', 11, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (573, N'Hex', 11, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (574, N'Illusory Script', 11, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (575, N'Protection from Good and Evil', 11, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (576, N'Unseen Servant', 11, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (577, N'Witch Bolt', 11, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (578, N'Cloud of Daggers', 11, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (579, N'Crown of Madness', 11, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (580, N'Darkness', 11, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (581, N'Enthrall', 11, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (582, N'Hold Person', 11, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (583, N'Invisibility', 11, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (584, N'Mirror Image', 11, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (585, N'Misty Step', 11, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (586, N'Ray of Enfeeblement', 11, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (587, N'Shatter', 11, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (588, N'Spider Climb', 11, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (589, N'Suggestion', 11, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (590, N'Counterspell', 11, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (591, N'Dispel Magic', 11, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (592, N'Fear', 11, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (593, N'Fly', 11, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (594, N'Gaseous Form', 11, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (595, N'Hunger of Hadar', 11, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (596, N'Hypnotic Pattern', 11, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (597, N'Magic Circle', 11, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (598, N'Major Image', 11, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (599, N'Remove Curse', 11, 3, NULL)
GO
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (600, N'Tongues', 11, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (601, N'Vampiric Touch', 11, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (602, N'Banishment', 11, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (603, N'Blight', 11, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (604, N'Dimension Door', 11, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (605, N'Hallucinatory Terrain', 11, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (606, N'Contact other Plane', 11, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (607, N'Dream', 11, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (608, N'Hold Monster', 11, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (609, N'Scrying', 11, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (610, N'Arcane Gate', 11, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (611, N'Circle of Death', 11, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (612, N'Conjure Fey', 11, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (613, N'Create Undead', 11, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (614, N'Eyebite', 11, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (615, N'Flesh to Stone', 11, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (616, N'Mass Suggestion', 11, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (617, N'True Seeing', 11, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (618, N'Etherealness', 11, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (619, N'Finger of Death', 11, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (620, N'Forcecage', 11, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (621, N'Plane Shift', 11, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (622, N'Demiplane', 11, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (623, N'Dominate Monster', 11, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (624, N'Feeblemind', 11, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (625, N'Glibness', 11, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (626, N'Power Word Stun', 11, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (627, N'Astral Projection', 11, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (628, N'Foresight', 11, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (629, N'Imprisonment', 11, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (630, N'Power Word Kill', 11, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (631, N'True Polymorph', 11, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (632, N'Acid Splash', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (633, N'Blade Wand', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (634, N'Chill Touch', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (635, N'Dancing Lights', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (636, N'Fire Bolt', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (637, N'Friends', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (638, N'Light', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (639, N'Mage Hand', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (640, N'Mending', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (641, N'Message', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (642, N'Minor Illusion', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (643, N'Poison Spray', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (644, N'Prestidigitation', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (645, N'Ray of Frost', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (646, N'Shocking Grasp', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (647, N'True Strike', 12, 0, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (648, N'Alarm', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (649, N'Burning Hands', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (650, N'Charm Person', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (651, N'Chromatic Orb', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (652, N'Color Spray', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (653, N'Comprehend Languages', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (654, N'Detect Magic', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (655, N'Disguise Self', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (656, N'Expeditious Retreat', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (657, N'False Life', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (658, N'Feather Fall', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (659, N'Find Familiar', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (660, N'Fog Cloud', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (661, N'Grease', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (662, N'Identify', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (663, N'Illusory Script', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (664, N'Jump', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (665, N'Longstrider', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (666, N'Mage Armor', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (667, N'Magic Missle', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (668, N'Protection from Evil and Good', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (669, N'Ray of Sickness', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (670, N'Shield', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (671, N'Silent Image', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (672, N'Sleep', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (673, N'Tashas Hideous Laughter', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (674, N'Tensers Floating Disk', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (675, N'Thunderwave', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (676, N'Unseen Servant', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (677, N'Witch Bolt', 12, 1, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (678, N'Alter Self', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (679, N'Arcane Lock', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (680, N'Blindness/Deafness', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (681, N'Blue', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (682, N'Cloud of Daggers', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (683, N'Continual Flame', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (684, N'Crown of Madness', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (685, N'Darkness', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (686, N'Darkvision', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (687, N'Detect Thoughts', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (688, N'Enlarge/Reduce', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (689, N'Flaming Sphere', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (690, N'Gentle Repose', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (691, N'Gust of Wind', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (692, N'Hold Person', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (693, N'Invisibility', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (694, N'Knock', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (695, N'Levitate', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (696, N'Locate Object', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (697, N'Magic Mouth', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (698, N'Magic Weapon', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (699, N'Melfs Acid Arrow', 12, 2, NULL)
GO
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (700, N'Mirror Image', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (701, N'Misty Step', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (702, N'Nystuls Magic Aura', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (703, N'Phantasmal Force', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (704, N'Ray of Enfeeblement', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (705, N'Rope Trick', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (706, N'Scorching Ray', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (707, N'See Invisibility', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (708, N'Shatter', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (709, N'Spider Climb', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (710, N'Suggestion', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (711, N'Web', 12, 2, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (712, N'Animate Dead', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (713, N'Bestow Curse', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (714, N'Blink', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (715, N'Clairvoyance', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (716, N'Counterspell', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (717, N'Dispel Magic', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (718, N'Fear', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (719, N'Feign Death', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (720, N'Fireball', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (721, N'Fly', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (722, N'Gaseous Form', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (723, N'Glyph of Warding', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (724, N'Haste', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (725, N'Hypnotic Pattern', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (726, N'Leomunds Tiny Hut', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (727, N'Lightning Bolt', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (728, N'Magic Circle', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (729, N'Nondetection', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (730, N'Phantom Seed', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (731, N'Protection from Energy', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (732, N'Remove Curse', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (733, N'Sending', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (734, N'Sleet Storm', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (735, N'Slow', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (736, N'Stinking Cloud', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (737, N'Tongues', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (738, N'Vampiric Touch', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (739, N'Water Breathing', 12, 3, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (740, N'Arcane Eye', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (741, N'Banishment', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (742, N'Blight', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (743, N'Confusion', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (744, N'Conjure Minor Elementals', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (745, N'Control Water', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (746, N'Dimension Door', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (747, N'Evards Black Tentacles', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (748, N'Fabricate', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (749, N'Fire Shield', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (750, N'Greater Invisibility', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (751, N'Hallucinatory Terrain', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (752, N'Ice Storm', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (753, N'Leomunds Secret Chest', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (754, N'Locate Creature', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (755, N'Mordenkainens Faithful Hound', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (756, N'Mordenkainens Private Sanctum', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (757, N'Otilukes Resilient Sphere', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (758, N'Phantasmal Killer', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (759, N'Polymorph', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (760, N'Stone Shape', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (761, N'Stoneskin', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (762, N'Wall of Fire', 12, 4, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (763, N'Animate Objects', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (764, N'Bigbys Hand', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (765, N'Cloudkill', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (766, N'Cone of Cold', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (767, N'Conjure Elemental', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (768, N'Contact Other Plane', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (769, N'Creation', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (770, N'Dominate Person', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (771, N'Dream', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (772, N'Geas', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (773, N'Hold Monster', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (774, N'Legend Lore', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (775, N'Mislead', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (776, N'Modify Memory', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (777, N'Passwall', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (778, N'Planar Binding', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (779, N'Rarys Telepathic Bond', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (780, N'Scrying', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (781, N'Seeming', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (782, N'Telekinesis', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (783, N'Teleportation Circle', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (784, N'Wall of Force', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (785, N'Wall of Stone', 12, 5, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (786, N'Arcane Gate', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (787, N'Chain Lightning', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (788, N'Circle of Death', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (789, N'Contingency', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (790, N'Create Undead', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (791, N'Disintegrate', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (792, N'Drawmijs Instant Summons', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (793, N'Eyebite', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (794, N'Flesh to Stone', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (795, N'Globe of Invulnerability', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (796, N'Guards and Wards', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (797, N'Magic Jar', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (798, N'Mass Suggestion', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (799, N'Move Earth', 12, 6, NULL)
GO
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (800, N'Otilukes Freezing Sphere', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (801, N'Ottos Irresistible Dance', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (802, N'Programmed Illusion', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (803, N'Sunbeam', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (804, N'True Seeing', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (805, N'Wall of Ice', 12, 6, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (806, N'Delayed Blast Fireball', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (807, N'Etherealness', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (808, N'Finger of Death', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (809, N'Forcecage', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (810, N'Mirage Arcane', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (811, N'Mordenkainens Magnificent Mansion', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (812, N'Mordenkainens Sword', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (813, N'Plane Shift', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (814, N'Prismatic Spray', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (815, N'Project Image', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (816, N'Reverse Gravity', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (817, N'Sequester', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (818, N'Simulacrum', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (819, N'Symbol', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (820, N'Teleport', 12, 7, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (821, N'Antimagic Field', 12, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (822, N'Antipathy/Sympathy', 12, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (823, N'Clone', 12, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (824, N'Control Weather', 12, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (825, N'Demiplane', 12, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (826, N'Dominate Monster', 12, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (827, N'Feeblemind', 12, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (828, N'Incendiary Cloud', 12, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (829, N'Maze', 12, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (830, N'Mind Blank', 12, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (831, N'Power Word Stun', 12, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (832, N'Sunburst', 12, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (833, N'Telepathy', 12, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (834, N'Trap the Soul', 12, 8, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (835, N'Astral Projection', 12, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (836, N'Foresight', 12, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (837, N'Gate', 12, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (838, N'Imprisonment', 12, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (839, N'Meteor Swarm', 12, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (840, N'Power Word Kill', 12, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (841, N'Prismatic Wall', 12, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (842, N'Shapechange', 12, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (843, N'Time Stop', 12, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (844, N'True Polymorph', 12, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (845, N'Weird', 12, 9, NULL)
INSERT [dbo].[DD_Spell] ([ID], [Name], [ClassID], [RequiredLevel], [ManaCost]) VALUES (846, N'Wish', 12, 9, NULL)
SET IDENTITY_INSERT [dbo].[DD_Spell] OFF
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
/****** Object:  Trigger [dbo].[DungeonsDragons_CharacterLevel]    Script Date: 12/7/2016 12:48:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[DungeonsDragons_CharacterLevel]
       ON [dbo].[DD_Character]
AFTER INSERT, UPDATE
AS
BEGIN
	IF ((
SELECT TRIGGER_NESTLEVEL()) > 5 )
RETURN
     Update DD_Character	 
	 Set CharacterLevel = (1+sqrt(ExperiencePoints/125 + 1))/2; 
	  
END

GO
ALTER TABLE [dbo].[DD_Character] ENABLE TRIGGER [DungeonsDragons_CharacterLevel]
GO
/****** Object:  Trigger [dbo].[DungeonsDragons_StatModifier]    Script Date: 12/7/2016 12:48:04 PM ******/
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
