USE [master]
GO
/****** Object:  Database [BD_redes_sociales]    Script Date: 23/03/2025 19:35:09 ******/
CREATE DATABASE [BD_redes_sociales]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_redes_sociales', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BD_redes_sociales.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_redes_sociales_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BD_redes_sociales_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BD_redes_sociales] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_redes_sociales].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_redes_sociales] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_redes_sociales] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_redes_sociales] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BD_redes_sociales] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_redes_sociales] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET RECOVERY FULL 
GO
ALTER DATABASE [BD_redes_sociales] SET  MULTI_USER 
GO
ALTER DATABASE [BD_redes_sociales] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_redes_sociales] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_redes_sociales] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_redes_sociales] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_redes_sociales] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_redes_sociales] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BD_redes_sociales', N'ON'
GO
ALTER DATABASE [BD_redes_sociales] SET QUERY_STORE = ON
GO
ALTER DATABASE [BD_redes_sociales] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BD_redes_sociales]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 23/03/2025 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[id_comentario] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_publicacion] [int] NOT NULL,
	[comentario] [text] NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_comentario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DarLikes]    Script Date: 23/03/2025 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DarLikes](
	[id_like] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_publicacion] [int] NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_like] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imagen]    Script Date: 23/03/2025 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagen](
	[id_imagen] [int] IDENTITY(1,1) NOT NULL,
	[id_publicacion] [int] NOT NULL,
	[url] [varchar](255) NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_imagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publicacion]    Script Date: 23/03/2025 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publicacion](
	[id_publicacion] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[contenido] [text] NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_publicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seguir]    Script Date: 23/03/2025 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seguir](
	[id_seguimiento] [int] IDENTITY(1,1) NOT NULL,
	[id_seguidor] [int] NOT NULL,
	[id_seguido] [int] NOT NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_seguimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/03/2025 19:35:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[telefono] [varchar](20) NULL,
	[pais] [varchar](50) NULL,
	[direccion] [varchar](255) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comentario] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[DarLikes] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Imagen] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Publicacion] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Seguir] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD FOREIGN KEY([id_publicacion])
REFERENCES [dbo].[Publicacion] ([id_publicacion])
GO
ALTER TABLE [dbo].[Comentario]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[DarLikes]  WITH CHECK ADD FOREIGN KEY([id_publicacion])
REFERENCES [dbo].[Publicacion] ([id_publicacion])
GO
ALTER TABLE [dbo].[DarLikes]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Imagen]  WITH CHECK ADD FOREIGN KEY([id_publicacion])
REFERENCES [dbo].[Publicacion] ([id_publicacion])
GO
ALTER TABLE [dbo].[Publicacion]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Seguir]  WITH CHECK ADD FOREIGN KEY([id_seguidor])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Seguir]  WITH CHECK ADD FOREIGN KEY([id_seguido])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
USE [master]
GO
ALTER DATABASE [BD_redes_sociales] SET  READ_WRITE 
GO
