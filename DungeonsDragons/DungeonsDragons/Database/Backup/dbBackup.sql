USE [master]
GO
/****** Object:  Database [DungeonsDragons]    Script Date: 11/14/2016 8:34:44 PM ******/
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
/****** Object:  Table [dbo].[DD_Action]    Script Date: 11/14/2016 8:34:45 PM ******/
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
/****** Object:  Table [dbo].[DD_Adventure]    Script Date: 11/14/2016 8:34:45 PM ******/
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
/****** Object:  Table [dbo].[DD_Beastiary]    Script Date: 11/14/2016 8:34:45 PM ******/
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
/****** Object:  Table [dbo].[DD_Character]    Script Date: 11/14/2016 8:34:45 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasAction]    Script Date: 11/14/2016 8:34:45 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasAdventure]    Script Date: 11/14/2016 8:34:45 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasItem]    Script Date: 11/14/2016 8:34:45 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasPack]    Script Date: 11/14/2016 8:34:45 PM ******/
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
/****** Object:  Table [dbo].[DD_CharacterHasSkill]    Script Date: 11/14/2016 8:34:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DD_CharacterHasSkill](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CharacterID] [int] NOT NULL,
	[SkillID] [int] NOT NULL,
 CONSTRAINT [PK_DD_CharacterHasSkill] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DD_CharacterHasSpell]    Script Date: 11/14/2016 8:34:45 PM ******/
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
/****** Object:  Table [dbo].[DD_Class]    Script Date: 11/14/2016 8:34:45 PM ******/
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
/****** Object:  Table [dbo].[DD_Creep]    Script Date: 11/14/2016 8:34:45 PM ******/
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
/****** Object:  Table [dbo].[DD_Item]    Script Date: 11/14/2016 8:34:45 PM ******/
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
/****** Object:  Table [dbo].[DD_Pack]    Script Date: 11/14/2016 8:34:45 PM ******/
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
/****** Object:  Table [dbo].[DD_Race]    Script Date: 11/14/2016 8:34:45 PM ******/
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
/****** Object:  Table [dbo].[DD_Skill]    Script Date: 11/14/2016 8:34:46 PM ******/
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
/****** Object:  Table [dbo].[DD_Spell]    Script Date: 11/14/2016 8:34:46 PM ******/
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
/****** Object:  Table [dbo].[DD_User]    Script Date: 11/14/2016 8:34:46 PM ******/
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
