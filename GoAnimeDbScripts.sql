USE [master]
GO
/****** Object:  Database [goanime-db]    Script Date: 18/10/2022 09:42:36 ******/
CREATE DATABASE [goanime-db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'goanime-db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\goanime-db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'goanime-db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\goanime-db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [goanime-db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [goanime-db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [goanime-db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [goanime-db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [goanime-db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [goanime-db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [goanime-db] SET ARITHABORT OFF 
GO
ALTER DATABASE [goanime-db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [goanime-db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [goanime-db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [goanime-db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [goanime-db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [goanime-db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [goanime-db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [goanime-db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [goanime-db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [goanime-db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [goanime-db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [goanime-db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [goanime-db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [goanime-db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [goanime-db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [goanime-db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [goanime-db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [goanime-db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [goanime-db] SET  MULTI_USER 
GO
ALTER DATABASE [goanime-db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [goanime-db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [goanime-db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [goanime-db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [goanime-db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [goanime-db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [goanime-db] SET QUERY_STORE = OFF
GO
USE [goanime-db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anime]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anime](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[ImageURL] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[AnimeGenre] [int] NOT NULL,
	[StudioId] [int] NOT NULL,
	[ProducerId] [int] NOT NULL,
 CONSTRAINT [PK_Anime] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[FullName] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AnimeId] [int] NULL,
	[Quantity] [int] NOT NULL,
	[CartId] [nvarchar](max) NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[AnimeId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[UserId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producers]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProfilePictureURL] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[Bio] [nvarchar](max) NULL,
 CONSTRAINT [PK_Producers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Studios]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Logo] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Studios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoiceActors]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoiceActors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProfilePictureURL] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Bio] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_VoiceActors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VoiceActors_Anime]    Script Date: 18/10/2022 09:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VoiceActors_Anime](
	[AnimeId] [int] NOT NULL,
	[VoiceActorId] [int] NOT NULL,
 CONSTRAINT [PK_VoiceActors_Anime] PRIMARY KEY CLUSTERED 
(
	[VoiceActorId] ASC,
	[AnimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221007200550_order', N'3.1.28')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221007230601_cartitems', N'3.1.28')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221011112903_identity-revealed', N'3.1.28')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221012090403_updated', N'3.1.28')
GO
SET IDENTITY_INSERT [dbo].[Anime] ON 

INSERT [dbo].[Anime] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [AnimeGenre], [StudioId], [ProducerId]) VALUES (1, N'Goblin Slayer', N'A young priestess has formed her first adventuring party, but almost immediately they find themselves in distress. It''s the Goblin Slayer who comes to their rescue', 24.5, N'https://cdn.myanimelist.net/images/anime/1699/110724.jpg', CAST(N'2022-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-25T00:00:00.0000000' AS DateTime2), 2, 1, 1)
INSERT [dbo].[Anime] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [AnimeGenre], [StudioId], [ProducerId]) VALUES (2, N'Violet Evergarden', N'In the aftermath of a great war, Violet Evergarden, a young female ex-soldier, gets a job at a writers'' agency and goes on assignments to create letters that can connect people.', 29.5, N'https://cdn.myanimelist.net/images/anime/1825/110716.jpg', CAST(N'2022-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2022-10-16T00:00:00.0000000' AS DateTime2), 10, 2, 5)
INSERT [dbo].[Anime] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [AnimeGenre], [StudioId], [ProducerId]) VALUES (3, N'Fate/stay night: Heaven''s Feel - I', N'Theatrical release of the first part of the Heaven''s Feel movie trilogy.', 29.5, N'https://cdn.myanimelist.net/images/anime/1274/102213.jpg', CAST(N'2022-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2022-11-16T00:00:00.0000000' AS DateTime2), 1, 3, 1)
INSERT [dbo].[Anime] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [AnimeGenre], [StudioId], [ProducerId]) VALUES (6, N'Bleach: 1000-Year Blood War', N'Was it all just a coincidence, or was it inevitable? Ichigo Kurosaki gained the powers of a Soul Reaper through a chance encounter. As a Substitute Soul Reaper, Ichigo became caught in the turmoil of the Soul Society, a place where deceased souls gather. But with help from his friends, Ichigo overcame every challenge to become even stronger.', 24.5, N'https://cdn.myanimelist.net/images/anime/1764/126627.jpg', CAST(N'2022-10-11T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-07T00:00:00.0000000' AS DateTime2), 5, 4, 1)
INSERT [dbo].[Anime] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [AnimeGenre], [StudioId], [ProducerId]) VALUES (7, N'My Hero Academia', N'The story of My Hero Academia is set in a world where currently most of the human population has gained the ability to develop superpowers called "Quirks" which occur in children within the age of four.', 30, N'https://cdn.myanimelist.net/images/anime/1483/126005.jpg', CAST(N'2022-10-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), 1, 5, 4)
INSERT [dbo].[Anime] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [AnimeGenre], [StudioId], [ProducerId]) VALUES (8, N'Demon Slayer ', N'The devastation of the Mugen Train incident still weighs heavily on the members of the Demon Slayer Corps. Despite being given time to recover, life must go on, as the wicked never sleep: a vicious demon is terrorizing the alluring women of the Yoshiwara Entertainment District.', 25, N'https://cdn.myanimelist.net/images/anime/1908/120036.jpg', CAST(N'2022-10-05T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-06T00:00:00.0000000' AS DateTime2), 1, 3, 1)
INSERT [dbo].[Anime] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [AnimeGenre], [StudioId], [ProducerId]) VALUES (9, N'To Your Eternity', N'To Your Eternity follows an immortal being named Fushi who assumes the form of dead humans and animals he encounters along his journey.', 30, N'https://cdn.myanimelist.net/images/anime/1271/127700.jpg', CAST(N'2022-10-23T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-23T00:00:00.0000000' AS DateTime2), 2, 6, 5)
INSERT [dbo].[Anime] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [AnimeGenre], [StudioId], [ProducerId]) VALUES (10, N'Uzaki-chan Wants to Hang Out!', N'At the start of her freshman year in college, Hana Uzaki reunites with Shinichi Sakurai, an upperclassman who was in the same club as her during her high school days. The sequel!', 30, N'https://cdn.myanimelist.net/images/anime/1539/128058.jpg', CAST(N'2022-10-01T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-01T00:00:00.0000000' AS DateTime2), 3, 7, 6)
INSERT [dbo].[Anime] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [AnimeGenre], [StudioId], [ProducerId]) VALUES (11, N'Cyberpunk: Edgerunners', N'Cyberpunk: Edgerunners tells a standalone story about a street kid trying to survive in a technology and body modification-obsessed city of the future.', 25, N'https://cdn.myanimelist.net/images/anime/1818/126435.jpg', CAST(N'2022-10-13T00:00:00.0000000' AS DateTime2), CAST(N'2022-12-13T00:00:00.0000000' AS DateTime2), 9, 10, 7)
SET IDENTITY_INSERT [dbo].[Anime] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6cedc477-d5dd-4c98-ad73-92cf5e9c6cac', N'Customer', N'CUSTOMER', N'e7c871bd-92c1-4aa5-8a0c-0351a190824c')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'9cae75f1-8c6a-4ea1-9661-d214a6c80b2c', N'Admin', N'ADMIN', N'6b920862-7796-4092-a9bc-fcf8a77a1b84')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'29c06c27-de61-4b09-b349-af2c9a4fa232', N'6cedc477-d5dd-4c98-ad73-92cf5e9c6cac')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'946c2fac-7921-4490-bdfa-ac162b3abc4e', N'6cedc477-d5dd-4c98-ad73-92cf5e9c6cac')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b32e719f-ad9a-4223-bdba-edee77aa143d', N'9cae75f1-8c6a-4ea1-9661-d214a6c80b2c')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName]) VALUES (N'29c06c27-de61-4b09-b349-af2c9a4fa232', N'Hinata', N'HINATA', N'user@goanime.com', N'USER@GOANIME.COM', 1, N'AQAAAAEAACcQAAAAEIcVqmyCGJDwmrjlDnGww8ci/ms+UPJ8tgEocqVSKGVdbEtdgYvoJjeWVD38y0NshA==', N'LVZOWDK6R66WXJSRFFPUO7VZQN66NMK5', N'68ed1ce3-aba5-4754-bfc4-b1a560731474', NULL, 0, 0, NULL, 1, 0, N'Hinata Sakaguchi')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName]) VALUES (N'946c2fac-7921-4490-bdfa-ac162b3abc4e', N'Mikasa', N'MIKASA', N'mikasa@eren.com', N'MIKASA@EREN.COM', 0, N'AQAAAAEAACcQAAAAENWVbsJefZ7jhmTEq7goMexw/NZtnggqMRR5km6YtFY3TCnF+930e6xhmtdBoY/CUA==', N'5Z5UIB2CGQPR7N4XQR4PCMAISNQZCYK7', N'6e489c92-ede4-4c69-bb7d-b3c6af657812', NULL, 0, 0, NULL, 1, 0, N'Mikasa Ackermann')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName]) VALUES (N'b32e719f-ad9a-4223-bdba-edee77aa143d', N'Ainz-sama', N'AINZ-SAMA', N'admin@goanime.com', N'ADMIN@GOANIME.COM', 1, N'AQAAAAEAACcQAAAAEOmfVpqnmbPvtqCx09YC56SC6km5obee8M1/Ob8Tjaz7RR5EaJ717q1lgfl5SQYdYg==', N'YUVBPYOAD2OHFTSWQW3M7HQ5KCR3HVKJ', N'21ac746b-bcce-4169-be2b-56abea15114b', NULL, 0, 0, NULL, 1, 0, N'Ainz Oaol Gown')
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 

INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (1, 2, 1, N'5e8ad4e9-c1e7-4b28-824f-18477c6bc494')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (2, 2, 1, N'7ac7d4cb-ffc2-4960-94c9-e2478b0099b3')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (3, 2, 3, N'deda838c-e201-41f5-857c-67dbe0fff474')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (4, 7, 2, N'deda838c-e201-41f5-857c-67dbe0fff474')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (5, 2, 2, N'5549231e-8ea9-474a-81ea-8eb8aea3eb09')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (6, 8, 1, N'5549231e-8ea9-474a-81ea-8eb8aea3eb09')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (7, 11, 2, N'5549231e-8ea9-474a-81ea-8eb8aea3eb09')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (8, 6, 2, N'b536a54d-9218-4730-b89c-e9fa3039bea7')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (10, 10, 2, N'b536a54d-9218-4730-b89c-e9fa3039bea7')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (11, 6, 1, N'5d6ece8c-72d6-4b23-ac8f-1afcd187a35d')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (12, 2, 1, N'466bfb57-5204-4ada-a842-e3ac573702db')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (13, 2, 1, N'6fcdfd59-9107-47b0-8f0b-504c9ede8bbb')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (14, 3, 1, N'6fcdfd59-9107-47b0-8f0b-504c9ede8bbb')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (15, 1, 1, N'6fcdfd59-9107-47b0-8f0b-504c9ede8bbb')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (16, 2, 1, N'e7b861c8-2d42-45bb-91fc-0082872bb40d')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (17, 1, 1, N'e7b861c8-2d42-45bb-91fc-0082872bb40d')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (18, 2, 1, N'70e5288d-8aac-4098-8dc7-47d235f9c792')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (19, 3, 1, N'596579c0-0814-424b-a477-da2a47fb2295')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (20, 8, 1, N'596579c0-0814-424b-a477-da2a47fb2295')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (22, 9, 2, N'960bb809-9ff6-4ed1-8082-2d99c1af88da')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (23, 7, 2, N'dc59317c-098e-4581-8235-c218c1a1be62')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (24, 7, 1, N'c01d1585-b8eb-49e8-93a7-790d20081d31')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (25, 3, 2, N'c01d1585-b8eb-49e8-93a7-790d20081d31')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (26, 2, 1, N'34881762-051e-4135-a764-2f53a38cff96')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (28, 7, 1, N'5138b090-19cb-4802-9499-a04e2bca0724')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (29, 3, 1, N'5138b090-19cb-4802-9499-a04e2bca0724')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (30, 8, 3, N'5138b090-19cb-4802-9499-a04e2bca0724')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (31, 3, 1, N'5c5e400b-0128-447d-98f3-c652f8f0a6fe')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (32, 7, 1, N'8e6f4afd-3691-4272-ac8c-c54482462076')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (33, 1, 1, N'9b7152bc-f8ed-4667-8407-295a6a9ede0e')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (34, 7, 2, N'9b7152bc-f8ed-4667-8407-295a6a9ede0e')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (35, 2, 1, N'c3ffc34d-4fec-46c2-9f71-362e9106253d')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (36, 2, 1, N'bc7f8049-d783-4756-9e03-ca341f93d842')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (37, 3, 1, N'15a9e585-7e0d-4e7a-a25f-104286f684aa')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (38, 3, 1, N'8bc0a3c1-2901-400c-b4a4-a500175de193')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (39, 3, 2, N'a80e42b1-01c4-448d-9960-aa1218e8ad48')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (40, 3, 1, N'c5c51707-d3af-4b08-bdb9-01ca49a9a98b')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (41, 3, 2, N'4447dfb7-133c-47c7-a514-c12ff0b8a806')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (42, 2, 1, N'b98eb892-53cf-4333-88c0-814d1f292298')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (43, 7, 1, N'b98eb892-53cf-4333-88c0-814d1f292298')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (44, 3, 1, N'809b6054-f731-4a9d-8873-e132b28d0ec0')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (45, 2, 1, N'd74a98bf-8a9b-4808-8b4e-16530a00332c')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (46, 2, 1, N'8fab819d-891b-4e95-a5d0-6bdae87dc5b4')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (47, 2, 1, N'2170d7b9-888a-4fca-860c-0f49f3e40637')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (48, 1, 1, N'71a40bc8-220f-4fcd-ad76-b9ac1e61c03c')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (49, 1, 1, N'5692f85b-ade9-4a0e-800e-4b783e968d02')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (50, 2, 1, N'd1fd5728-3170-48a3-9d8e-9772ed0bf78a')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (51, 2, 1, N'95eb3aa5-22fc-4e20-af2a-e7daa84f4e67')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (52, 3, 1, N'2c58a6c4-48fb-428c-ba51-d66f2d2a6951')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (53, 2, 2, N'e5883604-4eb2-4a1d-9172-ddc9604260ae')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (55, 8, 1, N'e5883604-4eb2-4a1d-9172-ddc9604260ae')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (56, 2, 1, N'66066be7-58b1-4d7c-82d4-03b1cb7817e2')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (57, 3, 1, N'66066be7-58b1-4d7c-82d4-03b1cb7817e2')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (58, 10, 1, N'66066be7-58b1-4d7c-82d4-03b1cb7817e2')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (59, 11, 1, N'782e2a91-71e3-486a-aff5-2ef1ce3f416b')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (60, 3, 1, N'ad3ae9ea-92cd-4fc8-9fdb-f5c83d405b81')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (61, 3, 1, N'8afe855c-ecca-46e9-8c04-6a09dbee4c26')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (62, 3, 1, N'a3735e9a-e18a-4132-a869-846d22db2d75')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (63, 2, 1, N'778820e3-3df7-473b-af56-758b282abcf7')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (64, 2, 1, N'2b614587-ef6b-4e14-b1ff-7b43a06ab99c')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (65, 1, 2, N'2b614587-ef6b-4e14-b1ff-7b43a06ab99c')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (66, 1, 1, N'759e14f6-06a4-4db0-9125-1589ab868ac8')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (67, 1, 1, N'7b0389bf-13ad-47ba-b875-a216f82c885f')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (68, 3, 1, N'ded97243-3010-469f-bb8b-d983bf042de7')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (69, 2, 1, N'c537a383-44da-4330-bf4c-97841fb94a12')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (70, 7, 2, N'cf96c7b5-bd30-4b2e-b72b-27e9d365a01f')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (71, 2, 1, N'aa547d73-b949-4974-8bf4-5425aaff9b02')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (72, 3, 4, N'aa547d73-b949-4974-8bf4-5425aaff9b02')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (74, 3, 1, N'0e082ea5-02e7-4b94-b995-6953fc4c7556')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (75, 3, 1, N'2229db75-32b1-45e7-bfed-45ce8a0cc69f')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (76, 2, 1, N'2229db75-32b1-45e7-bfed-45ce8a0cc69f')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (77, 2, 1, N'49f62bc8-1279-4a87-94a4-efee45c7998f')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (78, 11, 2, N'88dde267-787c-4ca9-8277-1b66524c0f68')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (79, 3, 1, N'88dde267-787c-4ca9-8277-1b66524c0f68')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (80, 3, 3, N'579af7cc-c10e-4bb4-9857-ee19c58fce79')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (81, 3, 1, N'1169cb92-f7b3-41ac-80c1-a25e9add62d2')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (82, 3, 1, N'b8ae8ab3-ec2c-496f-b70d-1c091aff8686')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (83, 3, 1, N'a12131b5-ab46-47fe-8764-87ad86740565')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (84, 8, 1, N'a12131b5-ab46-47fe-8764-87ad86740565')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (85, 6, 1, N'a12131b5-ab46-47fe-8764-87ad86740565')
INSERT [dbo].[CartItems] ([Id], [AnimeId], [Quantity], [CartId]) VALUES (87, 7, 1, N'5fadafd0-b486-4ce4-8f31-4e72c9c2e34c')
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [Quantity], [Price], [AnimeId], [OrderId]) VALUES (17, 1, 29.5, 2, 12)
INSERT [dbo].[OrderItems] ([Id], [Quantity], [Price], [AnimeId], [OrderId]) VALUES (18, 1, 30, 7, 13)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Email], [UserId]) VALUES (12, NULL, N'946c2fac-7921-4490-bdfa-ac162b3abc4e')
INSERT [dbo].[Orders] ([Id], [Email], [UserId]) VALUES (13, NULL, N'29c06c27-de61-4b09-b349-af2c9a4fa232')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Producers] ON 

INSERT [dbo].[Producers] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (1, N'https://cdn.myanimelist.net/images/company/17.png', N'Aniplex', N'Aniplex has produced Naruto, Demon Slayer, Bleach and much more.')
INSERT [dbo].[Producers] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (2, N'https://cdn.myanimelist.net/images/company/104.png', N'Lantis', N'Lantis has produced One Punch Man, Violet Evergarden, Gangsta and much more.')
INSERT [dbo].[Producers] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (3, N'https://cdn.myanimelist.net/images/company/61.png', N'Frontier Works', N'Frontier Works Inc has produced Steins;Gate, Shield Hero, Goblin Slayer and much more.')
INSERT [dbo].[Producers] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (4, N'https://cdn.myanimelist.net/images/company/1143.png', N'TOHO animation', N'TOHO animation has produced Jujutsu Kaisen, Akame ga Kill, Dr Stone and much more.')
INSERT [dbo].[Producers] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (5, N'https://cdn.myanimelist.net/images/company/159.png', N'Kodansha', N'Kodansha has produced Attack on Titan, Your Lie in April, The Seven Deadly Sins and much more.')
INSERT [dbo].[Producers] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (6, N'https://cdn.myanimelist.net/images/company/166.png', N'Movic', N'Movic has produced Steins;Gate, No Game No Life, Charlotte and much more.')
INSERT [dbo].[Producers] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (7, N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAATAAAACmCAMAAABqbSMrAAABMlBMVEX////cDRUAAADaAACCgoLeDBSSkpLMzMyJiYm9vb2MjIzcAADExMTgCxQMDAzcAA35+fl9fX1PT0/53N3+9/elpaXa2tr1ysv0wsP75+jlCxTu7u7tmpzgPUH98vPpgoQADQ3k5OSwsLBaWlrqiozkXF/wrK31x8jhREj30tPgNTrndHfyt7hkZGSbm5tVVVVvb286OjriTE/eISf539+tGx/pfoDjWVx+Gx7mbG49PT0rKyvfLjPwrq/slZflZWjRGyBUGRtwGBreJSuUGh07FRa/HSIcHBwxFxhlJSeuGR5jFxkpFBWiIyeKGx5THiBYFBYeDA12Q0RDGhx6EhUvHR55KCo6V1c2AACbDxRNDQ/EhIW/FBk9MjIkJCQsDQ5mUFHBAABgDRBoAACjP0LIV1rvg8miAAAQF0lEQVR4nO2d+UPbOBbHYynmqHBMIIHEhBAgpOSAFEK4j3B3oBwdZnaHHabdzuz+///CSpYPSZYdt51tSJTvD21wnFj+5L2n92TJTiT+Bk3/HV+ikLZ73YA+U7nS6xb0lxqw1y3oL03DQq+b0FcqIpTpdRv6SjVY7nUT+korCBZ73YZ+0gJE9V63oZ9UgRrM97oRfaRZqKGVXjeij5RHugarvW5F/yjTMjVzs9et6COtIk2Db3vdiv7RHtQ087DXregfFTAvDTZ63Yy+UY7wMrVeN6NvNA11YmDDsjumisjEvHTU63b0jQ6JQ2poWHbH1AoivDQ4HNeJpwXbvjQ0HMqPpyPKa1h2CypOyrdXHV7o5Me259WrLI9QpOKmBja8GMlLnjOQitvWsOwW1JAD26QdJDaw2R/coNeumhRY3Qlgw7JbVBXKgBVcXsOyW9QekgDLebyGZbegIpQUirTipgY2nE7B6xhpAWBF03R5DctuUaYeBFbzHFJDx71o1CtWA7MRga0gj5c+LLsFzWPnEyYxlX370tBCb5r1ajVtj9dzm44YXsOyW1QdicCqLC+016uGvVJlbDosMK/iHpbdMhWQOJ7aMlleO71r2uuUqQvAVpHGAhtOp+DlFED+RLk6G8A0c76XjXuNWjV5YAWOlwZzPW3d69OWO2TvAMvxvMxWty94qxjROuKAbUGdN7DosjtT0BTjlXENimanTMVtSzfZncXwP3sCV1WrmgqIA1bjHVJD7HSKE86Y8scaVHC2hZdy2cBWEM9LZ1YxbLVqzOdyOxAhTb2U1g/xcIuvuKmB+WV3AfrXQbbKEEIdqnilctOelqNTYEciL7/szuxANyHLNFYhLp1MeNSzVvdOdk6hdzoGYVMN8PJWMbzF7kcNbHobQQIZ1hQbwijap79tx6yfrJsXHeaEDtJxU6IFnGsQAytWatCuy3Wo3BCZnW5myNlbp8+dUwunqEFedBVD3p4eBqvVPQjpPggplnxhLZAIVMEkrHvQKl3pNJAJwOy8q0Ip6Y5xke2bCi7QOicZFM4p9Bfw/vaDpRmdAC9zFe+SOXFTf9cATajiJZEiOeu32MD0DyAFLgzj5c4IGBj2u6ouZGYa0roP9+SrR40BqwAaJGrvQOKQWC3r5cEKGNg5ScyEwIaTrwgS+WqjUN88h/Bk4MbQ6jjrzGMD65QwrwfrqtTRxCgGG8V5MdEwpbX45NZs5Xhvs4WzWZz+Q7MwgCFOQ5uJBaRZZ8TALm5A28BR7F7XGb80GyiQ+B9yyVdm+m2lfLKqU1B2L4vg/EBOW9kieTvSddvAwCl4tDTr5lqz2mwkQ0K/qUNnWnBxOlcpr8wjmxMyvd10BPcGzhepKsg8xDmFsQtslVqGfgbunlO3gcjPqpJvFLZXDpHjeQJPE6LjAfRFKhzuW+f4hEsU2IXV+YCxgX8EIj/vkRRUyHuHA1xb2hm+rhltyitlXdjkuvAKF/bFlQH1RapZGs2tRwpsl/5/+428sC+WB7wSLzvZqOOR4Ht4QXg++LPtDu04ZNx8Ny/sizsKTK8uUo90+0hbj5H9o1wmhAsD7otUDSeEXX4XLwhblQErGMNUD4Swr+aFfXFTnTsM0JTTuvB4nX4lL9wvbm/1+ix+nOwJh1brwjOwj1pw8DASV6ugiC9SFRAGtMukFBdeB9kdHPFF1canN03jpQRST+89C7uiLmlonS7ETATr/sXbYk4NQ4NWu7T7oll+0C+9EFDWVepzF1/UvKGuYq7cWlUip0jMopvHloUJGfduztq+NTTduMcAd8PTVwRXnaGuYmOhBqEyy2nKX+4tx/MwoQ8pAO46l5bROrXhvcidkgx12b6Yb2wfQohMqIh5YZ1fubyIiZ22cRZ2sWvdOP75KDMxE5qkX8wf1VsEFtmgzrSdIrS0jmYZRK0S8cf2xbXmVknvtWBKBuFqDsPa0ygssuVQoSyscfJzCZSeftn95WGXDOn/evp4f/Xk8LrUjOCg2EnlaM/0YBHzUuoWKcV//rb7fHd3d3FbArcdMnz4rw9ub/mkGVdASC30Wgshdng/zoXJQdLvEFF/tO5KoM3U3wA8aLp1Cu4Fp+SvvulQufuS5svOuLxhdLRfeF76CwDXUYWlitNQsI7OoT0x7OX+keOlWbf4xVVouq/DFTVy+6CqK8jQjAfGvp4wL3qdUvRJT1Dpewv88axZDzwvzbKzi8uQbF/JWU6+sqB0f+bxuqQDFXb2+iS1MJVyVanm2P7xvc3LsIcUd6W8Iue0zs2ML00s/qB2j46Pj37fsULuYxU40tLSHPv3ho0qRf75QO1L/whA6UZeG0VMosseONjHvO9P0w2pqfR4VJPe0N023nF7JelnmyMzwU+sB4/FavGTD2OUtYgxZqc192j75J2s/bLJ7gzWyaaR5MxMeoT5nH1Sp3ekbS2bF7kQftmR2Rdqha9gGGePNMGdM9Wb0I8mRrydDpjzH/O2Lgu2sMQeayQRUBYA/w8WGMNrJgVG6aspn1diOQAsOz6RTmMj41v7QMJ8yYFkXIIzyUxXbF4RN/Nj0YBP0q2pUAcaYfby2YxJvtDWO+6swJT4dcRMpMAYXoT5aICXBNhaAhvxFP7PU5aEegtXkS+Ul35VasvcEekRl2qp7zWzExPZZbclDrD9qSnXfyS+5QFLLmXTJC4sc8DIVvLJNLM3PallciyKbkP4OhAA9qk5hcXaeNoF1mR5JZJ4tyZp7gZ+sY/NajKNfXJsJPGObS0xrRK4cZzQ+Enmjjrci8hVye8F9h0Lmlv3tiedZk1O0OAgDTgUmO3FBIBnh2Pu1jXuk7bVNp2/J22cy9y3JVIBYMnAId2WLXO8hObYB0+8WdxPsBb2DqPSr8Cdb1USd0QoKle1e9o1yRtJ/9BLkjNjW0gjMH7hRQsPWMJ72zl/FkAWsJ+xFQSWTohygK1JeNl9kHe8NzPrc4v4H+/dRXBm4UTiLGpKhQ53InPVd7JI4jbL/a3Gw53SB7bMBHEf2AZzUvvibzPCe2Dia4BJefHAEmtLk5NLzBGnAHHD0DKIqNuw/SRgPUlslm/c0pYT+cCmpMAO/LOaIcfiO80D7vwSX+GSaSkvAVhiPJ2e8P8aBcGJ+SKvbsP24yEOKQAj53ot3c0DNil1yTng9yMjfGdHRJz9HbshCGx/LJlMpllsdnck5yUC4/XH5y68Yiz4SAaiCPuO/+sEjcORG2Unp9jw7gKb3GcANBl4jgjPFLshCIyKdQI34ZHwigT2O5loHmle591X266FBice2FTYfgRYOrtuRxTfVsaYrd55bUj6WjGIhQDjgoYDTNoLRQDLfelyjdusyT/IqRkWwgRgoWCZxPXA38okrr7DH0iAXQuWKwfGt9C1MBmYCGALhR35ZGhPKMZYzvLfYWFUbCzygfl9+jdaWHpyTogFXg0iaVBkDOs67wR2X6KcDj3AV8Sw1PXB2jpnBQRYSoSx/E0xTJ5WZD8BCf5oYLnAcuWAuiVhkm6KaxbXS36S7sal1p4IsHFy8mPCrkKSkBUPHzsPWxSCgKMoYCfiqj6pW0am+U6iL616OGDN4Lk6GpG2kAAbtfMuxqQkedi1+GkQFxhNpgOBPwJYRlxHFGZkUYv9KIqumX42GHldhQOboMGGIUSCWFM8Bue1k/GB0TgpDhBF9ZLdPdI1sqiZrIt8T8Y3ywGWFWM6oyhgiU/8rzEqHGud/M1lgYu860cCo4MVwrEjgG3H8UjHyKIu3NpDphtOh7Po+50/WmFn1Sn5p6OBLQr95Dv2WHNrvFORwLDO/zLRoxW2QwtdZQSwVpekgjOyqKkBdIxqf31pKdtkwhZp1sbUvtuFh4zuRAOjNsSc0pR3rHU6aOSPh82A9PiIYDP2eNgU1b43JObZPr2mwUXFcGDFMI+UDbjiIiniJhXcKKhnSdyI60YYLxtYMB8ac2PevhCl1gAnxl/dn4bt+dghaj/4Jd0vT0wAIPTeb6TNIXobAkxvv1gyZPAwvE5aYs/B7dZYYLKqzdEImJLAHANr9IfHRpDiToA7Vlayne1bGGAM2qT75bYFb3Cd0RvQDLmgVAgLYcbugxRZ9FWjDceS1r3DJUEK63qjORZMsxiNrcu2Jr1QvhToUNxjHayzp7ZI7XyNoz9qtwGL68jTTD+xLHSTydDfth4a860LcCpFFnldcnJmdGIm5tW+7xU+1mjwWJMzE6P/xwbUwmO+1Qbg9EqCTH5DAUUkLtfmiF2VAHi6MQKjP7q6cysykVkYWfUAwGU7iAyhAV7WHaV8dJ5vdD6SEPr+WReR6XBFSSOb7lIY6RpdVfPxIjCnWs0ZiGFpGEPs1MlEMTJhjnDkhd0BVffSWzfcuZyl+5bQZSJNgVXevBohN+tgZZy5aXLprMMji5ycMpA6gvPdiVnu0i0JsqjpT4OoRiMTYzyMWeIMwCOfyyq2GATrPMb4jtVma92HG4vtMpVabpTw740STeyKu3XKey6XVWyScLdUjIom/b5SXGIG55VZMpmgz36KQYwm/b64LEOpejzmZRA36WeQsV2mSvV4PBPDxB6AKNxlup6J1FlNEy+KsUk/I3/4R6H1WoGb54fJOgsSAx/u3PivTj2+GvfiJJP0y+K/MmtOM7GvTnJJPxv/neF/VVY157XYXtmWEiPD/3Ywi7x0OUAqtmJ7JZ/0M/p8Zw+ZoRhTPAdAmR0YaxpPMOnnghnJzFSpxysoppHRpL+ZbsqQ3b5gz4Q1JerxTB3GTfr/TWcCjP/85V7M/8FTWzdUqcenN+MhM72EC5tl5+JB8NEU9kykyC2MZjdh1JRE0g/qCKIdr9bObCNkae0zvjQv3V4hpEg9Th5XFMbMuH9AUNt+y5VA06vQNCz95eI2xTK7fEbdphIPjHJ7mJms0zR2wbEkZ2iYiDwdEHvn89l73z1Lf31Rph5PVAsrOrIMDIGKPsdIv5LMDScq4/dr1YVDvKf28rz756+gZIP7U507vGIVf/vrP+V6fW+vvl2uzNrPbtPCJsXlcXexRZ7CVajXHMJfNo+VwkWe+/RfZloenUkWPoswp3uFd6aYz+dViV++CpB7bjy5bbXRDnFJW8eqDIfJVRCHasiTej4D+c5DBXlhC0Ja+BIv1VXh/dFWQckHlcZTQ8KmiKB6gTymcnAnuLGsyKjNN6gKV4MbixCp3QuGawseSrYODSxMRaRJTCkzjGBhaiHZSFZFucmG8ZQ/mofSaxjnUIlR569SJrdwDiGSBHzySDJJv6my8o3yqn1Xbt3UZe+fQFVmAcRSZpU8enSvWrafgigZlClC7ce36hWrgDkdF3FgX6lmEluS9KGgyFWgmNqGcJs8hiF8hlcLVpS4nB1PDVizaRwHw1SxsDI/v7fQMnXsrMPE1dGeQyKYfhVwZDNN8iRc87CmDd3SUWgGv12rHOrkAVkVwvJYkXk5365GbrplIu8hroVhZtFNFRy4/IH6/LCY7CLMa4Etw4fFZLTyCj0S62/RgjrX+ePpf8WMXiJIQaqsAAAAAElFTkSuQmCC', N'CD Projekt Red', N'CD Projekt S.A. is a Polish video game developer, publisher and distributor based in Warsaw, founded in May 1994.')
SET IDENTITY_INSERT [dbo].[Producers] OFF
GO
SET IDENTITY_INSERT [dbo].[Studios] ON 

INSERT [dbo].[Studios] ([Id], [Logo], [Name], [Description]) VALUES (1, N'https://cdn.myanimelist.net/images/company/314.png', N'White Fox', N'White Fox Co., Ltd is a Japanese animation studio founded in April 2007 by Gaku Iwasa.')
INSERT [dbo].[Studios] ([Id], [Logo], [Name], [Description]) VALUES (2, N'https://cdn.myanimelist.net/images/company/2.png', N'Kyoto Animation', N'Kyoto Animation is a Japanese animation studio based in Uji, Kyoto Prefecture.')
INSERT [dbo].[Studios] ([Id], [Logo], [Name], [Description]) VALUES (3, N'https://cdn.myanimelist.net/images/company/43.png', N'ufotable', N'ufotable is a Japanese animation studio based in Suginami, Tokyo.')
INSERT [dbo].[Studios] ([Id], [Logo], [Name], [Description]) VALUES (4, N'https://cdn.myanimelist.net/images/company/1.png', N'Pierrot', N'Pierrot Co., Ltd is a Japanese animation studio established in May 1979 by former employees of both Tatsunoko Production and Mushi Production.')
INSERT [dbo].[Studios] ([Id], [Logo], [Name], [Description]) VALUES (5, N'https://cdn.myanimelist.net/images/company/4.png', N'Bones', N'Bones (Bones Inc.) is a Japanese animation studio based in Suginami, Tokyo.')
INSERT [dbo].[Studios] ([Id], [Logo], [Name], [Description]) VALUES (6, N'https://cdn.myanimelist.net/images/company/1967.png', N'Drive', N'Studio Drive is an animation studio that was established in May 11, 2015, and is located in Suginami-ku, Tokyo.')
INSERT [dbo].[Studios] ([Id], [Logo], [Name], [Description]) VALUES (7, N'https://cdn.myanimelist.net/images/company/1974.png', N'ENGI', N' ENGI, is a Japanese animation studio founded by Kadokawa, Sammy Corporation, and Ultra Super Pictures, and is a subsidiary of Kadokawa Corporation.')
INSERT [dbo].[Studios] ([Id], [Logo], [Name], [Description]) VALUES (8, N'https://cdn.myanimelist.net/images/company/11.png', N'Madhouse', N'Madhouse is a Japanese animation studio founded in 1972 by ex–Mushi Pro animators. ')
INSERT [dbo].[Studios] ([Id], [Logo], [Name], [Description]) VALUES (10, N'https://cdn.myanimelist.net/images/company/803.png', N'Trigger', N'Trigger Inc., also known as Studio Trigger, is a Japanese animation studio founded by former Gainax employees Hiroyuki Imaishi and Masahiko Ōtsuka in 2011.')
SET IDENTITY_INSERT [dbo].[Studios] OFF
GO
SET IDENTITY_INSERT [dbo].[VoiceActors] ON 

INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (1, N'https://cdn.myanimelist.net/images/voiceactors/2/69967.jpg', N'Yui Ishikawa', N'This is the bio of the voice actor for Violet in Violet Evergarden.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (2, N'https://cdn.myanimelist.net/images/voiceactors/3/66832.jpg', N'Ogura Yui', N'This is the bio of the voice actor for Onna in Goblin Slayer.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (3, N'https://cdn.myanimelist.net/images/voiceactors/3/58788.jpg', N'Jouji Nakata', N'This is the bio of the voice actor for Kotomine Kirei in Fate.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (4, N'https://cdn.myanimelist.net/images/voiceactors/2/66416.jpg', N'Yuuki Kaji', N'This is the bio of the voice actor for Todoroki Shouto in My Hero Academia.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (5, N'https://cdn.myanimelist.net/images/voiceactors/1/57424.jpg', N'Daiki Yamashita', N'This is the bio of the voice actor for Midoriya in My Hero Academia.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (6, N'https://cdn.myanimelist.net/images/voiceactors/3/63403.jpg', N'Youko Hikasa', N'This is the bio of the voice actor for Dorothy in Shadows'' House')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (7, N'https://cdn.myanimelist.net/images/voiceactors/2/63379.jpg', N'Kenjiro Tsuda', N'This is the bio of the voice actor for Kansatsusha in To Your Eternity.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (8, N'https://cdn.myanimelist.net/images/voiceactors/1/66041.jpg', N'Saori Hayami', N'This is the bio of the voice actor for Lion Ryuu in Is It Wrong to Try to Pick Up Girls in a Dungeon?')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (9, N'https://cdn.myanimelist.net/images/voiceactors/2/69419.jpg', N'Ayako Kawasumi ', N'This is the bio of the voice actor for Saber in Fate/stay night.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (10, N'https://cdn.myanimelist.net/images/voiceactors/3/62624.jpg', N'Akira Shida', N'This is the bio of the voice actor for Akaza in Demon Slayer.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (11, N'https://cdn.myanimelist.net/images/voiceactors/2/57767.jpg', N'Fumiko Orikasa', N'This is the bio of the voice actor for Rukia in Bleach: 1000-Year Blood War.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (12, N'https://cdn.myanimelist.net/images/voiceactors/1/54602.jpg', N'Romi Park', N'This is the bio of the voice actor for Toushirou in Bleach: 1000-Year Blood War.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (13, N'https://cdn.myanimelist.net/images/voiceactors/3/61307.jpg', N'Nao Touyama', N'This is the bio of the voice actor for Elf in Goblin Slayer.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (14, N'https://cdn.myanimelist.net/images/voiceactors/1/68020.jpg', N'Akari Kitou', N'This is the bio of the voice actor for Nezuko in Demon Slayer.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (15, N'https://cdn.myanimelist.net/images/voiceactors/3/10132.jpg', N'Aya Endo', N'This is the bio of the voice actor for Cattleya in Violet Evergarden.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (16, N'https://cdn.myanimelist.net/images/voiceactors/1/42680.jpg', N'Eri Inagawa', N'This is the bio of the voice actor for Tonari in To Your Eternity.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (17, N'https://cdn.myanimelist.net/images/voiceactors/3/68410.jpg', N'Naomi Oozora', N'This is the bio of the voice actor for Hana Uzaki in Uzaki-chan wants to hang out.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (18, N'https://cdn.myanimelist.net/images/voiceactors/3/67808.jpg', N'Aoi Yuuki', N'This is the bio of the voice actor for Lucy in Cyberpunk: Edgerunners.')
INSERT [dbo].[VoiceActors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (19, N'https://cdn.myanimelist.net/images/voiceactors/2/69995.jpg', N'Tomoyo Kurosawa ', N'This is the bio of the voice actor for Rebecca in Cyberpunk: Edgerunners.')
SET IDENTITY_INSERT [dbo].[VoiceActors] OFF
GO
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (1, 2)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (1, 13)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (2, 1)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (2, 15)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (3, 3)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (3, 9)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (6, 11)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (6, 12)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (7, 4)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (7, 5)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (8, 10)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (8, 14)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (9, 7)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (9, 16)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (10, 8)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (10, 17)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (11, 18)
INSERT [dbo].[VoiceActors_Anime] ([AnimeId], [VoiceActorId]) VALUES (11, 19)
GO
/****** Object:  Index [IX_Anime_ProducerId]    Script Date: 18/10/2022 09:42:36 ******/
CREATE NONCLUSTERED INDEX [IX_Anime_ProducerId] ON [dbo].[Anime]
(
	[ProducerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Anime_StudioId]    Script Date: 18/10/2022 09:42:36 ******/
CREATE NONCLUSTERED INDEX [IX_Anime_StudioId] ON [dbo].[Anime]
(
	[StudioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 18/10/2022 09:42:36 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 18/10/2022 09:42:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 18/10/2022 09:42:36 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 18/10/2022 09:42:36 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 18/10/2022 09:42:36 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 18/10/2022 09:42:36 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 18/10/2022 09:42:36 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CartItems_AnimeId]    Script Date: 18/10/2022 09:42:36 ******/
CREATE NONCLUSTERED INDEX [IX_CartItems_AnimeId] ON [dbo].[CartItems]
(
	[AnimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_AnimeId]    Script Date: 18/10/2022 09:42:36 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_AnimeId] ON [dbo].[OrderItems]
(
	[AnimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_OrderId]    Script Date: 18/10/2022 09:42:36 ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VoiceActors_Anime_AnimeId]    Script Date: 18/10/2022 09:42:36 ******/
CREATE NONCLUSTERED INDEX [IX_VoiceActors_Anime_AnimeId] ON [dbo].[VoiceActors_Anime]
(
	[AnimeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Anime]  WITH CHECK ADD  CONSTRAINT [FK_Anime_Producers_ProducerId] FOREIGN KEY([ProducerId])
REFERENCES [dbo].[Producers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Anime] CHECK CONSTRAINT [FK_Anime_Producers_ProducerId]
GO
ALTER TABLE [dbo].[Anime]  WITH CHECK ADD  CONSTRAINT [FK_Anime_Studios_StudioId] FOREIGN KEY([StudioId])
REFERENCES [dbo].[Studios] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Anime] CHECK CONSTRAINT [FK_Anime_Studios_StudioId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Anime_AnimeId] FOREIGN KEY([AnimeId])
REFERENCES [dbo].[Anime] ([Id])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Anime_AnimeId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Anime_AnimeId] FOREIGN KEY([AnimeId])
REFERENCES [dbo].[Anime] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Anime_AnimeId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[VoiceActors_Anime]  WITH CHECK ADD  CONSTRAINT [FK_VoiceActors_Anime_Anime_AnimeId] FOREIGN KEY([AnimeId])
REFERENCES [dbo].[Anime] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VoiceActors_Anime] CHECK CONSTRAINT [FK_VoiceActors_Anime_Anime_AnimeId]
GO
ALTER TABLE [dbo].[VoiceActors_Anime]  WITH CHECK ADD  CONSTRAINT [FK_VoiceActors_Anime_VoiceActors_VoiceActorId] FOREIGN KEY([VoiceActorId])
REFERENCES [dbo].[VoiceActors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VoiceActors_Anime] CHECK CONSTRAINT [FK_VoiceActors_Anime_VoiceActors_VoiceActorId]
GO
USE [master]
GO
ALTER DATABASE [goanime-db] SET  READ_WRITE 
GO
