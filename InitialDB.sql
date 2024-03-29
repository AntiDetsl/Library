USE [master]
GO
/****** Object:  Database [LibraryDB]    Script Date: 17.08.2022 15:41:11 ******/
CREATE DATABASE [LibraryDB]
 CONTAINMENT = NONE

ALTER DATABASE [LibraryDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryDB] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryDB] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryDB', N'ON'
GO
ALTER DATABASE [LibraryDB] SET QUERY_STORE = OFF
GO
USE [LibraryDB]
GO
/****** Object:  Table [dbo].[Actions]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actions](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[ID] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[SecondName] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Pages] [int] NOT NULL,
	[PublicationYear] [int] NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[City] [nvarchar](200) NOT NULL,
	[Publisher] [nvarchar](300) NOT NULL,
	[ISBN] [nvarchar](20) NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[ID] [uniqueidentifier] NOT NULL,
	[Date] [datetime] NOT NULL,
	[Operation] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[User] [nvarchar](200) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Newspapers]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Newspapers](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Pages] [int] NOT NULL,
	[PublicationYear] [int] NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[City] [nvarchar](200) NOT NULL,
	[Publisher] [nvarchar](300) NOT NULL,
	[IssueDate] [date] NOT NULL,
	[IssueNumber] [nvarchar](200) NULL,
	[ISSN] [nvarchar](14) NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patents]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patents](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](300) NOT NULL,
	[Pages] [int] NOT NULL,
	[PublicationDate] [date] NOT NULL,
	[Description] [nvarchar](2000) NULL,
	[Country] [nvarchar](200) NOT NULL,
	[RegistrationNumber] [nvarchar](9) NOT NULL,
	[ApplicationDate] [date] NOT NULL,
	[IsDeleted] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionTable]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionTable](
	[RoleID] [uniqueidentifier] NOT NULL,
	[ActionID] [uniqueidentifier] NOT NULL,
	[Allowed] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StorageItemAuthors]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StorageItemAuthors](
	[StorageItemID] [uniqueidentifier] NOT NULL,
	[AuthorID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserID] [uniqueidentifier] NOT NULL,
	[RoleID] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](320) NOT NULL,
	[Password] [varbinary](512) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Actions] ([ID], [Name]) VALUES (N'7a3e3703-69ee-42f3-8f85-27122ce7bea3', N'Delete')
INSERT [dbo].[Actions] ([ID], [Name]) VALUES (N'18ff1fb8-5150-48ed-beca-482941f9d552', N'Add')
INSERT [dbo].[Actions] ([ID], [Name]) VALUES (N'cb60c949-d0be-47c8-b54b-bc45eed07542', N'GetAll')
GO
INSERT [dbo].[Authors] ([ID], [FirstName], [SecondName]) VALUES (N'ae96d55a-ee7f-4061-b3de-13dd47e32bda', N'Howard', N'Snyder')
INSERT [dbo].[Authors] ([ID], [FirstName], [SecondName]) VALUES (N'adc54f2f-7709-40da-be58-172028986ef6', N'Yang', N'Wang')
INSERT [dbo].[Authors] ([ID], [FirstName], [SecondName]) VALUES (N'b1cb011a-06a2-4498-89c7-208c75b30aae', N'Elizabeth', N'Lincoln')
INSERT [dbo].[Authors] ([ID], [FirstName], [SecondName]) VALUES (N'359b6767-4147-4eb2-8d50-5e148a3dc98d', N'Pedro', N'Afonso')
INSERT [dbo].[Authors] ([ID], [FirstName], [SecondName]) VALUES (N'e56085ec-d12e-4358-b56e-5ff2a609b042', N'Manuel', N'Pereira')
INSERT [dbo].[Authors] ([ID], [FirstName], [SecondName]) VALUES (N'ac50b1ad-4917-492c-9130-8396f8c26794', N'Giovanni', N'Rovelli')
INSERT [dbo].[Authors] ([ID], [FirstName], [SecondName]) VALUES (N'ca6736f1-59f8-4ef8-b2f9-8bf6fbf93444', N'Antonio', N'Moreno')
INSERT [dbo].[Authors] ([ID], [FirstName], [SecondName]) VALUES (N'54fbb054-9b4c-498e-98e5-cc6ca3046608', N'Maria', N'Anders')
INSERT [dbo].[Authors] ([ID], [FirstName], [SecondName]) VALUES (N'85108e1b-6d9f-48ac-9d5f-eb1af34381d4', N'Thomas', N'Hardy')
GO
INSERT [dbo].[Books] ([ID], [Name], [Pages], [PublicationYear], [Description], [City], [Publisher], [ISBN], [IsDeleted]) VALUES (N'b8d28845-f577-49d6-8dfd-24ed108bb462', N'Serpent Of My Imagination', 356, 2000, N'', N'Warsaw', N'Blizzard', N'91-678-6343-3', 0)
INSERT [dbo].[Books] ([ID], [Name], [Pages], [PublicationYear], [Description], [City], [Publisher], [ISBN], [IsDeleted]) VALUES (N'b5c1ac4a-b958-4d92-b9ff-ffb7006d547c', N'Guardian Of The Curse', 459, 1598, N'', N'Azeroth', N'Red', N'', 0)
INSERT [dbo].[Books] ([ID], [Name], [Pages], [PublicationYear], [Description], [City], [Publisher], [ISBN], [IsDeleted]) VALUES (N'5e6f2197-0801-4fb9-8da8-a4de3e7db654', N'Friends And Blacksmiths', 344, 2016, N'', N'Moskow', N'Moskow books', N'', 0)
INSERT [dbo].[Books] ([ID], [Name], [Pages], [PublicationYear], [Description], [City], [Publisher], [ISBN], [IsDeleted]) VALUES (N'8b67976e-7b83-46ae-b3e7-12f6e98416b1', N'Kaneki Ken And Trees', 15, 1635, N'', N'Tokio', N'Tokio ghoul', N'', 0)
GO
INSERT [dbo].[Newspapers] ([ID], [Name], [Pages], [PublicationYear], [Description], [City], [Publisher], [IssueDate], [IssueNumber], [ISSN], [IsDeleted]) VALUES (N'39c7a5ef-3936-4579-ac6e-58a89d05aa6c', N'The Independent Journal', 20, 2000, N'', N'Saratov', N'Saratov print', CAST(N'2000-12-13' AS Date), N'1', N'2323-4352', 0)
INSERT [dbo].[Newspapers] ([ID], [Name], [Pages], [PublicationYear], [Description], [City], [Publisher], [IssueDate], [IssueNumber], [ISSN], [IsDeleted]) VALUES (N'f10931ac-5875-4eb9-b76a-c49763aede7c', N'The Today''s Telegram', 45, 1678, N'', N'Warsaw', N'Weekly Advocate', CAST(N'1678-03-15' AS Date), N'1', N'2553-4356', 0)
GO
INSERT [dbo].[Patents] ([ID], [Name], [Pages], [PublicationDate], [Description], [Country], [RegistrationNumber], [ApplicationDate], [IsDeleted]) VALUES (N'b9f4e6eb-280c-4f30-80e2-c861b29a35c9', N'Car sharing system', 50, CAST(N'1980-08-19' AS Date), N'', N'Australia', N'1024251', CAST(N'1960-07-12' AS Date), 0)
INSERT [dbo].[Patents] ([ID], [Name], [Pages], [PublicationDate], [Description], [Country], [RegistrationNumber], [ApplicationDate], [IsDeleted]) VALUES (N'fed4a587-9c14-4aff-8a43-3a22b8e2300e', N'Collapsible kick-scooter vehicle', 145, CAST(N'1899-04-04' AS Date), N'', N'Hungary', N'14235465', CAST(N'1700-02-12' AS Date), 0)
GO
INSERT [dbo].[PermissionTable] ([RoleID], [ActionID], [Allowed]) VALUES (N'b89993ef-f62b-40c6-adbe-93ccb71f75e1', N'7a3e3703-69ee-42f3-8f85-27122ce7bea3', 0)
INSERT [dbo].[PermissionTable] ([RoleID], [ActionID], [Allowed]) VALUES (N'b89993ef-f62b-40c6-adbe-93ccb71f75e1', N'cb60c949-d0be-47c8-b54b-bc45eed07542', 1)
INSERT [dbo].[PermissionTable] ([RoleID], [ActionID], [Allowed]) VALUES (N'b89993ef-f62b-40c6-adbe-93ccb71f75e1', N'18ff1fb8-5150-48ed-beca-482941f9d552', 0)
INSERT [dbo].[PermissionTable] ([RoleID], [ActionID], [Allowed]) VALUES (N'6d3318a7-fee5-4a41-89b6-9ca28e0170cc', N'18ff1fb8-5150-48ed-beca-482941f9d552', 1)
INSERT [dbo].[PermissionTable] ([RoleID], [ActionID], [Allowed]) VALUES (N'6d3318a7-fee5-4a41-89b6-9ca28e0170cc', N'cb60c949-d0be-47c8-b54b-bc45eed07542', 1)
INSERT [dbo].[PermissionTable] ([RoleID], [ActionID], [Allowed]) VALUES (N'6d3318a7-fee5-4a41-89b6-9ca28e0170cc', N'7a3e3703-69ee-42f3-8f85-27122ce7bea3', 0)
INSERT [dbo].[PermissionTable] ([RoleID], [ActionID], [Allowed]) VALUES (N'd2d07ffc-f5c1-4b9f-a8fc-fdede5f8e1d1', N'7a3e3703-69ee-42f3-8f85-27122ce7bea3', 1)
INSERT [dbo].[PermissionTable] ([RoleID], [ActionID], [Allowed]) VALUES (N'd2d07ffc-f5c1-4b9f-a8fc-fdede5f8e1d1', N'18ff1fb8-5150-48ed-beca-482941f9d552', 1)
INSERT [dbo].[PermissionTable] ([RoleID], [ActionID], [Allowed]) VALUES (N'd2d07ffc-f5c1-4b9f-a8fc-fdede5f8e1d1', N'cb60c949-d0be-47c8-b54b-bc45eed07542', 1)
GO
INSERT [dbo].[Roles] ([ID], [Name]) VALUES (N'b89993ef-f62b-40c6-adbe-93ccb71f75e1', N'User')
INSERT [dbo].[Roles] ([ID], [Name]) VALUES (N'6d3318a7-fee5-4a41-89b6-9ca28e0170cc', N'Librarian')
INSERT [dbo].[Roles] ([ID], [Name]) VALUES (N'd2d07ffc-f5c1-4b9f-a8fc-fdede5f8e1d1', N'Admin')
GO
INSERT [dbo].[StorageItemAuthors] ([StorageItemID], [AuthorID]) VALUES (N'b8d28845-f577-49d6-8dfd-24ed108bb462', N'adc54f2f-7709-40da-be58-172028986ef6')
INSERT [dbo].[StorageItemAuthors] ([StorageItemID], [AuthorID]) VALUES (N'b8d28845-f577-49d6-8dfd-24ed108bb462', N'ca6736f1-59f8-4ef8-b2f9-8bf6fbf93444')
INSERT [dbo].[StorageItemAuthors] ([StorageItemID], [AuthorID]) VALUES (N'5e6f2197-0801-4fb9-8da8-a4de3e7db654', N'e56085ec-d12e-4358-b56e-5ff2a609b042')
INSERT [dbo].[StorageItemAuthors] ([StorageItemID], [AuthorID]) VALUES (N'5e6f2197-0801-4fb9-8da8-a4de3e7db654', N'85108e1b-6d9f-48ac-9d5f-eb1af34381d4')
INSERT [dbo].[StorageItemAuthors] ([StorageItemID], [AuthorID]) VALUES (N'8b67976e-7b83-46ae-b3e7-12f6e98416b1', N'b1cb011a-06a2-4498-89c7-208c75b30aae')
INSERT [dbo].[StorageItemAuthors] ([StorageItemID], [AuthorID]) VALUES (N'8b67976e-7b83-46ae-b3e7-12f6e98416b1', N'ac50b1ad-4917-492c-9130-8396f8c26794')
INSERT [dbo].[StorageItemAuthors] ([StorageItemID], [AuthorID]) VALUES (N'b9f4e6eb-280c-4f30-80e2-c861b29a35c9', N'359b6767-4147-4eb2-8d50-5e148a3dc98d')
INSERT [dbo].[StorageItemAuthors] ([StorageItemID], [AuthorID]) VALUES (N'b5c1ac4a-b958-4d92-b9ff-ffb7006d547c', N'ae96d55a-ee7f-4061-b3de-13dd47e32bda')
INSERT [dbo].[StorageItemAuthors] ([StorageItemID], [AuthorID]) VALUES (N'fed4a587-9c14-4aff-8a43-3a22b8e2300e', N'ae96d55a-ee7f-4061-b3de-13dd47e32bda')
INSERT [dbo].[StorageItemAuthors] ([StorageItemID], [AuthorID]) VALUES (N'fed4a587-9c14-4aff-8a43-3a22b8e2300e', N'e56085ec-d12e-4358-b56e-5ff2a609b042')
INSERT [dbo].[StorageItemAuthors] ([StorageItemID], [AuthorID]) VALUES (N'fed4a587-9c14-4aff-8a43-3a22b8e2300e', N'54fbb054-9b4c-498e-98e5-cc6ca3046608')
GO
INSERT [dbo].[UserRoles] ([UserID], [RoleID]) VALUES (N'd91a26e5-23e8-44ea-bd5d-53ec2ce222ad', N'b89993ef-f62b-40c6-adbe-93ccb71f75e1')
GO
INSERT [dbo].[Users] ([ID], [Name], [Email], [Password]) VALUES (N'd91a26e5-23e8-44ea-bd5d-53ec2ce222ad', N'user', N'user@gmail.com', 0xBD4B39B37C13A3ECA646D9BAC11E7D3A3D167E0E3B8F7A88A467AB55032EA52BBE626844BFBB2E9CECB9E00483DD6D9216042EF19E620F121FE6D6FC6E17889F)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Users]    Script Date: 17.08.2022 15:41:11 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [AK_Users] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PermissionTable]  WITH CHECK ADD  CONSTRAINT [FK_PermissionTable_Actions] FOREIGN KEY([ActionID])
REFERENCES [dbo].[Actions] ([ID])
GO
ALTER TABLE [dbo].[PermissionTable] CHECK CONSTRAINT [FK_PermissionTable_Actions]
GO
ALTER TABLE [dbo].[PermissionTable]  WITH CHECK ADD  CONSTRAINT [FK_PermissionTable_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[PermissionTable] CHECK CONSTRAINT [FK_PermissionTable_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
/****** Object:  StoredProcedure [dbo].[AddAuthor]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddAuthor]
	@FirstName nvarchar(50),
	@SecondName nvarchar(300),
	@ID uniqueidentifier OUTPUT
	
AS
BEGIN
	SET @ID = NEWID();

	BEGIN TRAN
		INSERT INTO Authors([ID], [FirstName], [SecondName])
		VALUES(@ID, @FirstName, @SecondName)
		
		IF (SELECT COUNT(*) FROM Authors WHERE FirstName = @FirstName AND SecondName = @SecondName) > 1
			ROLLBACK
		ELSE
			COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[AddAuthorToItem]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddAuthorToItem]
	@ItemID uniqueidentifier,
	@AuthorID uniqueidentifier
AS
BEGIN
	BEGIN TRAN
		INSERT INTO StorageItemAuthors([StorageItemID], [AuthorID])
		VALUES(@ItemID, @AuthorID)

		IF (SELECT COUNT(*) FROM StorageItemAuthors as s WHERE s.StorageItemID = @ItemID 
		AND s.AuthorID = @AuthorID) > 1
			ROLLBACK
		ELSE
			COMMIT
END
GO
/****** Object:  StoredProcedure [dbo].[AddBook]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddBook]
	@Name nvarchar(300),
	@Pages int,
	@PublicationYear int,
	@Description nvarchar(2000),
	@City nvarchar(200),
	@Publisher nvarchar(300),
	@ISBN nvarchar(17),
	@ID uniqueidentifier OUTPUT
AS
BEGIN

	SET @ID = NEWID();

	INSERT INTO Books([ID], [Name], [Pages], [PublicationYear], [Description]
	, [City], [Publisher], [ISBN], [IsDeleted])
	VALUES(@ID, @Name, @Pages, @PublicationYear, @Description
	, @City, @Publisher, @ISBN, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[AddNewspaper]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddNewspaper]
	@Name nvarchar(300),
	@Pages int,
	@PublicationYear int,
	@Description nvarchar(2000),
	@City nvarchar(200),
	@Publisher nvarchar(300),
	@IssueDate date,
	@IssueNumber nvarchar(200),
	@ISSN nvarchar(14),
	@ID uniqueidentifier OUTPUT
AS
BEGIN

	SET @ID = NEWID();

	INSERT INTO Newspapers([ID], [Name], [Pages], [PublicationYear]
	, [Description], [City], [Publisher], [IssueDate], [IssueNumber], [ISSN], [IsDeleted])
	VALUES(@ID, @Name, @Pages, @PublicationYear
	, @Description, @City, @Publisher, @IssueDate, @IssueNumber, @ISSN, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[AddPatent]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddPatent]
	@Name nvarchar(300),
	@Pages int,
	@PublicationDate date,
	@Description nvarchar(2000),
	@Country nvarchar(200),
	@RegistrationNumber nvarchar(9),
	@ApplicationDate date,
	@ID uniqueidentifier OUTPUT
AS
BEGIN

	SET @ID = NEWID();

	INSERT INTO Patents([ID], [Name], [Pages], [PublicationDate], [Description]
	, [Country], [RegistrationNumber], [ApplicationDate], [IsDeleted])
	VALUES(@ID, @Name, @Pages, @PublicationDate, @Description
	, @Country, @RegistrationNumber, @ApplicationDate, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[AddRoleToUser]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddRoleToUser]
	@UserID uniqueidentifier,
	@RoleName nvarchar(200)
AS
BEGIN
	DECLARE @RoleID uniqueidentifier;

	SELECT @RoleID = [ID] 
	FROM [Roles]
	WHERE [Name] = @RoleName

	if @RoleID is not NULL
	BEGIN
		INSERT INTO [UserRoles]([UserID], [RoleID])
		VALUES(@UserID, @RoleID)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddUser]
	@Name nvarchar(200),
	@Email nvarchar(255),
	@Password varbinary(512),
	@ID uniqueidentifier OUTPUT

AS
BEGIN
	SET @ID = NEWID();

	INSERT INTO [Users]([ID], [Name], [Email], [Password])
	VALUES(@ID, @Name, @Email, @Password)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteBookByID]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBookByID]
	@ID uniqueidentifier
AS
BEGIN
	
DELETE FROM Books WHERE [ID] = @ID;

END
GO
/****** Object:  StoredProcedure [dbo].[DeleteNewspaperByID]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteNewspaperByID]
	@ID uniqueidentifier
AS
BEGIN
	
DELETE FROM Newspapers WHERE [ID] = @ID;

END
GO
/****** Object:  StoredProcedure [dbo].[DeletePatentByID]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeletePatentByID]
	@ID uniqueidentifier
AS
BEGIN
	
DELETE FROM Patents WHERE [ID] = @ID;

END
GO
/****** Object:  StoredProcedure [dbo].[EditBook]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditBook]
	@ID uniqueidentifier,
	@Name nvarchar(300),
	@Pages int,
	@PublicationYear int,
	@Description nvarchar(2000),
	@City nvarchar(200),
	@Publisher nvarchar(300),
	@ISBN nvarchar(17)
AS
BEGIN

	UPDATE [Books] 
	SET [Name] = @Name, [Pages] = @Pages, [PublicationYear] = @PublicationYear, [Description] = @Description
	, [City] = @City, [Publisher] = @Publisher, [ISBN] = @ISBN
	WHERE [ID] = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[EditNewspaper]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditNewspaper]
	@ID uniqueidentifier,
	@Name nvarchar(300),
	@Pages int,
	@PublicationYear int,
	@Description nvarchar(2000),
	@City nvarchar(200),
	@Publisher nvarchar(300),
	@IssueDate date,
	@IssueNumber nvarchar(200),
	@ISSN nvarchar(14)
AS
BEGIN

	UPDATE [Newspapers]
	SET [Name] = @Name, [Pages] = @Pages, [PublicationYear] = @PublicationYear
	, [Description] = @Description, [City] = @City, [Publisher] = @Publisher, [IssueDate] = @IssueDate
	, [IssueNumber] = @IssueNumber, [ISSN] = @ISSN
	WHERE [ID] = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[EditPatent]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditPatent]
	@ID uniqueidentifier,
	@Name nvarchar(300),
	@Pages int,
	@PublicationDate date,
	@Description nvarchar(2000),
	@Country nvarchar(200),
	@RegistrationNumber nvarchar(9),
	@ApplicationDate date
AS
BEGIN

	UPDATE [Patents]
	SET [Name] = @Name, [Pages] = @Pages, [PublicationDate] = @PublicationDate, [Description] = @Description
	, [Country] = @Country, [RegistrationNumber] = @RegistrationNumber, [ApplicationDate] = @ApplicationDate
	WHERE [ID] = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[FindAuthor]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FindAuthor]
	@FirstName nvarchar(50),
	@SecondName nvarchar(200)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT a.ID
	FROM  Authors as a
	WHERE a.FirstName = @FirstName AND a.SecondName = @SecondName
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllAuthors]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllAuthors]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT a.FirstName, a.SecondName
	FROM Authors as a
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllBooks]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllBooks]
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT b.ID, b.[Name], b.City, b.Publisher, b.PublicationYear, b.ISBN, b.Pages, b.[Description]
	FROM Books as b
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllNewspapers]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllNewspapers]
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT  [ID]
      ,[Name]
      ,[Pages]
      ,[PublicationYear]
      ,[Description]
      ,[City]
      ,[Publisher]
      ,[IssueDate]
      ,[IssueNumber]
      ,[ISSN]
  FROM [LibraryDB].[dbo].[Newspapers]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllPatents]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllPatents]
AS
BEGIN
	
	SET NOCOUNT ON;

    SELECT [ID]
      ,[Name]
      ,[Pages]
      ,[PublicationDate]
      ,[Description]
      ,[Country]
      ,[RegistrationNumber]
      ,[ApplicationDate]
  FROM [LibraryDB].[dbo].[Patents]
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllUsers]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT u.[ID], u.[Name], u.[Email], u.[Password] 
	FROM [Users] as u
END
GO
/****** Object:  StoredProcedure [dbo].[GetAuthorsByItemID]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAuthorsByItemID]
	@ID uniqueidentifier
AS
BEGIN

	SET NOCOUNT ON;

	SELECT a.FirstName, a.SecondName
	FROM Authors as a
	JOIN StorageItemAuthors as s
	ON a.ID = s.AuthorID
	WHERE s.StorageItemID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[IsAllowed]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IsAllowed]
	@UserName nvarchar(200),
	@ActionName nvarchar(200),
	@IsAllowed bit OUTPUT
	
AS
BEGIN
	SET NOCOUNT ON
	
	IF 1 = ANY(SELECT pt.Allowed
	FROM UserRoles as ur
	JOIN Users as u
	ON u.ID = ur.UserID
	JOIN Roles as r
	ON r.ID = ur.RoleID
	JOIN PermissionTable as pt
	ON pt.RoleID = r.ID
	JOIN Actions as a
	ON a.ID = pt.ActionID
	WHERE u.[Name] = @UserName AND a.[Name] = @ActionName)
	BEGIN
		SET @IsAllowed = 1
	END
	ELSE
	BEGIN
		SET @IsAllowed = 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[MarkBookAsDeletedByID]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkBookAsDeletedByID]
	@ID uniqueidentifier
AS
BEGIN

UPDATE Books
SET [IsDeleted] = 1
WHERE [ID] = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[MarkNewspaperAsDeletedByID]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkNewspaperAsDeletedByID]
	@ID uniqueidentifier
AS
BEGIN

UPDATE Newspapers
SET [IsDeleted] = 1
WHERE [ID] = @ID

END
GO
/****** Object:  StoredProcedure [dbo].[MarkPatentAsDeletedByID]    Script Date: 17.08.2022 15:41:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MarkPatentAsDeletedByID]
	@ID uniqueidentifier
AS
BEGIN

UPDATE Patents
SET [IsDeleted] = 1
WHERE [ID] = @ID

END
GO
USE [master]
GO
ALTER DATABASE [LibraryDB] SET  READ_WRITE 
GO
