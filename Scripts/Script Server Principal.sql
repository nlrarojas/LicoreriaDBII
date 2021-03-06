USE [master]
GO
/****** Object:  Database [DB_Licoreria_Principal]    Script Date: 6/19/2018 10:35:29 PM ******/
CREATE DATABASE [DB_Licoreria_Principal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Licoreria_Principal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_Licoreria_Principal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Licoreria_Principal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DB_Licoreria_Principal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DB_Licoreria_Principal] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Licoreria_Principal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Licoreria_Principal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Licoreria_Principal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_Licoreria_Principal] SET QUERY_STORE = OFF
GO
USE [DB_Licoreria_Principal]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DB_Licoreria_Principal]
GO
/****** Object:  Table [dbo].[Combinacion]    Script Date: 6/19/2018 10:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combinacion](
	[IdCombinacion] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[descripcion] [varchar](200) NULL,
 CONSTRAINT [PK_Combinacion] PRIMARY KEY CLUSTERED 
(
	[IdCombinacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventarioDetalle]    Script Date: 6/19/2018 10:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventarioDetalle](
	[idInvDet] [int] NOT NULL,
	[IdInventario] [int] NOT NULL,
	[IdLicor] [int] NOT NULL,
	[cantidad] [int] NULL,
 CONSTRAINT [PK_InventarioDetalle] PRIMARY KEY CLUSTERED 
(
	[idInvDet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventarioDetalleSucursal]    Script Date: 6/19/2018 10:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventarioDetalleSucursal](
	[idInventario] [int] NOT NULL,
	[idSucursal] [int] NULL,
 CONSTRAINT [PK_InventarioDetalleSucursal] PRIMARY KEY CLUSTERED 
(
	[idInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Licor]    Script Date: 6/19/2018 10:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Licor](
	[idLicor] [int] IDENTITY(1,1) NOT NULL,
	[idTipoAnejado] [int] NULL,
	[idProcedencia] [int] NULL,
	[nombre] [nchar](20) NULL,
	[precio] [float] NULL,
	[annos] [int] NULL,
 CONSTRAINT [PK_Licor] PRIMARY KEY CLUSTERED 
(
	[idLicor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicorCombinacion]    Script Date: 6/19/2018 10:35:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicorCombinacion](
	[IdLicor] [int] NOT NULL,
	[idCombinacion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LicorFoto]    Script Date: 6/19/2018 10:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LicorFoto](
	[idLicorFoto] [int] IDENTITY(1,1) NOT NULL,
	[idLicor] [int] NULL,
	[foto] [varbinary](max) NULL,
 CONSTRAINT [PK_LicorFoto] PRIMARY KEY CLUSTERED 
(
	[idLicorFoto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Procedencia]    Script Date: 6/19/2018 10:35:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Procedencia](
	[idProcedencia] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Procedencia] PRIMARY KEY CLUSTERED 
(
	[idProcedencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 6/19/2018 10:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[idSucursal] [int] NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[ubicacion] [geometry] NULL,
	[direccion] [nvarchar](200) NULL,
	[horaApertura] [time](7) NULL,
	[horaCierre] [time](7) NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoAnejado]    Script Date: 6/19/2018 10:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoAnejado](
	[idTipoAnejado] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](200) NULL,
 CONSTRAINT [PK_TipoAnejado] PRIMARY KEY CLUSTERED 
(
	[idTipoAnejado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAdmin]    Script Date: 6/19/2018 10:35:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAdmin](
	[idUserAdmin] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCliente]    Script Date: 6/19/2018 10:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCliente](
	[idUserInfo] [int] NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellidos] [nvarchar](100) NULL,
	[fechaNacimiento] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserFactura]    Script Date: 6/19/2018 10:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFactura](
	[idUserInfo] [int] NULL,
	[foto] [image] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 6/19/2018 10:35:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[idUserInfo] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[password] [nvarchar](512) NULL,
	[sucursal] [int] NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[idUserInfo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InventarioDetalle]  WITH CHECK ADD  CONSTRAINT [FK_InventarioDetalle_InventarioDetalleSucursal] FOREIGN KEY([IdInventario])
REFERENCES [dbo].[InventarioDetalleSucursal] ([idInventario])
GO
ALTER TABLE [dbo].[InventarioDetalle] CHECK CONSTRAINT [FK_InventarioDetalle_InventarioDetalleSucursal]
GO
ALTER TABLE [dbo].[InventarioDetalle]  WITH CHECK ADD  CONSTRAINT [FK_InventarioDetalle_Licor] FOREIGN KEY([IdLicor])
REFERENCES [dbo].[Licor] ([idLicor])
GO
ALTER TABLE [dbo].[InventarioDetalle] CHECK CONSTRAINT [FK_InventarioDetalle_Licor]
GO
ALTER TABLE [dbo].[InventarioDetalleSucursal]  WITH CHECK ADD  CONSTRAINT [fk_inventario_sucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO
ALTER TABLE [dbo].[InventarioDetalleSucursal] CHECK CONSTRAINT [fk_inventario_sucursal]
GO
ALTER TABLE [dbo].[Licor]  WITH CHECK ADD  CONSTRAINT [fk_licor_tipo_anejado] FOREIGN KEY([idTipoAnejado])
REFERENCES [dbo].[TipoAnejado] ([idTipoAnejado])
GO
ALTER TABLE [dbo].[Licor] CHECK CONSTRAINT [fk_licor_tipo_anejado]
GO
ALTER TABLE [dbo].[Licor]  WITH CHECK ADD  CONSTRAINT [fk_procedencia_licor] FOREIGN KEY([idProcedencia])
REFERENCES [dbo].[Procedencia] ([idProcedencia])
GO
ALTER TABLE [dbo].[Licor] CHECK CONSTRAINT [fk_procedencia_licor]
GO
ALTER TABLE [dbo].[LicorCombinacion]  WITH CHECK ADD  CONSTRAINT [FK_LicorCombinacion_Combinacion] FOREIGN KEY([idCombinacion])
REFERENCES [dbo].[Combinacion] ([IdCombinacion])
GO
ALTER TABLE [dbo].[LicorCombinacion] CHECK CONSTRAINT [FK_LicorCombinacion_Combinacion]
GO
ALTER TABLE [dbo].[LicorCombinacion]  WITH CHECK ADD  CONSTRAINT [FK_LicorCombinacion_Licor] FOREIGN KEY([IdLicor])
REFERENCES [dbo].[Licor] ([idLicor])
GO
ALTER TABLE [dbo].[LicorCombinacion] CHECK CONSTRAINT [FK_LicorCombinacion_Licor]
GO
ALTER TABLE [dbo].[LicorFoto]  WITH CHECK ADD  CONSTRAINT [fk_licor_fotos] FOREIGN KEY([idLicor])
REFERENCES [dbo].[Licor] ([idLicor])
GO
ALTER TABLE [dbo].[LicorFoto] CHECK CONSTRAINT [fk_licor_fotos]
GO
ALTER TABLE [dbo].[UserAdmin]  WITH CHECK ADD  CONSTRAINT [fk_user_admin_user] FOREIGN KEY([idUserAdmin])
REFERENCES [dbo].[UserInfo] ([idUserInfo])
GO
ALTER TABLE [dbo].[UserAdmin] CHECK CONSTRAINT [fk_user_admin_user]
GO
ALTER TABLE [dbo].[UserCliente]  WITH CHECK ADD  CONSTRAINT [fk_user_cliente] FOREIGN KEY([idUserInfo])
REFERENCES [dbo].[UserInfo] ([idUserInfo])
GO
ALTER TABLE [dbo].[UserCliente] CHECK CONSTRAINT [fk_user_cliente]
GO
ALTER TABLE [dbo].[UserFactura]  WITH CHECK ADD  CONSTRAINT [fk_user_factura] FOREIGN KEY([idUserInfo])
REFERENCES [dbo].[UserInfo] ([idUserInfo])
GO
ALTER TABLE [dbo].[UserFactura] CHECK CONSTRAINT [fk_user_factura]
GO
/****** Object:  StoredProcedure [dbo].[addCombinacion]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addCombinacion]
@nombre varchar(50),
@descripcion varchar(200)

AS
BEGIN
	
	insert into Combinacion(nombre, descripcion)
	values (@nombre,@descripcion)

	
END
GO
/****** Object:  StoredProcedure [dbo].[addLicor]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addLicor]
@idTipoAnejado int,
@IdProcedencia int,
@nombre nchar(20),
@precio float,
@annos int

AS
BEGIN	
	DECLARE @idLicor int

	INSERT INTO Licor 
	VALUES (@idTipoAnejado, @IdProcedencia,
	@nombre,@precio, @annos)	

	SELECT @idLicor = SCOPE_IDENTITY();
	SELECT @idLicor AS idLicor;
END

GO
/****** Object:  StoredProcedure [dbo].[addLicorCombinacion]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addLicorCombinacion]
@idLicor int,
@idCombinacion int

AS
BEGIN
	
	insert into LicorCombinacion
	values (@idLicor,@idCombinacion)

	
END
GO
/****** Object:  StoredProcedure [dbo].[addLicorFoto]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addLicorFoto]
@idLicor int,
@foto varbinary(MAX)

AS
BEGIN
	
	insert into LicorFoto(idLicor, foto)
	values (@idLicor,@foto)
	
END
GO
/****** Object:  StoredProcedure [dbo].[addProcedencia]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addProcedencia]
@nombre nvarchar(50)

AS
BEGIN
	INSERT INTO Procedencia(nombre)
	VALUES (@nombre)

	SELECT 1 AS Response;
END
GO
/****** Object:  StoredProcedure [dbo].[addTipoAnejado]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addTipoAnejado] @desc nvarchar(200)
AS
BEGIN
	INSERT INTO TipoAnejado (descripcion) VALUES (@desc);
END
GO
/****** Object:  StoredProcedure [dbo].[addTipoAñejado]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addTipoAñejado]
@descripcion nvarchar(200)

AS
BEGIN
	
	insert into TipoAnejado(descripcion)
	values (@descripcion)
	
END
GO
/****** Object:  StoredProcedure [dbo].[addUserAdmin]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addUserAdmin]
	@userName nvarchar(50), 
	@password nvarchar(50), @sucursal INT
AS
BEGIN
	DECLARE @id INT;
	DECLARE @pass nvarchar(4000) = HASHBYTES('SHA1', CONVERT(nvarchar(4000), @password));  	
			
	SELECT @id = count(*) + 1 FROM UserInfo;

	INSERT INTO UserAdmin VALUES(@id);	

	INSERT INTO UserInfo
	VALUES (@userName, @pass, @sucursal);
	
	SELECT 1 AS Response;
END
GO
/****** Object:  StoredProcedure [dbo].[addUserCliente]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addUserCliente] 
@nombre nvarchar(50),
@apellidos nvarchar(100),
@fechaNacimiento date,
@username nvarchar(50),
@password nvarchar(512),
@sucursal int
AS
BEGIN
	DECLARE @id INT = NULL
	DECLARE @userExists INT

	DECLARE @pass nvarchar(4000) = HASHBYTES('SHA1', CONVERT(nvarchar(4000), @password));  	

	SET @userExists = (	select COUNT(ui.userName)
	from UserInfo ui
	where ui.userName = @username)

	SET NOCOUNT ON;
	if (@userExists = 0)
	BEGIN
		insert into UserInfo
		values (@username, @pass, @sucursal)
		SET @id = SCOPE_IDENTITY();

		insert into dbo.UserCliente
		values (@id, @nombre, @apellidos, 
		@fechaNacimiento)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[addUserFactura]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[addUserFactura]
	@foto image, @userName nvarchar(50), 
	@password nvarchar(50), @sucursal INT
AS
BEGIN
	DECLARE @id INT;
	DECLARE @pass nvarchar(4000) = HASHBYTES('SHA1', CONVERT(nvarchar(4000), @password));  	
			
	SELECT @id = count(*) + 1 FROM UserInfo;

	INSERT INTO UserInfo
	VALUES (@userName, @pass, @sucursal);
	
	INSERT INTO UserFactura VALUES(@id, @foto);	
	
	SELECT 1 AS Response;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteAnnejado]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteAnnejado] @id int
AS
BEGIN
	DELETE FROM TipoAnejado 	
	WHERE idTipoAnejado = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteProcedencia]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteProcedencia] @id int
AS
BEGIN
	DELETE FROM Procedencia 
	WHERE idProcedencia = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllFullNamesUserClients]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllFullNamesUserClients] 


AS
BEGIN
	

	SET NOCOUNT ON;

	select ui.userName, 
	uc.nombre + ' ' + uc.apellidos as 'Nombre completo'
	from UserCliente uc
	inner join UserInfo ui
	ON uc.idUserInfo = ui.idUserInfo

	

END
GO
/****** Object:  StoredProcedure [dbo].[getAllLicores]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllLicores]

AS
BEGIN
	SELECT l.idLicor, l.nombre as nombreLicor, ta.descripcion, p.nombre, l.annos, l.precio 
	FROM Licor l
	INNER JOIN TipoAnejado ta
	ON l.idTipoAnejado = ta.idTipoAnejado
	INNER JOIN Procedencia p
	ON l.idProcedencia = p.idProcedencia
END

GO
/****** Object:  StoredProcedure [dbo].[getAllUserClients]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllUserClients] 


AS
BEGIN
	

	SET NOCOUNT ON;

	select ui.idUserInfo, uc.nombre, uc.apellidos, uc.fechaNacimiento
	from UserCliente uc
	inner join UserInfo ui
	ON uc.idUserInfo = ui.idUserInfo

	

END
GO
/****** Object:  StoredProcedure [dbo].[getAnnejadoById]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAnnejadoById] @id int
AS
BEGIN
	SELECT * FROM TipoAnejado WHERE idTipoAnejado = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[getAnnejados]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAnnejados]
AS
BEGIN
	SELECT * FROM TipoAnejado;
END
GO
/****** Object:  StoredProcedure [dbo].[getDistanceByGeography]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getDistanceByGeography]
@source geography,
@target geography

AS
BEGIN
	
SELECT @source.STDistance(@target)
	
END
GO
/****** Object:  StoredProcedure [dbo].[getLicorById]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getLicorById]
@idLicor int

AS
BEGIN
	SELECT l.idLicor, l.nombre as nombreLicor, ta.descripcion, p.nombre, l.annos, l.precio 
	FROM Licor l
	INNER JOIN TipoAnejado ta
	ON l.idTipoAnejado = ta.idTipoAnejado
	INNER JOIN Procedencia p
	ON l.idProcedencia = p.idProcedencia
	WHERE l.idLicor = @idLicor;
END
GO
/****** Object:  StoredProcedure [dbo].[getProcedenciaById]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getProcedenciaById] @id int
AS
BEGIN
	SELECT * FROM Procedencia WHERE idProcedencia = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[getProcedencias]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getProcedencias]
AS
BEGIN
	SELECT * FROM Procedencia
END
GO
/****** Object:  StoredProcedure [dbo].[removeCombinacion]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeCombinacion]
@idCombinacion int

AS
BEGIN
	
	delete from Combinacion
	where IdCombinacion = @idCombinacion
	
END
GO
/****** Object:  StoredProcedure [dbo].[removeLicorById]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeLicorById]
@idLicor int

AS
BEGIN	

	DELETE FROM Licor
	WHERE idLicor = @idLicor
	
	SELECT @idLicor AS idLicor;
END
GO
/****** Object:  StoredProcedure [dbo].[removeLicorByName]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeLicorByName]
@nombre nchar(20)

AS
BEGIN
	
	delete from Licor
	where nombre = @nombre
	
END
GO
/****** Object:  StoredProcedure [dbo].[removeLicorCombinacion]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeLicorCombinacion]
@idLicor int,
@idCombinacion int

AS
BEGIN
	
	delete from LicorCombinacion
	where IdCombinacion = @idCombinacion
	and IdLicor = @idCombinacion
	
END
GO
/****** Object:  StoredProcedure [dbo].[removeLicorFoto]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeLicorFoto]
@idLicorFoto int

AS
BEGIN
	
	delete from LicorFoto
	where idLicorFoto = @idLicorFoto
	
END
GO
/****** Object:  StoredProcedure [dbo].[removeProcedencia]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeProcedencia]
@idProcedencia int

AS
BEGIN
	
	delete from Procedencia
	where Procedencia.idProcedencia = @idProcedencia
	
END
GO
/****** Object:  StoredProcedure [dbo].[removeTipoAñejado]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeTipoAñejado]
@idTipoAnejado int

AS
BEGIN
	
	delete from TipoAnejado
	where idTipoAnejado = @idTipoAnejado
	
END
GO
/****** Object:  StoredProcedure [dbo].[removeUserClient]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeUserClient]
@username nvarchar(50)

AS
BEGIN
	DECLARE @id INT = NULL

	SET NOCOUNT ON;

	(select @id = ui.idUserInfo
	from UserInfo ui
	where ui.userName = @username)

	delete from UserCliente
	where @id = UserCliente.idUserInfo

	delete from UserInfo
	where @username = UserInfo.userName
	--SET @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[searchLicoresByName]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[searchLicoresByName]
@nombre nvarchar(20)

AS
BEGIN
	
	select l.idLicor, p.nombre as 'Procedencia',
	ta.descripcion as 'TipoAnejado',
	l.annos, l.precio
	from Licor l
	inner join Procedencia p
	ON l.idProcedencia = p.idProcedencia
	inner join TipoAnejado ta
	ON l.idTipoAnejado = ta.idTipoAnejado
	where CHARINDEX(@nombre,l.nombre)>0
	
END
GO
/****** Object:  StoredProcedure [dbo].[searchLicoresBySucursal]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[searchLicoresBySucursal]
@idSucursal int,
@nombre nvarchar(50)

AS
BEGIN
	
	select l.idLicor, p.nombre as 'Procedencia',
	ta.descripcion as 'TipoAnejado',
	l.annos, l.precio
	from Licor l
	inner join Procedencia p
	ON l.idProcedencia = p.idProcedencia
	inner join TipoAnejado ta
	ON l.idTipoAnejado = ta.idTipoAnejado
	inner join InventarioDetalle id
	ON id.IdLicor = l.idLicor
	inner join InventarioDetalleSucursal ids
	ON ids.idInventario = id.IdInventario
	where CHARINDEX(@nombre, l.nombre) > 0 and
	ids.idSucursal = @idSucursal
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_get_user_role]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	el rol 1 es para los administradores, 2 para facturadores y el 3 es para los clientes
-- =============================================
CREATE PROCEDURE [dbo].[sp_get_user_role]
	@userName nvarchar(50), @password nvarchar(512)
AS
BEGIN
	DECLARE @pass nvarchar(4000);  
	SET @pass = HASHBYTES('SHA1', CONVERT(nvarchar(4000), @password));  	
	
	SELECT U.Role 
	FROM UserInfo UF INNER JOIN (
			SELECT idUserInfo, 3 AS Role 
			FROM UserCliente 
			UNION 
			SELECT idUserInfo, 2 AS Role
			FROM UserFactura
			UNION 
			SELECT idUserAdmin, 1 AS Role
			FROM UserAdmin) AS U ON U.idUserInfo = UF.idUserInfo 
	WHERE upper(userName) = upper(@userName) AND password = @pass
END



GO
/****** Object:  StoredProcedure [dbo].[updateAnnejado]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateAnnejado] @id int, @descr nvarchar(200)
AS
BEGIN
	UPDATE TipoAnejado 
	SET descripcion = @descr
	WHERE idTipoAnejado = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[updateCombinacion]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateCombinacion]
@idCombinacion int,
@new_nombre varchar(50)=NULL,
@new_descripcion varchar(200)=NULL

AS
BEGIN
	
	update Combinacion
	SET nombre = ISNULL(@new_nombre, nombre),
	descripcion = ISNULL(@new_descripcion, descripcion)
	where IdCombinacion = @idCombinacion
	
END
GO
/****** Object:  StoredProcedure [dbo].[updateDescripcionTipoAñejado]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateDescripcionTipoAñejado]
@idTipoAnejado int,
@new_desc nvarchar(200)

AS
BEGIN
	
	update TipoAnejado
	SET descripcion = @new_desc
	where idTipoAnejado = @idTipoAnejado
	
END
GO
/****** Object:  StoredProcedure [dbo].[updateLicor]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateLicor]
@idLicor int,
@idTipoAnejado int=NULL,
@IdProcedencia int=NULL,
@nombre nchar(20)=NULL,
@precio float=NULL,
@annos int=NULL

AS
BEGIN
	update Licor
	SET idTipoAnejado = ISNULL(@idTipoAnejado, idTipoAnejado),
	idProcedencia = ISNULL(@IdProcedencia,idProcedencia),
	nombre = ISNULL(@nombre,nombre),
	precio = ISNULL(@precio,precio),
	annos = ISNULL(@annos,annos)
	where idLicor = @idLicor
	
	SELECT @idLicor AS idLicor;
END

GO
/****** Object:  StoredProcedure [dbo].[updateLicorCombinacion]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateLicorCombinacion]
@idLicor int,
@idCombinacion int,
@new_idLicor int,
@new_idCombinacion int

AS
BEGIN
	
	update LicorCombinacion
	SET IdLicor = ISNULL(@new_idLicor, IdLicor),
	idCombinacion = ISNULL(@new_idCombinacion, idCombinacion)
	where IdCombinacion = @idCombinacion
	and IdLicor = @idCombinacion
	
END
GO
/****** Object:  StoredProcedure [dbo].[updateNombreProcedencia]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateNombreProcedencia]
@idProcedencia int,
@nombre nvarchar(50)

AS
BEGIN
	
	update Procedencia
	SET Procedencia.nombre = @nombre
	where Procedencia.idProcedencia = @idProcedencia
	
END
GO
/****** Object:  StoredProcedure [dbo].[updatePrecioLicor]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updatePrecioLicor]
@idLicor int,
@precio float

AS
BEGIN
	
	update Licor
	SET precio = ISNULL(@precio,precio)
	where idLicor = @idLicor
	
END
GO
/****** Object:  StoredProcedure [dbo].[updateProcedencia]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateProcedencia] @id int, @nombre nvarchar(50)
AS
BEGIN
	UPDATE Procedencia 
	SET nombre = @nombre
	WHERE idProcedencia = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[updateSucursal]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateSucursal] 
	@idSucursal int, @nombre nvarchar(50), @lat float, @lng float, 
	@direccion nvarchar(200), @horaApertura time, @horaCierre time
AS
BEGIN
	DECLARE @ubicacion geometry; 
	SET @ubicacion = geometry::Point(@lat, @lng, 0);

	IF (EXISTS (SELECT * FROM Sucursal)) BEGIN
		UPDATE Sucursal 
		SET nombre = @nombre, ubicacion = @ubicacion, direccion = @direccion, 
		horaApertura = @horaApertura, horaCierre = @horaCierre
		WHERE idSucursal = @idSucursal;
	END ELSE BEGIN
		INSERT INTO Sucursal VALUES (@idSucursal, @nombre, @ubicacion, @direccion, @horaApertura, @horaCierre)
	END

	SELECT 1 AS Response;
END
GO
/****** Object:  StoredProcedure [dbo].[updateUserCliente]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateUserCliente] 
@username nvarchar(50)= NULL,
@new_nombre nvarchar(50)= NULL,
@new_apellidos nvarchar(100)= NULL,
@new_fechaNacimiento date= NULL,
@new_username nvarchar(50)= NULL,
@new_password nvarchar(512)= NULL

AS
BEGIN

	DECLARE @id INT = NULL
	DECLARE @userExists INT
	DECLARE @new_userExists INT
	/*DECLARE @nombre nvarchar(50),
			@apellidos nvarchar(100),
			@fechaNacimiento date,
			@password nvarchar(512)*/

	DECLARE @pass nvarchar(4000) = HASHBYTES('SHA1',
	CONVERT(nvarchar(4000),@new_password));

	SET @userExists = (	select COUNT(ui.userName)
	from UserInfo ui
	where ui.userName = @username)

	SET @new_userExists = (	select COUNT(ui.userName)
	from UserInfo ui
	where ui.userName = @new_username)

	SET NOCOUNT ON;
	if (@userExists = 1 and @new_userExists = 0)
	BEGIN
		
		select @id = ui.idUserInfo
		from UserInfo ui
		where ui.userName = @username

		update UserInfo
		SET UserInfo.password = ISNULL(@pass, password),
		UserInfo.userName = ISNULL(@new_username, userName)
		where UserInfo.userName = @username

		update UserCliente
		SET UserCliente.nombre = ISNULL(@new_nombre, nombre),
		UserCliente.apellidos = ISNULL(@new_apellidos, apellidos),
		UserCliente.fechaNacimiento = ISNULL(@new_fechaNacimiento, fechaNacimiento)
		where UserCliente.idUserInfo = @id

	END
END
GO
/****** Object:  StoredProcedure [dbo].[verifyUsername]    Script Date: 6/19/2018 10:35:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[verifyUsername]
@username nvarchar(50)

AS
BEGIN
	DECLARE @id INT = NULL

	SET NOCOUNT ON;

	select ui.userName
	from UserInfo ui
	where ui.userName = @username

	 select @id = @@ROWCOUNT 

	if (@id = 0)
		return 1
	else
		return 0

	END
GO
USE [master]
GO
ALTER DATABASE [DB_Licoreria_Principal] SET  READ_WRITE 
GO
