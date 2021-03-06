USE [master]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SolucionEjercicioWF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SolucionEjercicioWF] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET ARITHABORT OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SolucionEjercicioWF] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SolucionEjercicioWF] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SolucionEjercicioWF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SolucionEjercicioWF] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SolucionEjercicioWF] SET  MULTI_USER 
GO
ALTER DATABASE [SolucionEjercicioWF] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SolucionEjercicioWF] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SolucionEjercicioWF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SolucionEjercicioWF] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SolucionEjercicioWF] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SolucionEjercicioWF] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SolucionEjercicioWF] SET QUERY_STORE = OFF
GO
USE [SolucionEjercicioWF]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 24/12/2021 08:26:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[id_articulo] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[descripcion] [varchar](max) NULL,
	[precio] [decimal](18, 2) NULL,
	[imagen] [image] NULL,
	[stock] [int] NULL,
 CONSTRAINT [PK_Articulos] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticuloTienda]    Script Date: 24/12/2021 08:26:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticuloTienda](
	[idArticulo] [varchar](50) NULL,
	[idTienda] [int] NULL,
	[cantidad] [int] NULL,
	[fecha] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClienteArticulo]    Script Date: 24/12/2021 08:26:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClienteArticulo](
	[idCliente] [int] NULL,
	[codArticulo] [varchar](50) NOT NULL,
	[cantidad] [int] NULL,
	[fecha] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 24/12/2021 08:26:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NULL,
	[apellidos] [varchar](30) NULL,
	[direccion] [varchar](max) NULL,
	[usuario] [varchar](30) NULL,
	[contraseña] [varchar](30) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tienda]    Script Date: 24/12/2021 08:26:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tienda](
	[id_sucursal] [int] IDENTITY(1,1) NOT NULL,
	[sucursal] [varchar](30) NULL,
	[direccion] [varchar](max) NULL,
 CONSTRAINT [PK_Tienda] PRIMARY KEY CLUSTERED 
(
	[id_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArticuloTienda]  WITH CHECK ADD  CONSTRAINT [FK_ArticuloTienda_Articulos] FOREIGN KEY([idArticulo])
REFERENCES [dbo].[Articulos] ([codigo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArticuloTienda] CHECK CONSTRAINT [FK_ArticuloTienda_Articulos]
GO
ALTER TABLE [dbo].[ArticuloTienda]  WITH CHECK ADD  CONSTRAINT [FK_ArticuloTienda_Tienda] FOREIGN KEY([idTienda])
REFERENCES [dbo].[Tienda] ([id_sucursal])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArticuloTienda] CHECK CONSTRAINT [FK_ArticuloTienda_Tienda]
GO
ALTER TABLE [dbo].[ClienteArticulo]  WITH CHECK ADD  CONSTRAINT [FK_ClienteArticulo_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClienteArticulo] CHECK CONSTRAINT [FK_ClienteArticulo_Clientes]
GO
/****** Object:  StoredProcedure [dbo].[EditarArticulo]    Script Date: 24/12/2021 08:26:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditarArticulo]
	@Codigo VARCHAR(50),
	@Descripcion VARCHAR(MAX),
	@Precio DECIMAL(18, 2),
	@Imagen IMAGE,
	@Stock int
AS
	UPDATE Articulos SET
		descripcion = @Descripcion,
		precio = @Precio,
		imagen = @Imagen,
		stock = @Stock
	WHERE codigo = @Codigo
GO
/****** Object:  StoredProcedure [dbo].[EditarCliente]    Script Date: 24/12/2021 08:26:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditarCliente]
	@IdCliente int,
	@Nombre VARCHAR(30),
	@Apellidos VARCHAR(30),
	@Direccion VARCHAR(MAX),
	@Usuario VARCHAR(30),
	@Contraseña VARCHAR(30)
AS
	UPDATE Clientes SET
		nombre = @Nombre,
		apellidos = @Apellidos,
		direccion = @Direccion,
		usuario = @Usuario,
		contraseña = @Contraseña
	WHERE id_cliente = @IdCliente
GO
/****** Object:  StoredProcedure [dbo].[EditarTienda]    Script Date: 24/12/2021 08:26:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditarTienda]
	@IdSucursal int,
	@Sucursal VARCHAR(30),
	@Direccion VARCHAR(MAX)
AS
	UPDATE Tienda SET
		sucursal = @Sucursal,
		direccion = @Direccion
	WHERE id_sucursal = @IdSucursal
GO
/****** Object:  StoredProcedure [dbo].[HacerPedidoABodega]    Script Date: 24/12/2021 08:26:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[HacerPedidoABodega]
	@idArticulo VARCHAR(50),
	@idTienda INT,
	@cantidad INT
--fecha
AS
INSERT INTO ArticuloTienda VALUES(
	@idArticulo,
	@idTienda,
	@cantidad,
	GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[InsertarArticulo]    Script Date: 24/12/2021 08:26:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertarArticulo]
	@Codigo VARCHAR(50),
	@Descripcion VARCHAR(MAX),
	@Precio DECIMAL(18, 2),
	@Imagen IMAGE,
	@Stock int
AS
IF EXISTS(SELECT codigo FROM Articulos WHERE codigo = @Codigo)
	RAISERROR('YA EXISTE UN ARTICULO CON ESTE CODIGO, POR FAVOR, INGRESE OTRO', 16, 1)
ELSE
	INSERT INTO Articulos VALUES(
		@Codigo,
		@Descripcion,
		@Precio,
		@Imagen,
		@Stock)
GO
/****** Object:  StoredProcedure [dbo].[InsertarCliente]    Script Date: 24/12/2021 08:26:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertarCliente]
	@Nombre VARCHAR(30),
	@Apellidos VARCHAR(30),
	@Direccion VARCHAR(MAX),
	@Usuario VARCHAR(30),
	@Contraseña VARCHAR(30)
AS
IF EXISTS(SELECT usuario FROM Clientes WHERE usuario = @Usuario)
	RAISERROR('YA EXISTE UN CLIENTE CON ESTE NOMBRE DE USUARIO', 16, 1)
ELSE
	INSERT INTO Clientes VALUES(
		@Nombre,
		@Apellidos,
		@Direccion,
		@Usuario,
		@Contraseña
	)
GO
/****** Object:  StoredProcedure [dbo].[InsertarCompra]    Script Date: 24/12/2021 08:26:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertarCompra]
	@IdCliente INT,
	@CodArticulo varchar(50),
	@cantidad INT
AS
INSERT INTO ClienteArticulo VALUES(
	@IdCliente,
	@CodArticulo,
	@cantidad,
	GETDATE())
GO
/****** Object:  StoredProcedure [dbo].[InsertarTienda]    Script Date: 24/12/2021 08:26:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertarTienda]
	@Sucursal VARCHAR(30),
	@Direccion VARCHAR(MAX)
AS
IF EXISTS(SELECT sucursal FROM Tienda WHERE sucursal = @Sucursal)
	RAISERROR('YA EXISTE UNA SUCURSAL CON ESTE NOMBRE', 16, 1)
ELSE
	INSERT INTO Tienda VALUES(
		@Sucursal,
		@Direccion
	)
GO
USE [master]
GO
ALTER DATABASE [SolucionEjercicioWF] SET  READ_WRITE 
GO
