USE [master]
GO
/****** Object:  Database [MultimediaService]    Script Date: 04/06/2024 4:39:07 CH ******/
CREATE DATABASE [MultimediaService]
GO
ALTER DATABASE [MultimediaService] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MultimediaService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MultimediaService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MultimediaService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MultimediaService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MultimediaService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MultimediaService] SET ARITHABORT OFF 
GO
ALTER DATABASE [MultimediaService] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MultimediaService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MultimediaService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MultimediaService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MultimediaService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MultimediaService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MultimediaService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MultimediaService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MultimediaService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MultimediaService] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MultimediaService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MultimediaService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MultimediaService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MultimediaService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MultimediaService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MultimediaService] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MultimediaService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MultimediaService] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MultimediaService] SET  MULTI_USER 
GO
ALTER DATABASE [MultimediaService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MultimediaService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MultimediaService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MultimediaService] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MultimediaService] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MultimediaService] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MultimediaService] SET QUERY_STORE = ON
GO
ALTER DATABASE [MultimediaService] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MultimediaService]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 04/06/2024 4:39:07 CH ******/
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
/****** Object:  Table [dbo].[Audios]    Script Date: 04/06/2024 4:39:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[FilePath] [nvarchar](max) NOT NULL,
	[CompressedPath] [nvarchar](max) NOT NULL,
	[UploadDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Audios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 04/06/2024 4:39:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[FilePath] [nvarchar](max) NOT NULL,
	[CompressedPath] [nvarchar](max) NOT NULL,
	[UploadDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 04/06/2024 4:39:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SendId] [int] NOT NULL,
	[ReceiveId] [int] NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[SentTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 04/06/2024 4:39:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 04/06/2024 4:39:07 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[FilePath] [nvarchar](max) NOT NULL,
	[CompressedPath] [nvarchar](max) NOT NULL,
	[UploadDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240521204657_Multimedia', N'8.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240523015415_User', N'8.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240604084246_User', N'8.0.5')
GO
SET IDENTITY_INSERT [dbo].[Audios] ON 

INSERT [dbo].[Audios] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (1, N'20240604161147191638.mp3', N'Multimedia\Audios\20240604161147191638.mp3', N'Compressed\Audios\20240604161147648415.mp3', CAST(N'2024-06-04T16:11:48.4940030' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Audios] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (1, N'20240604160147129266.jpg', N'Multimedia\Images\20240604160147129266.jpg', N'Compressed\Images\20240604160147752082.jpg', CAST(N'2024-06-04T16:01:47.1203630' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (2, N'20240604160624782147.jpg', N'Multimedia\Images\20240604160624782147.jpg', N'Compressed\Images\20240604160624097050.jpg', CAST(N'2024-06-04T16:06:24.9606224' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (3, N'20240604162306979865.png', N'Multimedia\Images\20240604162306979865.png', N'Compressed\Images\20240604162306640678.png', CAST(N'2024-06-04T16:23:06.5735089' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (1, 4, 1, N'Image', N'1', CAST(N'2024-06-04T16:01:47.1573781' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (2, 4, 1, N'Message', N'một thứ gì đó', CAST(N'2024-06-04T16:01:59.5988048' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (3, 1, 4, N'Image', N'2', CAST(N'2024-06-04T16:06:25.1278158' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (4, 4, 1, N'Audio', N'1', CAST(N'2024-06-04T16:11:48.5275135' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (5, 4, 1, N'Video', N'1', CAST(N'2024-06-04T16:20:43.8826398' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (6, 2, 1, N'Image', N'3', CAST(N'2024-06-04T16:23:06.6018447' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (7, 1, 2, N'Message', N'bruh', CAST(N'2024-06-04T16:23:19.5033689' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [FullName], [PasswordHash], [CreatedAt]) VALUES (1, N'user1', N'Phạm Minh Tuấn', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2024-06-04T15:52:44.8815792' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Username], [FullName], [PasswordHash], [CreatedAt]) VALUES (2, N'user2', N'Lê Thanh Thảo', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2024-06-04T15:58:50.3029561' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Username], [FullName], [PasswordHash], [CreatedAt]) VALUES (3, N'user3', N'Lê Đức Long', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2024-06-04T16:00:49.7383284' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Username], [FullName], [PasswordHash], [CreatedAt]) VALUES (4, N'user4', N'Ngô Văn Tùng', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2024-06-04T16:01:20.5501510' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Videos] ON 

INSERT [dbo].[Videos] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (1, N'20240604161950285788.mp4', N'Multimedia\Videos\20240604161950285788.mp4', N'Compressed\Videos\20240604161950004894.mp4', CAST(N'2024-06-04T16:20:43.7311309' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Videos] OFF
GO
USE [master]
GO
ALTER DATABASE [MultimediaService] SET  READ_WRITE 
GO
