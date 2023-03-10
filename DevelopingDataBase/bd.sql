USE [master]
GO
/****** Object:  Database [Online_shop]    Script Date: 10.03.2023 11:46:14 ******/
CREATE DATABASE [Online_shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Online_shop', FILENAME = N'C:\Users\user\Online_shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Online_shop_log', FILENAME = N'C:\Users\user\Online_shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Online_shop] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Online_shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Online_shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Online_shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Online_shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Online_shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Online_shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Online_shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Online_shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Online_shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Online_shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Online_shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Online_shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Online_shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Online_shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Online_shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Online_shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Online_shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Online_shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Online_shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Online_shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Online_shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Online_shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Online_shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Online_shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Online_shop] SET  MULTI_USER 
GO
ALTER DATABASE [Online_shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Online_shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Online_shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Online_shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Online_shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Online_shop] SET QUERY_STORE = OFF
GO
USE [Online_shop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Online_shop]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 10.03.2023 11:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id_cart] [int] NOT NULL,
	[Id_user] [int] NOT NULL,
	[Id_prod] [int] NOT NULL,
	[Prod_count] [int] NOT NULL,
	[Is_deleted] [bit] NOT NULL,
	[Cart_date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_cart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10.03.2023 11:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id_category] [int] NOT NULL,
	[Name_category] [nvarchar](50) NULL,
	[Id_specification] [int] NOT NULL,
	[Is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10.03.2023 11:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id_order] [int] NOT NULL,
	[Id_user] [int] NOT NULL,
	[Id_prod] [int] NOT NULL,
	[Id_status] [int] NOT NULL,
	[Order_date] [date] NOT NULL,
	[Prod_count] [int] NOT NULL,
	[Is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_Status]    Script Date: 10.03.2023 11:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_Status](
	[Id_status] [int] NOT NULL,
	[Orders_status] [nvarchar](40) NOT NULL,
	[Is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10.03.2023 11:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id_prod] [int] NOT NULL,
	[Prod_count] [int] NOT NULL,
	[Price] [decimal](18, 10) NULL,
	[Prod_description] [nvarchar](100) NULL,
	[Id_category] [int] NOT NULL,
	[Is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Spec_products]    Script Date: 10.03.2023 11:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spec_products](
	[Id_spec_product] [int] NOT NULL,
	[Id_prod] [int] NOT NULL,
	[Id_specification] [int] NOT NULL,
	[Spec_value] [int] NOT NULL,
	[Is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_spec_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specifications]    Script Date: 10.03.2023 11:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specifications](
	[Id_specification] [int] NOT NULL,
	[Name_spec] [nvarchar](50) NULL,
	[Spec_value] [int] NOT NULL,
	[Is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_specification] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10.03.2023 11:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id_user] [int] NOT NULL,
	[User_Login] [nvarchar](40) NOT NULL,
	[User_password] [nvarchar](40) NOT NULL,
	[Reg_date] [date] NOT NULL,
	[Is_deleted] [bit] NOT NULL,
	[Id_role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users_roles]    Script Date: 10.03.2023 11:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users_roles](
	[Id_role] [int] NOT NULL,
	[Name_role] [nvarchar](40) NOT NULL,
	[Is_deleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([Id_prod])
REFERENCES [dbo].[Products] ([Id_prod])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users] FOREIGN KEY([Id_user])
REFERENCES [dbo].[Users] ([Id_user])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Specifications] FOREIGN KEY([Id_specification])
REFERENCES [dbo].[Specifications] ([Id_specification])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Specifications]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Orders_Status] FOREIGN KEY([Id_status])
REFERENCES [dbo].[Orders_Status] ([Id_status])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Orders_Status]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([Id_prod])
REFERENCES [dbo].[Products] ([Id_prod])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([Id_user])
REFERENCES [dbo].[Users] ([Id_user])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([Id_category])
REFERENCES [dbo].[Categories] ([Id_category])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Spec_products]  WITH CHECK ADD  CONSTRAINT [FK_Spec_products_Products] FOREIGN KEY([Id_prod])
REFERENCES [dbo].[Products] ([Id_prod])
GO
ALTER TABLE [dbo].[Spec_products] CHECK CONSTRAINT [FK_Spec_products_Products]
GO
ALTER TABLE [dbo].[Spec_products]  WITH CHECK ADD  CONSTRAINT [FK_Spec_products_Specifications] FOREIGN KEY([Id_specification])
REFERENCES [dbo].[Specifications] ([Id_specification])
GO
ALTER TABLE [dbo].[Spec_products] CHECK CONSTRAINT [FK_Spec_products_Specifications]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users_roles] FOREIGN KEY([Id_role])
REFERENCES [dbo].[Users_roles] ([Id_role])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users_roles]
GO
USE [master]
GO
ALTER DATABASE [Online_shop] SET  READ_WRITE 
GO
