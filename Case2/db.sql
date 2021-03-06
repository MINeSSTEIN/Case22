USE [master]
GO
/****** Object:  Database [CaseQual]    Script Date: 28.02.2022 9:49:20 ******/
CREATE DATABASE [CaseQual]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CaseQual', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CaseQual.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CaseQual_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CaseQual_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CaseQual] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CaseQual].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CaseQual] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CaseQual] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CaseQual] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CaseQual] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CaseQual] SET ARITHABORT OFF 
GO
ALTER DATABASE [CaseQual] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CaseQual] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CaseQual] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CaseQual] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CaseQual] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CaseQual] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CaseQual] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CaseQual] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CaseQual] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CaseQual] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CaseQual] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CaseQual] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CaseQual] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CaseQual] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CaseQual] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CaseQual] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CaseQual] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CaseQual] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CaseQual] SET  MULTI_USER 
GO
ALTER DATABASE [CaseQual] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CaseQual] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CaseQual] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CaseQual] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CaseQual] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CaseQual] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CaseQual] SET QUERY_STORE = OFF
GO
USE [CaseQual]
GO
/****** Object:  Table [dbo].[Certificates]    Script Date: 28.02.2022 9:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NULL,
	[TeacherID] [int] NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Certificates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 28.02.2022 9:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectsID] [int] NOT NULL,
	[Hours] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Theme] [nvarchar](200) NOT NULL,
	[LeaderID] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoursesSchedules]    Script Date: 28.02.2022 9:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoursesSchedules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[DayOfWeekID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK_CoursesSchedules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DaysOfWeek]    Script Date: 28.02.2022 9:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DaysOfWeek](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_DaysOfWeek] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 28.02.2022 9:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 28.02.2022 9:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ClassRoom] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 28.02.2022 9:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UsersID] [int] NOT NULL,
	[SubjectsID] [int] NULL,
	[FIO] [nvarchar](100) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[IsStudent] [bit] NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachersAndCourses]    Script Date: 28.02.2022 9:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersAndCourses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
 CONSTRAINT [PK_TeachersAndCourses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeachersAndGroups]    Script Date: 28.02.2022 9:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeachersAndGroups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[GroupID] [int] NOT NULL,
 CONSTRAINT [PK_TeachersAndGroups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28.02.2022 9:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[UsersTypesID] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersTypes]    Script Date: 28.02.2022 9:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UsersTypes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([id], [SubjectsID], [Hours], [Name], [Theme], [LeaderID]) VALUES (1, 1, 42, N'Курс по математике', N'Курс повышения квалификации по интегралам', 1)
INSERT [dbo].[Courses] ([id], [SubjectsID], [Hours], [Name], [Theme], [LeaderID]) VALUES (2, 1, 12, N'Математические формулы', N'Повторение основных и дополнительных формул по математике', 1)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Group] ON 

INSERT [dbo].[Group] ([id], [GroupName]) VALUES (1, N'ИСП.18')
INSERT [dbo].[Group] ([id], [GroupName]) VALUES (2, N'ССА.19')
INSERT [dbo].[Group] ([id], [GroupName]) VALUES (3, N'ТОРАТ.20')
SET IDENTITY_INSERT [dbo].[Group] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([id], [Name], [ClassRoom]) VALUES (1, N'Математика', N'13')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([id], [UsersID], [SubjectsID], [FIO], [BirthDate], [IsStudent], [Gender]) VALUES (1, 2, NULL, N'ШДА', CAST(N'2001-10-13' AS Date), 0, N'System.Windows.Controls.ComboBoxItem: Мужской')
INSERT [dbo].[Teachers] ([id], [UsersID], [SubjectsID], [FIO], [BirthDate], [IsStudent], [Gender]) VALUES (3, 4, NULL, N'КАА', CAST(N'2002-09-19' AS Date), 1, N'System.Windows.Controls.ComboBoxItem: Мужской')
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
SET IDENTITY_INSERT [dbo].[TeachersAndCourses] ON 

INSERT [dbo].[TeachersAndCourses] ([id], [TeacherID], [CourseID]) VALUES (2, 3, 1)
SET IDENTITY_INSERT [dbo].[TeachersAndCourses] OFF
GO
SET IDENTITY_INSERT [dbo].[TeachersAndGroups] ON 

INSERT [dbo].[TeachersAndGroups] ([id], [TeacherID], [GroupID]) VALUES (1, 1, 2)
INSERT [dbo].[TeachersAndGroups] ([id], [TeacherID], [GroupID]) VALUES (2, 3, 1)
SET IDENTITY_INSERT [dbo].[TeachersAndGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [Login], [Password], [UsersTypesID]) VALUES (1, N'Учитель', N'Учитель', 1)
INSERT [dbo].[Users] ([id], [Login], [Password], [UsersTypesID]) VALUES (2, N'123', N'123', 1)
INSERT [dbo].[Users] ([id], [Login], [Password], [UsersTypesID]) VALUES (4, N'1234', N'1234', 1)
INSERT [dbo].[Users] ([id], [Login], [Password], [UsersTypesID]) VALUES (5, N'Admin', N'Admin', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersTypes] ON 

INSERT [dbo].[UsersTypes] ([id], [Name]) VALUES (1, N'Учитель   ')
INSERT [dbo].[UsersTypes] ([id], [Name]) VALUES (2, N'Администратор')
SET IDENTITY_INSERT [dbo].[UsersTypes] OFF
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Subjects] FOREIGN KEY([SubjectsID])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Subjects]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Teachers] FOREIGN KEY([LeaderID])
REFERENCES [dbo].[Teachers] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Teachers]
GO
ALTER TABLE [dbo].[CoursesSchedules]  WITH CHECK ADD  CONSTRAINT [FK_CoursesSchedules_DaysOfWeek] FOREIGN KEY([DayOfWeekID])
REFERENCES [dbo].[DaysOfWeek] ([id])
GO
ALTER TABLE [dbo].[CoursesSchedules] CHECK CONSTRAINT [FK_CoursesSchedules_DaysOfWeek]
GO
ALTER TABLE [dbo].[CoursesSchedules]  WITH CHECK ADD  CONSTRAINT [FK_CoursesSchedules_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([id])
GO
ALTER TABLE [dbo].[CoursesSchedules] CHECK CONSTRAINT [FK_CoursesSchedules_Group]
GO
ALTER TABLE [dbo].[CoursesSchedules]  WITH CHECK ADD  CONSTRAINT [FK_CoursesSchedules_Subjects] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[CoursesSchedules] CHECK CONSTRAINT [FK_CoursesSchedules_Subjects]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Subjects] FOREIGN KEY([SubjectsID])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Subjects]
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD  CONSTRAINT [FK_Teachers_Users] FOREIGN KEY([UsersID])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Teachers] CHECK CONSTRAINT [FK_Teachers_Users]
GO
ALTER TABLE [dbo].[TeachersAndCourses]  WITH CHECK ADD  CONSTRAINT [FK_TeachersAndCourses_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([id])
GO
ALTER TABLE [dbo].[TeachersAndCourses] CHECK CONSTRAINT [FK_TeachersAndCourses_Courses]
GO
ALTER TABLE [dbo].[TeachersAndCourses]  WITH CHECK ADD  CONSTRAINT [FK_TeachersAndCourses_Teachers] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([id])
GO
ALTER TABLE [dbo].[TeachersAndCourses] CHECK CONSTRAINT [FK_TeachersAndCourses_Teachers]
GO
ALTER TABLE [dbo].[TeachersAndGroups]  WITH CHECK ADD  CONSTRAINT [FK_TeachersAndGroups_Group] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Group] ([id])
GO
ALTER TABLE [dbo].[TeachersAndGroups] CHECK CONSTRAINT [FK_TeachersAndGroups_Group]
GO
ALTER TABLE [dbo].[TeachersAndGroups]  WITH CHECK ADD  CONSTRAINT [FK_TeachersAndGroups_Teachers] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teachers] ([id])
GO
ALTER TABLE [dbo].[TeachersAndGroups] CHECK CONSTRAINT [FK_TeachersAndGroups_Teachers]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UsersTypes] FOREIGN KEY([UsersTypesID])
REFERENCES [dbo].[UsersTypes] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UsersTypes]
GO
USE [master]
GO
ALTER DATABASE [CaseQual] SET  READ_WRITE 
GO
