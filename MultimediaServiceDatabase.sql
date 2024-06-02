USE [master]
GO
/****** Object:  Database [MultimediaService]    Script Date: 02/06/2024 10:04:45 SA ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 02/06/2024 10:04:45 SA ******/
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
/****** Object:  Table [dbo].[Audios]    Script Date: 02/06/2024 10:04:45 SA ******/
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
/****** Object:  Table [dbo].[Images]    Script Date: 02/06/2024 10:04:45 SA ******/
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
/****** Object:  Table [dbo].[Messages]    Script Date: 02/06/2024 10:04:45 SA ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 02/06/2024 10:04:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 02/06/2024 10:04:45 SA ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240529090628_User', N'8.0.5')
GO
SET IDENTITY_INSERT [dbo].[Audios] ON 

INSERT [dbo].[Audios] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (1, N'20240531172558825085.mp3', N'D:\source\Visual Studio 2022\MultimediaService\Multimedia\Audios\20240531172558825085.mp3', N'D:\source\Visual Studio 2022\MultimediaService\Compressed\Audios\20240531172558811143.mp3', CAST(N'2024-05-31T17:26:00.0588693' AS DateTime2))
INSERT [dbo].[Audios] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (2, N'20240531173227082712.mp3', N'D:\source\Visual Studio 2022\MultimediaService\Multimedia\Audios\20240531173227082712.mp3', N'D:\source\Visual Studio 2022\MultimediaService\Compressed\Audios\20240531173227813557.mp3', CAST(N'2024-05-31T17:32:31.2984873' AS DateTime2))
INSERT [dbo].[Audios] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (3, N'20240601130435486097.mp3', N'D:\source\Visual Studio 2022\MultimediaService\Multimedia\Audios\20240601130435486097.mp3', N'D:\source\Visual Studio 2022\MultimediaService\Compressed\Audios\20240601130435905023.mp3', CAST(N'2024-06-01T13:04:39.6191858' AS DateTime2))
INSERT [dbo].[Audios] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (4, N'20240601130512951692.mp3', N'D:\source\Visual Studio 2022\MultimediaService\Multimedia\Audios\20240601130512951692.mp3', N'D:\source\Visual Studio 2022\MultimediaService\Compressed\Audios\20240601130512067608.mp3', CAST(N'2024-06-01T13:05:13.7613710' AS DateTime2))
INSERT [dbo].[Audios] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (5, N'20240601184226493164.mp3', N'D:\source\Visual Studio 2022\MultimediaService\Multimedia\Audios\20240601184226493164.mp3', N'D:\source\Visual Studio 2022\MultimediaService\Compressed\Audios\20240601184226842501.mp3', CAST(N'2024-06-01T18:42:27.9086194' AS DateTime2))
INSERT [dbo].[Audios] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (6, N'20240601184319439898.mp3', N'D:\source\Visual Studio 2022\MultimediaService\Multimedia\Audios\20240601184319439898.mp3', N'D:\source\Visual Studio 2022\MultimediaService\Compressed\Audios\20240601184319802616.mp3', CAST(N'2024-06-01T18:43:20.0599056' AS DateTime2))
INSERT [dbo].[Audios] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (7, N'20240601185958144445.mp3', N'D:\source\Visual Studio 2022\MultimediaService\Multimedia\Audios\20240601185958144445.mp3', N'Compressed\Audios\20240601185958806376.mp3', CAST(N'2024-06-01T19:00:01.4543804' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Audios] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (1, N'20240522035604633864.png', N'Multimedia\Images\20240522035604633864.png', N'Compressed\Images\20240522035604486398.png', CAST(N'2024-05-22T03:56:04.4017540' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (2, N'20240522082733363945.png', N'Multimedia\Images\20240522082733363945.png', N'Compressed\Images\20240522082733749493.png', CAST(N'2024-05-22T08:27:34.3385085' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (3, N'20240522085541399093.png', N'Multimedia\Images\20240522085541399093.png', N'Compressed\Images\20240522085541586096.png', CAST(N'2024-05-22T08:55:42.0548572' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (4, N'20240522085544832313.png', N'Multimedia\Images\20240522085544832313.png', N'Compressed\Images\20240522085544775432.png', CAST(N'2024-05-22T08:55:44.6428123' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (5, N'20240524213709412480.jpg', N'Multimedia\Images\20240524213709412480.jpg', N'Compressed\Images\20240524213709660210.jpg', CAST(N'2024-05-24T21:37:10.9540567' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (6, N'20240531152711367963.jpeg', N'Multimedia\Images\20240531152711367963.jpeg', N'Compressed\Images\20240531152711790051.jpeg', CAST(N'2024-05-31T15:27:13.1371793' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (7, N'20240531165315278096.png', N'Multimedia\Images\20240531165315278096.png', N'Compressed\Images\20240531165315077122.png', CAST(N'2024-05-31T16:53:15.5680635' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (8, N'20240531170014275755.jpeg', N'Multimedia\Images\20240531170014275755.jpeg', N'Compressed\Images\20240531170014330227.jpeg', CAST(N'2024-05-31T17:00:14.9035429' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (9, N'20240531170051994419.jpeg', N'Multimedia\Images\20240531170051994419.jpeg', N'Compressed\Images\20240531170051135939.jpeg', CAST(N'2024-05-31T17:00:52.0094025' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (10, N'20240531171736899609.png', N'Multimedia\Images\20240531171736899609.png', N'Compressed\Images\20240531171736081780.png', CAST(N'2024-05-31T17:17:36.3108654' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (11, N'20240531171915516744.jpg', N'Multimedia\Images\20240531171915516744.jpg', N'Compressed\Images\20240531171915432617.jpg', CAST(N'2024-05-31T17:19:16.0505301' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (12, N'20240531173558796258.png', N'Multimedia\Images\20240531173558796258.png', N'Compressed\Images\20240531173558511498.png', CAST(N'2024-05-31T17:35:58.5165823' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (13, N'20240531174719037911.png', N'Multimedia\Images\20240531174719037911.png', N'Compressed\Images\20240531174719969547.png', CAST(N'2024-05-31T17:47:19.9744159' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (14, N'20240601094834610352.png', N'Multimedia\Images\20240601094834610352.png', N'Compressed\Images\20240601094834907834.png', CAST(N'2024-06-01T09:48:35.6464821' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (15, N'20240601130346261027.jpeg', N'Multimedia\Images\20240601130346261027.jpeg', N'Compressed\Images\20240601130346368325.jpeg', CAST(N'2024-06-01T13:03:46.2389033' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (16, N'20240601190352109115.jpg', N'Multimedia\Images\20240601190352109115.jpg', N'Compressed\Images\20240601190352864877.jpg', CAST(N'2024-06-01T19:03:52.8094297' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (17, N'20240601190439787332.jpeg', N'Multimedia\Images\20240601190439787332.jpeg', N'Compressed\Images\20240601190439570269.jpeg', CAST(N'2024-06-01T19:04:39.2327515' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (18, N'20240601190631543933.jpg', N'Multimedia\Images\20240601190631543933.jpg', N'Compressed\Images\20240601190631860560.jpg', CAST(N'2024-06-01T19:06:31.5688342' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (19, N'20240601191054086872.jpeg', N'Multimedia\Images\20240601191054086872.jpeg', N'Compressed\Images\20240601191054994797.jpeg', CAST(N'2024-06-01T19:10:54.8484110' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (20, N'20240601191840627479.png', N'Multimedia\Images\20240601191840627479.png', N'Compressed\Images\20240601191840394060.png', CAST(N'2024-06-01T19:18:40.8448588' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (21, N'20240601191859623465.png', N'Multimedia\Images\20240601191859623465.png', N'Compressed\Images\20240601191859126440.png', CAST(N'2024-06-01T19:18:59.7486901' AS DateTime2))
INSERT [dbo].[Images] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (22, N'20240602095730510160.jpg', N'Multimedia\Images\20240602095730510160.jpg', N'Compressed\Images\20240602095730687231.jpg', CAST(N'2024-06-02T09:57:31.1658460' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (1, 1, 3, N'Image', N'1', CAST(N'2024-05-22T03:56:05.5297776' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (2, 3, 1, N'Image', N'2', CAST(N'2024-05-22T08:27:34.5609698' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (3, 3, 4, N'Image', N'3', CAST(N'2024-05-22T08:55:44.4524880' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (4, 3, 4, N'Video', N'1', CAST(N'2024-05-22T08:55:44.8008656' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (5, 1, 4, N'Video', N'1', CAST(N'2024-05-22T09:00:18.4418938' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (6, 3, 1, N'Image', N'5', CAST(N'2024-05-24T21:37:14.1663514' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (7, 3, 1, N'Message', N'aaa', CAST(N'2024-05-30T22:45:54.0335967' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (8, 1, 3, N'Message', N'a', CAST(N'2024-05-30T23:06:15.8216189' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (9, 3, 1, N'Message', N'ư', CAST(N'2024-05-31T06:20:27.1157171' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (10, 3, 1, N'Message', N' x', CAST(N'2024-05-31T06:22:22.9713545' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (11, 3, 4, N'Message', N's', CAST(N'2024-05-31T06:22:57.9545928' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (12, 3, 4, N'Message', N's1', CAST(N'2024-05-31T06:24:02.7407988' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (13, 3, 5, N'Message', N'@', CAST(N'2024-05-31T06:25:39.4920600' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (14, 3, 5, N'Message', N'1', CAST(N'2024-05-31T06:26:40.1575943' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (15, 3, 4, N'Message', N'a', CAST(N'2024-05-31T06:29:59.5073885' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (16, 3, 4, N'Message', N'a', CAST(N'2024-05-31T06:30:30.5153684' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (17, 3, 5, N'Message', N'?', CAST(N'2024-05-31T06:56:33.5338235' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (18, 3, 5, N'Message', N'?', CAST(N'2024-05-31T06:56:36.3760623' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (19, 5, 3, N'Message', N'a', CAST(N'2024-05-31T06:57:43.2538123' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (20, 5, 1, N'Message', N'a', CAST(N'2024-05-31T07:00:03.8213692' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (21, 5, 1, N'Message', N'b', CAST(N'2024-05-31T07:00:17.6308946' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (22, 5, 1, N'Message', N'c', CAST(N'2024-05-31T07:23:27.7958467' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (23, 5, 1, N'Message', N'd', CAST(N'2024-05-31T11:47:23.5649571' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (24, 1, 2, N'Message', N'Test message', CAST(N'2024-05-31T12:15:30.5268585' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (25, 5, 1, N'Message', N'e', CAST(N'2024-05-31T12:16:13.1074066' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (26, 5, 1, N'Message', N'f', CAST(N'2024-05-31T12:16:43.1372819' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (27, 5, 1, N'Message', N'g', CAST(N'2024-05-31T12:18:51.3823769' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (28, 5, 4, N'Message', N'a', CAST(N'2024-05-31T12:21:36.3548741' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (29, 5, 1, N'Message', N'g', CAST(N'2024-05-31T12:21:41.6062696' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (30, 5, 1, N'Message', N'h', CAST(N'2024-05-31T12:23:21.5190314' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (31, 5, 1, N'Message', N'x', CAST(N'2024-05-31T12:23:34.9427135' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (32, 5, 3, N'Message', N'b', CAST(N'2024-05-31T12:24:03.1810364' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (33, 5, 3, N'Message', N'c', CAST(N'2024-05-31T12:24:06.9158300' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (34, 1, 5, N'Message', N'a', CAST(N'2024-05-31T14:18:22.4614876' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (35, 3, 1, N'Image', N'3', CAST(N'2024-05-31T14:37:51.7633893' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (36, 3, 5, N'Message', N'a', CAST(N'2024-05-31T15:22:36.6702787' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (37, 0, 0, N'Image', N'6', CAST(N'2024-05-31T15:27:13.3593677' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (38, 3, 1, N'Image', N'6', CAST(N'2024-05-31T15:27:17.9491106' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (39, 3, 4, N'Image', N'4', CAST(N'2024-05-31T16:12:59.5785005' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (40, 3, 1, N'Image', N'5', CAST(N'2024-05-31T16:14:56.2193062' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (41, 0, 0, N'Image', N'7', CAST(N'2024-05-31T16:53:15.7979399' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (42, 0, 0, N'Image', N'8', CAST(N'2024-05-31T17:00:15.1080748' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (43, 0, 0, N'Image', N'9', CAST(N'2024-05-31T17:00:52.0381621' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (44, 3, 1, N'Image', N'10', CAST(N'2024-05-31T17:17:36.4767454' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (45, 3, 1, N'Message', N'a', CAST(N'2024-05-31T17:19:01.0970093' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (46, 3, 1, N'Image', N'11', CAST(N'2024-05-31T17:19:16.0713544' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (47, 3, 5, N'Video', N'2', CAST(N'2024-05-31T17:25:12.4279674' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (48, 3, 5, N'Audio', N'1', CAST(N'2024-05-31T17:26:00.0983559' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (49, 3, 5, N'Message', N'abc', CAST(N'2024-05-31T17:27:59.0294868' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (50, 3, 5, N'Audio', N'2', CAST(N'2024-05-31T17:32:31.4752244' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (51, 3, 4, N'Image', N'12', CAST(N'2024-05-31T17:35:58.5432539' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (52, 3, 4, N'Video', N'3', CAST(N'2024-05-31T17:37:00.2602616' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (53, 3, 1, N'Image', N'13', CAST(N'2024-05-31T17:47:20.1688683' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (54, 5, 3, N'Image', N'14', CAST(N'2024-06-01T09:48:36.2061118' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (55, 1, 3, N'Message', N'bruh', CAST(N'2024-06-01T12:59:18.9420760' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (56, 1, 3, N'Message', N'bruh', CAST(N'2024-06-01T12:59:22.2368123' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (57, 3, 1, N'Image', N'15', CAST(N'2024-06-01T13:03:46.5274273' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (58, 1, 3, N'Audio', N'3', CAST(N'2024-06-01T13:04:39.7272001' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (59, 1, 3, N'Audio', N'4', CAST(N'2024-06-01T13:05:13.7870272' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (60, 3, 1, N'Message', N' b', CAST(N'2024-06-01T13:27:46.9708413' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (61, 1, 3, N'Message', N'bruh', CAST(N'2024-06-01T13:28:32.0971887' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (62, 3, 4, N'Audio', N'5', CAST(N'2024-06-01T18:42:28.0974802' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (63, 3, 4, N'Audio', N'6', CAST(N'2024-06-01T18:43:20.1476726' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (64, 3, 1, N'Audio', N'7', CAST(N'2024-06-01T19:00:01.6504952' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (65, 3, 6, N'Image', N'16', CAST(N'2024-06-01T19:03:52.9684308' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (66, 3, 6, N'Image', N'17', CAST(N'2024-06-01T19:04:39.2568670' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (67, 1, 3, N'Image', N'18', CAST(N'2024-06-01T19:06:31.5952457' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (68, 1, 4, N'Image', N'19', CAST(N'2024-06-01T19:10:54.8724588' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (69, 1, 4, N'Video', N'4', CAST(N'2024-06-01T19:12:48.6383767' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (70, 3, 4, N'Image', N'20', CAST(N'2024-06-01T19:18:40.8734715' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (71, 3, 1, N'Image', N'21', CAST(N'2024-06-01T19:18:59.7854989' AS DateTime2))
INSERT [dbo].[Messages] ([Id], [SendId], [ReceiveId], [Type], [Value], [SentTime]) VALUES (72, 1, 3, N'Image', N'22', CAST(N'2024-06-02T09:57:31.3402165' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [CreatedAt]) VALUES (1, N'user1', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2024-05-29T16:12:27.6611813' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [CreatedAt]) VALUES (3, N'user2', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2024-05-29T16:32:10.0350645' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [CreatedAt]) VALUES (4, N'user3', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2024-05-30T14:01:33.8960507' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [CreatedAt]) VALUES (5, N'user4', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2024-05-30T19:11:18.0911424' AS DateTime2))
INSERT [dbo].[Users] ([Id], [Username], [PasswordHash], [CreatedAt]) VALUES (6, N'user5', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', CAST(N'2024-06-01T12:45:04.1953291' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Videos] ON 

INSERT [dbo].[Videos] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (1, N'20240522090017223812.mp4', N'D:\source\Visual Studio 2022\MultimediaService\Multimedia\Videos\20240522090017223812.mp4', N'D:\source\Visual Studio 2022\MultimediaService\Compressed\Videos\20240522090017332878.mp4', CAST(N'2024-05-22T09:00:18.3502033' AS DateTime2))
INSERT [dbo].[Videos] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (2, N'20240531172417368765.mp4', N'D:\source\Visual Studio 2022\MultimediaService\Multimedia\Videos\20240531172417368765.mp4', N'D:\source\Visual Studio 2022\MultimediaService\Compressed\Videos\20240531172417795654.mp4', CAST(N'2024-05-31T17:25:12.1943594' AS DateTime2))
INSERT [dbo].[Videos] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (3, N'20240531173609068054.mp4', N'D:\source\Visual Studio 2022\MultimediaService\Multimedia\Videos\20240531173609068054.mp4', N'D:\source\Visual Studio 2022\MultimediaService\Compressed\Videos\20240531173609168819.mp4', CAST(N'2024-05-31T17:37:00.2274708' AS DateTime2))
INSERT [dbo].[Videos] ([Id], [FileName], [FilePath], [CompressedPath], [UploadDate]) VALUES (4, N'20240601191157002714.mp4', N'Multimedia\Videos\20240601191157002714.mp4', N'Compressed\Videos\20240601191157639737.mp4', CAST(N'2024-06-01T19:12:48.5983220' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Videos] OFF
GO
USE [master]
GO
ALTER DATABASE [MultimediaService] SET  READ_WRITE 
GO
