USE [master]
GO
/****** Object:  Database [gestion_des_produits]    Script Date: 02/25/2021 00:20:32 ******/
CREATE DATABASE [gestion_des_produits] ON  PRIMARY 
( NAME = N'gestion_des_produits', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\gestion_des_produits.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'gestion_des_produits_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\gestion_des_produits_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [gestion_des_produits] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [gestion_des_produits].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [gestion_des_produits] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [gestion_des_produits] SET ANSI_NULLS OFF
GO
ALTER DATABASE [gestion_des_produits] SET ANSI_PADDING OFF
GO
ALTER DATABASE [gestion_des_produits] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [gestion_des_produits] SET ARITHABORT OFF
GO
ALTER DATABASE [gestion_des_produits] SET AUTO_CLOSE ON
GO
ALTER DATABASE [gestion_des_produits] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [gestion_des_produits] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [gestion_des_produits] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [gestion_des_produits] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [gestion_des_produits] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [gestion_des_produits] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [gestion_des_produits] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [gestion_des_produits] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [gestion_des_produits] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [gestion_des_produits] SET  ENABLE_BROKER
GO
ALTER DATABASE [gestion_des_produits] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [gestion_des_produits] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [gestion_des_produits] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [gestion_des_produits] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [gestion_des_produits] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [gestion_des_produits] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [gestion_des_produits] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [gestion_des_produits] SET  READ_WRITE
GO
ALTER DATABASE [gestion_des_produits] SET RECOVERY SIMPLE
GO
ALTER DATABASE [gestion_des_produits] SET  MULTI_USER
GO
ALTER DATABASE [gestion_des_produits] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [gestion_des_produits] SET DB_CHAINING OFF
GO
USE [gestion_des_produits]
GO
/****** Object:  Table [dbo].[Fournisseur]    Script Date: 02/25/2021 00:20:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fournisseur](
	[NumFournisseur] [int] IDENTITY(1,1) NOT NULL,
	[nameFournisseur] [varchar](100) NULL,
	[TelFournisseur] [varchar](50) NULL,
	[AddressFournisseur] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NumFournisseur] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Vendeur]    Script Date: 02/25/2021 00:20:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Vendeur](
	[NumVendeur] [int] IDENTITY(1,1) NOT NULL,
	[nameVendeur] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[NumVendeur] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reparation]    Script Date: 02/25/2021 00:20:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reparation](
	[Num_Reparation] [int] IDENTITY(1,1) NOT NULL,
	[Titre_Reparation] [varchar](100) NULL,
	[Prix] [int] NULL,
	[Date_Reparation] [date] NULL,
	[Telephone_Client] [varchar](10) NULL,
	[Commenter] [text] NULL,
	[payment] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Num_Reparation] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Produit]    Script Date: 02/25/2021 00:20:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Produit](
	[NumProduit] [int] IDENTITY(1,1) NOT NULL,
	[NumFournisseur] [int] NOT NULL,
	[nameProduit] [varchar](50) NOT NULL,
	[quantité] [int] NULL,
	[TypeProduit] [varchar](30) NULL,
	[prix_Fournisseur] [float] NULL,
	[prix_achat] [float] NULL,
	[DateCommande] [date] NULL,
	[payment] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NumProduit] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [check_nameProduit] UNIQUE NONCLUSTERED 
(
	[nameProduit] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Achate]    Script Date: 02/25/2021 00:20:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achate](
	[NumAchate] [int] IDENTITY(1,1) NOT NULL,
	[NumProduit] [int] NOT NULL,
	[NumVendeur] [int] NOT NULL,
	[quantitéProduit] [int] NULL,
	[dateAchate] [date] NULL,
	[commenter] [text] NULL,
	[prixAchate] [int] NULL,
	[payment] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NumAchate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Default [DF__Reparatio__payme__32E0915F]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Reparation] ADD  DEFAULT ((0)) FOR [payment]
GO
/****** Object:  Default [DF__Produit__DateCom__29572725]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Produit] ADD  DEFAULT (getdate()) FOR [DateCommande]
GO
/****** Object:  Default [DF__Produit__payment__31EC6D26]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Produit] ADD  DEFAULT ((0)) FOR [payment]
GO
/****** Object:  Default [DF__Achate__quantité__173876EA]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Achate] ADD  DEFAULT ((1)) FOR [quantitéProduit]
GO
/****** Object:  Default [DF__Achate__dateAcha__182C9B23]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Achate] ADD  DEFAULT (getdate()) FOR [dateAchate]
GO
/****** Object:  Default [DF__Achate__payment__30F848ED]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Achate] ADD  DEFAULT ((1)) FOR [payment]
GO
/****** Object:  Check [CK__Reparation__Prix__2E1BDC42]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Reparation]  WITH CHECK ADD CHECK  (([prix]>=(0)))
GO
/****** Object:  Check [CK__Produit__prix_ac__108B795B]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Produit]  WITH CHECK ADD CHECK  (([prix_achat]>=(0)))
GO
/****** Object:  Check [CK__Produit__prix_Fo__0F975522]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Produit]  WITH CHECK ADD CHECK  (([prix_Fournisseur]>=(0)))
GO
/****** Object:  Check [CK__Produit__quantit__0EA330E9]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Produit]  WITH CHECK ADD CHECK  (([quantité]>=(0)))
GO
/****** Object:  Check [check_prixAchate]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Achate]  WITH CHECK ADD  CONSTRAINT [check_prixAchate] CHECK  (([prixAchate]>=(0)))
GO
ALTER TABLE [dbo].[Achate] CHECK CONSTRAINT [check_prixAchate]
GO
/****** Object:  ForeignKey [FK__Produit__NumFour__0DAF0CB0]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Produit]  WITH CHECK ADD FOREIGN KEY([NumFournisseur])
REFERENCES [dbo].[Fournisseur] ([NumFournisseur])
GO
/****** Object:  ForeignKey [FK__Achate__NumProdu__15502E78]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Achate]  WITH CHECK ADD FOREIGN KEY([NumProduit])
REFERENCES [dbo].[Produit] ([NumProduit])
GO
/****** Object:  ForeignKey [FK__Achate__NumVende__164452B1]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Achate]  WITH CHECK ADD FOREIGN KEY([NumVendeur])
REFERENCES [dbo].[Vendeur] ([NumVendeur])
GO
/****** Object:  ForeignKey [NumProduit_foreign]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Achate]  WITH CHECK ADD  CONSTRAINT [NumProduit_foreign] FOREIGN KEY([NumProduit])
REFERENCES [dbo].[Produit] ([NumProduit])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Achate] CHECK CONSTRAINT [NumProduit_foreign]
GO
/****** Object:  ForeignKey [NumVendeur_foreign]    Script Date: 02/25/2021 00:20:33 ******/
ALTER TABLE [dbo].[Achate]  WITH CHECK ADD  CONSTRAINT [NumVendeur_foreign] FOREIGN KEY([NumVendeur])
REFERENCES [dbo].[Vendeur] ([NumVendeur])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Achate] CHECK CONSTRAINT [NumVendeur_foreign]
GO
