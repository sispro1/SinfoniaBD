USE [master]
GO
/****** Object:  Database [PV_VIAMORELOS]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE DATABASE [PV_VIAMORELOS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PV_VIAMORELOS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PV_VIAMORELOS.mdf' , SIZE = 10047488KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PV_VIAMORELOS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PV_VIAMORELOS_log.ldf' , SIZE = 41483456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PV_VIAMORELOS] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PV_VIAMORELOS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PV_VIAMORELOS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET ARITHABORT OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PV_VIAMORELOS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PV_VIAMORELOS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PV_VIAMORELOS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PV_VIAMORELOS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET RECOVERY FULL 
GO
ALTER DATABASE [PV_VIAMORELOS] SET  MULTI_USER 
GO
ALTER DATABASE [PV_VIAMORELOS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PV_VIAMORELOS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PV_VIAMORELOS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PV_VIAMORELOS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PV_VIAMORELOS] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PV_VIAMORELOS', N'ON'
GO
USE [PV_VIAMORELOS]
GO
/****** Object:  User [ConsultasVM]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE USER [ConsultasVM] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ConsultasVM]
GO
/****** Object:  UserDefinedTableType [dbo].[ArticuloPorMovimiento]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE TYPE [dbo].[ArticuloPorMovimiento] AS TABLE(
	[id_movimiento_almacen] [int] NULL,
	[id_articulo] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ArticuloProveedorCostoType]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE TYPE [dbo].[ArticuloProveedorCostoType] AS TABLE(
	[id_articulo] [int] NULL,
	[id_proveedor] [int] NULL,
	[costo] [decimal](18, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ConteoAuditoria]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE TYPE [dbo].[ConteoAuditoria] AS TABLE(
	[claveArticulo] [nvarchar](50) NULL,
	[conteoAuditoria] [decimal](18, 2) NULL,
	[almacen] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[CotizacionDetalle]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE TYPE [dbo].[CotizacionDetalle] AS TABLE(
	[idCotizacionDetalle] [int] NULL,
	[idCotizacion] [int] NULL,
	[idArticulo] [int] NULL,
	[consecutivo] [int] NULL,
	[cantidad] [decimal](18, 2) NULL,
	[idUnidadMedida] [int] NULL,
	[idAlmacen] [int] NULL,
	[esPromocion] [bit] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ListaArticuloAuditar]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE TYPE [dbo].[ListaArticuloAuditar] AS TABLE(
	[id] [int] NULL,
	[almacen] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ListaIDs]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE TYPE [dbo].[ListaIDs] AS TABLE(
	[id] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ListaIDsCantidad]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE TYPE [dbo].[ListaIDsCantidad] AS TABLE(
	[id] [int] NULL,
	[cantidad] [decimal](18, 4) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ListaIDsCantidadAlmacen]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE TYPE [dbo].[ListaIDsCantidadAlmacen] AS TABLE(
	[id] [int] NULL,
	[cantidad] [decimal](18, 4) NULL,
	[almacen] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[MovimientoAlmacenDetalle]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE TYPE [dbo].[MovimientoAlmacenDetalle] AS TABLE(
	[idMovimientoAlmacenDetalle] [int] NULL,
	[idMovimientoAlmacen] [int] NULL,
	[idAlmacen] [int] NULL,
	[idArticulo] [int] NULL,
	[consecutivo] [int] NULL,
	[cantidad] [decimal](18, 2) NULL,
	[cantidadExistencia] [decimal](18, 2) NULL,
	[costoUnitario] [decimal](18, 6) NULL,
	[idUnidadMedida] [int] NULL,
	[descuento] [decimal](18, 6) NULL,
	[importe] [decimal](18, 6) NULL,
	[entradaArticuloExistencia] [int] NULL,
	[salidaArticuloExistencia] [int] NULL,
	[entradaArticulo] [int] NULL,
	[salidaArticulo] [int] NULL,
	[afectaCostoUltimo] [tinyint] NULL,
	[afectaCostoPromedio] [tinyint] NULL,
	[vendeSinExistencia] [bit] NULL,
	[subtotal] [decimal](18, 6) NULL,
	[iva] [decimal](18, 6) NULL,
	[ieps] [decimal](18, 6) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[MovimientoCaja]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE TYPE [dbo].[MovimientoCaja] AS TABLE(
	[idMovimientoCaja] [int] NULL,
	[idSucursal] [int] NULL,
	[idCaja] [int] NULL,
	[idFormaPago] [int] NULL,
	[idMovimientoCajaTipo] [int] NULL,
	[idMovimientoCajaConcepto] [int] NULL,
	[importeTotal] [decimal](18, 2) NULL,
	[dotacionInicial] [bit] NULL,
	[folio] [nvarchar](12) NULL,
	[idTiraBanco] [int] NULL,
	[folioVenta] [nvarchar](12) NULL,
	[idVenta] [int] NULL,
	[idCierre] [int] NULL,
	[idConsolidacion] [int] NULL,
	[codigoAutorizacion] [nvarchar](10) NULL,
	[observaciones] [nvarchar](50) NULL,
	[fechaRegistro] [datetime] NULL,
	[idUsuarioLogueado] [int] NULL,
	[idUsuarioAutorizo] [int] NULL,
	[referencia] [nvarchar](20) NULL,
	[idBanco] [int] NULL,
	[idValeDevolucion] [int] NULL,
	[nombreFormaPago] [nvarchar](100) NULL,
	[idTransaccion] [int] NULL,
	[esTarjeta] [bit] NULL,
	[abreCajon] [bit] NULL,
	[comision] [decimal](18, 2) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PromocionDetalle]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE TYPE [dbo].[PromocionDetalle] AS TABLE(
	[id_promocion_venta] [int] NULL,
	[id_promocion] [int] NULL,
	[id_ticket] [int] NULL,
	[id_articulo_regalo] [int] NULL,
	[monto_cantidad] [decimal](18, 2) NULL,
	[fecha_registro] [datetime] NULL,
	[aplicadas] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PromocionVenta]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE TYPE [dbo].[PromocionVenta] AS TABLE(
	[idPromocionVenta] [int] NULL,
	[idPromocion] [int] NULL,
	[idTicket] [int] NULL,
	[idArticuloRegalo] [int] NULL,
	[montoCantidad] [decimal](18, 2) NULL,
	[fechaRegistro] [datetime2](7) NULL,
	[aplicadas] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[RecetaVentaType]    Script Date: 10/09/2020 08:19:24 a. m. ******/
CREATE TYPE [dbo].[RecetaVentaType] AS TABLE(
	[id_sucursal] [int] NULL,
	[id_movimiento_almacen_detalle] [int] NULL,
	[id_venta] [int] NULL,
	[id_articulo] [int] NULL,
	[folio_receta] [nvarchar](20) NULL,
	[cedula_profesional] [nvarchar](20) NULL,
	[observaciones] [nvarchar](200) NULL,
	[id_usuario_logueado] [int] NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalcularExistenciaCadena]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Carlos Negrete


CREATE FUNCTION [dbo].[fnCalcularExistenciaCadena] 
(
	@articulo			AS INT,
	@relacion_venta			AS decimal,
	@relacion_compra		AS decimal,
	@id_sucursal		AS INT

)
RETURNS nvarchar (100)
AS
BEGIN
	DECLARE @total	AS nvarchar(100)
	DECLARE @existencia	AS decimal(18,4)
	DECLARE @existenciaDecimal	AS decimal(18,4)
	
	set @existencia=0
	if((select id_unidad_compra from articulo where id_articulo = @articulo) = (select id_unidad_venta from articulo where id_articulo = @articulo))
	BEGIN 
		select @existencia= sum(existencia_actual) 
							from articulo_existencia a LEFT JOIN 
							almacen ae ON a.id_almacen = ae.id_almacen
							where a.id_articulo = @articulo AND @id_sucursal = id_sucursal
		
		set @total = ((Convert(nvarchar, (@existencia))) +' '+ (select um.descripcion from articulo a LEFT JOIN unidad_medida um ON um.id_unidad_medida= a.id_unidad_compra where id_articulo= @articulo))

	END
	ELSE
	BEGIN
		select @existencia= sum(existencia_actual) 
							from articulo_existencia a LEFT JOIN 
							almacen ae ON a.id_almacen = ae.id_almacen
							where a.id_articulo = @articulo AND @id_sucursal = id_sucursal


	
		set @existencia= @existencia/@relacion_venta*@relacion_compra

	
		select @existenciaDecimal= (select sum(existencia_actual) 
							from articulo_existencia a LEFT JOIN 
							almacen ae ON a.id_almacen = ae.id_almacen
							where a.id_articulo = @articulo and id_sucursal = @id_sucursal)-((floor(@existencia))*@relacion_venta);
		
		set @total = ((Convert(nvarchar, (floor(@existencia)))) +' '+ (select um.descripcion from articulo a LEFT JOIN unidad_medida um ON um.id_unidad_medida= a.id_unidad_compra where id_articulo= @articulo) +' '+ (Convert(nvarchar, (@existenciaDecimal)))+' '+(select um.descripcion from articulo a LEFT JOIN unidad_medida um ON um.id_unidad_medida= a.id_unidad_venta where id_articulo= @articulo));
	END
	RETURN @total
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalcularExistenciaCadenaMomento]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Carlos Negrete


Create FUNCTION [dbo].[fnCalcularExistenciaCadenaMomento] 
(	
	@articulo as int, 
	@relacion_venta as decimal(18,4),
	@relacion_compra  as decimal (18,4),
	@idMovimientoAlmacenDetalle as int
	

)
RETURNS nvarchar (100)
AS
BEGIN
	DECLARE @total	AS nvarchar(100)
	DECLARE @existencia	AS decimal(18,4)
	DECLARE @existenciaDecimal	AS decimal(18,4)
	
	set @existencia=0
	if((select id_unidad_compra from articulo where id_articulo = @articulo) = (select id_unidad_venta from articulo where id_articulo = @articulo))
	BEGIN 
		select @existencia= existencia_al_momento
							from movimiento_almacen_detalle a LEFT JOIN 
							almacen ae ON a.id_almacen = ae.id_almacen
							where a.id_articulo = @articulo 
							and @idMovimientoAlmacenDetalle = a.id_movimiento_almacen_detalle
		
		set @total = ((Convert(nvarchar, (floor(@existencia)))) +' '+ (select um.descripcion from articulo a LEFT JOIN unidad_medida um ON um.id_unidad_medida= a.id_unidad_compra where id_articulo= @articulo))

	END
	ELSE
	BEGIN
		select @existencia= existencia_al_momento
							from movimiento_almacen_detalle a LEFT JOIN 
							almacen ae ON a.id_almacen = ae.id_almacen
							where a.id_articulo = @articulo 
							and @idMovimientoAlmacenDetalle = a.id_movimiento_almacen_detalle


	
		set @existencia= @existencia/@relacion_venta*@relacion_compra

	
		select @existenciaDecimal= (select existencia_al_momento 
							from movimiento_almacen_detalle a LEFT JOIN 
							almacen ae ON a.id_almacen = ae.id_almacen
							where a.id_articulo = @articulo and  @idMovimientoAlmacenDetalle = a.id_movimiento_almacen_detalle )-((floor(@existencia))*@relacion_venta);
		
		set @total = ((Convert(nvarchar, (floor(@existencia)))) +' '+ (select um.descripcion from articulo a LEFT JOIN unidad_medida um ON um.id_unidad_medida= a.id_unidad_compra where id_articulo= @articulo) + (Convert(nvarchar, (FLOOR(@existenciaDecimal))))+' '+(select um.descripcion from articulo a LEFT JOIN unidad_medida um ON um.id_unidad_medida= a.id_unidad_venta where id_articulo= @articulo));
	END
	RETURN @total
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalcularExistenciaFecha]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCalcularExistenciaFecha] 
(    
    @idArticulo AS INT,
    @idAlmacen AS INT,
    @idMovAlmDetalle AS INT
)
RETURNS DECIMAL(18,6)
AS
BEGIN
    DECLARE @total    AS nvarchar(100)
    DECLARE @existenciaInicial    AS decimal(18,6)
    DECLARE @existenciaMAD    AS decimal(18,6)

    SELECT @existenciaInicial = 0, @existenciaMAD = 0, @total = 0
    
    SELECT
        @existenciaMAD = ISNULL(SUM(cantidad * (CASE mat.es_entrada WHEN 1 THEN 1 ELSE -1 END)),0)
    FROM
        movimiento_almacen_detalle mad
        LEFT JOIN movimiento_almacen ma ON mad.id_movimiento_almacen = ma.id_movimiento_almacen
        LEFT JOIN movimiento_almacen_tipo mat ON ma.id_movimiento_almacen_tipo = mat.id_movimiento_almacen_tipo
    WHERE
        mad.id_articulo = @idArticulo AND
        mad.id_almacen = @idAlmacen AND
        mad.id_movimiento_almacen_detalle <= @idMovAlmDetalle

    SELECT @existenciaInicial = existencia_inicial FROM articulo_existencia WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacen

    RETURN @existenciaInicial + @existenciaMAD
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalcularIEPSTotaldeCompra]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCalcularIEPSTotaldeCompra] 
(
	@movAlmacen			AS INT,
	@tipo				AS iNT
)
RETURNS DECIMAL(18,2)
AS
BEGIN
	DECLARE @totalIEPS	AS Decimal(18,4)
		
	SELECT @totalIEPS = sum(dbo.fnCalcularIEPSTotalPorArticulo(id_articulo,@movAlmacen,@tipo))
	from movimiento_almacen_detalle where id_movimiento_almacen=@movAlmacen

	RETURN @totalIEPS
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalcularIEPSTotalPorArticulo]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Carlos Negrete


CREATE FUNCTION [dbo].[fnCalcularIEPSTotalPorArticulo] 
(
	@articulo			AS INT,
	@movAlmacen			AS INT,
	@tipo				AS INT
)
RETURNS DECIMAL (18,2)
AS
BEGIN
	DECLARE @totalIEPS	AS Decimal(18,4)
		
	IF(@tipo=0)
	BEGIN
		SELECT  @totalIEPS= (((costo_unitario*cantidad)*ieps.tasa))/(100+iva.tasa+ieps.tasa)
		from movimiento_almacen_detalle mad LEFT JOIN 
		articulo a ON a.id_articulo=mad.id_articulo LEFT JOIN 
		impuesto iva ON iva.id_impuesto=id_iva_venta LEFT JOIN
		impuesto ieps ON ieps.id_impuesto = id_ieps_venta
		where id_movimiento_almacen=@movAlmacen and mad.id_articulo= @articulo
	END
	ELSE
	BEGIN
		SELECT  @totalIEPS= (((costo_unitario*cantidad)*ieps.tasa))/(100+iva.tasa+ieps.tasa)
		from movimiento_almacen_detalle mad LEFT JOIN 
		articulo a ON a.id_articulo=mad.id_articulo LEFT JOIN 
		impuesto iva ON iva.id_impuesto=id_iva_compra LEFT JOIN
		impuesto ieps ON ieps.id_impuesto = id_ieps_compra
		where id_movimiento_almacen=@movAlmacen and mad.id_articulo= @articulo
	END
	RETURN @totalIEPS
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalcularIvaTotaldeCompra]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCalcularIvaTotaldeCompra] 
(
	@movAlmacen			AS INT,
	@tipo				AS INT
)
RETURNS DECIMAL(18,2)
AS
BEGIN
	DECLARE @totalIva	AS Decimal(18,4)
		
	SELECT @totalIva = sum(dbo.fnCalcularIvaTotalPorArticulo(id_articulo,@movAlmacen,@tipo))
	from movimiento_almacen_detalle where id_movimiento_almacen=@movAlmacen

	RETURN @totalIva
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalcularIvaTotalPorArticulo]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Carlos Negrete
CREATE FUNCTION [dbo].[fnCalcularIvaTotalPorArticulo] 
(
	@articulo			AS INT,
	@movAlmacen			AS INT,
	@tipo				AS INT
)
RETURNS DECIMAL (18,2)
AS
BEGIN
	DECLARE @totalIva	AS Decimal(18,2)
	IF(@tipo=0)
	BEGIN
		SELECT  @totalIva= (((costo_unitario*cantidad)*iva.tasa))/(100+iva.tasa+ieps.tasa)
		from movimiento_almacen_detalle mad LEFT JOIN 
		articulo a ON a.id_articulo=mad.id_articulo LEFT JOIN 
		impuesto iva ON iva.id_impuesto=id_iva_venta LEFT JOIN
		impuesto ieps ON ieps.id_impuesto = id_ieps_venta
		where id_movimiento_almacen=@movAlmacen and mad.id_articulo= @articulo
	END
	ELSE
	BEGIN
		SELECT  @totalIva= (((costo_unitario*cantidad)*iva.tasa))/(100+iva.tasa+ieps.tasa)
		from movimiento_almacen_detalle mad LEFT JOIN 
		articulo a ON a.id_articulo=mad.id_articulo LEFT JOIN 
		impuesto iva ON iva.id_impuesto=id_iva_compra LEFT JOIN
		impuesto ieps ON ieps.id_impuesto = id_ieps_compra
		where id_movimiento_almacen=@movAlmacen and mad.id_articulo= @articulo
	END
	RETURN @totalIva
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCantidadConDevolucion]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnCantidadConDevolucion](@id_ma AS INT, @id_articulo AS INT)
RETURNS DECIMAL(20,2)
AS
BEGIN
     DECLARE @Valor AS DECIMAL(20,2)

	 SELECT @Valor=ISNULL(SUM(cantidad),0) FROM movimiento_almacen_detalle WHERE 
	 id_movimiento_almacen=@id_ma AND id_articulo=@id_articulo AND cantidad<0;
	 
     RETURN @Valor
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnConsecutivoConsolidacion]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnConsecutivoConsolidacion](@idSucursal AS VARCHAR(20))
RETURNS VARCHAR(30)
AS
BEGIN
     DECLARE @folio AS VARCHAR(30);
	 DECLARE @cons BIGINT;

	 SELECT @cons = MAX(consecutivo)+1 FROM consolidacion WHERE id_sucursal = @idSucursal;

	 SET @folio = 'CONS' + @idSucursal + REPLICATE('0', 4 - LEN(@cons)) + CAST(@cons AS NVARCHAR);

	 RETURN @folio;
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnConsecutivoVenta]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnConsecutivoVenta](@folio AS VARCHAR(20),@clave AS VARCHAR(10))
RETURNS INT
AS
BEGIN
     DECLARE @Valor AS INT;

	 SELECT TOP 1 @Valor=mad.consecutivo FROM movimiento_almacen ma INNER JOIN movimiento_almacen_detalle mad ON
	 ma.id_movimiento_almacen=mad.id_movimiento_almacen INNER JOIN articulo art ON mad.id_articulo=art.id_articulo
	 WHERE cantidad > 0 AND ma.folio=@folio AND art.clave=@clave;

	 RETURN @Valor;
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnContUsoValeACV]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnContUsoValeACV]
(
@ref AS VARCHAR(20)
)
RETURNS INT
AS
BEGIN
     DECLARE @Valor AS INT;
	 SELECT @Valor=COUNT(mc.referencia) FROM movimiento_caja mc INNER JOIN forma_pago fp ON mc.id_forma_pago=fp.id_forma_pago
	 WHERE fp.id_forma_pago=7 AND REPLACE(mc.referencia,' ', '')=REPLACE(@ref,' ', '')
	 RETURN @Valor
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnCostoPromedio]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCostoPromedio]
(
@id_mad AS INTEGER
)
RETURNS NUMERIC(20,4)
AS
BEGIN
     DECLARE @Valor AS NUMERIC(20,4);
	 SELECT @Valor=CASE WHEN mat.es_entrada=1 THEN 
	 CONVERT(NUMERIC(10,2),ROUND((((dbo.fnExistenciaTotal(art.id_articulo)-mad.cantidad)*art.costo_promedio)+(mad.cantidad*mad.costo_unitario))/((dbo.fnExistenciaTotal(art.id_articulo)-mad.cantidad)+mad.cantidad),2)) 
	 ELSE 
	 CASE WHEN ma.id_movimiento_almacen_tipo=10 THEN 
	 CONVERT(NUMERIC(10,2),ROUND((((dbo.fnExistenciaTotal(art.id_articulo)+mad.cantidad)*art.costo_promedio)-(mad.cantidad*mad.costo_unitario))/((dbo.fnExistenciaTotal(art.id_articulo)+mad.cantidad)-mad.cantidad),2)) 
	 ELSE
	 CONVERT(NUMERIC(10,2),ROUND((((dbo.fnExistenciaTotal(art.id_articulo)+mad.cantidad)*art.costo_promedio)-(mad.cantidad*art.costo_promedio))/((dbo.fnExistenciaTotal(art.id_articulo)+mad.cantidad)-mad.cantidad),2)) 
	 END END
	 FROM 
	 movimiento_almacen ma INNER JOIN movimiento_almacen_detalle mad ON ma.id_movimiento_almacen=mad.id_movimiento_almacen 
	 INNER JOIN movimiento_almacen_tipo mat ON ma.id_movimiento_almacen_tipo=mat.id_movimiento_almacen_tipo 
	 INNER JOIN articulo art ON art.id_articulo=mad.id_articulo 
	 WHERE mad.id_movimiento_almacen_detalle=@id_mad;
	 RETURN @Valor
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnDifFactVent]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnDifFactVent]
(   
    @fecha_inicio DATE,
    @fecha_fin    DATE
)
RETURNS @tabla TABLE(
    Fecha                 VARCHAR(20),
    Facturacion           DECIMAL(20,2),
    Venta                 DECIMAL(20,2),
    Diferencia_Dinero     DECIMAL(20,2),
	Diferencia_Porcentaje DECIMAL(20,2)
)
AS
BEGIN
	DECLARE @fi Date;
	DECLARE @ff Date;

	SELECT @fi=@fecha_inicio, @ff=@fecha_fin ;WITH FECHAS(fecha) AS (
	SELECT @fi AS 'fecha'
	UNION ALL
	SELECT DATEADD(day, 1, fecha) AS 'fecha' FROM FECHAS WHERE fecha < @ff)

	INSERT @tabla 
	SELECT Fecha,Facturacion,Venta,Facturacion-Venta AS 'Diferencia Dinero',CASE WHEN ABS(Facturacion-Venta)=0 
	THEN 0.00 ELSE CASE WHEN Venta=0 THEN CONVERT(DECIMAL(20,2),(ABS(Venta-Facturacion)/Facturacion)*100) 
	ELSE CONVERT(DECIMAL(20,2),(ABS(Facturacion-Venta)/Venta)*100) END END AS 'Diferencia Porcentaje' FROM 
	(SELECT FORMAT(fecha,'dd/MM/yyyy') AS 'Fecha',dbo.fnTotalFacturacionDia(fecha) AS 'Facturacion',
	dbo.fnTotalVentaDia(fecha) AS 'Venta' FROM FECHAS) tabla ORDER BY Fecha ASC OPTION (maxrecursion 0);

    RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnDocFactura]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnDocFactura](@IdFac AS INTEGER)
RETURNS  VARCHAR(200)
AS
BEGIN
     DECLARE @Valor AS VARCHAR(200);

	 SET @Valor='Sin Documento';

	 SELECT @Valor=CASE WHEN c.id_consolidacion IS NOT NULL THEN (SELECT folio FROM consolidacion 
	 WHERE id_consolidacion=c.id_consolidacion) WHEN c.id_consolidacion IS NULL THEN 
	 STUFF((SELECT ',' + folio FROM movimiento_almacen WHERE id_facturacion=f.id_facturacion 
	 FOR XML PATH('')), 1, 1, '') END FROM facturacion f LEFT JOIN consolidacion c ON 
	 c.id_facturacion=f.id_facturacion WHERE f.id_facturacion=@IdFac;

	 RETURN @Valor;
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnEstadoDevolucion]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnEstadoDevolucion]
(
@idArt AS INTEGER,
@folio AS VARCHAR (100)
)
RETURNS  VARCHAR(50)
AS
BEGIN
     DECLARE @Valor AS VARCHAR(50);
	 SELECT @Valor=CASE WHEN fecha_cancelado IS NULL THEN CASE WHEN fecha_devuelto 
	 IS NULL THEN 'Venta' ELSE 'Devuelto' END ELSE 'Cancelado' END FROM movimiento_almacen ma 
	 INNER JOIN movimiento_almacen_detalle mad ON ma.id_movimiento_almacen=mad.id_movimiento_almacen
	 WHERE id_movimiento_almacen_tipo=12 AND folio=@folio AND id_articulo=@idArt;
     RETURN @Valor
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnExistencia]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnExistencia]
(   
    @id_almacen INT,
    @id_articulo INT
)
RETURNS @tabla TABLE(
    clave               VARCHAR(100),
    existencia_actual   VARCHAR(100),
    existencia_apartado VARCHAR(100),
    existencia_venta    VARCHAR(100)
)
AS
BEGIN
    IF(@id_almacen = 1)
	BEGIN
		INSERT @tabla SELECT almacen.clave,CONCAT(CONVERT(DECIMAL(10,2),existencia_actual),' ',unidad_medida.descripcion),
		CONCAT(CONVERT(DECIMAL(10,2),existencia_apartado),' ',unidad_medida.descripcion),CONCAT(CONVERT
		(DECIMAL(10,2),existencia_venta),' ',unidad_medida.descripcion) FROM articulo_existencia,articulo,almacen,
		unidad_medida WHERE articulo_existencia.id_almacen=almacen.id_almacen AND 
		articulo.id_articulo=articulo_existencia.id_articulo AND id_unidad_venta=unidad_medida.id_unidad_medida AND
		almacen.id_almacen=1 AND articulo.id_articulo=@id_articulo;
    END
    ELSE
	BEGIN
		INSERT @tabla SELECT almacen.clave,CONCAT(CONVERT(DECIMAL(10,2),existencia_actual/relacion_venta),' ',unidad_medida.descripcion),
		CONCAT(CONVERT(DECIMAL(10,2),existencia_apartado/relacion_venta),' ',unidad_medida.descripcion),CONCAT(CONVERT
		(DECIMAL(10,2),existencia_venta/relacion_venta),' ',unidad_medida.descripcion) FROM articulo_existencia,articulo,almacen,
		unidad_medida WHERE articulo_existencia.id_almacen=almacen.id_almacen AND articulo.id_articulo=articulo_existencia.id_articulo 
		AND id_unidad_compra=unidad_medida.id_unidad_medida AND almacen.id_almacen=2 AND articulo.id_articulo=@id_articulo;
	END
    RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnExistenciaTotal]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnExistenciaTotal]
(
@id_articulo AS INTEGER
)
RETURNS NUMERIC(20,4)
AS
BEGIN
     DECLARE @Valor AS NUMERIC(20,4);
	 SELECT @Valor=ISNULL(SUM(artex.existencia_actual),0)+ISNULL(SUM(artex.existencia_apartado),0)+
	 ISNULL(SUM(artex.existencia_venta),0) FROM articulo art INNER JOIN articulo_existencia artex 
	 ON art.id_articulo=artex.id_articulo WHERE id_almacen IN (1,2) AND art.id_articulo=@id_articulo;
     RETURN @Valor
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnFormaPago]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnFormaPago](@IdMovimientoAlmacen AS INTEGER)
RETURNS  VARCHAR(100)
AS
BEGIN
     DECLARE @Valor AS VARCHAR(100)

	 SELECT @Valor=ISNULL((SELECT TOP 1 descripcion FROM movimiento_caja,forma_pago 
	 WHERE movimiento_caja.id_forma_pago = forma_pago.id_forma_pago AND 
	 id_venta=@IdMovimientoAlmacen ORDER BY importe_total DESC), 'N/A')
	 
     RETURN @Valor
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnImpuestoTasa]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnImpuestoTasa]
(
@id_impuesto AS INTEGER
)
RETURNS DECIMAL(5,2)
AS
BEGIN
     DECLARE @Valor AS DECIMAL(5,2);
	 SELECT @Valor=tasa FROM impuesto WHERE id_impuesto=@id_impuesto;
     RETURN @Valor
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnObtenerArticulosPromocion]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Carlos Negrete
CREATE FUNCTION [dbo].[fnObtenerArticulosPromocion] 
(
	@idPromo	AS INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	DECLARE @articulosPromo	AS NVARCHAR(MAX)
		set @articulosPromo =''
	SELECT  @articulosPromo=clave +', '+@articulosPromo
	from	promocion_compra
	where	id_promocion=@idPromo

	return @articulosPromo
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnObtenerCantidadesPromocion]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Carlos Negrete
CREATE FUNCTION [dbo].[fnObtenerCantidadesPromocion] 
(
	@idPromo		AS INT,
	@Ref			AS INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	DECLARE @articulosCant	AS NVARCHAR(max)
		set @articulosCant =''

	if(@Ref=6)
	BEGIN
	SELECT  @articulosCant = ISNULL(cast(cantidad as nvarchar(10)),0) 
		from	promocion
		where	id_promocion = @idPromo
	END
	ELSE
	BEGIN
		SELECT  @articulosCant=ISNULL(cast(cantidad as nvarchar(10)),0) +', '+@articulosCant
		from	promocion_compra
		where	id_promocion = @idPromo
	END
	return @articulosCant
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnObtenerCostoAFecha]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carolina Franco
-- Create date: 21 Abril 2019
-- Description:	SP
-- =============================================

CREATE FUNCTION [dbo].[fnObtenerCostoAFecha] 
(	
	@articuloID as INT, 
	@fecha as DATETIME,
	@conImpuesto as INT
)
RETURNS decimal(18,2)
AS
BEGIN
	
	DECLARE @costoU AS DECIMAL(18,6)
	DECLARE @costoT AS DECIMAL(18,6)
	
	SET @costoU = 0.00
	SET @costoT = 0.00

	-- IdCompra = 1, IdTransSucEntr = 2
	select TOP 1
		@costoU = mad.costo_unitario
	from
		movimiento_almacen as ma join movimiento_almacen_detalle as mad on ma.id_movimiento_almacen = mad.id_movimiento_almacen
	where
		ma.id_movimiento_almacen_tipo in (1,2)
		and mad.id_articulo = @articuloID
		and ma.fecha_registro < @fecha
	order by
		ma.fecha_registro desc
	

	-- Si no tiene compra o entrada, ese articulo, entonces toma el costo del artículo
	IF @costoU = 0.00
	BEGIN
		select @costoU = (costo_ultimo / relacion_venta) from articulo where id_articulo = @articuloID
	END

	SET @costoT = @costoU

	IF @conImpuesto = 1
	BEGIN
		SELECT
			@costoT = @costoU + (@costoU * (iva.tasa / 100.0)) + (@costoU * (ieps.tasa / 100.0))
		FROM
			articulo as a join impuesto as iva on a.id_iva_compra = iva.id_impuesto 
			join impuesto as ieps on a.id_ieps_compra = ieps.id_impuesto
		where 
			a.id_articulo = @articuloID
	END

	RETURN ISNULL(@costoT, 0.00)
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnObtenerErrorConsolidacion]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnObtenerErrorConsolidacion]
(
@IdFac AS INTEGER
)
RETURNS  VARCHAR(50)
AS
BEGIN
     DECLARE @Valor AS VARCHAR(200)
	 SELECT @Valor=error FROM facturacion,consolidacion WHERE facturacion.id_facturacion=consolidacion.id_facturacion 
	 AND fecha_cancelado IS NOT NULL AND facturacion.id_facturacion=@IdFac;
     RETURN @Valor
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnObtenerFoliosFacturacion]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnObtenerFoliosFacturacion]
(
@IdFac AS INTEGER
)
RETURNS  VARCHAR(200)
AS
BEGIN
    DECLARE @Valor AS VARCHAR(200)

	SELECT @Valor=error FROM facturacion,consolidacion WHERE facturacion.id_facturacion=consolidacion.id_facturacion 
	AND fecha_cancelado IS NOT NULL AND facturacion.id_facturacion=@IdFac;SELECT @valor=STUFF((SELECT ', '+folio FROM movimiento_almacen WHERE id_facturacion=@IdFac FOR XML PATH('')), 1, 1, '');

	IF @valor IS NULL
	BEGIN
		SELECT @Valor=folio FROM consolidacion WHERE id_facturacion=@IdFac;
	END

    RETURN @Valor
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnObtenerVariable]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnObtenerVariable]
(
@IdSuc AS INTEGER,
@Nom   AS VARCHAR (70)
)
RETURNS  VARCHAR(50)
AS
BEGIN
     DECLARE @Valor AS VARCHAR(50)
	 SELECT @Valor=valor FROM variable_config  WHERE id_sucursal=@IdSuc AND nombre=@Nom;
     RETURN @Valor
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnObtnerPromocionArticuloTicket]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnObtnerPromocionArticuloTicket]
(   
	@idTicket   INT,
	@idArticulo INT,
	@idUnid     INT,
	@cant       NUMERIC(20,2)
)
RETURNS @tabla TABLE(
    idArt INT,
    cant  NUMERIC(20,2),
    cost  NUMERIC(20,2),
    unid  INT
)
AS
BEGIN
	DECLARE @idProm AS INT

	SET @idProm = 0

    SELECT @idProm=prom.id_promocion FROM promocion prom INNER JOIN promocion_regalo reg ON prom.id_promocion=reg.id_promocion
	INNER JOIN promocion_venta vent ON prom.id_promocion=vent.id_promocion INNER JOIN promocion_compra comp ON prom.id_promocion=comp.id_promocion
	INNER JOIN articulo art ON comp.clave=art.clave WHERE id_ticket=@idTicket AND art.id_articulo=@idArticulo;

	IF @idProm=0 
	BEGIN
		INSERT INTO @tabla
		SELECT 0,0,0,0
	END
	ELSE
	BEGIN
		INSERT INTO @tabla
		--reg.cantidad*vent.aplicadas
		--vent.aplicadas
		SELECT reg.id_articulo,reg.cantidad*vent.aplicadas,0,reg.id_unidad_medida FROM promocion prom INNER JOIN promocion_regalo reg ON prom.id_promocion=reg.id_promocion
		INNER JOIN promocion_venta vent ON prom.id_promocion=vent.id_promocion INNER JOIN promocion_compra comp ON prom.id_promocion=comp.id_promocion
		INNER JOIN articulo art ON comp.clave=art.clave WHERE prom.id_promocion=@idProm AND id_ticket=@idTicket AND art.id_articulo=@idArticulo;
	END

    RETURN
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnTotalFacturacionDia]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fnTotalFacturacionDia](@fecha AS DATE)
RETURNS NUMERIC(20,2)
AS
BEGIN
     DECLARE @Valor AS NUMERIC(20,2)

	 SELECT @Valor=ISNULL(SUM(CONVERT(DECIMAL(20,2),total)),0) FROM facturacion WHERE 
	 folio_fiscal IS NOT NULL AND CONVERT(DATE,fecha_generado)=@fecha;
	 
     RETURN @Valor
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnTotalVentaDia]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnTotalVentaDia](@fecha AS DATE)
RETURNS  NUMERIC(20,2)
AS
BEGIN
     DECLARE @Valor AS NUMERIC(20,2)

	 SELECT @Valor=ISNULL(SUM(Venta),0) FROM (SELECT ISNULL(SUM(CONVERT(DECIMAL(20,2),importe)),0)-(ISNULL((SELECT SUM(temp.importe) 
	 FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) 
	 AS 'Venta' FROM movimiento_almacen ma INNER JOIN movimiento_almacen_detalle mad ON ma.id_movimiento_almacen=mad.id_movimiento_almacen 
	 WHERE ma.id_movimiento_almacen_tipo=12 AND mad.fecha_devuelto IS NULL AND CONVERT(DATE,fecha_registro)=@fecha
	 GROUP BY mad.id_movimiento_almacen_detalle) tbl;

     RETURN @Valor
 END

GO
/****** Object:  UserDefinedFunction [dbo].[fnVerificarExistencia]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnVerificarExistencia]
(   
    @id_almacen INT,
    @id_articulo INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
	DECLARE @Valor AS DECIMAL(10,2);
	DECLARE @tabla TABLE(cantidad DECIMAL(10,2));

	INSERT INTO @tabla SELECT SUM(existencia_inicial) FROM articulo art 
	INNER JOIN articulo_existencia artex ON art.id_articulo=artex.id_articulo 
	WHERE id_almacen=@id_almacen AND art.id_articulo=@id_articulo;

	INSERT INTO @tabla SELECT CASE WHEN es_entrada=1 THEN cantidad ELSE cantidad*(-1) END
	FROM movimiento_almacen ma INNER JOIN movimiento_almacen_detalle mad ON 
	ma.id_movimiento_almacen=mad.id_movimiento_almacen INNER JOIN movimiento_almacen_tipo mat ON 
	ma.id_movimiento_almacen_tipo=mat.id_movimiento_almacen_tipo WHERE mad.id_articulo=@id_articulo AND 
	mad.id_almacen=@id_almacen ORDER BY fecha_registro ASC;

	SELECT @Valor=SUM(cantidad) FROM @tabla;

    RETURN @Valor;
END

GO
/****** Object:  UserDefinedFunction [dbo].[funcListToTableString]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-11-25
-- Description:	Funcion para separar parametros
-- =============================================

CREATE FUNCTION [dbo].[funcListToTableString](@list as varchar(8000), @delim as varchar(10))
RETURNS @listTable table(
  Value nvarchar(12)
  )
AS
BEGIN
    --Declare helper to identify the position of the delim
    DECLARE @DelimPosition INT
    
    --Prime the loop, with an initial check for the delim
    SET @DelimPosition = CHARINDEX(@delim, @list)

    --Loop through, until we no longer find the delimiter
    WHILE @DelimPosition > 0
    BEGIN
        --Add the item to the table
        INSERT INTO @listTable(Value)
            VALUES(CAST(RTRIM(LEFT(@list, @DelimPosition - 1)) AS nvarchar(12)))
    
        --Remove the entry from the List
        SET @list = right(@list, len(@list) - @DelimPosition)

        --Perform position comparison
        SET @DelimPosition = CHARINDEX(@delim, @list)
    END

    --If we still have an entry, add it to the list
    IF len(@list) > 0
        insert into @listTable(Value)
        values(CAST(RTRIM(@list) AS nvarchar(12)))

  RETURN
END
GO
/****** Object:  Table [dbo].[agrupador_articulo]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agrupador_articulo](
	[id_agrupador_articulo] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](10) NOT NULL,
	[id_familia] [int] NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[alta] [tinyint] NOT NULL,
 CONSTRAINT [PK_agrupador_articulo] PRIMARY KEY CLUSTERED 
(
	[id_agrupador_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_agrupador_articulo_clave] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[almacen]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[almacen](
	[id_almacen] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[clave] [nvarchar](5) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[es_mayoreo] [tinyint] NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_almacen] PRIMARY KEY CLUSTERED 
(
	[id_almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_almacen_clave] UNIQUE NONCLUSTERED 
(
	[id_almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_almacen2_clave] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[anaquel]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[anaquel](
	[id_anaquel] [int] IDENTITY(1,1) NOT NULL,
	[sucursal] [varchar](2) NULL,
	[clave] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[arqueo]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arqueo](
	[id_arqueo] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[monto_sistema] [decimal](18, 4) NOT NULL,
	[monto_real] [decimal](18, 4) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[id_usuario_logueado] [int] NOT NULL,
	[id_usuario_autorizo] [int] NOT NULL,
 CONSTRAINT [PK_arqueo] PRIMARY KEY CLUSTERED 
(
	[id_arqueo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[arqueo_desglose]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arqueo_desglose](
	[id_arqueo_desglose] [int] IDENTITY(1,1) NOT NULL,
	[id_arqueo] [int] NOT NULL,
	[id_denominacion] [int] NOT NULL,
	[cantidad] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_arqueo_desglose] PRIMARY KEY CLUSTERED 
(
	[id_arqueo_desglose] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[articulo]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo](
	[id_articulo] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](10) NOT NULL,
	[codigo_barras1] [nvarchar](36) NULL,
	[clave_sat] [nvarchar](8) NOT NULL,
	[id_agrupador_articulo] [int] NULL,
	[id_linea_negocio] [int] NOT NULL,
	[id_subcategoria] [int] NOT NULL,
	[id_marca] [int] NOT NULL,
	[id_submarca] [int] NULL,
	[desc_super] [nvarchar](100) NOT NULL,
	[desc_mayoreo] [nvarchar](100) NOT NULL,
	[tipo] [nvarchar](15) NULL,
	[id_unidad_compra] [int] NOT NULL,
	[id_unidad_venta] [int] NOT NULL,
	[relacion_compra] [decimal](12, 4) NOT NULL,
	[relacion_venta] [decimal](12, 4) NOT NULL,
	[es_inventariable] [tinyint] NOT NULL,
	[id_iva_compra] [int] NOT NULL,
	[id_iva_venta] [int] NOT NULL,
	[id_ieps_compra] [int] NULL,
	[id_ieps_venta] [int] NULL,
	[costo_ultimo] [decimal](18, 6) NULL,
	[costo_promedio] [decimal](18, 6) NULL,
	[fecha_alta] [datetime] NOT NULL,
	[fecha_ultima_modificacion] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
	[id_articulo_adicionales] [int] NOT NULL,
	[codigo_barras2] [nvarchar](36) NULL,
	[costo_acumulado] [decimal](18, 6) NULL DEFAULT ((0)),
	[fecha_ultima_compra] [datetime] NULL,
	[fecha_ultima_venta] [datetime] NULL,
	[total_entradas] [int] NULL,
	[total_salidas] [int] NULL,
	[id_familia] [int] NULL,
 CONSTRAINT [PK_articulo] PRIMARY KEY CLUSTERED 
(
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_articulo_clave] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[articulo_adicionales]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo_adicionales](
	[id_articulo_adicionales] [int] IDENTITY(1,1) NOT NULL,
	[vende_sin_existencia] [tinyint] NOT NULL CONSTRAINT [DF_articulo_adicionales_vende_sin_existencia]  DEFAULT ((0)),
	[cm_super_ancho] [int] NOT NULL CONSTRAINT [DF_articulo_adicionales_cm_super_ancho]  DEFAULT ((0)),
	[cm_super_alto] [int] NOT NULL CONSTRAINT [DF_articulo_adicionales_cm_super_alto]  DEFAULT ((0)),
	[cm_super_largo] [int] NOT NULL CONSTRAINT [DF_articulo_adicionales_cm_super_largo]  DEFAULT ((0)),
	[cm_super_peso] [int] NOT NULL CONSTRAINT [DF_articulo_adicionales_cm_super_peso]  DEFAULT ((0)),
	[cm_mayoreo_ancho] [int] NOT NULL CONSTRAINT [DF_articulo_adicionales_cm_mayoreo_ancho]  DEFAULT ((0)),
	[cm_mayoreo_alto] [int] NOT NULL CONSTRAINT [DF_articulo_adicionales_cm_mayoreo_alto]  DEFAULT ((0)),
	[cm_mayoreo_largo] [int] NOT NULL CONSTRAINT [DF_articulo_adicionales_cm_mayoreo_largo]  DEFAULT ((0)),
	[cm_mayoreo_peso] [int] NOT NULL CONSTRAINT [DF_articulo_adicionales_cm_mayoreo_peso]  DEFAULT ((0)),
	[pide_receta] [tinyint] NOT NULL CONSTRAINT [DF_articulo_adicionales_pide_receta]  DEFAULT ((0)),
	[sobre_pedido] [tinyint] NOT NULL CONSTRAINT [DF_articulo_adicionales_sobre_pedido]  DEFAULT ((0)),
	[descontinuado] [tinyint] NOT NULL CONSTRAINT [DF_articulo_adicionales_descontinuado]  DEFAULT ((0)),
	[margen_precio_sugerido] [decimal](5, 2) NULL CONSTRAINT [DF_articulo_adicionales_margen_precio_sugerido]  DEFAULT ((20.0)),
	[utilidad_minima] [decimal](5, 2) NULL,
	[es_recarga] [bit] NULL,
 CONSTRAINT [PK_articulo_adicionales] PRIMARY KEY CLUSTERED 
(
	[id_articulo_adicionales] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[articulo_equivalente]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo_equivalente](
	[id_articulo_equivalente] [int] IDENTITY(1,1) NOT NULL,
	[id_articulo] [int] NOT NULL,
	[codigo_barras] [nvarchar](36) NOT NULL,
	[cantidad_venta] [decimal](18, 2) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_articulo_equivalente] PRIMARY KEY CLUSTERED 
(
	[id_articulo_equivalente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[articulo_existencia]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo_existencia](
	[id_articulo_existencia] [int] IDENTITY(1,1) NOT NULL,
	[id_articulo] [int] NOT NULL,
	[id_almacen] [int] NOT NULL,
	[total_entradas] [int] NOT NULL CONSTRAINT [DF_articulo_existencia_total_entradas]  DEFAULT ((0)),
	[total_salidas] [int] NOT NULL CONSTRAINT [DF_articulo_existencia_total_salidas]  DEFAULT ((0)),
	[existencia_actual] [decimal](18, 4) NULL,
	[existencia_apartado] [decimal](18, 4) NULL,
	[existencia_venta] [decimal](18, 4) NULL,
	[ubicacion] [nvarchar](10) NULL,
	[stock_minimo] [decimal](18, 4) NOT NULL,
	[stock_maximo] [decimal](18, 4) NOT NULL,
	[existencia_inicial] [decimal](18, 4) NULL,
 CONSTRAINT [PK_articulo_existencia_adicionales] PRIMARY KEY CLUSTERED 
(
	[id_articulo_existencia] ASC,
	[id_articulo] ASC,
	[id_almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[articulo_oferta]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo_oferta](
	[id_articulo_oferta] [int] IDENTITY(1,1) NOT NULL,
	[id_articulo] [int] NULL,
	[no_orden] [int] NULL,
	[margen_utilidad] [decimal](18, 2) NULL,
	[precio_venta] [decimal](18, 6) NULL,
	[cantidad_min] [decimal](18, 4) NOT NULL,
	[utilidad] [decimal](18, 6) NULL,
	[fecha_inicio] [datetime] NULL,
	[fecha_termino] [datetime] NULL,
	[fecha_modificacion] [datetime] NULL,
	[fecha_alta] [datetime] NULL,
	[activo] [tinyint] NOT NULL,
	[cantidad_max] [decimal](18, 4) NOT NULL,
	[id_oferta_tipo] [int] NOT NULL,
 CONSTRAINT [PK_articulo_oferta] PRIMARY KEY CLUSTERED 
(
	[id_articulo_oferta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[articulo_precio]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo_precio](
	[id_articulo_precio] [int] IDENTITY(1,1) NOT NULL,
	[id_articulo] [int] NOT NULL,
	[no_orden] [int] NOT NULL,
	[margen_utilidad] [decimal](18, 2) NOT NULL,
	[precio_venta] [decimal](18, 6) NULL,
	[cantidad] [decimal](18, 4) NULL,
	[utilidad] [decimal](18, 6) NULL,
	[fecha_modificacion] [datetime] NULL,
	[fecha_alta] [datetime] NOT NULL,
 CONSTRAINT [PK_articulo_precio] PRIMARY KEY CLUSTERED 
(
	[id_articulo_precio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[articulo_proveedor]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo_proveedor](
	[id_articulo_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[id_articulo] [int] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[prioridad] [int] NOT NULL,
	[costo] [decimal](18, 6) NULL,
	[fecha_alta] [datetime] NOT NULL,
 CONSTRAINT [PK_articulo_proveedor] PRIMARY KEY CLUSTERED 
(
	[id_articulo_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[articulo_sucursal_mayoreo]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[articulo_sucursal_mayoreo](
	[id_articulo_sucursal_mayoreo] [int] IDENTITY(1,1) NOT NULL,
	[id_articulo] [int] NOT NULL,
	[id_sucursal] [int] NOT NULL,
 CONSTRAINT [PK_art_suc_may] PRIMARY KEY CLUSTERED 
(
	[id_articulo_sucursal_mayoreo] ASC,
	[id_articulo] ASC,
	[id_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auditoria]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[auditoria](
	[id_auditoria] [int] IDENTITY(1,1) NOT NULL,
	[id_almacen] [int] NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[id_auditoria_tipo] [int] NOT NULL,
	[id_inicio] [int] NOT NULL,
	[fecha_inicio] [datetime] NOT NULL,
	[id_conto] [int] NULL,
	[fecha_conteo] [datetime] NULL,
	[id_aplico] [int] NULL,
	[fecha_aplico] [datetime] NULL,
	[id_auditoria_estatus] [int] NOT NULL,
	[clave_sincronizacion] [varchar](20) NULL,
	[familias] [text] NULL,
	[almacenes] [text] NULL,
 CONSTRAINT [PK_auditoria] PRIMARY KEY CLUSTERED 
(
	[id_auditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[auditoria_detalle]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auditoria_detalle](
	[id_auditoria_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_auditoria] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
	[ex_actual_inicio] [decimal](18, 4) NOT NULL,
	[ex_apartado_inicio] [decimal](18, 4) NOT NULL,
	[ex_venta_inicio] [decimal](18, 4) NOT NULL,
	[ex_total_inicio] [decimal](18, 4) NOT NULL,
	[ex_actual_conteo] [decimal](18, 4) NULL,
	[ex_apartado_conteo] [decimal](18, 4) NULL,
	[ex_venta_conteo] [decimal](18, 4) NULL,
	[ex_total_conteo] [decimal](18, 4) NULL,
	[ex_auditoria] [decimal](18, 4) NULL,
	[diferencia] [decimal](18, 4) NULL,
	[id_almacen] [int] NULL,
	[no_conteos] [smallint] NULL,
	[estatus] [int] NULL,
	[activo] [tinyint] NULL,
 CONSTRAINT [PK_auditoria_detalle] PRIMARY KEY CLUSTERED 
(
	[id_auditoria_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auditoria_estatus]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auditoria_estatus](
	[id_auditoria_estatus] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_auditoria_estatus] PRIMARY KEY CLUSTERED 
(
	[id_auditoria_estatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[auditoria_tipo]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auditoria_tipo](
	[id_auditoria_tipo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_auditoria_tipo] PRIMARY KEY CLUSTERED 
(
	[id_auditoria_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[autorizacion]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autorizacion](
	[id_autorizacion] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_perfil_autorizo] [int] NULL,
	[id_perf_mod_perm] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[fecha_autorizacion] [datetime] NOT NULL,
	[por_huella] [bit] NULL,
 CONSTRAINT [PK_autorizacion] PRIMARY KEY CLUSTERED 
(
	[id_autorizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[banco]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[banco](
	[id_banco] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[en_punto_venta] [tinyint] NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_banco] PRIMARY KEY CLUSTERED 
(
	[id_banco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_banco_descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bitacora_impresion]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora_impresion](
	[id_bitacora_impresion] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_modulo] [int] NOT NULL,
	[referencia] [nvarchar](20) NULL,
	[contador] [int] NOT NULL DEFAULT ((0)),
	[fecha] [datetime] NOT NULL,
 CONSTRAINT [PK_bitacora_impresion] PRIMARY KEY CLUSTERED 
(
	[id_bitacora_impresion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[caja]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caja](
	[id_caja] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_almacen] [int] NOT NULL,
	[no_caja] [int] NOT NULL,
	[nombre] [nvarchar](15) NOT NULL,
	[habilitada] [tinyint] NOT NULL,
	[en_uso_pv] [tinyint] NOT NULL,
	[folio_retiro_actual] [nvarchar](12) NOT NULL CONSTRAINT [DF_caja_folio_dia_retiro_actual]  DEFAULT ('0'),
	[folio_corte_actual] [nvarchar](12) NOT NULL CONSTRAINT [DF_caja_folio_corte_actual]  DEFAULT ('0'),
	[folio_ticket_actual] [nvarchar](12) NOT NULL CONSTRAINT [DF_caja_folio_ticket_actual]  DEFAULT ('0'),
	[folio_factura_actual] [nvarchar](40) NULL CONSTRAINT [DF_caja_folio_factura_actual]  DEFAULT ('0'),
	[folio_cotizacion_actual] [nvarchar](12) NOT NULL CONSTRAINT [DF_caja_folio_cotizacion_actual]  DEFAULT ('0'),
	[folio_dev_cli_actual] [nvarchar](12) NOT NULL CONSTRAINT [DF_caja_folio_dev_cli_actual]  DEFAULT ('0'),
	[folio_compra_actual] [nvarchar](12) NOT NULL CONSTRAINT [DF_caja_folio_compra_actual]  DEFAULT ('0'),
	[folio_dev_prov_actual] [nvarchar](12) NOT NULL CONSTRAINT [DF_caja_folio_dev_prov_actual]  DEFAULT ('0'),
	[folio_aju_ent_actual] [nvarchar](12) NOT NULL CONSTRAINT [DF_caja_folio_aju_ent_actual]  DEFAULT ('0'),
	[folio_aju_sal_actual] [nvarchar](12) NOT NULL CONSTRAINT [DF_caja_folio_aju_sal_actual]  DEFAULT ('0'),
	[folio_trans_ent_actual] [nvarchar](12) NOT NULL CONSTRAINT [DF_caja_folio_trans_ent_actual]  DEFAULT ('0'),
	[folio_trans_sal_actual] [nvarchar](12) NOT NULL CONSTRAINT [DF_caja_folio_trans_sal_actual]  DEFAULT ('0'),
	[folio_trans_alm_ent_actual] [nvarchar](12) NOT NULL CONSTRAINT [DF_caja_folio_trans_inter_ent_actual]  DEFAULT ('0'),
	[folio_trans_alm_sal_actual] [nvarchar](12) NOT NULL CONSTRAINT [DF_caja_folio_trans_inter_sal_actual]  DEFAULT ('0'),
	[folio_cons_int_actual] [nvarchar](40) NULL CONSTRAINT [DF_caja_folio_cons_int_actual]  DEFAULT ('0'),
	[folio_gastos_actual] [nvarchar](12) NOT NULL CONSTRAINT [DF_caja_folio_gastos_actual]  DEFAULT ('0'),
	[fecha_alta] [datetime] NOT NULL,
	[ultimo_acceso] [datetime] NULL,
	[activo] [tinyint] NOT NULL,
	[id_tipo_caja] [int] NOT NULL,
	[sesion_abierta] [tinyint] NOT NULL CONSTRAINT [DEFAULT_CAJA_SESION]  DEFAULT ((0)),
 CONSTRAINT [PK_caja] PRIMARY KEY CLUSTERED 
(
	[id_caja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[categoria]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](10) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_categoria_clave] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_categoria_descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cierre]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cierre](
	[id_cierre] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[id_movimiento_inicial] [int] NULL,
	[id_movimiento_final] [int] NULL,
	[folio_inicial] [nvarchar](12) NULL,
	[folio_final] [nvarchar](12) NULL,
	[fecha_inicio] [datetime] NULL,
	[fecha_final] [datetime] NULL,
	[fecha_corte] [datetime] NOT NULL,
	[id_usuario_logueado] [int] NOT NULL,
	[id_usuario_autorizo] [int] NOT NULL,
	[dotacion_inicial] [decimal](18, 4) NOT NULL,
	[total_incrementos] [decimal](18, 4) NOT NULL,
	[total_retiros] [decimal](18, 4) NOT NULL,
	[total_cambio] [decimal](18, 4) NOT NULL,
	[total_gastos] [decimal](18, 4) NOT NULL,
	[total_efec_caja] [decimal](18, 4) NOT NULL,
	[total_otras_formas_pago] [decimal](18, 4) NOT NULL,
	[total_venta] [decimal](18, 4) NOT NULL,
	[total_devoluciones] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_cierre] PRIMARY KEY CLUSTERED 
(
	[id_cierre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cliente]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[observaciones] [nvarchar](255) NULL,
	[id_forma_pago] [int] NULL,
	[telefono1] [nvarchar](20) NULL,
	[telefono2] [nvarchar](20) NULL,
	[puntos_acumulados] [int] NULL,
	[puntos_cobrados] [int] NULL,
	[saldo_favor] [decimal](18, 2) NULL,
	[ultima_compra] [datetime] NULL,
	[fecha_alta] [datetime] NOT NULL,
	[id_datos_facturacion] [int] NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[colonia]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[colonia](
	[id_colonia] [int] IDENTITY(1,1) NOT NULL,
	[id_cp] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[clave_sat] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_colonia] PRIMARY KEY CLUSTERED 
(
	[id_colonia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[configuracion_facturacion]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[configuracion_facturacion](
	[id_configuracion_facturacion] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[rfc] [nvarchar](13) NULL,
	[razon_social] [nvarchar](100) NOT NULL,
	[regimen] [nvarchar](3) NOT NULL,
	[ruta_file_cer] [nvarchar](100) NOT NULL,
	[ruta_file_key] [nvarchar](100) NOT NULL,
	[password_key] [nvarchar](50) NULL,
	[ruta_guardado] [nvarchar](100) NULL,
	[usuario] [nvarchar](50) NULL,
	[contrasena] [nvarchar](50) NULL,
	[id_cliente_global] [int] NOT NULL,
	[url_correo] [nvarchar](100) NULL,
 CONSTRAINT [PK_configuracion_facturacion] PRIMARY KEY CLUSTERED 
(
	[id_configuracion_facturacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[configuracion_otronombre]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[configuracion_otronombre](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[clave] [varchar](100) NULL,
	[valor] [varchar](100) NULL,
	[descripcion] [varchar](250) NULL,
	[estatus] [smallint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[configuracion_seguridad]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[configuracion_seguridad](
	[id_configuracion_seguridad] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NULL,
	[monitoreo_activo] [bit] NULL,
	[forzar_modulos] [bit] NULL,
	[formato_monitoreo] [nvarchar](50) NULL,
	[max_dias_almacenados] [int] NULL,
	[ultima_modificacion] [datetime] NULL,
	[modificado_por] [int] NULL,
 CONSTRAINT [PK_configuracion_seguridad] PRIMARY KEY CLUSTERED 
(
	[id_configuracion_seguridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[consolidacion]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[consolidacion](
	[id_consolidacion] [int] IDENTITY(1,1) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[folio] [nvarchar](20) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_facturacion] [int] NULL,
	[consecutivo] [int] NOT NULL,
	[desde] [datetime] NOT NULL,
	[hasta] [datetime] NOT NULL,
	[id_autorizo] [int] NOT NULL,
	[no_mov_consolidados] [int] NULL,
 CONSTRAINT [PK_consolidacion] PRIMARY KEY CLUSTERED 
(
	[id_consolidacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cotizacion]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cotizacion](
	[id_cotizacion] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[id_cliente] [int] NULL,
	[nombre_cliente] [nvarchar](50) NOT NULL,
	[observaciones] [nvarchar](100) NULL,
	[subtotal] [decimal](18, 2) NOT NULL,
	[descuento] [decimal](18, 2) NOT NULL,
	[total_neto] [decimal](18, 2) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_venta] [int] NULL,
	[cotizacion_apartada] [bit] NULL CONSTRAINT [valor_por_default_cotizacion_apartada]  DEFAULT ((1)),
 CONSTRAINT [PK_cotizacion] PRIMARY KEY CLUSTERED 
(
	[id_cotizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cotizacion_detalle]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cotizacion_detalle](
	[id_cotizacion_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_cotizacion] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
	[consecutivo] [int] NOT NULL,
	[cantidad] [decimal](18, 2) NOT NULL,
	[id_unidad_medida] [int] NOT NULL,
	[id_almacen] [int] NOT NULL,
 CONSTRAINT [PK_cotizacion_detalle] PRIMARY KEY CLUSTERED 
(
	[id_cotizacion_detalle] ASC,
	[id_cotizacion] ASC,
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cp]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cp](
	[id_cp] [int] IDENTITY(1,1) NOT NULL,
	[id_estado] [int] NOT NULL,
	[id_municipio] [int] NULL,
	[nombre] [nchar](10) NOT NULL,
	[clave_sat] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_cp] PRIMARY KEY CLUSTERED 
(
	[id_cp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_nombre] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[datos_facturacion]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[datos_facturacion](
	[id_datos_facturacion] [int] IDENTITY(1,1) NOT NULL,
	[rfc] [nvarchar](13) NOT NULL,
	[razon_social] [nvarchar](100) NOT NULL,
	[id_uso_cfdi] [int] NULL,
	[calle] [nvarchar](50) NULL,
	[no_exterior] [nvarchar](6) NULL,
	[no_interior] [nvarchar](6) NULL,
	[id_cp] [int] NOT NULL,
	[id_estado] [int] NOT NULL,
	[id_municipio] [int] NOT NULL,
	[id_colonia] [int] NOT NULL,
	[email] [nvarchar](200) NULL,
 CONSTRAINT [PK_datos_facturacion] PRIMARY KEY CLUSTERED 
(
	[id_datos_facturacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_datos_facturacion_rfc] UNIQUE NONCLUSTERED 
(
	[rfc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[denominacion]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[denominacion](
	[id_denominacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[monto] [int] NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_denominacion] PRIMARY KEY CLUSTERED 
(
	[id_denominacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_denominacion_descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_denominacion_monto] UNIQUE NONCLUSTERED 
(
	[monto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dinamica]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dinamica](
	[id_dinamica] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[inicio_vigencia] [datetime] NULL,
	[fin_vigencia] [datetime] NULL,
	[nombre_premio] [nvarchar](100) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_dinamica] PRIMARY KEY CLUSTERED 
(
	[id_dinamica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DRevisa]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DRevisa](
	[Id] [int] NULL,
	[Rubro] [varchar](50) NULL,
	[Punto] [smallint] NULL,
	[Valor] [smallint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estado]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado](
	[id_estado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[abreviacion] [nvarchar](5) NOT NULL,
	[clave_sat] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_estado] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_estado_clave] UNIQUE NONCLUSTERED 
(
	[clave_sat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_estado_nombre] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[evmoni]    Script Date: 10/09/2020 08:19:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evmoni](
	[id_evmoni] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[id_modulo] [int] NOT NULL,
	[id_nivel_seguridad] [int] NOT NULL,
	[intervalo] [int] NOT NULL,
	[id_usuario_logueado] [int] NOT NULL,
	[fecha_inicio] [datetime] NOT NULL,
	[fecha_fin] [datetime] NULL,
 CONSTRAINT [PK_evmoni] PRIMARY KEY CLUSTERED 
(
	[id_evmoni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[evmoni_detalle]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[evmoni_detalle](
	[id_evmoni_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_evmoni] [int] NOT NULL,
	[evmoni] [varbinary](max) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [PK_evmoni_detalle] PRIMARY KEY CLUSTERED 
(
	[id_evmoni_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[facturacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[facturacion](
	[id_facturacion] [int] IDENTITY(1,1) NOT NULL,
	[folio_fiscal] [nvarchar](40) NULL,
	[fecha_generado] [datetime] NULL,
	[fecha_cancelado] [datetime] NULL,
	[fecha_devuelto] [datetime] NULL,
	[subtotal] [decimal](18, 4) NULL,
	[iva] [decimal](18, 4) NULL,
	[ieps] [decimal](18, 4) NULL,
	[descuento] [decimal](18, 4) NULL,
	[total] [decimal](18, 4) NULL,
	[id_cliente] [int] NOT NULL,
	[error] [nvarchar](150) NULL,
	[id_usuario] [int] NOT NULL,
	[id_uso_cfdi] [int] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_facturacion] PRIMARY KEY CLUSTERED 
(
	[id_facturacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[familia]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[familia](
	[id_familia] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](10) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_familia] PRIMARY KEY CLUSTERED 
(
	[id_familia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_familia_clave] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_familia_descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[forma_pago]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forma_pago](
	[id_forma_pago] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[referencia] [tinyint] NOT NULL,
	[da_cambio] [tinyint] NOT NULL CONSTRAINT [DF_forma_pago_da_cambio]  DEFAULT ((0)),
	[da_cambio_cualquier_fp] [tinyint] NOT NULL CONSTRAINT [DF_forma_pago_da_cambio_cualquier_fp]  DEFAULT ((0)),
	[repetir_forma] [tinyint] NOT NULL,
	[usada_en_punto_venta] [tinyint] NOT NULL CONSTRAINT [DF_forma_pago_usada_en_punto_venta]  DEFAULT ((0)),
	[pide_banco] [tinyint] NOT NULL CONSTRAINT [DF_forma_pago_pide_banco]  DEFAULT ((0)),
	[es_tarjeta] [tinyint] NOT NULL,
	[es_credito] [tinyint] NOT NULL CONSTRAINT [DF_forma_pago_es_credito]  DEFAULT ((0)),
	[enlace_banco] [tinyint] NOT NULL,
	[porcentaje_cargo] [decimal](4, 2) NULL,
	[clave_sat] [nvarchar](10) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
	[abre_cajon] [bit] NOT NULL,
 CONSTRAINT [PK_forma_pago] PRIMARY KEY CLUSTERED 
(
	[id_forma_pago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_forma_pago_descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[impuesto]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[impuesto](
	[id_impuesto] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[tasa] [decimal](5, 2) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
	[clave_sat] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_impuesto] PRIMARY KEY CLUSTERED 
(
	[id_impuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_impuesto_descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[linea_negocio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[linea_negocio](
	[id_linea_negocio] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](10) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_linea_negocio] PRIMARY KEY CLUSTERED 
(
	[id_linea_negocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_linea_negocio_clave] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_linea_negocio_descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[marca]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marca](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](10) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_marca] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_marca_clave] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_marca_descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mensajes]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mensajes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mensaje] [varchar](400) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[migrador]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[migrador](
	[fecha_migracion] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[modulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modulo](
	[id_modulo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](200) NULL,
	[fecha_alta] [datetime] NOT NULL,
 CONSTRAINT [PK_modulo] PRIMARY KEY CLUSTERED 
(
	[id_modulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_modulo_nombre] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[modulo_nivel_seguridad]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modulo_nivel_seguridad](
	[id_nivel_seguridad] [int] NOT NULL,
	[id_modulo] [int] NOT NULL,
	[id_sucursal] [int] NOT NULL,
 CONSTRAINT [PK_modulo_nivel_seguridad] PRIMARY KEY NONCLUSTERED 
(
	[id_nivel_seguridad] ASC,
	[id_modulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[modulo_permiso]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modulo_permiso](
	[id_modulo_permiso] [int] IDENTITY(1,1) NOT NULL,
	[id_modulo] [int] NULL,
	[id_permiso] [int] NULL,
 CONSTRAINT [PK_modulo_permiso] PRIMARY KEY CLUSTERED 
(
	[id_modulo_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[movimiento_almacen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento_almacen](
	[id_movimiento_almacen] [int] IDENTITY(1,1) NOT NULL,
	[id_movimiento_almacen_tipo] [int] NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_almacen] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[folio] [nvarchar](12) NULL,
	[observaciones] [nvarchar](100) NULL,
	[subtotal] [decimal](18, 2) NOT NULL,
	[descuento] [decimal](18, 2) NOT NULL,
	[total_neto] [decimal](18, 2) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[id_usuario_logueado] [int] NOT NULL,
	[id_usuario_autorizo] [int] NOT NULL,
	[id_facturacion] [int] NULL,
	[id_referencia] [nvarchar](max) NULL,
	[referencia] [nvarchar](max) NULL,
	[codigo_autorizacion] [nvarchar](10) NULL,
	[folio_fiscal] [nvarchar](50) NULL,
	[id_sucursal_origen] [int] NULL,
	[id_sucursal_destino] [int] NULL,
	[id_almacen_origen] [int] NULL,
	[id_proveedor] [int] NULL,
	[id_cliente] [int] NULL,
	[id_consolidacion] [int] NULL,
	[fecha_cancelado] [datetime] NULL,
	[devuelto] [tinyint] NULL,
	[consecutivo] [int] NOT NULL,
	[total_iva] [decimal](18, 2) NOT NULL,
	[total_ieps] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_movimiento_almacen] PRIMARY KEY CLUSTERED 
(
	[id_movimiento_almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_movimiento_almacen_folio] UNIQUE NONCLUSTERED 
(
	[folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[movimiento_almacen_detalle]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento_almacen_detalle](
	[id_movimiento_almacen_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_movimiento_almacen] [int] NOT NULL,
	[id_almacen] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
	[consecutivo] [int] NOT NULL,
	[cantidad] [decimal](18, 2) NULL,
	[costo_unitario] [decimal](18, 6) NULL,
	[id_unidad_medida] [int] NOT NULL,
	[descuento] [decimal](18, 6) NOT NULL,
	[importe] [decimal](18, 6) NOT NULL,
	[fecha_devuelto] [datetime] NULL,
	[ingresado] [tinyint] NULL,
	[id_referencia_detalle] [int] NULL,
	[existencia_al_momento] [decimal](18, 2) NOT NULL,
	[subtotal] [decimal](18, 6) NOT NULL,
	[iva] [decimal](18, 6) NOT NULL,
	[ieps] [decimal](18, 6) NOT NULL,
	[es_mayoreo] [bit] NOT NULL,
	[costo] [decimal](18, 6) NULL,
	[tasa_iva] [decimal](5, 2) NULL,
	[tasa_ieps] [decimal](5, 2) NULL,
 CONSTRAINT [PK_movimiento_almacen_detalle] PRIMARY KEY CLUSTERED 
(
	[id_movimiento_almacen_detalle] ASC,
	[id_movimiento_almacen] ASC,
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[movimiento_almacen_tipo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento_almacen_tipo](
	[id_movimiento_almacen_tipo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[clave] [nvarchar](2) NOT NULL,
	[es_entrada] [tinyint] NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
	[autorizacion] [tinyint] NULL,
 CONSTRAINT [PK_movimiento_almacen_tipo] PRIMARY KEY CLUSTERED 
(
	[id_movimiento_almacen_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_movimiento_almacen_tipo_clave] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_movimiento_almacen_tipo_nombre] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[movimiento_caja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento_caja](
	[id_movimiento_caja] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[id_forma_pago] [int] NOT NULL,
	[id_movimiento_caja_tipo] [int] NOT NULL,
	[id_movimiento_caja_concepto] [int] NOT NULL,
	[importe_total] [decimal](18, 2) NOT NULL,
	[dotacion_inicial] [bit] NOT NULL,
	[folio] [nvarchar](12) NOT NULL,
	[id_tira_banco] [int] NULL,
	[folio_venta] [nvarchar](12) NULL,
	[id_venta] [int] NULL,
	[id_cierre] [int] NULL,
	[id_consolidación] [int] NULL,
	[referencia] [nvarchar](20) NULL,
	[id_banco] [int] NULL,
	[codigo_autorizacion] [nvarchar](10) NULL,
	[observaciones] [nvarchar](50) NULL,
	[fecha_registro] [datetime] NOT NULL,
	[id_usuario_logueado] [int] NOT NULL,
	[id_usuario_autorizo] [int] NOT NULL,
	[consecutivo] [int] NOT NULL,
 CONSTRAINT [PK_movimiento_caja] PRIMARY KEY CLUSTERED 
(
	[id_movimiento_caja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_movimiento_caja_folio] UNIQUE NONCLUSTERED 
(
	[folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[movimiento_caja_concepto]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento_caja_concepto](
	[id_movimiento_caja_concepto] [int] IDENTITY(1,1) NOT NULL,
	[id_movimiento_caja_tipo] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[aplicar_a_banco] [bit] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_movimiento_caja_concepto] PRIMARY KEY CLUSTERED 
(
	[id_movimiento_caja_concepto] ASC,
	[id_movimiento_caja_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_movimiento_caja_concepto] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[movimiento_caja_desglose]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento_caja_desglose](
	[id_movimiento_caja_desglose] [int] IDENTITY(1,1) NOT NULL,
	[id_movimiento_caja] [int] NOT NULL,
	[id_denominacion] [int] NOT NULL,
	[cantidad] [numeric](20, 2) NOT NULL,
 CONSTRAINT [PK_movimiento_caja_desglose] PRIMARY KEY CLUSTERED 
(
	[id_movimiento_caja_desglose] ASC,
	[id_movimiento_caja] ASC,
	[id_denominacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[movimiento_caja_tipo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento_caja_tipo](
	[id_movimiento_caja_tipo] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
	[es_entrada] [int] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[activo] [bit] NOT NULL,
	[clave] [nvarchar](2) NULL,
 CONSTRAINT [PK_movimiento_caja_tipo] PRIMARY KEY CLUSTERED 
(
	[id_movimiento_caja_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_movimiento_caja_tipo] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MRevisa]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MRevisa](
	[Id] [int] NULL,
	[Fecha] [smalldatetime] NULL,
	[CveSuc] [char](2) NULL,
	[Reviso] [varchar](20) NULL,
	[Nivel] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[municipio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[municipio](
	[id_municipio] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[id_estado] [int] NOT NULL,
	[clave_sat] [nvarchar](3) NOT NULL,
 CONSTRAINT [PK_municipio] PRIMARY KEY CLUSTERED 
(
	[id_municipio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nivel_seguridad]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nivel_seguridad](
	[id_nivel_seguridad] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[intervalo_toma] [int] NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_nivel_seguridad] PRIMARY KEY CLUSTERED 
(
	[id_nivel_seguridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nota_credito]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nota_credito](
	[id_nota] [int] IDENTITY(1,1) NOT NULL,
	[id_facturacion] [int] NOT NULL,
	[id_relacion_cfdi] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[fecha_generado] [datetime] NOT NULL,
	[folio_fiscal] [varchar](150) NOT NULL,
	[subtotal] [numeric](20, 2) NOT NULL,
	[iva] [numeric](20, 2) NOT NULL,
	[ieps] [numeric](20, 2) NOT NULL,
	[descuento] [numeric](20, 2) NOT NULL,
	[total] [numeric](20, 2) NOT NULL,
	[forma_pago] [varchar](50) NOT NULL,
	[forma_pago_sat] [varchar](5) NOT NULL,
	[estado] [int] NOT NULL,
	[comentario] [varchar](300) NULL,
 CONSTRAINT [PK_nota_credito] PRIMARY KEY CLUSTERED 
(
	[id_nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nota_credito_detalle]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nota_credito_detalle](
	[id_nota_credito_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_nota] [int] NOT NULL,
	[id_movimiento_almacen_detalle] [int] NOT NULL,
	[clave] [varchar](10) NOT NULL,
	[consecutivo] [int] NOT NULL,
	[folio] [varchar](50) NOT NULL,
 CONSTRAINT [PK_nota_credito_detalle] PRIMARY KEY CLUSTERED 
(
	[id_nota_credito_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[oferta_tipo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[oferta_tipo](
	[id_oferta_tipo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[activo] [bit] NOT NULL,
 CONSTRAINT [PK_oferta_tipo] PRIMARY KEY CLUSTERED 
(
	[id_oferta_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orden_compra]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_compra](
	[id_orden_compra] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[folio] [nvarchar](12) NULL,
	[observaciones] [nvarchar](100) NULL,
	[subtotal] [decimal](18, 6) NOT NULL,
	[descuento] [decimal](18, 6) NOT NULL,
	[total_neto] [decimal](18, 6) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[fecha_cancelado] [datetime] NULL,
	[fecha_fin_vigencia] [datetime] NULL,
	[id_promovimiento_almacen_estado] [int] NOT NULL,
	[id_compra] [int] NULL,
 CONSTRAINT [PK_orden_compra] PRIMARY KEY CLUSTERED 
(
	[id_orden_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_orden_compra_folio] UNIQUE NONCLUSTERED 
(
	[folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orden_compra_detalle]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orden_compra_detalle](
	[id_orden_compra_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_orden_compra] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
	[consecutivo] [int] NOT NULL,
	[cantidad] [decimal](18, 2) NULL,
	[costo_unitario] [decimal](18, 6) NOT NULL,
	[id_unidad_medida] [int] NOT NULL,
	[descuento] [decimal](18, 6) NOT NULL,
	[importe] [decimal](18, 6) NOT NULL,
	[ingresado] [bit] NOT NULL,
	[id_compra] [int] NULL,
	[es_mayoreo] [bit] NOT NULL,
 CONSTRAINT [PK_orden_compra_detalle] PRIMARY KEY CLUSTERED 
(
	[id_orden_compra_detalle] ASC,
	[id_orden_compra] ASC,
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[parcial]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[parcial](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Auditoria] [int] NULL,
	[Almacen] [smallint] NULL,
	[Articulo] [smallint] NULL,
	[Anaquel] [smallint] NULL,
	[Cantidad] [real] NULL,
	[Estatus] [smallint] NULL,
	[Registro] [varchar](5) NULL,
	[FRegistro] [smalldatetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[parcialanaquel]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[parcialanaquel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Auditoria] [int] NULL,
	[Registro] [int] NULL,
	[Diferencia] [real] NULL,
	[Anaquel] [int] NULL,
	[Anterior] [real] NULL,
	[Actual] [real] NULL,
	[Tipo] [int] NULL,
	[Longitud] [varchar](50) NULL,
	[Latitud] [varchar](50) NULL,
	[FRegistro] [varchar](50) NULL,
	[Usuario] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[perfil]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfil](
	[id_perfil] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
 CONSTRAINT [PK_perfil] PRIMARY KEY CLUSTERED 
(
	[id_perfil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_perfil_nombre] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[perfil_modulo_permiso]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfil_modulo_permiso](
	[id_perf_mod_perm] [int] IDENTITY(1,1) NOT NULL,
	[id_perfil] [int] NOT NULL,
	[id_modulo] [int] NOT NULL,
	[id_permiso] [int] NOT NULL,
	[id_modulo_permiso] [int] NOT NULL,
 CONSTRAINT [PK_perf_mod_perm] PRIMARY KEY CLUSTERED 
(
	[id_perf_mod_perm] ASC,
	[id_perfil] ASC,
	[id_modulo] ASC,
	[id_permiso] ASC,
	[id_modulo_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[permiso]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permiso](
	[id_permiso] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_permiso] PRIMARY KEY CLUSTERED 
(
	[id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_permiso_nombre] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[precio_agrupador]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[precio_agrupador](
	[id_precio_agrupador] [int] IDENTITY(1,1) NOT NULL,
	[nivel_precio] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
	[id_agrupador_articulo] [int] NOT NULL,
 CONSTRAINT [PK_precio_agrupador] PRIMARY KEY CLUSTERED 
(
	[id_precio_agrupador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[premio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[premio](
	[id_premio] [int] IDENTITY(1,1) NOT NULL,
	[id_dinamica] [int] NOT NULL,
	[id_venta] [int] NOT NULL,
	[cantidad] [decimal](5, 2) NULL,
	[fecha_registro] [datetime] NULL,
 CONSTRAINT [PK_premio] PRIMARY KEY CLUSTERED 
(
	[id_premio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pretransferencia]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pretransferencia](
	[id_pretransferencia] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[folio] [nvarchar](12) NULL,
	[observaciones] [nvarchar](100) NULL,
	[subtotal] [decimal](18, 6) NOT NULL,
	[descuento] [decimal](18, 6) NOT NULL,
	[total_neto] [decimal](18, 6) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[id_sucursal_origen] [int] NOT NULL,
	[fecha_cancelado] [datetime] NULL,
	[fecha_fin_vigencia] [datetime] NULL,
	[id_transferencia_entrada] [int] NULL,
	[id_promovimiento_almacen_estado] [int] NOT NULL,
 CONSTRAINT [PK_pretransferencia] PRIMARY KEY CLUSTERED 
(
	[id_pretransferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_premovimiento_folio] UNIQUE NONCLUSTERED 
(
	[folio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pretransferencia_detalle]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pretransferencia_detalle](
	[id_pretransferencia_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_pretransferencia] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
	[consecutivo] [int] NOT NULL,
	[cantidad] [decimal](18, 2) NULL,
	[costo_unitario] [decimal](18, 6) NOT NULL,
	[id_unidad_medida] [int] NOT NULL,
	[descuento] [decimal](18, 6) NOT NULL,
	[importe] [decimal](18, 6) NOT NULL,
	[es_mayoreo] [bit] NOT NULL,
 CONSTRAINT [PK_pretransferencia_detalle] PRIMARY KEY CLUSTERED 
(
	[id_pretransferencia_detalle] ASC,
	[id_pretransferencia] ASC,
	[id_articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[producto_recargas]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto_recargas](
	[id_producto_recarga] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[info] [nvarchar](100) NOT NULL,
	[costo] [decimal](18, 4) NOT NULL,
	[monto] [int] NOT NULL,
	[opid] [int] NOT NULL,
	[regex] [nvarchar](50) NOT NULL,
	[sku] [nvarchar](50) NOT NULL,
	[stype] [int] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[clave] [nvarchar](13) NULL,
	[compania] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[promocion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promocion](
	[id_promocion] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[clave] [nvarchar](10) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[id_promocion_tipo] [int] NOT NULL,
	[id_promocion_condicion] [int] NOT NULL,
	[id_promocion_aplicacion] [int] NOT NULL,
	[vigencia_inicio] [datetime] NOT NULL,
	[vigencia_fin] [datetime] NOT NULL,
	[promos_por_venta] [int] NOT NULL,
	[visible_en_pv] [tinyint] NOT NULL,
	[acumulable] [tinyint] NOT NULL,
	[limite_sucursal] [int] NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[cantidad] [decimal](18, 4) NULL,
 CONSTRAINT [PK_promocion] PRIMARY KEY CLUSTERED 
(
	[id_promocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_promocion_clave] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[promocion_aplicacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promocion_aplicacion](
	[id_promocion_aplicacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_promocion_aplicacion] PRIMARY KEY CLUSTERED 
(
	[id_promocion_aplicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_promocion_aplicacion_descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[promocion_compra]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promocion_compra](
	[id_promocion_compra] [int] IDENTITY(1,1) NOT NULL,
	[id_promocion] [int] NOT NULL,
	[id_referencia] [int] NOT NULL,
	[clave] [nvarchar](50) NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
	[cantidad] [decimal](18, 4) NULL,
	[id_unidad_medida] [int] NULL,
	[es_mayoreo] [int] NULL,
 CONSTRAINT [PK_promocion_compra] PRIMARY KEY CLUSTERED 
(
	[id_promocion_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[promocion_condicion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promocion_condicion](
	[id_promocion_condicion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_promocion_condicion] PRIMARY KEY CLUSTERED 
(
	[id_promocion_condicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_promocion_condicion_descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[promocion_imagen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promocion_imagen](
	[id_promocion_imagen] [int] IDENTITY(1,1) NOT NULL,
	[id_promocion] [int] NOT NULL,
	[imagen] [image] NULL,
	[nombre_imagen] [nvarchar](100) NULL,
 CONSTRAINT [PK_promocion_imagen] PRIMARY KEY CLUSTERED 
(
	[id_promocion_imagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[promocion_regalo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promocion_regalo](
	[id_promocion_regalo] [int] IDENTITY(1,1) NOT NULL,
	[id_promocion] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
	[cantidad] [decimal](18, 4) NULL,
	[id_unidad_medida] [int] NOT NULL,
 CONSTRAINT [PK_promocion_regalo] PRIMARY KEY CLUSTERED 
(
	[id_promocion_regalo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[promocion_tipo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promocion_tipo](
	[id_promocion_tipo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_promocion_tipo] PRIMARY KEY CLUSTERED 
(
	[id_promocion_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_promocion_tipo_descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[promocion_venta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promocion_venta](
	[id_promocion_venta] [int] IDENTITY(1,1) NOT NULL,
	[id_promocion] [int] NOT NULL,
	[id_ticket] [int] NOT NULL,
	[id_articulo_regalo] [int] NOT NULL,
	[monto_cantidad] [decimal](18, 2) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[aplicadas] [int] NULL,
 CONSTRAINT [PK_promocion_venta] PRIMARY KEY CLUSTERED 
(
	[id_promocion_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[promovimiento_almacen_estado]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promovimiento_almacen_estado](
	[id_promovimiento_almacen_estado] [int] IDENTITY(1,1) NOT NULL,
	[estado] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_promovimiento_almacen_estado] PRIMARY KEY CLUSTERED 
(
	[id_promovimiento_almacen_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[id_proveedor] [int] IDENTITY(1,1) NOT NULL,
	[clave] [nvarchar](6) NOT NULL,
	[nombre] [nvarchar](100) NOT NULL,
	[id_datos_facturacion] [int] NULL,
	[telefono] [nvarchar](18) NULL,
	[gerente_ventas] [nvarchar](50) NULL,
	[gerente_ventas_tel] [nvarchar](15) NULL,
	[responsable_trafico] [nvarchar](50) NULL,
	[responsable_trafico_tel] [nvarchar](15) NULL,
	[representante_ventas] [nvarchar](50) NULL,
	[responsable_ventas] [nvarchar](15) NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_proveedor] PRIMARY KEY CLUSTERED 
(
	[id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_proveedor_clave] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[recarga]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recarga](
	[id_recarga] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[descripcion_producto] [nvarchar](100) NOT NULL,
	[monto] [decimal](18, 2) NOT NULL,
	[telefono] [nvarchar](50) NOT NULL,
	[id_movimiento_almacen] [int] NULL,
	[folio_ticket] [nvarchar](12) NULL,
	[id_saldo_pago] [int] NULL,
	[id_estatus] [int] NULL,
	[descripcion_estatus] [nvarchar](50) NULL,
	[detalle_estatus] [nvarchar](100) NULL,
	[autorizacion] [nvarchar](50) NULL,
	[fecha] [datetime] NOT NULL,
	[id_usuario] [int] NOT NULL,
 CONSTRAINT [PK_recarga] PRIMARY KEY CLUSTERED 
(
	[id_recarga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[recarga_estatus]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recarga_estatus](
	[id_recarga_estatus] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_recarga_estatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[recargas_comp]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[recargas_comp](
	[id_comp] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_comp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[recargas_config]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recargas_config](
	[id_recargas_config] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[usuario] [nvarchar](50) NOT NULL,
	[contrasena] [nvarchar](50) NOT NULL,
	[url] [nvarchar](100) NOT NULL,
	[default] [tinyint] NULL DEFAULT ((0)),
 CONSTRAINT [PK_recargas_config] PRIMARY KEY CLUSTERED 
(
	[id_recargas_config] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[recargas_estado]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[recargas_estado](
	[id_estado] [int] NOT NULL,
	[nom] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[recargas_prods]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[recargas_prods](
	[id_prod] [int] IDENTITY(1,1) NOT NULL,
	[id_articulo] [int] NOT NULL,
	[id_comp] [int] NOT NULL,
	[nom] [varchar](150) NOT NULL,
	[sku] [varchar](100) NOT NULL,
	[monto] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_prod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[recargas_ventas]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[recargas_ventas](
	[id_recarga] [int] IDENTITY(1,1) NOT NULL,
	[id_prod] [int] NOT NULL,
	[id_movimiento_almacen] [int] NOT NULL,
	[id_estado] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[tel] [varchar](20) NOT NULL,
	[trequest_id] [varchar](200) NULL,
	[op_account] [varchar](200) NULL,
	[op_authorization] [varchar](200) NULL,
	[rcode] [int] NULL,
	[rcode_description] [varchar](200) NULL,
	[rcode_detail] [varchar](200) NULL,
	[transaction_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_recarga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[receta_venta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receta_venta](
	[id_receta_venta] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_movimiento_almacen_detalle] [int] NOT NULL,
	[id_venta] [int] NOT NULL,
	[id_articulo] [int] NOT NULL,
	[folio_receta] [nvarchar](20) NOT NULL,
	[cedula_profesional] [nvarchar](20) NOT NULL,
	[observaciones] [nvarchar](200) NULL,
	[fecha_registro] [datetime] NOT NULL,
	[id_usuario_logueado] [int] NOT NULL,
 CONSTRAINT [PK_receta_venta] PRIMARY KEY CLUSTERED 
(
	[id_receta_venta] ASC,
	[id_movimiento_almacen_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[REGFACTCOMPRAS]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[REGFACTCOMPRAS](
	[RF_IDREGI] [int] IDENTITY(1,1) NOT NULL,
	[RF_FECREG] [smalldatetime] NULL,
	[RF_RFCPRO] [varchar](20) NULL,
	[RF_FOLFIS] [varchar](36) NULL,
	[RF_IMPORT] [real] NULL,
	[RF_Registrada] [tinyint] NULL,
 CONSTRAINT [UNI_FOLIOFIS] UNIQUE NONCLUSTERED 
(
	[RF_FOLFIS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reglas_movimiento_almacen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reglas_movimiento_almacen](
	[id_reglas_movimiento_almacen] [int] IDENTITY(1,1) NOT NULL,
	[id_movimiento_almacen_tipo] [int] NOT NULL,
	[entrada_articulo] [int] NOT NULL,
	[salida_articulo] [int] NOT NULL,
	[entrada_articulo_existencia] [int] NOT NULL,
	[salida_articulo_existencia] [int] NOT NULL,
	[afecta_costo_ultimo] [bit] NOT NULL,
	[afecta_costo_promedio] [bit] NOT NULL,
	[factor] [smallint] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [PK_reglas_movimiento_almacen] PRIMARY KEY CLUSTERED 
(
	[id_reglas_movimiento_almacen] ASC,
	[id_movimiento_almacen_tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[relacion_cfdi]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relacion_cfdi](
	[id_relacion_cfdi] [int] IDENTITY(1,1) NOT NULL,
	[clave_sat] [nchar](5) NOT NULL,
	[descripcion] [nchar](100) NOT NULL,
	[activo] [int] NOT NULL,
 CONSTRAINT [PK_relacion_cfdi] PRIMARY KEY CLUSTERED 
(
	[id_relacion_cfdi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SchemaVersions]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchemaVersions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScriptName] [nvarchar](255) NOT NULL,
	[Applied] [datetime] NOT NULL,
 CONSTRAINT [PK_SchemaVersions_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[subcategoria]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subcategoria](
	[id_subcategoria] [int] IDENTITY(1,1) NOT NULL,
	[id_categoria] [int] NOT NULL,
	[clave] [nvarchar](10) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_subcategoria] PRIMARY KEY CLUSTERED 
(
	[id_subcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_subcategoria_clave] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_subcategoria_descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[submarca]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[submarca](
	[id_submarca] [int] IDENTITY(1,1) NOT NULL,
	[id_marca] [int] NOT NULL,
	[clave] [nvarchar](10) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_submarca] PRIMARY KEY CLUSTERED 
(
	[id_submarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_submarca_clave] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_submarca_descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursal](
	[id_sucursal] [int] IDENTITY(1,1) NOT NULL,
	[clave_sucursal] [nvarchar](5) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[id_zona] [int] NOT NULL,
	[direccion_ip] [nvarchar](50) NOT NULL,
	[nombre_bd] [nvarchar](50) NOT NULL,
	[usuario_bd] [nvarchar](50) NOT NULL,
	[contrasena] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
	[afiliacion_bancomer] [nvarchar](8) NULL,
 CONSTRAINT [PK_sucursal] PRIMARY KEY CLUSTERED 
(
	[id_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_sucursal_clave] UNIQUE NONCLUSTERED 
(
	[clave_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_sucursal_nombre] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ticket_bancomer]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket_bancomer](
	[id_ticket_bancomer] [int] IDENTITY(1,1) NOT NULL,
	[id_movimiento_almacen] [int] NULL,
	[id_movimiento_caja] [int] NULL,
	[id_vale_dev_trans] [int] NULL,
	[id_transaccion_banco] [int] NULL,
	[nombre_banco] [nvarchar](100) NULL,
	[nombre_comercio] [nvarchar](100) NULL,
	[nombre_cliente] [nvarchar](100) NULL,
	[domicilio_comercio] [nvarchar](250) NULL,
	[no_afiliacion] [nvarchar](8) NULL,
	[terminal] [nvarchar](8) NULL,
	[tipo_transaccion] [nvarchar](50) NULL,
	[vendedor] [nvarchar](100) NULL,
	[no_tarjeta] [nvarchar](50) NULL,
	[tipo_tarjeta] [nvarchar](50) NULL,
	[aprobada] [nvarchar](50) NULL,
	[ticket] [nvarchar](50) NULL,
	[fecha_vencimiento] [nvarchar](20) NULL,
	[importe] [nvarchar](50) NULL,
	[total_a_pagar] [nvarchar](20) NULL,
	[no_autorizacion] [nvarchar](50) NULL,
	[criptograma_chip] [nvarchar](100) NULL,
	[fecha_transaccion] [nvarchar](20) NULL,
	[hora_transaccion] [nvarchar](20) NULL,
	[no_secuencia_tnx] [nvarchar](30) NULL,
	[referencia_financiera] [nvarchar](30) NULL,
	[formato_transaccion] [nvarchar](5) NULL,
	[venta_con_puntos] [bit] NULL,
	[con_chip] [bit] NULL,
	[caja] [nvarchar](30) NULL,
	[aid] [nvarchar](50) NULL,
	[tipo_firma] [int] NULL,
	[fue_aprobada] [bit] NULL,
	[monto_pagado_con_puntos] [nvarchar](20) NULL,
	[saldo_anterior] [nvarchar](20) NULL,
	[saldo_anterior_en_pesos] [nvarchar](20) NULL,
	[puntos_redimidos] [nvarchar](20) NULL,
	[puntos_redimidos_en_pesos] [nvarchar](20) NULL,
	[saldo_actual] [nvarchar](20) NULL,
	[saldo_actual_en_pesos] [nvarchar](20) NULL,
 CONSTRAINT [PK_ticket_bancomer] PRIMARY KEY CLUSTERED 
(
	[id_ticket_bancomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tipo_caja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_caja](
	[id_tipo_caja] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
 CONSTRAINT [PK_tipo_caja] PRIMARY KEY CLUSTERED 
(
	[id_tipo_caja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_tipo_caja_nombre] UNIQUE NONCLUSTERED 
(
	[id_tipo_caja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tira_banco]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tira_banco](
	[id_tira_banco] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[id_folio_inicial] [int] NOT NULL,
	[folio_inicial] [nvarchar](12) NOT NULL,
	[id_folio_final] [int] NOT NULL,
	[folio_final] [nvarchar](12) NOT NULL,
	[monto_total] [decimal](18, 4) NOT NULL,
	[folio_panamericano] [nvarchar](20) NOT NULL,
	[observaciones] [nvarchar](100) NULL,
	[fecha_registro] [datetime] NOT NULL,
	[id_usuario_logueado] [int] NOT NULL,
	[id_usuario_autorizo] [int] NOT NULL,
 CONSTRAINT [PK_tira_banco] PRIMARY KEY CLUSTERED 
(
	[id_tira_banco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_tira_banco_folio_panamericano] UNIQUE NONCLUSTERED 
(
	[folio_panamericano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[transaccion_banco]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transaccion_banco](
	[id_transaccion] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[id_ticket] [int] NULL,
	[folio_ticket] [nvarchar](12) NULL,
	[id_movimiento_caja] [int] NULL,
	[folio_mov_caja] [nvarchar](12) NULL,
	[autorizado] [bit] NOT NULL,
	[id_vale_trans_devolucion] [int] NULL,
	[importe] [decimal](18, 2) NOT NULL,
	[comision] [decimal](18, 2) NOT NULL,
	[banco] [varchar](50) NOT NULL,
	[referencia] [nvarchar](50) NULL,
	[numero_operacion] [nvarchar](50) NULL,
	[numero_autorizacion] [nvarchar](50) NULL,
	[id_usuario] [int] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[cancelada_por_usuario] [bit] NULL,
 CONSTRAINT [PK_transaccion] PRIMARY KEY CLUSTERED 
(
	[id_transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[unidad_medida]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[unidad_medida](
	[id_unidad_medida] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](20) NOT NULL,
	[pesable] [tinyint] NOT NULL,
	[clave_sat] [nvarchar](5) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_unidad_medida] PRIMARY KEY CLUSTERED 
(
	[id_unidad_medida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_unidad_medida_descripcion] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[uso_cfdi]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uso_cfdi](
	[id_uso_cfdi] [int] IDENTITY(1,1) NOT NULL,
	[clave_sat] [nvarchar](5) NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_uso_cfdi] PRIMARY KEY CLUSTERED 
(
	[id_uso_cfdi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_uso_cfdi_clave] UNIQUE NONCLUSTERED 
(
	[clave_sat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usr_imei]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usr_imei](
	[idui] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[imei] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idui] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[clave] [nvarchar](50) NOT NULL,
	[id_perfil] [int] NULL,
	[id_sucursal] [int] NULL,
	[id_caja_actual] [int] NULL,
	[fecha_alta] [datetime] NULL,
	[ultima_sesion] [datetime] NULL,
	[activo] [tinyint] NULL,
	[contrasena] [varbinary](8000) NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_usuario_clave] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuario_huella]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_huella](
	[id_usuario_huella] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[huella] [nvarchar](max) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[id_usuario_alta] [int] NOT NULL,
	[activa] [bit] NOT NULL,
 CONSTRAINT [PK_usuario_huella] PRIMARY KEY CLUSTERED 
(
	[id_usuario_huella] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario_santander]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario_santander](
	[id_sucursal] [int] NOT NULL,
	[usuario] [varbinary](8000) NOT NULL,
	[contrasena] [varbinary](8000) NOT NULL,
	[url] [varchar](200) NOT NULL,
	[ccType] [varchar](50) NOT NULL,
	[operType] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vale_devolucion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vale_devolucion](
	[id_vale_devolucion] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[id_devolucion] [int] NOT NULL,
	[folio] [nvarchar](12) NOT NULL,
	[monto] [decimal](18, 4) NOT NULL,
	[aplicado] [bit] NOT NULL,
	[id_cliente] [int] NULL,
	[fecha_registro] [datetime] NOT NULL,
	[id_usuario_logueado] [int] NOT NULL,
	[id_usuario_autorizo] [int] NOT NULL,
 CONSTRAINT [PK_vale_devolucion] PRIMARY KEY CLUSTERED 
(
	[id_vale_devolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vale_devolucion_transaccion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vale_devolucion_transaccion](
	[id_vale_devolucion_transaccion] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[folio] [nvarchar](12) NOT NULL,
	[importe] [decimal](18, 2) NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[aplicado] [bit] NOT NULL,
	[id_cierre] [int] NULL,
 CONSTRAINT [PK_vale_devolucion_transaccion] PRIMARY KEY CLUSTERED 
(
	[id_vale_devolucion_transaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[variable_config]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[variable_config](
	[id_variable] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_caja] [int] NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[valor] [nvarchar](150) NOT NULL,
	[tipo] [nvarchar](10) NOT NULL,
	[descripcion] [varchar](250) NULL,
 CONSTRAINT [PK_variable_config] PRIMARY KEY CLUSTERED 
(
	[id_variable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[venta_cancelacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[venta_cancelacion](
	[id_venta_cancelacion] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[registros] [int] NOT NULL,
	[monto] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_venta_cancelacion] PRIMARY KEY CLUSTERED 
(
	[id_venta_cancelacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zona]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zona](
	[id_zona] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[fecha_alta] [datetime] NOT NULL,
	[activo] [tinyint] NOT NULL,
 CONSTRAINT [PK_zona] PRIMARY KEY CLUSTERED 
(
	[id_zona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UNIQUE_zona_nombre] UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[ACV_Articulos1]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[ACV_Articulos1]
AS
SELECT        A.id_articulo, A.clave AS Articulo, CASE WHEN P.NO_ORDEN = 1 THEN P.Precio_venta ELSE 0 END AS Precio1, CASE WHEN P.NO_orden = 2 THEN P.Precio_venta ELSE 0 END AS Precio2, 
                         CASE WHEN P.NO_orden = 3 THEN P.Precio_venta ELSE 0 END AS Precio3, CASE WHEN P.NO_orden = 4 THEN P.Precio_venta ELSE 0 END AS Precio4, CASE WHEN P.NO_orden = 1 THEN CONVERT(MONEY, 
                         ROUND(P.Precio_venta * (1 + I1.Tasa / 100) * (1 + I2.Tasa / 100), 2)) ELSE 0 END AS Precio1IVA, CASE WHEN P.NO_orden = 2 THEN CONVERT(MONEY, ROUND(P.Precio_venta * (1 + I1.Tasa / 100) 
                         * (1 + I2.Tasa / 100), 2)) ELSE 0 END AS Precio2IVA, CASE WHEN P.NO_orden = 3 THEN CONVERT(MONEY, ROUND(P.Precio_venta * (1 + I1.Tasa / 100) * (1 + I2.Tasa / 100), 2)) ELSE 0 END AS Precio3IVA, 
                         CASE WHEN P.NO_orden = 4 THEN CONVERT(MONEY, ROUND(P.Precio_venta * (1 + I1.Tasa / 100) * (1 + I2.Tasa / 100), 2)) ELSE 0 END AS Precio4IVA, 
                         CASE WHEN P.NO_ORDEN = 1 THEN P.Cantidad ELSE 0 END AS CantidadAutomatico1, CASE WHEN P.NO_ORDEN = 2 THEN P.Cantidad ELSE 0 END AS CantidadAutomatico2, 
                         CASE WHEN P.NO_ORDEN = 3 THEN P.Cantidad ELSE 0 END AS CantidadAutomatico3, CASE WHEN P.NO_ORDEN = 4 THEN P.Cantidad ELSE 0 END AS CantidadAutomatico4,
                         CASE WHEN P.NO_ORDEN = 1 THEN P.fecha_modificacion ELSE 0 END AS FechaCambio1, CASE WHEN P.NO_ORDEN = 2 THEN P.fecha_modificacion ELSE 0 END AS FechaCambio2, 
                         CASE WHEN P.NO_ORDEN = 3 THEN P.fecha_modificacion ELSE 0 END AS FechaCambio3, CASE WHEN P.NO_ORDEN = 4 THEN P.fecha_modificacion ELSE 0 END AS FechaCambio4, 
						 L.clave AS Linea
FROM            dbo.articulo AS A LEFT JOIN
                         dbo.articulo_precio AS P ON A.id_articulo = P.id_articulo INNER JOIN
                         dbo.impuesto AS I1 ON A.id_iva_venta = I1.id_impuesto INNER JOIN
                         dbo.impuesto AS I2 ON A.id_ieps_venta = I2.id_impuesto INNER JOIN
                         dbo.linea_negocio AS L ON A.id_linea_negocio = L.id_linea_negocio




GO
/****** Object:  View [dbo].[ACV_Articulos2]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ACV_Articulos2]
AS
SELECT        Articulo, MAX(Precio1) AS Precio1, MAX(Precio2) AS Precio2, MAX(Precio3) AS Precio3, MAX(Precio4) AS Precio4, MAX(Precio1IVA) AS Precio1IVA, MAX(Precio2IVA) AS Precio2IVA, MAX(Precio3IVA) AS Precio3IVA, 
                         MAX(Precio4IVA) AS Precio4IVA, MAX(CantidadAutomatico1) AS CantidadAutomatico1, MAX(CantidadAutomatico2) AS CantidadAutomatico2, MAX(CantidadAutomatico3) AS CantidadAutomatico3, 
                         MAX(CantidadAutomatico4) AS CantidadAutomatico4,MAX(FechaCambio1) AS FechaCambio1, MAX(FechaCambio2) AS FechaCambio2, MAX(FechaCambio3) AS FechaCambio3, 
                         MAX(FechaCambio4) AS FechaCambio4
FROM            dbo.ACV_Articulos1
GROUP BY Articulo



GO
/****** Object:  View [dbo].[ACV_Articulos3]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[ACV_Articulos3]
AS
SELECT        A.clave, CASE WHEN E.id_Almacen = 1 THEN CONVERT(MONEY, E.existencia_actual + E.existencia_apartado + E.existencia_venta) ELSE 0 END AS ExSuperUV, 
                         CASE WHEN E.id_Almacen = 2 THEN CONVERT(MONEY, E.existencia_actual + E.existencia_apartado + E.existencia_venta) ELSE 0 END AS ExMayoreoUV,
                         CASE WHEN E.id_Almacen = 3 THEN CONVERT(MONEY, E.existencia_actual + E.existencia_apartado + E.existencia_venta) ELSE 0 END AS ExMermaUV,
						 CASE WHEN E.id_Almacen = 1 THEN CONVERT(MONEY,(E.existencia_actual + E.existencia_apartado + E.existencia_venta) / A.relacion_venta) ELSE 0 END AS ExSuperUC,
						 CASE WHEN E.id_Almacen = 2 THEN CONVERT(MONEY,(E.existencia_actual + E.existencia_apartado + E.existencia_venta) / A.relacion_venta) ELSE 0 END AS ExMayoreoUC, 
                         CASE WHEN E.id_Almacen = 1 THEN A.costo_ultimo / A.relacion_venta ELSE 0 END AS UCostoSuperUV,
						 CASE WHEN E.id_Almacen = 1 THEN A.costo_promedio ELSE 0 END AS CostoPSuperUV, 
                         CASE WHEN E.id_Almacen = 2 THEN A.costo_ultimo ELSE 0 END AS UCostoMayoreoUC, 
                         CASE WHEN E.id_Almacen = 2 THEN A.costo_promedio * A.relacion_venta ELSE 0 END AS CostoPMayoreoUC

FROM            dbo.articulo AS A LEFT OUTER JOIN
                         dbo.articulo_existencia AS E ON A.id_articulo = E.id_articulo





GO
/****** Object:  View [dbo].[ACV_Articulos4]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO








CREATE VIEW [dbo].[ACV_Articulos4]
AS
SELECT CLAVE, SUM(ExSuperUV) AS ExSuperUV, SUM(ExMayoreoUV) AS ExMayoreoUV, SUM(ExMermaUV) AS ExMermaUV, SUM(ExSuperUC) AS ExSuperUC, SUM(ExMayoreoUC) AS ExMayoreoUC, 
               SUM(UCostoSuperUV) AS UCostoSuperUV, SUM(CostoPSuperUV) AS CostoPSuperUV, SUM(UCostoMayoreoUC) AS UCostoMayoreoUC, 
               SUM(CostoPMayoreoUC) AS CostoPMayoreoUC
FROM  dbo.ACV_Articulos3
GROUP BY CLAVE









GO
/****** Object:  View [dbo].[ACV_ArticulosInve]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[ACV_ArticulosInve]
AS
SELECT        A.id_articulo, A.clave AS Articulo, A.desc_super AS Nombre, A.desc_mayoreo AS Descripcion, A.codigo_barras1 AS codigobarras, A.relacion_compra AS factorcompra, UC.descripcion AS UnidadCompra, 
                         A.id_linea_negocio, A.relacion_venta AS FactorVenta, UV.descripcion AS UnidadVenta, A.tipo, S.clave AS Subfamilia, S.descripcion AS DescripcionSurtido, F.clave AS Familia, F.descripcion AS DescripcionFamilia, 
                         ISNULL(P.Precio1, 0) AS Precio1, ISNULL(P.Precio2, 0) AS Precio2, ISNULL(P.Precio3, 0) AS Precio3, ISNULL(P.Precio4, 0) AS Precio4, ISNULL(P.Precio1IVA, 0) AS Precio1IVA, ISNULL(P.Precio2IVA, 0) 
                         AS Precio2IVA, ISNULL(P.Precio3IVA, 0) AS Precio3IVA, ISNULL(P.Precio4IVA, 0) AS Precio4IVA, ISNULL(E.ExSuperUV, 0) AS ExSuperUV, ISNULL(E.ExMayoreoUV, 0) AS ExMayoreoUV, ISNULL(E.ExSuperUC, 0) 
                         AS ExSuperUC, ISNULL(E.ExMayoreoUC, 0) AS ExMayoreoUC, ISNULL(E.ExMermaUV, 0) AS ExMermaUV, ISNULL(E.UCostoSuperUV, 0) AS UCostoSuperUV, ISNULL(E.CostoPSuperUV, 0) AS CostoPSuperUV, ISNULL(E.UCostoMayoreoUC, 
                         0) AS UCostoMayoreoUC, ISNULL(E.CostoPMayoreoUC, 0) AS CostoPMayoreoUC, '________' AS cvRaya1, '_______' AS cvRaya2, '______' AS cvRaya3, ISNULL(Prov.nombre, N'') AS ProveedorNombre, 
                         ISNULL(Prov.clave, N'') AS Proveedor, P.Precio2 * A.relacion_venta AS Precio2UC, P.Precio3 * A.relacion_venta AS Precio3UC, P.Precio4 * A.relacion_venta AS Precio4UC, 
                         P.Precio2IVA * A.relacion_venta AS Precio2IVAUC, P.Precio3IVA * A.relacion_venta AS Precio3IVAUC, P.Precio4IVA * A.relacion_venta AS Precio4IVAUC,
						 P.CantidadAutomatico1 AS CantidadAutomatico1, P.CantidadAutomatico2 AS CantidadAutomatico2, P.CantidadAutomatico3 AS CantidadAutomatico3, 
						 P.CantidadAutomatico4 AS CantidadAutomatico4, I1.tasa AS TasaIva, I2.tasa AS TasaIEPS, 
						 P.FechaCambio1 AS FechaCambio1, P.FechaCambio2 AS FechaCambio2, P.FechaCambio3 AS FechaCambio3, P.FechaCambio4 AS FechaCambio4,

                         L.clave AS Linea
FROM            dbo.articulo AS A LEFT JOIN
                         dbo.agrupador_articulo AS S ON A.id_agrupador_articulo = S.id_agrupador_articulo LEFT JOIN
                         dbo.familia AS F ON A.id_familia = F.id_familia LEFT JOIN
                         dbo.unidad_medida AS UC ON A.id_unidad_compra = UC.id_unidad_medida INNER JOIN
                         dbo.unidad_medida AS UV ON A.id_unidad_venta = UV.id_unidad_medida INNER JOIN
                         dbo.impuesto AS I1 ON A.id_iva_venta = I1.id_impuesto INNER JOIN
                         dbo.impuesto AS I2 ON A.id_ieps_venta = I2.id_impuesto INNER JOIN
                         dbo.linea_negocio AS L ON A.id_linea_negocio = L.id_linea_negocio LEFT OUTER JOIN
                         dbo.ACV_Articulos4 AS E ON A.clave = E.CLAVE LEFT OUTER JOIN
                         dbo.proveedor AS Prov INNER JOIN
                         dbo.articulo_proveedor AS Pr ON Prov.id_proveedor = Pr.id_proveedor ON A.id_articulo = Pr.id_articulo LEFT OUTER JOIN
                         dbo.ACV_Articulos2 AS P ON A.clave = P.Articulo
WHERE        (Pr.prioridad = 1) OR
                         (Pr.prioridad IS NULL)







GO
/****** Object:  UserDefinedFunction [dbo].[FCVDetalleAcum1]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- 06/09/2019   Casa Vargas
CREATE FUNCTION [dbo].[FCVDetalleAcum1] (@FechaInicial DATETIME, @FechaFinal DATETIME)  
RETURNS TABLE
AS  
RETURN (

SELECT 	D.id_movimiento_almacen,
	D.id_almacen AS ALMACEN, 
	D.id_articulo,
	M.id_sucursal as Tienda,
	CASE M.id_movimiento_almacen_tipo 
		WHEN 7 THEN -D.Cantidad
		WHEN 10 THEN -D.Cantidad
		ELSE D.Cantidad
	END AS CantidadUV, 	
	CASE M.id_movimiento_almacen_tipo 
		WHEN 7 THEN -D.costo
		WHEN 10 THEN -D.costo
		ELSE D.costo
	END AS ImporteCosto, 
	CASE M.id_movimiento_almacen_tipo 
		WHEN 7 THEN -D.subtotal
		WHEN 10 THEN -D.subtotal
		ELSE D.Subtotal
	END AS ImporteVenta, 
	D.tasa_iva, 
	D.tasa_ieps, 
	D.Descuento, 
	(1-D.Descuento/100) AS FDescuento, 
	D.es_mayoreo, 
	M.id_movimiento_almacen_tipo as Tipo, 
	A.Clave as Articulo,
	A.id_Linea_Negocio,
	L.Clave AS Linea,
	L.Descripcion as DescripcionLinea
FROM Movimiento_Almacen_Detalle D LEFT JOIN Movimiento_Almacen M
	ON D.id_Movimiento_Almacen = M.id_Movimiento_Almacen inner join 
Articulo A on A.id_Articulo=D.id_Articulo inner join 
Linea_Negocio L on L.id_linea_Negocio=A.id_Linea_Negocio
WHERE M.fecha_registro Between @FechaInicial And @FechaFinal
)



GO
/****** Object:  UserDefinedFunction [dbo].[FCVMovLineaAcum]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[FCVMovLineaAcum] (@FechaInicial DATETIME, @FechaFinal DATETIME)
RETURNS TABLE
AS
RETURN
SELECT LINEA, 
    Sum(CantidadUV) AS TotalCantidadUV, 
	Sum(ImporteCosto) AS TotalImporteCosto, 
	Sum(ImporteVenta) AS TotalImporteVenta, 
	Sum(ImporteVenta*(FDescuento)*(1+tasa_ieps/100)*(tasa_iva/100)) AS TotalIVA, 
	Sum(ImporteVenta*FDescuento*(tasa_ieps/100)) AS TotalIEPS, 
	Sum(ImporteVenta-ImporteVenta*FDescuento) AS TotalDescuento,  

	Sum(ImporteCosto*(FDescuento)*(1+tasa_ieps/100)*(tasa_iva/100)) AS TotalIVACosto, 
	Sum(ImporteCosto*FDescuento*(tasa_ieps/100)) AS TotalIEPSCosto, 
	Sum(ImporteCosto-ImporteCosto*FDescuento) AS TotalDescuentoCosto,  

	Tipo, Almacen, Tienda,

	SUM(CASE WHEN tasa_iva <= 0 THEN ImporteCosto ELSE 0 END) AS CostoTotExento, 
	SUM(CASE WHEN tasa_iva > 0 THEN ImporteCosto ELSE 0 END) AS CostoTotGravado, 

	SUM(CASE WHEN tasa_iva <= 0 THEN ImporteVenta ELSE 0 END) AS VentaTotExento, 
	SUM(CASE WHEN tasa_iva > 0 THEN ImporteVenta ELSE 0 END) AS VentaTotGravado, 

	CONVERT(MONEY, SUM((CASE WHEN tasa_iva <= 0 THEN ImporteVenta ELSE 0 END)*(1-Descuento/100))) AS VentaNetaExento,
	CONVERT(MONEY, SUM((CASE WHEN tasa_iva > 0 THEN ImporteVenta ELSE 0 END)*(1-Descuento/100))) AS VentaNetaGravado

	FROM FCVDetalleAcum1(@FechaInicial,@FechaFinal)   GROUP BY Linea, Tipo, Almacen, Tienda



GO
/****** Object:  UserDefinedFunction [dbo].[FCVMovArticAcum]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[FCVMovArticAcum] (@FechaInicial DATETIME, @FechaFinal DATETIME)
RETURNS TABLE
AS
RETURN
SELECT Articulo, 
Sum(CantidadUV) AS TotalCantidadUV, 
Sum(ImporteCosto) AS TotalImporteCosto, 
Sum(ImporteVenta) AS TotalImporteVenta, 
Sum(ImporteVenta*(FDescuento)*(1+tasa_ieps/100)*(tasa_iva/100)) AS TotalIVA, 
Sum(ImporteVenta*FDescuento*(tasa_ieps/100)) AS TotalIEPS, 
Sum(ImporteVenta-ImporteVenta*FDescuento) AS TotalDescuento,  
Sum(ImporteCosto*(FDescuento)*(1+tasa_ieps/100)*(tasa_iva/100)) AS TotalIVACosto, 
Sum(ImporteCosto*FDescuento*(tasa_ieps/100)) AS TotalIEPSCosto, 
Sum(ImporteCosto-ImporteCosto*FDescuento) AS TotalDescuentoCosto,  
Tipo, Almacen, Tienda,
SUM(CASE WHEN tasa_iva <= 0 THEN ImporteCosto ELSE 0 END) AS CostoTotExento, 
SUM(CASE WHEN tasa_iva > 0 THEN ImporteCosto ELSE 0 END) AS CostoTotGravado, 
SUM(CASE WHEN tasa_iva <= 0 THEN ImporteVenta ELSE 0 END) AS VentaTotExento, 
SUM(CASE WHEN tasa_iva > 0 THEN ImporteVenta ELSE 0 END) AS VentaTotGravado, 

CONVERT(MONEY, SUM((CASE WHEN tasa_iva <= 0 THEN ImporteVenta ELSE 0 END)*(1-Descuento/100))) AS VentaNetaExento,
CONVERT(MONEY, SUM((CASE WHEN tasa_iva > 0 THEN ImporteVenta ELSE 0 END)*(1-Descuento/100))) AS VentaNetaGravado

FROM FCVDetalleAcum1(@FechaInicial,@FechaFinal)   
GROUP BY Articulo, Tipo, Almacen, Tienda


GO
/****** Object:  View [dbo].[ACV_VRotativo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[ACV_VRotativo] as
SELECT 
		Linea			'Lin'
		,Familia		'Fam'
		,articulo		'Articulo'
		,Descripcion	'Descripcion'
		,codigobarras	'Codigo_B'
		,ExMayoreoUC	'Ex_May'
		,UnidadCompra	'Uc'
		,cvRaya1		'Conteo_M'
		,ExSuperUV		'Ex_Sup'
		,UnidadVenta	'Uv'
		,cvRaya2		'Conteo_S'
		   FROM ACV_ArticulosInve
GO
/****** Object:  View [dbo].[ACV_MovAlmacen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ACV_MovAlmacen]
AS
SELECT        M.id_movimiento_almacen, M.id_movimiento_almacen_tipo, MT.clave AS Tipo, MT.nombre AS DescripcionTipo, MT.es_entrada AS EoS, M.folio, M.referencia, M.id_proveedor, P.clave AS Proveedor, 
                         P.nombre AS NombreProveedor, M.id_cliente, C.nombre AS NombreCliente, M.id_almacen, A.clave AS NumeroAlmacenM, A.nombre AS DescripcionAlmacenM, M.id_sucursal, S.clave_sucursal AS ClaveTienda, 
                         S.nombre AS DescripcionTienda, M.id_caja, CJ.no_caja AS Caja, M.id_usuario_logueado, U1.clave AS ClaveUsuario1, U1.nombre AS NombreUsuario1, M.id_usuario_autorizo, U2.clave AS ClaveUsuario2, 
                         U2.nombre AS NombreUsuario2, M.codigo_autorizacion, MONTH(M.fecha_registro) AS Mes, DATENAME(month, M.fecha_registro) AS MesMovimientoLetra, CASE Month(M.Fecha_registro) 
                         WHEN 1 THEN 'Ene' WHEN 2 THEN 'Feb' WHEN 3 THEN 'Mar' WHEN 4 THEN 'Abr' WHEN 5 THEN 'May' WHEN 6 THEN 'Jun' WHEN 7 THEN 'Jul' WHEN 8 THEN 'Ago' WHEN 9 THEN 'Sep' WHEN 10 THEN 'Oct' WHEN
                          11 THEN 'Nov' WHEN 12 THEN 'Dic' END AS MesMovimiento3Letras, CONVERT(DATETIME, CONVERT(NVARCHAR(10), M.fecha_registro, 108)) AS Hora, M.fecha_registro, M.fecha_cancelado, M.id_consolidacion, 
                         M.id_facturacion, M.id_referencia, M.folio_fiscal, M.observaciones, M.id_sucursal_origen, M.id_sucursal_destino, M.id_almacen_origen
FROM            dbo.movimiento_almacen AS M INNER JOIN
                         dbo.sucursal AS S ON M.id_sucursal = S.id_sucursal INNER JOIN
                         dbo.almacen AS A ON M.id_almacen = A.id_almacen INNER JOIN
                         dbo.movimiento_almacen_tipo AS MT ON M.id_movimiento_almacen_tipo = MT.id_movimiento_almacen_tipo LEFT OUTER JOIN
                         dbo.caja AS CJ ON M.id_caja = CJ.id_caja LEFT OUTER JOIN
                         dbo.usuario AS U1 ON M.id_usuario_logueado = U1.id_usuario LEFT OUTER JOIN
                         dbo.usuario AS U2 ON M.id_usuario_autorizo = U2.id_usuario LEFT OUTER JOIN
                         dbo.cliente AS C ON M.id_cliente = C.id_cliente LEFT OUTER JOIN
                         dbo.proveedor AS P ON M.id_proveedor = P.id_proveedor

GO
/****** Object:  View [dbo].[ACV_DetMovAlmacen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ACV_DetMovAlmacen]
AS

SELECT     
	D.id_movimiento_almacen, 
	D.id_articulo, 
	A.Clave AS Articulo,
	A.Relacion_Compra As FCompra,
	A.Relacion_venta As FVenta,
	A.desc_mayoreo As Descripcion,
	A.desc_super As Nombre,
	A.id_Linea_Negocio as idLinea,
	L.Clave as Linea,
    (CASE WHEN M.Tipo IN ('V','L','S','T','P','H','Y','M') THEN -1 ELSE 1 END)*D.Cantidad AS Cantidad, 	
	D.costo_unitario as CostoUni,
	(CASE WHEN M.Tipo IN ('V','L','S','T','P','H','Y','M') THEN -1 ELSE 1 END)*D.subtotal AS ImporteSI,
	(CASE WHEN M.Tipo IN ('V','L','S','T','P','H','Y','M') THEN -1 ELSE 1 END)*D.importe AS ImporteNeto, 
	(CASE WHEN M.Tipo IN ('V','L','S','T','P','H','Y','M') THEN -1 ELSE 1 END)*D.descuento AS ImporteDesc, 
	(CASE WHEN M.Tipo IN ('V','L','S','T','P','H','Y','M') THEN -1 ELSE 1 END)*D.IVA AS ImporteIva, 
	(CASE WHEN M.Tipo IN ('V','L','S','T','P','H','Y','M') THEN -1 ELSE 1 END)*D.IEPS AS ImporteIEPS, 	
	(CASE WHEN M.Tipo IN ('V','L','S','T','P','H','Y','M') THEN -1 ELSE 1 END)*D.Costo as ValorCosto,
	D.Tasa_Iva as TasaIVA,
	D.Tasa_IEPS as TasaIEPS,
	D.es_mayoreo, 
	D.id_movimiento_almacen_detalle,
	D.id_almacen,
	AL.clave AS NumeroAlmacenD,   
	AL.nombre AS DescripcionAlmacenD,   
	D.consecutivo,
	D.id_unidad_medida,
	D.fecha_devuelto,
	D.ingresado,
	D.id_referencia_detalle,
	D.existencia_al_momento,
	M.Folio, 
	M.Tipo, M.DescripcionTipo, M.EoS,
	M.Referencia, M.id_Cliente, M.Proveedor,
	M.NumeroAlmacenM, M.DescripcionAlmacenM, 
	M.Clavetienda, M.DescripcionTienda,
	M.Caja, M.ClaveUsuario1, M.NombreUsuario1,  
	M.Mes, M.MesMovimientoLetra, M.MesMovimiento3Letras, M.Hora, 
	M.Fecha_registro, 
	M.id_consolidacion,  
	M.id_facturacion,
	M.id_referencia,
	M.folio_fiscal,
	M.Observaciones  

FROM         
	dbo.MOvimiento_Almacen_Detalle D INNER JOIN dbo.ACV_MovAlmacen M
	ON D.id_movimiento_almacen=M.id_movimiento_almacen 
	INNER JOIN dbo.Articulo A ON D.id_articulo = A.id_articulo   
	INNER JOIN dbo.Linea_Negocio L ON A.id_linea_negocio = L.id_Linea_negocio   
	INNER JOIN dbo.Almacen AL ON D.id_almacen = AL.id_almacen   







GO
/****** Object:  View [dbo].[ACV_Cantidad_Alm_1]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ACV_Cantidad_Alm_1]
AS
SELECT 
      Articulo
      ,SUM(cantidad) AS 'Almacen_1'
  FROM ACV_DetMovAlmacen
    where Tipo in ('V','L','T','S','P','H','Y','M') AND id_almacen =1 
  group by articulo 

GO
/****** Object:  View [dbo].[ACV_Cantidad_Alm_2]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ACV_Cantidad_Alm_2]
AS
SELECT 
      Articulo
      ,SUM(cantidad) AS 'Almacen_2'
  FROM ACV_DetMovAlmacen
    where Tipo in ('V','L','T','S','P','H','Y','M') AND id_almacen =2 
  group by articulo 

GO
/****** Object:  View [dbo].[ACV_Cantidad_Alm_3]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ACV_Cantidad_Alm_3]
AS
  SELECT 
      Articulo
      ,SUM(cantidad) as  'Almacen_3'
  FROM ACV_DetMovAlmacen
    where Tipo in ('V','L','T','S','P','H','Y','M') AND id_almacen =3 
  group by articulo 


GO
/****** Object:  View [dbo].[ACV_Cantidad_ENT_Alm_1]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ACV_Cantidad_ENT_Alm_1]
AS
SELECT 
      Articulo
      ,SUM(cantidad) AS 'Almacen_1'
  FROM ACV_DetMovAlmacen
    where Tipo in ('C','K','A','E','D','J','X') AND id_almacen =1
  group by articulo 



GO
/****** Object:  View [dbo].[ACV_Cantidad_ENT_Alm_2]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ACV_Cantidad_ENT_Alm_2]
AS
SELECT 
      Articulo
      ,SUM(cantidad) AS 'Almacen_2'
  FROM ACV_DetMovAlmacen
    where Tipo in ('C','K','A','E','D','J','X') AND id_almacen =2 
  group by articulo 


GO
/****** Object:  View [dbo].[ACV_Cantidad_ENT_Alm_3]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ACV_Cantidad_ENT_Alm_3]
AS
  SELECT 
      Articulo
      ,SUM(cantidad) as  'Almacen_3'
  FROM ACV_DetMovAlmacen
    where Tipo in ('C','K','A','E','D','J','X') AND id_almacen =3 
  group by articulo 



GO
/****** Object:  View [dbo].[ACV_Total_Ent_Sal]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ACV_Total_Ent_Sal]
as
select distinct
		tbl1.Articulo 
		,tbl1.Nombre   
		,ISNULL(almE1.almacen_1,0) as 'Entrada_Super'
		,ISNULL(alm1.almacen_1,0) as 'Salida_Super'
		,ISNULL(almE2.almacen_2,0) as 'Entrada_Mayoreo'
		,ISNULL(alm2.almacen_2,0) as 'Salida_Mayoreo'
		,ISNULL(almE3.almacen_3,0) as 'Entrada_Merma'
		,ISNULL(alm3.almacen_3,0) as 'Salida_Merma'
		--,(almE1.almacen_1-alm1.almacen_1) as 'Total_Super'
		--,(almE2.almacen_2-alm2.almacen_2) as 'Total_Mayoreo'
		--,(almE3.almacen_3-alm3.almacen_3) as 'Total_Merma'
from ACV_DetMovAlmacen tbl1
left outer join ACV_Cantidad_Alm_1 alm1 on tbl1.Articulo =alm1.articulo
left outer join ACV_Cantidad_Alm_2 alm2 on tbl1.Articulo =alm2.articulo
left outer join ACV_Cantidad_Alm_3 alm3 on tbl1.Articulo =alm3.articulo
left outer join ACV_Cantidad_ENT_Alm_1 almE1 on tbl1.Articulo =almE1.articulo
left outer join ACV_Cantidad_ENT_Alm_2 almE2 on tbl1.Articulo =almE2.articulo
left outer join ACV_Cantidad_ENT_Alm_3 almE3 on tbl1.Articulo =almE3.articulo

GO
/****** Object:  UserDefinedFunction [dbo].[FCVDetalleVtaUtilAcum]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- 06/09/2019   Casa Vargas
CREATE FUNCTION [dbo].[FCVDetalleVtaUtilAcum] (@FechaInicial DATETIME, @FechaFinal DATETIME)  
RETURNS TABLE
AS  
RETURN (

SELECT 	M.id_sucursal as Tienda,
	D.id_movimiento_almacen,
	M.id_movimiento_almacen_tipo as Tipo, 
	D.id_almacen AS ALMACEN, 
	A.id_Linea_Negocio,
	L.Clave AS Linea,
	L.Descripcion as DescripcionLinea,
	D.id_articulo,
	A.Clave as Articulo,
	A.Relacion_Venta as Factor,
	CASE M.id_movimiento_almacen_tipo 
		WHEN 7 THEN -D.Cantidad
		ELSE D.Cantidad
	END AS CantidadUV, 	
	CASE M.id_movimiento_almacen_tipo 
		WHEN 7 THEN -D.costo
		ELSE D.costo
	END AS ImporteCosto, 
	CASE M.id_movimiento_almacen_tipo 
		WHEN 7 THEN -(D.subtotal-D.Descuento)
		ELSE (D.subtotal-D.Descuento)
	END AS ImporteVenta, 
	D.tasa_ieps, 
	D.tasa_iva, 
	D.Descuento, 
	(1-D.Descuento/100) AS FDescuento



FROM Movimiento_Almacen_Detalle D LEFT JOIN Movimiento_Almacen M
	ON D.id_Movimiento_Almacen = M.id_Movimiento_Almacen inner join 
Articulo A on A.id_Articulo=D.id_Articulo inner join 
Linea_Negocio L on L.id_linea_Negocio=A.id_Linea_Negocio
WHERE M.fecha_registro Between @FechaInicial And @FechaFinal
)



GO
/****** Object:  UserDefinedFunction [dbo].[Split]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2013-05-15
-- Description:	Regresa un valor de tabla con el resultado del split
-- =============================================
CREATE FUNCTION [dbo].[Split]
(
    @String NVARCHAR(4000),
    @Delimiter NCHAR(1)
)
RETURNS TABLE
AS
RETURN
(
    WITH Split(stpos,endpos)
    AS(
        SELECT 0 AS stpos, CHARINDEX(@Delimiter,@String) AS endpos
        UNION ALL
        SELECT endpos+1, CHARINDEX(@Delimiter,@String,endpos+1)
            FROM Split
            WHERE endpos > 0
    )
    SELECT 'Id' = ROW_NUMBER() OVER (ORDER BY (SELECT 1)),
        'Data' = SUBSTRING(@String,stpos,COALESCE(NULLIF(endpos,0),LEN(@String)+1)-stpos)
    FROM Split
)
GO
/****** Object:  View [dbo].[ACV_MovAlmTotalFolio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[ACV_MovAlmTotalFolio]
 AS
 
 SELECT     
 id_movimiento_almacen, 
 CONVERT(DECIMAL(24,6), SUM(Cantidad)) AS CantidadT, 
 CONVERT(DECIMAL(24,6), SUM(Costo)) AS CostoTSinD, 
 CONVERT(DECIMAL(24,6), SUM(Descuento)) AS DescuentoT, 
 CONVERT(DECIMAL(24,6), SUM(Subtotal-Descuento)) AS SubtotalTCD, 
 CONVERT(DECIMAL(24,6), SUM(importe)) AS ImporteNetoT, 
 CONVERT(DECIMAL(24,6), SUM(Costo*(1+tasa_ieps/100)*tasa_iva/100)) AS IVACostoT, 
 CONVERT(DECIMAL(24,6), SUM(Costo*tasa_ieps/100)) AS IEPSCostoT, 
 CONVERT(DECIMAL(24,6), SUM(Costo*(1+tasa_ieps/100)*(1+tasa_iva/100))) AS CostoNetoT, 
 CONVERT(DECIMAL(24,6), SUM(Subtotal*(1-Descuento/100)*(1+tasa_ieps/100)*1+tasa_iva/100)) AS SubtotalNetoT, 
 
 CONVERT(DECIMAL(24,6), SUM(CASE WHEN tasa_ieps<=6 THEN Subtotal*(1-Descuento/100)*tasa_ieps/100 ELSE 0 END))  AS IEPSSubtotalT6, 
 
 CONVERT(DECIMAL(24,6), SUM(CASE WHEN tasa_ieps>6 THEN subtotal*(1-Descuento/100)*tasa_ieps/100 ELSE 0 END))  AS IEPSSubtotalT8, 
 
 CONVERT(DECIMAL(24,6), SUM(CASE WHEN tasa_iva > 0 THEN subtotal*(1-Descuento/100)*tasa_iva/100 ELSE 0 END))  AS IVASubtotalT, 
 
 CONVERT(DECIMAL(24,6), SUM(CASE WHEN tasa_iva <= 0 THEN Costo ELSE 0 END)) AS CostoTotExento, 
 
 CONVERT(DECIMAL(24,6), SUM(CASE WHEN tasa_iva > 0 THEN Costo ELSE 0 END)) AS CostoTotGravado,
 
 CONVERT(DECIMAL(24,6), SUM(CASE WHEN tasa_iva <= 0 THEN Subtotal ELSE 0 END)) AS SubtotalTotExento, 
 
 CONVERT(DECIMAL(24,6), SUM(CASE WHEN tasa_iva > 0 THEN Subtotal ELSE 0 END)) AS SubtotalTotGravado, 
 
 CONVERT(DECIMAL(24,6), SUM((CASE WHEN tasa_iva <= 0 THEN Importe ELSE 0 END)*(1-Descuento/100))) AS ImporteNetoExento, 
 
 CONVERT(DECIMAL(24,6), SUM((CASE WHEN tasa_iva > 0 THEN Importe ELSE 0 END)*(1-Descuento/100))) AS ImporteNetoGravado
 
 FROM  Movimiento_Almacen_Detalle 
 
 GROUP BY id_movimiento_almacen




GO
/****** Object:  View [dbo].[ACV_Movimiento_Ajuste]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[ACV_Movimiento_Ajuste] as
SELECT 
		 alm.nombre 'Almacen'
		 ,mat.nombre 'Movimiento_tipo'
		,ma.folio	
		,art.clave	'Clave_articulo'
		,art.desc_super 
		,ma.observaciones 
		,mad.cantidad 
		,um.descripcion 'Unidad_medida'
		,mad.costo_unitario 
		,ma.subtotal 
		,mad.importe 
		,mad.existencia_al_momento 
		,ma.fecha_registro
 		
	FROM movimiento_almacen ma
	inner  join movimiento_almacen_detalle mad on ma.id_movimiento_almacen =mad.id_movimiento_almacen 
	inner join almacen alm on alm.id_almacen  =mad.id_almacen 
	inner join articulo art on mad.id_articulo = art.id_articulo 
	inner join unidad_medida um on mad.id_unidad_medida =um.id_unidad_medida 
	inner join movimiento_almacen_tipo mat on ma.id_movimiento_almacen_tipo =mat.id_movimiento_almacen_tipo 

GO
/****** Object:  View [dbo].[ACV_PromocionesXZ]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ACV_PromocionesXZ] 
as
  select 

		 pm.clave				'Clave_XZ'
		,pm.nombre				'Promocion_XZ'		
		,pc.clave				'Clave_Compra'
		,pc.descripcion			'Descr_super'
		,pc.cantidad			'Compra'
		,um.descripcion			'Unidad_C'
		,pr.id_promocion
		,art.clave	 			'Clave_regalo'
		,art.desc_super			'Descr_regalo'
		,pr.cantidad			'Regala'
		,umR.descripcion		'Unidad_R'
		,pm.vigencia_inicio		'Vigencia_Inicio'
		,pm.vigencia_fin		'Vigencia_Fin'
		,pm.activo				'Estatus'
		,pt.descripcion			'Tipo_Promoción'

	from promocion pm
		left join promocion_compra pc on pm.id_promocion =pc.id_promocion 
		inner join unidad_medida um on pc.id_unidad_medida =um.id_unidad_medida 
		left join promocion_regalo pr on pm.id_promocion =pr.id_promocion 
		left join articulo art on pr.id_articulo =art.id_articulo 
		inner join unidad_medida umR on pr.id_unidad_medida =umR.id_unidad_medida 
		left join promocion_tipo pt on pm.id_promocion_tipo =pt.id_promocion_tipo 


   

GO
/****** Object:  View [dbo].[lista_premios]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[lista_premios] 
as
SELECT distinct
			MA.folio AS 'Ticket',
			c.nombre AS 'CAJA' ,
			MA.subtotal,
			MA.total_neto,
			P.cantidad 'Boletos asignados',
			MA.id_movimiento_almacen as 'id Registro',
			CAST(p.fecha_registro AS DATETIME) AS 'fecha'
	FROM premio P
		LEFT OUTER JOIN movimiento_almacen AS		MA	on P.id_venta = MA.id_movimiento_almacen  
		LEFT OUTER JOIN movimiento_almacen_detalle	mad on MA.id_movimiento_almacen = mad.id_movimiento_almacen 
		LEFT OUTER JOIN caja						C	on MA.id_caja = C.id_caja 
GO
/****** Object:  View [dbo].[Vt_Facturacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[Vt_Facturacion]
as

WITH D_CTE
	 as
		(select 
			df.id_datos_facturacion ,
			CT.nombre as 'Nombre' ,
			df.rfc as 'R.F.C.',
			DF.razon_social as 'Razon Social',
			DF.calle as 'Calle',
			DF.no_exterior as 'Exterior',
			DF.no_interior as 'Interior',
			col.nombre as 'Colonia',
			DF.id_cp ,
			DF.email as'Correo'
			from cliente CT
			left outer join datos_facturacion DF on CT.id_datos_facturacion = DF.id_datos_facturacion 
			left outer join colonia as col on DF.id_colonia =col.id_colonia 
		)

SELECT top 100 percent
		datename(month,F.fecha_generado) as 'Mes',
		convert (varchar,F.fecha_generado,103) as 'Fecha',
		convert (varchar,F.fecha_generado,108) as 'Hora Registro',
		dt_fac.nombre as 'Cliente' ,
		dt_fac.[R.F.C.] ,
		dt_fac.[Razon Social] ,
		dt_fac.calle as 'Calle',
		dt_fac.Exterior   ,
		dt_fac.Interior  ,
		dt_fac.Colonia  as 'Colonia',
		dt_fac.Correo as 'Correo' ,
		ISNULL(ma.folio,'Fac. Global') as 'Ticket',
		F.folio_fiscal as 'Folio Fiscal' ,
		cast(F.subtotal	as decimal (10,3)) as 'Sub Total',
		cast(F.iva as decimal (10,3)) as 'I.V.A.',
		cast(F.ieps as decimal (10,3)) as 'IEPS',
		cast(F.total as decimal (10,3)) as 'Total',
		Uc.descripcion as 'Uso CFDI',
		UC.clave_sat as 'Clave SAT' 		
FROM facturacion F
	LEFT OUTER JOIN movimiento_almacen MA on F.id_facturacion = MA.id_facturacion 
	LEFT OUTER JOIN uso_cfdi UC on F.id_uso_cfdi = UC.id_uso_cfdi 
	LEFT OUTER JOIN cliente C on F.id_cliente =C.id_cliente 
	LEFT OUTER JOIN D_CTE dt_fac on C.id_datos_facturacion =dt_fac.id_datos_facturacion 

order by convert (varchar,F.fecha_generado,103)  asc
;	


GO
/****** Object:  View [dbo].[VtKardex]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VtKardex]
AS
select 
	mc.id_sucursal,
	mad.id_articulo,
	a.clave as claveArt,
	a.id_agrupador_articulo,
	a.id_linea_negocio,
	a.id_subcategoria,
	mc.id_movimiento_almacen,
	mc.fecha_registro,
	mat.clave,
	folio,
	mad.id_movimiento_almacen_detalle,
	mc.id_movimiento_almacen_tipo,
	(SELECT CASE 
		WHEN
			(ISNULL((select id_unidad_medida from movimiento_almacen mcc LEFT JOIN 
			movimiento_almacen_detalle madd ON madd.id_movimiento_almacen = mcc.id_movimiento_almacen
			where mad.id_movimiento_almacen_detalle = madd.id_movimiento_almacen_detalle  and mad.id_articulo= madd.id_articulo),0) = (select id_unidad_compra from articulo where id_articulo = mad.id_articulo) )  
		THEN
			(ISNULL((select (cantidad * relacion_venta) / relacion_compra  from movimiento_almacen mcc LEFT JOIN 
			movimiento_almacen_detalle madd ON madd.id_movimiento_almacen = mcc.id_movimiento_almacen LEFT JOIN
			articulo a ON madd.id_articulo= a.id_articulo
			where mad.id_movimiento_almacen_detalle = madd.id_movimiento_almacen_detalle  and mad.id_articulo= madd.id_articulo and 
			(id_movimiento_almacen_tipo = 1 or id_movimiento_almacen_tipo = 2 or id_movimiento_almacen_tipo = 4
			or id_movimiento_almacen_tipo = 6 or id_movimiento_almacen_tipo = 7 or id_movimiento_almacen_tipo = 8 or id_movimiento_almacen_tipo = 14) ),0) )
		ELSE 
			(ISNULL((select  cantidad   from movimiento_almacen mcc LEFT JOIN 
			movimiento_almacen_detalle madd ON madd.id_movimiento_almacen = mcc.id_movimiento_almacen LEFT JOIN
			articulo a ON madd.id_articulo= a.id_articulo
			where mad.id_movimiento_almacen_detalle = madd.id_movimiento_almacen_detalle  and mad.id_articulo= madd.id_articulo and 
			(id_movimiento_almacen_tipo = 1 or id_movimiento_almacen_tipo = 2 or id_movimiento_almacen_tipo = 4
			or id_movimiento_almacen_tipo = 6 or id_movimiento_almacen_tipo = 7 or id_movimiento_almacen_tipo = 8 or id_movimiento_almacen_tipo = 14) ),0) ) END ) as EntradasU,
	(SELECT CASE 
		WHEN
			(ISNULL((select id_unidad_medida from movimiento_almacen mcc LEFT JOIN 
			movimiento_almacen_detalle madd ON madd.id_movimiento_almacen = mcc.id_movimiento_almacen
			where mad.id_movimiento_almacen_detalle = madd.id_movimiento_almacen_detalle  and mad.id_articulo= madd.id_articulo),0) = (select id_unidad_compra from articulo where id_articulo = mad.id_articulo) )  
		THEN
			(ISNULL((select (cantidad * relacion_venta) / relacion_compra  from movimiento_almacen mcc LEFT JOIN 
			movimiento_almacen_detalle madd ON madd.id_movimiento_almacen = mcc.id_movimiento_almacen LEFT JOIN
			articulo a ON madd.id_articulo= a.id_articulo
			where mad.id_movimiento_almacen_detalle = madd.id_movimiento_almacen_detalle  and mad.id_articulo= madd.id_articulo and 
			(id_movimiento_almacen_tipo = 3 or id_movimiento_almacen_tipo = 5 or id_movimiento_almacen_tipo = 9
			or id_movimiento_almacen_tipo = 10 or id_movimiento_almacen_tipo = 11 or id_movimiento_almacen_tipo = 12 
			or id_movimiento_almacen_tipo = 13 or id_movimiento_almacen_tipo = 15)),0) )
		ELSE 
			(ISNULL((select  cantidad   from movimiento_almacen mcc LEFT JOIN 
			movimiento_almacen_detalle madd ON madd.id_movimiento_almacen = mcc.id_movimiento_almacen LEFT JOIN
			articulo a ON madd.id_articulo= a.id_articulo
			where mad.id_movimiento_almacen_detalle = madd.id_movimiento_almacen_detalle  and mad.id_articulo= madd.id_articulo and 
			(id_movimiento_almacen_tipo = 3 or id_movimiento_almacen_tipo = 5 or id_movimiento_almacen_tipo = 9
			or id_movimiento_almacen_tipo = 10 or id_movimiento_almacen_tipo = 11 or id_movimiento_almacen_tipo = 12 
			or id_movimiento_almacen_tipo = 13 or id_movimiento_almacen_tipo = 15) ),0) ) END ) as SalidasU,
		costo_unitario,
		costo_ultimo,
		(SELECT CASE 
		WHEN
			(ISNULL((select id_unidad_medida from movimiento_almacen mcc LEFT JOIN 
			movimiento_almacen_detalle madd ON madd.id_movimiento_almacen = mcc.id_movimiento_almacen
			where mad.id_movimiento_almacen_detalle = madd.id_movimiento_almacen_detalle  and mad.id_articulo= madd.id_articulo),0) = (select id_unidad_compra from articulo where id_articulo = mad.id_articulo) )  
		THEN
			(ISNULL((select costo_unitario*((cantidad * relacion_venta) / relacion_compra)  from movimiento_almacen mcc LEFT JOIN 
			movimiento_almacen_detalle madd ON madd.id_movimiento_almacen = mcc.id_movimiento_almacen LEFT JOIN
			articulo a ON madd.id_articulo= a.id_articulo
			where mad.id_movimiento_almacen_detalle = madd.id_movimiento_almacen_detalle  and mad.id_articulo= madd.id_articulo and 
			(id_movimiento_almacen_tipo = 1 or id_movimiento_almacen_tipo = 2 or id_movimiento_almacen_tipo = 4
			or id_movimiento_almacen_tipo = 6 or id_movimiento_almacen_tipo = 7 or id_movimiento_almacen_tipo = 8 or id_movimiento_almacen_tipo = 14) ),0) )
		ELSE 
			(ISNULL((select  costo_unitario*cantidad   from movimiento_almacen mcc LEFT JOIN 
			movimiento_almacen_detalle madd ON madd.id_movimiento_almacen = mcc.id_movimiento_almacen LEFT JOIN
			articulo a ON madd.id_articulo= a.id_articulo
			where mad.id_movimiento_almacen_detalle = madd.id_movimiento_almacen_detalle  and mad.id_articulo= madd.id_articulo and 
			(id_movimiento_almacen_tipo = 1 or id_movimiento_almacen_tipo = 2 or id_movimiento_almacen_tipo = 4
			or id_movimiento_almacen_tipo = 6 or id_movimiento_almacen_tipo = 7 or id_movimiento_almacen_tipo = 8 or id_movimiento_almacen_tipo = 14) ),0) ) END ) as Entradas,
		(SELECT CASE 
		WHEN
			(ISNULL((select id_unidad_medida from movimiento_almacen mcc LEFT JOIN 
			movimiento_almacen_detalle madd ON madd.id_movimiento_almacen = mcc.id_movimiento_almacen
			where mad.id_movimiento_almacen_detalle = madd.id_movimiento_almacen_detalle  and mad.id_articulo= madd.id_articulo),0) = (select id_unidad_compra from articulo where id_articulo = mad.id_articulo) )  
		THEN
			(ISNULL((select costo_unitario*((cantidad * relacion_venta) / relacion_compra)  from movimiento_almacen mcc LEFT JOIN 
			movimiento_almacen_detalle madd ON madd.id_movimiento_almacen = mcc.id_movimiento_almacen LEFT JOIN
			articulo a ON madd.id_articulo= a.id_articulo
			where mad.id_movimiento_almacen_detalle = madd.id_movimiento_almacen_detalle  and mad.id_articulo= madd.id_articulo and 
			(id_movimiento_almacen_tipo = 3 or id_movimiento_almacen_tipo = 5 or id_movimiento_almacen_tipo = 9
			or id_movimiento_almacen_tipo = 10 or id_movimiento_almacen_tipo = 11 or id_movimiento_almacen_tipo = 12 or id_movimiento_almacen_tipo = 15) ),0) )
		ELSE 
			(ISNULL((select  costo_unitario*cantidad   from movimiento_almacen mcc LEFT JOIN 
			movimiento_almacen_detalle madd ON madd.id_movimiento_almacen = mcc.id_movimiento_almacen LEFT JOIN
			articulo a ON madd.id_articulo= a.id_articulo
			where mad.id_movimiento_almacen_detalle = madd.id_movimiento_almacen_detalle  and mad.id_articulo= madd.id_articulo and 
			(id_movimiento_almacen_tipo = 3 or id_movimiento_almacen_tipo = 5 or id_movimiento_almacen_tipo = 9
			or id_movimiento_almacen_tipo = 10 or id_movimiento_almacen_tipo = 11 or id_movimiento_almacen_tipo = 12  or id_movimiento_almacen_tipo = 15) ),0) ) END ) as Salidas,

		existencia_al_momento as existencia_al_momento,
		(existencia_al_momento * costo_unitario) as existencia_valor,
		al.id_almacen,
		al.clave as almacen,
		a.relacion_venta,
		um.descripcion

from	movimiento_almacen mc LEFT JOIN 
		movimiento_almacen_detalle mad ON mad.id_movimiento_almacen = mc.id_movimiento_almacen LEFT JOIN
		movimiento_almacen_tipo mat ON mat.id_movimiento_almacen_tipo = mc.id_movimiento_almacen_tipo lEFT JOIN 
		articulo a ON mad.id_articulo=a.id_articulo LEFT JOIN
		almacen al ON al.id_almacen = mad.id_almacen LEFT JOIN 
		unidad_medida um ON um.id_unidad_medida = a.id_unidad_venta
GO
/****** Object:  View [dbo].[VtReporteExistencias]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VtReporteExistencias]
AS
select
	distinct(a.clave + al.clave) as unico,
    a.clave as articulo,
	a.desc_super as descripcion,
    al.clave as almacen,
    ae.existencia_actual as actual,
    ae.existencia_venta as venta,
    ae.existencia_apartado as apartado,
    ISNULL(p.id_proveedor,0) as id_proveedor,
    ISNULL(p.clave,'---') as proveedor,
    al.id_sucursal as id_sucursal,
	s.clave_sucursal
from
    articulo_existencia as ae join articulo as a on ae.id_articulo = a.id_articulo
    left  join almacen as al on ae.id_almacen = al.id_almacen
    left join articulo_proveedor as ap on ae.id_articulo = ap.id_articulo
    left join proveedor as p on ap.id_proveedor = p.id_proveedor 
	left join sucursal as s on s.id_sucursal = al.id_sucursal
	group by 
    a.clave ,
	a.desc_super,
    al.clave,
    ae.existencia_actual,
    ae.existencia_venta ,
    ae.existencia_apartado,
    p.id_proveedor ,
    p.clave,
    al.id_sucursal,
	s.clave_sucursal
GO
/****** Object:  View [dbo].[VtReporteGerencial]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VtReporteGerencial]
AS
	SELECT	convert(NVARCHAR, mc.fecha_registro, 103) as 'fecha',
		convert(char(8), mc.fecha_registro, 108) as 'horaCaptura',
		ISNULL(mc.id_cliente,0)as id_cliente,
		rfc,
		no_caja,
		mc.folio as folio,
		total_neto,
		mc.subtotal, 
		total_iva as iva ,
		total_ieps as ieps,
		id_movimiento_almacen_tipo,
		mc.descuento,
		mc.id_sucursal, 
		mc.id_caja,
		con.folio as folioCon,
		mc.fecha_registro,
		ISNULL(f.folio_fiscal,' ')as folio_fiscal
from	movimiento_almacen mc LEFT JOIN 
		cliente c ON c.id_cliente = mc.id_cliente LEFT JOIN 
		datos_facturacion df ON df.id_datos_facturacion = c.id_datos_facturacion LEFT JOIN
		caja ON caja.id_caja = mc.id_caja LEFT JOIN 
		consolidacion con ON con.id_consolidacion = mc.id_consolidacion LEFT JOIN 
		facturacion f ON f.id_facturacion = mc.id_facturacion
GO
/****** Object:  View [dbo].[VtReporteListaPrecios]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Carlos Negrete
CREATE VIEW [dbo].[VtReporteListaPrecios]
AS
	SELECT	 a.id_articulo,
			a.clave, 
			codigo_barras1,
			desc_super,
			ISNULL((Select precio_venta from articulo_precio where id_articulo= a.id_articulo and no_orden=1) + (select tasa from impuesto where id_impuesto = id_iva_venta )*(Select precio_venta from articulo_precio where id_articulo= a.id_articulo and no_orden=1)/100+ (select tasa from impuesto where id_impuesto = id_ieps_venta )*(Select precio_venta from articulo_precio where id_articulo= a.id_articulo and no_orden=1)/100 ,0) as precio1,
			ISNULL((Select precio_venta from articulo_precio where id_articulo= a.id_articulo and no_orden=2)+ (select tasa from impuesto where id_impuesto = id_iva_venta )*(Select precio_venta from articulo_precio where id_articulo= a.id_articulo and no_orden=2)/100+ (select tasa from impuesto where id_impuesto = id_ieps_venta )*(Select precio_venta from articulo_precio where id_articulo= a.id_articulo and no_orden=2)/100,0) as precio2,
			ISNULL((Select precio_venta from articulo_precio where id_articulo= a.id_articulo and no_orden=3)+ (select tasa from impuesto where id_impuesto = id_iva_venta )*(Select precio_venta from articulo_precio where id_articulo= a.id_articulo and no_orden=3)/100+ (select tasa from impuesto where id_impuesto = id_ieps_venta )*(Select precio_venta from articulo_precio where id_articulo= a.id_articulo and no_orden=3)/100,0) as precio3,
			(select MAX(fecha_modificacion) from articulo_precio where id_articulo= a.id_articulo) as fecha_ultima_modificacion,
			id_linea_negocio,
			ap.id_proveedor,
			agrp.id_familia,
			ae.id_articulo_existencia,
			a.relacion_compra,
			a.relacion_venta,
			(select id_sucursal from almacen al LEFT JOIN articulo_existencia aex ON al.id_almacen =aex.id_almacen where ae.id_articulo_existencia= aex.id_articulo_existencia)as id_sucursal
			,fecha_modificacion
	from	articulo  a LEFT JOIN 
			articulo_proveedor ap ON ap.id_articulo=a.id_articulo LEFT JOIN
			agrupador_articulo agrp ON agrp.id_agrupador_articulo= a.id_agrupador_articulo LEFT JOIN
			articulo_existencia ae ON ae.id_articulo=a.id_articulo 
			LEFT JOIN
			articulo_precio artp ON artp.id_articulo =a.id_articulo
	where a.id_articulo= a.id_articulo
GO
/****** Object:  View [dbo].[VtReportePromocion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VtReportePromocion]
AS
	SELECT	clave, 
			p.id_promocion_tipo, 
			descripcion, 
			p.nombre as promocion,
			(dbo.fnObtenerArticulosPromocion(p.id_promocion)) as articulos,
			(dbo.fnObtenerCantidadesPromocion(p.id_promocion, p.id_promocion_tipo))as cantidades,
			convert(NVARCHAR, vigencia_inicio, 103) AS vigencia_inicio,
			convert(NVARCHAR, vigencia_fin, 103) AS vigencia_fin, 
			limite_sucursal,
			p.id_sucursal,
			s.nombre,
			id_promocion_aplicacion, 
			fecha_registro as vigencia,
			aplicadas,
			id_promocion_venta
	from	promocion_venta pv LEFT JOIN 
			promocion p ON p.id_promocion =pv.id_promocion LEFT JOIN
			promocion_tipo pt ON pt.id_promocion_tipo= p.id_promocion_tipo LEFT JOIN
			sucursal s ON s.id_sucursal = p.id_sucursal
GO
/****** Object:  View [dbo].[VtReporteRecargas]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VtReporteRecargas]
AS
	select
		r.id_sucursal AS id_suc,
		s.clave_sucursal AS clave_sucursal,
		r.fecha AS fecha_date,
		Convert(DATE, r.fecha) AS fecha,
		Convert(TIME, r.fecha) AS hora,
		ISNULL(a.clave, '--') as articulo,
		(CASE r.id_estatus WHEN 0 THEN 'Si' ELSE 'No' END) AS aplicada,
		ISNULL(ma.folio, '--') AS Documento,
		ISNULL(r.autorizacion, '--') AS autorizacion,
		r.telefono,
		r.monto,
		r.id_estatus AS id_estatus,
		(CASE WHEN r.id_estatus = 0 THEN 'EXITO' WHEN r.id_estatus IS NULL THEN 'Sin Informaci�n' ELSE r.descripcion_estatus END) as estatus,
		r.id_caja,
		c.no_caja
	FROM
		recarga r LEFT JOIN recarga_estatus rs on r.id_estatus = rs.id_recarga_estatus
		LEFT JOIN movimiento_almacen ma on r.id_movimiento_almacen = ma.id_movimiento_almacen
		LEFT JOIN movimiento_almacen_detalle mad on ma.id_movimiento_almacen = mad.id_movimiento_almacen
		LEFT JOIN articulo a on mad.id_articulo = a.id_articulo
		LEFT JOIN caja c on r.id_caja = c.id_caja
		JOIN sucursal s on r.id_sucursal = s.id_sucursal
GO
/****** Object:  View [dbo].[VtReporteRetiros]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Carlos Negrete
CREATE VIEW [dbo].[VtReporteRetiros]
AS
	SELECT	
		convert(nvarchar, mc.fecha_registro,103)as fecha,
		mc.id_caja,
		caja.no_caja,
		u.nombre as nombre_caja,
		mc.folio,
		convert(nvarchar, mc.fecha_registro,108)as hora,
		importe_total,
		mct.nombre as tipomc,
		fp.descripcion,
		mc.observaciones,
		mc.id_movimiento_caja_tipo,
		mc.fecha_registro,
		caja.habilitada,
		mc.id_sucursal
	from 
		movimiento_caja mc LEFT JOIN 
		caja ON caja.id_caja = mc.id_caja LEFT JOIN
		movimiento_caja_tipo mct ON mct.id_movimiento_caja_tipo = mc.id_movimiento_caja_tipo LEFT JOIN
		forma_pago fp ON fp.id_forma_pago = mc.id_forma_pago LEFT JOIN
		usuario as u on mc.id_usuario_logueado = u.id_usuario
GO
/****** Object:  View [dbo].[VtReporteTotalesPorPago]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Carlos Negrete
CREATE VIEW [dbo].[VtReporteTotalesPorPago]
AS
	SELECT	mc.fecha_registro,
			no_caja,
			ISNULL(u.nombre,'--')as nombre ,
			folio,
			importe_total,
			mc.id_forma_pago,
			fp.descripcion,
			mc.id_movimiento_caja_tipo,
			mct.nombre as tipo,
			mc.id_movimiento_caja_concepto,
			mcc.nombre as concepto,
			mc.id_sucursal,
			fp.activo
	from	movimiento_caja  mc LEFT JOIN 
			caja c ON c.id_caja = mc.id_caja LEFT JOIN 
			usuario u ON u.id_caja_actual= mc.id_caja lEFT JOIN
			forma_pago fp ON mc.id_forma_pago= fp.id_forma_pago LEFT JOIN
			movimiento_caja_tipo mct ON mct.id_movimiento_caja_tipo = mc.id_movimiento_caja_tipo LEFT JOIN
			movimiento_caja_concepto mcc ON mcc.id_movimiento_caja_concepto = mc.id_movimiento_caja_concepto
GO
/****** Object:  View [dbo].[VtReporteVenta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Carlos Negrete
CREATE VIEW [dbo].[VtReporteVenta]
AS
	SELECT	
		fecha_registro,
		convert(nvarchar, mc.fecha_registro,103)as fecha_string,
		convert(nvarchar, mc.fecha_registro,108)as hora_string,
		caja.no_caja,
		folio,
		(case  WHEN (devuelto = 1) THEN (SELECT folio from movimiento_almacen where referencia = mc.folio) ELSE (ISNULL((select folio_fiscal FROM facturacion f WHERE mc.id_facturacion = f.id_facturacion),'--')) END) as folio_fiscal,
		subtotal,
		total_iva as iva , 
		total_ieps as ieps,
		total_neto,
		mc.id_sucursal,
		mc.id_caja
	from movimiento_almacen mc LEFT JOIN 
	caja ON caja.id_caja = mc.id_caja 
	where id_movimiento_almacen_tipo =12
GO
/****** Object:  View [dbo].[VtReporteVentaUtilidad]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carolina Franco
-- Create date: 21 Abril 2019
-- Description:	SP
-- =============================================

CREATE VIEW [dbo].[VtReporteVentaUtilidad]
AS
	select	 
		ma.id_movimiento_almacen,
		ma.id_sucursal,
		s.clave_sucursal,
		al.clave as clave_almacen,
		mad.id_articulo, 
		a.id_agrupador_articulo,
		a.id_subcategoria,
		a.id_linea_negocio,
		a.desc_super,
		a.clave as clave_articulo,
		agp.clave as agrupador_clave,
		ma.fecha_registro,
		ma.id_movimiento_almacen_tipo,
		CASE ma.id_movimiento_almacen_tipo WHEN 7 THEN (mad.cantidad * -1) WHEN 12 THEN (mad.cantidad) END as cantidad,
		CASE ma.id_movimiento_almacen_tipo WHEN 7 THEN (mad.cantidad / a.relacion_venta) * -1 WHEN 12 THEN (mad.cantidad / a.relacion_venta) END as cantidad_uc,
		CASE ma.id_movimiento_almacen_tipo WHEN 7 THEN (a.costo_ultimo / a.relacion_venta * -1) WHEN 12 THEN (a.costo_ultimo / a.relacion_venta) END as costo_ultimo,
		CASE ma.id_movimiento_almacen_tipo WHEN 7 THEN ISNULL(mad.costo, 0) * -1 WHEN 12 THEN ISNULL(mad.costo, 0) END as costo,
		CASE ma.id_movimiento_almacen_tipo WHEN 7 THEN (mad.subtotal * -1) WHEN 12 THEN (mad.subtotal) END as total_venta,
		1.00 as utilidad_brutal, 
		0 as utilidad_porcentaje,
		CASE ma.id_movimiento_almacen_tipo WHEN 7 THEN (ISNULL(mad.costo, 0) + (ISNULL(mad.costo, 0) * (mad.tasa_iva / 100.0)) + (ISNULL(mad.costo, 0) * (mad.tasa_ieps / 100.0))) * -1 WHEN 12 THEN (ISNULL(mad.costo, 0) + (ISNULL(mad.costo, 0) * (mad.tasa_iva / 100.0)) + (ISNULL(mad.costo, 0) * (mad.tasa_ieps / 100.0))) END as costo_neto,
		CASE ma.id_movimiento_almacen_tipo WHEN 7 THEN (mad.importe * -1) WHEN 12 THEN mad.importe END as total_venta_neta,
		CASE ma.id_movimiento_almacen_tipo WHEN 7 THEN (mad.ieps * -1) WHEN 12 THEN mad.ieps END as Ieps,
		CASE ma.id_movimiento_almacen_tipo WHEN 7 THEN (mad.iva * -1) WHEN 12 THEN mad.iva END as Iva,
		mad.id_almacen,
		ln.descripcion as linea,
		CASE 
			WHEN mad.importe != 0 THEN '--' 
			ELSE 
			(
				select 
					p.clave 
				from 
					promocion_venta pv join promocion p on pv.id_promocion = p.id_promocion
				where 
					id_ticket = mad.id_movimiento_almacen and id_articulo_regalo = mad.id_articulo
			)
		END as promocion
	from	
		movimiento_almacen as ma LEFT JOIN movimiento_almacen_detalle as mad ON ma.id_movimiento_almacen = mad.id_movimiento_almacen
		LEFT JOIN articulo as a ON mad.id_articulo = a.id_articulo 
		LEFT JOIN agrupador_articulo as agp ON a.id_agrupador_articulo = agp.id_agrupador_articulo 
		LEFT JOIN sucursal s ON ma.id_sucursal = s.id_sucursal 
		LEFT JOIN almacen as al ON mad.id_almacen = al.id_almacen
		LEFT JOIN linea_negocio as ln ON ln.id_linea_negocio = a.id_linea_negocio
	where 
		ma.id_movimiento_almacen_tipo in (12, 7) -- Para reportar ventas y devoluciones
GO
ALTER TABLE [dbo].[agrupador_articulo]  WITH CHECK ADD  CONSTRAINT [FK_agrupador_articulo-familia] FOREIGN KEY([id_familia])
REFERENCES [dbo].[familia] ([id_familia])
GO
ALTER TABLE [dbo].[agrupador_articulo] CHECK CONSTRAINT [FK_agrupador_articulo-familia]
GO
ALTER TABLE [dbo].[almacen]  WITH CHECK ADD  CONSTRAINT [FK_almacen_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[almacen] CHECK CONSTRAINT [FK_almacen_sucursal]
GO
ALTER TABLE [dbo].[arqueo]  WITH CHECK ADD  CONSTRAINT [FK_arqueo_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[arqueo] CHECK CONSTRAINT [FK_arqueo_caja]
GO
ALTER TABLE [dbo].[arqueo]  WITH CHECK ADD  CONSTRAINT [FK_arqueo_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[arqueo] CHECK CONSTRAINT [FK_arqueo_sucursal]
GO
ALTER TABLE [dbo].[arqueo]  WITH CHECK ADD  CONSTRAINT [FK_arqueo_usuario_autorizo] FOREIGN KEY([id_usuario_autorizo])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[arqueo] CHECK CONSTRAINT [FK_arqueo_usuario_autorizo]
GO
ALTER TABLE [dbo].[arqueo]  WITH CHECK ADD  CONSTRAINT [FK_arqueo_usuario_logueado] FOREIGN KEY([id_usuario_logueado])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[arqueo] CHECK CONSTRAINT [FK_arqueo_usuario_logueado]
GO
ALTER TABLE [dbo].[arqueo_desglose]  WITH CHECK ADD  CONSTRAINT [FK_arqueo_desglose_arqueo] FOREIGN KEY([id_arqueo])
REFERENCES [dbo].[arqueo] ([id_arqueo])
GO
ALTER TABLE [dbo].[arqueo_desglose] CHECK CONSTRAINT [FK_arqueo_desglose_arqueo]
GO
ALTER TABLE [dbo].[arqueo_desglose]  WITH CHECK ADD  CONSTRAINT [FK_arqueo_desglose_denominacion] FOREIGN KEY([id_denominacion])
REFERENCES [dbo].[denominacion] ([id_denominacion])
GO
ALTER TABLE [dbo].[arqueo_desglose] CHECK CONSTRAINT [FK_arqueo_desglose_denominacion]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_agrupador_articulo] FOREIGN KEY([id_agrupador_articulo])
REFERENCES [dbo].[agrupador_articulo] ([id_agrupador_articulo])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_agrupador_articulo]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_articulo_adicionales] FOREIGN KEY([id_articulo_adicionales])
REFERENCES [dbo].[articulo_adicionales] ([id_articulo_adicionales])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_articulo_adicionales]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_compra_unidad_medida] FOREIGN KEY([id_unidad_compra])
REFERENCES [dbo].[unidad_medida] ([id_unidad_medida])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_compra_unidad_medida]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_familia] FOREIGN KEY([id_familia])
REFERENCES [dbo].[familia] ([id_familia])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_familia]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_ieps_compra_impuesto] FOREIGN KEY([id_ieps_compra])
REFERENCES [dbo].[impuesto] ([id_impuesto])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_ieps_compra_impuesto]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_ieps_venta_impuesto] FOREIGN KEY([id_ieps_venta])
REFERENCES [dbo].[impuesto] ([id_impuesto])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_ieps_venta_impuesto]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_iva_compra_impuesto] FOREIGN KEY([id_iva_compra])
REFERENCES [dbo].[impuesto] ([id_impuesto])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_iva_compra_impuesto]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_iva_venta_impuesto] FOREIGN KEY([id_iva_venta])
REFERENCES [dbo].[impuesto] ([id_impuesto])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_iva_venta_impuesto]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_linea_negocio] FOREIGN KEY([id_linea_negocio])
REFERENCES [dbo].[linea_negocio] ([id_linea_negocio])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_linea_negocio]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[marca] ([id_marca])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_marca]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_subcategoria] FOREIGN KEY([id_subcategoria])
REFERENCES [dbo].[subcategoria] ([id_subcategoria])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_subcategoria]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_submarca] FOREIGN KEY([id_submarca])
REFERENCES [dbo].[submarca] ([id_submarca])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_submarca]
GO
ALTER TABLE [dbo].[articulo]  WITH CHECK ADD  CONSTRAINT [FK_articulo_venta_unidad_medida] FOREIGN KEY([id_unidad_venta])
REFERENCES [dbo].[unidad_medida] ([id_unidad_medida])
GO
ALTER TABLE [dbo].[articulo] CHECK CONSTRAINT [FK_articulo_venta_unidad_medida]
GO
ALTER TABLE [dbo].[articulo_equivalente]  WITH CHECK ADD  CONSTRAINT [FK_articulo_equivalente_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[articulo_equivalente] CHECK CONSTRAINT [FK_articulo_equivalente_articulo]
GO
ALTER TABLE [dbo].[articulo_existencia]  WITH CHECK ADD  CONSTRAINT [FK_articulo_existencia_almacen] FOREIGN KEY([id_almacen])
REFERENCES [dbo].[almacen] ([id_almacen])
GO
ALTER TABLE [dbo].[articulo_existencia] CHECK CONSTRAINT [FK_articulo_existencia_almacen]
GO
ALTER TABLE [dbo].[articulo_existencia]  WITH CHECK ADD  CONSTRAINT [FK_articulo_existencia_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[articulo_existencia] CHECK CONSTRAINT [FK_articulo_existencia_articulo]
GO
ALTER TABLE [dbo].[articulo_oferta]  WITH CHECK ADD  CONSTRAINT [FK_art_oferta_oferta_tipo] FOREIGN KEY([id_oferta_tipo])
REFERENCES [dbo].[oferta_tipo] ([id_oferta_tipo])
GO
ALTER TABLE [dbo].[articulo_oferta] CHECK CONSTRAINT [FK_art_oferta_oferta_tipo]
GO
ALTER TABLE [dbo].[articulo_oferta]  WITH CHECK ADD  CONSTRAINT [FK_articulo_oferta_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[articulo_oferta] CHECK CONSTRAINT [FK_articulo_oferta_articulo]
GO
ALTER TABLE [dbo].[articulo_precio]  WITH CHECK ADD  CONSTRAINT [FK_articulo_precio_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[articulo_precio] CHECK CONSTRAINT [FK_articulo_precio_articulo]
GO
ALTER TABLE [dbo].[articulo_proveedor]  WITH CHECK ADD  CONSTRAINT [FK_articulo_proveedor_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[articulo_proveedor] CHECK CONSTRAINT [FK_articulo_proveedor_articulo]
GO
ALTER TABLE [dbo].[articulo_proveedor]  WITH CHECK ADD  CONSTRAINT [FK_articulo_proveedor_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[articulo_proveedor] CHECK CONSTRAINT [FK_articulo_proveedor_proveedor]
GO
ALTER TABLE [dbo].[articulo_sucursal_mayoreo]  WITH CHECK ADD  CONSTRAINT [FK_art_suc_may_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[articulo_sucursal_mayoreo] CHECK CONSTRAINT [FK_art_suc_may_articulo]
GO
ALTER TABLE [dbo].[articulo_sucursal_mayoreo]  WITH CHECK ADD  CONSTRAINT [FK_art_suc_may_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[articulo_sucursal_mayoreo] CHECK CONSTRAINT [FK_art_suc_may_sucursal]
GO
ALTER TABLE [dbo].[auditoria]  WITH CHECK ADD  CONSTRAINT [FK_auditoria_almacen] FOREIGN KEY([id_almacen])
REFERENCES [dbo].[almacen] ([id_almacen])
GO
ALTER TABLE [dbo].[auditoria] CHECK CONSTRAINT [FK_auditoria_almacen]
GO
ALTER TABLE [dbo].[auditoria]  WITH CHECK ADD  CONSTRAINT [FK_auditoria_auditoria_estatus] FOREIGN KEY([id_auditoria_estatus])
REFERENCES [dbo].[auditoria_estatus] ([id_auditoria_estatus])
GO
ALTER TABLE [dbo].[auditoria] CHECK CONSTRAINT [FK_auditoria_auditoria_estatus]
GO
ALTER TABLE [dbo].[auditoria]  WITH CHECK ADD  CONSTRAINT [FK_auditoria_auditoria_tipo] FOREIGN KEY([id_auditoria_tipo])
REFERENCES [dbo].[auditoria_tipo] ([id_auditoria_tipo])
GO
ALTER TABLE [dbo].[auditoria] CHECK CONSTRAINT [FK_auditoria_auditoria_tipo]
GO
ALTER TABLE [dbo].[auditoria]  WITH CHECK ADD  CONSTRAINT [FK_auditoria_usuario_aplico] FOREIGN KEY([id_aplico])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[auditoria] CHECK CONSTRAINT [FK_auditoria_usuario_aplico]
GO
ALTER TABLE [dbo].[auditoria]  WITH CHECK ADD  CONSTRAINT [FK_auditoria_usuario_conto] FOREIGN KEY([id_conto])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[auditoria] CHECK CONSTRAINT [FK_auditoria_usuario_conto]
GO
ALTER TABLE [dbo].[auditoria]  WITH CHECK ADD  CONSTRAINT [FK_auditoria_usuario_inicio] FOREIGN KEY([id_inicio])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[auditoria] CHECK CONSTRAINT [FK_auditoria_usuario_inicio]
GO
ALTER TABLE [dbo].[auditoria_detalle]  WITH CHECK ADD  CONSTRAINT [FK_auditoria_detalle_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[auditoria_detalle] CHECK CONSTRAINT [FK_auditoria_detalle_articulo]
GO
ALTER TABLE [dbo].[auditoria_detalle]  WITH CHECK ADD  CONSTRAINT [FK_auditoria_detalle_auditoria] FOREIGN KEY([id_auditoria])
REFERENCES [dbo].[auditoria] ([id_auditoria])
GO
ALTER TABLE [dbo].[auditoria_detalle] CHECK CONSTRAINT [FK_auditoria_detalle_auditoria]
GO
ALTER TABLE [dbo].[autorizacion]  WITH CHECK ADD  CONSTRAINT [FK_autorizacion_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[autorizacion] CHECK CONSTRAINT [FK_autorizacion_caja]
GO
ALTER TABLE [dbo].[autorizacion]  WITH CHECK ADD  CONSTRAINT [FK_autorizacion_perfil] FOREIGN KEY([id_perfil_autorizo])
REFERENCES [dbo].[perfil] ([id_perfil])
GO
ALTER TABLE [dbo].[autorizacion] CHECK CONSTRAINT [FK_autorizacion_perfil]
GO
ALTER TABLE [dbo].[autorizacion]  WITH CHECK ADD  CONSTRAINT [FK_autorizacion_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[autorizacion] CHECK CONSTRAINT [FK_autorizacion_usuario]
GO
ALTER TABLE [dbo].[bitacora_impresion]  WITH CHECK ADD  CONSTRAINT [FK_bitacora_impresion_modulo] FOREIGN KEY([id_modulo])
REFERENCES [dbo].[modulo] ([id_modulo])
GO
ALTER TABLE [dbo].[bitacora_impresion] CHECK CONSTRAINT [FK_bitacora_impresion_modulo]
GO
ALTER TABLE [dbo].[bitacora_impresion]  WITH CHECK ADD  CONSTRAINT [FK_bitacora_impresion_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[bitacora_impresion] CHECK CONSTRAINT [FK_bitacora_impresion_usuario]
GO
ALTER TABLE [dbo].[caja]  WITH CHECK ADD  CONSTRAINT [FK_caja_almacen] FOREIGN KEY([id_almacen])
REFERENCES [dbo].[almacen] ([id_almacen])
GO
ALTER TABLE [dbo].[caja] CHECK CONSTRAINT [FK_caja_almacen]
GO
ALTER TABLE [dbo].[caja]  WITH CHECK ADD  CONSTRAINT [FK_caja_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[caja] CHECK CONSTRAINT [FK_caja_sucursal]
GO
ALTER TABLE [dbo].[caja]  WITH CHECK ADD  CONSTRAINT [FK_caja_tipo_caja] FOREIGN KEY([id_tipo_caja])
REFERENCES [dbo].[tipo_caja] ([id_tipo_caja])
GO
ALTER TABLE [dbo].[caja] CHECK CONSTRAINT [FK_caja_tipo_caja]
GO
ALTER TABLE [dbo].[cierre]  WITH CHECK ADD  CONSTRAINT [FK_cierre_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[cierre] CHECK CONSTRAINT [FK_cierre_caja]
GO
ALTER TABLE [dbo].[cierre]  WITH CHECK ADD  CONSTRAINT [FK_cierre_movimiento_final] FOREIGN KEY([id_movimiento_final])
REFERENCES [dbo].[movimiento_caja] ([id_movimiento_caja])
GO
ALTER TABLE [dbo].[cierre] CHECK CONSTRAINT [FK_cierre_movimiento_final]
GO
ALTER TABLE [dbo].[cierre]  WITH CHECK ADD  CONSTRAINT [FK_cierre_movimiento_inicial] FOREIGN KEY([id_movimiento_inicial])
REFERENCES [dbo].[movimiento_caja] ([id_movimiento_caja])
GO
ALTER TABLE [dbo].[cierre] CHECK CONSTRAINT [FK_cierre_movimiento_inicial]
GO
ALTER TABLE [dbo].[cierre]  WITH CHECK ADD  CONSTRAINT [FK_cierre_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[cierre] CHECK CONSTRAINT [FK_cierre_sucursal]
GO
ALTER TABLE [dbo].[cierre]  WITH CHECK ADD  CONSTRAINT [FK_cierre_usuario_autorizo] FOREIGN KEY([id_usuario_autorizo])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[cierre] CHECK CONSTRAINT [FK_cierre_usuario_autorizo]
GO
ALTER TABLE [dbo].[cierre]  WITH CHECK ADD  CONSTRAINT [FK_cierre_usuario_logueado] FOREIGN KEY([id_usuario_logueado])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[cierre] CHECK CONSTRAINT [FK_cierre_usuario_logueado]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_datos_facturacion] FOREIGN KEY([id_datos_facturacion])
REFERENCES [dbo].[datos_facturacion] ([id_datos_facturacion])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_datos_facturacion]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_forma_pago] FOREIGN KEY([id_forma_pago])
REFERENCES [dbo].[forma_pago] ([id_forma_pago])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_forma_pago]
GO
ALTER TABLE [dbo].[colonia]  WITH CHECK ADD  CONSTRAINT [FK_colonia_cp] FOREIGN KEY([id_cp])
REFERENCES [dbo].[cp] ([id_cp])
GO
ALTER TABLE [dbo].[colonia] CHECK CONSTRAINT [FK_colonia_cp]
GO
ALTER TABLE [dbo].[configuracion_facturacion]  WITH CHECK ADD  CONSTRAINT [FK_configuracion_facturacion_cliente] FOREIGN KEY([id_cliente_global])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[configuracion_facturacion] CHECK CONSTRAINT [FK_configuracion_facturacion_cliente]
GO
ALTER TABLE [dbo].[configuracion_facturacion]  WITH CHECK ADD  CONSTRAINT [FK_configuracion_facturacion_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[configuracion_facturacion] CHECK CONSTRAINT [FK_configuracion_facturacion_sucursal]
GO
ALTER TABLE [dbo].[configuracion_seguridad]  WITH CHECK ADD  CONSTRAINT [FK_configuracion_seguridad_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[configuracion_seguridad] CHECK CONSTRAINT [FK_configuracion_seguridad_sucursal]
GO
ALTER TABLE [dbo].[configuracion_seguridad]  WITH CHECK ADD  CONSTRAINT [FK_configuracion_seguridad_usuario] FOREIGN KEY([modificado_por])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[configuracion_seguridad] CHECK CONSTRAINT [FK_configuracion_seguridad_usuario]
GO
ALTER TABLE [dbo].[consolidacion]  WITH CHECK ADD  CONSTRAINT [FK_consolidacion_facturacion] FOREIGN KEY([id_facturacion])
REFERENCES [dbo].[facturacion] ([id_facturacion])
GO
ALTER TABLE [dbo].[consolidacion] CHECK CONSTRAINT [FK_consolidacion_facturacion]
GO
ALTER TABLE [dbo].[consolidacion]  WITH CHECK ADD  CONSTRAINT [FK_consolidacion_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[consolidacion] CHECK CONSTRAINT [FK_consolidacion_sucursal]
GO
ALTER TABLE [dbo].[consolidacion]  WITH CHECK ADD  CONSTRAINT [FK_consolidacion_usuario] FOREIGN KEY([id_autorizo])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[consolidacion] CHECK CONSTRAINT [FK_consolidacion_usuario]
GO
ALTER TABLE [dbo].[cotizacion]  WITH CHECK ADD  CONSTRAINT [FK_cotizacion_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[cotizacion] CHECK CONSTRAINT [FK_cotizacion_caja]
GO
ALTER TABLE [dbo].[cotizacion]  WITH CHECK ADD  CONSTRAINT [FK_cotizacion_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[cotizacion] CHECK CONSTRAINT [FK_cotizacion_cliente]
GO
ALTER TABLE [dbo].[cotizacion]  WITH CHECK ADD  CONSTRAINT [FK_cotizacion_movimiento_almacen] FOREIGN KEY([id_venta])
REFERENCES [dbo].[movimiento_almacen] ([id_movimiento_almacen])
GO
ALTER TABLE [dbo].[cotizacion] CHECK CONSTRAINT [FK_cotizacion_movimiento_almacen]
GO
ALTER TABLE [dbo].[cotizacion]  WITH CHECK ADD  CONSTRAINT [FK_cotizacion_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[cotizacion] CHECK CONSTRAINT [FK_cotizacion_sucursal]
GO
ALTER TABLE [dbo].[cotizacion]  WITH CHECK ADD  CONSTRAINT [FK_cotizacion_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[cotizacion] CHECK CONSTRAINT [FK_cotizacion_usuario]
GO
ALTER TABLE [dbo].[cotizacion_detalle]  WITH CHECK ADD  CONSTRAINT [FK_cotazion_detalle_cotizacion] FOREIGN KEY([id_cotizacion])
REFERENCES [dbo].[cotizacion] ([id_cotizacion])
GO
ALTER TABLE [dbo].[cotizacion_detalle] CHECK CONSTRAINT [FK_cotazion_detalle_cotizacion]
GO
ALTER TABLE [dbo].[cotizacion_detalle]  WITH CHECK ADD  CONSTRAINT [FK_cotizacion_detalle_almacen] FOREIGN KEY([id_almacen])
REFERENCES [dbo].[almacen] ([id_almacen])
GO
ALTER TABLE [dbo].[cotizacion_detalle] CHECK CONSTRAINT [FK_cotizacion_detalle_almacen]
GO
ALTER TABLE [dbo].[cotizacion_detalle]  WITH CHECK ADD  CONSTRAINT [FK_cotizacion_detalle_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[cotizacion_detalle] CHECK CONSTRAINT [FK_cotizacion_detalle_articulo]
GO
ALTER TABLE [dbo].[cotizacion_detalle]  WITH CHECK ADD  CONSTRAINT [FK_cotizacion_detalle_unidad_medida] FOREIGN KEY([id_unidad_medida])
REFERENCES [dbo].[unidad_medida] ([id_unidad_medida])
GO
ALTER TABLE [dbo].[cotizacion_detalle] CHECK CONSTRAINT [FK_cotizacion_detalle_unidad_medida]
GO
ALTER TABLE [dbo].[cp]  WITH CHECK ADD  CONSTRAINT [FK_cp_estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id_estado])
GO
ALTER TABLE [dbo].[cp] CHECK CONSTRAINT [FK_cp_estado]
GO
ALTER TABLE [dbo].[cp]  WITH CHECK ADD  CONSTRAINT [FK_cp_municipio] FOREIGN KEY([id_municipio])
REFERENCES [dbo].[municipio] ([id_municipio])
GO
ALTER TABLE [dbo].[cp] CHECK CONSTRAINT [FK_cp_municipio]
GO
ALTER TABLE [dbo].[datos_facturacion]  WITH CHECK ADD  CONSTRAINT [FK_datos_facturacion_colonia] FOREIGN KEY([id_colonia])
REFERENCES [dbo].[colonia] ([id_colonia])
GO
ALTER TABLE [dbo].[datos_facturacion] CHECK CONSTRAINT [FK_datos_facturacion_colonia]
GO
ALTER TABLE [dbo].[datos_facturacion]  WITH CHECK ADD  CONSTRAINT [FK_datos_facturacion_cp] FOREIGN KEY([id_cp])
REFERENCES [dbo].[cp] ([id_cp])
GO
ALTER TABLE [dbo].[datos_facturacion] CHECK CONSTRAINT [FK_datos_facturacion_cp]
GO
ALTER TABLE [dbo].[datos_facturacion]  WITH CHECK ADD  CONSTRAINT [FK_datos_facturacion_estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id_estado])
GO
ALTER TABLE [dbo].[datos_facturacion] CHECK CONSTRAINT [FK_datos_facturacion_estado]
GO
ALTER TABLE [dbo].[datos_facturacion]  WITH CHECK ADD  CONSTRAINT [FK_datos_facturacion_municipio] FOREIGN KEY([id_municipio])
REFERENCES [dbo].[municipio] ([id_municipio])
GO
ALTER TABLE [dbo].[datos_facturacion] CHECK CONSTRAINT [FK_datos_facturacion_municipio]
GO
ALTER TABLE [dbo].[evmoni]  WITH CHECK ADD  CONSTRAINT [FK_evmoni_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[evmoni] CHECK CONSTRAINT [FK_evmoni_caja]
GO
ALTER TABLE [dbo].[evmoni]  WITH CHECK ADD  CONSTRAINT [FK_evmoni_modulo] FOREIGN KEY([id_modulo])
REFERENCES [dbo].[modulo] ([id_modulo])
GO
ALTER TABLE [dbo].[evmoni] CHECK CONSTRAINT [FK_evmoni_modulo]
GO
ALTER TABLE [dbo].[evmoni]  WITH CHECK ADD  CONSTRAINT [FK_evmoni_nivel_seguridad] FOREIGN KEY([id_nivel_seguridad])
REFERENCES [dbo].[nivel_seguridad] ([id_nivel_seguridad])
GO
ALTER TABLE [dbo].[evmoni] CHECK CONSTRAINT [FK_evmoni_nivel_seguridad]
GO
ALTER TABLE [dbo].[evmoni]  WITH CHECK ADD  CONSTRAINT [FK_evmoni_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[evmoni] CHECK CONSTRAINT [FK_evmoni_sucursal]
GO
ALTER TABLE [dbo].[evmoni]  WITH CHECK ADD  CONSTRAINT [FK_evmoni_usuario_logueado] FOREIGN KEY([id_usuario_logueado])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[evmoni] CHECK CONSTRAINT [FK_evmoni_usuario_logueado]
GO
ALTER TABLE [dbo].[evmoni_detalle]  WITH CHECK ADD  CONSTRAINT [FK_evmoni_detalle_evmoni] FOREIGN KEY([id_evmoni])
REFERENCES [dbo].[evmoni] ([id_evmoni])
GO
ALTER TABLE [dbo].[evmoni_detalle] CHECK CONSTRAINT [FK_evmoni_detalle_evmoni]
GO
ALTER TABLE [dbo].[facturacion]  WITH CHECK ADD  CONSTRAINT [FK_facturacion_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[facturacion] CHECK CONSTRAINT [FK_facturacion_cliente]
GO
ALTER TABLE [dbo].[facturacion]  WITH CHECK ADD  CONSTRAINT [FK_facturacion_uso_cfdi] FOREIGN KEY([id_uso_cfdi])
REFERENCES [dbo].[uso_cfdi] ([id_uso_cfdi])
GO
ALTER TABLE [dbo].[facturacion] CHECK CONSTRAINT [FK_facturacion_uso_cfdi]
GO
ALTER TABLE [dbo].[facturacion]  WITH CHECK ADD  CONSTRAINT [FK_facturacion_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[facturacion] CHECK CONSTRAINT [FK_facturacion_usuario]
GO
ALTER TABLE [dbo].[modulo_nivel_seguridad]  WITH CHECK ADD  CONSTRAINT [FK_modulo_niv_seg_modulo] FOREIGN KEY([id_modulo])
REFERENCES [dbo].[modulo] ([id_modulo])
GO
ALTER TABLE [dbo].[modulo_nivel_seguridad] CHECK CONSTRAINT [FK_modulo_niv_seg_modulo]
GO
ALTER TABLE [dbo].[modulo_nivel_seguridad]  WITH CHECK ADD  CONSTRAINT [FK_modulo_niv_seg_nivel_seguridad] FOREIGN KEY([id_nivel_seguridad])
REFERENCES [dbo].[nivel_seguridad] ([id_nivel_seguridad])
GO
ALTER TABLE [dbo].[modulo_nivel_seguridad] CHECK CONSTRAINT [FK_modulo_niv_seg_nivel_seguridad]
GO
ALTER TABLE [dbo].[modulo_nivel_seguridad]  WITH CHECK ADD  CONSTRAINT [FK_modulo_nivel_seguridad_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[modulo_nivel_seguridad] CHECK CONSTRAINT [FK_modulo_nivel_seguridad_sucursal]
GO
ALTER TABLE [dbo].[modulo_permiso]  WITH CHECK ADD  CONSTRAINT [FK_modulo_permiso_modulo] FOREIGN KEY([id_modulo])
REFERENCES [dbo].[modulo] ([id_modulo])
GO
ALTER TABLE [dbo].[modulo_permiso] CHECK CONSTRAINT [FK_modulo_permiso_modulo]
GO
ALTER TABLE [dbo].[modulo_permiso]  WITH CHECK ADD  CONSTRAINT [FK_modulo_permiso_permiso] FOREIGN KEY([id_permiso])
REFERENCES [dbo].[permiso] ([id_permiso])
GO
ALTER TABLE [dbo].[modulo_permiso] CHECK CONSTRAINT [FK_modulo_permiso_permiso]
GO
ALTER TABLE [dbo].[movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_almacen] FOREIGN KEY([id_almacen])
REFERENCES [dbo].[almacen] ([id_almacen])
GO
ALTER TABLE [dbo].[movimiento_almacen] CHECK CONSTRAINT [FK_movimiento_almacen_almacen]
GO
ALTER TABLE [dbo].[movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_almacen_origen] FOREIGN KEY([id_almacen_origen])
REFERENCES [dbo].[almacen] ([id_almacen])
GO
ALTER TABLE [dbo].[movimiento_almacen] CHECK CONSTRAINT [FK_movimiento_almacen_almacen_origen]
GO
ALTER TABLE [dbo].[movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[movimiento_almacen] CHECK CONSTRAINT [FK_movimiento_almacen_caja]
GO
ALTER TABLE [dbo].[movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[movimiento_almacen] CHECK CONSTRAINT [FK_movimiento_almacen_cliente]
GO
ALTER TABLE [dbo].[movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_consolidacion] FOREIGN KEY([id_consolidacion])
REFERENCES [dbo].[consolidacion] ([id_consolidacion])
GO
ALTER TABLE [dbo].[movimiento_almacen] CHECK CONSTRAINT [FK_movimiento_almacen_consolidacion]
GO
ALTER TABLE [dbo].[movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_facturacion] FOREIGN KEY([id_facturacion])
REFERENCES [dbo].[facturacion] ([id_facturacion])
GO
ALTER TABLE [dbo].[movimiento_almacen] CHECK CONSTRAINT [FK_movimiento_almacen_facturacion]
GO
ALTER TABLE [dbo].[movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_movimiento_almacen_tipo] FOREIGN KEY([id_movimiento_almacen_tipo])
REFERENCES [dbo].[movimiento_almacen_tipo] ([id_movimiento_almacen_tipo])
GO
ALTER TABLE [dbo].[movimiento_almacen] CHECK CONSTRAINT [FK_movimiento_almacen_movimiento_almacen_tipo]
GO
ALTER TABLE [dbo].[movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[movimiento_almacen] CHECK CONSTRAINT [FK_movimiento_almacen_proveedor]
GO
ALTER TABLE [dbo].[movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[movimiento_almacen] CHECK CONSTRAINT [FK_movimiento_almacen_sucursal]
GO
ALTER TABLE [dbo].[movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_sucursal_destino] FOREIGN KEY([id_sucursal_destino])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[movimiento_almacen] CHECK CONSTRAINT [FK_movimiento_almacen_sucursal_destino]
GO
ALTER TABLE [dbo].[movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_sucursal_origen] FOREIGN KEY([id_sucursal_origen])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[movimiento_almacen] CHECK CONSTRAINT [FK_movimiento_almacen_sucursal_origen]
GO
ALTER TABLE [dbo].[movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_usuario_autorizo] FOREIGN KEY([id_usuario_autorizo])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[movimiento_almacen] CHECK CONSTRAINT [FK_movimiento_almacen_usuario_autorizo]
GO
ALTER TABLE [dbo].[movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_usuario_logueado] FOREIGN KEY([id_usuario_logueado])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[movimiento_almacen] CHECK CONSTRAINT [FK_movimiento_almacen_usuario_logueado]
GO
ALTER TABLE [dbo].[movimiento_almacen_detalle]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_detalle_almacen] FOREIGN KEY([id_almacen])
REFERENCES [dbo].[almacen] ([id_almacen])
GO
ALTER TABLE [dbo].[movimiento_almacen_detalle] CHECK CONSTRAINT [FK_movimiento_almacen_detalle_almacen]
GO
ALTER TABLE [dbo].[movimiento_almacen_detalle]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_detalle_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[movimiento_almacen_detalle] CHECK CONSTRAINT [FK_movimiento_almacen_detalle_articulo]
GO
ALTER TABLE [dbo].[movimiento_almacen_detalle]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_detalle_movimiento_almacen] FOREIGN KEY([id_movimiento_almacen])
REFERENCES [dbo].[movimiento_almacen] ([id_movimiento_almacen])
GO
ALTER TABLE [dbo].[movimiento_almacen_detalle] CHECK CONSTRAINT [FK_movimiento_almacen_detalle_movimiento_almacen]
GO
ALTER TABLE [dbo].[movimiento_almacen_detalle]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_almacen_detalle_unidad_medida] FOREIGN KEY([id_unidad_medida])
REFERENCES [dbo].[unidad_medida] ([id_unidad_medida])
GO
ALTER TABLE [dbo].[movimiento_almacen_detalle] CHECK CONSTRAINT [FK_movimiento_almacen_detalle_unidad_medida]
GO
ALTER TABLE [dbo].[movimiento_caja]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_caja_banco] FOREIGN KEY([id_banco])
REFERENCES [dbo].[banco] ([id_banco])
GO
ALTER TABLE [dbo].[movimiento_caja] CHECK CONSTRAINT [FK_movimiento_caja_banco]
GO
ALTER TABLE [dbo].[movimiento_caja]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_caja_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[movimiento_caja] CHECK CONSTRAINT [FK_movimiento_caja_caja]
GO
ALTER TABLE [dbo].[movimiento_caja]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_caja_consolidacion] FOREIGN KEY([id_consolidación])
REFERENCES [dbo].[consolidacion] ([id_consolidacion])
GO
ALTER TABLE [dbo].[movimiento_caja] CHECK CONSTRAINT [FK_movimiento_caja_consolidacion]
GO
ALTER TABLE [dbo].[movimiento_caja]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_caja_forma_pago] FOREIGN KEY([id_forma_pago])
REFERENCES [dbo].[forma_pago] ([id_forma_pago])
GO
ALTER TABLE [dbo].[movimiento_caja] CHECK CONSTRAINT [FK_movimiento_caja_forma_pago]
GO
ALTER TABLE [dbo].[movimiento_caja]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_caja_mov_caja_concepto] FOREIGN KEY([id_movimiento_caja_concepto], [id_movimiento_caja_tipo])
REFERENCES [dbo].[movimiento_caja_concepto] ([id_movimiento_caja_concepto], [id_movimiento_caja_tipo])
GO
ALTER TABLE [dbo].[movimiento_caja] CHECK CONSTRAINT [FK_movimiento_caja_mov_caja_concepto]
GO
ALTER TABLE [dbo].[movimiento_caja]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_caja_mov_caja_tipo] FOREIGN KEY([id_movimiento_caja_tipo])
REFERENCES [dbo].[movimiento_caja_tipo] ([id_movimiento_caja_tipo])
GO
ALTER TABLE [dbo].[movimiento_caja] CHECK CONSTRAINT [FK_movimiento_caja_mov_caja_tipo]
GO
ALTER TABLE [dbo].[movimiento_caja]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_caja_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[movimiento_caja] CHECK CONSTRAINT [FK_movimiento_caja_sucursal]
GO
ALTER TABLE [dbo].[movimiento_caja]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_caja_usr_autorizo] FOREIGN KEY([id_usuario_autorizo])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[movimiento_caja] CHECK CONSTRAINT [FK_movimiento_caja_usr_autorizo]
GO
ALTER TABLE [dbo].[movimiento_caja]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_caja_usr_logueado] FOREIGN KEY([id_usuario_logueado])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[movimiento_caja] CHECK CONSTRAINT [FK_movimiento_caja_usr_logueado]
GO
ALTER TABLE [dbo].[movimiento_caja]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_caja_venta] FOREIGN KEY([id_venta])
REFERENCES [dbo].[movimiento_almacen] ([id_movimiento_almacen])
GO
ALTER TABLE [dbo].[movimiento_caja] CHECK CONSTRAINT [FK_movimiento_caja_venta]
GO
ALTER TABLE [dbo].[movimiento_caja_concepto]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_caja_concepto_tipo] FOREIGN KEY([id_movimiento_caja_tipo])
REFERENCES [dbo].[movimiento_caja_tipo] ([id_movimiento_caja_tipo])
GO
ALTER TABLE [dbo].[movimiento_caja_concepto] CHECK CONSTRAINT [FK_movimiento_caja_concepto_tipo]
GO
ALTER TABLE [dbo].[movimiento_caja_desglose]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_caja_desglose_denominacion] FOREIGN KEY([id_denominacion])
REFERENCES [dbo].[denominacion] ([id_denominacion])
GO
ALTER TABLE [dbo].[movimiento_caja_desglose] CHECK CONSTRAINT [FK_movimiento_caja_desglose_denominacion]
GO
ALTER TABLE [dbo].[movimiento_caja_desglose]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_caja_desglose_mov_caja] FOREIGN KEY([id_movimiento_caja])
REFERENCES [dbo].[movimiento_caja] ([id_movimiento_caja])
GO
ALTER TABLE [dbo].[movimiento_caja_desglose] CHECK CONSTRAINT [FK_movimiento_caja_desglose_mov_caja]
GO
ALTER TABLE [dbo].[municipio]  WITH CHECK ADD  CONSTRAINT [FK_municipio_estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id_estado])
GO
ALTER TABLE [dbo].[municipio] CHECK CONSTRAINT [FK_municipio_estado]
GO
ALTER TABLE [dbo].[nivel_seguridad]  WITH CHECK ADD  CONSTRAINT [FK_nivel_seguridad_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[nivel_seguridad] CHECK CONSTRAINT [FK_nivel_seguridad_sucursal]
GO
ALTER TABLE [dbo].[nota_credito]  WITH CHECK ADD  CONSTRAINT [FK_nota_credito_facturacion] FOREIGN KEY([id_facturacion])
REFERENCES [dbo].[facturacion] ([id_facturacion])
GO
ALTER TABLE [dbo].[nota_credito] CHECK CONSTRAINT [FK_nota_credito_facturacion]
GO
ALTER TABLE [dbo].[nota_credito]  WITH CHECK ADD  CONSTRAINT [FK_nota_credito_relacion_cfdi] FOREIGN KEY([id_relacion_cfdi])
REFERENCES [dbo].[relacion_cfdi] ([id_relacion_cfdi])
GO
ALTER TABLE [dbo].[nota_credito] CHECK CONSTRAINT [FK_nota_credito_relacion_cfdi]
GO
ALTER TABLE [dbo].[nota_credito]  WITH CHECK ADD  CONSTRAINT [FK_nota_credito_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[nota_credito] CHECK CONSTRAINT [FK_nota_credito_usuario]
GO
ALTER TABLE [dbo].[nota_credito_detalle]  WITH CHECK ADD  CONSTRAINT [FK_nota_credito_detalle_nota_credito] FOREIGN KEY([id_nota])
REFERENCES [dbo].[nota_credito] ([id_nota])
GO
ALTER TABLE [dbo].[nota_credito_detalle] CHECK CONSTRAINT [FK_nota_credito_detalle_nota_credito]
GO
ALTER TABLE [dbo].[orden_compra]  WITH CHECK ADD FOREIGN KEY([id_promovimiento_almacen_estado])
REFERENCES [dbo].[promovimiento_almacen_estado] ([id_promovimiento_almacen_estado])
GO
ALTER TABLE [dbo].[orden_compra]  WITH CHECK ADD  CONSTRAINT [FK_orden_compra_compra] FOREIGN KEY([id_compra])
REFERENCES [dbo].[movimiento_almacen] ([id_movimiento_almacen])
GO
ALTER TABLE [dbo].[orden_compra] CHECK CONSTRAINT [FK_orden_compra_compra]
GO
ALTER TABLE [dbo].[orden_compra]  WITH CHECK ADD  CONSTRAINT [FK_orden_compra_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[orden_compra] CHECK CONSTRAINT [FK_orden_compra_proveedor]
GO
ALTER TABLE [dbo].[orden_compra]  WITH CHECK ADD  CONSTRAINT [FK_orden_compra_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[orden_compra] CHECK CONSTRAINT [FK_orden_compra_sucursal]
GO
ALTER TABLE [dbo].[orden_compra_detalle]  WITH CHECK ADD  CONSTRAINT [FK_orden_compra_detalle_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[orden_compra_detalle] CHECK CONSTRAINT [FK_orden_compra_detalle_articulo]
GO
ALTER TABLE [dbo].[orden_compra_detalle]  WITH CHECK ADD  CONSTRAINT [FK_orden_compra_detalle_orden_compra] FOREIGN KEY([id_orden_compra])
REFERENCES [dbo].[orden_compra] ([id_orden_compra])
GO
ALTER TABLE [dbo].[orden_compra_detalle] CHECK CONSTRAINT [FK_orden_compra_detalle_orden_compra]
GO
ALTER TABLE [dbo].[orden_compra_detalle]  WITH CHECK ADD  CONSTRAINT [FK_orden_compra_detalle_recepcion] FOREIGN KEY([id_compra])
REFERENCES [dbo].[movimiento_almacen] ([id_movimiento_almacen])
GO
ALTER TABLE [dbo].[orden_compra_detalle] CHECK CONSTRAINT [FK_orden_compra_detalle_recepcion]
GO
ALTER TABLE [dbo].[orden_compra_detalle]  WITH CHECK ADD  CONSTRAINT [FK_orden_compra_detalle_unidad_medida] FOREIGN KEY([id_unidad_medida])
REFERENCES [dbo].[unidad_medida] ([id_unidad_medida])
GO
ALTER TABLE [dbo].[orden_compra_detalle] CHECK CONSTRAINT [FK_orden_compra_detalle_unidad_medida]
GO
ALTER TABLE [dbo].[perfil_modulo_permiso]  WITH CHECK ADD  CONSTRAINT [FK_perfil_modulo_permiso_modulo] FOREIGN KEY([id_modulo])
REFERENCES [dbo].[modulo] ([id_modulo])
GO
ALTER TABLE [dbo].[perfil_modulo_permiso] CHECK CONSTRAINT [FK_perfil_modulo_permiso_modulo]
GO
ALTER TABLE [dbo].[perfil_modulo_permiso]  WITH CHECK ADD  CONSTRAINT [FK_perfil_modulo_permiso_modulo_permiso] FOREIGN KEY([id_modulo_permiso])
REFERENCES [dbo].[modulo_permiso] ([id_modulo_permiso])
GO
ALTER TABLE [dbo].[perfil_modulo_permiso] CHECK CONSTRAINT [FK_perfil_modulo_permiso_modulo_permiso]
GO
ALTER TABLE [dbo].[perfil_modulo_permiso]  WITH CHECK ADD  CONSTRAINT [FK_perfil_modulo_permiso_perfil] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[perfil] ([id_perfil])
GO
ALTER TABLE [dbo].[perfil_modulo_permiso] CHECK CONSTRAINT [FK_perfil_modulo_permiso_perfil]
GO
ALTER TABLE [dbo].[perfil_modulo_permiso]  WITH CHECK ADD  CONSTRAINT [FK_perfil_modulo_permiso_permiso] FOREIGN KEY([id_permiso])
REFERENCES [dbo].[permiso] ([id_permiso])
GO
ALTER TABLE [dbo].[perfil_modulo_permiso] CHECK CONSTRAINT [FK_perfil_modulo_permiso_permiso]
GO
ALTER TABLE [dbo].[precio_agrupador]  WITH CHECK ADD  CONSTRAINT [FK_precio_agrupador_articulo_agrupador] FOREIGN KEY([id_agrupador_articulo])
REFERENCES [dbo].[agrupador_articulo] ([id_agrupador_articulo])
GO
ALTER TABLE [dbo].[precio_agrupador] CHECK CONSTRAINT [FK_precio_agrupador_articulo_agrupador]
GO
ALTER TABLE [dbo].[premio]  WITH CHECK ADD  CONSTRAINT [FK_premio_dinamica] FOREIGN KEY([id_dinamica])
REFERENCES [dbo].[dinamica] ([id_dinamica])
GO
ALTER TABLE [dbo].[premio] CHECK CONSTRAINT [FK_premio_dinamica]
GO
ALTER TABLE [dbo].[premio]  WITH CHECK ADD  CONSTRAINT [FK_premio_movimiento_almacen] FOREIGN KEY([id_venta])
REFERENCES [dbo].[movimiento_almacen] ([id_movimiento_almacen])
GO
ALTER TABLE [dbo].[premio] CHECK CONSTRAINT [FK_premio_movimiento_almacen]
GO
ALTER TABLE [dbo].[pretransferencia]  WITH CHECK ADD FOREIGN KEY([id_promovimiento_almacen_estado])
REFERENCES [dbo].[promovimiento_almacen_estado] ([id_promovimiento_almacen_estado])
GO
ALTER TABLE [dbo].[pretransferencia]  WITH CHECK ADD  CONSTRAINT [FK_pretransferencia_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[pretransferencia] CHECK CONSTRAINT [FK_pretransferencia_sucursal]
GO
ALTER TABLE [dbo].[pretransferencia]  WITH CHECK ADD  CONSTRAINT [FK_pretransferencia_sucursal_origen] FOREIGN KEY([id_sucursal_origen])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[pretransferencia] CHECK CONSTRAINT [FK_pretransferencia_sucursal_origen]
GO
ALTER TABLE [dbo].[pretransferencia]  WITH CHECK ADD  CONSTRAINT [FK_pretransferencia_transferencia_entrada] FOREIGN KEY([id_transferencia_entrada])
REFERENCES [dbo].[movimiento_almacen] ([id_movimiento_almacen])
GO
ALTER TABLE [dbo].[pretransferencia] CHECK CONSTRAINT [FK_pretransferencia_transferencia_entrada]
GO
ALTER TABLE [dbo].[pretransferencia_detalle]  WITH CHECK ADD  CONSTRAINT [FK_pretransferencia_detalle_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[pretransferencia_detalle] CHECK CONSTRAINT [FK_pretransferencia_detalle_articulo]
GO
ALTER TABLE [dbo].[pretransferencia_detalle]  WITH CHECK ADD  CONSTRAINT [FK_pretransferencia_detalle_pretransferencia] FOREIGN KEY([id_pretransferencia])
REFERENCES [dbo].[pretransferencia] ([id_pretransferencia])
GO
ALTER TABLE [dbo].[pretransferencia_detalle] CHECK CONSTRAINT [FK_pretransferencia_detalle_pretransferencia]
GO
ALTER TABLE [dbo].[pretransferencia_detalle]  WITH CHECK ADD  CONSTRAINT [FK_pretransferencia_detalle_unidad_medida] FOREIGN KEY([id_unidad_medida])
REFERENCES [dbo].[unidad_medida] ([id_unidad_medida])
GO
ALTER TABLE [dbo].[pretransferencia_detalle] CHECK CONSTRAINT [FK_pretransferencia_detalle_unidad_medida]
GO
ALTER TABLE [dbo].[promocion]  WITH CHECK ADD  CONSTRAINT [FK_promocion_promocion_aplicacion] FOREIGN KEY([id_promocion_aplicacion])
REFERENCES [dbo].[promocion_aplicacion] ([id_promocion_aplicacion])
GO
ALTER TABLE [dbo].[promocion] CHECK CONSTRAINT [FK_promocion_promocion_aplicacion]
GO
ALTER TABLE [dbo].[promocion]  WITH CHECK ADD  CONSTRAINT [FK_promocion_promocion_condicion] FOREIGN KEY([id_promocion_condicion])
REFERENCES [dbo].[promocion_condicion] ([id_promocion_condicion])
GO
ALTER TABLE [dbo].[promocion] CHECK CONSTRAINT [FK_promocion_promocion_condicion]
GO
ALTER TABLE [dbo].[promocion]  WITH CHECK ADD  CONSTRAINT [FK_promocion_promocion_tipo] FOREIGN KEY([id_promocion_tipo])
REFERENCES [dbo].[promocion_tipo] ([id_promocion_tipo])
GO
ALTER TABLE [dbo].[promocion] CHECK CONSTRAINT [FK_promocion_promocion_tipo]
GO
ALTER TABLE [dbo].[promocion]  WITH CHECK ADD  CONSTRAINT [FK_promocion_proveedor] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedor] ([id_proveedor])
GO
ALTER TABLE [dbo].[promocion] CHECK CONSTRAINT [FK_promocion_proveedor]
GO
ALTER TABLE [dbo].[promocion]  WITH CHECK ADD  CONSTRAINT [FK_promocion_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[promocion] CHECK CONSTRAINT [FK_promocion_sucursal]
GO
ALTER TABLE [dbo].[promocion_compra]  WITH CHECK ADD  CONSTRAINT [FK_promocion_compra_promocion] FOREIGN KEY([id_promocion])
REFERENCES [dbo].[promocion] ([id_promocion])
GO
ALTER TABLE [dbo].[promocion_compra] CHECK CONSTRAINT [FK_promocion_compra_promocion]
GO
ALTER TABLE [dbo].[promocion_compra]  WITH CHECK ADD  CONSTRAINT [FK_promocion_compra_unidad_medida] FOREIGN KEY([id_unidad_medida])
REFERENCES [dbo].[unidad_medida] ([id_unidad_medida])
GO
ALTER TABLE [dbo].[promocion_compra] CHECK CONSTRAINT [FK_promocion_compra_unidad_medida]
GO
ALTER TABLE [dbo].[promocion_imagen]  WITH CHECK ADD  CONSTRAINT [FK_promocion_imagen_promocion] FOREIGN KEY([id_promocion])
REFERENCES [dbo].[promocion] ([id_promocion])
GO
ALTER TABLE [dbo].[promocion_imagen] CHECK CONSTRAINT [FK_promocion_imagen_promocion]
GO
ALTER TABLE [dbo].[promocion_regalo]  WITH CHECK ADD  CONSTRAINT [FK_promocion_regalo_articulo] FOREIGN KEY([id_articulo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[promocion_regalo] CHECK CONSTRAINT [FK_promocion_regalo_articulo]
GO
ALTER TABLE [dbo].[promocion_regalo]  WITH CHECK ADD  CONSTRAINT [FK_promocion_regalo_promocion] FOREIGN KEY([id_promocion])
REFERENCES [dbo].[promocion] ([id_promocion])
GO
ALTER TABLE [dbo].[promocion_regalo] CHECK CONSTRAINT [FK_promocion_regalo_promocion]
GO
ALTER TABLE [dbo].[promocion_regalo]  WITH CHECK ADD  CONSTRAINT [FK_promocion_regalo_unidad_medida] FOREIGN KEY([id_unidad_medida])
REFERENCES [dbo].[unidad_medida] ([id_unidad_medida])
GO
ALTER TABLE [dbo].[promocion_regalo] CHECK CONSTRAINT [FK_promocion_regalo_unidad_medida]
GO
ALTER TABLE [dbo].[promocion_venta]  WITH CHECK ADD  CONSTRAINT [FK_promo_venta_articulo] FOREIGN KEY([id_articulo_regalo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[promocion_venta] CHECK CONSTRAINT [FK_promo_venta_articulo]
GO
ALTER TABLE [dbo].[promocion_venta]  WITH CHECK ADD  CONSTRAINT [FK_promo_venta_promocion] FOREIGN KEY([id_promocion])
REFERENCES [dbo].[promocion] ([id_promocion])
GO
ALTER TABLE [dbo].[promocion_venta] CHECK CONSTRAINT [FK_promo_venta_promocion]
GO
ALTER TABLE [dbo].[promocion_venta]  WITH CHECK ADD  CONSTRAINT [FK_promo_venta_ticket] FOREIGN KEY([id_ticket])
REFERENCES [dbo].[movimiento_almacen] ([id_movimiento_almacen])
GO
ALTER TABLE [dbo].[promocion_venta] CHECK CONSTRAINT [FK_promo_venta_ticket]
GO
ALTER TABLE [dbo].[proveedor]  WITH CHECK ADD  CONSTRAINT [FK_proveedor_datos_facturacion] FOREIGN KEY([id_datos_facturacion])
REFERENCES [dbo].[datos_facturacion] ([id_datos_facturacion])
GO
ALTER TABLE [dbo].[proveedor] CHECK CONSTRAINT [FK_proveedor_datos_facturacion]
GO
ALTER TABLE [dbo].[recarga]  WITH CHECK ADD  CONSTRAINT [FK_recarga_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[recarga] CHECK CONSTRAINT [FK_recarga_caja]
GO
ALTER TABLE [dbo].[recarga]  WITH CHECK ADD  CONSTRAINT [FK_recarga_movimiento_almacen] FOREIGN KEY([id_movimiento_almacen])
REFERENCES [dbo].[movimiento_almacen] ([id_movimiento_almacen])
GO
ALTER TABLE [dbo].[recarga] CHECK CONSTRAINT [FK_recarga_movimiento_almacen]
GO
ALTER TABLE [dbo].[recarga]  WITH CHECK ADD  CONSTRAINT [FK_recarga_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[recarga] CHECK CONSTRAINT [FK_recarga_sucursal]
GO
ALTER TABLE [dbo].[recarga]  WITH CHECK ADD  CONSTRAINT [FK_recarga_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[recarga] CHECK CONSTRAINT [FK_recarga_usuario]
GO
ALTER TABLE [dbo].[recargas_config]  WITH CHECK ADD  CONSTRAINT [FK_recargas_config_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[recargas_config] CHECK CONSTRAINT [FK_recargas_config_sucursal]
GO
ALTER TABLE [dbo].[recargas_prods]  WITH CHECK ADD FOREIGN KEY([id_articulo])
REFERENCES [dbo].[articulo] ([id_articulo])
GO
ALTER TABLE [dbo].[recargas_prods]  WITH CHECK ADD FOREIGN KEY([id_comp])
REFERENCES [dbo].[recargas_comp] ([id_comp])
GO
ALTER TABLE [dbo].[recargas_ventas]  WITH CHECK ADD FOREIGN KEY([id_estado])
REFERENCES [dbo].[recargas_estado] ([id_estado])
GO
ALTER TABLE [dbo].[receta_venta]  WITH CHECK ADD  CONSTRAINT [FK_receta_venta_mov_detalle] FOREIGN KEY([id_movimiento_almacen_detalle], [id_venta], [id_articulo])
REFERENCES [dbo].[movimiento_almacen_detalle] ([id_movimiento_almacen_detalle], [id_movimiento_almacen], [id_articulo])
GO
ALTER TABLE [dbo].[receta_venta] CHECK CONSTRAINT [FK_receta_venta_mov_detalle]
GO
ALTER TABLE [dbo].[receta_venta]  WITH CHECK ADD  CONSTRAINT [FK_receta_venta_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[receta_venta] CHECK CONSTRAINT [FK_receta_venta_sucursal]
GO
ALTER TABLE [dbo].[receta_venta]  WITH CHECK ADD  CONSTRAINT [FK_receta_venta_usuario] FOREIGN KEY([id_usuario_logueado])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[receta_venta] CHECK CONSTRAINT [FK_receta_venta_usuario]
GO
ALTER TABLE [dbo].[receta_venta]  WITH CHECK ADD  CONSTRAINT [FK_receta_venta_venta] FOREIGN KEY([id_venta])
REFERENCES [dbo].[movimiento_almacen] ([id_movimiento_almacen])
GO
ALTER TABLE [dbo].[receta_venta] CHECK CONSTRAINT [FK_receta_venta_venta]
GO
ALTER TABLE [dbo].[reglas_movimiento_almacen]  WITH CHECK ADD  CONSTRAINT [FK_reglas_movimiento_almacen_movimiento_alamcen_tipo] FOREIGN KEY([id_movimiento_almacen_tipo])
REFERENCES [dbo].[movimiento_almacen_tipo] ([id_movimiento_almacen_tipo])
GO
ALTER TABLE [dbo].[reglas_movimiento_almacen] CHECK CONSTRAINT [FK_reglas_movimiento_almacen_movimiento_alamcen_tipo]
GO
ALTER TABLE [dbo].[subcategoria]  WITH CHECK ADD  CONSTRAINT [FK_subcategoria_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[subcategoria] CHECK CONSTRAINT [FK_subcategoria_categoria]
GO
ALTER TABLE [dbo].[submarca]  WITH CHECK ADD  CONSTRAINT [FK_submarca_marca] FOREIGN KEY([id_marca])
REFERENCES [dbo].[marca] ([id_marca])
GO
ALTER TABLE [dbo].[submarca] CHECK CONSTRAINT [FK_submarca_marca]
GO
ALTER TABLE [dbo].[sucursal]  WITH CHECK ADD  CONSTRAINT [FK_sucursal_zona] FOREIGN KEY([id_zona])
REFERENCES [dbo].[zona] ([id_zona])
GO
ALTER TABLE [dbo].[sucursal] CHECK CONSTRAINT [FK_sucursal_zona]
GO
ALTER TABLE [dbo].[sucursal]  WITH CHECK ADD  CONSTRAINT [FK_usuario_huella_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[sucursal] CHECK CONSTRAINT [FK_usuario_huella_sucursal]
GO
ALTER TABLE [dbo].[ticket_bancomer]  WITH CHECK ADD  CONSTRAINT [FK_ticket_bancomer_movimiento_almacen] FOREIGN KEY([id_movimiento_almacen])
REFERENCES [dbo].[movimiento_almacen] ([id_movimiento_almacen])
GO
ALTER TABLE [dbo].[ticket_bancomer] CHECK CONSTRAINT [FK_ticket_bancomer_movimiento_almacen]
GO
ALTER TABLE [dbo].[ticket_bancomer]  WITH CHECK ADD  CONSTRAINT [FK_ticket_bancomer_movimiento_caja] FOREIGN KEY([id_movimiento_caja])
REFERENCES [dbo].[movimiento_caja] ([id_movimiento_caja])
GO
ALTER TABLE [dbo].[ticket_bancomer] CHECK CONSTRAINT [FK_ticket_bancomer_movimiento_caja]
GO
ALTER TABLE [dbo].[ticket_bancomer]  WITH CHECK ADD  CONSTRAINT [FK_ticket_bancomer_transaccion_banco] FOREIGN KEY([id_transaccion_banco])
REFERENCES [dbo].[transaccion_banco] ([id_transaccion])
GO
ALTER TABLE [dbo].[ticket_bancomer] CHECK CONSTRAINT [FK_ticket_bancomer_transaccion_banco]
GO
ALTER TABLE [dbo].[ticket_bancomer]  WITH CHECK ADD  CONSTRAINT [FK_ticket_bancomer_vale_devolucion_transaccion] FOREIGN KEY([id_vale_dev_trans])
REFERENCES [dbo].[vale_devolucion_transaccion] ([id_vale_devolucion_transaccion])
GO
ALTER TABLE [dbo].[ticket_bancomer] CHECK CONSTRAINT [FK_ticket_bancomer_vale_devolucion_transaccion]
GO
ALTER TABLE [dbo].[tira_banco]  WITH CHECK ADD  CONSTRAINT [FK_tira_banco_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[tira_banco] CHECK CONSTRAINT [FK_tira_banco_caja]
GO
ALTER TABLE [dbo].[tira_banco]  WITH CHECK ADD  CONSTRAINT [FK_tira_banco_mov_caja_final] FOREIGN KEY([id_folio_final])
REFERENCES [dbo].[movimiento_caja] ([id_movimiento_caja])
GO
ALTER TABLE [dbo].[tira_banco] CHECK CONSTRAINT [FK_tira_banco_mov_caja_final]
GO
ALTER TABLE [dbo].[tira_banco]  WITH CHECK ADD  CONSTRAINT [FK_tira_banco_mov_caja_inicial] FOREIGN KEY([id_folio_inicial])
REFERENCES [dbo].[movimiento_caja] ([id_movimiento_caja])
GO
ALTER TABLE [dbo].[tira_banco] CHECK CONSTRAINT [FK_tira_banco_mov_caja_inicial]
GO
ALTER TABLE [dbo].[tira_banco]  WITH CHECK ADD  CONSTRAINT [FK_tira_banco_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[tira_banco] CHECK CONSTRAINT [FK_tira_banco_sucursal]
GO
ALTER TABLE [dbo].[tira_banco]  WITH CHECK ADD  CONSTRAINT [FK_tira_banco_usuario_autorizo] FOREIGN KEY([id_usuario_autorizo])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[tira_banco] CHECK CONSTRAINT [FK_tira_banco_usuario_autorizo]
GO
ALTER TABLE [dbo].[tira_banco]  WITH CHECK ADD  CONSTRAINT [FK_tira_banco_usuario_logueado] FOREIGN KEY([id_usuario_logueado])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[tira_banco] CHECK CONSTRAINT [FK_tira_banco_usuario_logueado]
GO
ALTER TABLE [dbo].[transaccion_banco]  WITH CHECK ADD  CONSTRAINT [FK_transaccion_banco_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[transaccion_banco] CHECK CONSTRAINT [FK_transaccion_banco_caja]
GO
ALTER TABLE [dbo].[transaccion_banco]  WITH CHECK ADD  CONSTRAINT [FK_transaccion_banco_movimiento_almacen] FOREIGN KEY([id_ticket])
REFERENCES [dbo].[movimiento_almacen] ([id_movimiento_almacen])
GO
ALTER TABLE [dbo].[transaccion_banco] CHECK CONSTRAINT [FK_transaccion_banco_movimiento_almacen]
GO
ALTER TABLE [dbo].[transaccion_banco]  WITH CHECK ADD  CONSTRAINT [FK_transaccion_banco_movimiento_caja] FOREIGN KEY([id_movimiento_caja])
REFERENCES [dbo].[movimiento_caja] ([id_movimiento_caja])
GO
ALTER TABLE [dbo].[transaccion_banco] CHECK CONSTRAINT [FK_transaccion_banco_movimiento_caja]
GO
ALTER TABLE [dbo].[transaccion_banco]  WITH CHECK ADD  CONSTRAINT [FK_transaccion_banco_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[transaccion_banco] CHECK CONSTRAINT [FK_transaccion_banco_sucursal]
GO
ALTER TABLE [dbo].[transaccion_banco]  WITH CHECK ADD  CONSTRAINT [FK_transaccion_banco_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[transaccion_banco] CHECK CONSTRAINT [FK_transaccion_banco_usuario]
GO
ALTER TABLE [dbo].[transaccion_banco]  WITH CHECK ADD  CONSTRAINT [FK_transaccion_banco_vale_devolucion_transaccion] FOREIGN KEY([id_vale_trans_devolucion])
REFERENCES [dbo].[vale_devolucion_transaccion] ([id_vale_devolucion_transaccion])
GO
ALTER TABLE [dbo].[transaccion_banco] CHECK CONSTRAINT [FK_transaccion_banco_vale_devolucion_transaccion]
GO
ALTER TABLE [dbo].[usr_imei]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_caja] FOREIGN KEY([id_caja_actual])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_caja]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_perfil] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[perfil] ([id_perfil])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_perfil]
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_sucursal]
GO
ALTER TABLE [dbo].[usuario_huella]  WITH CHECK ADD  CONSTRAINT [FK_usuario_huella_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[usuario_huella] CHECK CONSTRAINT [FK_usuario_huella_usuario]
GO
ALTER TABLE [dbo].[usuario_huella]  WITH CHECK ADD  CONSTRAINT [FK_usuario_huella_usuario_alta] FOREIGN KEY([id_usuario_alta])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[usuario_huella] CHECK CONSTRAINT [FK_usuario_huella_usuario_alta]
GO
ALTER TABLE [dbo].[vale_devolucion]  WITH CHECK ADD  CONSTRAINT [FK_vale_devolucion_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[vale_devolucion] CHECK CONSTRAINT [FK_vale_devolucion_caja]
GO
ALTER TABLE [dbo].[vale_devolucion]  WITH CHECK ADD  CONSTRAINT [FK_vale_devolucion_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[vale_devolucion] CHECK CONSTRAINT [FK_vale_devolucion_cliente]
GO
ALTER TABLE [dbo].[vale_devolucion]  WITH CHECK ADD  CONSTRAINT [FK_vale_devolucion_devolucion] FOREIGN KEY([id_devolucion])
REFERENCES [dbo].[movimiento_almacen] ([id_movimiento_almacen])
GO
ALTER TABLE [dbo].[vale_devolucion] CHECK CONSTRAINT [FK_vale_devolucion_devolucion]
GO
ALTER TABLE [dbo].[vale_devolucion]  WITH CHECK ADD  CONSTRAINT [FK_vale_devolucion_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[vale_devolucion] CHECK CONSTRAINT [FK_vale_devolucion_sucursal]
GO
ALTER TABLE [dbo].[vale_devolucion]  WITH CHECK ADD  CONSTRAINT [FK_vale_devolucion_usr_autorizo] FOREIGN KEY([id_usuario_autorizo])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[vale_devolucion] CHECK CONSTRAINT [FK_vale_devolucion_usr_autorizo]
GO
ALTER TABLE [dbo].[vale_devolucion]  WITH CHECK ADD  CONSTRAINT [FK_vale_devolucion_usr_logueado] FOREIGN KEY([id_usuario_logueado])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[vale_devolucion] CHECK CONSTRAINT [FK_vale_devolucion_usr_logueado]
GO
ALTER TABLE [dbo].[vale_devolucion_transaccion]  WITH CHECK ADD FOREIGN KEY([id_cierre])
REFERENCES [dbo].[cierre] ([id_cierre])
GO
ALTER TABLE [dbo].[vale_devolucion_transaccion]  WITH CHECK ADD  CONSTRAINT [FK_vale_devolucion_transaccion_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[vale_devolucion_transaccion] CHECK CONSTRAINT [FK_vale_devolucion_transaccion_caja]
GO
ALTER TABLE [dbo].[vale_devolucion_transaccion]  WITH CHECK ADD  CONSTRAINT [FK_vale_devolucion_transaccion_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[vale_devolucion_transaccion] CHECK CONSTRAINT [FK_vale_devolucion_transaccion_sucursal]
GO
ALTER TABLE [dbo].[vale_devolucion_transaccion]  WITH CHECK ADD  CONSTRAINT [FK_vale_devolucion_transaccion_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[vale_devolucion_transaccion] CHECK CONSTRAINT [FK_vale_devolucion_transaccion_usuario]
GO
ALTER TABLE [dbo].[variable_config]  WITH CHECK ADD  CONSTRAINT [FK_variable_config_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[variable_config] CHECK CONSTRAINT [FK_variable_config_caja]
GO
ALTER TABLE [dbo].[variable_config]  WITH CHECK ADD  CONSTRAINT [FK_variable_config_variable_config] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[variable_config] CHECK CONSTRAINT [FK_variable_config_variable_config]
GO
ALTER TABLE [dbo].[venta_cancelacion]  WITH CHECK ADD  CONSTRAINT [FK_venta_can_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id_caja])
GO
ALTER TABLE [dbo].[venta_cancelacion] CHECK CONSTRAINT [FK_venta_can_caja]
GO
ALTER TABLE [dbo].[venta_cancelacion]  WITH CHECK ADD  CONSTRAINT [FK_venta_can_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[venta_cancelacion] CHECK CONSTRAINT [FK_venta_can_sucursal]
GO
/****** Object:  StoredProcedure [dbo].[SearchAllTables]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[SearchAllTables]
(
    @SearchStr nvarchar(100)
)
AS
BEGIN

    CREATE TABLE #Results (ColumnName nvarchar(370), ColumnValue nvarchar(3630))

    SET NOCOUNT ON

    DECLARE @TableName nvarchar(256), @ColumnName nvarchar(128), @SearchStr2 nvarchar(110)
    SET  @TableName = ''
    SET @SearchStr2 = QUOTENAME('%' + @SearchStr + '%','''')

    WHILE @TableName IS NOT NULL
    BEGIN
        SET @ColumnName = ''
        SET @TableName = 
        (
            SELECT MIN(QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME))
            FROM 	INFORMATION_SCHEMA.TABLES
            WHERE 		TABLE_TYPE = 'BASE TABLE'
                AND	QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME) > @TableName
                AND	OBJECTPROPERTY(
                        OBJECT_ID(
                            QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME)
                             ), 'IsMSShipped'
                               ) = 0
        )

        WHILE (@TableName IS NOT NULL) AND (@ColumnName IS NOT NULL)
        BEGIN
            SET @ColumnName =
            (
                SELECT MIN(QUOTENAME(COLUMN_NAME))
                FROM 	INFORMATION_SCHEMA.COLUMNS
                WHERE 		TABLE_SCHEMA	= PARSENAME(@TableName, 2)
                    AND	TABLE_NAME	= PARSENAME(@TableName, 1)
                    AND	DATA_TYPE IN ('char', 'varchar', 'nchar', 'nvarchar')
                    AND	QUOTENAME(COLUMN_NAME) > @ColumnName
            )

            IF @ColumnName IS NOT NULL
            BEGIN
                INSERT INTO #Results
                EXEC
                (
                    'SELECT ''' + @TableName + '.' + @ColumnName + ''', LEFT(' + @ColumnName + ', 3630) 
                    FROM ' + @TableName + ' (NOLOCK) ' +
                    ' WHERE ' + @ColumnName + ' LIKE ' + @SearchStr2
                )
            END
        END	
    END

    SELECT ColumnName, ColumnValue FROM #Results
END
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizaAgrupadorArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_actualizaAgrupadorArticulo]
	@id as int,
	@clave as nvarchar(100),
	@descripcion as nvarchar(100),
	@idFamilia as int,
	@alta as int

AS
BEGIN
	UPDATE agrupador_articulo
				 SET	descripcion=@descripcion, 
						alta= @alta,
						id_familia= @idFamilia,
						clave= @clave
	WHERE @id = id_agrupador_articulo
	
	SELECT	id_agrupador_articulo
			FROM agrupador_articulo 
			WHERE clave= @clave
END
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarDatosFacturacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-12
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_actualizarDatosFacturacion]
	@clave as nvarchar(6),
	@RFC as nvarchar(13),
	@razon as nvarchar(100),
	@calle as nvarchar(20),
	@numExt as nvarchar(6),
	@numInt as nvarchar(6),
	@idCP as int,
	@idEstado as int,
	@idMunicipio as int,
	@idColonia as int,
	@email as  nvarchar(200),
	@idUsoCfdi as int,
	@idDatosFacturacion as int

AS
BEGIN
	
	select @idDatosFacturacion= id_datos_facturacion from proveedor where clave = @clave
	
	UPDATE datos_facturacion
					 SET	rfc=@RFC,
							razon_social= @razon,
							id_uso_cfdi =  @idUsoCfdi,
							calle = @calle,
							no_exterior = @numExt,
							no_interior= @numInt,
							id_cp = @idCP,
							id_estado = @idEstado,
							id_municipio = @idMunicipio,
							id_colonia = @idColonia,
							email=@email 

	WHERE id_datos_facturacion= @idDatosFacturacion
	
	SELECT	id_datos_facturacion
			FROM proveedor 
			WHERE clave= @clave
END
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarDatosFacturacionporIdDatosFacturacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-12
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_actualizarDatosFacturacionporIdDatosFacturacion]
	@RFC as nvarchar(13),
	@razon as nvarchar(100),
	@calle as nvarchar(20),
	@numExt as nvarchar(6),
	@numInt as nvarchar(6),
	@idCP as int,
	@idEstado as int,
	@idMunicipio as int,
	@idColonia as int,
	@email as  nvarchar(200),
	@idUsoCfdi as int,
	@idDatosFac as int

AS
BEGIN
	
	UPDATE datos_facturacion
					 SET	rfc=@RFC,
							razon_social= @razon,
							id_uso_cfdi =  @idUsoCfdi,
							calle = @calle,
							no_exterior = @numExt,
							no_interior= @numInt,
							id_cp = @idCP,
							id_estado = @idEstado,
							id_municipio = @idMunicipio,
							id_colonia = @idColonia,
							email=@email 

	WHERE id_datos_facturacion= @idDatosFac
	
	SELECT	@idDatosFac as id_datos_facturacion
END
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarFamilia]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_actualizarFamilia]
	@id as int,
	@clave as nvarchar(10),
	@descripcion as nvarchar(50),
	@activo as int
AS
BEGIN
	UPDATE familia SET	descripcion=@descripcion, 
						activo= @activo,
						clave= @clave
	WHERE @id = id_familia
	
	SELECT	id_familia
			FROM familia 
			WHERE clave= @clave
END
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarImpuesto]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 04.junio.2018
-- Description:	Se agrego la precision al decimal y campo claveSAT
-- =============================================
CREATE PROCEDURE [dbo].[sp_actualizarImpuesto]
	@descripcion as nvarchar(100),
	@activo as int,
	@tasa as decimal(5,2),
	@claveSAT as nvarchar(10)
AS
BEGIN
	UPDATE impuesto SET
						activo= @activo,
						tasa = @tasa,
						clave_sat = @claveSAT
	WHERE descripcion= @descripcion
	
	SELECT	id_impuesto
			FROM impuesto 
			WHERE descripcion= @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarMarca]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:    SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_actualizarMarca]
	@Id as int, 
    @clave as nvarchar(100),
    @descripcion as nvarchar(100),
    @activo as int
AS
BEGIN
    UPDATE Marca SET    clave = @clave,
						descripcion=@descripcion,
                        activo= @activo
    WHERE id_marca = @Id

    SELECT    id_marca
            FROM marca
            WHERE clave= @clave
END
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarProveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 22.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_actualizarProveedor]
	@clave as nvarchar(6),
	@nombre as nvarchar(100),
	@telefono as nvarchar(18),
	@gerenteVentas as nvarchar(50),
	@gerenteVentasTel as nvarchar(50),
	@responsableTrafico as nvarchar(100),
	@responsableTraficoTel as nvarchar(15),
	@representanteVenta as nvarchar(50),
	@representanteVentaTel as nvarchar(15),
	@activo	as int

AS
BEGIN
	UPDATE proveedor SET	nombre=@nombre,
							telefono= @telefono,
							gerente_ventas =  @gerenteVentas,
							gerente_ventas_tel=@gerenteVentasTel,
							responsable_trafico = @responsableTrafico,
							responsable_trafico_tel= @responsableTraficoTel,
							representante_ventas = @representanteVenta,
							responsable_ventas = @representanteVentaTel,
							activo= @activo

	WHERE clave= @clave
	
	SELECT	id_proveedor
			FROM proveedor 
			WHERE clave= @clave
END
GO
/****** Object:  StoredProcedure [dbo].[sp_actualizarSubMarca]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_actualizarSubMarca]
	@id as int,
	@clave as nvarchar(100),
	@descripcion as nvarchar(100),
	@idMarca as int,
	@activo as int

AS
BEGIN
	UPDATE submarca SET	clave= @clave,
						descripcion=@descripcion, 
						activo= @activo,
						id_marca= @idMarca
	WHERE @id = id_submarca
	
	SELECT	id_submarca
			FROM submarca 
			WHERE clave= @clave
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarAgrupadoArticuloPorClave]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarAgrupadoArticuloPorClave]
	@clave as nvarchar(100)
AS
BEGIN
	SELECT * FROM agrupador_articulo WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarAgrupadoArticuloPorDescripcion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarAgrupadoArticuloPorDescripcion]
	@descripcion as nvarchar(100)
AS
BEGIN
	SELECT * FROM agrupador_articulo WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarAgrupadoArticuloPorFamilia]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CarlosNegrete
CREATE PROCEDURE [dbo].[sp_buscarAgrupadoArticuloPorFamilia]
	@id as int
AS
BEGIN
	SELECT * FROM agrupador_articulo WHERE id_familia = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarAgrupadoArticuloPorID]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarAgrupadoArticuloPorID]
	@id as int
AS
BEGIN
	SELECT *  FROM agrupador_articulo WHERE id_agrupador_articulo = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarDatosFacturacionPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 22.05.2018
-- Description:	SP
-- =============================================
Create PROCEDURE [dbo].[sp_buscarDatosFacturacionPorId]
	@id as int
AS
BEGIN
	SELECT * FROM datos_facturacion WHERE id_datos_facturacion = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarDatosFacturacionPorRazon]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Saul Cruces
-- Create date: 21.julio.2018
-- Description: Alterar tipo dato 10 a 100
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarDatosFacturacionPorRazon]
    @razon as nvarchar(100)
AS
BEGIN
    SELECT * FROM datos_facturacion WHERE razon_social = @razon
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarDatosFacturacionPorRFC]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 12.junio.2018
-- Description:	Modificación tipo dato
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarDatosFacturacionPorRFC]
	@rfc as nvarchar(13)
AS
BEGIN
	SELECT * FROM datos_facturacion WHERE rfc = @rfc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarFamiliasPorClave]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 14.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarFamiliasPorClave]
	@clave as nvarchar(100)
AS
BEGIN
	SELECT * FROM familia WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarFamiliasPorDescripcion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 14.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarFamiliasPorDescripcion]
	@descripcion as nvarchar(100)
AS
BEGIN
	SELECT *  FROM familia WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarFamiliasPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 14.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarFamiliasPorId]
	@id as int
AS
BEGIN
	SELECT * FROM familia WHERE id_familia = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarImpuestosPorDescripcion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 17.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarImpuestosPorDescripcion]
	@descripcion as nvarchar(100)
AS
BEGIN
	SELECT *  FROM impuesto WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarImpuestosPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 17.05.2018
-- Description:	SP
-- =============================================
Create PROCEDURE [dbo].[sp_buscarImpuestosPorId]
	@id as int
AS
BEGIN
	SELECT * FROM impuesto WHERE id_impuesto = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarMarcaPorClave]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarMarcaPorClave]
	@clave as nvarchar(100)
AS
BEGIN
	SELECT * FROM marca WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarMarcaPorDescripcion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarMarcaPorDescripcion]
	@descripcion as nvarchar(100)
AS
BEGIN
	SELECT * FROM marca WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarMarcaPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarMarcaPorId]
	@id as int
AS
BEGIN
	SELECT *  FROM Marca WHERE id_marca = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarProveedorPorClave]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 22.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarProveedorPorClave]
	@clave as nvarchar(100)
AS
BEGIN
	SELECT 
			id_proveedor,
			clave,
			nombre,
			id_datos_facturacion,
			ISNULL(telefono,'') as telefono,
			ISNULL(gerente_ventas,'') as gerente_ventas,
			ISNULL(gerente_ventas_tel,'')as gerente_ventas_tel,
			ISNULL(responsable_trafico,'')as responsable_trafico,
			ISNULL(responsable_trafico_tel,'')as responsable_trafico_tel,
			ISNULL(representante_ventas,'')as representante_ventas,
			ISNULL(responsable_ventas,'')as responsable_ventas,
			fecha_alta,
			activo
	 FROM proveedor WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarProveedorPorDescripcion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 22.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarProveedorPorDescripcion]
	@descripcion as nvarchar(100)
AS
BEGIN
	SELECT 
			id_proveedor,
			clave,
			nombre,
			id_datos_facturacion,
			ISNULL(telefono,'') as telefono,
			ISNULL(gerente_ventas,'') as gerente_ventas,
			ISNULL(gerente_ventas_tel,'')as gerente_ventas_tel,
			ISNULL(responsable_trafico,'')as responsable_trafico,
			ISNULL(responsable_trafico_tel,'')as responsable_trafico_tel,
			ISNULL(representante_ventas,'')as representante_ventas,
			ISNULL(responsable_ventas,'')as responsable_ventas,
			fecha_alta,
			activo
	FROM proveedor WHERE nombre = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarProveedorPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 22.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarProveedorPorId]
	@id as int
AS
BEGIN
	SELECT 
			id_proveedor,
			clave,
			nombre,
			id_datos_facturacion,
			ISNULL(telefono,'') as telefono,
			ISNULL(gerente_ventas,'') as gerente_ventas,
			ISNULL(gerente_ventas_tel,'')as gerente_ventas_tel,
			ISNULL(responsable_trafico,'')as responsable_trafico,
			ISNULL(responsable_trafico_tel,'')as responsable_trafico_tel,
			ISNULL(representante_ventas,'')as representante_ventas,
			ISNULL(responsable_ventas,'')as responsable_ventas,
			fecha_alta,
			activo
	FROM proveedor WHERE id_proveedor = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarSubMarcaPorClave]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarSubMarcaPorClave]
	@clave as nvarchar(100)
AS
BEGIN
	SELECT * FROM submarca WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarSubMarcaPorDescripcion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarSubMarcaPorDescripcion]
	@descripcion as nvarchar(100)
AS
BEGIN
	SELECT * FROM submarca WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarSubMarcaPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarSubMarcaPorId]
	@id as int
AS
BEGIN
	SELECT *  FROM submarca WHERE id_submarca = @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_buscarSubMarcaPorIdMarca]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_buscarSubMarcaPorIdMarca]
	@id as int
AS
BEGIN
	SELECT *  FROM submarca WHERE id_marca = @id and activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Consulta_Ajustes]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
*
*	QUERY PARA GENERAR POR MES EL
*	REPORTE DE AJUSTES
*	INGRESAR SOLO EL MES
*	SOLO CONSIDERA LOS MOVIMIENTOS 6,8,9 Y 11
DECLARE @MES VARCHAR(10)
SET @MES ='Julio'
*	
*/

create procedure [dbo].[SP_Consulta_Ajustes]

 @MES VARCHAR(10)

as
SELECT 
		malm.id_sucursal as 'Sucursal',
		mat.clave 'TIPO',
		convert(varchar,malm.fecha_registro,103)as 'Fecha', 
		malm.folio 'Folio',
		alma.clave 'Almacen',
		A.clave as 'Articulo',
		A.desc_super AS 'Descripcion',
		case mat.clave  when 'S'  then mad.cantidad else mad.cantidad END as 'Cantidad',
		cast(mad.costo_unitario as decimal(10,3)) as 'Costo_unitario',
		um.descripcion 'Unidad Medida',
		cast(mad.descuento as decimal(10,3)) as 'Descuento',
		case mat.clave  when 'S'  then cast(mad.importe*-1 as decimal(10,3)) 
			else cast(mad.importe as decimal(10,3)) END as 'Importe',
		case mat.clave  when 'S'  then cast(mad.subtotal*-1 as decimal(10,3)) 
			else cast(mad.subtotal as decimal(10,3)) END as 'Sub Total',
		cast(mad.iva as decimal(10,3)) as IVA,
		cast(mad.ieps as decimal(10,3)) as IEPS		 
FROM movimiento_almacen_detalle mad
		LEFT OUTER JOIN articulo A on mad.id_articulo  =A.id_articulo
		LEFT OUTER JOIN movimiento_almacen malm on mad.id_movimiento_almacen = malm.id_movimiento_almacen
		LEFT OUTER JOIN movimiento_almacen_tipo mat on malm.id_movimiento_almacen_tipo=mat.id_movimiento_almacen_tipo
		LEFT OUTER JOIN almacen alma on malm.id_almacen =alma.id_almacen 
		LEFT OUTER JOIN unidad_medida um on mad.id_unidad_medida = um.id_unidad_medida
WHERE	datename(month,malm.fecha_registro) =@MES
		and malm.id_movimiento_almacen_tipo in (6,8,9,11) 
ORDER BY convert(varchar,malm.fecha_registro,103)

GO
/****** Object:  StoredProcedure [dbo].[sp_consultaColonia]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 22.Mayo.2018
-- Description:	SP
-- =============================================
 CREATE PROCEDURE [dbo].[sp_consultaColonia]
	@id as int
AS
BEGIN
	SELECT	c.id_colonia,
			c.id_cp,
			c.nombre,
			c.clave_sat
	FROM colonia c
	left join cp ON cp.id_cp = c.id_cp
	WHERE c.id_cp=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultaEstado]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 22.Mayo.2018
-- Description:	SP
-- =============================================
 CREATE PROCEDURE [dbo].[sp_consultaEstado]
AS
BEGIN
	SELECT *  FROM estado 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultaMunicipio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 22.Mayo.2018
-- Description:	SP
-- =============================================
 CREATE PROCEDURE [dbo].[sp_consultaMunicipio]
	@id as int
AS
BEGIN
	SELECT *  FROM municipio where id_estado= @id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarCatalogoAgrupadorArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_ConsultarCatalogoAgrupadorArticulo]
AS
BEGIN
	SELECT *  FROM agrupador_articulo WHERE alta=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ConsultarCatalogoCFDI]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 24.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_ConsultarCatalogoCFDI]
AS
BEGIN
	SELECT * FROM uso_cfdi WHERE activo=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultarCatalogoDatosFacturacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 22.05.2018
-- Description:	SP
-- =============================================
create PROCEDURE [dbo].[sp_consultarCatalogoDatosFacturacion]
AS
BEGIN
	SELECT * FROM datos_facturacion 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultarCatalogoFamilias]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 14.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_consultarCatalogoFamilias]
AS
BEGIN
	SELECT * FROM familia WHERE activo=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultarCatalogoImpuesto]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 17.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_consultarCatalogoImpuesto]
AS
BEGIN
	SELECT * FROM impuesto WHERE activo=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultarCatalogoMarca]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_consultarCatalogoMarca]
AS
BEGIN
	SELECT *  FROM Marca WHERE activo=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultarCatalogoProveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 22.05.2018
-- Description:	SP
-- =============================================
create PROCEDURE [dbo].[sp_consultarCatalogoProveedor]
AS
BEGIN
	SELECT * FROM proveedor WHERE activo=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultarCatalogoSubMarca]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 11.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_consultarCatalogoSubMarca]
AS
BEGIN
	SELECT * FROM submarca WHERE activo=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_consultarCatalogoZona]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_consultarCatalogoZona]
AS
BEGIN
	SELECT * FROM zona 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_guardarAgrupadorArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 04.junio.2018
-- Description:	Cambio orden de campos para guardar
-- =============================================
CREATE PROCEDURE [dbo].[sp_guardarAgrupadorArticulo]
	@idFamilia as int,
	@clave as nvarchar(100),
	@descripcion as nvarchar(100)

AS
BEGIN
Declare @id decimal;

	INSERT INTO agrupador_articulo
	VALUES (@clave, @idFamilia, @descripcion, GETDATE(), 1)
	set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'id_agrupador_articulo'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_guardarDatosFacturacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-12
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_guardarDatosFacturacion]
	@RFC as nvarchar(13),
	@razon as nvarchar(100),
	@calle as nvarchar(20),
	@numExt as nvarchar(6),
	@numInt as nvarchar(6),
	@idCP as int,
	@idEstado as int,
	@idMunicipio as int,
	@idColonia as int,
	@email as  nvarchar(200),
	@idUsoCfdi as int

AS
BEGIN
	DECLARE @tam AS INT

	SELECT @tam = count(id_datos_facturacion) FROM datos_facturacion WHERE rfc = @RFC
	IF @tam = 0
	BEGIN
		Declare @id decimal;
		INSERT INTO datos_facturacion
		VALUES (@RFC, @razon, @idUsoCfdi, @calle, @numExt, @numInt, @idCP, @idEstado, @idMunicipio, @idColonia, @email)
		set @id = @@IDENTITY;
	
		SELECT	Cast(@id as int) AS 'id_datos_facturacion', 'OK' AS 'mensaje'
	END
	ELSE
	BEGIN
		DECLARE @tamP AS INT
		DECLARE @tamC AS INT

		SELECT @tam = id_datos_facturacion FROM datos_facturacion WHERE rfc = @RFC
		SELECT @tamP = count(id_proveedor) FROM proveedor WHERE id_datos_facturacion = @tam
		SELECT @tamC = count(id_cliente) FROM cliente WHERE id_datos_facturacion = @tam

		IF @tamP = 0 AND @tamC = 0
		BEGIN
			SELECT @tam AS 'id_datos_facturacion', 'OK' AS 'mensaje'
		END
		ELSE IF @tamP > 0
		BEGIN
			SELECT 0 AS 'id_datos_facturacion', 'Ya existe un proveedor con el mismo RFC' AS 'mensaje'
		END
		ELSE
		BEGIN
			SELECT 0 AS 'id_datos_facturacion', 'Ya existe un cliente con el mismo RFC' AS 'mensaje'
		END

	END
	
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_guardarFamilia]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_guardarFamilia]
	@clave as nvarchar(100),
	@descripcion as nvarchar(100)
AS
BEGIN
Declare @id decimal;
	INSERT INTO familia
	VALUES (@clave, @descripcion, GETDATE(), 1)
	set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'id_familia'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_guardarImpuesto]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 04.junio.2018
-- Description:	Se cambio el tipo de dato de @tasa
-- =============================================
CREATE PROCEDURE [dbo].[sp_guardarImpuesto]
	@descripcion as nvarchar(100),
	@tasa as decimal(5,2),
	@claveSAT as nvarchar(10)
AS
BEGIN
Declare @id decimal;
	INSERT INTO impuesto
	VALUES (@descripcion, @tasa, GETDATE(), 1, @claveSAT)
	set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'id_impuesto'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_guardarMarca]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_guardarMarca]
	@clave as nvarchar(100),
	@descripcion as nvarchar(100)
AS
BEGIN
Declare @id decimal;

	INSERT INTO marca
	VALUES (@clave, @descripcion, GETDATE(), 1)
	set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int)  AS 'id_marca'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_guardarProveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 22.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_guardarProveedor]
	@clave as nvarchar(6),
	@nombre as nvarchar(100),
	@telefono as nvarchar(18),
	@gerenteVentas as nvarchar(50),
	@gerenteVentasTel as nvarchar(50),
	@responsableTrafico as nvarchar(100),
	@responsableTraficoTel as nvarchar(15),
	@representanteVenta as nvarchar(50),
	@representanteVentaTel as nvarchar(15),
	@idDatosFacturacion as  int
AS
BEGIN
Declare @id decimal;
	INSERT INTO proveedor
	VALUES (@clave, @nombre, @idDatosFacturacion, @telefono, @gerenteVentas, @gerenteVentasTel,@responsableTrafico, @responsableTraficoTel,@representanteVenta,@representanteVentaTel, GETDATE(), 1)
	set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'id_proveedor'
END
GO
/****** Object:  StoredProcedure [dbo].[sp_guardarSubMarca]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 09.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[sp_guardarSubMarca]
	@idMarca as int,
	@clave as nvarchar(100),
	@descripcion as nvarchar(100)

AS
BEGIN
Declare @id decimal;

	INSERT INTO submarca
	VALUES (@idMarca,@clave, @descripcion, GETDATE(), 1)
	set @id = @@IDENTITY;

	SELECT	Cast(@id as int)  AS 'id_SubMarca'
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaAlmacen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaAlmacen]
	@id as int,
	@nombre as nvarchar(50),
	@esMayoreo as tinyint,
	@activo as tinyint,
	@idSucursal as int,
	@clave as nvarchar(50)
AS
BEGIN
DECLARE @id_almacenR as int
DECLARE @id_sucursalR as int
DECLARE @claveR as nvarchar(5)
DECLARE @nombreR as nvarchar(50)
DECLARE @es_mayoreoR as tinyint
DECLARE @fecha_altaR as DATETIME
DECLARE @activoR as tinyint

if exists(select id_almacen from almacen where @clave = clave and @id != id_almacen)
begin
		SET @id_almacenR =-1;
		SET @id_sucursalR =0;
		SET @claveR ='clave_existe';
		SET @nombreR ='nombre';
		SET @es_mayoreoR =0;
		SET @fecha_altaR =getdate();
		SET @activo =0;
end
else
begin
	if exists(select id_almacen from almacen where nombre = @nombre and @id != id_almacen)
	begin
		SET @id_almacenR =-1;
		SET @id_sucursalR =0;
		SET @claveR ='clave';
		SET @nombreR ='nombre_existe';
		SET @es_mayoreoR =0;
		SET @fecha_altaR =getdate();
		SET @activo =0;
	end
	else
	begin
		if @esMayoreo = 0
		Begin
			IF exists ( SELECT id_almacen FROM almacen WHERE id_sucursal = @idSucursal and es_mayoreo = 0 )
			BEGIN
				SET @id_almacenR =0;
				SET @id_sucursalR =0;
				SET @claveR ='clave';
				SET @nombreR ='nombre';
				SET @es_mayoreoR =0;
				SET @fecha_altaR =getdate();
				SET @activo =0;
			END
			else
			begin
				UPDATE almacen SET	activo = @activo,
							nombre = @nombre, 
							id_sucursal = @idSucursal, 
							es_mayoreo = @esMayoreo,
							clave = @clave 
				where id_almacen = @id

				SELECT 
					@id_almacenR = id_almacen,
					@id_sucursalR = id_sucursal,
					@claveR= clave,
					@nombreR= nombre,
					@es_mayoreoR= es_mayoreo,
					@fecha_altaR= fecha_alta,
					@activo= activo
					FROM almacen WHERE id_almacen = @id
			end
		end
		else
		begin
			UPDATE almacen SET	activo = @activo,
							nombre = @nombre, 
							id_sucursal = @idSucursal, 
							es_mayoreo = @esMayoreo,
							clave = @clave 
				where id_almacen = @id

				SELECT 
					@id_almacenR = id_almacen,
					@id_sucursalR = id_sucursal,
					@claveR= clave,
					@nombreR= nombre,
					@es_mayoreoR= es_mayoreo,
					@fecha_altaR= fecha_alta,
					@activo= activo
					FROM almacen WHERE id_almacen = @id
		end
	end
end

	SELECT 
		@id_almacenR as id_almacen,
		@id_sucursalR as id_sucursal,
		@claveR as clave,
		@nombreR as nombre,
		@es_mayoreoR as es_mayoreo,
		@fecha_altaR as fecha_alta,
		@activo as activo
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaAplicaValeDevolucion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 02.marzo.2019
-- Description:	Actualizar campo aplicado de vale de devolución
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaAplicaValeDevolucion]
	@folio AS nvarchar(12),
	@aplicado AS bit
AS
BEGIN
	UPDATE [dbo].[vale_devolucion]
	   SET [aplicado] = @aplicado
	 WHERE [folio] = @folio
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaAplicaValeDevolucionTransaccion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 02.marzo.2019
-- Description:	Actualizar campo aplicado de vale de devoluci�n transacci�n
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaAplicaValeDevolucionTransaccion]
	@folio AS nvarchar(12),
	@aplicado AS bit
AS
BEGIN
	UPDATE [dbo].[vale_devolucion_transaccion]
	   SET [aplicado] = @aplicado
	 WHERE [folio] = @folio
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaArtCodEq]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 25.mayo.2018
-- Description:	Actualizar articulo equivalente
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaArtCodEq]
	@idArtEq as int,
	@idArticulo as int,
	@codigoBarras as nvarchar(36),
	@cantidadVenta as decimal(18,2),
	@activo as tinyint
AS
BEGIN
	UPDATE articulo_equivalente
	SET id_articulo = @idArticulo,
		codigo_barras = @codigoBarras,
		cantidad_venta = @cantidadVenta, 
		activo = @activo
	WHERE id_articulo_equivalente = @idArtEq
	
	SELECT * FROM articulo_equivalente WHERE id_articulo_equivalente = @idArtEq
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizaArticulo]
	@clave as nvarchar(10),
           @codigo_barras1 as nvarchar(36),
           @id_agrupador_articulo as int,
           @id_linea_negocio as int,
           @id_subcategoria as int,
           @id_marca as int,
           @id_submarca as int,
           @desc_mayoreo as nvarchar(100),
           @tipo as nvarchar(15),
           @id_unidad_compra as int,
           @id_unidad_venta as int,
           @relacion_compra as decimal(12,4),
           @relacion_venta as decimal(12,4),
           @es_inventariable as tinyint,
           @id_iva_compra as int,
           @id_iva_venta as int,
           @id_ieps_compra as int,
           @id_ieps_venta as int,
           @codigo_barras2 as nvarchar(36),
		   @activo as tinyint,
		   @costo_ultimo as Decimal(18,4),
		   @id_familia as int,
		   @desc_super as nvarchar(100)
AS
BEGIN
IF @id_agrupador_articulo !=0
BEGIN
	UPDATE [dbo].[articulo]
	   SET [codigo_barras1] = @codigo_barras1
		  ,[id_agrupador_articulo] = @id_agrupador_articulo
		  ,[id_linea_negocio] = @id_linea_negocio
		  ,[id_subcategoria] = @id_subcategoria
		  ,[id_marca] = @id_marca
		  ,[id_submarca] = @id_submarca
		  ,[desc_mayoreo] = @desc_mayoreo
		  ,desc_super = @desc_super
		  ,[tipo] = @tipo
		  ,[id_unidad_compra] = @id_unidad_compra
		  ,[id_unidad_venta] = @id_unidad_venta
		  ,[relacion_compra] = @relacion_compra 
		  ,[relacion_venta] = @relacion_venta
		  ,[es_inventariable] = @es_inventariable
		  ,[id_iva_compra] = @id_iva_compra
		  ,[id_iva_venta] = @id_iva_venta 
		  ,[id_ieps_compra] = @id_ieps_compra
		  ,[id_ieps_venta] = @id_ieps_venta
		  ,[fecha_ultima_modificacion] = GETDATE()
		  ,[activo] = @activo
		  ,[codigo_barras2] = @codigo_barras2
		  ,costo_ultimo = @costo_ultimo,
		  id_familia = @id_familia
	 WHERE clave = @clave
	END
	ELSE 
	BEGIN
	UPDATE [dbo].[articulo]
	   SET [codigo_barras1] = @codigo_barras1
		  ,[id_agrupador_articulo] = NULL
		  ,[id_linea_negocio] = @id_linea_negocio
		  ,[id_subcategoria] = @id_subcategoria
		  ,[id_marca] = @id_marca
		  ,[id_submarca] = @id_submarca
		  ,[desc_mayoreo] = @desc_mayoreo
		  ,desc_super = @desc_super
		  ,[tipo] = @tipo
		  ,[id_unidad_compra] = @id_unidad_compra
		  ,[id_unidad_venta] = @id_unidad_venta
		  ,[relacion_compra] = @relacion_compra 
		  ,[relacion_venta] = @relacion_venta
		  ,[es_inventariable] = @es_inventariable
		  ,[id_iva_compra] = @id_iva_compra
		  ,[id_iva_venta] = @id_iva_venta 
		  ,[id_ieps_compra] = @id_ieps_compra
		  ,[id_ieps_venta] = @id_ieps_venta
		  ,[fecha_ultima_modificacion] = GETDATE()
		  ,[activo] = @activo
		  ,[codigo_barras2] = @codigo_barras2
		  ,costo_ultimo = @costo_ultimo,
		  id_familia = @id_familia
	 WHERE clave = @clave
	END
	SELECT * FROM articulo WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaArticuloAdicionales]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola Martin
-- Create date: 05 junio 2018
-- Description:	Actualizar articulo_adicionales
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-09-08
-- Description:	Cambios por agregar columna es_recarga
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaArticuloAdicionales]
	@idArticuloAdicionales as int,
	@vendeSinExistencia as tinyint
    ,@cmSuperAncho as int
    ,@cmSuperAlto as int
    ,@cmSuperLargo as int
    ,@cmSuperPeso as int
    ,@cmMayoreoAncho as int
    ,@cmMayoreoAlto as int
    ,@cmMayoreoLargo as int
    ,@cmMayoreoPeso as int
    ,@pideReceta as tinyint
    ,@sobrePedido as tinyint
    ,@descontinuado as tinyint
    ,@margenPrecioSugerido as decimal(5,2)
    ,@utilidadMinima as decimal(5,2)
	,@esRecarga as bit
AS
BEGIN
	UPDATE [dbo].[articulo_adicionales]
   SET [vende_sin_existencia] = @vendeSinExistencia
      ,[cm_super_ancho] = @cmSuperAncho
      ,[cm_super_alto] = @cmSuperAlto
      ,[cm_super_largo] = @cmSuperLargo
      ,[cm_super_peso] = @cmSuperPeso
      ,[cm_mayoreo_ancho] = @cmMayoreoAncho
      ,[cm_mayoreo_alto] = @cmMayoreoAlto
      ,[cm_mayoreo_largo] = @cmMayoreoLargo
      ,[cm_mayoreo_peso] = @cmMayoreoPeso
      ,[pide_receta] = @pideReceta
      ,[sobre_pedido] = @sobrePedido
      ,[descontinuado] = @descontinuado
      ,[margen_precio_sugerido] = @margenPrecioSugerido
      ,[utilidad_minima] = @utilidadMinima
	  ,[es_recarga] = @esRecarga
 WHERE id_articulo_adicionales = @idArticuloAdicionales
	select @idArticuloAdicionales
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaArticuloExistencias]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 16 de Agosto de 2018
-- Description:	Actuliza Articulo existencias
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaArticuloExistencias]
	@idArticulo as int,
    @idAlmacen as int,
    @existenciaIni as decimal(18,4),
    @stockMinimo as decimal(18,4),
    @stockMaximo as decimal(18,4),
    @ubicacion as nvarchar(10)
AS
BEGIN
DECLARE @existenciaInicialActual as decimal

SELECT @existenciaInicialActual= existencia_inicial FROM articulo_existencia
WHERE id_articulo = @idArticulo and id_almacen = @idAlmacen
 

IF(@existenciaInicialActual=0)
BEGIN
	UPDATE [dbo].[articulo_existencia]
	   SET [id_articulo] = @idArticulo
		  ,[id_almacen] = @idAlmacen
		  ,[ubicacion] = @ubicacion
		  ,[stock_minimo] = @stockMinimo
		  ,[stock_maximo] = @stockMaximo
		  ,[existencia_inicial] = @existenciaIni
		  ,[existencia_actual] = @existenciaIni
	 WHERE id_articulo = @idArticulo and id_almacen = @idAlmacen
 END
 ELSE
 BEGIN
	UPDATE [dbo].[articulo_existencia]
	   SET [id_articulo] = @idArticulo
		  ,[id_almacen] = @idAlmacen
		  ,[ubicacion] = @ubicacion
		  ,[stock_minimo] = @stockMinimo
		  ,[stock_maximo] = @stockMaximo
		  ,[existencia_inicial] = @existenciaIni
	 WHERE id_articulo = @idArticulo and id_almacen = @idAlmacen
 END 

	SELECT * FROM articulo_existencia WHERE id_articulo = @idArticulo and id_almacen = @idAlmacen
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaArticuloPrecio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-30
-- Description:	Se reciben 6 decimales para precio
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaArticuloPrecio]
	@idArticuloPrecio as int,
	@noOrden as int,
	@margen as decimal(18,2),
	@precio as decimal(18,6),
	@cantidad as decimal(18,4),
	@utilidad as decimal(18,6)
AS
BEGIN
	UPDATE [dbo].[articulo_precio]
   SET [no_orden] = @noOrden
      ,[margen_utilidad] = @margen
      ,[precio_venta] = @precio
      ,[cantidad] = @cantidad
      ,[utilidad] = @utilidad
      ,[fecha_modificacion] = GETDATE()
 WHERE id_articulo_precio = @idArticuloPrecio
	SELECT * FROM articulo_precio WHERE id_articulo_precio = @idArticuloPrecio
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaArticuloProveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-29
-- Description:	Agregar clave proveedor en la respuesta
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-04-03
-- Description:	6 decimales en costo
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaArticuloProveedor]
	@idArticuloProveedor as int,
	@costo as decimal(18,6)
AS
BEGIN
	UPDATE [dbo].[articulo_proveedor]
   SET [costo] = @costo
 WHERE id_articulo_proveedor = @idArticuloProveedor
	SELECT 
		ap.*,
		p.clave 
	FROM 
		articulo_proveedor ap 
		LEFT JOIN  proveedor p ON ap.id_proveedor = p.id_proveedor
	WHERE 
		id_articulo_proveedor = @idArticuloProveedor
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaBitacoraImpresion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-07-23
-- Description:	Actualiza Bitacora de Impresion
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaBitacoraImpresion]
			@id_bitacora_impresion as int
			,@id_usuario as int
           ,@id_modulo as int
           ,@referencia as nvarchar(20)
		   ,@contador as int
AS
BEGIN
	UPDATE [dbo].[bitacora_impresion]
		SET [id_usuario] = @id_usuario
		  ,[id_modulo] = @id_modulo
		  ,[referencia] = @referencia
		  ,[contador] = @contador
	WHERE [id_bitacora_impresion] = @id_bitacora_impresion
	
	SELECT * FROM bitacora_impresion WHERE id_bitacora_impresion = @id_bitacora_impresion

END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 17.mayo.2018
-- Description:	Actualiza caja y consulta el ID
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaCaja]
	@idAlmacen as int,
	@nombre as nvarchar(15),
	@noCaja as int,
	@enUsoPV as tinyint,
	@activo as tinyint
AS
BEGIN
	UPDATE caja SET id_almacen=@idAlmacen, 
					en_uso_pv=@enUsoPV, 
					activo = @activo,
					nombre = @nombre
	WHERE no_caja = @noCaja
	
	SELECT * FROM caja WHERE no_caja = @noCaja
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaCategoria]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 11.mayo.2018
-- Description:	Actualiza categoría y consulta el ID
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaCategoria]
	@id as int,
	@clave as nvarchar(100),
	@descripcion as nvarchar(100),
	@activo as tinyint
AS
BEGIN
	UPDATE categoria SET	activo = @activo, 
							clave = @clave,
							descripcion = @descripcion
	WHERE id_categoria = @id
	SELECT * FROM categoria WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaCliente]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		carlos Negrete
-- Create date: 30.mayo.2018
-- Description:	Guarda cliente y consulta el ID
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaCliente]
	@idCliente as int,
	@nombre as nvarchar(200),
	@observaciones as nvarchar(510),
	@idFormaPago as int,
	@tel1 as nvarchar(40),
	@activo as int 
AS
BEGIN
	UPDATE cliente SET nombre = @nombre, observaciones = @observaciones,
		id_forma_pago = @idFormaPago, telefono1 = @tel1,  activo = @activo
	WHERE id_cliente = @idCliente
	
	
	SELECT id_datos_facturacion from cliente where id_cliente =@idCliente
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaConfiguracionPromocion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 10.Julio.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaConfiguracionPromocion]
	@idPromo				as int, 
	@clave					as nvarchar(100),
	@nombre					as nvarchar(100),
	@vigenciaInicio			as Datetime,
	@vigenciaFin			as Datetime,
	@visiblePV				as int, 
	@acumulable				as int,
	@limiteSucursal			as int,
	@activo					as int,
	@idProveedor			as int
		
AS
BEGIN
	DECLARE @id as int;
	if NOT Exists(Select * from promocion where clave=@clave and id_promocion!=@idPromo)
	BEGIN
		UPDATE promocion				
			SET clave = @clave,
				nombre = @nombre,
				vigencia_inicio = @vigenciaInicio,
				vigencia_fin = @vigenciaFin,
				visible_en_pv = @visiblePV,
				acumulable = @acumulable,
				limite_sucursal = @limiteSucursal,
				fecha_modificacion = GETDATE(),
				activo = @activo,
				id_proveedor = @idProveedor
		WHERE id_promocion= @idPromo
		set @id = @idPromo;
	END
	ELSE
	BEGIN
		set @id =-1;
	END
	SELECT	Cast(@id as int) AS 'idPromocion';
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaCostoArticuloProveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-09-03
-- Description:	Actualiza costo en tabla articulo_proveedor
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaCostoArticuloProveedor]
	@listaArticulos AS ArticuloProveedorCostoType READONLY
AS
BEGIN
	DECLARE @idArticulo		AS	INT;
	DECLARE @idProveedor	AS	INT;
	DECLARE @costo			AS	DECIMAL(18,2);

	DECLARE cursorArticulos CURSOR FOR
	SELECT * FROM @listaArticulos

	OPEN cursorArticulos
	FETCH NEXT FROM cursorArticulos
	INTO @idArticulo, @idProveedor, @costo

	WHILE @@FETCH_STATUS = 0
	BEGIN
		
		UPDATE 
			articulo_proveedor
		SET 
			costo = @costo
		WHERE
			id_articulo = @idArticulo AND
			id_proveedor = @idProveedor

		FETCH NEXT FROM cursorArticulos
		INTO @idArticulo, @idProveedor, @costo
	END
	CLOSE cursorArticulos
	DEALLOCATE cursorArticulos

	SELECT 'OK'
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaDenominacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 10.mayo.2018
-- Description:	Actualiza denominación y consulta el ID.
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaDenominacion]
	@descripcion as nvarchar(100),
	@monto as int,
	@activo as tinyint
AS
BEGIN
	UPDATE denominacion SET monto = @monto, activo = @activo WHERE descripcion = @descripcion
	SELECT * FROM denominacion WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaDevueltoMovimientoAlmacen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-07-19
-- Description:	Modifica campo devuelto en movimiento_almacen
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaDevueltoMovimientoAlmacen]
	@idsMovimientoAlmacen	AS ListaIDs READONLY
AS
BEGIN
	DECLARE @articulosNoDevueltos 	AS	INT;
	DECLARE @idMovimiento			AS	INT;

	DECLARE cursorMov CURSOR FOR
	SELECT * FROM @idsMovimientoAlmacen

	OPEN cursorMov
	FETCH NEXT FROM cursorMov
	INTO @idMovimiento

	WHILE @@FETCH_STATUS = 0
	BEGIN

		SET @articulosNoDevueltos = 0;
		SELECT
			@articulosNoDevueltos = COUNT(*)
		FROM
			movimiento_almacen_detalle mad
			LEFT JOIN movimiento_almacen ma ON mad.id_movimiento_almacen = ma.id_movimiento_almacen
		WHERE
			ma.id_movimiento_almacen = @idMovimiento AND
			mad.fecha_devuelto IS NULL


		IF(@articulosNoDevueltos = 0)
		BEGIN
			UPDATE
				movimiento_almacen
			SET
				devuelto = 1
			WHERE
				id_movimiento_almacen = @idMovimiento
		END

		FETCH  NEXT FROM cursorMov
		INTO @idMovimiento
	END

	SELECT 'OK' AS respuesta

END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaFacturacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carolina Franco
-- Create date: 2019-03-09
-- Description:	Actualiza el id de facturacion en las venta
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaFacturacion]
	@idFacturacion as int,
	@error as nvarchar(150),
	@folioFiscal as nvarchar(40),
	@idCaja as int
AS
BEGIN
	UPDATE [dbo].[facturacion]
	   SET [folio_fiscal] = @folioFiscal
		  ,[fecha_generado] = GETDATE()
		  ,[error] = @error
	 WHERE id_facturacion = @idFacturacion

	 IF @folioFiscal IS NOT NULL
	 BEGIN
		UPDATE [dbo].[caja]
			SET [folio_factura_actual] = @folioFiscal
		WHERE
			id_caja = @idCaja
	 END

	 select @idFacturacion as 'id_facturacion'
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaFacturacionConsolidacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carolina Franco
-- Create date: 2019-03-09
-- Description:	Actualiza el id de facturacion en la consolidacion
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaFacturacionConsolidacion]
	@idConsolidacion as int,
	@idFacturacion as int,
	@idCaja as int
AS
BEGIN

	DECLARE @folioFiscal AS nvarchar(40);

	UPDATE consolidacion SET id_facturacion = @idFacturacion where id_consolidacion  = @idConsolidacion;
	
	SELECT @folioFiscal = folio_fiscal from facturacion where id_facturacion = @idFacturacion;

	IF @folioFiscal IS NOT NULL
	BEGIN
		UPDATE caja SET folio_cons_int_actual = @folioFiscal where id_caja = @idCaja;
	END

END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaFacturacionVenta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-12-27
-- Description:	Actualiza el id de facturacion en las ventas
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaFacturacionVenta]
	@folios as varchar(800),
	@idFacturacion as int
AS
BEGIN

	UPDATE movimiento_almacen SET id_facturacion = @idFacturacion where folio in(select Value from funcListToTableString(@folios,','))

END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaFechasDevolucionesMA]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 2020-02-27
-- Description:	Se agrego cuando una una devolucion tiene promocion
--              se edite a 0 aplicadas en promocion_venta para que no 
--              se considere como una promocion que si se otorgo.
--              De momento no se comenta el movimiento negativo
--              para las devoluciones parciales y fue comentado.
-- =============================================

-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 2020-01-16
-- Description:	Se modifico para insertar un movimiento negativo de las devoluciones 
--              parciales al ticket y obtener un total correcto ya que en dichos movimientos 
--              no se actualiza la fecha de devoucion y se toma como completo aun.
--              Si la devolucion es parcial y luego se completa, actualiza la fecha de devolucion 
--              y borra todos los movimientos negativos
-- =============================================

-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-07-19
-- Description:	Se buscan las cantidades devueltas por id_movimiento_almacen_detalle
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaFechasDevolucionesMA]
	@articulos AS ArticuloPorMovimiento READONLY
AS
BEGIN
	DECLARE @idArticulo		  AS INT;
	DECLARE @idMovimiento	  AS INT;
	DECLARE @cantidadDevuelta AS DECIMAL;
	DECLARE @cantidadTotal	  AS DECIMAL;
	DECLARE @folio			  AS NVARCHAR(20);
	DECLARE @idTicket	      AS INT;
	DECLARE @idma             AS INT;
	DECLARE @idmad            AS INT;
	DECLARE @cons             AS INT;
	DECLARE @exis             AS INT;

	DECLARE cursorArticulos CURSOR FOR
	SELECT * FROM @articulos

	OPEN cursorArticulos

	FETCH NEXT FROM cursorArticulos
	INTO @idMovimiento, @idArticulo

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @cantidadTotal = CASE WHEN mad.id_unidad_medida = a.id_unidad_compra THEN cantidad * a.relacion_venta 
		ELSE cantidad END FROM movimiento_almacen_detalle mad LEFT JOIN articulo a ON mad.id_articulo = a.id_articulo 
		WHERE id_movimiento_almacen_detalle = @idMovimiento;
		
		SELECT @folio = folio, @idTicket=ma.id_movimiento_almacen FROM movimiento_almacen ma LEFT JOIN movimiento_almacen_detalle mad ON 
		ma.id_movimiento_almacen = mad.id_movimiento_almacen WHERE mad.id_movimiento_almacen_detalle = @idMovimiento;

		SELECT @cantidadDevuelta = SUM(CASE WHEN mad.id_unidad_medida = a.id_unidad_compra THEN cantidad * a.relacion_venta ELSE cantidad END) 
		FROM movimiento_almacen_detalle mad LEFT JOIN movimiento_almacen ma ON mad.id_movimiento_almacen = ma.id_movimiento_almacen
		LEFT JOIN articulo a ON mad.id_articulo = a.id_articulo WHERE ma.referencia LIKE '%' + @folio + '%' AND mad.id_referencia_detalle = @idMovimiento;

		--Se actualiza a 0 la aplicacion de promocion solo si existe el registro en promocion_venta
		--No es necesario validar que se devuelva el total regalado ya que de eso hay una validacion previa
		UPDATE promocion_venta SET aplicadas=0 WHERE id_ticket=@idTicket AND id_articulo_regalo=@idArticulo;

		IF(@cantidadDevuelta >= @cantidadTotal)
		BEGIN
			--Se actualiza la fecha si la devolucion ya es total
			UPDATE movimiento_almacen_detalle SET fecha_devuelto = GETDATE() WHERE id_movimiento_almacen_detalle = @idMovimiento;

			----Si la devolucion tuvo devoluciones previas parciales borra esos movimientos
			--DELETE mad FROM movimiento_almacen ma INNER JOIN movimiento_almacen_detalle mad ON ma.id_movimiento_almacen=mad.id_movimiento_almacen 
			--WHERE folio = @folio AND id_articulo = @idArticulo AND cantidad < 0;
		END
		--ELSE
		--BEGIN
		--	SELECT @idma=mad.id_movimiento_almacen,@exis=mad.existencia_al_momento FROM movimiento_almacen ma 
		--	INNER JOIN movimiento_almacen_detalle mad ON ma.id_movimiento_almacen = mad.id_movimiento_almacen 
		--	WHERE mad.id_articulo=@idArticulo AND ma.folio = @folio;

		--	SELECT @cons=MAX(mad.consecutivo)+1 FROM movimiento_almacen ma INNER JOIN movimiento_almacen_detalle mad 
		--	ON ma.id_movimiento_almacen = mad.id_movimiento_almacen WHERE ma.folio = @folio;

		--	SELECT TOP 1 @idmad=id_movimiento_almacen_detalle FROM movimiento_almacen ma INNER JOIN movimiento_almacen_detalle mad 
		--	ON ma.id_movimiento_almacen = mad.id_movimiento_almacen WHERE mad.id_articulo=@idArticulo AND ma.referencia=@folio
		--	ORDER BY id_movimiento_almacen_detalle DESC;

		--	INSERT INTO movimiento_almacen_detalle
		--	SELECT @idma,id_almacen,id_articulo,@cons,cantidad*(-1),costo_unitario,id_unidad_medida,descuento*(-1),importe*(-1),
		--	fecha_devuelto,ingresado,NULL,@exis,subtotal*(-1),iva*(-1),ieps*(-1),es_mayoreo,costo*(-1),tasa_iva,tasa_ieps
		--	FROM movimiento_almacen_detalle WHERE id_movimiento_almacen_detalle = @idmad;
		--END

		FETCH NEXT FROM cursorArticulos
		INTO @idMovimiento, @idArticulo
	END
	CLOSE cursorArticulos;
	DEALLOCATE cursorArticulos;

	SELECT 'OK';
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaFoliosCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 25.agosto.2018
-- Description:	Actualiza caja y sus folios
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaFoliosCaja]
	@idCaja as int,
	@folio_retiro_actual as nvarchar(12) = null,
    @folio_corte_actual as nvarchar(12) = null,
    @folio_ticket_actual as nvarchar(12) = null,
    @folio_factura_actual as nvarchar(12) = null,
    @folio_cotizacion_actual as nvarchar(12) = null,
    @folio_dev_cli_actual as nvarchar(12) = null,
    @folio_compra_actual as nvarchar(12) = null,
    @folio_dev_prov_actual as nvarchar(12) = null,
    @folio_aju_ent_actual as nvarchar(12) = null,
    @folio_aju_sal_actual as nvarchar(12) = null,
    @folio_trans_ent_actual as nvarchar(12) = null,
    @folio_trans_sal_actual as nvarchar(12) = null ,
    @folio_trans_alm_ent_actual as nvarchar(12) = null,
    @folio_trans_alm_sal_actual as nvarchar(12) = null,
    @folio_cons_int_actual as nvarchar(12) = null,
    @folio_gastos_actual as nvarchar(12) = null
AS
BEGIN
	UPDATE [dbo].[caja]
   SET [folio_retiro_actual] = isnull(@folio_retiro_actual,[folio_retiro_actual])
      ,[folio_corte_actual] = isnull(@folio_corte_actual,[folio_corte_actual])
      ,[folio_ticket_actual] = isnull(@folio_ticket_actual,[folio_ticket_actual])
      ,[folio_factura_actual] = isnull(@folio_factura_actual,[folio_factura_actual])
      ,[folio_cotizacion_actual] = isnull(@folio_cotizacion_actual,[folio_cotizacion_actual])
      ,[folio_dev_cli_actual] = isnull(@folio_dev_cli_actual,[folio_dev_cli_actual])
      ,[folio_compra_actual] = isnull(@folio_compra_actual,[folio_compra_actual])
      ,[folio_dev_prov_actual] = isnull(@folio_dev_prov_actual,[folio_dev_prov_actual])
      ,[folio_aju_ent_actual] = isnull(@folio_aju_ent_actual,[folio_aju_ent_actual])
      ,[folio_aju_sal_actual] = isnull(@folio_aju_sal_actual,[folio_aju_sal_actual])
      ,[folio_trans_ent_actual] = isnull(@folio_trans_ent_actual,[folio_trans_ent_actual])
      ,[folio_trans_sal_actual] = isnull(@folio_trans_sal_actual,[folio_trans_sal_actual])
      ,[folio_trans_alm_ent_actual] = isnull(@folio_trans_alm_ent_actual,[folio_trans_alm_ent_actual])
      ,[folio_trans_alm_sal_actual] = isnull(@folio_trans_alm_sal_actual,[folio_trans_alm_sal_actual])
      ,[folio_cons_int_actual] = isnull(@folio_cons_int_actual,[folio_cons_int_actual])
      ,[folio_gastos_actual] = isnull(@folio_gastos_actual,[folio_gastos_actual])
 WHERE id_caja = @idCaja

END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaFormaDePago]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 07.junoi.2018
-- Description:	Cambio tipo dato cargo
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-11-30
-- Description:	Se agregó abre_cajon
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaFormaDePago]
	@descripcion as nvarchar(100),
	@referencia as tinyint,
	@daCambio as tinyint,
	@daCambioCualquierFp as tinyint,
	@repetirForma as tinyint,
	@usadaEnPuntoVenta as tinyint,
	@pideBanco as tinyint,
	@esTarjeta as tinyint,
	@esCredito as tinyint,
	@enlaceBanco as tinyint,
	@claveSAT as nvarchar(100),
	@porcentajeCargo as decimal(4,2),
	@activo as tinyint,
	@abreCajon as bit
AS
BEGIN
	UPDATE forma_pago SET descripcion = @descripcion,
							referencia = @referencia,
							da_cambio =	@daCambio,
							da_cambio_cualquier_fp = @daCambioCualquierFp,
							repetir_forma = @repetirForma,
							usada_en_punto_venta = @usadaEnPuntoVenta,
							pide_banco = @pideBanco,
							es_tarjeta = @esTarjeta,
							es_credito = @esCredito,
							enlace_banco = @enlaceBanco,
							clave_sat = @claveSAT,
							porcentaje_cargo = @porcentajeCargo,
							activo = @activo,
							abre_cajon = @abreCajon
	WHERE descripcion = @descripcion
	
	SELECT * FROM forma_pago WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaFoto]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--====================================
-- Author:		Carlos Negrete
-- Create date: 29.Junio.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaFoto]
	@idPromocion			as int,
	@img					as image,
	@nombreImg				as nvarchar(100)

AS
BEGIN
	DECLARE @id as int;
	if exists(select id_promocion from promocion_imagen where id_promocion = @idPromocion)
	BEGIN
		Update promocion_imagen SET imagen=@img,
								nombre_imagen=@nombreImg
		WHERE id_promocion=@idPromocion
		
	END
	ELSE
	BEGIN
		INSERT INTO promocion_imagen VALUES(@idPromocion, @img, @nombreImg)
	END
	SET @id = @idPromocion
	SELECT	Cast(@id as int) AS 'idPromocion';
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaPrecioAgrupador]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 05.junio.2018
-- Description:	Quitar campo clave y nombre
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaPrecioAgrupador]
	@idAgrupadorArticulo as int,
	@nivelPrecio as int,
	@cantidad as int,
	@activo as tinyint
AS
BEGIN
	UPDATE precio_agrupador SET cantidad = @cantidad, activo=@activo
	WHERE id_agrupador_articulo = @idAgrupadorArticulo AND nivel_precio = @nivelPrecio
	
	SELECT * FROM precio_agrupador
	WHERE id_agrupador_articulo = @idAgrupadorArticulo AND nivel_precio = @nivelPrecio
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaPrioridadArticuloProveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-06-29
-- Description:	actualiza la prioridad del proveedor articulo
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaPrioridadArticuloProveedor]
	@idArticuloProveedor	AS	INT,
	@prioridad				AS	INT
AS
BEGIN
	UPDATE 
		articulo_proveedor
	SET 
		prioridad = @prioridad
	WHERE 
		id_articulo_proveedor = @idArticuloProveedor


	SELECT 
		ap.*,
		p.clave 
	FROM 
		articulo_proveedor ap 
		LEFT JOIN  proveedor p ON ap.id_proveedor = p.id_proveedor
	WHERE 
		ap.id_articulo_proveedor = @idArticuloProveedor
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarBanco]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarBanco]
	@desc as nvarchar(50),
	@enPuntoVenta as tinyint,
	@activo as tinyint
AS
BEGIN

	UPDATE banco SET activo = @activo,en_punto_venta = @enPuntoVenta where descripcion = @desc

	SELECT * FROM banco WHERE descripcion = @desc
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarCamposVenta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 17.agosto.2018
-- Description:	Actualizar campos afectados por una venta
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarCamposVenta]
	@idMovimientoAlmacen	AS INT, 
	@idCaja					AS INT,
	@tablaArticulos			AS ListaIDs READONLY,
	@tablaCotizaciones		AS ListaIDs READONLY,
	@idCliente				AS INT,
	@tablaPromociones		AS PromocionDetalle READONLY,
	@folioVenta				AS nvarchar(12),
	@tablaTransacciones		AS ListaIDs READONLY
AS
BEGIN
	UPDATE [dbo].[caja]
	   SET [folio_ticket_actual] = @folioVenta
	WHERE [id_caja] = @idCaja

	DECLARE @idArticulo AS INT
	DECLARE cArticulos CURSOR
		FOR SELECT id FROM @tablaArticulos
	OPEN cArticulos
	FETCH NEXT FROM cArticulos
	INTO @idArticulo
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE [dbo].[articulo]
			SET [fecha_ultima_venta] = GETDATE()
		WHERE [id_articulo] = @idArticulo
		FETCH NEXT FROM cArticulos
		INTO @idArticulo
	END
	CLOSE cArticulos
	DEALLOCATE cArticulos

	UPDATE [dbo].[cotizacion]
		SET [id_venta] = @idMovimientoAlmacen
	WHERE [id_cotizacion] IN (SELECT id FROM @tablaCotizaciones)

	IF @idCliente <> 0
		UPDATE [dbo].[cliente]
			SET [ultima_compra] = GETDATE()
		WHERE [id_cliente] = @idCliente

	DECLARE @idPromocion		AS INT
	DECLARE @idArticuloRegalo	AS INT
	DECLARE @montoCantidad		AS DECIMAL(18,2)
	DECLARE @aplicadas			AS INT
	DECLARE cPromociones CURSOR
		FOR SELECT id_promocion, id_articulo_regalo, monto_cantidad, aplicadas FROM @tablaPromociones
	OPEN cPromociones
	FETCH NEXT FROM cPromociones
	INTO @idPromocion, @idArticuloRegalo, @montoCantidad, @aplicadas
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO [dbo].[promocion_venta]
				   ([id_promocion]
				   ,[id_ticket]
				   ,[id_articulo_regalo]
				   ,[monto_cantidad]
				   ,[fecha_registro]
				   ,[aplicadas])
			 VALUES
				   (@idPromocion
				   ,@idMovimientoAlmacen
				   ,@idArticuloregalo
				   ,@montoCantidad
				   ,GETDATE()
				   ,@aplicadas)
		FETCH NEXT FROM cPromociones
		INTO @idPromocion, @idArticuloRegalo, @montoCantidad, @aplicadas
	END
	CLOSE cPromociones
	DEALLOCATE cPromociones

	UPDATE [dbo].[transaccion_banco]
	   SET [id_ticket] = @idMovimientoAlmacen
		  ,[folio_ticket] = @folioVenta
	 WHERE [id_transaccion] IN (SELECT id FROM @tablaTransacciones)
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarCancelacionFactura]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez      
-- Create date: 28/Noviembre/2019
-- Description:	Actualiza los datos de facturación
--              cuando se cancela la factura de 
--              venta o global
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarCancelacionFactura]
	@id_facturacion AS INT,
	@comment        AS VARCHAR(200)
AS
	BEGIN
		DECLARE @id_consolidacion AS INT;

		BEGIN TRANSACTION 

		BEGIN TRY
			UPDATE facturacion SET fecha_cancelado=GETDATE(), error=@comment WHERE id_facturacion=@id_facturacion; 

			SELECT @id_consolidacion=id_consolidacion FROM consolidacion WHERE id_facturacion=@id_facturacion;

			IF @id_consolidacion IS NOT NULL
				BEGIN
					UPDATE movimiento_almacen SET id_consolidacion=NULL  WHERE id_consolidacion=@id_consolidacion;
				END
			ELSE
				BEGIN
					UPDATE movimiento_almacen SET id_facturacion=NULL  WHERE id_facturacion=@id_facturacion;
				END
		
			COMMIT TRANSACTION

			SELECT '1' AS 'Resultado';
		END TRY

		BEGIN CATCH
			ROLLBACK TRANSACTION
			SELECT '2'AS 'Resultado';
		END CATCH
	END

GO
/****** Object:  StoredProcedure [dbo].[spActualizarConfiguracionSeguridad]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-07-27
-- Description:	Inserta o actualiza nivel de seguridad
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarConfiguracionSeguridad]
	@idNivelSeguridad INT,
	@intervalo INT
AS
BEGIN
	UPDATE
		nivel_seguridad
	SET
		intervalo_toma = @intervalo,
		fecha_modificacion = GETDATE()
	WHERE
		id_nivel_seguridad = @idNivelSeguridad
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaRecarga]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Aldo Barugola
-- Create date:		2018-12-06
-- Description:		Actualiza recarga
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaRecarga]
	@id_recarga as int
	,@folio_ticket as nvarchar(12)
	,@id_saldo_pago as int
	,@id_estatus as int
	,@descripcion_estatus as nvarchar(50)
	,@detalle_estatus as nvarchar(100)
	,@autorizacion as nvarchar(50)
AS
BEGIN
	DECLARE @id_movimiento_almacen as int

	SELECT TOP 1 @id_movimiento_almacen = id_movimiento_almacen FROM movimiento_almacen WHERE folio = @folio_ticket;
    UPDATE [dbo].[recarga]
	SET [id_movimiento_almacen] = @id_movimiento_almacen
		  ,[folio_ticket] = @folio_ticket
		  ,[id_saldo_pago] = @id_saldo_pago
		  ,[id_estatus] = @id_estatus
		  ,[descripcion_estatus] = @descripcion_estatus
		  ,[detalle_estatus] = @detalle_estatus
		  ,[autorizacion] = @autorizacion
	WHERE id_recarga = @id_recarga;

	SELECT	@id_recarga as 'id_recarga';
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaREGFACTCOMPRASRegistrada]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 13.julio.2018
-- Description:	Actualiza registrada
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaREGFACTCOMPRASRegistrada]
	@idRegi AS INT
AS
BEGIN
	UPDATE [REGFACTCOMPRAS] SET [RF_Registrada] = 1
	WHERE [RF_IDREGI] = @idRegi

	SELECT CAST(1 AS BIT) AS 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarEstadoOrdenCompra]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-07-23
-- Description:	Cambio estado por id_estado
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarEstadoOrdenCompra]
	@tablaIDs ListaIDs READONLY
AS
BEGIN
	DECLARE @idOrdenCompra AS INT
	DECLARE cOC CURSOR
		FOR SELECT [id] FROM @tablaIDs
	OPEN cOC
	FETCH NEXT FROM cOC INTO @idOrdenCompra
	WHILE @@FETCH_STATUS = 0
    BEGIN
		DECLARE @ingresado AS BIT
		DECLARE @banderaIngresado AS BIT
		SET @banderaIngresado = 1
		DECLARE cursorOCD CURSOR
		FOR SELECT [ingresado] FROM [orden_compra_detalle] WHERE [id_orden_compra] = @idOrdenCompra
		OPEN cursorOCD
		FETCH NEXT FROM cursorOCD INTO @ingresado
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @ingresado = 0
				SET @banderaIngresado = 0
			FETCH NEXT FROM cursorOCD INTO @ingresado
		END
		CLOSE cursorOCD
		DEALLOCATE cursorOCD
		IF @banderaIngresado = 1
			UPDATE [orden_compra]
			SET [id_promovimiento_almacen_estado] = 3
			WHERE [id_orden_compra] = @idOrdenCompra
		ELSE
			UPDATE [orden_compra]
			SET [id_promovimiento_almacen_estado] = 2
			WHERE [id_orden_compra] = @idOrdenCompra
    END
    CLOSE cOC
    DEALLOCATE cOC
	SELECT CAST(1 AS BIT) AS 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarEstadoPretransferencia]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-07-23
-- Description:	cambio estado por id_estado
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarEstadoPretransferencia]
	@idMovimiento AS INT,
	@tablaIDs ListaIDs READONLY
AS
BEGIN
	DECLARE @idPretransferencia AS INT
	DECLARE cPret CURSOR
		FOR SELECT [id] FROM @tablaIDs
	OPEN cPret
	FETCH NEXT FROM cPret INTO @idPretransferencia
	WHILE @@FETCH_STATUS = 0
    BEGIN
        UPDATE [pretransferencia]
        SET [id_promovimiento_almacen_estado] = 3,
        	[id_transferencia_entrada] = @idMovimiento
    	WHERE [id_pretransferencia] = @idPretransferencia
        FETCH NEXT FROM cPret INTO @idPretransferencia
    END
    CLOSE cPret
    DEALLOCATE cPret
	SELECT CAST(1 AS BIT) AS 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaRetirosRealizados]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-01
-- Description:	Actualiza los retiros que han sido recolectados por el banco
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaRetirosRealizados]
	@id_sucursal  as int,
	@id_movimiento_caja_tipo as int,
	@id_movimiento_caja_concepto as int,
	@id_tira_banco as int
AS
BEGIN 
	UPDATE movimiento_caja SET id_tira_banco = @id_tira_banco
		WHERE id_movimiento_caja_tipo = @id_movimiento_caja_tipo 
		AND id_movimiento_caja_concepto = @id_movimiento_caja_concepto 
		AND id_tira_banco IS NULL
		AND id_sucursal = @id_sucursal
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarExistenciasAuditoria]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces - Alter Israel Flores C.
-- Create date: 29.abril.2019 - Diciembre 2019
-- Description:	Actualizar existencia auditoría
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarExistenciasAuditoria]
	@existenciasAuditoria [ListaIDsCantidadAlmacen] READONLY,
	@diferenciasAuditoria [ListaIDsCantidadAlmacen] READONLY
AS
BEGIN
	DECLARE @idAuditoriaDetalle AS INT
    DECLARE @cantidad AS DECIMAL(18,4)
	DECLARE @idAlmacen AS INT

    DECLARE cExistencias CURSOR
        FOR SELECT [id], [cantidad], [almacen] FROM @existenciasAuditoria
    OPEN cExistencias
    FETCH NEXT FROM cExistencias INTO @idAuditoriaDetalle, @cantidad, @idAlmacen
    WHILE @@FETCH_STATUS = 0
    BEGIN
        UPDATE [auditoria_detalle]
        SET [ex_auditoria] = @cantidad
        WHERE [id_auditoria_detalle] = @idAuditoriaDetalle AND [id_almacen] = @idAlmacen
        
        FETCH NEXT FROM cExistencias INTO @idAuditoriaDetalle, @cantidad, @idAlmacen
    END
    CLOSE cExistencias
    DEALLOCATE cExistencias

	DECLARE cDiferencias CURSOR
        FOR SELECT [id], [cantidad], [almacen] FROM @diferenciasAuditoria
    OPEN cDiferencias
    FETCH NEXT FROM cDiferencias INTO @idAuditoriaDetalle, @cantidad, @idAlmacen
    WHILE @@FETCH_STATUS = 0
    BEGIN
        UPDATE [auditoria_detalle]
        SET [diferencia] = @cantidad
        WHERE [id_auditoria_detalle] = @idAuditoriaDetalle AND [id_almacen] = @idAlmacen
        
        FETCH NEXT FROM cDiferencias INTO @idAuditoriaDetalle, @cantidad, @idAlmacen
    END
    CLOSE cDiferencias
    DEALLOCATE cDiferencias
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarFechaUltimaCompra]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 12.julio.2018
-- Description:	Actualizar fecha ultima compra
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarFechaUltimaCompra]
	@dtIDsArticulos ListaIDs READONLY
AS
BEGIN
	DECLARE @idArticulo AS INT
	DECLARE cArt CURSOR
		FOR SELECT id FROM @dtIDsArticulos
	OPEN cArt
	WHILE @@FETCH_STATUS = 0
    BEGIN
		UPDATE articulo SET fecha_ultima_compra = GETDATE()
		WHERE id_articulo = @idArticulo

		FETCH NEXT FROM cArt
		INTO @idArticulo
    END
    CLOSE cArt
    DEALLOCATE cArt
	SELECT CAST(1 AS BIT) AS 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarIngresadoOCD]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 06.julio.2018
-- Description:	Actualizar ingresao e idCompra
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarIngresadoOCD]
	@idMovimiento AS INT,
	@tablaIDs ListaIDs READONLY
AS
BEGIN
	DECLARE @idOrdenCompraDetalle AS INT
    DECLARE @idArt AS INT
    DECLARE cOCD CURSOR
        FOR SELECT [id] FROM @tablaIDs
    OPEN cOCD
    FETCH NEXT FROM cOCD INTO @idOrdenCompraDetalle
    WHILE @@FETCH_STATUS = 0
    BEGIN
        UPDATE [orden_compra_detalle]
        SET [ingresado] = 1,
            [id_compra] = @idMovimiento
        WHERE [id_orden_compra_detalle] = @idOrdenCompraDetalle
        
        --ACTUALIZAR articulo.fecha_ultima_compra
        SELECT @idArt = id_articulo FROM [orden_compra_detalle]
        WHERE [id_orden_compra_detalle] = @idOrdenCompraDetalle
        UPDATE articulo SET fecha_ultima_compra = GETDATE()
        WHERE id_articulo = @idArt
        
        FETCH NEXT FROM cOCD INTO @idOrdenCompraDetalle
    END
    CLOSE cOCD
    DEALLOCATE cOCD
    SELECT CAST(1 AS BIT) AS 'ok'
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarLineaDeNegocio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarLineaDeNegocio]
	@activo as tinyint,
	@id as int,
	@clave as nvarchar(10),
	@descripcion as nvarchar(50)
AS
BEGIN

	UPDATE linea_negocio SET	activo = @activo,
								clave = @clave,
								descripcion =  @descripcion
	WHERE id_linea_negocio = @id

	SELECT * FROM linea_negocio WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarModuloNivelSeguridad]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 27.julio.2019
-- Description:	SP actualizar nivel de seguridad de un m�dulo
-- =============================================

-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-09-21
-- Description:	Se agrega sucursal
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarModuloNivelSeguridad]
	@idMod AS INT,
	@idNivSeg AS INT,
	@idSucursal AS INT
AS
BEGIN
	UPDATE [dbo].[modulo_nivel_seguridad]
	   SET [id_nivel_seguridad] = @idNivSeg
	 WHERE [id_modulo] = @idMod AND [id_sucursal] = @idSucursal
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarOferta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 07/06/2018
-- Description:	Actualizar Oferta
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-29
-- Description:	Guarda precio con 4 decimales
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-04-02
-- Description:	Guarda precio con 6 decimales
-- =============================================

CREATE PROCEDURE [dbo].[spActualizarOferta]
	@IdArticuloOferta as int,
	@noOrden as int,
	@tipo as int,
	@MargenUtilidad as decimal(18,2),
	@PrecioVenta as decimal(18,6),
	@CantidadMin as decimal(18,4),
	@CantidadMax as decimal(18,4),
	@Utilidad as decimal(18,6),
	@FechaInicio as DateTime,
	@FechaTermino as DateTime
AS
BEGIN
Declare @activo as int
	if (@FechaInicio < GETDATE() and @FechaTermino >GETDATE())
	begin
		 set @activo = 1;
	end
	else 
	begin
		set @activo = 0;  
	end

	Update articulo_oferta
		   set 
		   margen_utilidad = @MargenUtilidad,
		   precio_venta = @PrecioVenta,
		   cantidad_min = @CantidadMin,
		   cantidad_max = @CantidadMax,
		   utilidad= @Utilidad,
		   fecha_inicio = @FechaInicio,
		   fecha_termino = @FechaTermino,
		   fecha_modificacion = GETDATE(),
		   activo = @activo,
		   id_oferta_tipo= @tipo
     where id_articulo_oferta = @IdArticuloOferta
		   and id_oferta_tipo = @tipo
		   and no_orden = @noOrden

	SELECT id_articulo_oferta FROM articulo_oferta WHERE id_articulo_oferta = @IdArticuloOferta 

END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarPrioridadOferta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-06-14
-- Description:	Actualizar Prioridad Oferta
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarPrioridadOferta]
	@IdArticuloOferta AS INT,
	@prioridad AS INT
AS
BEGIN
Declare @activo as int

	Update articulo_oferta
		   set 
		   no_orden = @prioridad
     where id_articulo_oferta = @IdArticuloOferta

	SELECT id_articulo_oferta FROM articulo_oferta WHERE id_articulo_oferta = @IdArticuloOferta 
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarPromocionAplicadas]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 20.diciembre.2018
-- Description:	Actualizar promociones aplicadas
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarPromocionAplicadas]
	@tablaPV PromocionVenta READONLY
AS
BEGIN
	DECLARE @idPromocionVenta AS INT
	DECLARE @aplicadas AS INT
	DECLARE cPV CURSOR
		FOR SELECT idPromocionVenta, aplicadas FROM @tablaPV
	OPEN cPV
	FETCH NEXT FROM cPV
	INTO @idPromocionVenta, @aplicadas
	WHILE @@FETCH_STATUS = 0
    BEGIN
		UPDATE [dbo].[promocion_venta]
		   SET [aplicadas] = @aplicadas
		 WHERE id_promocion_venta = @idPromocionVenta
		FETCH NEXT FROM cPV
		INTO @idPromocionVenta, @aplicadas
    END
    CLOSE cPV
    DEALLOCATE cPV
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarSucursal]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos negrete
-- Create date:  25-05-18
-- Description:	SP
-- =============================================

-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-07
-- Description:	Se agregó la columna afiliacion_bancomer
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarSucursal]
	@clave as nvarchar(5),
	@idZona as int,
	@nombre as nvarchar(50),
	@nombreBD as nvarchar(50),
	@activo as tinyint,
	@ip as nvarchar(50),
	@usuarioBD as nvarchar(50),
	@contrasena as nvarchar(50),
	@afiliacionBancomer as nvarchar(8)
AS
BEGIN
	UPDATE sucursal SET activo = @activo,
						nombre_bd = @nombreBD,
						id_zona = @idZona,
						direccion_ip = @ip,
						usuario_bd = @usuarioBD,
						contrasena = @contrasena,
						nombre = @nombre,
						afiliacion_bancomer = @afiliacionBancomer
	WHERE clave_sucursal = @clave

	SELECT * FROM sucursal WHERE clave_sucursal = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizarUsrIMEI]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez      
-- Create date: 24/Abril/2020
-- Description:	Actualiza o inserta el imei 
--              del usuario seleccionado
-- =============================================
CREATE PROCEDURE [dbo].[spActualizarUsrIMEI]
	@id_usuario INT,
	@imei VARCHAR(100)
AS
BEGIN
	BEGIN TRANSACTION 
	BEGIN TRY
		DECLARE @num AS INT

		UPDATE usr_imei SET imei=@imei WHERE id_usuario=@id_usuario;
		SELECT @num = @@ROWCOUNT

		IF @num = 0
		BEGIN
			INSERT INTO usr_imei VALUES(@id_usuario,@imei)
		END

		COMMIT TRANSACTION
			SELECT '1' AS 'Resultado';
		END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SELECT '0' AS 'Resultado';
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[spActualizarUsuarioHuella]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Marco Gonzalez
-- Create date:		2018/06/22
-- Description:		Actualiza huella
-- =============================================

CREATE PROCEDURE [dbo].[spActualizarUsuarioHuella]
	@idUsuario	AS	int,
	@idSucursal	AS	int,
	@huella		AS	nvarchar(MAX),
	@idULog		AS	int
AS
BEGIN
	DECLARE @nReg AS int

	SELECT @nReg = COUNT(*) FROM [dbo].[usuario_huella] WHERE [id_usuario] = @idUsuario

	IF @nReg = 0
		INSERT INTO [dbo].[usuario_huella]
				   ([id_usuario]
				   ,[id_sucursal]
				   ,[huella]
				   ,[fecha_alta]
				   ,[id_usuario_alta]
				   ,[activa])
			 VALUES
				   (@idUsuario
				   ,@idSucursal
				   ,@huella
				   ,GETDATE()
				   ,@idULog
				   ,1)
	ELSE
		UPDATE [dbo].[usuario_huella]
		   SET [huella] = @huella
		 WHERE [id_usuario] = @idUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaSubcategoria]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CarlosNegrete
CREATE PROCEDURE [dbo].[spActualizaSubcategoria]
	@activo as tinyint,
	@idCat as int,
	@clave as nvarchar(50),
	@descripcion as nvarchar(50)
AS
BEGIN
	UPDATE subcategoria SET 
							activo = @activo, 
							id_categoria = @idCat ,
							descripcion = @descripcion
	where clave = @clave
	SELECT * FROM subcategoria where clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaUnidadMedida]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 04.junio.2018
-- Description:	Se quito el campo esUnidadCompra
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaUnidadMedida]
	@descripcion as nvarchar(40),
	@pesable as tinyint,
	@claveSAT as nvarchar(10),
	@activo as tinyint
AS
BEGIN
	UPDATE unidad_medida SET descripcion =  @descripcion, pesable = @pesable,
		clave_sat = @claveSAT, activo = @activo
	WHERE descripcion = @descripcion
	
	SELECT * FROM unidad_medida WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaUsuario]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:          Marco Gonzalez
-- Create date:		31 Mayo 2018
-- Description:     Cambios al actualizar por la codificacion de la contrasena
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaUsuario]
	@nombre as nvarchar(50),
	@clave as nvarchar(50),
	@contrasena as nvarchar(50),
	@idPerfil as int,
	@idSucursal as int,
	@idCajaActual as int = null,
	@activo as tinyint,
	@llave as nvarchar(50)
AS
BEGIN
	UPDATE usuario SET	nombre = @nombre,
						contrasena = ENCRYPTBYPASSPHRASE(@llave,@contrasena),
						id_perfil = @idPerfil,
						id_sucursal = @idSucursal,
						id_caja_actual = @idCajaActual,
						activo = @activo
	WHERE clave = @clave

	SELECT * FROM usuario WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spActualizaVariableConfiguracion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 30.Agosto.2018
-- Description:	Guarda caja y consulta el ID
-- =============================================
CREATE PROCEDURE [dbo].[spActualizaVariableConfiguracion]
	@idVariableConfiguracion as int,
	@valor as nvarchar(30)
AS
BEGIN
	UPDATE variable_config SET valor = @valor where id_variable = @idVariableConfiguracion
	SELECT id_variable from variable_config
END
GO
/****** Object:  StoredProcedure [dbo].[spAplicaValeDevolucion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-08-24
-- Description:	Aplicar Vale de Devolucion
-- =============================================
CREATE PROCEDURE [dbo].[spAplicaValeDevolucion]
           @folio as nvarchar(12)
           ,@monto as decimal(18,4)
AS
BEGIN
	Declare @id decimal;
	set @id = 0
	select @id = id_vale_devolucion from vale_devolucion where folio = @folio and monto >= @monto and aplicado = 0;

	if @id != 0
		update vale_devolucion set aplicado = 1 where folio = @folio;
		
	SELECT Cast(@id as int) AS 'id_vale_devolucion'

END
GO
/****** Object:  StoredProcedure [dbo].[spAplicaValeDevolucionTransaccion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 22.noviembre.2018
-- Description:	Aplicar Vale de Devolucion Transacción
-- =============================================
CREATE PROCEDURE [dbo].[spAplicaValeDevolucionTransaccion]
	@folio AS nvarchar(12),
	@importe AS decimal(18,4)
AS
BEGIN
	DECLARE @id decimal
	SET @id = 0
	SELECT @id = id_vale_devolucion_transaccion FROM vale_devolucion_transaccion
		WHERE folio = @folio AND importe >= @importe AND aplicado = 0

	IF @id != 0
		UPDATE vale_devolucion_transaccion
			SET aplicado = 1 WHERE folio = @folio
		
	SELECT Cast(@id AS int) AS 'id_vale_devolucion_transaccion'

END
GO
/****** Object:  StoredProcedure [dbo].[spAuditoriaFamilia]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Israel Flores C.
-- Create date: diciembre.2019
-- Description:	Solo para consultar de la familia con dicha clave ya está siendo auditada.
-- =============================================
CREATE PROCEDURE [dbo].[spAuditoriaFamilia]
	@idAlmacen as int,
	@claveFamilia as nvarchar(50)
AS

BEGIN
	
	SELECT TOP 1 * FROM auditoria a
	INNER JOIN auditoria_detalle ad ON ad.id_auditoria = a.id_auditoria
	INNER JOIN articulo ar ON ar.id_articulo = ad.id_articulo
	INNER JOIN familia f ON f.id_familia = ar.id_familia
	WHERE f.clave = @claveFamilia AND ad.id_almacen = @idAlmacen and a.id_auditoria_estatus in (1,2)
 
END

GO
/****** Object:  StoredProcedure [dbo].[spBuscarElementosExistenteAlmacen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 15 de Junio de 2018
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[spBuscarElementosExistenteAlmacen]
	@idArticulo as int,
    @idAlmacen as int
AS
BEGIN

	SELECT COUNT(id_articulo_existencia) as _count FROM articulo_existencia WHERE id_articulo = @idArticulo and id_almacen = @idAlmacen
END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarElementosExistenteAlmacenPorSucursal]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 6 de Julio de 2018
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[spBuscarElementosExistenteAlmacenPorSucursal]
	@clave as nvarchar(50),
    @sucursal as int
AS
BEGIN
DECLARE @ID AS int;

	SELECT @ID= id_articulo 
	FROM articulo 
	WHERE clave= @clave

	SELECT
		ISNULL(sum(ISNULL(cast(existencia_actual as int),0)),0) as _count
	FROM articulo_existencia art
	Left Join almacen a ON a.id_almacen=art.id_almacen
	Left Join sucursal s ON s.id_sucursal= a.id_sucursal 
	WHERE	id_articulo = @ID and
			s.id_sucursal= @sucursal


END
GO
/****** Object:  StoredProcedure [dbo].[spCajaHabilitada]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 06.septiembre.2018
-- Description:	Chequear si la caja est� habilitada
-- =============================================
CREATE PROCEDURE [dbo].[spCajaHabilitada]
	@idCaja AS int
AS
BEGIN
	SELECT CAST(habilitada AS bit) AS habilitada FROM caja
	WHERE id_caja = @idCaja
END
GO
/****** Object:  StoredProcedure [dbo].[spCambioFKArticulosArticuloAdicionales]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 30.mayo.2018
-- Description:	Cambiar FOREIGN KEY articulos_articulo_adicionales
-- =============================================
CREATE PROCEDURE [dbo].[spCambioFKArticulosArticuloAdicionales]
AS
BEGIN
	ALTER TABLE articulo
	DROP CONSTRAINT FK_articulo_articulo_adicionales
	
	ALTER TABLE articulo
	ADD CONSTRAINT FK_articulo_articulo_adicionales
	FOREIGN KEY (id_articulo_adicionales)
	REFERENCES articulo_adicionales(id_articulo_adicionales)
END
GO
/****** Object:  StoredProcedure [dbo].[spCerrarSesion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCerrarSesion]
	@idCaja	as int
AS
BEGIN
	UPDATE
		caja 
	SET 
		sesion_abierta = 0
	WHERE 
		id_caja = @idCaja

	select @idCaja as idCaja
END
GO
/****** Object:  StoredProcedure [dbo].[spCierreArticuloOferta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Carolina franco
-- Create date: 2019-06-17
-- Description:	Eliminar registros de articulo oferta
-- =============================================
--=============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-19
-- Description:	Eliminar registros de articulo oferta
-- =============================================
CREATE PROCEDURE [dbo].[spCierreArticuloOferta]
	@ofertasConf AS INT -- 1=Sin vigencia, 2=Todas, 3=Ninguna
AS
BEGIN

	IF @ofertasConf != 3
	BEGIN
		DELETE FROM 
			articulo_oferta 
		WHERE 
			(@ofertasConf = 1 AND fecha_termino < GETDATE()) OR 
			(@ofertasConf = 2 AND id_articulo_oferta IS NOT NULL)
		IF @ofertasConf = 2
		BEGIN
			DBCC CHECKIDENT (articulo_oferta, RESEED,0)
		END
	END

	SELECT 'OK' AS resp
END
GO
/****** Object:  StoredProcedure [dbo].[spCierreArticulosInactivos]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Carolina franco
-- Create date: 2019-06-21
-- Description:	Eliminar registros de articulo oferta
-- =============================================

CREATE PROCEDURE [dbo].[spCierreArticulosInactivos]
	@artConfig AS INT --1=Inactivos, 2=Ninguno
AS
BEGIN
	/* Articulo Inactivos */
	IF @artConfig = 1
	BEGIN
		DELETE articulo_sucursal_mayoreo WHERE id_articulo in (SELECT id_articulo FROM articulo WHERE activo = 0)
		DELETE articulo_proveedor WHERE id_articulo in (SELECT id_articulo FROM articulo WHERE activo = 0)
		DELETE articulo_precio WHERE id_articulo in (SELECT id_articulo FROM articulo WHERE activo = 0)
		DELETE articulo_oferta WHERE id_articulo in (SELECT id_articulo FROM articulo WHERE activo = 0)
		DELETE articulo_existencia WHERE id_articulo in (SELECT id_articulo FROM articulo WHERE activo = 0)
		DELETE articulo_equivalente WHERE id_articulo in (SELECT id_articulo FROM articulo WHERE activo = 0)
		UPDATE articulo SET id_articulo_adicionales = 1 WHERE activo = 0
		DELETE FROM articulo_adicionales WHERE id_articulo_adicionales in 
		(
			select	
				aa.id_articulo_adicionales
			from
				articulo as a right join articulo_adicionales as aa on a.id_articulo_adicionales = aa.id_articulo_adicionales
			where
				a.id_articulo IS NULL
		)
		DELETE FROM articulo WHERE activo = 0
	END 

	SELECT 'OK' AS resp
END
GO
/****** Object:  StoredProcedure [dbo].[spCierreBitacoras]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Carolina franco
-- Create date: 2019-06-19
-- Description:	Eliminar registros de articulo oferta
-- =============================================

CREATE PROCEDURE [dbo].[spCierreBitacoras]
	@bitImpre AS INT, --0=No borrar, 1=Borrar
	@bitAuto AS INT --0=No borrar, 1=Borrar
AS
BEGIN
	IF @bitImpre = 1
	BEGIN
		DELETE FROM bitacora_impresion 
		DBCC CHECKIDENT (bitacora_impresion, RESEED,0)
	END

	IF @bitAuto = 1
	BEGIN
		DELETE FROM autorizacion
		DBCC CHECKIDENT (autorizacion, RESEED,0)
	END

	SELECT 'OK' AS resp
END
GO
/****** Object:  StoredProcedure [dbo].[spCierreCotizaciones]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Carolina Franco
-- Create date: 2019-06-20
-- Description:	Eliminar registros de Cotizaciones
-- =============================================
--=============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-19
-- Description:	Eliminar registros de Cotizaciones
-- =============================================
CREATE PROCEDURE [dbo].[spCierreCotizaciones]
	@cotizaConfig AS INT, -- 1=Todas, 2=Ninguna, 3=AntesDe
	@fechaAntes AS DATETIME
AS
BEGIN

	IF @cotizaConfig != 2
	BEGIN
		DELETE FROM cotizacion_detalle 
		WHERE
			id_cotizacion in 
			(
			SELECT 
				id_cotizacion 
			FROM 
				cotizacion
			WHERE
				(@cotizaConfig = 1 AND id_cotizacion IS NOT NULL) OR
				(@cotizaConfig = 3 AND fecha_registro < @fechaAntes)
			)

		DELETE FROM cotizacion
		WHERE
			id_cotizacion in
			(
				SELECT 
					id_cotizacion 
				FROM 
					cotizacion
				WHERE
					(@cotizaConfig = 1 AND id_cotizacion IS NOT NULL) OR
					(@cotizaConfig = 3 AND fecha_registro < @fechaAntes)
			)

		UPDATE cotizacion SET id_venta = NULL, cotizacion_apartada = 0

		IF @cotizaConfig = 1
		BEGIN
			DBCC CHECKIDENT (cotizacion_detalle, RESEED,0)
			DBCC CHECKIDENT (cotizacion, RESEED,0)
		END
	END

	SELECT 'OK' AS resp
END
GO
/****** Object:  StoredProcedure [dbo].[spCierreMovimientos]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Carolina Franco
-- Create date: 2019-06-20
-- Description:	Eliminar registros de Movimientos
-- =============================================
--=============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-19
-- Description:	Eliminar registros de Movimientos
-- =============================================
CREATE PROCEDURE [dbo].[spCierreMovimientos]
AS
BEGIN
	
	DELETE FROM movimiento_caja_desglose
	DBCC CHECKIDENT (movimiento_caja_desglose, RESEED,0)
	DELETE FROM movimiento_caja
	DBCC CHECKIDENT (movimiento_caja, RESEED,0)

	DELETE FROM movimiento_almacen_detalle
	DBCC CHECKIDENT (movimiento_almacen_detalle, RESEED,0)
	DELETE FROM movimiento_almacen
	DBCC CHECKIDENT (movimiento_almacen, RESEED,0)

	/*REGRESANDO EXISTENCIAS*/
	UPDATE articulo_existencia SET existencia_inicial = existencia_actual, total_entradas = 0, total_salidas = 0

	UPDATE articulo SET costo_acumulado = costo_ultimo, total_salidas = 0, total_entradas = 1
	
	SELECT 'OK' as resp
END
GO
/****** Object:  StoredProcedure [dbo].[spCierreOrdenesCompra]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Carolina Franco 
-- Create date: 2019-06-20
-- Description:	Eliminar registros de Orden de Compra
-- =============================================
--=============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-19
-- Description:	Eliminar registros de Orden de Compra
-- =============================================
CREATE PROCEDURE [dbo].[spCierreOrdenesCompra]
	 @ordComConfig AS INT -- 1=Todas, 2=Ingresadas
AS
BEGIN

	DELETE FROM orden_compra_detalle
	WHERE id_orden_compra in 
	(
		SELECT
			id_orden_compra
		FROM 
			orden_compra 
		WHERE 
			(@ordComConfig = 1 AND id_orden_compra IS NOT NULL) OR
			(@ordComConfig = 2 AND id_compra IS NOT NULL)
	)

	DELETE FROM orden_compra
	WHERE 
		(@ordComConfig = 1 AND id_orden_compra IS NOT NULL) OR
		(@ordComConfig = 2 AND id_compra IS NOT NULL)

	IF @ordComConfig = 1
	BEGIN
		DBCC CHECKIDENT (orden_compra_detalle, RESEED,0)
		DBCC CHECKIDENT (orden_compra, RESEED,0)
	END
	
	SELECT 'OK' AS resp

END
GO
/****** Object:  StoredProcedure [dbo].[spCierrePremovimientos]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Carolina Franco
-- Create date: 2019-06-20
-- Description:	Eliminar registros 
--				premovimientos caja y almacén
-- =============================================

CREATE PROCEDURE [dbo].[spCierrePremovimientos]

AS
BEGIN

	DELETE FROM REGFACTCOMPRAS
	DBCC CHECKIDENT (REGFACTCOMPRAS,  RESEED, 0);

	DELETE FROM venta_cancelacion
	DBCC CHECKIDENT (venta_cancelacion, RESEED,0)

	DELETE FROM arqueo_desglose
	DBCC CHECKIDENT (arqueo_desglose, RESEED,0)
	DELETE FROM arqueo
	DBCC CHECKIDENT (arqueo, RESEED,0)

	DELETE FROM auditoria_detalle
	DBCC CHECKIDENT (auditoria_detalle, RESEED,0)
	DELETE FROM auditoria
	DBCC CHECKIDENT (auditoria, RESEED,0)

	DELETE FROM	tira_banco
	DBCC CHECKIDENT (tira_banco, RESEED,0)

	DELETE FROM cierre
	DBCC CHECKIDENT (cierre, RESEED,0)

	UPDATE movimiento_almacen SET id_consolidacion = NULL
	DELETE FROM consolidacion
	DBCC CHECKIDENT (consolidacion, RESEED,0)

	UPDATE movimiento_almacen SET id_facturacion = NULL
	DELETE FROM facturacion
	DBCC CHECKIDENT (facturacion, RESEED,0)

	DELETE FROM transaccion_banco
	DBCC CHECKIDENT (transaccion_banco, RESEED,0)	

	DELETE FROM recarga
	DBCC CHECKIDENT (recarga, RESEED,0)

	DELETE FROM receta_venta
	DBCC CHECKIDENT (receta_venta, RESEED,0)

	DELETE FROM premio
	DBCC CHECKIDENT (premio, RESEED,0)

	DELETE FROM dinamica
	DBCC CHECKIDENT (dinamica, RESEED,0)

	DELETE FROM vale_devolucion
	DBCC CHECKIDENT (vale_devolucion, RESEED,0)
	DELETE FROM vale_devolucion_transaccion
	DBCC CHECKIDENT (vale_devolucion_transaccion, RESEED,0)

	SELECT 'OK' AS resp
END
GO
/****** Object:  StoredProcedure [dbo].[spCierrePretransferencia]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Carolina Franco
-- Create date: 2019-06-20
-- Description:	Eliminar registros de Pretransferencia
-- =============================================

--=============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-19
-- Description:	Eliminar registros de Pretransferencia
-- =============================================
CREATE PROCEDURE [dbo].[spCierrePretransferencia]
	@pretransCong AS INT -- 1=Todas, 2=Ingresadas
AS
BEGIN

	DELETE FROM pretransferencia_detalle
	WHERE id_pretransferencia in 
	(
		SELECT
			id_pretransferencia
		FROM 
			pretransferencia 
		WHERE 
			(@pretransCong = 1 AND id_pretransferencia IS NOT NULL) OR
			(@pretransCong = 2 AND id_promovimiento_almacen_estado = 3)
	)

	DELETE FROM pretransferencia
	WHERE 
		(@pretransCong = 1 AND id_pretransferencia IS NOT NULL) OR
		(@pretransCong = 2 AND id_promovimiento_almacen_estado = 3)

	IF @pretransCong = 1
	BEGIN
		DBCC CHECKIDENT (pretransferencia_detalle, RESEED,0)
		DBCC CHECKIDENT (pretransferencia, RESEED,0)
	END

	SELECT 'OK' AS resp
	
END
GO
/****** Object:  StoredProcedure [dbo].[spCierrePrevalidacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Carolina Franco
-- Create date: 2019-06-20
-- Description:	Valida que se pueda realizar cierre
-- =============================================

CREATE PROCEDURE [dbo].[spCierrePrevalidacion]
AS
BEGIN
	DECLARE @mensaje AS VARCHAR(500)
	DECLARE @habilitadas AS INT
	DECLARE @mov AS INT
	DECLARE @totalMov AS INT

	SET @mensaje = 'OK'
	SELECT @habilitadas = ISNULL(count(*), 0) FROM caja WHERE habilitada = 1

	IF @habilitadas = 0
	BEGIN
		SELECT @mov = ISNULL(count(*), 0)
		FROM movimiento_almacen 
		WHERE id_facturacion IS NULL and id_consolidacion IS NULL and id_movimiento_almacen_tipo = 12

		SELECT @totalMov = count(id_movimiento_almacen) FROM movimiento_almacen WHERE id_movimiento_almacen_tipo = 12

		IF @mov > 0 AND @totalMov != @mov
		BEGIN
			SET @mensaje = 'Hay ' + CAST(@mov as VARCHAR(100)) + ' movimientos sin facturar o consolidar';
		END
	END
	ELSE
	BEGIN
		SET @mensaje = 'Hay '+ CAST(@habilitadas as VARCHAR(100)) + ' habilitadas. Favor de realizar su(s) corte(s)';
	END

	SELECT @mensaje AS resp	
END
GO
/****** Object:  StoredProcedure [dbo].[spCierrePromociones]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Carolina Franco
-- Create date: 2019-06-17
-- Description:	Eliminar registros de promociones
-- =============================================
--=============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-19
-- Description:	Eliminar registros de promociones
-- =============================================
CREATE PROCEDURE [dbo].[spCierrePromociones]
	@promosConfig AS INT --1=Sin vigencias, 2=Todas, 3=Ninguna
AS
BEGIN
	/* Se modifican los límites de las promociones ya otorgadas */
	DECLARE @idPromo AS INT;
	DECLARE @limite AS INT;
	DECLARE @aplicadas AS INT;

	DECLARE cursor_promos CURSOR FOR
	SELECT id_promocion, limite_sucursal FROM promocion

	OPEN cursor_promos 
	FETCH NEXT FROM cursor_promos INTO @idPromo, @limite

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @aplicadas = 0
		-- Se obtiene cuántas promociones ya se dieron
		SELECT @aplicadas = ISNULL(sum(aplicadas), 0) FROM promocion_venta WHERE id_promocion = @idPromo
		-- Se acutaliza el límite para restar al límite las promociones que ya se dieron
		IF @limite > 0
		BEGIN
			-- Se revisa que las promociones aplicadas no sea mayor o igual al limite, por lo que todavía quedan promociones que dar
			IF @aplicadas < @limite
			BEGIN
				UPDATE promocion SET limite_sucursal = (@limite - @aplicadas) WHERE id_promocion = @idPromo
			END
			ELSE 
			BEGIN
				-- Se desactiva, por que ya se dieron todas las que se podían dar o por que se dieron más del límite
				UPDATE promocion SET activo = 0 where id_promocion = @idPromo
			END			
		END
		FETCH NEXT FROM cursor_promos INTO @idPromo, @limite
	END

	CLOSE cursor_promos
	DEALLOCATE cursor_promos 

	--Borrando las promociones otorgadas
	DELETE FROM promocion_venta
	DBCC CHECKIDENT (promocion_venta, RESEED,0)

	
	-- Borrando las promociones que correspondan
	-- @promosConfig: 1=Sin vigencias, 2=Todas, 3=Ninguna
	IF @promosConfig != 3
	BEGIN
		-- Borrando Imagen
		DELETE FROM
			promocion_imagen
		WHERE
			id_promocion in 
			(
				SELECT 
					id_promocion 
				FROM 
					promocion 
				WHERE 
					(@promosConfig = 1 AND vigencia_fin < GETDATE()) OR
					(@promosConfig = 2 AND id_promocion IS NOT NULL)
			)
		-- Borrando Compra
		DELETE FROM	
			promocion_compra
		WHERE
			id_promocion in 
			(
				SELECT 
					id_promocion 
				FROM 
					promocion 
				WHERE 
					(@promosConfig = 1 AND vigencia_fin < GETDATE()) OR
					(@promosConfig = 2 AND id_promocion IS NOT NULL)
			)
		-- Borrando Regalo
		DELETE FROM	
			promocion_regalo
		WHERE
			id_promocion in 
			(
				SELECT 
					id_promocion 
				FROM 
					promocion 
				WHERE 
					(@promosConfig = 1 AND vigencia_fin < GETDATE()) OR
					(@promosConfig = 2 AND id_promocion IS NOT NULL)
			)
		-- Borrando Promocion	
		DELETE FROM	
			 promocion 
		WHERE 
			(@promosConfig = 1 AND vigencia_fin < GETDATE()) OR
			(@promosConfig = 2 AND id_promocion IS NOT NULL)
	
		IF @promosConfig = 2
		BEGIN
			DBCC CHECKIDENT (promocion_imagen, RESEED,0)
			DBCC CHECKIDENT (promocion_compra, RESEED,0)
			DBCC CHECKIDENT (promocion_regalo, RESEED,0)
			DBCC CHECKIDENT (promocion, RESEED,0)
		END
	END

	SELECT 'OK' AS resp
END
GO
/****** Object:  StoredProcedure [dbo].[spClaveDeAuditoria]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Israel Flores C.
-- Create date: 17.mayo.2018
-- Description:	Guarda la clave de sincronizacion despues de ser almacenada en la nube
-- =============================================
CREATE PROCEDURE [dbo].[spClaveDeAuditoria]
	@idAuditoria as int,
	@claveSincronizacion as nvarchar(50)
AS

BEGIN
	
	UPDATE auditoria SET clave_sincronizacion = @claveSincronizacion WHERE id_auditoria = @idAuditoria

END

GO
/****** Object:  StoredProcedure [dbo].[spComboAgrupador]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboAgrupador]
AS
BEGIN
DECLARE @agrupador TABLE  
    ( idAgrup  INT,  
      nombre   NVARCHAR(50));
	    
INSERT INTO @agrupador (idAgrup, nombre) VALUES(0,'TODOS')
INSERT INTO @agrupador (idAgrup,nombre) SELECT id_agrupador_articulo, descripcion from agrupador_articulo
select idAgrup, nombre from @agrupador
END
GO
/****** Object:  StoredProcedure [dbo].[spComboAlmacen1]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboAlmacen1]
	@sucursal as int
AS
BEGIN
DECLARE @Almacen TABLE  
    ( idAlmacen  INT,  
      nombre   NVARCHAR(50));
	    
INSERT INTO @Almacen (idAlmacen, nombre) VALUES(0,'TODAS')
	IF(@sucursal!=0)
	BEGIN
		INSERT INTO @Almacen (idAlmacen,nombre) 
		SELECT id_almacen, nombre  from almacen where id_sucursal= @sucursal
	END 
	ELSE 
	BEGIN
		INSERT INTO @Almacen (idAlmacen,nombre) 
		SELECT id_almacen, nombre   from almacen 
	END
select idAlmacen, nombre from @Almacen
END
GO
/****** Object:  StoredProcedure [dbo].[spComboAplicaPromocion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboAplicaPromocion]
AS
BEGIN
DECLARE @AplicProm TABLE  
    ( idPromAplica   INT,  
      nombre   NVARCHAR(50));
	    
INSERT INTO @AplicProm (idPromAplica, nombre) VALUES(0,'TODOS')
INSERT INTO @AplicProm (idPromAplica,nombre) SELECT id_promocion_aplicacion, descripcion from promocion_aplicacion
select idPromAplica, nombre from @AplicProm
END
GO
/****** Object:  StoredProcedure [dbo].[spComboArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboArticulo]
AS
BEGIN
DECLARE @Articulo TABLE  
    ( id_articulo   INT,  
      nombre   NVARCHAR(50));
INSERT INTO @Articulo (id_articulo,nombre) SELECT id_articulo, clave  from articulo
select id_articulo, nombre from @Articulo
END
GO
/****** Object:  StoredProcedure [dbo].[spComboCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboCaja]
	@sucursal as int
AS
BEGIN
DECLARE @Caja TABLE  
    ( idCaja  INT,  
      nombre   NVARCHAR(50));
	    
INSERT INTO @Caja (idCaja, nombre) VALUES(0,'TODAS')
	IF(@sucursal!=0)
	BEGIN
		INSERT INTO @Caja (idCaja,nombre) 
		SELECT id_caja, no_caja  from caja where id_sucursal= @sucursal
	END 
	ELSE 
	BEGIN
		INSERT INTO @Caja (idCaja,nombre) 
		SELECT id_caja, no_caja  from caja 
	END
select idCaja, nombre from @Caja
END
GO
/****** Object:  StoredProcedure [dbo].[spComboEstatusRecarga]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboEstatusRecarga]
AS
BEGIN
DECLARE @estatusR TABLE  
    ( idEstatus  INT,  
      descripcion   NVARCHAR(50));
	    
INSERT INTO @estatusR (idEstatus, descripcion) VALUES(0,'TODOS')
	
		INSERT INTO @estatusR (idEstatus,descripcion) 
		SELECT id_recarga_estatus, descripcion  from recarga_estatus 

select idEstatus, descripcion from @estatusR
END
GO
/****** Object:  StoredProcedure [dbo].[spComboFamilias]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboFamilias]
AS
BEGIN
DECLARE @Familias TABLE  
    ( idFam   INT,  
      nombre   NVARCHAR(50));
	    
INSERT INTO @Familias (idFam, nombre) VALUES(0,'TODOS')
INSERT INTO @Familias (idFam,nombre) SELECT id_familia, descripcion from familia
select idFam, nombre from @Familias
END
GO
/****** Object:  StoredProcedure [dbo].[spComboFamilias1]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboFamilias1]
AS
BEGIN
DECLARE @Familias TABLE  
    ( idFam   INT,  
      nombre   NVARCHAR(50));
	    
INSERT INTO @Familias (idFam, nombre) VALUES(0,'TODOS')
INSERT INTO @Familias (idFam,nombre) SELECT id_familia, descripcion from familia
select idFam, nombre from @Familias
END
GO
/****** Object:  StoredProcedure [dbo].[spComboFormaPago]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 14.02.2020
-- Description:	Se ordenan los resultados
-- =============================================
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboFormaPago]
AS
BEGIN
DECLARE @FPago TABLE  
    ( idPago   INT,  
      nombre   NVARCHAR(50));
	    
INSERT INTO @FPago (idPago, nombre) VALUES(0,'TODOS')
INSERT INTO @FPago (idPago,nombre) SELECT id_forma_pago, descripcion from forma_pago
SELECT idPago,nombre FROM @FPago ORDER BY nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spComboLinea]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 20.10.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboLinea]
AS
BEGIN
DECLARE @Linea TABLE  
    ( idLinea  INT,  
      nombre   NVARCHAR(50));
	    
INSERT INTO @Linea (idLinea, nombre) VALUES(0,'TODOS')
INSERT INTO @Linea (idLinea,nombre) SELECT id_linea_negocio, descripcion from linea_negocio
select idLinea, nombre from @Linea
END
GO
/****** Object:  StoredProcedure [dbo].[spComboMCTipo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboMCTipo]
AS
BEGIN
DECLARE @MovimientoAlmacenTipo TABLE  
    ( idTipo   INT,  
      nombre   NVARCHAR(50));
	    
INSERT INTO @MovimientoAlmacenTipo (idTipo, nombre) VALUES(0,'TODOS')
INSERT INTO @MovimientoAlmacenTipo (idTipo,nombre) SELECT id_movimiento_almacen_tipo, nombre  from movimiento_almacen_tipo
select idTipo, nombre from @MovimientoAlmacenTipo
END
GO
/****** Object:  StoredProcedure [dbo].[spComboMovCajaConcepto]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboMovCajaConcepto]
	@tipo as int
AS
BEGIN
	DECLARE @MovCajaConcepto TABLE  
		( idMov  INT,  
		  descripcion   NVARCHAR(50));
	    
	INSERT INTO @MovCajaConcepto (idMov, descripcion) VALUES(0,'TODOS')
	INSERT INTO @MovCajaConcepto (idMov,descripcion) SELECT id_movimiento_caja_concepto, nombre from movimiento_caja_concepto where id_movimiento_caja_tipo =  @tipo
	select idMov, descripcion from @MovCajaConcepto
END
GO
/****** Object:  StoredProcedure [dbo].[spComboMovCajaTipo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboMovCajaTipo]
AS
BEGIN
	DECLARE @MovCajaTipo TABLE  
		( idMov  INT,  
		  descripcion   NVARCHAR(50));
	    
	INSERT INTO @MovCajaTipo (idMov, descripcion) VALUES(0,'TODOS')
	INSERT INTO @MovCajaTipo (idMov,descripcion) SELECT id_movimiento_caja_tipo, nombre from movimiento_caja_tipo
	select idMov, descripcion from @MovCajaTipo
END
GO
/****** Object:  StoredProcedure [dbo].[spComboProveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboProveedor]
AS
BEGIN
DECLARE @Prove TABLE  
    ( idProve   INT,  
      nombre   NVARCHAR(100));
	    
INSERT INTO @Prove (idProve, nombre) VALUES(0,'TODOS')
INSERT INTO @Prove (idProve,nombre) SELECT id_proveedor, clave + ' - ' + nombre  from proveedor order by clave
select idProve, nombre from @Prove
END
GO
/****** Object:  StoredProcedure [dbo].[spComboTipoPromocion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spComboTipoPromocion]
AS
BEGIN
DECLARE @tipoProm TABLE  
    ( idPromTipo   INT,  
      nombre   NVARCHAR(50));
	    
INSERT INTO @tipoProm (idPromTipo, nombre) VALUES(0,'TODOS')
INSERT INTO @tipoProm (idPromTipo,nombre) SELECT id_promocion_tipo, descripcion from promocion_tipo
select idPromTipo, nombre from @tipoProm
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaAjustesConLimite]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-05
-- Description:	Consultar los movimientos de caja de retiro 
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaAjustesConLimite]
	@id_sucursal  as int,
	@id_movimiento_caja_tipo as int,
	@limite as int
AS
BEGIN
	SELECT TOP (@limite)
		mc.id_movimiento_caja,
		c.no_caja,
		mc.folio,
		mc.fecha_registro,
		mc.importe_total 
	 FROM movimiento_caja mc INNER JOIN caja c ON mc.id_caja = c.id_Caja
		WHERE mc.id_movimiento_caja_tipo = @id_movimiento_caja_tipo
		AND mc.id_sucursal = @id_sucursal AND mc.id_movimiento_caja_concepto not in(7,10) ORDER BY mc.fecha_registro DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaAlmacenPorCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 02-Agosto-2018
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaAlmacenPorCaja]
	@caja as int
AS
BEGIN
Declare @almacen as int;
	SELECT @almacen = id_almacen FROM caja WHERE id_caja = @caja
	SELECT * FROM almacen WHERE id_almacen = @almacen 
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaAlmacenPorClave]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaAlmacenPorClave]
	@clave as nvarchar(50),
	@sucursal as int
AS
BEGIN
	SELECT * FROM almacen WHERE clave =  @clave and id_sucursal = @sucursal
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaAlmacenPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaAlmacenPorId]
	@id as int
AS
BEGIN
	SELECT * FROM almacen WHERE id_almacen = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaAlmacenPorNombre]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaAlmacenPorNombre]
	@nombre as nvarchar(50),
	@sucursal as int
AS
BEGIN
	SELECT * FROM almacen WHERE nombre =  @nombre  and id_sucursal = @sucursal
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaAlmacenPorSucursal]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaAlmacenPorSucursal]
	@idSuc as int
AS
BEGIN
	SELECT * FROM almacen WHERE id_sucursal = @idSuc and activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArtCodEqPorCodBarras]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 25.mayo.2018
-- Description:	Consulta articulo equivalente por codigo barras
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArtCodEqPorCodBarras]
	@codigoBarras as nvarchar(36)
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY id_articulo_equivalente DESC) AS numero, * FROM articulo_equivalente WHERE codigo_barras = @codigoBarras
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArtCodEqPorCodEq]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 30.mayo.2018
-- Description:	Consulta articulo equivalente por codigo equivalente
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArtCodEqPorCodEq]
	@codigoBarras as nvarchar(36)
AS
BEGIN
	SELECT * FROM articulo_equivalente WHERE codigo_barras = @codigoBarras
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArtCodEqPorIdArt]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-06-16
-- Description:	Se obtiene el a unidad de compra con texto Sí y No
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArtCodEqPorIdArt]
	@idArticulo as int
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY id_articulo_equivalente ASC) AS No,
			id_articulo_equivalente,
			id_articulo,
			codigo_barras AS 'Código Barras',
			cantidad_venta,
			fecha_alta,
			activo
	FROM articulo_equivalente WHERE id_articulo = @idArticulo
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArtCodEqPorIdArtEq]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 25.mayo.2018
-- Description:	Consulta articulo equivalente por ID
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArtCodEqPorIdArtEq]
	@idArtEq as int
AS
BEGIN
	SELECT ROW_NUMBER() OVER(ORDER BY id_articulo_equivalente DESC) AS numero, * FROM articulo_equivalente WHERE id_articulo_equivalente = @idArtEq
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloAdicionalesDefault]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola Martin
-- Create date: 05 junio 2018
-- Description:	Devuelve el registro por default de articulos adicionales
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-09-08
-- Description:	Cambios por agregar columna es_recarga
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloAdicionalesDefault]
	@idArticuloAdicionales as int
AS
BEGIN
	SELECT TOP 1 
		aa.id_articulo_adicionales,
		aa.vende_sin_existencia,
		aa.cm_super_ancho,
		aa.cm_super_alto,
		aa.cm_super_largo,
		aa.cm_super_peso,
		aa.cm_mayoreo_ancho,
		aa.cm_mayoreo_alto,
		aa.cm_mayoreo_largo,
		aa.cm_mayoreo_peso,
		aa.pide_receta,
		aa.sobre_pedido,
		aa.descontinuado,
		ISNULL(aa.margen_precio_sugerido, 0) AS margen_precio_sugerido,
		ISNULL(utilidad_minima, 0) AS utilidad_minima,
		ISNULL(es_recarga, 0) AS es_recarga
	FROM 
		articulo_adicionales aa
	WHERE 
		id_articulo_adicionales = @idArticuloAdicionales
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloAdicionalesPorIdArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola Martin
-- Create date: 05 junio 2018
-- Description:	Consulta Articulos Adicionales por id de articulo
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-09-08
-- Description:	Cambios por agregar columna es_recarga
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloAdicionalesPorIdArticulo]
	@id as int
AS
BEGIN
	SELECT
		aa.id_articulo_adicionales,
		aa.vende_sin_existencia,
		aa.cm_super_ancho,
		aa.cm_super_alto,
		aa.cm_super_largo,
		aa.cm_super_peso,
		aa.cm_mayoreo_ancho,
		aa.cm_mayoreo_alto,
		aa.cm_mayoreo_largo,
		aa.cm_mayoreo_peso,
		aa.pide_receta,
		aa.sobre_pedido,
		aa.descontinuado,
		ISNULL(aa.margen_precio_sugerido, 0) AS margen_precio_sugerido,
		ISNULL(utilidad_minima, 0) AS utilidad_minima,
		ISNULL(es_recarga, 0) AS es_recarga
	FROM 
		articulo_adicionales aa 
		inner join articulo a on a.id_articulo_adicionales = aa.id_articulo_adicionales 
	WHERE 
		a.id_articulo = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloAuditoria]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces - Alter Israel Flores C.
-- Create date: 17.mayo.2018
-- Description:	Consulta caja por ID
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloAuditoria]
	@idTipo as int,
	@clave as nvarchar(50),
	@almacen as int
AS

BEGIN
	IF(@idTipo=1)--SOLO HAY TIPO UNO 'POR FAMILIA
	BEGIN 
		IF EXISTS(select 
			distinct(a.id_articulo),
			ISNULL(a.clave,'--') as clave,
			ISNULL(a.id_articulo,'--') as idProducto,
			ISNULL(a.desc_super,'--') as descripcion,
			ISNULL(f.clave,'--') as familia,
			ISNULL(l.clave,'--') as linea,
			ISNULL(ag.clave,'--') as subfamilia,
			ISNULL(ad.vende_sin_existencia,0) as vendesn
		from articulo a
		LEFT JOIN familia f ON a.id_familia = f.id_familia
		LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
		LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
		LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
		LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
		LEFT JOIN articulo_adicionales ad On ad.id_articulo_adicionales = a.id_articulo_adicionales
		WHERE f.clave = @clave and (au.id_auditoria_estatus = 2 or au.id_auditoria_estatus = 1) and au.id_almacen = @almacen)
		BEGIN
			select 
			distinct(a.id_articulo),
			ISNULL(au.nombre,'--') as clave,
			0 as idProducto,
			'--' as descripcion,
			'--' as familia,
			'--' as linea,
			'--' as subfamilia,
			CAST (0 as tinyint) as vendesn
			from articulo a
			LEFT JOIN familia f ON a.id_familia = f.id_familia
			LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
			LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
			LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
			LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
			WHERE  f.clave = @clave and (au.id_auditoria_estatus = 2 or au.id_auditoria_estatus = 1) and au.id_almacen = @almacen
		END
		ELSE 
		BEGIN
			select 
			distinct(a.id_articulo),
			ISNULL(a.clave,'--') as clave,
			ISNULL(a.id_articulo,'--') as idProducto,
			ISNULL(a.desc_super,'--') as descripcion,
			ISNULL(f.clave,'--') as familia,
			ISNULL(l.clave,'--') as linea,
			ISNULL(ag.clave,'--') as subfamilia,
			ISNULL(ad.vende_sin_existencia,0) as vendesn
			from articulo a
			LEFT JOIN familia f ON a.id_familia = f.id_familia
			LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
			LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
			LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
			LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
			LEFT JOIN articulo_adicionales ad On ad.id_articulo_adicionales = a.id_articulo_adicionales
			WHERE f.clave = @clave  and (au.id_almacen is null or (au.id_almacen != @almacen or (au.id_auditoria_estatus = 3 or au.id_auditoria is null)))
		END
	END
	ELSE IF (@idTipo=2)
	BEGIN 
		IF EXISTS(select 
			ISNULL(a.clave,'--') as clave,
			ISNULL(a.id_articulo,'--') as idProducto,
			ISNULL(a.desc_super,'--') as descripcion,
			ISNULL(f.clave,'--') as familia,
			ISNULL(l.clave,'--') as linea,
			ISNULL(ag.clave,'--') as subfamilia,
			ISNULL(ad.vende_sin_existencia,0) as vendesn
		from articulo a
		LEFT JOIN familia f ON a.id_familia = f.id_familia
		LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
		LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
		LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
		LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
		LEFT JOIN articulo_adicionales ad On ad.id_articulo_adicionales = a.id_articulo_adicionales
		WHERE ag.clave = @clave and (au.id_auditoria_estatus = 2 or au.id_auditoria_estatus = 1) and au.id_almacen = @almacen)
		BEGIN
			select 
			ISNULL(au.nombre,'--') as clave,
			0 as idProducto,
			'--' as descripcion,
			'--' as familia,
			'--' as linea,
			'--' as subfamilia,
			CAST (0 as tinyint) as vendesn
			from articulo a
			LEFT JOIN familia f ON a.id_familia = f.id_familia
			LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
			LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
			LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
			LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
			WHERE  ag.clave = @clave and (au.id_auditoria_estatus = 2 or au.id_auditoria_estatus = 1) and au.id_almacen = @almacen
		END
		ELSE
		BEGIN
			select
				distinct(a.id_articulo), 
				ISNULL(a.clave,'--') as clave,
				ISNULL(a.id_articulo,'--') as idProducto,
				ISNULL(a.desc_super,'--') as descripcion,
				ISNULL(f.clave,'--') as familia,
				ISNULL(l.clave,'--') as linea,
				ISNULL(ag.clave,'--') as subfamilia,
				ISNULL(ad.vende_sin_existencia,0) as vendesn
			from articulo a
			LEFT JOIN familia f ON a.id_familia = f.id_familia
			LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
			LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
			LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
			LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
			LEFT JOIN articulo_adicionales ad On ad.id_articulo_adicionales = a.id_articulo_adicionales
			WHERE ag.clave = @clave  and (au.id_almacen is null or (au.id_almacen != @almacen or (au.id_auditoria_estatus = 3 or au.id_auditoria is null)))
		END
	END
	ELSE IF (@idTipo=3)
	BEGIN 
		IF EXISTS(select 
			ISNULL(a.clave,'--') as clave,
			ISNULL(a.id_articulo,'--') as idProducto,
			ISNULL(a.desc_super,'--') as descripcion,
			ISNULL(f.clave,'--') as familia,
			ISNULL(l.clave,'--') as linea,
			ISNULL(ag.clave,'--') as subfamilia,
			ISNULL(ad.vende_sin_existencia,0) as vendesn
		from articulo a
		LEFT JOIN familia f ON a.id_familia = f.id_familia
		LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
		LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
		LEFT JOIN linea_negocio ln ON ln.id_linea_negocio = a.id_linea_negocio
		LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
		LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
		LEFT JOIN articulo_adicionales ad On ad.id_articulo_adicionales = a.id_articulo_adicionales
		WHERE ln.clave = @clave and (au.id_auditoria_estatus = 2 or au.id_auditoria_estatus = 1) and au.id_almacen = @almacen)
		BEGIN
			select 
			ISNULL(au.nombre,'--') as clave,
			0 as idProducto,
			'--' as descripcion,
			'--' as familia,
			'--' as linea,
			'--' as subfamilia,
			CAST (0 as tinyint) as vendesn
			from articulo a
			LEFT JOIN familia f ON a.id_familia = f.id_familia
			LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
			LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
			LEFT JOIN linea_negocio ln ON ln.id_linea_negocio = a.id_linea_negocio
			LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
			LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
			WHERE ln.clave = @clave and (au.id_auditoria_estatus = 2 or au.id_auditoria_estatus = 1) and au.id_almacen = @almacen
		END
		ELSE 
		BEGIN
			select 
				distinct(a.id_articulo),
				ISNULL(a.clave,'--') as clave,
				ISNULL(a.id_articulo,'--') as idProducto,
				ISNULL(a.desc_super,'--') as descripcion,
				ISNULL(f.clave,'--') as familia,
				ISNULL(l.clave,'--') as linea,
				ISNULL(ag.clave,'--') as subfamilia,
				ISNULL(ad.vende_sin_existencia,0) as vendesn
			from articulo a
			LEFT JOIN familia f ON a.id_familia = f.id_familia
			LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
			LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
			LEFT JOIN linea_negocio ln ON ln.id_linea_negocio = a.id_linea_negocio
			LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
			LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
			LEFT JOIN articulo_adicionales ad On ad.id_articulo_adicionales = a.id_articulo_adicionales
			WHERE ln.clave = @clave and (au.id_almacen is null or (au.id_almacen != @almacen or (au.id_auditoria_estatus = 3 or au.id_auditoria is null)))
		END
	END
	ELSE IF (@idTipo=4)
	BEGIN 
		IF EXISTS(select 
			ISNULL(a.clave,'--') as clave,
			ISNULL(a.id_articulo,'--') as idProducto,
			ISNULL(a.desc_super,'--') as descripcion,
			ISNULL(f.clave,'--') as familia,
			ISNULL(l.clave,'--') as linea,
			ISNULL(ag.clave,'--') as subfamilia,
			ISNULL(ad.vende_sin_existencia,0) as vendesn
		from articulo a
		LEFT JOIN familia f ON a.id_familia = f.id_familia
		LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
		LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
		LEFT JOIN subcategoria sc ON sc.id_subcategoria = a.id_subcategoria
		LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
		LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
		LEFT JOIN articulo_adicionales ad On ad.id_articulo_adicionales = a.id_articulo_adicionales
		WHERE sc.clave = @clave and (au.id_auditoria_estatus = 2 or au.id_auditoria_estatus = 1) and au.id_almacen = @almacen)
		BEGIN
			select 
			ISNULL(au.nombre,'--') as clave,
			0 as idProducto,
			'--' as descripcion,
			'--' as familia,
			'--' as linea,
			'--' as subfamilia,
			CAST (0 as tinyint) as vendesn
			from articulo a
			LEFT JOIN familia f ON a.id_familia = f.id_familia
			LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
			LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
			LEFT JOIN subcategoria sc ON sc.id_subcategoria = a.id_subcategoria
			LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
			LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
			WHERE sc.clave = @clave and (au.id_auditoria_estatus = 2 or au.id_auditoria_estatus = 1) and au.id_almacen = @almacen
		END
		ELSE
		BEGIN
			select
				distinct(a.id_articulo), 
				ISNULL(a.clave,'--') as clave,
				ISNULL(a.id_articulo,'--') as idProducto,
				ISNULL(a.desc_super,'--') as descripcion,
				ISNULL(f.clave,'--') as familia,
				ISNULL(l.clave,'--') as linea,
				ISNULL(ag.clave,'--') as subfamilia,
				ISNULL(ad.vende_sin_existencia,0) as vendesn
			from articulo a
			LEFT JOIN familia f ON a.id_familia = f.id_familia
			LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
			LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
			LEFT JOIN subcategoria sc ON sc.id_subcategoria = a.id_subcategoria
			LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
			LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
			LEFT JOIN articulo_adicionales ad On ad.id_articulo_adicionales = a.id_articulo_adicionales
			WHERE sc.clave = @clave and (au.id_almacen is null or (au.id_almacen != @almacen or (au.id_auditoria_estatus = 3 or au.id_auditoria is null)))
		END
	END
	ELSE IF (@idTipo=4)
	BEGIN 
		IF EXISTS(select 
			ISNULL(a.clave,'--') as clave,
			ISNULL(a.id_articulo,'--') as idProducto,
			ISNULL(a.desc_super,'--') as descripcion,
			ISNULL(f.clave,'--') as familia,
			ISNULL(l.clave,'--') as linea,
			ISNULL(ag.clave,'--') as subfamilia,
			ISNULL(ad.vende_sin_existencia,0) as vendesn
		from articulo a
		LEFT JOIN familia f ON a.id_familia = f.id_familia
		LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
		LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
		LEFT JOIN subcategoria sc ON sc.id_subcategoria = a.id_subcategoria
		LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
		LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
		LEFT JOIN articulo_adicionales ad On ad.id_articulo_adicionales = a.id_articulo_adicionales
		WHERE sc.clave = @clave and (au.id_auditoria_estatus = 2 or au.id_auditoria_estatus = 1) and au.id_almacen = @almacen)
		BEGIN
			select 
			ISNULL(au.nombre,'--') as clave,
			0 as idProducto,
			'--' as descripcion,
			'--' as familia,
			'--' as linea,
			'--' as subfamilia,
			CAST (0 as tinyint) as vendesn
			from articulo a
			LEFT JOIN familia f ON a.id_familia = f.id_familia
			LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
			LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
			LEFT JOIN subcategoria sc ON sc.id_subcategoria = a.id_subcategoria
			LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
			LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
			WHERE sc.clave = @clave and (au.id_auditoria_estatus = 2 or au.id_auditoria_estatus = 1) and au.id_almacen = @almacen
		END
		ELSE
		BEGIN
			select distinct(a.id_articulo),
				ISNULL(a.clave,'--') as clave,
				ISNULL(a.id_articulo,'--') as idProducto,
				ISNULL(a.desc_super,'--') as descripcion,
				ISNULL(f.clave,'--') as familia,
				ISNULL(l.clave,'--') as linea,
				ISNULL(ag.clave,'--') as subfamilia,
				ISNULL(ad.vende_sin_existencia,0) as vendesn
			from articulo a
			LEFT JOIN familia f ON a.id_familia = f.id_familia
			LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
			LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
			LEFT JOIN subcategoria sc ON sc.id_subcategoria = a.id_subcategoria
			LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
			LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
			LEFT JOIN articulo_adicionales ad On ad.id_articulo_adicionales = a.id_articulo_adicionales
			WHERE sc.clave = @clave  and (au.id_almacen is null or (au.id_almacen != @almacen or (au.id_auditoria_estatus = 3 or au.id_auditoria is null)))
		END
	END
	ELSE IF (@idTipo=6)
	BEGIN 
		IF EXISTS(select 
			ISNULL(a.clave,'--') as clave,
			ISNULL(a.id_articulo,'--') as idProducto,
			ISNULL(a.desc_super,'--') as descripcion,
			ISNULL(f.clave,'--') as familia,
			ISNULL(l.clave,'--') as linea,
			ISNULL(ag.clave,'--') as subfamilia,
			ISNULL(ad.vende_sin_existencia,0) as vendesn
		from articulo a
		LEFT JOIN familia f ON a.id_familia = f.id_familia
		LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
		LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
		LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
		LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
		LEFT JOIN articulo_adicionales ad On ad.id_articulo_adicionales = a.id_articulo_adicionales
		WHERE a.clave = @clave and (au.id_auditoria_estatus = 2 or au.id_auditoria_estatus = 1) and au.id_almacen = @almacen)
		BEGIN
			select 
			ISNULL(au.nombre,'--') as clave,
			0 as idProducto,
			'--' as descripcion,
			'--' as familia,
			'--' as linea,
			'--' as subfamilia,
			CAST (0 as tinyint) as vendesn
			from articulo a
			LEFT JOIN familia f ON a.id_familia = f.id_familia
			LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
			LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
			LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
			LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
			WHERE a.clave = @clave and (au.id_auditoria_estatus = 2 or au.id_auditoria_estatus = 1) and au.id_almacen = @almacen
		END
		ELSE
		BEGIN
			select 
				distinct(a.id_articulo),
				ISNULL(a.clave,'--') as clave,
				ISNULL(a.id_articulo,'--') as idProducto,
				ISNULL(a.desc_super,'--') as descripcion,
				ISNULL(f.clave,'--') as familia,
				ISNULL(l.clave,'--') as linea,
				ISNULL(ag.clave,'--') as subfamilia,
				ISNULL(ad.vende_sin_existencia,0) as vendesn
			from articulo a
			LEFT JOIN familia f ON a.id_familia = f.id_familia
			LEFT JOIN linea_negocio l ON l.id_linea_negocio = a.id_linea_negocio
			LEFT JOIN agrupador_articulo ag ON ag.id_agrupador_articulo = a.id_agrupador_articulo
			LEFT JOIN auditoria_detalle aud ON aud.id_articulo = a.id_articulo 
			LEFT JOIN auditoria au ON au.id_auditoria = aud.id_auditoria
			LEFT JOIN articulo_adicionales ad On ad.id_articulo_adicionales = a.id_articulo_adicionales
			WHERE a.clave = @clave and (au.id_almacen is null or (au.id_almacen != @almacen or (au.id_auditoria_estatus = 3 or au.id_auditoria is null)))
		END
	END 
END

GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloExistenciaPorAlmacenYArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 03 de Julio de 2018
-- Description:	Consulta Articulo existencias por Articulo y Almacen
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloExistenciaPorAlmacenYArticulo]
	@idArticulo as int,
    @idAlmacen as int
AS
BEGIN
	if @idAlmacen = 0 
		SELECT 0 id_articulo_existencia
			,ae.[id_articulo]
           ,0 [id_almacen]
           ,ISNULL(sum(ae.[total_entradas]),0) as total_entradas
           ,ISNULL(sum(ae.[total_salidas]),0) as [total_salidas]
           ,ISNULL(sum([existencia_actual]),0) as [existencia_actual]
           ,ISNULL(sum([existencia_apartado]),0) as [existencia_apartado]
           ,ISNULL(sum([existencia_venta]),0) as [existencia_venta]
           ,ISNULL(([costo_promedio]),0) as [costo_promedio]
           ,ISNULL(sum([costo_ultimo]),0) as [costo_ultimo]
           ,'' [ubicacion]
           ,sum([stock_minimo]) [stock_minimo]
           ,sum([stock_maximo]) [stock_maximo]
           ,max(fecha_ultima_compra) [fecha_ultima_compra]
           ,max(fecha_ultima_venta) [fecha_ultima_venta]
           ,sum([existencia_inicial]) [existencia_inicial] 
		   FROM articulo_existencia ae
		   Left join articulo a ON ae.id_articulo=a.id_articulo 
		   WHERE ae.id_articulo = @idArticulo GROUP BY ae.id_articulo, costo_promedio
	else 
		SELECT 
		id_articulo_existencia,
		ae.id_articulo,
		id_almacen,
		ISNULL(ae.total_entradas,0) as total_entradas,
		ISNULL(ae.total_salidas,0) as total_salidas,
		ISNULL(existencia_actual,0) as existencia_actual,
		ISNULL(existencia_apartado,0) as existencia_apartado,
		ISNULL(existencia_venta,0) as existencia_venta,
		ISNULL(costo_promedio,0) as costo_promedio,
		ISNULL(costo_ultimo,0) as costo_ultimo,
		ISNULL(ubicacion,'') as ubicacion,
		stock_minimo,
		stock_maximo,
		fecha_ultima_compra,
		fecha_ultima_venta,
		existencia_inicial
		FROM articulo_existencia ae
		Left join articulo a ON ae.id_articulo=a.id_articulo 
		WHERE ae.id_articulo = @idArticulo and id_almacen = @idAlmacen
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloExistenciaPorSucursal]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-07-27
-- Description:	Consulta de Articulo Existencia por Sucursal
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloExistenciaPorSucursal]
	@id_articulo AS	int,
	@id_sucursal AS	int
AS
BEGIN
	SELECT 
		al.id_almacen,
		al.clave as clave_almacen,
		al.nombre as nombre_almacen,
		a.existencia_actual,		
		a.ubicacion,
		ISNULL(a.existencia_apartado,0) as existencia_apartado
	FROM
		articulo_existencia a
	INNER JOIN almacen al ON al.id_almacen = a.id_almacen
	INNER JOIN sucursal s ON s.id_sucursal = al.id_sucursal
	WHERE
		a.id_articulo = @id_articulo and s.id_sucursal = @id_sucursal
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloOferta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Mofidificacion: caros negrete
-- Create date: 2018-06-17
-- Description:	
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-29
-- Description:	Consulta precio con 4 decimales
-- =============================================

CREATE PROCEDURE [dbo].[spConsultaArticuloOferta]
    @idArticulo as int
AS
BEGIN
    update articulo_oferta set activo = 0
    where fecha_termino<GETDATE() and id_articulo= @idArticulo

    update articulo_oferta set activo = 1
    where fecha_inicio<GETDATE() and fecha_termino>GETDATE() and id_articulo= @idArticulo

    SELECT    
			id_articulo_oferta ,
            id_articulo,
            no_orden as 'No',
            Convert(decimal(18,6),precio_venta) as PVenta,
			margen_utilidad as '% MU',
            Convert(decimal(18,2), cantidad_min) as 'Cant Min',
			Convert(decimal(18,2), cantidad_max) as 'Cant Max',
            ao.utilidad as 'Utilidad',
            convert(varchar,fecha_inicio,105)+' '+convert(varchar, fecha_inicio , 108) as 'Fecha Inicial',
            convert(varchar,fecha_termino,105)+' '+convert(varchar, fecha_termino , 108)as 'Fecha Final',
            ISNULL(fecha_modificacion,0) AS fecha_modificacion,
            ISNULL(fecha_alta,0) AS fecha_alta,
            ao.activo,
			ISNULL(fecha_inicio,0) AS fecha_inicio,
			ISNULL(fecha_termino,0) AS fecha_termino,
			ISNULL(ot.descripcion, '') as 'Oferta Tipo',
			ISNULL(ot.id_oferta_tipo,0) as 'id_Oferta_Tipo'
    FROM articulo_oferta ao
	LEFT JOIN oferta_tipo ot ON ot.id_oferta_tipo= ao.id_oferta_tipo
    WHERE id_articulo = @idArticulo
	Order by id_oferta_tipo desc, no_orden asc
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloPorClaveNombreCodigo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 2020-02-07
-- Description:	Se cambio la forma de trabajar del buscador para que busque 
--              por parametros en ambas descripciones del articulo 
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-05-15
-- Description:	Se agregó un split al comodin
-- =============================================
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-07-26
-- Description:	Consulta de Articulo por Clave, Codigo o nombre
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloPorClaveNombreCodigo]
	@comodin AS VARCHAR(100)
AS
BEGIN
	DECLARE @param  AS VARCHAR(1000);
	DECLARE @sql    AS VARCHAR(MAX);
	DECLARE @val    AS VARCHAR(100);

	SET @param   = '';

	DECLARE Busqueda CURSOR FOR SELECT Data FROM dbo.Split(@comodin, ' ')
	OPEN Busqueda
	FETCH NEXT FROM Busqueda INTO @val
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @param = @param + ' (desc_super LIKE ''%'+@val+'%'' OR desc_mayoreo LIKE ''%'+@val+'%'') AND '
		FETCH NEXT FROM Busqueda INTO @val
	END
	CLOSE Busqueda
	DEALLOCATE Busqueda

	SET @param = SUBSTRING(@param,1,LEN(@param)-3)

	SET @sql = 'SELECT DISTINCT a.id_articulo,a.clave,a.desc_super,a.desc_mayoreo,a.codigo_barras1 as codigo_barras,aa.margen_precio_sugerido,
				a.relacion_compra,a.relacion_venta,um.descripcion as unidad_compra,um2.descripcion as unidad_venta,iva.tasa as iva,ieps.tasa as ieps
				FROM articulo a INNER JOIN articulo_adicionales aa ON aa.id_articulo_adicionales = a.id_articulo_adicionales
				INNER JOIN unidad_medida um ON a.id_unidad_compra = um.id_unidad_medida INNER JOIN unidad_medida um2 ON a.id_unidad_venta = um2.id_unidad_medida
				INNER JOIN impuesto iva ON a.id_iva_venta = iva.id_impuesto INNER JOIN impuesto ieps ON a.id_ieps_venta = ieps.id_impuesto
				LEFT JOIN articulo_equivalente ae ON a.id_articulo = ae.id_articulo LEFT JOIN familia f on f.id_familia = a.id_familia
				LEFT JOIN agrupador_articulo ag on ag.id_agrupador_articulo = a.id_agrupador_articulo INNER JOIN dbo.Split('''+@comodin+''', '' '') c ON ( 
				a.clave like ''%'' + c.Data + ''%'' OR codigo_barras1 like ''%'' + c.Data + ''%'' OR codigo_barras2 like ''%'' + c.Data + ''%'' OR 
				ae.codigo_barras like ''%'' + c.Data + ''%'' OR ag.clave like ''%'' + c.Data + ''%'' OR f.clave like ''%'' + c.Data + ''%'' OR 
				'+@param+' ) WHERE a.activo = 1 and aa.es_recarga = 0;'

	EXEC(@sql)
END

--SELECT DISTINCT
--a.id_articulo ,
--a.clave,
--a.desc_super,
--a.desc_mayoreo,
--a.codigo_barras1 as codigo_barras,
--aa.margen_precio_sugerido,
--a.relacion_compra,
--a.relacion_venta,
--um.descripcion as unidad_compra,
--um2.descripcion as unidad_venta,
--iva.tasa as iva,
--ieps.tasa as ieps
--FROM
--articulo a
--INNER JOIN articulo_adicionales aa ON aa.id_articulo_adicionales = a.id_articulo_adicionales
--INNER JOIN unidad_medida um ON a.id_unidad_compra = um.id_unidad_medida
--INNER JOIN unidad_medida um2 ON a.id_unidad_venta = um2.id_unidad_medida
--INNER JOIN impuesto iva ON a.id_iva_venta = iva.id_impuesto
--INNER JOIN impuesto ieps ON a.id_ieps_venta = ieps.id_impuesto
--LEFT JOIN articulo_equivalente ae ON a.id_articulo = ae.id_articulo
--LEFT JOIN familia f on f.id_familia = a.id_familia
--LEFT JOIN agrupador_articulo ag on ag.id_agrupador_articulo = a.id_agrupador_articulo
--INNER JOIN dbo.Split(@comodin, ' ') c ON (a.clave like '%' + c.Data + '%' or codigo_barras1 like '%' + c.Data + '%' or codigo_barras2 like '%' + c.Data + '%' or desc_mayoreo like '%' + c.Data + '%' or desc_super like '%' + c.Data + '%' 
--or ae.codigo_barras like '%' + c.Data + '%' or ag.clave like '%' + c.Data + '%' or ag.descripcion like '%' + c.Data + '%' or f.clave like '%' + c.Data + '%' or f.descripcion like '%' + c.Data + '%')
--WHERE
--a.activo = 1 and aa.es_recarga = 0
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloPorClaveNombreCodigoProveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-11-23
-- Description:	Consulta de Articulo por Clave, Codigo o nombre y proveedor
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-05-15
-- Description:	Se agregó Split a comodin
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloPorClaveNombreCodigoProveedor]
	@comodin		AS	nvarchar(36),
	@idProveedor	AS	int
AS
BEGIN
	SELECT 
		a.id_articulo ,
		a.clave,
		a.desc_super,
		a.desc_mayoreo,
		a.codigo_barras1 as codigo_barras,
		aa.margen_precio_sugerido,
		a.relacion_compra,
		a.relacion_venta,
		um.descripcion as unidad_compra,
		um2.descripcion as unidad_venta,
		iva.tasa as iva,
		ieps.tasa as ieps
	FROM
		articulo a
	INNER JOIN articulo_adicionales aa ON aa.id_articulo_adicionales = a.id_articulo_adicionales
	INNER JOIN unidad_medida um ON a.id_unidad_compra = um.id_unidad_medida
	INNER JOIN unidad_medida um2 ON a.id_unidad_venta = um2.id_unidad_medida
	INNER JOIN impuesto iva ON a.id_iva_venta = iva.id_impuesto
	INNER JOIN impuesto ieps ON a.id_ieps_venta = ieps.id_impuesto
	LEFT JOIN articulo_equivalente ae ON a.id_articulo = ae.id_articulo
	LEFT JOIN articulo_proveedor ap ON a.id_articulo = ap.id_articulo
	LEFT JOIN familia f on f.id_familia = a.id_familia
	LEFT JOIN agrupador_articulo ag on ag.id_agrupador_articulo = a.id_agrupador_articulo
	INNER JOIN dbo.Split(@comodin, ' ') c ON (a.clave like '%' + c.Data + '%' or codigo_barras1 like '%' + c.Data + '%' or codigo_barras2 like '%' + c.Data + '%' or desc_mayoreo like '%' + c.Data + '%' or desc_super like '%' + c.Data + '%' 
			or ae.codigo_barras like '%' + c.Data + '%' or ag.clave like '%' + c.Data + '%' or ag.descripcion like '%' + c.Data + '%' or f.clave like '%' + c.Data + '%' or f.descripcion like '%' + c.Data + '%')
	WHERE		
		a.activo = 1
		and ap.id_proveedor = @idProveedor and aa.es_recarga = 0
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloPrecioPorArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 2018-08-08
-- Description:	Se ordenaron por no_orden
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloPrecioPorArticulo]
	@idArticulo as int
AS
BEGIN
	
	SELECT 
			id_articulo_precio,
			id_articulo,
			no_orden,
			precio_venta,
			margen_utilidad,
			cantidad,
			utilidad,
			fecha_modificacion,
			fecha_alta
	FROM articulo_precio WHERE id_articulo = @idArticulo ORDER BY no_orden
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloPrecioPorArticuloDataTable]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-08-08
-- Description:	Se ordenaron por no_orden
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloPrecioPorArticuloDataTable]
	@id_articulo AS	int,
	@iva AS decimal(18,4),
	@ieps AS decimal(18,4)
AS
BEGIN
	SELECT 
		no_orden,
		precio_venta * (1 + @iva/100 + @ieps/100) as precio_venta,
		cantidad,
		precio_venta * cantidad * (1 + @iva/100 + @ieps/100) as precio_cantidad
	FROM
		articulo_precio
	WHERE
		id_articulo = @id_articulo
	ORDER BY
		no_orden
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloProveedorPorArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-06-11
-- Description:	Ordenar por prioridad
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloProveedorPorArticulo]
	@idArticulo as int
AS
BEGIN
	SELECT
		p.clave,
		id_articulo_proveedor,
		id_articulo,
		ap.id_proveedor,
		prioridad,
		costo,
		ap.fecha_alta
	FROM 
		articulo_proveedor ap
	LEFT JOIN proveedor p ON ap.id_proveedor = p.id_proveedor
	WHERE 
		id_articulo = @idArticulo
	ORDER BY
		prioridad ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloProveedorPorArticuloDataTable]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 30-05-18
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloProveedorPorArticuloDataTable]
	@idArticulo as int
AS
BEGIN
	SELECT ap.id_articulo_proveedor as 'Id Articulo Proveedor',ap.prioridad as 'Prioridad',p.clave as 'Clave',p.nombre as 'Nombre',ap.costo as 'Costo', p.id_proveedor as 'Proveedor' FROM articulo_proveedor ap INNER JOIN proveedor p ON p.id_proveedor = ap.id_proveedor WHERE ap.id_articulo = @idArticulo
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloProveedorPorArticuloYProveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-29
-- Description:	Agregar clave proveedor en la respuesta
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloProveedorPorArticuloYProveedor]
	@idArticulo as int,
	@idProveedor as int
AS
BEGIN
	SELECT 
		ap.*,
		p.clave 
	FROM 
		articulo_proveedor ap 
		LEFT JOIN  proveedor p ON ap.id_proveedor = p.id_proveedor
	WHERE 
		ap.id_articulo = @idArticulo and ap.id_proveedor = @idProveedor
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloProveedorPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-29
-- Description:	Agregar clave proveedor en la respuesta
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloProveedorPorId]
	@idArticuloProveedor as int
AS
BEGIN
	SELECT 
		ap.*,
		p.clave 
	FROM 
		articulo_proveedor ap 
		LEFT JOIN  proveedor p ON ap.id_proveedor = p.id_proveedor
	WHERE 
		ap.id_articulo_proveedor = @idArticuloProveedor
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloSAdicionalesPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola Martin
-- Create date: 05 junio 2018
-- Description:	Consulta Articulos Adicionales por su id
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-09-08
-- Description:	Cambios por agregar columna es_recarga
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloSAdicionalesPorId]
	@id as int
AS
BEGIN
	SELECT 
		aa.id_articulo_adicionales,
		aa.vende_sin_existencia,
		aa.cm_super_ancho,
		aa.cm_super_alto,
		aa.cm_super_largo,
		aa.cm_super_peso,
		aa.cm_mayoreo_ancho,
		aa.cm_mayoreo_alto,
		aa.cm_mayoreo_largo,
		aa.cm_mayoreo_peso,
		aa.pide_receta,
		aa.sobre_pedido,
		aa.descontinuado,
		ISNULL(aa.margen_precio_sugerido, 0) AS margen_precio_sugerido,
		ISNULL(utilidad_minima, 0) AS utilidad_minima,
		ISNULL(es_recarga, 0) AS es_recarga
	FROM 
		articulo_adicionales aa 
	WHERE 
		id_articulo_adicionales = @id 
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticulosTicket]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barguola	
-- Create date: 2019-01-04
-- Description:	Consulta informacion de los articulos de un ticket de venta
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-05-01
-- Description:	Se agregó la relacion venta
-- =============================================
-- =============================================
-- Author:		Juan Carlos Castillo
-- Create date: 2020-09-02
-- Description:	Se modifica para que consulte los articulos separando a los de mayoreo y Super
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticulosTicket]
	@folio as nvarchar(12)
AS
BEGIN
if((select top 1 es_mayoreo from movimiento_almacen_detalle mad inner join movimiento_almacen ma on mad.id_movimiento_almacen = ma.id_movimiento_almacen where folio=@folio)=0)
begin
	SELECT 
		a.id_articulo,
		um.id_unidad_medida,
		a.clave,
		a.desc_super AS name,
		mad.cantidad,
		um.descripcion AS unidad,
		mad.costo_unitario AS costo,
		ivaV.tasa AS iva,
		iepsC.tasa AS ieps,
		mad.importe,
		id_movimiento_almacen_detalle,
		(CASE WHEN mad.id_unidad_medida = a.id_unidad_compra THEN 1 ELSE 0 END) AS esUnidadCompra,
		(mad.importe * (aa.margen_precio_sugerido/100 + 1)) as precioSugerido,
		alm.nombre as almacen,
		a.relacion_venta
	 FROM movimiento_almacen_detalle mad 
		INNER JOIN movimiento_almacen ma ON ma.id_movimiento_almacen = mad.id_movimiento_almacen
		INNER JOIN articulo a ON a.id_articulo = mad.id_articulo 
		INNER JOIN articulo_adicionales aa ON aa.id_articulo_adicionales = a.id_articulo_adicionales
		INNER JOIN unidad_medida um ON um.id_unidad_medida = mad.id_unidad_medida
		INNER JOIN impuesto ivaC ON ivaC.id_impuesto = a.id_iva_compra
		INNER JOIN impuesto ivaV ON ivaV.id_impuesto = a.id_iva_venta
		INNER JOIN impuesto iepsC ON iepsC.id_impuesto = a.id_ieps_compra
		INNER JOIN impuesto iepsV ON iepsV.id_impuesto = a.id_ieps_venta
		INNER JOIN almacen alm ON alm.id_almacen = mad.id_almacen

		WHERE ma.folio = @folio;

end

else 

begin
 
 		SELECT 
		a.id_articulo,
		a.id_unidad_compra,
		a.clave,
		a.desc_mayoreo AS name,
		mad.cantidad/a.relacion_venta As cantidad,
		um.descripcion AS unidad,
		mad.costo_unitario*mad.cantidad AS costo,
		ivaV.tasa AS iva,
		iepsC.tasa AS ieps,
		mad.importe,
		id_movimiento_almacen_detalle,
		(CASE WHEN mad.es_mayoreo = 1 THEN 1 ELSE 0 END) AS esUnidadCompra,
		(mad.importe * (aa.margen_precio_sugerido/100 + 1)) as precioSugerido,
		alm.nombre as almacen,
		a.relacion_venta
	 FROM movimiento_almacen_detalle mad 
		INNER JOIN movimiento_almacen ma ON ma.id_movimiento_almacen = mad.id_movimiento_almacen
		INNER JOIN articulo a ON a.id_articulo = mad.id_articulo 
		INNER JOIN articulo_adicionales aa ON aa.id_articulo_adicionales = a.id_articulo_adicionales
		INNER JOIN unidad_medida um ON um.id_unidad_medida = a.id_unidad_compra
		INNER JOIN impuesto ivaC ON ivaC.id_impuesto = a.id_iva_compra
		INNER JOIN impuesto ivaV ON ivaV.id_impuesto = a.id_iva_venta
		INNER JOIN impuesto iepsC ON iepsC.id_impuesto = a.id_ieps_compra
		INNER JOIN impuesto iepsV ON iepsV.id_impuesto = a.id_ieps_venta
		INNER JOIN almacen alm ON alm.id_almacen = mad.id_almacen

		WHERE ma.folio =@folio ;
end



END

GO
/****** Object:  StoredProcedure [dbo].[spConsultaArticuloSucursalMayoreoPorArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola Martin
-- Create date: 05 junio 2018
-- Description:	Consulta sucursales de mayoreo por articulo
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaArticuloSucursalMayoreoPorArticulo]
	@idArticulo as int
AS
BEGIN
select asm.id_articulo_sucursal_mayoreo,s.id_sucursal,s.clave_sucursal as 'Clave',s.nombre as 'Nombre' from articulo_sucursal_mayoreo asm inner join sucursal s on s.id_sucursal = asm.id_sucursal 
where asm.id_articulo = @idArticulo
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaAuditores]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:         Carlos Negrete
-- Create date:    2 Agosto 2018
-- Description:    spConsultaUsuarioPorPerfil
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaAuditores]
	@sucursal as int,
	@llave as nvarchar(50)
AS
BEGIN
	SELECT
		 id_usuario,
		 nombre,
		 clave,
		 ISNULL(u.id_perfil,0) AS id_perfil,
		 ISNULL(id_sucursal,0) AS id_sucursal,
		 ISNULL(id_caja_actual,0) AS id_caja_actual,
		 fecha_alta,
		 ISNULL(ultima_sesion,0) AS ultima_sesion,
		 activo,
		 CONVERT(NVARCHAR(50),DECRYPTBYPASSPHRASE(@llave, contrasena)) AS contrasena
	FROM 
		usuario u 
		LEFT JOIN perfil_modulo_permiso pmp ON pmp.id_perfil = u.id_perfil
	WHERE 
		activo = 1
		and id_sucursal = @sucursal 
		and pmp.id_modulo = 63
		and pmp.id_permiso = 8

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaAuditoriaDetalle]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaAuditoriaDetalle]
	@id as int
AS
BEGIN
	
	begin
		merge auditoria_detalle as t
		using (select id_articulo, id_almacen, existencia_actual, existencia_apartado, existencia_venta, (isnull(existencia_actual,0) + isnull(existencia_apartado,0) +  isnull(existencia_venta,0)) as total
			from articulo_existencia) as s
		on (s.id_articulo = t.id_articulo and s.id_almacen = t.id_almacen)
		when matched
	then update	
		set	t.ex_actual_conteo = s.existencia_actual,
			t.ex_apartado_conteo = s.existencia_apartado,
			t.ex_venta_conteo = s.existencia_venta,
			t.ex_total_conteo = s.total,
			t.diferencia = t.ex_auditoria - s.total;
	end

	select 
		id_auditoria,
		id_almacen,
		id_auditoria_detalle,
		a.id_articulo,
		IIF(id_almacen = 2, desc_mayoreo, desc_super) as descripcion,
		art.clave as clave,
		IIF(id_almacen <> 2, ISNULL(ex_total_inicio, 0), ISNULL(ex_total_inicio, 0) / ISNULL(art.relacion_venta, 1)) as ex_total_inicio,
		IIF(id_almacen <> 2, ISNULL(ex_actual_conteo, 0), ISNULL(ex_actual_conteo, 0) / ISNULL(art.relacion_venta, 1)) AS ex_actual_conteo,
		IIF(id_almacen <> 2, ISNULL(ex_apartado_conteo, 0), ISNULL(ex_apartado_conteo, 0) / ISNULL(art.relacion_venta, 1)) AS ex_apartado_conteo,
		IIF(id_almacen <> 2, ISNULL(ex_venta_conteo, 0), ISNULL(ex_venta_conteo, 0) / ISNULL(art.relacion_venta, 1)) AS ex_venta_conteo,
		IIF(id_almacen <> 2, ISNULL(ex_total_conteo, 0), ISNULL(ex_total_conteo, 0) / ISNULL(art.relacion_venta, 1)) AS ex_total_conteo,
		IIF(id_almacen <> 2, ISNULL(ex_auditoria, 0), ISNULL(ex_auditoria, 0) / ISNULL(art.relacion_venta, 1)) AS ex_auditoria,
		IIF(id_almacen <> 2, ISNULL(diferencia, 0), ISNULL(diferencia, 0) / ISNULL(art.relacion_venta, 1)) AS diferencia,
		IIF(id_almacen = 2, 
			(SELECT descripcion FROM unidad_medida where id_unidad_medida  = id_unidad_compra) ,
			(SELECT descripcion FROM unidad_medida where id_unidad_medida  = id_unidad_venta)) as unidadMedida,
		art.relacion_venta,
		art.costo_promedio,
		fam.clave AS clave_familia
	from auditoria_detalle a 
	LEFT JOIN articulo art ON art.id_articulo = a.id_articulo
	LEFT JOIN familia fam ON fam.id_familia = art.id_familia
	where a.id_auditoria = @id

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaAuditoriaPorID]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--======================================
-- Author:		Carlos Negrete  - Alter Israel Flores C.
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaAuditoriaPorID]
	@id as int
AS
BEGIN
	select 
		id_auditoria as idAuditoria,
		a.clave_sincronizacion,
		a.nombre as nombre,
		al.nombre as almacen, 
		fecha_inicio,
		(select count(id_articulo) from auditoria_detalle where id_auditoria = @id) as articulos
	from auditoria a 
	LEFT JOIN almacen al ON a.id_almacen = al.id_almacen
	LEFT JOIN usuario u ON u.id_usuario = a.id_inicio
	where a.id_auditoria = @id
END

GO
/****** Object:  StoredProcedure [dbo].[spConsultaAuditoriasAutorizar]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--======================================
-- Author:		Carlos Negrete - Alter Israel Flores C.
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaAuditoriasAutorizar]
	--@idAlmacen as int
AS
BEGIN
	select 
		id_auditoria as idAuditoria,
		a.nombre +' ('+ u.nombre+ ')' as nombre
	from auditoria a 
	LEFT JOIN almacen al ON a.id_almacen = al.id_almacen
	LEFT JOIN usuario u ON u.id_usuario = a.id_inicio
	where 
	--a.id_almacen = @idAlmacen and 
	a.id_auditoria_estatus = 2
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaAuditoriasPendiente]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--======================================
-- Author:		Carlos Negrete - Alter Israel Flores C.
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaAuditoriasPendiente]
	@idSucursal as int
AS
BEGIN
	select 
		id_auditoria as idAuditoria,
		ISNULL(a.clave_sincronizacion,'') as clave_sincronizacion,
		a.nombre as nombre,
		--al.nombre as almacen,
		fecha_inicio as fInicio,
		u.nombre as PInicio,
		(select count(*) from auditoria_detalle where id_auditoria = a.id_auditoria) as totalArticulos
	from auditoria a 
	LEFT JOIN almacen al ON a.id_almacen = al.id_almacen
	LEFT JOIN usuario u ON u.id_usuario = a.id_inicio
	where al.id_sucursal = @idSucursal and a.id_auditoria_estatus in (1,2)

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaAutorizacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Marco Gonzalez
-- Create date:		30 Mayo 2018
-- Description:		Verifica si el perfil tiene el permiso en el modulo solicitado
-- =============================================

CREATE PROCEDURE [dbo].[spConsultaAutorizacion]
	@idModulo	AS	INT,
	@idPermiso	AS	INT,
	@idPerfil	AS	INT
AS
BEGIN

	DECLARE @vRegistros	AS	INT;

	SELECT @vRegistros = COUNT(*) FROM perfil_modulo_permiso WHERE id_perfil = @idPerfil AND id_modulo = @idModulo AND id_permiso = @idPermiso

	IF(@vRegistros = 0)
	BEGIN
		SELECT 0 AS autorizacion;
	END
	ELSE
	BEGIN
		SELECT 1 AS autorizacion;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaBitacoraImpresionPorReferencia]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-07-23
-- Description:	Consulta Bitacora de Impresion por referencia
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaBitacoraImpresionPorReferencia]
           @referencia as nvarchar(20)
AS
BEGIN
	SELECT * FROM bitacora_impresion where referencia = @referencia

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCajaPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 17.mayo.2018
-- Description:	Consulta caja por ID
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCajaPorId]
	@idCaja as int
AS
BEGIN
	SELECT * FROM caja WHERE id_caja = @idCaja
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCajaPorNoCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 17.mayo.2018
-- Description:	Consulta caja por numero de caja
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-02-27
-- Description:	Se busca por id_sucursal
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCajaPorNoCaja]
	@noCaja		AS	INT,
	@idSucursal	AS	INT
AS
BEGIN
	SELECT 
		* 
	FROM 
		caja 
	WHERE 
		no_caja = @noCaja
		AND id_sucursal = @idSucursal
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCajaPorNombre]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCajaPorNombre]
	@nombre as nvarchar(15),
	@sucursal as int
AS
BEGIN
	SELECT * FROM caja WHERE nombre = @nombre and id_sucursal = @sucursal
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoCajaPorSucursal]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos NEgrete
-- Create date: 1.Sept.2018
-- Description:	Consulta todas las cajas activas
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoCajaPorSucursal]
	@idSucursal as int
AS
BEGIN
	SELECT * FROM caja WHERE activo = 1 and id_sucursal= @idSucursal
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoCompletoAlmacen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoCompletoAlmacen]
AS
BEGIN
	SELECT * FROM almacen WHERE activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoCompletoBanco]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoCompletoBanco]
AS
BEGIN
	SELECT * FROM banco WHERE activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoCompletoCategoria]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 11.mayo.2018
-- Description:	Consulta todo lo activo de la tabla categoria
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoCompletoCategoria]
AS
BEGIN
	SELECT * FROM categoria WHERE activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoCompletoCliente]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 24.mayo.2018
-- Description:	Consultar cat�logo cliente
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoCompletoCliente]
AS
BEGIN
	SELECT * FROM cliente
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoCompletoDenominacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 10.mayo.2018
-- Description:	Consulta todo lo activo de la tabla denominacion
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoCompletoDenominacion]
AS
BEGIN
	SELECT * FROM denominacion WHERE activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoCompletoFromaDePago]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 14.febrero.2020
-- Description:	Se ordenan los resultados
-- =============================================
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 10.mayo.2018
-- Description:	Consulta todo lo activo de la tabla forma_pago
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoCompletoFromaDePago]
AS
BEGIN
	SELECT * FROM forma_pago WHERE activo = 1  ORDER BY descripcion ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoCompletoPerfil]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoCompletoPerfil]
AS
BEGIN
	SELECT 
		id_perfil,
		nombre
	FROM
		perfil
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoCompletoPrecioAgrupador]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonalez
-- Create date: 2018-06-12
-- Description:	Cambio ordenar por clave y nivel de precio
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoCompletoPrecioAgrupador]
AS
BEGIN
	SELECT
		precio_agrupador.id_precio_agrupador AS idPrecio,
		precio_agrupador.id_agrupador_articulo AS idArticulo,
		agrupador_articulo.clave AS Clave,
		agrupador_articulo.descripcion AS Nombre,
		precio_agrupador.nivel_precio AS Nivel,
		precio_agrupador.cantidad AS Cantidad,
		precio_agrupador.fecha_alta AS fechaAlta,
		precio_agrupador.activo AS Activo
	FROM precio_agrupador
		LEFT JOIN agrupador_articulo ON
		agrupador_articulo.id_agrupador_articulo = precio_agrupador.id_agrupador_articulo
	WHERE 
		precio_agrupador.activo = 1
	ORDER BY
		agrupador_articulo.clave,
		nivel_precio ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoCompletoSubcategoria]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoCompletoSubcategoria]
AS
BEGIN

	SELECT * FROM subcategoria WHERE activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoCompletoUnidadMedida]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 18.mayo.2018
-- Description:	Consulta catalogo activo unidad de medida
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoCompletoUnidadMedida]
AS
BEGIN
	SELECT * FROM unidad_medida WHERE activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoCompletoUsuario]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:         Marco Gonzalez
-- Create date:    31 Mayo 2018
-- Description:    Cambios por la decodificacion de la contrasena
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoCompletoUsuario]
	@llave as nvarchar(50)
AS
BEGIN
	SELECT
		 id_usuario,
		 nombre,
		 clave,
		 ISNULL(id_perfil,0) AS id_perfil,
		 ISNULL(id_sucursal,0) AS id_sucursal,
		 ISNULL(id_caja_actual,0) AS id_caja_actual,
		 fecha_alta,
		 ISNULL(ultima_sesion,0) AS ultima_sesion,
		 activo,
		 CONVERT(NVARCHAR(50),DECRYPTBYPASSPHRASE(@llave, contrasena)) AS contrasena
	FROM 
		usuario 
	WHERE 
		activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoModulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaCatalogoModulo]
AS
BEGIN
	SELECT 
		* 
	FROM 
		modulo
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoPermiso]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaCatalogoPermiso]
AS
BEGIN
	SELECT 
		* 
	FROM 
		permiso
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoPrecioAgrupadorPorAgrupador]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-06-12
-- Description:	Consultar precios por idAgrupadorArticulo
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoPrecioAgrupadorPorAgrupador]
	@idAgrupadorArticulo AS	INT
AS
BEGIN
	SELECT
		pa.id_precio_agrupador AS idPrecioAgrupador,
		pa.id_agrupador_articulo AS idAgrupador,
		agrupador_articulo.clave AS Clave,
		agrupador_articulo.descripcion AS Nombre,
		pa.nivel_precio AS Nivel,
		pa.cantidad AS Cantidad,
		pa.fecha_alta AS fechaAlta,
		pa.activo AS Activo
	FROM precio_agrupador pa
		LEFT JOIN agrupador_articulo ON agrupador_articulo.id_agrupador_articulo = pa.id_agrupador_articulo
	WHERE
		pa.id_agrupador_articulo = @idAgrupadorArticulo AND
		pa.activo = 1
	ORDER BY
		pa.nivel_precio ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoProductoRecarga]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carolina Franco
-- Create date: 2019-05-11
-- Description:	Consulta los productos de 
--				Recargas solamente con clave
-- =============================================
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-10-16
-- Description:	Consulta los productos de Recargas
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoProductoRecarga]
AS
BEGIN
	SELECT * FROM producto_recargas WHERE clave IS NOT NULL AND compania IS NOT NULL;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCatalogoTipoOferta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 24.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCatalogoTipoOferta]
AS
BEGIN
	SELECT	id_oferta_tipo,
			descripcion
	FROM oferta_tipo
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCategoriaPorClave]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 11.mayo.2018
-- Description:	Consulta categoria por clave
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCategoriaPorClave]
	@clave as nvarchar(100)
AS
BEGIN
	SELECT * FROM categoria WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCategoriaPorDescripcion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 11.mayo.2018
-- Description:	Consulta categoria por descripci�n
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCategoriaPorDescripcion]
	@descripcion as nvarchar(100)
AS
BEGIN
	SELECT * FROM categoria WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCategoriaPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 11.mayo.2018
-- Description:	Consulta categoria por ID
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCategoriaPorId]
	@id as int
AS
BEGIN
	SELECT * FROM categoria WHERE id_categoria = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaClientePorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 24.mayo.2018
-- Description:	Consultar cliente por id
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaClientePorId]
	@id as int
AS
BEGIN
	SELECT * FROM cliente WHERE id_cliente = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaClientePorIdFacturacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 30.mayo.2018
-- Description:	Consultar cliente por id
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaClientePorIdFacturacion]
	@id as int
AS
BEGIN
	SELECT	id_cliente,
			nombre,
			iSNULL(observaciones,'')as observaciones,
			iSNULL(id_forma_pago,0)as id_forma_pago ,
			iSNULL(telefono1,'--')as telefono1,
			iSNULL(telefono2,'--')as telefono2,
			iSNULL(puntos_acumulados,0)as puntos_acumulados,
			iSNULL(puntos_cobrados,0)as puntos_cobrados,
			iSNULL(saldo_favor,0)as saldo_favor,
			iSNULL(ultima_compra,GETDATE())as ultima_compra ,
			fecha_alta,
			iSNULL(id_datos_facturacion,0)as id_datos_facturacion ,
			activo
			FROM cliente WHERE id_datos_facturacion = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaClientePorNombre]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 24.mayo.2018
-- Description:	Consultar cliente por nombre
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaClientePorNombre]
	@nombre as nvarchar(200)
AS
BEGIN
	SELECT * FROM cliente WHERE nombre = @nombre
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCodigoEnCodigoArticuloYEquivalente]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 15.junio.2018
-- Description:	Busca si el codigo de barras ya existe en articulo equivalente y articulo
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCodigoEnCodigoArticuloYEquivalente]
	@codigoBarras as nvarchar(36)
AS
BEGIN
	DECLARE @idArticulo	AS INT;

	SET @idArticulo = NULL;

	SELECT @idArticulo = id_articulo FROM articulo_equivalente WHERE codigo_barras = @codigoBarras

	IF(@idArticulo IS NULL)
	BEGIN
		SELECT @idArticulo = id_articulo FROM articulo WHERE codigo_barras1 = @codigoBarras OR codigo_barras2 = @codigoBarras
		IF(@idArticulo IS NULL)
			SELECT 0 AS existe
		ELSE
			SELECT 1 AS	existe
	END
	ELSE
		SELECT 1 AS	existe
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCodigoEnCodigoEquivalente]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 15.junio.2018
-- Description:	Busca si el codigo de barras ya existe en articulo equivalente
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCodigoEnCodigoEquivalente]
	@codigoBarras as nvarchar(36)
AS
BEGIN
	DECLARE @idArticulo	AS INT;

	SET @idArticulo = NULL;

	SELECT @idArticulo = id_articulo FROM articulo_equivalente WHERE codigo_barras = @codigoBarras

	IF(@idArticulo IS NULL)
		SELECT 0 AS existe
	ELSE
		SELECT 1 AS	existe
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCodigoEquivalenteEnCodigoArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez	
-- Create date: 2018-06-15
-- Description:	Busca si el codigo de barras ya existe en codigo1 o codigo2 de articulo
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCodigoEquivalenteEnCodigoArticulo]
	@codigoBarras as nvarchar(36)
AS
BEGIN
	DECLARE @idArticulo	AS	INT;

	SET @idArticulo = NULL;

	SELECT @idArticulo = id_articulo FROM articulo WHERE codigo_barras1 = @codigoBarras OR codigo_barras2 = @codigoBarras;

	IF(@idArticulo IS NULL)
		SELECT 0 AS existe
	ELSE
		SELECT 1 AS	existe
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaConfiguracionFacturacionPorSucursal]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018/11/24
-- Description:	Consulta configuracion facturacion por sucursal
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaConfiguracionFacturacionPorSucursal]
	@idSucursal as int
AS
BEGIN

SELECT id_configuracion_facturacion
      ,id_sucursal
      ,cf.rfc
      ,cf.razon_social
      ,regimen
      ,ruta_file_cer
      ,ruta_file_key
      ,password_key
      ,ruta_guardado
      ,usuario
      ,contrasena
      ,id_cliente_global
	  ,df.rfc as rfc_global
	  ,df.razon_social as razon_global
	  ,uc.clave_sat as uso_CFDI_global
	  ,uc.id_uso_cfdi
	  ,df.email as correo
	  ,cf.url_correo
  FROM [dbo].[configuracion_facturacion] cf
	INNER JOIN cliente c on c.id_cliente = cf.id_cliente_global
	INNER JOIN datos_facturacion df on df.id_datos_facturacion = c.id_datos_facturacion
	INNER JOIN uso_cfdi uc on uc.id_uso_cfdi = df.id_uso_cfdi
  WHERE id_sucursal = @idSucursal
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaConsolidacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaConsolidacion]
	@sucursal as int
AS
BEGIN
	if ((select valor from variable_config where nombre = 'CONSOLIDAR_POR_DIA' and id_sucursal= @sucursal) ='TRUE')
	begin
		select	
				mc.id_movimiento_almacen,
				fecha_registro as  fecha_registro_movimiento,
				mc.id_caja,
				no_caja,
				folio,
				count(distinct( id_movimiento_almacen))as tot_mov,
				(select min(fecha_registro )from	movimiento_almacen mc LEFT JOIN
				caja c ON c.id_caja = mc.id_caja
				where id_movimiento_almacen_tipo =12 and id_consolidacion is null and id_facturacion is null and @sucursal = mc.id_sucursal)as fechaMin,
				(select max(fecha_registro ) from	movimiento_almacen mc LEFT JOIN
				caja c ON c.id_caja = mc.id_caja
				where id_movimiento_almacen_tipo =12 and id_consolidacion is null and id_facturacion is null and @sucursal = mc.id_sucursal) as fechaMax
		from	movimiento_almacen mc LEFT JOIN
				caja c ON c.id_caja = mc.id_caja
		where id_movimiento_almacen_tipo =12 and id_consolidacion is null and id_facturacion is null and @sucursal = mc.id_sucursal
		group by mc.id_caja, no_caja, folio, fecha_registro, id_movimiento_almacen
	end
	ELSE
	begin
		select	
				mc.id_movimiento_almacen,
				CONVERT(DATE, fecha_registro)as  fecha_registro_movimiento,
				mc.id_caja,
				no_caja,
				folio,
				count(distinct( id_movimiento_almacen))as tot_mov,
				(select min(fecha_registro )from	movimiento_almacen mc LEFT JOIN
				caja c ON c.id_caja = mc.id_caja
				where id_movimiento_almacen_tipo =12 and id_consolidacion is null and id_facturacion is null and @sucursal = mc.id_sucursal)as fechaMin,
				(select max(fecha_registro ) from	movimiento_almacen mc LEFT JOIN
				caja c ON c.id_caja = mc.id_caja
				where id_movimiento_almacen_tipo =12 and id_consolidacion is null and id_facturacion is null and @sucursal = mc.id_sucursal) as fechaMax
		from	movimiento_almacen mc LEFT JOIN
				caja c ON c.id_caja = mc.id_caja
		where id_movimiento_almacen_tipo =12 and id_consolidacion is null and id_facturacion is null and @sucursal = mc.id_sucursal
		group by mc.id_caja, no_caja, folio, fecha_registro, id_movimiento_almacen
		--order by no_caja asc
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaConsultarCatalogoCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 17.mayo.2018
-- Description:	Consulta todas las cajas activas
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaConsultarCatalogoCaja]
AS
BEGIN
	SELECT * FROM caja WHERE activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCotizacionPorClienteDataTable]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-08-03
-- Description:	Consulta de Cotizacion por Cliente o RFC
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCotizacionPorClienteDataTable]
	@comodin AS	nvarchar(36),
	@idSucursal AS int
AS
BEGIN
	SELECT 
		cot.id_cotizacion,
		cot.nombre_cliente as nombre,
		cot.fecha_registro,
		count(cd.id_cotizacion_detalle) total_articulos
	FROM cotizacion cot 
	left JOIN cliente c ON c.id_cliente = cot.id_cliente
	INNER JOIN cotizacion_detalle cd ON cd.id_cotizacion = cot.id_cotizacion
	left JOIN datos_facturacion df ON df.id_datos_facturacion = c.id_datos_facturacion
	WHERE (cot.nombre_cliente like @comodin OR df.rfc like @comodin) 
	AND DATEADD( month,-2,getDate()) <= cot.fecha_registro
	AND cot.id_sucursal = @idSucursal
	GROUP BY c.id_cliente,cot.nombre_cliente,cot.fecha_registro,cot.id_cotizacion;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaCotizacionPorDefault]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 2020-01-23
-- Description:	Solo muestra las cotizaciones validas del dia
-- =============================================

-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-08-03
-- Description:	Consulta de Cotizacion por Cliente o RFC
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaCotizacionPorDefault]
	@idSucursal AS int
AS
BEGIN
	SELECT 
		cot.id_cotizacion,
		cot.nombre_cliente as nombre,
		cot.fecha_registro,
		count(cd.id_cotizacion_detalle) total_articulos
	FROM cotizacion cot
	INNER JOIN cotizacion_detalle cd ON cd.id_cotizacion = cot.id_cotizacion
	WHERE convert(DATE,cot.fecha_registro) > CONVERT(DATE,DATEADD( day,-1,getDate()))
	AND cot.id_sucursal = @idSucursal
	AND cot.cotizacion_apartada = 1
	GROUP BY cot.nombre_cliente,cot.fecha_registro,cot.id_cotizacion;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaDatosArticuloConsolidacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 2020-01-04
-- Description:	Se redondeo los decimales a 2 crifras
-- =============================================
-- =============================================
-- Author:		Carolina Franco
-- Create date: 2019-06-26
-- Description:	Se restan devoluciones
-- =============================================
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2019-01-25
-- Description:	Consulta datos de articulos para consolidacion
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaDatosArticuloConsolidacion]
	@idConsolidacion as int
AS
BEGIN
	SELECT
		mad.cantidad - ISNULL((SELECT SUM(temp.cantidad) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle), 0) AS 'cantidad', 
		um.descripcion AS 'unidad_medida', 
		a.desc_super, 
		CONVERT(NUMERIC(20, 2),CASE WHEN mad.costo_unitario = 0 THEN 1 ELSE mad.costo_unitario END,2) AS 'costo_unitario',         
		CONVERT(NUMERIC(20, 2),mad.importe - (ISNULL((SELECT sum(temp.importe) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)),2) AS 'importe', 
		a.clave AS 'identificador', 
		a.clave_sat AS 'clave_articulo', 
		um.clave_sat AS 'clave_unidad', 
		CONVERT(NUMERIC(20, 2),CASE WHEN mad.importe = 0 THEN 1 * mad.cantidad ELSE mad.descuento - (ISNULL((SELECT sum(temp.descuento) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) END,2) AS 'descuento', 
		CONVERT(NUMERIC(20, 2),CASE WHEN mad.subtotal = 0 THEN 1 * mad.cantidad ELSE mad.subtotal - (ISNULL((SELECT sum(temp.subtotal) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) END,2) AS 'subtotal', 
		CONVERT(NUMERIC(20, 2),mad.iva - ISNULL((SELECT sum(temp.iva) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0),2) AS 'iva',
		CONVERT(NUMERIC(20, 2),mad.ieps- ISNULL((SELECT sum(temp.ieps) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0),2) AS 'ieps',
		imp.clave_sat AS 'clave_IVA', 
		CONVERT(NUMERIC(20, 2),imp.tasa/100,2) AS 'tasa_IVA', 
		imp2.clave_sat AS 'clave_IEPS', 
		CONVERT(NUMERIC(20, 2),imp2.tasa/100,2) AS 'tasa_IEPS' 
	FROM
		movimiento_almacen_detalle mad 
		INNER JOIN movimiento_almacen ma ON ma.id_movimiento_almacen = mad.id_movimiento_almacen 
		INNER JOIN articulo a ON a.id_articulo = mad.id_articulo
		INNER JOIN unidad_medida um ON um.id_unidad_medida = mad.id_unidad_medida
		LEFT JOIN impuesto imp ON imp.id_impuesto = a.id_iva_venta
		LEFT JOIN impuesto imp2 ON imp2.id_impuesto = a.id_ieps_venta
	WHERE
		ma.id_consolidacion = @idConsolidacion and ma.id_movimiento_almacen_tipo = 12 AND id_facturacion IS NULL AND mad.fecha_devuelto IS NULL;
END
--select
--mad.cantidad - ISNULL((SELECT sum(temp.cantidad) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle), 0) as cantidad, 
--um.descripcion as unidad_medida, 
--a.desc_super, 
--case when mad.costo_unitario = 0 then 1 else mad.costo_unitario end as costo_unitario,         
--mad.importe - (ISNULL((SELECT sum(temp.importe) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) as importe, 
--a.clave as identificador, 
--a.clave_sat as clave_articulo, 
--um.clave_sat as clave_unidad, 
--case when mad.importe = 0 then 1 * mad.cantidad else mad.descuento - (ISNULL((SELECT sum(temp.descuento) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) end as descuento, 
--case when mad.subtotal = 0 then 1 * mad.cantidad else mad.subtotal - (ISNULL((SELECT sum(temp.subtotal) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) end as subtotal, 
--mad.iva - ISNULL((SELECT sum(temp.iva) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0) as iva,
--mad.ieps- ISNULL((SELECT sum(temp.ieps) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0) as ieps,
--imp.clave_sat as clave_IVA, 
--imp.tasa/100 as tasa_IVA, 
--imp2.clave_sat as clave_IEPS, 
--imp2.tasa/100 as tasa_IEPS 
--from 
--movimiento_almacen_detalle mad 
--inner join movimiento_almacen ma on ma.id_movimiento_almacen = mad.id_movimiento_almacen 
--inner join articulo a on a.id_articulo = mad.id_articulo
--inner join unidad_medida um on um.id_unidad_medida = mad.id_unidad_medida
--left join impuesto imp on imp.id_impuesto = a.id_iva_venta
--left join impuesto imp2 on imp2.id_impuesto = a.id_ieps_venta
--where 
--ma.id_consolidacion = @idConsolidacion and ma.id_movimiento_almacen_tipo = 12 AND id_facturacion IS NULL AND mad.fecha_devuelto IS NULL
GO
/****** Object:  StoredProcedure [dbo].[spConsultaDatosArticuloConsolidacionPendiente]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 2020-01-04
-- Description:	Se redondeo los decimales a 2 crifras
-- =============================================
-- =============================================
-- Author:		Carolina Franco
-- Create date: 2019-06-26
-- Description:	Se restan devoluciones
-- =============================================
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2019-01-25
-- Description:	Consulta datos de articulos para consolidacion
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaDatosArticuloConsolidacionPendiente]
	@idConsolidacion as int
AS
BEGIN
	SELECT
		mad.cantidad - ISNULL((SELECT SUM(temp.cantidad) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle), 0)  AS 'cantidad', 
		um.descripcion AS 'unidad_medida', 
		a.desc_super, 
		CONVERT(NUMERIC(20, 2),CASE WHEN mad.costo_unitario = 0 THEN 1 ELSE mad.costo_unitario END,2) AS 'costo_unitario',     
		CONVERT(NUMERIC(20, 2),mad.importe - (ISNULL((SELECT SUM(temp.importe) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)),2) AS 'importe', 
		a.clave AS 'identificador', 
		a.clave_sat AS 'clave_articulo', 
		um.clave_sat AS 'clave_unidad', 
		CONVERT(NUMERIC(20, 2),CASE WHEN mad.importe = 0 THEN 1 * mad.cantidad ELSE mad.descuento - (ISNULL((SELECT SUM(temp.descuento) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) END,2) AS 'descuento', 
		CONVERT(NUMERIC(20, 2),CASE WHEN mad.subtotal = 0 THEN 1 * mad.cantidad ELSE mad.subtotal - (ISNULL((SELECT SUM(temp.subtotal) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) END,2) AS 'subtotal', 
		CONVERT(NUMERIC(20, 2),mad.iva - ISNULL((SELECT SUM(temp.iva) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0),2) AS 'iva',
		CONVERT(NUMERIC(20, 2),mad.ieps- ISNULL((SELECT SUM(temp.ieps) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0),2) AS 'ieps',
		imp.clave_sat AS 'clave_IVA', 
		CONVERT(NUMERIC(20, 2),imp.tasa/100,2) AS 'tasa_IVA', 
		imp2.clave_sat AS 'clave_IEPS', 
		CONVERT(NUMERIC(20, 2),imp2.tasa/100,2) AS 'tasa_IEPS' 
	FROM
		movimiento_almacen_detalle mad 
		INNER JOIN movimiento_almacen ma ON ma.id_movimiento_almacen = mad.id_movimiento_almacen 
		INNER JOIN articulo a ON a.id_articulo = mad.id_articulo
		INNER JOIN unidad_medida um ON um.id_unidad_medida = mad.id_unidad_medida
		LEFT JOIN impuesto imp ON imp.id_impuesto = a.id_iva_venta
		LEFT JOIN impuesto imp2 ON imp2.id_impuesto = a.id_ieps_venta
	WHERE
		ma.id_consolidacion = @idConsolidacion AND ma.id_movimiento_almacen_tipo = 12 AND id_facturacion IS NULL AND mad.fecha_devuelto IS NULL;
END
--select
--mad.cantidad - ISNULL((SELECT sum(temp.cantidad) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle), 0) as cantidad, 
--um.descripcion as unidad_medida, 
--a.desc_super, 
--case when mad.costo_unitario = 0 then 1 else mad.costo_unitario end as costo_unitario,         
--mad.importe - (ISNULL((SELECT sum(temp.importe) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) as importe, 
--a.clave as identificador, 
--a.clave_sat as clave_articulo, 
--um.clave_sat as clave_unidad, 
--case when mad.importe = 0 then 1 * mad.cantidad else mad.descuento - (ISNULL((SELECT sum(temp.descuento) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) end as descuento, 
--case when mad.subtotal = 0 then 1 * mad.cantidad else mad.subtotal - (ISNULL((SELECT sum(temp.subtotal) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) end as subtotal, 
--mad.iva - ISNULL((SELECT sum(temp.iva) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0) as iva,
--mad.ieps- ISNULL((SELECT sum(temp.ieps) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0) as ieps,
--imp.clave_sat as clave_IVA, 
--imp.tasa/100 as tasa_IVA, 
--imp2.clave_sat as clave_IEPS, 
--imp2.tasa/100 as tasa_IEPS 
--from 
--movimiento_almacen_detalle mad 
--inner join movimiento_almacen ma on ma.id_movimiento_almacen = mad.id_movimiento_almacen 
--inner join articulo a on a.id_articulo = mad.id_articulo
--inner join unidad_medida um on um.id_unidad_medida = mad.id_unidad_medida
--left join impuesto imp on imp.id_impuesto = a.id_iva_venta
--left join impuesto imp2 on imp2.id_impuesto = a.id_ieps_venta
--where 
--ma.id_consolidacion = @idConsolidacion and ma.id_movimiento_almacen_tipo = 12 AND id_facturacion IS NULL AND mad.fecha_devuelto IS NULL
GO
/****** Object:  StoredProcedure [dbo].[spConsultaDatosArticuloFacturacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 2020-01-04
-- Description:	Se redondeo los decimales a 2 crifras
-- =============================================
-- =============================================
-- Author:		Carolina Franco
-- Create date: 2019-06-26
-- Description:	Se restan devoluciones
-- =============================================
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-11-26
-- Description:	Consulta datos de articulos para facturacion
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaDatosArticuloFacturacion]
	@folios as varchar(8000)
AS
BEGIN
	SELECT
		mad.cantidad - ISNULL((SELECT sum(temp.cantidad) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle), 0) AS 'cantidad', 
		um.descripcion AS 'unidad_medida', 
		a.desc_super, 
		CASE WHEN mad.costo_unitario = 0 THEN 1.00 ELSE CONVERT(NUMERIC(20, 2), mad.costo_unitario, 2) END AS 'costo_unitario',
		CONVERT(NUMERIC(20, 2),mad.importe - (ISNULL((SELECT sum(temp.importe) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)), 2) AS 'importe', 
		a.clave AS 'identificador', 
		a.clave_sat AS 'clave_articulo', 
		um.clave_sat AS 'clave_unidad', 
		CONVERT(NUMERIC(20, 2),CASE WHEN mad.importe = 0 THEN 1 * mad.cantidad ELSE mad.descuento - (ISNULL((SELECT sum(temp.descuento) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) END, 2) AS 'descuento', 
		CONVERT(NUMERIC(20, 2),CASE WHEN mad.subtotal = 0 THEN 1 * mad.cantidad ELSE mad.subtotal - (ISNULL((SELECT sum(temp.subtotal) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) END, 2) AS 'subtotal', 
		CONVERT(NUMERIC(20, 2),mad.iva - ISNULL((SELECT sum(temp.iva) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0), 2) AS 'iva',
		CONVERT(NUMERIC(20, 2),mad.ieps- ISNULL((SELECT sum(temp.ieps) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0), 2) AS 'ieps',
		imp.clave_sat AS 'clave_IVA', 
		CONVERT(NUMERIC(20, 2),imp.tasa/100, 2) AS 'tasa_IVA', 
		imp2.clave_sat AS 'clave_IEPS', 
		CONVERT(NUMERIC(20, 2),imp2.tasa/100, 2) AS 'tasa_IEPS' 
	FROM 
		movimiento_almacen_detalle mad 
		INNER JOIN movimiento_almacen ma ON ma.id_movimiento_almacen = mad.id_movimiento_almacen 
		INNER JOIN articulo a ON a.id_articulo = mad.id_articulo
		INNER JOIN unidad_medida um ON um.id_unidad_medida = mad.id_unidad_medida
		LEFT JOIN impuesto imp ON imp.id_impuesto = a.id_iva_venta
		LEFT JOIN impuesto imp2 ON imp2.id_impuesto = a.id_ieps_venta
	WHERE 
		ma.folio IN (SELECT Value FROM funcListToTableString(@folios,',')) AND ma.id_movimiento_almacen_tipo = 12 AND 
		mad.fecha_devuelto IS NULL AND id_facturacion IS NULL AND id_consolidacion IS NULL ORDER BY mad.consecutivo ASC;

	--select
	--mad.cantidad - ISNULL((SELECT sum(temp.cantidad) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle), 0) as cantidad, 
	--um.descripcion as unidad_medida, 
	--a.desc_super, 
	--case when mad.costo_unitario = 0 then 1 else mad.costo_unitario end as costo_unitario,         
	--mad.importe - (ISNULL((SELECT sum(temp.importe) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) as importe, 
	--a.clave as identificador, 
	--a.clave_sat as clave_articulo, 
	--um.clave_sat as clave_unidad, 
	--case when mad.importe = 0 then 1 * mad.cantidad else mad.descuento - (ISNULL((SELECT sum(temp.descuento) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) end as descuento, 
	--case when mad.subtotal = 0 then 1 * mad.cantidad else mad.subtotal - (ISNULL((SELECT sum(temp.subtotal) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) end as subtotal, 
	--mad.iva - ISNULL((SELECT sum(temp.iva) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0) as iva,
	--mad.ieps- ISNULL((SELECT sum(temp.ieps) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0) as ieps,
	--imp.clave_sat as clave_IVA, 
	--imp.tasa/100 as tasa_IVA, 
	--imp2.clave_sat as clave_IEPS, 
	--imp2.tasa/100 as tasa_IEPS 
	--from 
	--movimiento_almacen_detalle mad 
	--inner join movimiento_almacen ma on ma.id_movimiento_almacen = mad.id_movimiento_almacen 
	--inner join articulo a on a.id_articulo = mad.id_articulo
	--inner join unidad_medida um on um.id_unidad_medida = mad.id_unidad_medida
	--left join impuesto imp on imp.id_impuesto = a.id_iva_venta
	--left join impuesto imp2 on imp2.id_impuesto = a.id_ieps_venta
	--where ma.folio in (select Value from funcListToTableString(@folios,',')) and ma.id_movimiento_almacen_tipo = 12 and id_facturacion is null and id_consolidacion is null and mad.fecha_devuelto IS NULL;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaDatosArticuloFacturacionPendiente]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 2020-01-04
-- Description:	Se redondeo los decimales a 2 crifras
-- =============================================
-- =============================================
-- Author:		Carolina Franco
-- Create date: 2019-06-26
-- Description:	Se restan devoluciones
-- =============================================
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2019-02-27
-- Description:	Consulta datos de articulos para facturacion pendiente
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaDatosArticuloFacturacionPendiente]
	@folios as varchar(8000)
AS
BEGIN
	SELECT
		mad.cantidad - ISNULL((SELECT sum(temp.cantidad) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle), 0) AS 'cantidad', 
		um.descripcion AS 'unidad_medida', 
		a.desc_super, 
		CASE WHEN mad.costo_unitario = 0 THEN 1.00 ELSE CONVERT(NUMERIC(20, 2), mad.costo_unitario, 2) END AS 'costo_unitario',
		CONVERT(NUMERIC(20, 2),mad.importe - (ISNULL((SELECT sum(temp.importe) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)), 2) AS 'importe', 
		a.clave AS 'identificador', 
		a.clave_sat AS 'clave_articulo', 
		um.clave_sat AS 'clave_unidad', 
		CONVERT(NUMERIC(20, 2),CASE WHEN mad.importe = 0 THEN 1 * mad.cantidad ELSE mad.descuento - (ISNULL((SELECT sum(temp.descuento) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) END, 2) AS 'descuento', 
		CONVERT(NUMERIC(20, 2),CASE WHEN mad.subtotal = 0 THEN 1 * mad.cantidad ELSE mad.subtotal - (ISNULL((SELECT sum(temp.subtotal) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) END, 2) AS 'subtotal', 
		CONVERT(NUMERIC(20, 2),mad.iva - ISNULL((SELECT sum(temp.iva) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0), 2) AS 'iva',
		CONVERT(NUMERIC(20, 2),mad.ieps- ISNULL((SELECT sum(temp.ieps) FROM movimiento_almacen_detalle AS temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0), 2) AS 'ieps',
		imp.clave_sat AS 'clave_IVA', 
		CONVERT(NUMERIC(20, 2),imp.tasa/100, 2) AS 'tasa_IVA', 
		imp2.clave_sat AS 'clave_IEPS', 
		CONVERT(NUMERIC(20, 2),imp2.tasa/100, 2) AS 'tasa_IEPS' 
	FROM 
		movimiento_almacen_detalle mad 
		INNER JOIN movimiento_almacen ma ON ma.id_movimiento_almacen = mad.id_movimiento_almacen 
		INNER JOIN articulo a ON a.id_articulo = mad.id_articulo
		INNER JOIN unidad_medida um ON um.id_unidad_medida = mad.id_unidad_medida
		LEFT JOIN impuesto imp ON imp.id_impuesto = a.id_iva_venta
		LEFT JOIN impuesto imp2 ON imp2.id_impuesto = a.id_ieps_venta
	WHERE 
		ma.folio IN (SELECT Value FROM funcListToTableString(@folios,',')) AND ma.id_movimiento_almacen_tipo = 12 AND 
		mad.fecha_devuelto IS NULL ORDER BY mad.consecutivo ASC;

	--select
	--mad.cantidad - ISNULL((SELECT sum(temp.cantidad) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle), 0) as cantidad, 
	--um.descripcion as unidad_medida, 
	--a.desc_super, 
	--case when mad.costo_unitario = 0 then 1 else mad.costo_unitario end as costo_unitario,         
	--mad.importe - (ISNULL((SELECT sum(temp.importe) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) as importe, 
	--a.clave as identificador, 
	--a.clave_sat as clave_articulo, 
	--um.clave_sat as clave_unidad, 
	--case when mad.importe = 0 then 1 * mad.cantidad else mad.descuento - (ISNULL((SELECT sum(temp.descuento) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) end as descuento, 
	--case when mad.subtotal = 0 then 1 * mad.cantidad else mad.subtotal - (ISNULL((SELECT sum(temp.subtotal) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0)) end as subtotal, 
	--mad.iva - ISNULL((SELECT sum(temp.iva) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0) as iva,
	--mad.ieps- ISNULL((SELECT sum(temp.ieps) FROM movimiento_almacen_detalle as temp WHERE temp.id_referencia_detalle = mad.id_movimiento_almacen_detalle),0) as ieps,
	--imp.clave_sat as clave_IVA, 
	--imp.tasa/100 as tasa_IVA, 
	--imp2.clave_sat as clave_IEPS, 
	--imp2.tasa/100 as tasa_IEPS 
	--from 
	--movimiento_almacen_detalle mad 
	--inner join movimiento_almacen ma on ma.id_movimiento_almacen = mad.id_movimiento_almacen 
	--inner join articulo a on a.id_articulo = mad.id_articulo
	--inner join unidad_medida um on um.id_unidad_medida = mad.id_unidad_medida
	--left join impuesto imp on imp.id_impuesto = a.id_iva_venta
	--left join impuesto imp2 on imp2.id_impuesto = a.id_ieps_venta
	--where ma.folio in (select Value from funcListToTableString(@folios,',')) and ma.id_movimiento_almacen_tipo = 12 and mad.fecha_devuelto IS NULL;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaDatosFacturacionPendiente]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2019-02-27
-- Description:	Consultar datos facturacion pendiente
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaDatosFacturacionPendiente]
	@idCliente as int
AS
BEGIN
	SELECT 
		df.id_datos_facturacion
      ,df.rfc
      ,df.razon_social
      ,df.id_uso_cfdi
      ,df.calle
      ,df.no_exterior
      ,df.no_interior
      ,df.id_cp
      ,df.id_estado
      ,df.id_municipio
      ,df.id_colonia
      ,df.email
	  ,uc.clave_sat as uso_cfdi
	  ,uc.id_uso_cfdi as id_uso_cfdi
	  FROM cliente c 
	  INNER JOIN datos_facturacion df ON df.id_datos_facturacion = c.id_datos_facturacion
	  INNER JOIN uso_cfdi uc ON uc.id_uso_cfdi = df.id_uso_cfdi
	  WHERE c.id_cliente = @idCliente
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaDatosSesion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Mofidificacion: caros negrete
-- Create date: 2018-06-17
-- Description:	
-- =============================================

CREATE PROCEDURE [dbo].[spConsultaDatosSesion]
    @Pidusuario as int,
	@PidCaja as int
AS
BEGIN
declare @Usuario as nvarchar(50)
declare @Caja as nvarchar(50)
declare @Sucursal as nvarchar(50)

	select @Usuario = nombre from usuario where id_usuario = @Pidusuario
	select @Caja = c.nombre , @Sucursal = s.nombre from caja c lEFT JOIN sucursal s ON s.id_sucursal = c.id_sucursal where id_caja = @PidCaja

	select @Sucursal as sucursal, @Usuario as usuario , @Caja as caja
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaDenominacionPorDescripcion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 10.mayo.2018
-- Description:	Consulta denominación por descripcion
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaDenominacionPorDescripcion]
	@descripcion as nvarchar(100)
AS
BEGIN
	SELECT * FROM denominacion WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaDenominacionPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 10.mayo.2018
-- Description:	Consulta denominaci�n por ID
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaDenominacionPorId]
	@id as int
AS
BEGIN
	SELECT * FROM denominacion WHERE id_denominacion = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaDetalleCotizacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 2020-02-04
-- Description:	se corrigio los valores null que   
--              no permiten jalar la cotizacion
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-06-21
-- Description:	Crea spConsultaDetalleCotizacion
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaDetalleCotizacion]
	@idCotizacion	AS	INT
AS
BEGIN
	SELECT
		cd.id_cotizacion_detalle,
		cd.id_cotizacion,
		cd.id_articulo,
		cd.consecutivo,
		cd.cantidad,
		cd.id_unidad_medida,
		cd.id_almacen,
		a.clave,
		a.desc_super,
		a.desc_mayoreo,
		um.descripcion AS descripcion_unidad,
		ISNULL(a.id_agrupador_articulo,109) AS id_agrupador_articulo,
		iva.tasa AS tasaIVA,
		ieps.tasa AS tasaIEPS,
		f.clave AS clave_familia,
		ISNULL(aa.clave,361) AS clave_agrupador,
		ln.clave AS clave_linea_negocio,
		CONVERT(BIT,um.pesable) AS pesable,
		a.relacion_venta
	FROM 
		cotizacion_detalle cd
		LEFT JOIN articulo a ON cd.id_articulo = a.id_articulo
		LEFT JOIN unidad_medida um ON cd.id_unidad_medida = um.id_unidad_medida
		LEFT JOIN impuesto iva ON a.id_iva_venta = iva.id_impuesto
		LEFT JOIN impuesto ieps ON a.id_ieps_venta = ieps.id_impuesto
		LEFT JOIN agrupador_articulo aa ON a.id_agrupador_articulo = aa.id_agrupador_articulo
		LEFT JOIN familia f ON a.id_familia = f.id_familia
		LEFT JOIN linea_negocio ln ON a.id_linea_negocio = ln.id_linea_negocio
	WHERE 
		cd.id_cotizacion = @idCotizacion
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaFacturacionPorFolio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 24 junio 2018
-- Description:	Consulta de Facturacion por folio
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaFacturacionPorFolio]
	@folio as nvarchar(40)
AS
BEGIN
	
	SELECT * FROM facturacion where folio_fiscal = @folio;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaFacturasPendientes]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaFacturasPendientes]
AS
BEGIN
    select
        ISNUll(f.id_facturacion,0) as id_facturacion,
        ISNUll(con.id_consolidacion,0) as id_consolidacion,
        f.fecha_generado,
        ISNULL((case when (con.id_consolidacion is not null)
            then  (select folio from consolidacion where id_consolidacion = con.id_consolidacion)
            when (con.id_consolidacion is  null)
            then  (stuff ((select ',' + folio from movimiento_almacen where id_facturacion = f.id_facturacion FOR XML PATH('')),1,1,''))
            end),0)as venta,
        f.subtotal,
        f.iva+f.ieps as impuesto,
        f.descuento,
        f.total,
        ISNULL(f.error,'')as error,
		f.id_cliente,
		ISNULL(nombre,'') as nombre,	
		uc.clave_sat as uso_cfdi,
		uc.id_uso_cfdi
    from facturacion f 
	LEFT JOIN consolidacion con ON con.id_facturacion = f.id_facturacion
	LEFT JOIN cliente c On c.id_cliente = f.id_cliente
	inner join uso_cfdi uc on uc.id_uso_cfdi = f.id_uso_cfdi where folio_fiscal is null
    order by f.fecha_generado DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaFacturasPendientesPorFecha]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaFacturasPendientesPorFecha]
	@fechaIni as Datetime,
	@fechaFin as Datetime

AS
BEGIN
	 select
        ISNUll(f.id_facturacion,0) as id_facturacion,
        ISNUll(con.id_consolidacion,0) as id_consolidacion,
        f.fecha_generado,
        ISNULL((case when (con.id_consolidacion is not null)
            then  (select folio from consolidacion where id_consolidacion = con.id_consolidacion)
            when (con.id_consolidacion is  null)
            then  (stuff ((select ',' + folio from movimiento_almacen where id_facturacion = f.id_facturacion FOR XML PATH('')),1,1,''))
            end),0)as venta,
        f.subtotal,
        f.iva+f.ieps as impuesto,
        f.descuento,
        f.total,
        ISNULL(f.error,'')as error,
		f.id_cliente,
		ISNULL(nombre,'') as nombre,	
		uc.clave_sat as uso_cfdi,
		uc.id_uso_cfdi
    from facturacion f 
	LEFT JOIN consolidacion con ON con.id_facturacion = f.id_facturacion
	LEFT JOIN cliente c On c.id_cliente = f.id_cliente
	inner join uso_cfdi uc on uc.id_uso_cfdi = f.id_uso_cfdi
	where folio_fiscal is null
	and fecha_generado >= @fechaIni and  fecha_generado <= @fechaFin
	order by fecha_generado DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaFechaProductosRecargas]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2019-04-10
-- Description:	Consulta fecha ultima actualizacion de productos de recargas
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaFechaProductosRecargas]
AS
BEGIN
	SELECT max(fecha_registro) FROM producto_recargas;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaFolio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 15.Febrero.2020
-- Description:	Se modifico para que muestre los totales 
--              correctos si tiene devoluciones el ticket
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaFolio]
	@folio AS NVARCHAR(50)
AS
BEGIN
	DECLARE @mc          AS NVARCHAR(40)
	DECLARE @consolidado AS INT
	DECLARE @facturacion AS INT
	DECLARE @devuelto    AS INT
	DECLARE @existe      AS INT
	DECLARE @desc        AS INT
	DECLARE @articulos   AS INT
	DECLARE @total       AS DECIMAL(16,2)
	DECLARE @date        AS DATE
	DECLARE @subTotal    AS DECIMAL(16,2)
	DECLARE @iva         AS DECIMAL(16,2)
	DECLARE @ieps        AS DECIMAL(16,2)

	SET @ieps        = 0;
	SET @iva         = 0;
	SET @mc          = 0;
	SET @consolidado = 0;
	SET @facturacion = 0;
	SET @devuelto    = 0;
	SET @existe      = 0;
	SET @total       = 0;
	SET @desc        = 0;
	SET @articulos   = 0;
	sET @subTotal    = 0;
	SET @date        = GETDATE();

	SELECT @consolidado = ISNULL(id_consolidacion,0)
	FROM [movimiento_almacen] WHERE [folio] = @folio

	SELECT @facturacion = ISNULL(id_facturacion,0)
	FROM [movimiento_almacen] WHERE [folio] = @folio

	SELECT @devuelto = ISNULL(devuelto,0)
	FROM [movimiento_almacen] WHERE [folio] = @folio

	SELECT @existe = ISNULL(id_movimiento_almacen,0)
	FROM [movimiento_almacen] WHERE [folio] = @folio

	IF(@existe!=0)
	BEGIN
		IF(@consolidado!=0 OR @facturacion!=0 OR @devuelto != 0)
		BEGIN
			IF(@consolidado!=0)
			BEGIN
				SET @mc = 'Consolidado';
				SELECT @mc AS folio,
				@total AS total, 
				@date AS fecha,
				@desc AS descuento,
				@articulos AS articulos,
				@subtotal AS subtotal,
				@iva AS iva,
				@ieps AS ieps	
			END
			ELSE IF(@facturacion!=0)
			BEGIN
				SET @mc = 'Facturado';
				SELECT @mc AS folio,
				@total AS total, 
				@date AS fecha,
				@desc AS descuento,
				@articulos AS articulos,
				@subtotal AS subtotal,
				@iva AS iva,
				@ieps AS ieps	
			END
			ELSE IF(@devuelto != 0)
			BEGIN
				SET @mc = 'Devuelto';
				SELECT @mc AS folio,
				@total AS total, 
				@date AS fecha,
				@desc AS descuento,
				@articulos AS articulos,
				@subtotal AS subtotal,
				@iva AS iva,
				@ieps AS ieps	
			END
		END
		ELSE
		BEGIN
			SELECT 
			[folio] AS folio,
			[total_neto] - (SELECT ISNULL(SUM(total_neto),0) FROM movimiento_almacen WHERE referencia=@folio)AS total,
			[fecha_registro] AS fecha,
			CAST(ISNULL((SELECT SUM(cantidad) from movimiento_almacen_detalle WHERE id_movimiento_almacen = m.id_movimiento_almacen AND importe = 0),0) AS INT) AS descuento,
			(SELECT COUNT(id_articulo) FROM movimiento_almacen_detalle WHERE id_movimiento_almacen = m.id_movimiento_almacen AND fecha_devuelto IS NULL) AS articulos,
			subtotal - (SELECT ISNULL(SUM(subtotal),0) FROM movimiento_almacen WHERE referencia=@folio) AS subtotal,
			total_iva - (SELECT ISNULL(SUM(total_iva),0) FROM movimiento_almacen WHERE referencia=@folio) AS iva, 
			total_ieps - (SELECT ISNULL(SUM(total_ieps),0) FROM movimiento_almacen WHERE referencia=@folio) AS ieps
			FROM [movimiento_almacen] m
			WHERE [folio] = @folio
			--SELECT 
			--[folio] as folio,
			--[total_neto] as total,
			--[fecha_registro] as fecha,
			--CAST(ISNULL((select sum(ISNULL(cantidad,0)) from movimiento_almacen_detalle where id_movimiento_almacen = m.id_movimiento_almacen and importe =0),0) as int)as descuento,
			--(select count(id_articulo) from movimiento_almacen_detalle where id_movimiento_almacen = m.id_movimiento_almacen)as articulos,
			--subtotal as subtotal,
			--total_iva as iva, 
			--total_ieps as ieps
			--FROM [movimiento_almacen] m 
			--LEFT OUTER JOIN [proveedor] ON
			--[proveedor].[id_proveedor] = m.[id_proveedor]
			--LEFT OUTER JOIN [cliente] ON
			--[cliente].[id_cliente] = m.[id_cliente]
			--WHERE [folio] = @folio
		END
	END
	ELSE
	BEGIN
		SET @mc = 'NoExiste';
		SELECT 
		@mc AS folio,
		@total AS total,
		@date AS fecha,
		@desc AS descuento,
		@articulos AS articulos,
		@subtotal AS subtotal,
		@iva AS iva,
		@ieps AS ieps	
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaFolioFiscal]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE 
-- Create date: 06.julio.2018
-- Description:	sp
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaFolioFiscal]
	@id as int
AS
BEGIN
	SELECT 
	RF_IDREGI,
	ISNULL(RF_FECREG,GETDATE()) as RF_FECREG,
	ISNULL(RF_RFCPRO,'--') as RF_RFCPRO,
	ISNULL(RF_FOLFIS,'--') as RF_FOLFIS,
	ISNULL(RF_IMPORT,0) as RF_IMPORT,
	ISNULL(RF_Registrada,0) as RF_Registrada
    FROM REGFACTCOMPRAS 
	WHERE RF_IDREGI = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaFormaDePagoPorDescripcion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 11.mayo.2018
-- Description:	Consulta forma de pago por descripción
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaFormaDePagoPorDescripcion]
	@descripcion as nvarchar(100)
AS
BEGIN
	SELECT * FROM forma_pago WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaFormaDePagoPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 11.mayo.2018
-- Description:	Consulta forma de pago por ID
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaFormaDePagoPorId]
	@id as int
AS
BEGIN
	SELECT * FROM forma_pago WHERE id_forma_pago = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaFormaPagoMaxima]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Aldo Barugola
-- Create date: 2018/11/29
-- Description:	ConsultarOrdenMaxima
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaFormaPagoMaxima]
	@folios as varchar(8000)
AS
BEGIN
	SELECT TOP 1 
		fp.clave_sat 
	FROM movimiento_caja mc 
	INNER JOIN forma_pago fp 
		ON fp.id_forma_pago = mc.id_forma_pago 
	WHERE folio_venta in(select Value from funcListToTableString(@folios,',')) ORDER BY mc.importe_total DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaFormaPagoMaximaConsolidacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Aldo Barugola
-- Create date: 2018/11/29
-- Description:	ConsultarOrdenMaxima
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaFormaPagoMaximaConsolidacion]
	@idConsolidacion as int
AS
BEGIN
	SELECT TOP 1 
		fp.clave_sat 
	FROM movimiento_caja mc 
	INNER JOIN forma_pago fp 
		ON fp.id_forma_pago = mc.id_forma_pago 
	INNER JOIN movimiento_almacen ma ON ma.folio = mc.folio_venta
	WHERE ma.id_consolidacion = @idConsolidacion ORDER BY mc.importe_total DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaFormasPagoTicket]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola	
-- Create date: 2019-01-04
-- Description:	Consulta Formas de pago de ticket
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaFormasPagoTicket]
	@folio as nvarchar(12)
AS
BEGIN
	SELECT 
		fp.descripcion as formaPago, 
		mc.importe_total as importe 
	FROM movimiento_caja mc 
		INNER JOIN forma_pago fp ON fp.id_forma_pago = mc.id_forma_pago 
	WHERE folio_venta = @folio;


END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaIdPerfilPorNombre]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaIdPerfilPorNombre]
	@nombre	AS	NVARCHAR(50)
AS
BEGIN
	DECLARE @idPerfil AS INT;

	SET @idPerfil = NULL;

	SELECT @idPerfil = id_perfil FROM perfil WHERE nombre = @nombre

	SELECT ISNULL(@idPerfil, 0) AS id_perfil
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaInfoFormatoAjusteCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-05
-- Description:	Consulta formato ajuste de caja
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaInfoFormatoAjusteCaja]
	@folio as nvarchar(12),
	@tipoMovimiento as int
AS
BEGIN
select mc.id_movimiento_caja,
	mc.id_movimiento_caja_tipo,
	mc.id_movimiento_caja_concepto,
	s.nombre as sucursal,
	u.nombre as cajero,
	mc.fecha_registro,
	c.no_caja,
	u.nombre as autorizo,
	mc.folio,
	mc.importe_total,
	ISNULL(mc.observaciones,'') as observaciones

 from movimiento_caja mc 
 inner join sucursal s on s.id_sucursal = mc.id_sucursal 
 inner join caja c on c.id_caja = mc.id_caja
 inner join usuario u on u.id_usuario = mc.id_usuario_autorizo
	where mc.folio = @folio and mc.id_movimiento_caja_tipo = @tipoMovimiento;

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaInfoFormatoDesgloce]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-05
-- Description:	Consulta formato desgloce de caja
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaInfoFormatoDesgloce]
	@idMovimientoCaja as int
AS
BEGIN
select md.id_movimiento_caja_desglose,
	d.descripcion as denominacion,
	md.cantidad as cantidad,
	(md.cantidad * d.monto) as total

 from movimiento_caja_desglose md
 inner join denominacion d on d.id_denominacion = md.id_denominacion
	where md.id_movimiento_caja = @idMovimientoCaja;

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaLineaDeNegocioPorClave]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaLineaDeNegocioPorClave]
	@clave as nvarchar(50)
AS
BEGIN
	SELECT * FROM linea_negocio WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaLineaDeNegocioPorDescripcion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaLineaDeNegocioPorDescripcion]
	@descripcion as nvarchar(50)
AS
BEGIN
	SELECT * FROM linea_negocio WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaLineaDePagoPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaLineaDePagoPorId]
	@id as int
AS
BEGIN
	SELECT * FROM linea_negocio WHERE id_linea_negocio = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaListaPromocionesActivas]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 09.Agosto.2018
-- Description:	Obtener todas las promociones activas
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaListaPromocionesActivas]
	@idSucursal AS INT
AS
BEGIN
	SELECT	id_promocion,
			clave,
			id_promocion_tipo,
			id_promocion_condicion,
			id_promocion_aplicacion,
			promos_por_venta,
			acumulable,
			limite_sucursal,
			id_proveedor,
			(SELECT ISNULL(SUM(aplicadas), 0) FROM promocion_venta pv WHERE pv.id_promocion = p.id_promocion) AS promosVendidas,
			ISNULL(cantidad, 0) AS cantidad
			FROM promocion p
			WHERE activo = 1 AND
			id_sucursal = @idSucursal AND vigencia_inicio <= CONVERT(date, GETDATE()) AND vigencia_fin >= CONVERT(date, GETDATE()) AND
			((SELECT ISNULL(SUM(aplicadas), 0) FROM promocion_venta pv
				WHERE pv.id_promocion = p.id_promocion) < limite_sucursal OR limite_sucursal = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaListaPromocionesCompraActivas]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--============================================
-- Author:		Saul Cruces
-- Create date: 31.agosto.2018
-- Description:	Alterar sp por ambigüedad de los campos cantidad
-- =============================================
--============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-05-18
-- Description:	Regresar valor de es_mayoreo
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaListaPromocionesCompraActivas]
	@idSucursal AS INT
AS
BEGIN
SELECT	pc.id_promocion,
		pc.clave,
		CASE WHEN id_referencia = 1 OR id_referencia = 6 THEN
			CASE WHEN ISNULL(pc.id_unidad_medida,0) = ISNULL(a.id_unidad_compra,-1)
				THEN pc.cantidad * a.relacion_venta ELSE pc.cantidad END
			ELSE pc.cantidad END AS cantidad,
		ISNULL(pc.id_unidad_medida,0) AS id_unidad_medida,
		ISNULL(es_mayoreo, 0) AS es_mayoreo
		FROM promocion_compra pc
		LEFT JOIN unidad_medida um ON um.id_unidad_medida=pc.id_unidad_medida
		LEFT JOIN promocion p ON p.id_promocion = pc.id_promocion
		LEFT JOIN articulo a ON pc.clave = a.clave
		WHERE p.activo = 1 AND
			p.id_sucursal = @idSucursal AND p.vigencia_inicio <= CONVERT(date, GETDATE()) AND
			p.vigencia_fin >= CONVERT(date, GETDATE()) AND
			((SELECT ISNULL(SUM(aplicadas), 0) FROM promocion_venta pv
				WHERE pv.id_promocion = p.id_promocion) < limite_sucursal OR limite_sucursal = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaListaPromocionesRegaloActivas]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--============================================
-- Author:		Saul Cruces
-- Create date: 31.agosto.2018
-- Description:	Alterar sp por ambigüedad de los campos cantidad
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaListaPromocionesRegaloActivas]
	@idSucursal AS INT
AS
BEGIN
SELECT	pr.id_promocion,
		art.id_articulo,
		art.clave,
		--pr.cantidad,
		(CASE WHEN art.id_unidad_compra = ISNULL(pr.id_unidad_medida, 0) THEN pr.cantidad * art.relacion_venta
			ELSE pr.cantidad END) AS cantidad,
		--ISNULL(pr.id_unidad_medida, 0) AS id_unidad_medida,
		art.id_unidad_venta AS id_unidad_medida,
		ISNULL(um.descripcion, 'S/N') AS sUnidad,
		art.desc_super,
		art.activo
		FROM promocion_regalo pr 
		LEFT JOIN articulo art ON art.id_articulo = pr.id_articulo
		--LEFT JOIN unidad_medida um ON um.id_unidad_medida = pr.id_unidad_medida
		LEFT JOIN unidad_medida um ON um.id_unidad_medida = art.id_unidad_venta
		LEFT JOIN promocion p ON p.id_promocion = pr.id_promocion
		WHERE p.activo = 1 AND
			p.id_sucursal = @idSucursal AND p.vigencia_inicio <= CONVERT(date, GETDATE()) AND
			p.vigencia_fin >= CONVERT(date, GETDATE()) AND
			((SELECT ISNULL(SUM(aplicadas), 0) FROM promocion_venta pv
				WHERE pv.id_promocion = p.id_promocion) < limite_sucursal OR limite_sucursal = 0)
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaMAEPorFolioMovimiento]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 20.abril.2019
-- Description:	Consulta MAE por tivker
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaMAEPorFolioMovimiento]
	@folio AS	nvarchar(20)
AS
BEGIN
	SELECT [id_movimiento_almacen]
		  ,[id_movimiento_almacen_tipo]
		  ,[id_sucursal]
		  ,[id_almacen]
		  ,[id_caja]
		  ,[folio]
		  ,[movimiento_almacen].[observaciones]
		  ,[subtotal]
		  ,[descuento]
		  ,[total_neto]
		  ,[fecha_registro]
		  ,[id_usuario_logueado]
		  ,[id_usuario_autorizo]
		  ,ISNULL([id_facturacion], 0) AS 'id_facturacion'
		  ,ISNULL([id_referencia], 0) AS 'id_referencia'
		  ,ISNULL([referencia], '') AS 'referencia'
		  ,ISNULL([codigo_autorizacion], '') AS 'codigo_autorizacion'
		  ,ISNULL([folio_fiscal], '') AS 'folio_fiscal'
		  ,ISNULL([id_sucursal_origen], 0) AS 'id_sucursal_origen'
		  ,ISNULL([id_sucursal_destino], 0) AS 'id_sucursal_destino'
		  ,ISNULL([id_almacen_origen], 0) AS 'id_almacen_origen'
		  ,ISNULL([movimiento_almacen].[id_proveedor], 0) AS 'id_proveedor'
		  ,ISNULL([proveedor].[nombre], '') AS 'nombre_proveedor'
		  ,ISNULL([proveedor].[clave], '') AS 'clave_proveedor'
		  ,ISNULL([movimiento_almacen].[id_cliente], 0) AS 'id_cliente'
		  ,ISNULL([cliente].[nombre], '') AS 'nombre_cliente'
		  ,ISNULL([id_consolidacion], 0) AS 'id_consolidacion'
		  ,ISNULL([fecha_cancelado], 0) AS 'fecha_cancelado'
		  ,ISNULL([devuelto], 0) AS 'devuelto'
	  FROM [movimiento_almacen]
	  LEFT OUTER JOIN [proveedor] ON
		[proveedor].[id_proveedor] = [movimiento_almacen].[id_proveedor]
	  LEFT OUTER JOIN [cliente] ON
		[cliente].[id_cliente] = [movimiento_almacen].[id_cliente]
	  WHERE [folio] = @folio
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaMAEPorIdMovimiento]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-07-10
-- Description:	Cambio fecha_devuelto por devuelto
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaMAEPorIdMovimiento]
	@idMovimiento as int
AS
BEGIN
	SELECT [id_movimiento_almacen]
		  ,[id_movimiento_almacen_tipo]
		  ,[id_sucursal]
		  ,[id_almacen]
		  ,[id_caja]
		  ,[folio]
		  ,[movimiento_almacen].[observaciones]
		  ,[subtotal]
		  ,[descuento]
		  ,[total_neto]
		  ,[fecha_registro]
		  ,[id_usuario_logueado]
		  ,[id_usuario_autorizo]
		  ,ISNULL([id_facturacion], 0) AS 'id_facturacion'
		  ,ISNULL([id_referencia], 0) AS 'id_referencia'
		  ,ISNULL([referencia], '') AS 'referencia'
		  ,ISNULL([codigo_autorizacion], '') AS 'codigo_autorizacion'
		  ,ISNULL([folio_fiscal], '') AS 'folio_fiscal'
		  ,ISNULL([id_sucursal_origen], 0) AS 'id_sucursal_origen'
		  ,ISNULL([id_sucursal_destino], 0) AS 'id_sucursal_destino'
		  ,ISNULL([id_almacen_origen], 0) AS 'id_almacen_origen'
		  ,ISNULL([movimiento_almacen].[id_proveedor], 0) AS 'id_proveedor'
		  ,ISNULL([proveedor].[nombre], '') AS 'nombre_proveedor'
		  ,ISNULL([proveedor].[clave], '') AS 'clave_proveedor'
		  ,ISNULL([movimiento_almacen].[id_cliente], 0) AS 'id_cliente'
		  ,ISNULL([cliente].[nombre], '') AS 'nombre_cliente'
		  ,ISNULL([id_consolidacion], 0) AS 'id_consolidacion'
		  ,ISNULL([fecha_cancelado], 0) AS 'fecha_cancelado'
		  ,ISNULL([devuelto], 0) AS 'devuelto'
	  FROM [movimiento_almacen]
	  LEFT OUTER JOIN [proveedor] ON
		[proveedor].[id_proveedor] = [movimiento_almacen].[id_proveedor]
	  LEFT OUTER JOIN [cliente] ON
		[cliente].[id_cliente] = [movimiento_almacen].[id_cliente]
	  WHERE [id_movimiento_almacen] = @idMovimiento
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaModuloNivelSeguridad]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-07-27
-- Description:	Consulta el modulo nivel seguridad, segundos entre cada toma
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaModuloNivelSeguridad]
	@idModulo as int
AS
BEGIN
	SELECT
		mns.id_nivel_seguridad,
		mns.id_modulo,
		ns.intervalo_toma
	FROM
		modulo_nivel_seguridad mns
		LEFT JOIN nivel_seguridad ns ON mns.id_nivel_seguridad = ns.id_nivel_seguridad
	WHERE
		id_modulo = @idModulo
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaMovimientoAlmacenDetalleArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-06-29
-- Description:	Ahora regresa registro si el artículo no tiene niveles de precio registrados
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-11-21
-- Description:	Busqueda por idAlmacen
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaMovimientoAlmacenDetalleArticulo]
	@idArticulo AS	INT,
	@idAlmacen	AS	INT
AS
BEGIN
	DECLARE @existencia AS DECIMAL(18,4)
	SET @existencia = 0
	SELECT @existencia = existencia_actual FROM articulo_existencia WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacen

	SELECT TOP 1
		a.relacion_compra, 
		a.relacion_venta,
		(CASE @idAlmacen WHEN 0 THEN 'Seleccione Almacen' ELSE CONVERT(VARCHAR,ISNULL(@existencia,0)) END) AS existencia_actual,
		ISNULL(ap.precio_venta,0) + (ISNULL(ap.precio_venta,0) * (ivaV.tasa /100)) + (ISNULL(ap.precio_venta,0) * (iepsV.tasa /100)) AS precio_venta,
		ISNULL(a.costo_ultimo,0) AS costo_ultimo,
		uc.descripcion AS unidad_compra,
		uv.descripcion AS unidad_venta
	FROM
		articulo a
		LEFT JOIN articulo_precio ap ON ap.id_articulo = a.id_articulo
		LEFT JOIN unidad_medida uc ON a.id_unidad_compra = uc.id_unidad_medida
		LEFT JOIN unidad_medida uv ON a.id_unidad_venta = uv.id_unidad_medida
		LEFT JOIN impuesto ivaV ON a.id_iva_venta = ivaV.id_impuesto
		LEFT JOIN impuesto iepsV ON a.id_ieps_venta = iepsV.id_impuesto
	WHERE
		a.id_articulo = @idArticulo AND
		(ap.no_orden = 1 OR ap.id_articulo IS NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaMovimientoAlmacenDetallePorIdMovimientoAlmacen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 30 Enero 2020
-- Description:	Solo muestra lo restante si es devolucion parcial
--              o no muestra los articulos ya devueltos
-- =============================================

-- =============================================
-- Author:		Aldo Barugola
-- Create date: 03 julio 2018
-- Description:	Restringir articulos ya devueltos
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaMovimientoAlmacenDetallePorIdMovimientoAlmacen]
	@idMovimientoAlmacen as int
AS
BEGIN	
	--SELECT mad.id_movimiento_almacen_detalle,a.id_articulo, a.desc_mayoreo FROM 
	--movimiento_almacen_detalle mad INNER JOIN articulo a ON a.id_articulo = mad.id_articulo 
	--WHERE mad.id_movimiento_almacen = @idMovimientoAlmacen and fecha_devuelto is null;
	SELECT id_movimiento_almacen_detalle,id_articulo,desc_mayoreo FROM (SELECT mad.id_movimiento_almacen_detalle AS 'id_movimiento_almacen_detalle',
	art.id_articulo AS 'id_articulo',art.desc_mayoreo AS 'desc_mayoreo',SUM(cantidad)+dbo.fnCantidadConDevolucion(@idMovimientoAlmacen,art.id_articulo) AS 'Cantidad',
	CASE WHEN dbo.fnCantidadConDevolucion(@idMovimientoAlmacen,art.id_articulo) < 0 THEN 'P' ELSE 'C' END AS 'Tipo' FROM movimiento_almacen_detalle mad INNER JOIN 
	articulo art ON art.id_articulo=mad.id_articulo WHERE mad.id_movimiento_almacen=@idMovimientoAlmacen AND fecha_devuelto IS NULL AND cantidad>=0
	GROUP BY mad.id_movimiento_almacen_detalle,art.id_articulo,art.desc_mayoreo,fecha_devuelto) tbl ORDER BY desc_mayoreo ASC ;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaMovimientoAlmacenPorFacturacionYTipo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 25 junio 2018
-- Description:	Consulta de Movimiento de Almacen por facturacion y tipo de movimiento
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaMovimientoAlmacenPorFacturacionYTipo]
	@idFacturacion as nvarchar(50),
	@idMovimientoTipo as int
AS
BEGIN
	
	SELECT [id_movimiento_almacen]
		  ,[id_movimiento_almacen_tipo]
		  ,[id_sucursal]
		  ,[id_almacen]
		  ,[id_caja]
		  ,[folio]
		  ,[movimiento_almacen].[observaciones]
		  ,[subtotal]
		  ,[descuento]
		  ,[total_neto]
		  ,[fecha_registro]
		  ,[id_usuario_logueado]
		  ,[id_usuario_autorizo]
		  ,ISNULL([id_facturacion], 0) AS 'id_facturacion'
		  ,ISNULL([id_referencia], 0) AS 'id_referencia'
		  ,ISNULL([referencia], '') AS 'referencia'
		  ,ISNULL([codigo_autorizacion], '') AS 'codigo_autorizacion'
		  ,ISNULL([folio_fiscal], '') AS 'folio_fiscal'
		  ,ISNULL([id_sucursal_origen], 0) AS 'id_sucursal_origen'
		  ,ISNULL([id_sucursal_destino], 0) AS 'id_sucursal_destino'
		  ,ISNULL([id_almacen_origen], 0) AS 'id_almacen_origen'
		  ,ISNULL([movimiento_almacen].[id_proveedor], 0) AS 'id_proveedor'
		  ,ISNULL([proveedor].[nombre], '') AS 'nombre_proveedor'
		  ,ISNULL([proveedor].[clave], '') AS 'clave_proveedor'
		  ,ISNULL([movimiento_almacen].[id_cliente], 0) AS 'id_cliente'
		  ,ISNULL([cliente].[nombre], '') AS 'nombre_cliente'
		  ,ISNULL([id_consolidacion], 0) AS 'id_consolidacion'
		  ,ISNULL([fecha_cancelado], 0) AS 'fecha_cancelado'
		  ,ISNULL([devuelto], 0) AS 'devuelto'
	  FROM [movimiento_almacen]
	  LEFT OUTER JOIN [proveedor] ON
		[proveedor].[id_proveedor] = [movimiento_almacen].[id_proveedor]
	  LEFT OUTER JOIN [cliente] ON
		[cliente].[id_cliente] = [movimiento_almacen].[id_cliente]
	  WHERE [id_facturacion] = @idFacturacion AND [id_movimiento_almacen_tipo] = @idMovimientoTipo;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaMovimientoAlmacenPorFolioYTipo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 24 junio 2018
-- Description:	Consulta de Movimiento de Almacen por folio y tipo de movimiento
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaMovimientoAlmacenPorFolioYTipo]
	@folio as nvarchar(40),
	@idMovimientoTipo as int
AS
BEGIN
	if @idMovimientoTipo = 16
			SELECT [id_movimiento_almacen]
			  ,[id_movimiento_almacen_tipo]
			  ,[id_sucursal]
			  ,[id_almacen]
			  ,[id_caja]
			  ,[folio]
			  ,[movimiento_almacen].[observaciones]
			  ,[subtotal]
			  ,[descuento]
			  ,[total_neto]
			  ,[fecha_registro]
			  ,[id_usuario_logueado]
			  ,[id_usuario_autorizo]
			  ,ISNULL([id_facturacion], 0) AS 'id_facturacion'
			  ,ISNULL([id_referencia], 0) AS 'id_referencia'
			  ,ISNULL([referencia], '') AS 'referencia'
			  ,ISNULL([codigo_autorizacion], '') AS 'codigo_autorizacion'
			  ,ISNULL([folio_fiscal], '') AS 'folio_fiscal'
			  ,ISNULL([id_sucursal_origen], 0) AS 'id_sucursal_origen'
			  ,ISNULL([id_sucursal_destino], 0) AS 'id_sucursal_destino'
			  ,ISNULL([id_almacen_origen], 0) AS 'id_almacen_origen'
			  ,ISNULL([movimiento_almacen].[id_proveedor], 0) AS 'id_proveedor'
			  ,ISNULL([proveedor].[nombre], '') AS 'nombre_proveedor'
			  ,ISNULL([proveedor].[clave], '') AS 'clave_proveedor'
			  ,ISNULL([movimiento_almacen].[id_cliente], 0) AS 'id_cliente'
			  ,ISNULL([cliente].[nombre], '') AS 'nombre_cliente'
			  ,ISNULL([id_consolidacion], 0) AS 'id_consolidacion'
			  ,ISNULL([fecha_cancelado], 0) AS 'fecha_cancelado'
			  ,ISNULL([devuelto], 0) AS 'devuelto'
		  FROM [movimiento_almacen]
		  LEFT OUTER JOIN [proveedor] ON
			[proveedor].[id_proveedor] = [movimiento_almacen].[id_proveedor]
		  LEFT OUTER JOIN [cliente] ON
			[cliente].[id_cliente] = [movimiento_almacen].[id_cliente]
		  WHERE [folio] = @folio AND [id_movimiento_almacen_tipo] in(4,5);
	else if @idMovimientoTipo = 17
			SELECT [id_movimiento_almacen]
			  ,[id_movimiento_almacen_tipo]
			  ,[id_sucursal]
			  ,[id_almacen]
			  ,[id_caja]
			  ,[folio]
			  ,[movimiento_almacen].[observaciones]
			  ,[subtotal]
			  ,[descuento]
			  ,[total_neto]
			  ,[fecha_registro]
			  ,[id_usuario_logueado]
			  ,[id_usuario_autorizo]
			  ,ISNULL([id_facturacion], 0) AS 'id_facturacion'
			  ,ISNULL([id_referencia], 0) AS 'id_referencia'
			  ,ISNULL([referencia], '') AS 'referencia'
			  ,ISNULL([codigo_autorizacion], '') AS 'codigo_autorizacion'
			  ,ISNULL([folio_fiscal], '') AS 'folio_fiscal'
			  ,ISNULL([id_sucursal_origen], 0) AS 'id_sucursal_origen'
			  ,ISNULL([id_sucursal_destino], 0) AS 'id_sucursal_destino'
			  ,ISNULL([id_almacen_origen], 0) AS 'id_almacen_origen'
			  ,ISNULL([movimiento_almacen].[id_proveedor], 0) AS 'id_proveedor'
			  ,ISNULL([proveedor].[nombre], '') AS 'nombre_proveedor'
			  ,ISNULL([proveedor].[clave], '') AS 'clave_proveedor'
			  ,ISNULL([movimiento_almacen].[id_cliente], 0) AS 'id_cliente'
			  ,ISNULL([cliente].[nombre], '') AS 'nombre_cliente'
			  ,ISNULL([id_consolidacion], 0) AS 'id_consolidacion'
			  ,ISNULL([fecha_cancelado], 0) AS 'fecha_cancelado'
			  ,ISNULL([devuelto], 0) AS 'devuelto'
		  FROM [movimiento_almacen]
		  LEFT OUTER JOIN [proveedor] ON
			[proveedor].[id_proveedor] = [movimiento_almacen].[id_proveedor]
		  LEFT OUTER JOIN [cliente] ON
			[cliente].[id_cliente] = [movimiento_almacen].[id_cliente]
		  WHERE [folio] = @folio AND [id_movimiento_almacen_tipo] in(8,9);
	else
		SELECT [id_movimiento_almacen]
			  ,[id_movimiento_almacen_tipo]
			  ,[id_sucursal]
			  ,[id_almacen]
			  ,[id_caja]
			  ,[folio]
			  ,[movimiento_almacen].[observaciones]
			  ,[subtotal]
			  ,[descuento]
			  ,[total_neto]
			  ,[fecha_registro]
			  ,[id_usuario_logueado]
			  ,[id_usuario_autorizo]
			  ,ISNULL([id_facturacion], 0) AS 'id_facturacion'
			  ,ISNULL([id_referencia], 0) AS 'id_referencia'
			  ,ISNULL([referencia], '') AS 'referencia'
			  ,ISNULL([codigo_autorizacion], '') AS 'codigo_autorizacion'
			  ,ISNULL([folio_fiscal], '') AS 'folio_fiscal'
			  ,ISNULL([id_sucursal_origen], 0) AS 'id_sucursal_origen'
			  ,ISNULL([id_sucursal_destino], 0) AS 'id_sucursal_destino'
			  ,ISNULL([id_almacen_origen], 0) AS 'id_almacen_origen'
			  ,ISNULL([movimiento_almacen].[id_proveedor], 0) AS 'id_proveedor'
			  ,ISNULL([proveedor].[nombre], '') AS 'nombre_proveedor'
			  ,ISNULL([proveedor].[clave], '') AS 'clave_proveedor'
			  ,ISNULL([movimiento_almacen].[id_cliente], 0) AS 'id_cliente'
			  ,ISNULL([cliente].[nombre], '') AS 'nombre_cliente'
			  ,ISNULL([id_consolidacion], 0) AS 'id_consolidacion'
			  ,ISNULL([fecha_cancelado], 0) AS 'fecha_cancelado'
			  ,ISNULL([devuelto], 0) AS 'devuelto'
		  FROM [movimiento_almacen]
		  LEFT OUTER JOIN [proveedor] ON
			[proveedor].[id_proveedor] = [movimiento_almacen].[id_proveedor]
		  LEFT OUTER JOIN [cliente] ON
			[cliente].[id_cliente] = [movimiento_almacen].[id_cliente]
		  WHERE [folio] = @folio AND [id_movimiento_almacen_tipo] = @idMovimientoTipo;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaMovimientoAlmacenTipoPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 02 julio 2018
-- Description:	Consulta de Orden Compra Detalle pendientes por Orden de Compra
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaMovimientoAlmacenTipoPorId]
	@idMovimientoAlmacenTipo as int
AS
BEGIN	
	select * from movimiento_almacen_tipo where id_movimiento_almacen_tipo = @idMovimientoAlmacenTipo;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaMovimientoCajaConceptoPorTipo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 19/08/2018
-- Description:	Consulta MovimientoCajaConcepto por MovimientoCajaTipo
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaMovimientoCajaConceptoPorTipo]
	@tipo as int
AS
BEGIN
	SELECT * FROM movimiento_caja_concepto WHERE id_movimiento_caja_tipo = @tipo
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaMovimientosQuePuedeVer]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-10-05
-- Description:	Consulta los movimientos de almacen que puede ver para mostrar en el menú
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaMovimientosQuePuedeVer]
	@idPerfil	AS	INT
AS
BEGIN

	DECLARE @table TABLE
		(
			idMovimientoTipo		INT,
			idModulo				INT
		)

	INSERT INTO @table VALUES(1, 29)
	INSERT INTO @table VALUES(2, 30)
	INSERT INTO @table VALUES(3, 31)
	INSERT INTO @table VALUES(4, 32)
	INSERT INTO @table VALUES(5, 32)
	INSERT INTO @table VALUES(6, 33)
	INSERT INTO @table VALUES(7, 34)
	INSERT INTO @table VALUES(8, 35)
	INSERT INTO @table VALUES(9, 35)
	INSERT INTO @table VALUES(10, 37)
	INSERT INTO @table VALUES(11, 38)
	INSERT INTO @table VALUES(12, 36)
	INSERT INTO @table VALUES(13, 60)

	SELECT 
		t.idMovimientoTipo,
		t.idModulo,
		(CASE WHEN (SELECT id_perf_mod_perm FROM perfil_modulo_permiso WHERE id_perfil = @idPerfil AND id_modulo = t.idModulo AND id_permiso = 1) > 1 THEN 1 ELSE 0 END) AS tienePermiso
	FROM
		@table t
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaOrdenCompraDetallePorIdOrdenCompra]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 24 junio 2018
-- Description:	Consulta de Orden Compra Detalle pendientes por Orden de Compra
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaOrdenCompraDetallePorIdOrdenCompra]
	@idOrdenCompra as int
AS
BEGIN	
	select ocd.id_orden_compra_detalle,a.id_articulo, a.desc_mayoreo from orden_compra_detalle ocd inner join articulo a on a.id_articulo = ocd.id_articulo where ocd.id_orden_compra = @idOrdenCompra and ingresado = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaOrdenCompraPorFolio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 24.julio.2018
-- Description:	Consultar orden compra por Folio
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaOrdenCompraPorFolio]
	@folio as nvarchar(10)
AS
BEGIN
	SELECT *
	  FROM [orden_compra]
	  WHERE [folio] = @folio
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaOrdenCompraPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 22.junio.2018
-- Description:	Consultar orden compra por id
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaOrdenCompraPorId]
	@idOrdenCompra as int
AS
BEGIN
	SELECT [fecha_registro]
		  ,ISNULL([folio], '') AS 'folio'
		  ,[observaciones]
		  ,ISNULL([orden_compra].[id_proveedor], 0) AS 'id_proveedor'
		  ,[proveedor].[clave] AS 'clave_proveedor'
		  ,[proveedor].[nombre] AS 'nombre_proveedor'
		  ,[descuento]
	  FROM [orden_compra]
	  LEFT OUTER JOIN [proveedor] ON
		  [proveedor].[id_proveedor] = [orden_compra].[id_proveedor]
	  WHERE [id_orden_compra] = @idOrdenCompra
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaOrdenCompraVigentePorProveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 25 junio 2018
-- Description:	Consulta de Ordenes de Compra por proveedor
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaOrdenCompraVigentePorProveedor]
	@idProveedor as int
AS
BEGIN
	
	SELECT * FROM orden_compra where id_proveedor = @idProveedor and getDate() < fecha_fin_vigencia and fecha_cancelado is null;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaOrdenMaxima]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Carlos Negrete
-- Create date: 07.Junio.2018
-- Description:	ConsultarOrdenMaxima
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaOrdenMaxima]
	@idArticulo as int,
	@idTipo as int
AS
BEGIN
DECLARE @index		as int
DECLARE @no_Orden	as int
set @index = 1;
set @no_Orden =0;
WHILE @index <= 3
BEGIN
	if EXISTS (SELECT no_orden FROM articulo_oferta WHERE id_articulo = @idArticulo and id_oferta_tipo = @idTipo and no_orden=@index)
	BEGIN
		SET @index = @index +1;
	END
	ELSE
	BEGIN
		 SET @no_Orden = @index;
		break
	END
END
	IF @no_Orden = 0
	BEGIN
		SELECT @no_Orden = max(no_orden) FROM articulo_oferta WHERE id_articulo = @idArticulo and id_oferta_tipo = @idTipo
		SET @no_Orden = @no_Orden + 1;
	END
	 SELECT @no_Orden as orden
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaPerfilPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 07.mayo.2018
-- Description:	Consulta perfil por ID
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaPerfilPorId]
	@idPerfil as int
AS
BEGIN
	SELECT 
		id_perfil,
		nombre
	FROM 
		perfil 
	WHERE 
		id_perfil = @idPerfil
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaPermisosPerfil]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 08-06-2018
-- Description:	Ahora se usa descripcion y no nombre de permisos y modulos
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaPermisosPerfil]
	@idPerfil	AS	INT
AS
BEGIN
	DECLARE @idPerfilModuloPermiso	AS	INT;
	DECLARE @idModulo				AS	INT;
	DECLARE @nombreModulo			AS	NVARCHAR(50);
	DECLARE @idPermiso				AS	INT;
	DECLARE @nombrePermiso			AS NVARCHAR(50);

	DECLARE @temp TABLE
				(
					idPerfilModuloPermiso	INT,
					idModulo				INT,
					descripcionModulo			NVARCHAR(50),
					idPermiso				INT,
					descripcionPermiso			NVARCHAR(50),
					tipo					INT
				)

	IF((SELECT COUNT(*) FROM perfil WHERE id_perfil = @idPerfil) > 0 OR @idPerfil = 0)
	BEGIN
		DECLARE modulos CURSOR FOR
		SELECT id_modulo, descripcion FROM modulo


		OPEN modulos
		FETCH NEXT FROM modulos
		INTO @idModulo, @nombreModulo

		WHILE @@FETCH_STATUS = 0
		BEGIN
			DECLARE permisos CURSOR FOR
			SELECT id_permiso, descripcion FROM permiso
			
			OPEN permisos
			FETCH NEXT FROM permisos
			INTO @idPermiso, @nombrePermiso

			WHILE @@FETCH_STATUS = 0
			BEGIN
				INSERT INTO @temp 
				VALUES(
					ISNULL((SELECT id_perf_mod_perm FROM perfil_modulo_permiso WHERE id_perfil = @idPerfil AND id_modulo = @idModulo AND id_permiso = @idPermiso),-1),
					@idModulo,
					@nombreModulo,
					@idPermiso,
					@nombrePermiso,
					(
						CASE 
							(SELECT COUNT(*) FROM modulo_permiso WHERE id_modulo = @idModulo AND id_permiso = @idPermiso) 
						WHEN 
							0 
						THEN
							-1
						ELSE
							(
								CASE
									(SELECT COUNT(*) FROM perfil_modulo_permiso WHERE id_perfil = @idPerfil AND id_modulo = @idModulo AND id_permiso = @idPermiso)
								WHEN
									0
								THEN
									0
								ELSE
									1
								END
							)
						END
					)
				)
				FETCH NEXT FROM permisos
				INTO @idPermiso, @nombrePermiso
			END
			CLOSE permisos
			DEALLOCATE permisos

			FETCH NEXT FROM modulos
			INTO @idModulo, @nombreModulo
		END
		CLOSE modulos
		DEALLOCATE modulos


		SELECT * FROM @temp
	END

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaPorPerfilUsuario]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:         Carlos Negrete
-- Create date:    2 Agosto 2018
-- Description:    spConsultaUsuarioPorPerfil
-- =============================================
Create PROCEDURE [dbo].[spConsultaPorPerfilUsuario]
	@perfil as int,
	@llave as nvarchar(50)
AS
BEGIN
	SELECT
		 id_usuario,
		 nombre,
		 clave,
		 ISNULL(id_perfil,0) AS id_perfil,
		 ISNULL(id_sucursal,0) AS id_sucursal,
		 ISNULL(id_caja_actual,0) AS id_caja_actual,
		 fecha_alta,
		 ISNULL(ultima_sesion,0) AS ultima_sesion,
		 activo,
		 CONVERT(NVARCHAR(50),DECRYPTBYPASSPHRASE(@llave, contrasena)) AS contrasena
	FROM 
		usuario 
	WHERE 
		activo = 1
		and id_perfil = @perfil
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaPrecioAgrupadorPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 21.mayo.208
-- Description:	Consultar precio agrupador por id
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaPrecioAgrupadorPorId]
	@id as int
AS
BEGIN
	SELECT * FROM precio_agrupador WHERE id_precio_agrupador = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaPrecioAgrupadorPorNivel]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 21.mayo.208
-- Description:	Consultar precio agrupador por id agrupador articulo y nivel
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaPrecioAgrupadorPorNivel]
	@idAgrupadorArticulo as int,
	@nivelPrecio as int
AS
BEGIN
	SELECT * FROM precio_agrupador WHERE id_agrupador_articulo = @idAgrupadorArticulo AND nivel_precio = @nivelPrecio
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaPretransferenciaDetallePorIdPretransferencia]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 27 junio 2018
-- Description:	Consulta de Orden Compra Detalle pendientes por Orden de Compra
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaPretransferenciaDetallePorIdPretransferencia]
	@idPretransferencia as int
AS
BEGIN	
	SELECT pd.id_pretransferencia_detalle,a.id_articulo, a.desc_mayoreo FROM pretransferencia_detalle pd INNER JOIN articulo a ON a.id_articulo = pd.id_articulo WHERE pd.id_pretransferencia = @idPretransferencia;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaPretransferenciaPorFolio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 23 junio 2018
-- Description:	Consulta de Pretranferencia por folio
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaPretransferenciaPorFolio]
	@folio as nvarchar(12)
AS
BEGIN
	
	SELECT * FROM pretransferencia where folio = @folio;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaPretransferenciaPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 22.junio.2018
-- Description:	Consultar pretransferencia por id
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaPretransferenciaPorId]
	@idPretransferencia as int
AS
BEGIN
	SELECT [fecha_registro]
		  ,ISNULL([folio], '') AS 'folio'
		  ,[id_sucursal_origen]
		  ,[observaciones]
	  FROM [pretransferencia]
	  WHERE [id_pretransferencia] = @idPretransferencia
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaPrioridadMaximaArticuloProveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaPrioridadMaximaArticuloProveedor]
	@idArticulo as int
AS
BEGIN
	SELECT MAX(prioridad) as prioridad FROM articulo_proveedor WHERE id_articulo = @idArticulo
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaPromociones]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 21.Febrero.2020
-- Description:	Se modifico la consulta para obtener
--              correctamente el estatus de la promocion
-- =============================================
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 17.Septimebre.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaPromociones]
AS
BEGIN
	SELECT id_promocion,clave AS 'Clave',nombre AS 'Nombre',descripcion AS 'Tipo',CONVERT(NVARCHAR,vigencia_inicio,103) 
	AS 'Vigencia Inicio',CONVERT(NVARCHAR,vigencia_fin,103) AS 'Vigencia Fin',CASE WHEN p.activo=1 THEN CASE WHEN 
	CONVERT(DATE,vigencia_fin)>=CONVERT(DATE,GETDATE()) THEN 'Activo' ELSE 'Inactivo' END ELSE 'Inactivo' END AS 'Estatus' 
	FROM promocion p LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo ORDER BY clave DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaPromocionPorID]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 3.Sept.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaPromocionPorID]
	@idPromocion	 as int
AS
BEGIN
SELECT	id_sucursal,
		p.clave,
		p.nombre,
		id_promocion_tipo,
		id_promocion_condicion,
		id_promocion_aplicacion,
		vigencia_inicio,
		vigencia_fin,
		promos_por_venta,
		visible_en_pv,
		acumulable,
		limite_sucursal,
		p.activo,
		ISNULL(nombre_imagen,'')as nombre_imagen,
		pr.id_proveedor,
		ISNULL(p.cantidad,0) as cantidad
		from promocion p
		LEFT JOIN promocion_imagen pi ON p.id_promocion=pi.id_promocion 
		LEFT JOIN proveedor pr ON p.id_proveedor = pr.id_proveedor 
		where p.id_promocion = @idPromocion;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaPromocionVentaPorMovimiento]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 20.dicmienbre.2018
-- Description:	Consulta de Promocion Venta por Movimiento Almacen (Ticket)
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaPromocionVentaPorMovimiento]
	@ticket AS int
AS
BEGIN
	SELECT [id_promocion_venta]
		  ,[id_promocion]
		  ,[id_ticket]
		  ,[id_articulo_regalo]
		  ,[monto_cantidad]
		  ,[fecha_registro]
		  ,[aplicadas]
	  FROM [dbo].[promocion_venta]
	  WHERE [id_ticket] = @ticket
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarAlmacenSuperSucursal]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 15.febrero.2019
-- Description:	Consultar almacén super de sucursal
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarAlmacenSuperSucursal]
	@idSucursal AS int
AS
BEGIN
	SELECT * FROM almacen WHERE id_sucursal = @idSucursal AND activo = 1 AND es_mayoreo = 0
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarArticuloClaveCodigo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 25.julio.2018
-- Description:	Consultar articulo por clave o codigo
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarArticuloClaveCodigo]
	@cadena as NVARCHAR(36)
AS
BEGIN
	DECLARE @id AS INT
	SELECT @id = id_articulo FROM articulo WHERE clave = @cadena OR codigo_barras1 = @cadena OR codigo_barras2 = @cadena
	IF	@id IS NULL
		SELECT @id = id_articulo FROM articulo_equivalente WHERE codigo_barras = @cadena
	SELECT ISNULL(@id, 0) AS id_articulo
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarArticuloPorAgrpadorArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl
-- Create date: 16.marzo.2019
-- Description:	Consultar articulos por idAgrupadorArticulo
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarArticuloPorAgrpadorArticulo]
	@idAgrupadorArticulo AS	int
AS
BEGIN
	SELECT [id_articulo]
	  FROM [dbo].[articulo]
	  WHERE [id_agrupador_articulo] = @idAgrupadorArticulo
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarArticuloPorClave]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date:	2018-08-14
-- Description:	Se agrego claves de familia, agrupador y linea negocio
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarArticuloPorClave]
	@clave as nvarchar(10)
AS
BEGIN
	SELECT 
		a.*,
		ivaV.tasa AS tasaIVAVenta,
		ivaC.tasa AS tasaIVACompra,
		iepsV.tasa AS tasaIEPSVenta,
		iepsC.tasa AS tasaIEPSCompra,
		uV.pesable AS uVPesable,
		uC.pesable	AS	uCPesable,
		aa.id_familia,
		f.clave AS clave_familia,
		aa.clave AS clave_agrupador,
		ln.clave AS clave_linea_negocio
	FROM 
		articulo a
		LEFT JOIN impuesto ivaV ON a.id_iva_venta = ivaV.id_impuesto
		LEFT JOIN impuesto ivaC ON a.id_iva_compra = ivaC.id_impuesto
		LEFT JOIN impuesto iepsV ON a.id_ieps_venta = iepsV.id_impuesto
		LEFT JOIN impuesto iepsC ON a.id_ieps_compra = iepsC.id_impuesto
		LEFT JOIN unidad_medida uV ON a.id_unidad_venta = uV.id_unidad_medida
		LEFT JOIN unidad_medida uC ON a.id_unidad_compra = uC.id_unidad_medida
		LEFT JOIN agrupador_articulo aa ON a.id_agrupador_articulo = aa.id_agrupador_articulo
		LEFT JOIN familia f ON aa.id_familia = f.id_familia
		LEFT JOIN linea_negocio ln ON a.id_linea_negocio = ln.id_linea_negocio
	WHERE 
		a.clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarArticuloPorClaveCodigoBarras]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date:	2018-08-14
-- Description:	Se agrego claves de familia, agrupador y linea negocio
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarArticuloPorClaveCodigoBarras]
	@clave as nvarchar(36)
AS
BEGIN
	DECLARE @nFilas AS int

	SELECT @nFilas = COUNT(*) FROM articulo a WHERE a.clave = @clave OR a.codigo_barras1 = @clave OR a.codigo_barras2 = @clave

	IF @nFilas > 0
		SELECT
			a.*,
			ivaV.tasa AS tasaIVAVenta,
			ivaC.tasa AS tasaIVACompra,
			iepsV.tasa AS tasaIEPSVenta,
			iepsC.tasa AS tasaIEPSCompra,
			uV.pesable AS uVPesable,
			uC.pesable	AS	uCPesable,
			aa.id_familia,
			f.clave AS clave_familia,
			aa.clave AS clave_agrupador,
			ln.clave AS clave_linea_negocio,
			ISNULL((SELECT cantidad_venta FROM articulo_equivalente WHERE codigo_barras = @clave), 0) AS cantidad_venta
		FROM 
			articulo a
			LEFT JOIN impuesto ivaV ON a.id_iva_venta = ivaV.id_impuesto
			LEFT JOIN impuesto ivaC ON a.id_iva_compra = ivaC.id_impuesto
			LEFT JOIN impuesto iepsV ON a.id_ieps_venta = iepsV.id_impuesto
			LEFT JOIN impuesto iepsC ON a.id_ieps_compra = iepsC.id_impuesto
			LEFT JOIN unidad_medida uV ON a.id_unidad_venta = uV.id_unidad_medida
			LEFT JOIN unidad_medida uC ON a.id_unidad_compra = uC.id_unidad_medida
			LEFT JOIN articulo_equivalente ae ON a.id_articulo = ae.id_articulo
			LEFT JOIN agrupador_articulo aa ON a.id_agrupador_articulo = aa.id_agrupador_articulo
			LEFT JOIN familia f ON aa.id_familia = f.id_familia
			LEFT JOIN linea_negocio ln ON a.id_linea_negocio = ln.id_linea_negocio
		WHERE 
			a.clave = @clave OR a.codigo_barras1 = @clave OR a.codigo_barras2 = @clave
	ELSE
		SELECT
			a.*,
			ivaV.tasa AS tasaIVAVenta,
			ivaC.tasa AS tasaIVACompra,
			iepsV.tasa AS tasaIEPSVenta,
			iepsC.tasa AS tasaIEPSCompra,
			uV.pesable AS uVPesable,
			uC.pesable	AS	uCPesable,
			aa.id_familia,
			f.clave AS clave_familia,
			aa.clave AS clave_agrupador,
			ln.clave AS clave_linea_negocio,
			ISNULL((SELECT cantidad_venta FROM articulo_equivalente WHERE codigo_barras = @clave), 0) AS cantidad_venta
		FROM 
			articulo a
			LEFT JOIN impuesto ivaV ON a.id_iva_venta = ivaV.id_impuesto
			LEFT JOIN impuesto ivaC ON a.id_iva_compra = ivaC.id_impuesto
			LEFT JOIN impuesto iepsV ON a.id_ieps_venta = iepsV.id_impuesto
			LEFT JOIN impuesto iepsC ON a.id_ieps_compra = iepsC.id_impuesto
			LEFT JOIN unidad_medida uV ON a.id_unidad_venta = uV.id_unidad_medida
			LEFT JOIN unidad_medida uC ON a.id_unidad_compra = uC.id_unidad_medida
			LEFT JOIN articulo_equivalente ae ON a.id_articulo = ae.id_articulo
			LEFT JOIN agrupador_articulo aa ON a.id_agrupador_articulo = aa.id_agrupador_articulo
			LEFT JOIN familia f ON aa.id_familia = f.id_familia
			LEFT JOIN linea_negocio ln ON a.id_linea_negocio = ln.id_linea_negocio
		WHERE 
			ae.codigo_barras = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarArticuloPorClavePromocion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date:	2018-08-14
-- Description:	Se agrego claves de familia, agrupador y linea negocio
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarArticuloPorClavePromocion]
	@clave as nvarchar(10),
	@idProveedor as int
AS
BEGIN
	SELECT 
		a.*,
		ivaV.tasa AS tasaIVAVenta,
		ivaC.tasa AS tasaIVACompra,
		iepsV.tasa AS tasaIEPSVenta,
		iepsC.tasa AS tasaIEPSCompra,
		uV.pesable AS uVPesable,
		uC.pesable	AS	uCPesable,
		aa.id_familia,
		f.clave AS clave_familia,
		aa.clave AS clave_agrupador,
		ln.clave AS clave_linea_negocio,
		ISNULL(ap.id_proveedor,0) as id_proveedor
	FROM 
		articulo a
		LEFT JOIN impuesto ivaV ON a.id_iva_venta = ivaV.id_impuesto
		LEFT JOIN impuesto ivaC ON a.id_iva_compra = ivaC.id_impuesto
		LEFT JOIN impuesto iepsV ON a.id_ieps_venta = iepsV.id_impuesto
		LEFT JOIN impuesto iepsC ON a.id_ieps_compra = iepsC.id_impuesto
		LEFT JOIN unidad_medida uV ON a.id_unidad_venta = uV.id_unidad_medida
		LEFT JOIN unidad_medida uC ON a.id_unidad_compra = uC.id_unidad_medida
		LEFT JOIN agrupador_articulo aa ON a.id_agrupador_articulo = aa.id_agrupador_articulo
		LEFT JOIN familia f ON aa.id_familia = f.id_familia
		LEFT JOIN linea_negocio ln ON a.id_linea_negocio = ln.id_linea_negocio
		LEFT JOIN articulo_proveedor ap ON ap.id_articulo = a.id_articulo
	WHERE 
		a.clave = @clave
		and  id_proveedor = @idProveedor

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarArticuloPorClaveYProveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date:	2019-03-09
-- Description:	Consultar aticulo por clave y id de proveedor
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarArticuloPorClaveYProveedor]
	@clave as nvarchar(10),
	@idProveedor as int
AS
BEGIN
	SELECT 
		a.*,
		ivaV.tasa AS tasaIVAVenta,
		ivaC.tasa AS tasaIVACompra,
		iepsV.tasa AS tasaIEPSVenta,
		iepsC.tasa AS tasaIEPSCompra,
		uV.pesable AS uVPesable,
		uC.pesable	AS	uCPesable,
		aa.id_familia,
		f.clave AS clave_familia,
		aa.clave AS clave_agrupador,
		ln.clave AS clave_linea_negocio
	FROM 
		articulo a
		LEFT JOIN impuesto ivaV ON a.id_iva_venta = ivaV.id_impuesto
		LEFT JOIN impuesto ivaC ON a.id_iva_compra = ivaC.id_impuesto
		LEFT JOIN impuesto iepsV ON a.id_ieps_venta = iepsV.id_impuesto
		LEFT JOIN impuesto iepsC ON a.id_ieps_compra = iepsC.id_impuesto
		LEFT JOIN unidad_medida uV ON a.id_unidad_venta = uV.id_unidad_medida
		LEFT JOIN unidad_medida uC ON a.id_unidad_compra = uC.id_unidad_medida
		LEFT JOIN agrupador_articulo aa ON a.id_agrupador_articulo = aa.id_agrupador_articulo
		LEFT JOIN familia f ON aa.id_familia = f.id_familia
		LEFT JOIN linea_negocio ln ON a.id_linea_negocio = ln.id_linea_negocio
		INNER JOIN articulo_proveedor ap ON ap.id_articulo = a.id_articulo
	WHERE 
		a.clave = @clave and ap.id_proveedor = @idProveedor
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarArticuloPorDescSup]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date:	2018-08-14
-- Description:	Se agrego claves de familia, agrupador y linea negocio
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarArticuloPorDescSup]
	@descSup as nvarchar(100)
AS
BEGIN
	SELECT 
		a.*,
		ivaV.tasa AS tasaIVAVenta,
		ivaC.tasa AS tasaIVACompra,
		iepsV.tasa AS tasaIEPSVenta,
		iepsC.tasa AS tasaIEPSCompra,
		uV.pesable AS uVPesable,
		uC.pesable	AS	uCPesable,
		aa.id_familia,
		f.clave AS clave_familia,
		aa.clave AS clave_agrupador,
		ln.clave AS clave_linea_negocio
	FROM 
		articulo a
		LEFT JOIN impuesto ivaV ON a.id_iva_venta = ivaV.id_impuesto
		LEFT JOIN impuesto ivaC ON a.id_iva_compra = ivaC.id_impuesto
		LEFT JOIN impuesto iepsV ON a.id_ieps_venta = iepsV.id_impuesto
		LEFT JOIN impuesto iepsC ON a.id_ieps_compra = iepsC.id_impuesto
		LEFT JOIN unidad_medida uV ON a.id_unidad_venta = uV.id_unidad_medida
		LEFT JOIN unidad_medida uC ON a.id_unidad_compra = uC.id_unidad_medida
		LEFT JOIN agrupador_articulo aa ON a.id_agrupador_articulo = aa.id_agrupador_articulo
		LEFT JOIN familia f ON aa.id_familia = f.id_familia
		LEFT JOIN linea_negocio ln ON a.id_linea_negocio = ln.id_linea_negocio
	WHERE 
		a.desc_super = @descSup
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarArticuloPorDescSupPromociones]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date:	2018-08-14
-- Description:	Se agrego claves de familia, agrupador y linea negocio
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarArticuloPorDescSupPromociones]
	@descSup as nvarchar(100),
	@idProveedor as int
AS
BEGIN
	SELECT 
		a.*,
		ivaV.tasa AS tasaIVAVenta,
		ivaC.tasa AS tasaIVACompra,
		iepsV.tasa AS tasaIEPSVenta,
		iepsC.tasa AS tasaIEPSCompra,
		uV.pesable AS uVPesable,
		uC.pesable	AS	uCPesable,
		aa.id_familia,
		f.clave AS clave_familia,
		aa.clave AS clave_agrupador,
		ln.clave AS clave_linea_negocio,
		ISNULL(ap.id_proveedor,0) as id_proveedor
	FROM 
		articulo a
		LEFT JOIN impuesto ivaV ON a.id_iva_venta = ivaV.id_impuesto
		LEFT JOIN impuesto ivaC ON a.id_iva_compra = ivaC.id_impuesto
		LEFT JOIN impuesto iepsV ON a.id_ieps_venta = iepsV.id_impuesto
		LEFT JOIN impuesto iepsC ON a.id_ieps_compra = iepsC.id_impuesto
		LEFT JOIN unidad_medida uV ON a.id_unidad_venta = uV.id_unidad_medida
		LEFT JOIN unidad_medida uC ON a.id_unidad_compra = uC.id_unidad_medida
		LEFT JOIN agrupador_articulo aa ON a.id_agrupador_articulo = aa.id_agrupador_articulo
		LEFT JOIN familia f ON aa.id_familia = f.id_familia
		LEFT JOIN linea_negocio ln ON a.id_linea_negocio = ln.id_linea_negocio
		LEFT JOIN articulo_proveedor ap ON ap.id_articulo = a.id_articulo
	WHERE 
		a.desc_super = @descSup
		and  id_proveedor = @idProveedor
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarArticuloPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez
-- Create date:	2020-02-07
-- Description:	Se modifico cantidad_venta por que si tiene equivalente 
--              manda dicha cantidad y solo se selecciono 1 no otra mayor
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date:	2018-08-14
-- Description:	Se agrego claves de familia, agrupador y linea negocio
-- =============================================

CREATE PROCEDURE [dbo].[spConsultarArticuloPorId]
	@id as int
AS
BEGIN
	SELECT 
		a.*,
		ivaV.tasa AS tasaIVAVenta,
		ivaC.tasa AS tasaIVACompra,
		iepsV.tasa AS tasaIEPSVenta,
		iepsC.tasa AS tasaIEPSCompra,
		uV.pesable AS uVPesable,
		uC.pesable	AS	uCPesable,
		aa.id_familia,
		f.clave AS clave_familia,
		aa.clave AS clave_agrupador,
		ln.clave AS clave_linea_negocio,
		0.00 AS cantidad_venta
		--ISNULL(ae.cantidad_venta, 0) as cantidad_venta
	FROM 
		articulo a
		LEFT JOIN impuesto ivaV ON a.id_iva_venta = ivaV.id_impuesto
		LEFT JOIN impuesto ivaC ON a.id_iva_compra = ivaC.id_impuesto
		LEFT JOIN impuesto iepsV ON a.id_ieps_venta = iepsV.id_impuesto
		LEFT JOIN impuesto iepsC ON a.id_ieps_compra = iepsC.id_impuesto
		LEFT JOIN unidad_medida uV ON a.id_unidad_venta = uV.id_unidad_medida
		LEFT JOIN unidad_medida uC ON a.id_unidad_compra = uC.id_unidad_medida
		LEFT JOIN agrupador_articulo aa ON a.id_agrupador_articulo = aa.id_agrupador_articulo
		LEFT JOIN familia f ON aa.id_familia = f.id_familia
		LEFT JOIN linea_negocio ln ON a.id_linea_negocio = ln.id_linea_negocio
		--LEFT JOIN articulo_equivalente ae ON a.id_articulo = ae.id_articulo
	WHERE
		a.id_articulo = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarArticuloPorTipo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carolina Franco
-- Create date:	2019-04-25
-- Description:	Se consulta por columna tipo
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarArticuloPorTipo]
	@clave as nvarchar(20)
AS
BEGIN
	SELECT 
		a.*,
		ivaV.tasa AS tasaIVAVenta,
		ivaC.tasa AS tasaIVACompra,
		iepsV.tasa AS tasaIEPSVenta,
		iepsC.tasa AS tasaIEPSCompra,
		uV.pesable AS uVPesable,
		uC.pesable	AS	uCPesable,
		aa.id_familia,
		f.clave AS clave_familia,
		aa.clave AS clave_agrupador,
		ln.clave AS clave_linea_negocio
	FROM 
		articulo a
		LEFT JOIN impuesto ivaV ON a.id_iva_venta = ivaV.id_impuesto
		LEFT JOIN impuesto ivaC ON a.id_iva_compra = ivaC.id_impuesto
		LEFT JOIN impuesto iepsV ON a.id_ieps_venta = iepsV.id_impuesto
		LEFT JOIN impuesto iepsC ON a.id_ieps_compra = iepsC.id_impuesto
		LEFT JOIN unidad_medida uV ON a.id_unidad_venta = uV.id_unidad_medida
		LEFT JOIN unidad_medida uC ON a.id_unidad_compra = uC.id_unidad_medida
		LEFT JOIN agrupador_articulo aa ON a.id_agrupador_articulo = aa.id_agrupador_articulo
		LEFT JOIN familia f ON aa.id_familia = f.id_familia
		LEFT JOIN linea_negocio ln ON a.id_linea_negocio = ln.id_linea_negocio
	WHERE 
		a.tipo = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarBancoPorDescripcion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarBancoPorDescripcion]
	@descripcion as nvarchar(50)
AS
BEGIN
	SELECT * FROM banco WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarBancoPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarBancoPorId]
	@id as int
AS
BEGIN
	SELECT * FROM banco WHERE id_banco = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarCajasConsolidacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarCajasConsolidacion]
	@idSucursal AS INT
AS
BEGIN
	SELECT id_caja, nombre, no_caja FROM caja
	WHERE id_sucursal = @idSucursal AND activo = 1 and habilitada =1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarCajasPorSucursal]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 06.septiembre.2018
-- Description:	Cambiar valor es_entrada para Retiro y Gasto
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarCajasPorSucursal]
	@idSucursal AS INT
AS
BEGIN
	SELECT id_caja, nombre FROM caja
	WHERE id_sucursal = @idSucursal AND activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarCatalogoAplicaPromocion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 22.Junio.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarCatalogoAplicaPromocion]
AS
BEGIN
	SELECT	id_promocion_aplicacion as idAplicaPromocion,
			descripcion
	FROM promocion_aplicacion WHERE activo=1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarCatalogoCompletoLineaDeNegocio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarCatalogoCompletoLineaDeNegocio]
AS
BEGIN
	SELECT * FROM linea_negocio WHERE activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarCatalogoCompletoSucursal]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MArco Gonzalez
-- Create date: 2019-03-07
-- Description:	Se agregío columna afilaicion_bancomer
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarCatalogoCompletoSucursal]
AS
BEGIN
	SELECT 
		id_sucursal,
		clave_sucursal,
		nombre,
		id_zona,
		direccion_ip,
		nombre_bd,
		usuario_bd,
		contrasena,
		fecha_alta,
		activo,
		ISNULL(afiliacion_bancomer, '') AS afiliacion_bancomer
	FROM sucursal WHERE activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarCatalogoCondicionPromocion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 22.Junio.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarCatalogoCondicionPromocion]
AS
BEGIN
	SELECT	id_promocion_condicion as idCondicionPromocion,
			descripcion
	FROM promocion_condicion WHERE activo=1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarCatalogoTipoAuditoria]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete - Alter Israel Flores C.
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarCatalogoTipoAuditoria]
AS
BEGIN
	SELECT	id_auditoria_tipo as idTipoAuditoria,
			descripcion
	FROM auditoria_tipo 
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarCatalogoTipodeCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 24.mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarCatalogoTipodeCaja]
AS
BEGIN
	SELECT * FROM tipo_caja 
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarCatalogoTipoPromocion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 22.Junio.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarCatalogoTipoPromocion]
AS
BEGIN
	SELECT	id_promocion_tipo as idTipoPromocion,
			descripcion
	FROM promocion_tipo WHERE activo=1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarCodigoPostalporId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 25.mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarCodigoPostalporId]
	@id as int
AS
BEGIN
	SELECT * FROM cp WHERE id_cp = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarCodigoPostalporIdTexto]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 25.mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarCodigoPostalporIdTexto]
	@id as int
AS
BEGIN
	SELECT
		id_cp,
		cp.id_estado,
		cp.id_municipio,
		cp.nombre,
		cp.clave_sat,
		estado.nombre as estado,
		municipio.nombre as municipio
	FROM cp  LEFT JOIN
	estado ON estado.id_estado = cp.id_estado LEFT JOIN 
	municipio ON municipio.id_municipio = cp.id_municipio
	WHERE id_cp = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarCodigoPostalporNombre]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 04.junio.2018
-- Description:	Cambio para que no mande null
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarCodigoPostalporNombre]
	@nombre as nvarchar(100)
AS
BEGIN
	SELECT id_cp,
			id_estado,
			ISNULL (id_municipio, 0) AS id_municipio,
			nombre,
			clave_sat
	FROM cp WHERE nombre= @nombre
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarConfiguracionSeguridad]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Marco Gonzalez
-- Create date:		2019-09-04
-- Description:		Si no hay registro, insertar datos por default
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarConfiguracionSeguridad]
    @idSucursal INT
AS
BEGIN
    DECLARE @count as INT

    SELECT @count = count(*) FROM configuracion_seguridad WHERE id_sucursal = @idSucursal

    IF @count = 0
    BEGIN
        INSERT INTO [dbo].[configuracion_seguridad]
           ([id_sucursal]
           ,[monitoreo_activo]
           ,[forzar_modulos]
           ,[formato_monitoreo]
           ,[max_dias_almacenados]
           ,[ultima_modificacion]
           ,[modificado_por])
     VALUES
           (@idSucursal
           ,0
           ,0
           ,'Foto'
           ,30
           ,GETDATE()
           ,1)
    END

    SELECT 
        *
    FROM
        configuracion_seguridad
    WHERE
        id_sucursal = @idSucursal
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaRecargasConfigPorSucursal]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-12-06
-- Description:	Consulta Recargas configuracion por sucursal
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaRecargasConfigPorSucursal]
	@idSucursal as int
AS
BEGIN
	SELECT * FROM recargas_config WHERE id_sucursal = @idSucursal and [default] =1;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaReglasMovimientoAlmacen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-07-18
-- Description:	Obtiene las reglas del movimiento almacen indicado
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaReglasMovimientoAlmacen]
	@idMovimientoAlmacenTipo AS INT
AS
BEGIN
	SELECT 
		r.id_reglas_movimiento_almacen,
		r.id_movimiento_almacen_tipo,
		r.entrada_articulo,
		r.salida_articulo,
		r.entrada_articulo_existencia,
		r.salida_articulo_existencia,
		r.afecta_costo_ultimo,
		r.afecta_costo_promedio,
		r.factor,
		mat.clave,
		mat.es_entrada
	FROM 
		reglas_movimiento_almacen r
		LEFT JOIN movimiento_almacen_tipo mat ON r.id_movimiento_almacen_tipo = mat.id_movimiento_almacen_tipo
	WHERE 
		r.id_movimiento_almacen_tipo = @idMovimientoAlmacenTipo
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaReporteExistencias]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        Carolina Franco
-- Create date: 2091-04-06
-- Description:    SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaReporteExistencias]
    @idSucursal as int,
    @articulo_inicio as nvarchar(10),
    @articulo_fin as nvarchar(10),
    @idProveedor as int,
	@porProveedor as int
AS
BEGIN
    IF(@idSucursal = 0)
    BEGIN
		IF(@porProveedor=0)
		BEGIN
			IF (@idProveedor = 0)
			BEGIN
				select
					distinct(unico),
					articulo,
					almacen,
					actual,
					venta,
					apartado,
					id_proveedor,
					proveedor,
					id_sucursal,
					clave_sucursal,
					descripcion
				from
					VtReporteExistencias
				where
					articulo >= @articulo_inicio and articulo <= @articulo_fin
			 END
			ELSE
			BEGIN
				select
				distinct(unico),
					articulo,
					almacen,
					actual,
					venta,
					apartado,
					id_proveedor,
					proveedor,
					id_sucursal,
					clave_sucursal,
					descripcion
				from
					VtReporteExistencias
				where
					articulo >= @articulo_inicio and articulo <= @articulo_fin
					and id_proveedor = @idProveedor
			END
		END
		ELSE 
		BEGIN
			IF (@idProveedor = 0)
			BEGIN
				select
					distinct(unico),
					articulo,
					almacen,
					actual,
					venta,
					apartado,
					id_proveedor,
					proveedor,
					id_sucursal,
					clave_sucursal,
					descripcion
				from
					VtReporteExistencias
			 END
			ELSE
			BEGIN
				select
				distinct(unico),
					articulo,
					almacen,
					actual,
					venta,
					apartado,
					id_proveedor,
					proveedor,
					id_sucursal,
					clave_sucursal,
					descripcion
				from
					VtReporteExistencias
				where
					 id_proveedor = @idProveedor
			END
		END
	END
    ELSE
    BEGIN
		IF(@porProveedor=0)
		BEGIN
			IF (@idProveedor = 0)
			BEGIN
				select
				distinct(unico),
					articulo,
					almacen,
					actual,
					venta,
					apartado,
					id_proveedor,
					proveedor,
					id_sucursal,
					clave_sucursal,
					descripcion
				from
					VtReporteExistencias	
				where
					articulo >= @articulo_inicio and articulo <= @articulo_fin
					and id_sucursal = @idSucursal
			END
			ELSE
			BEGIN
				select
				distinct(unico),	
					articulo,
					almacen,
					actual,
					venta,
					apartado,
					id_proveedor,
					proveedor,
					id_sucursal,
					clave_sucursal,
					descripcion
				from
					VtReporteExistencias
				where
					articulo >= @articulo_inicio and articulo <= @articulo_fin
					and id_sucursal = @idSucursal
					and id_proveedor = @idProveedor
			END
		END
		ELSE
		BEGIN
			IF (@idProveedor = 0)
			BEGIN
				select
				distinct(unico),
					articulo,
					almacen,
					actual,
					venta,
					apartado,
					id_proveedor,
					proveedor,
					id_sucursal,
					clave_sucursal,
					descripcion
				from
					VtReporteExistencias	
				where
					id_sucursal = @idSucursal
			END
			ELSE
			BEGIN
				select
				distinct(unico),	
					articulo,
					almacen,
					actual,
					venta,
					apartado,
					id_proveedor,
					proveedor,
					id_sucursal,
					clave_sucursal,
					descripcion
				from
					VtReporteExistencias
				where
					id_sucursal = @idSucursal
					and id_proveedor = @idProveedor
			END
		END
    END
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaReporteFormasPago]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaReporteFormasPago]
	@sucursal as int,
	@formaPago as int,
	@tipo as int,
	@concepto as int,
	@dateIni as DATETIME,
	@dateFin as DATETIME,
	@activo as int

AS
BEGIN
	if(@activo=2 and @formaPago=0 and @tipo=0 and @concepto=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin
	end
	else if(@activo=2 and @formaPago=0 and @tipo=0 and @concepto=0 and @sucursal!=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_sucursal = @sucursal
	end
	else if(@activo=2 and @formaPago=0 and @tipo=0 and @concepto!=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_concepto = @concepto 
	end 
	else if(@activo=2 and @formaPago=0 and @tipo=0 and @concepto!=0 and @sucursal!=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_concepto = @concepto and
				id_sucursal = @sucursal
	end
	else if(@activo=2 and @formaPago=0 and @tipo!=0 and @concepto=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_tipo = @tipo 
	end 
	else if(@activo=2 and @formaPago=0 and @tipo!=0 and @concepto=0 and @sucursal!=0)
	begin
		Select	fecha_registro,
				no_caja,
				nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_sucursal = @sucursal and
				id_movimiento_caja_tipo = @tipo
	end 
	else if(@activo=2 and @formaPago=0 and @tipo!=0 and @concepto!=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_tipo = @tipo and
				id_movimiento_caja_concepto = @concepto 
	end 
	else if(@activo=2 and @formaPago=0 and @tipo!=0 and @concepto!=0 and @sucursal!=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_tipo = @tipo and 
				id_movimiento_caja_concepto = @concepto and 
				id_sucursal = @sucursal
	end 
	else if(@activo=2 and @formaPago!=0 and @tipo=0 and @concepto=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	id_forma_pago = @formaPago and
				@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin 
	end
	else if(@activo=2 and @formaPago!=0 and @tipo=0 and @concepto=0 and @sucursal!=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	id_forma_pago = @formaPago and 
				@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_sucursal = @sucursal
	end 
	else if(@activo=2 and @formaPago!=0 and @tipo=0 and @concepto!=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_concepto = @concepto and
				id_forma_pago = @formaPago 
	end 
	else if(@activo=2 and @formaPago!=0 and @tipo=0 and @concepto!=0 and @sucursal!=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	id_forma_pago = @formaPago and 
				@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_concepto = @concepto and 
				id_sucursal = @sucursal
	end 
	else if(@activo=2 and @formaPago!=0 and @tipo!=0 and @concepto=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_forma_pago = @formaPago and
				id_movimiento_caja_tipo = @tipo 
	end 
	else if(@activo=2 and @formaPago!=0 and @tipo!=0 and @concepto=0 and @sucursal!=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_forma_pago = @formaPago and
				id_movimiento_caja_tipo = @tipo and
				id_sucursal = @sucursal
	end 
	else if(@activo=2 and @formaPago!=0 and @tipo!=0 and @concepto!=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_forma_pago = @formaPago and
				id_movimiento_caja_tipo = @tipo and
				id_movimiento_caja_concepto = @concepto
	end 
	else if(@activo=2 and @formaPago!=0 and @tipo!=0 and @concepto!=0 and @sucursal!=0 )
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	id_forma_pago = @formaPago and 
				@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_tipo = @tipo and 
				id_movimiento_caja_concepto = @concepto and
				id_sucursal = @sucursal;
	end



	else if(@activo!=3 and @formaPago=0 and @tipo=0 and @concepto=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and 
				@activo = activo
	end
	else if(@activo!=3 and @formaPago=0 and @tipo=0 and @concepto=0 and @sucursal!=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_sucursal = @sucursal and 
				@activo = activo
	end
	else if(@activo!=3 and @formaPago=0 and @tipo=0 and @concepto!=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_concepto = @concepto and 
				@activo = activo
	end 
	else if(@activo!=3 and @formaPago=0 and @tipo=0 and @concepto!=0 and @sucursal!=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_concepto = @concepto and
				id_sucursal = @sucursal
				and 
				@activo = activo
	end
	else if(@activo!=3 and @formaPago=0 and @tipo!=0 and @concepto=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_tipo = @tipo and 
				@activo = activo
	end
	else if(@activo!=3 and @formaPago=0 and @tipo!=0 and @concepto=0 and @sucursal!=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_sucursal = @sucursal and
				id_movimiento_caja_tipo = @tipo and 
				@activo = activo
	end 
	else if(@activo!=3 and @formaPago=0 and @tipo!=0 and @concepto!=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_tipo = @tipo and
				id_movimiento_caja_concepto = @concepto and 
				@activo = activo
	end 
	else if(@activo!=3 and @formaPago=0 and @tipo!=0 and @concepto!=0 and @sucursal!=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_tipo = @tipo and 
				id_movimiento_caja_concepto = @concepto and 
				id_sucursal = @sucursal and 
				@activo = activo
	end 
	else if(@activo!=3 and @formaPago!=0 and @tipo=0 and @concepto=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	id_forma_pago = @formaPago and
				@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and 
				@activo = activo
	end
	else if(@activo!=3 and @formaPago!=0 and @tipo=0 and @concepto=0 and @sucursal!=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	id_forma_pago = @formaPago and 
				@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_sucursal = @sucursal and 
				@activo = activo
	end 
	else if(@activo!=3 and @formaPago!=0 and @tipo=0 and @concepto!=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_concepto = @concepto and
				id_forma_pago = @formaPago and 
				@activo = activo
	end
	else if(@activo!=3 and @formaPago!=0 and @tipo=0 and @concepto!=0 and @sucursal!=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	id_forma_pago = @formaPago and 
				@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_concepto = @concepto and 
				id_sucursal = @sucursal and 
				@activo = activo
	end 
	else if(@activo!=3 and @formaPago!=0 and @tipo!=0 and @concepto=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_forma_pago = @formaPago and
				id_movimiento_caja_tipo = @tipo and 
				@activo = activo
	end 
	else if(@activo!=3 and @formaPago!=0 and @tipo!=0 and @concepto=0 and @sucursal!=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_forma_pago = @formaPago and
				id_movimiento_caja_tipo = @tipo and
				id_sucursal = @sucursal and 
				@activo = activo
	end 
	else if(@activo!=3 and @formaPago!=0 and @tipo!=0 and @concepto!=0 and @sucursal=0)
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_forma_pago = @formaPago and
				id_movimiento_caja_tipo = @tipo and
				id_movimiento_caja_concepto = @concepto and 
				@activo = activo
	end 
	else if(@activo!=3 and @formaPago!=0 and @tipo!=0 and @concepto!=0 and @sucursal!=0 )
	begin
		Select	fecha_registro,
				no_caja,
				ISNULL(nombre,' ')as nombre,
				folio,
				importe_total,
				id_forma_pago,
				descripcion,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				tipo,
				concepto
		from	VtReporteTotalesPorPago 
		where	id_forma_pago = @formaPago and 
				@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin and
				id_movimiento_caja_tipo = @tipo and 
				id_movimiento_caja_concepto = @concepto and
				id_sucursal = @sucursal and 
				@activo = activo
	end
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaReporteGerencial]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaReporteGerencial]
	@id_caja as int,
	@fechaIni as DATETIME,
	@fechaFin as DATETIME,
	@sucursal as int,
	@tp1 as int,
	@tp2 as int,
	@tp3 as int,
	@tp4 as int,
	@tp5 as int,
	@tp6 as int,
	@tp7 as int,
	@tp8 as int,
	@tp9 as int,
	@tp10 as int,
	@tp11 as int,
	@tp12 as int,
	@tp13 as int,
	@tp14 as int,
	@tp15 as int
AS
BEGIN
	DECLARE @tmov TABLE 
    (id_movimiento INT 
    );
	if(@tp1 !=0)
	BEGIN
		insert into @tmov values (1);
	END
	if(@tp2 !=0)
	BEGIN
		insert into @tmov values (2);
	END
	if(@tp3 !=0)
	BEGIN
		insert into @tmov values (3);
	END
	if(@tp4 !=0)
	BEGIN
		insert into @tmov values (4);
	END
	if(@tp5 !=0)
	BEGIN
		insert into @tmov values (5);
	END
	if(@tp6 !=0)
	BEGIN
		insert into @tmov values (6);
	END
	if(@tp7 !=0)
	BEGIN
		insert into @tmov values (7);
	END
	if(@tp8 !=0)
	BEGIN
		insert into @tmov values (8);
	END
	if(@tp9 !=0)
	BEGIN
		insert into @tmov values (9);
	END
	if(@tp10 !=0)
	BEGIN
		insert into @tmov values (10);
	END
	if(@tp11 !=0)
	BEGIN
		insert into @tmov values (11);
	END
	if(@tp12 !=0)
	BEGIN
		insert into @tmov values (12);
	END
	if(@tp13 !=0)
	BEGIN
		insert into @tmov values (13);
	END
	if(@tp14 !=0)
	BEGIN
		insert into @tmov values (14);
	END
	if(@tp15 !=0)
	BEGIN
		insert into @tmov values (15);
	END

	IF(@sucursal=0 and @id_caja=0)
	BEGIN
		select	fecha,
				horaCaptura,
				id_cliente,
				rfc,
				no_caja,
				folio,
				total_neto,
				subtotal, 
				iva ,
				ieps,
				id_movimiento_almacen_tipo,
				descuento,
				id_sucursal,
				folioCon,
				folio_fiscal
		from VtReporteGerencial
		where	@fechaIni <= fecha_registro  and 
				fecha_registro <= @fechaFin and id_movimiento_almacen_tipo in (SELECT id_movimiento FROM @tmov)
	END
	IF(@sucursal=0 and @id_caja!=0)
	BEGIN
		select	fecha,
				horaCaptura,
				id_cliente,
				rfc,
				no_caja,
				folio,
				total_neto,
				subtotal, 
				iva ,
				ieps,
				id_movimiento_almacen_tipo,
				descuento,
				id_sucursal,
				folioCon,
				folio_fiscal
		from VtReporteGerencial
		where	@fechaIni <= fecha_registro  and 
				fecha_registro <= @fechaFin and
				@id_caja = id_caja and id_movimiento_almacen_tipo in (SELECT id_movimiento FROM @tmov)
	END
	IF(@sucursal!=0 and @id_caja=0)
	BEGIN
		select	fecha,
				horaCaptura,
				id_cliente,
				rfc,
				no_caja,
				folio,
				total_neto,
				subtotal, 
				iva ,
				ieps,
				id_movimiento_almacen_tipo,
				descuento,
				id_sucursal,
				folioCon,
				folio_fiscal
		from VtReporteGerencial
		where	@fechaIni <= fecha_registro  and 
				fecha_registro <= @fechaFin and
				id_sucursal = @sucursal  and id_movimiento_almacen_tipo in (SELECT id_movimiento FROM @tmov)
	END
	IF(@sucursal!=0 and @id_caja!=0)
	BEGIN
		select	fecha,
				horaCaptura,
				id_cliente,
				rfc,
				no_caja,
				folio,
				total_neto,
				subtotal, 
				iva ,
				ieps,
				id_movimiento_almacen_tipo,
				descuento,
				id_sucursal,
				folioCon,
				folio_fiscal
		from VtReporteGerencial
		where	@fechaIni <= fecha_registro  and 
				fecha_registro <= @fechaFin and
				@id_caja = id_caja and 
				id_sucursal = @sucursal and id_movimiento_almacen_tipo in (SELECT id_movimiento FROM @tmov)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaReporteKardex]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaReporteKardex]
	@sucursal as int,
	@articulo_inicio as nvarchar(10),
	@articulo_fin as nvarchar(10),
	@dateIni as DATETIME,
	@dateFin as DATETIME
AS
BEGIN
declare @flag as int
set @flag =0;
declare  @kardex TABLE(
			id_sucursal int  null,
			id_articulo int  null,
			claveArt nvarchar (10)  null,
			id_agrupador_articulo int  null,
			id_linea_negocio int  null,
			id_subcategoria int  null,
			id_movimiento_almacen int  null,
			fecha_registro nvarchar (12)  null,
			clave nvarchar (2)  null,
			folio nvarchar (12)  null,
			id_movimiento_almacen_detalle int  null,
			id_movimiento_almacen_tipo int  null,
			EntradasU decimal(38,9)  null,
			SalidasU decimal(38,9)  null,
			costo_unitario decimal(18,6)  null,
			costo_promedio decimal(18,6)  null,
			Entradas decimal(38,6)  null,
			Salidas decimal(38,6)  null,
			existencia_al_momento decimal(18,2)  null,
			existencia_valor decimal(37,8)  null, 
			almacen nvarchar (50)  null,
			existencia_compra decimal(12,4)  null,	
			unidad_venta  nvarchar (20)  null
)

declare		@id_sucursal int;
declare		@id_articulo int;
declare		@claveArt nvarchar (10);
declare		@id_agrupador_articulo int;
declare		@id_linea_negocio int;
declare		@id_subcategoria int;
declare		@id_movimiento_almacen int;
declare		@fecha_registro nvarchar (12);
declare		@clave nvarchar (2) ;
declare		@folio nvarchar (12);
declare		@id_movimiento_almacen_detalle int;
declare		@id_movimiento_almacen_tipo int;
declare		@EntradasU decimal(38,9);
declare		@SalidasU decimal(38,9);
declare		@costo_unitario decimal(18,6);
declare		@costo_promedio decimal(18,6);
declare		@Entradas decimal(38,6);
declare		@Salidas decimal(38,6);
declare		@existencia_al_momento decimal(18,2);
declare		@existencia_valor decimal(37,8);
declare		@almacen nvarchar (50);
declare		@existencia_compra decimal(12,4);	
declare		@descripcion  nvarchar (20);

declare		@Aid_sucursal int;
declare		@Aid_articulo int;
declare		@AclaveArt nvarchar (10);
declare		@Aid_agrupador_articulo int;
declare		@Aid_linea_negocio int;
declare		@Aid_subcategoria int;
declare		@Aid_movimiento_almacen int;
declare		@Afecha_registro nvarchar (12);
declare		@Aclave nvarchar (2) ;
declare		@Afolio nvarchar (12);
declare		@Aid_movimiento_almacen_detalle int;
declare		@Aid_movimiento_almacen_tipo int;
declare		@AEntradasU decimal(38,9);
declare		@ASalidasU decimal(38,9);
declare		@Acosto_unitario decimal(18,6);
declare		@Acosto_promedio decimal(18,6);
declare		@AEntradas decimal(38,6);
declare		@ASalidas decimal(38,6);
declare		@Aexistencia_al_momento decimal(18,2);
declare		@Aexistencia_valor decimal(37,8);
declare		@Aalmacen nvarchar (50);
declare		@Aexistencia_compra decimal(12,4);	
declare		@Adescripcion  nvarchar (20);

	if(@sucursal =0)
	BEGIN

	DECLARE CursorKardex CURSOR FOR SELECT 
				id_sucursal,
				id_articulo,
				claveArt,
				id_agrupador_articulo,
				id_linea_negocio,
				id_subcategoria,
				id_movimiento_almacen,
				convert(nvarchar(20),fecha_registro,103),
				clave,
				folio,
				id_movimiento_almacen_detalle,
				id_movimiento_almacen_tipo,
				EntradasU,
				SalidasU,
				costo_unitario,
				costo_ultimo,
				Entradas,
				Salidas,
				existencia_al_momento,
				existencia_valor, 
				almacen,
				existencia_al_momento as existencia_compra,	
				descripcion as unidad_venta
				FROM  VtKardex
			where claveArt >= @articulo_inicio and claveArt <= @articulo_fin 
			and @dateIni <= fecha_registro  and fecha_registro <= @dateFin
			order by id_articulo, id_almacen, id_movimiento_almacen
		
	OPEN CursorKardex
	FETCH NEXT FROM CursorKardex into 
			@id_sucursal,
			@id_articulo,
			@claveArt,
			@id_agrupador_articulo,
			@id_linea_negocio,
			@id_subcategoria,
			@id_movimiento_almacen,
			@fecha_registro,
			@clave,
			@folio,
			@id_movimiento_almacen_detalle,
			@id_movimiento_almacen_tipo,
			@EntradasU,
			@SalidasU,
			@costo_unitario,
			@costo_promedio,
			@Entradas,
			@Salidas,
			@existencia_al_momento,
			@existencia_valor,
			@almacen,
			@existencia_compra,	
			@descripcion


	WHILE @@fetch_status = 0
	BEGIN
		if(@FLAG=0)
   		BEGIN
			INSERT INTO @kardex values(null,null,null, null,null,null,null,@claveArt,null,null,null,null,null,null,null,null,null,null,null,null,null,@existencia_al_momento-@EntradasU+@SalidasU,null)
			INSERT INTO @kardex values(@id_sucursal,@id_articulo,@claveArt, @id_agrupador_articulo,@id_linea_negocio,@id_subcategoria,@id_movimiento_almacen,@fecha_registro,@clave,@folio,@id_movimiento_almacen_detalle,@id_movimiento_almacen_tipo,@EntradasU,@SalidasU,@costo_unitario,@costo_promedio,@Entradas,@Salidas,@existencia_al_momento,@existencia_valor,@almacen,@existencia_compra,@descripcion)
			set @FLAG=1;
		END
		else
		begin
			if(@Aid_articulo = @id_articulo and @Aalmacen= @almacen) 
			begin
				INSERT INTO @kardex values(@id_sucursal,@id_articulo,@claveArt, @id_agrupador_articulo,@id_linea_negocio,@id_subcategoria,@id_movimiento_almacen,@fecha_registro,@clave,@folio,@id_movimiento_almacen_detalle,@id_movimiento_almacen_tipo,@EntradasU,@SalidasU,@costo_unitario,@costo_promedio,@Entradas,@Salidas,@existencia_al_momento,@existencia_valor,@almacen,@existencia_compra,@descripcion)
			end
			else
			begin
				INSERT INTO @kardex values(null,null,null, null,null,null,null,@claveArt,null,null,null,null,null,null,null,null,null,null,null,null,null,@existencia_al_momento-@EntradasU+@SalidasU,null)
				INSERT INTO @kardex values(@id_sucursal,@id_articulo,@claveArt, @id_agrupador_articulo,@id_linea_negocio,@id_subcategoria,@id_movimiento_almacen,@fecha_registro,@clave,@folio,@id_movimiento_almacen_detalle,@id_movimiento_almacen_tipo,@EntradasU,@SalidasU,@costo_unitario,@costo_promedio,@Entradas,@Salidas,@existencia_al_momento,@existencia_valor,@almacen,@existencia_compra,@descripcion)
			end
		end
		set @Aalmacen = @almacen
		set @Aid_articulo = @id_articulo
		FETCH NEXT FROM CursorKardex into 
			@id_sucursal,
			@id_articulo,
			@claveArt,
			@id_agrupador_articulo,
			@id_linea_negocio,
			@id_subcategoria,
			@id_movimiento_almacen,
			@fecha_registro,
			@clave,
			@folio,
			@id_movimiento_almacen_detalle,
			@id_movimiento_almacen_tipo,
			@EntradasU,
			@SalidasU,
			@costo_unitario,
			@costo_promedio,
			@Entradas,
			@Salidas,
			@existencia_al_momento,
			@existencia_valor,
			@almacen,
			@existencia_compra,	
			@descripcion
	END
	CLOSE CursorKardex
	DEALLOCATE CursorKardex
	END
	ELSE 
	BEGIN
		DECLARE CursorKardex CURSOR FOR select 
		id_sucursal,
		id_articulo,
		claveArt,
		id_agrupador_articulo,
		id_linea_negocio,
		id_subcategoria,
		id_movimiento_almacen,
		convert(nvarchar(20),fecha_registro,103),
		clave,
		folio,
		id_movimiento_almacen_detalle,
		id_movimiento_almacen_tipo,
		EntradasU,
		SalidasU,
		costo_unitario,
		costo_ultimo,
		Entradas,
		Salidas,
		existencia_al_momento,
		existencia_valor, 
		almacen,
		existencia_al_momento as existencia_compra,	
		descripcion as unidad_venta
		from VtKardex
		where claveArt >= @articulo_inicio and claveArt <= @articulo_fin and id_sucursal = @sucursal
		and @dateIni <= fecha_registro  and fecha_registro <= @dateFin
		order by id_articulo, id_almacen, id_movimiento_almacen
		
	OPEN CursorKardex
	FETCH NEXT FROM CursorKardex into 
			@id_sucursal,
			@id_articulo,
			@claveArt,
			@id_agrupador_articulo,
			@id_linea_negocio,
			@id_subcategoria,
			@id_movimiento_almacen,
			@fecha_registro,
			@clave,
			@folio,
			@id_movimiento_almacen_detalle,
			@id_movimiento_almacen_tipo,
			@EntradasU,
			@SalidasU,
			@costo_unitario,
			@costo_promedio,
			@Entradas,
			@Salidas,
			@existencia_al_momento,
			@existencia_valor,
			@almacen,
			@existencia_compra,	
			@descripcion


	WHILE @@fetch_status = 0
	BEGIN
		if(@FLAG=0)
   		BEGIN
			
			INSERT INTO @kardex values(null,null,null, null,null,null,null,@claveArt,null,null,null,null,null,null,null,null,null,null,null,null,null,@existencia_al_momento-@EntradasU+@SalidasU,null)
			INSERT INTO @kardex values(@id_sucursal,@id_articulo,@claveArt, @id_agrupador_articulo,@id_linea_negocio,@id_subcategoria,@id_movimiento_almacen,@fecha_registro,@clave,@folio,@id_movimiento_almacen_detalle,@id_movimiento_almacen_tipo,@EntradasU,@SalidasU,@costo_unitario,@costo_promedio,@Entradas,@Salidas,@existencia_al_momento,@existencia_valor,@almacen,@existencia_compra,@descripcion)
			set @FLAG=1;
		END
		else
		begin
			if(@Aid_articulo = @id_articulo and @Aalmacen= @almacen) 
			begin
				INSERT INTO @kardex values(@id_sucursal,@id_articulo,@claveArt, @id_agrupador_articulo,@id_linea_negocio,@id_subcategoria,@id_movimiento_almacen,@fecha_registro,@clave,@folio,@id_movimiento_almacen_detalle,@id_movimiento_almacen_tipo,@EntradasU,@SalidasU,@costo_unitario,@costo_promedio,@Entradas,@Salidas,@existencia_al_momento,@existencia_valor,@almacen,@existencia_compra,@descripcion)
			end
			else
			begin
				
			INSERT INTO @kardex values(null,null,null, null,null,null,null,@claveArt,null,null,null,null,null,null,null,null,null,null,null,null,null,@existencia_al_momento-@EntradasU+@SalidasU,null)
			INSERT INTO @kardex values(@id_sucursal,@id_articulo,@claveArt, @id_agrupador_articulo,@id_linea_negocio,@id_subcategoria,@id_movimiento_almacen,@fecha_registro,@clave,@folio,@id_movimiento_almacen_detalle,@id_movimiento_almacen_tipo,@EntradasU,@SalidasU,@costo_unitario,@costo_promedio,@Entradas,@Salidas,@existencia_al_momento,@existencia_valor,@almacen,@existencia_compra,@descripcion)
			end
		end
		set @Aalmacen = @almacen
		set @Aid_articulo = @id_articulo
		FETCH NEXT FROM CursorKardex into 
			@id_sucursal,
			@id_articulo,
			@claveArt,
			@id_agrupador_articulo,
			@id_linea_negocio,
			@id_subcategoria,
			@id_movimiento_almacen,
			@fecha_registro,
			@clave,
			@folio,
			@id_movimiento_almacen_detalle,
			@id_movimiento_almacen_tipo,
			@EntradasU,
			@SalidasU,
			@costo_unitario,
			@costo_promedio,
			@Entradas,
			@Salidas,
			@existencia_al_momento,
			@existencia_valor,
			@almacen,
			@existencia_compra,	
			@descripcion
	END
	CLOSE CursorKardex
	DEALLOCATE CursorKardex
	END
	select * from @kardex
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaReporteListaPrecios]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 20.10.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaReporteListaPrecios]
	@linea as int,
	@familia as int,
	@proveedor as int,
	@sucursal as int,
	@dateIni as DATETIME,
	@dateFin as DATETIME
AS
BEGIN
	iF(@sucursal =0 and  @familia =0 and @proveedor =0 and @linea =0)
	BEGIN
	select	   DISTINCT id_articulo, 
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
				vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0) 
				and id_articulo_existencia IS NOT NULL and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin

	END 
	ELSE IF(@sucursal =0 and  @familia =0 and @proveedor =0 and @linea !=0)
	BEGIN
		select DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
				vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	id_linea_negocio= @linea 
				and ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0) 
				and id_articulo_existencia IS NOT NULL 
				and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin

	END
	ELSE IF(@sucursal =0 and  @familia =0 and @proveedor !=0 and @linea =0)
	BEGIN
		select DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
						vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	id_proveedor= @proveedor 
				and ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0) 
				and id_articulo_existencia IS NOT NULL and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin

	END
	ELSE IF(@sucursal =0 and  @familia =0 and @proveedor !=0 and @linea !=0)
	BEGIN
	select DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
						vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	id_proveedor= @proveedor 
				and id_linea_negocio= @linea 
				and ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0) 
				and id_articulo_existencia IS NOT NULL and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin

	END
	ELSE IF(@sucursal =0 and  @familia !=0 and @proveedor =0 and @linea =0)
	BEGIN
	select DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
						vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	id_familia = @familia  
				and ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0) 
				and id_articulo_existencia IS NOT NULL and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin

	END
	ELSE IF(@sucursal =0 and  @familia !=0 and @proveedor =0 and @linea !=0)
	BEGIN
		select DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
						vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	id_familia = @familia 
				and id_linea_negocio= @linea 
				and ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0)  
				and id_articulo_existencia IS NOT NULL and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin

	END
	ELSE IF(@sucursal =0 and  @familia !=0 and @proveedor !=0 and @linea =0)
	BEGIN
		select DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
						vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	id_familia = @familia 
				and id_proveedor= @proveedor
				and ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0)  
				and id_articulo_existencia IS NOT NULL and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin

	END
	ELSE IF(@sucursal =0 and  @familia !=0 and @proveedor !=0 and @linea !=0)
	BEGIN
	select DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
						vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	id_familia = @familia 
				and id_proveedor= @proveedor 
				and id_linea_negocio= @linea 
				and ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0) 
				and id_articulo_existencia IS NOT NULL and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin

	END
	ELSE IF(@sucursal !=0 and  @familia =0 and @proveedor =0 and @linea =0)
	BEGIN
	select  DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
						vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0) 
				and id_articulo_existencia IS NOT NULL 
				and s.id_sucursal = @sucursal and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin

	END
	ELSE IF(@sucursal !=0 and  @familia =0 and @proveedor =0 and @linea !=0)
	BEGIN
		select DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
						vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	id_linea_negocio= @linea 
				and ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0) 
				and id_articulo_existencia IS NOT NULL 
				and s.id_sucursal = @sucursal and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin
	END
	ELSE IF(@sucursal !=0 and  @familia =0 and @proveedor !=0 and @linea =0)
	BEGIN
		select DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
						vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	id_proveedor= @proveedor 
				and ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0) 
				and id_articulo_existencia IS NOT NULL 
				and s.id_sucursal = @sucursal and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin
	END
	ELSE IF(@sucursal !=0 and  @familia =0 and @proveedor !=0 and @linea !=0)
	BEGIN
		select DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
						vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	id_proveedor= @proveedor 
				and id_linea_negocio= @linea 
				and ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0) 
				and id_articulo_existencia IS NOT NULL 
				and s.id_sucursal = @sucursal and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin
	END
	ELSE IF(@sucursal !=0 and  @familia !=0 and @proveedor =0 and @linea =0)
	BEGIN
		select DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
						vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	id_familia = @familia 
				and ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0) 
				and id_articulo_existencia IS NOT NULL 
				and s.id_sucursal = @sucursal and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin
	END
	ELSE IF(@sucursal !=0 and  @familia !=0 and @proveedor =0 and @linea !=0 )
	BEGIN
		select DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
						vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	id_familia = @familia 
				and id_linea_negocio= @linea 
				and ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0) 
				and id_articulo_existencia IS NOT NULL 
				and s.id_sucursal = @sucursal and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin
	END
	ELSE IF(@sucursal !=0 and  @familia !=0 and @proveedor !=0 and @linea =0 )
	BEGIN
		select DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
						vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	id_familia = @familia 
				and id_proveedor= @proveedor 
				and ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0) 
				and id_articulo_existencia IS NOT NULL 
				and s.id_sucursal = @sucursal and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin
	END
	ELSE IF(@sucursal !=0 and  @familia !=0 and @proveedor !=0 and @linea !=0 )
	BEGIN
		select DISTINCT id_articulo,
			   clave,
			   desc_super,
			   codigo_barras1,
			   Convert(decimal(18,4),precio1)AS precio1,
			   Convert(decimal(18,4),precio2)AS precio2,
			   Convert(decimal(18,4),precio3)AS precio3,
			   fecha_ultima_modificacion,
			   (select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal) as existencia_venta,
				(dbo.fnCalcularExistenciaCadena(vt.id_articulo, vt.relacion_venta, vt.relacion_compra, vt.id_sucursal)) as existencia_compra,
						vt.relacion_compra,
				vt.relacion_venta,
				s.clave_sucursal as nombre
		from VtReporteListaPrecios vt LEFT JOIN 
			sucursal s ON s.id_sucursal = vt.id_sucursal
		where	id_familia = @familia 
				and id_proveedor= @proveedor 
				and id_linea_negocio= @linea 
				and ((select sum(existencia_actual) 
						from articulo_existencia a LEFT JOIN 
						almacen ae ON a.id_almacen = ae.id_almacen
						where a.id_articulo = vt.id_articulo and id_sucursal = vt.id_sucursal)>0) 
				and id_articulo_existencia IS NOT NULL 
				and s.id_sucursal = @sucursal and
				@dateIni <= fecha_modificacion  and 
				fecha_modificacion <= @dateFin
	END		
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaReportePromocion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaReportePromocion]
	@sucursal as int,
	@monto as int,
	@tipo as int,
	@dateIni as DATETIME,
	@dateFin as DATETIME
AS
BEGIN
	IF(@sucursal = 0 and @monto = 0 and @tipo =0)
	BEGIN
		Select	distinct(clave), 
				id_promocion_tipo, 
				descripcion, 
				articulos,
				cantidades,
				convert(NVARCHAR, vigencia_inicio, 103) AS vigencia_inicio,
				convert(NVARCHAR, vigencia_fin, 103) AS vigencia_fin,
				limite_sucursal,
				nombre, 
				promocion,
				id_promocion_aplicacion,
				(select sum (aplicadas) from [VtReportePromocion] where clave = v.clave) as aplicadas
		from	[VtReportePromocion] v
		where	@dateIni <= vigencia  and 
				vigencia <= @dateFin
	END
	IF(@sucursal = 0 and @monto = 0 and @tipo != 0)
	BEGIN
		Select	distinct(clave), 
				id_promocion_tipo, 
				descripcion, 
				articulos,
				cantidades,
				convert(NVARCHAR, vigencia_inicio, 103) AS vigencia_inicio,
				convert(NVARCHAR, vigencia_fin, 103) AS vigencia_fin,
				limite_sucursal,
				nombre, 
				promocion,
				id_promocion_aplicacion,
				(select sum (aplicadas) from [VtReportePromocion] where clave = v.clave) as aplicadas
		from	[VtReportePromocion] v
		where	id_promocion_tipo = @tipo and 
				@dateIni <= vigencia  and 
				vigencia <= @dateFin
	END
	IF(@sucursal = 0 and @monto != 0 and @tipo =0)
	BEGIN
		Select	distinct(clave), 
				id_promocion_tipo, 
				descripcion, 
				articulos,
				cantidades,
				convert(NVARCHAR, vigencia_inicio, 103) AS vigencia_inicio,
				convert(NVARCHAR, vigencia_fin, 103) AS vigencia_fin,
				limite_sucursal,
				nombre, 
				promocion,
				id_promocion_aplicacion,
				(select sum (aplicadas) from [VtReportePromocion] where clave = v.clave)as aplicadas
		from	[VtReportePromocion] v
		where	id_promocion_aplicacion = @monto and
				@dateIni <= vigencia  and 
				vigencia <= @dateFin
	END
	IF(@sucursal = 0 and @monto != 0 and @tipo !=0)
	BEGIN
		Select	distinct(clave), 
				id_promocion_tipo, 
				descripcion, 
				articulos,
				cantidades,
				convert(NVARCHAR, vigencia_inicio, 103) AS vigencia_inicio,
				convert(NVARCHAR, vigencia_fin, 103) AS vigencia_fin,
				limite_sucursal,
				nombre, 
				promocion,
				id_promocion_aplicacion,
				(select sum (aplicadas) from [VtReportePromocion] where clave = v.clave)as aplicadas
		from	[VtReportePromocion] v 
		where	id_promocion_aplicacion = @monto and
				id_promocion_tipo = @tipo and
				@dateIni <= vigencia  and 
				vigencia <= @dateFin
	END
	IF(@sucursal != 0 and @monto = 0 and @tipo =0)
	BEGIN
		Select	distinct(clave), 
				id_promocion_tipo, 
				descripcion, 
				articulos,
				cantidades,
				convert(NVARCHAR, vigencia_inicio, 103) AS vigencia_inicio,
				convert(NVARCHAR, vigencia_fin, 103) AS vigencia_fin,
				limite_sucursal,
				nombre, 
				promocion,
				id_promocion_aplicacion,
				(select sum (aplicadas) from [VtReportePromocion] where clave = v.clave)as aplicadas
		from	[VtReportePromocion] v
		where	id_sucursal = @sucursal and 
				@dateIni <= vigencia  and 
				vigencia <= @dateFin
	END
	IF(@sucursal != 0 and @monto = 0 and @tipo !=0)
	BEGIN
		Select	distinct(clave), 
				id_promocion_tipo, 
				descripcion, 
				articulos,
				cantidades,
				convert(NVARCHAR, vigencia_inicio, 103) AS vigencia_inicio,
				convert(NVARCHAR, vigencia_fin, 103) AS vigencia_fin,
				limite_sucursal,
				nombre, 
				promocion,
				id_promocion_aplicacion,
				(select sum (aplicadas) from [VtReportePromocion] where clave = v.clave)as aplicadas
		from	[VtReportePromocion] v
		where	id_promocion_tipo = @tipo and 
				id_sucursal = @sucursal and 
				@dateIni <= vigencia  and 
				vigencia <= @dateFin
	END
	IF(@sucursal != 0 and @monto != 0 and @tipo =0)
	BEGIN
		Select	distinct(clave), 
				id_promocion_tipo, 
				descripcion, 
				articulos,
				cantidades,
				convert(NVARCHAR, vigencia_inicio, 103) AS vigencia_inicio,
				convert(NVARCHAR, vigencia_fin, 103) AS vigencia_fin,
				limite_sucursal,
				nombre, 
				promocion,
				id_promocion_aplicacion,
				(select sum (aplicadas) from [VtReportePromocion] where clave = v.clave)as aplicadas
		from	[VtReportePromocion] v
		where	id_promocion_aplicacion = @monto and
				id_sucursal = @sucursal and 
				@dateIni <= vigencia  and 
				vigencia <= @dateFin
	END
	IF(@sucursal != 0 and @monto != 0 and @tipo !=0)
	BEGIN
		Select	distinct(clave), 
				id_promocion_tipo, 
				descripcion, 
				articulos,
				cantidades,
				convert(NVARCHAR, vigencia_inicio, 103) AS vigencia_inicio,
				convert(NVARCHAR, vigencia_fin, 103) AS vigencia_fin,
				limite_sucursal,
				nombre, 
				promocion,
				id_promocion_aplicacion,
				(select sum (aplicadas) from [VtReportePromocion] where clave = v.clave)as aplicadas
		from	[VtReportePromocion] v
		where	id_promocion_aplicacion = @monto and
				id_promocion_tipo = @tipo and 
				id_sucursal = @sucursal and 
				@dateIni <= vigencia  and 
				vigencia <= @dateFin
	END
				
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaReporteRecargas]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ricardo Benitez
-- Create date: 18.Octubre.2019
-- Description:	Muestro todos los registros de 
--				recargas y se modificó el filtro
-- =============================================

-- =============================================
-- Author:		Carolina Franco
-- Create date: 30.Mayo.2019
-- Description:	SP
-- =============================================

-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================

CREATE PROCEDURE [dbo].[spConsultaReporteRecargas]
	@id_caja as int,
	@fechaIni as DATETIME,
	@fechaFin as DATETIME,
	@sucursal as int,
	@estatus as int
AS
BEGIN
	SELECT	id_suc,
			clave_sucursal,
			fecha_date,
			CONVERT(nvarchar, fecha, 103) as fecha,
			FORMAT(CONVERT(datetime, hora), 'hh:mm tt') as hora,
			Documento,
			autorizacion,
			telefono,
			CASE WHEN id_estatus = 0 THEN monto ELSE 0 END as monto,
			id_estatus,
			estatus,
			id_caja,
			no_caja,
			articulo,
			aplicada
	FROM	VtReporteRecargas
	WHERE	@fechaIni <= fecha_date  AND fecha_date <= @fechaFin AND 
			((@id_caja = -1 AND id_caja IS NOT NULL) OR (@id_caja IS NOT NULL AND id_caja = @id_caja)) AND 
			((@sucursal = -1 AND id_suc IS NOT NULL) OR (@sucursal IS NOT NULL AND id_suc = @sucursal)) AND 
			((@estatus = -1) OR (@estatus IS NOT NULL AND id_estatus = @estatus OR (@estatus=3 AND id_estatus is Null)))
	ORDER BY fecha_date DESC
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaReporteRetiros]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaReporteRetiros]
	@sucursal as int,
	@dateIni as DATETIME,
	@dateFin as DATETIME,
	@tp1 as int,
	@tp2 as int,
	@tp3 as int,
	@tp4 as int,
	@tp5 as int,
	@habilitada as int
AS
BEGIN

	DECLARE @tmov TABLE 
    (id_movimiento INT 
    );
	if(@tp1 !=0)
	BEGIN
		insert into @tmov values (1);
	END
	if(@tp2 !=0)
	BEGIN
		insert into @tmov values (2);
	END
	if(@tp3 !=0)
	BEGIN
		insert into @tmov values (3);
	END
	if(@tp4 !=0)
	BEGIN
		insert into @tmov values (4);
	END
	if(@tp5 !=0)
	BEGIN
		insert into @tmov values (5);
	END
	

	if(@sucursal =0 )
	BEGIN
		select 
		fecha,
		vt.id_caja,
		vt.no_caja,
		nombre_caja,
		folio,
		hora,
		importe_total,
		tipomc,
		descripcion,
		observaciones
		from	VtReporteRetiros vt 
				lEFT JOIN caja c ON c.id_caja = vt.id_caja
		where	c.habilitada = @habilitada 
				and fecha_registro>= @dateIni 
				and fecha_registro<= @dateFin 
				and id_movimiento_caja_tipo in (SELECT id_movimiento FROM @tmov)
				group by vt.id_caja, fecha, vt.no_caja, vt.nombre_caja, vt.folio, vt.hora, vt.importe_total, vt.tipomc, vt.descripcion, vt.observaciones
	END
	ELSE 
	BEGIN
		select 
		fecha,
		vt.id_caja,
		vt.no_caja,
		nombre_caja,
		folio,
		hora,
		importe_total,
		tipomc,
		descripcion,
		observaciones
		from	VtReporteRetiros vt
				lEFT JOIN caja c ON c.id_caja = vt.id_caja
		where	c.habilitada = @habilitada 
				and fecha_registro>= @dateIni 
				and fecha_registro<= @dateFin 
				and id_movimiento_caja_tipo in (SELECT id_movimiento FROM @tmov)
				and @sucursal = c.id_sucursal
				group by vt.id_caja, fecha, vt.no_caja, vt.nombre_caja, vt.folio, vt.hora, vt.importe_total, vt.tipomc, vt.descripcion, vt.observaciones
	END

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaReporteVenta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaReporteVenta]
	@sucursal as int,
	@dateIni as DATETIME,
	@dateFin as DATETIME,
	@caja as int
AS
BEGIN

	if(@sucursal =0)
	BEGIN
		if(@caja =0)
		BEGIN
			SELECT	
			fecha_string,
			hora_string,
			no_caja,
			folio,
			folio_fiscal,
			subtotal,
			iva , 
			ieps,
			total_neto
			from [VtReporteVenta] 
			WHERE
					fecha_registro>= @dateIni 
					and fecha_registro<= @dateFin 
		END
		ELSE
		BEGIN
			SELECT	
			fecha_string,
			hora_string,
			no_caja,
			folio,
			folio_fiscal,
			subtotal,
			iva , 
			ieps,
			total_neto
			from [VtReporteVenta] 
			WHERE
					fecha_registro>= @dateIni 
					and fecha_registro<= @dateFin 
					and id_caja = @caja
		END
	END
	ELSE 
	BEGIN
		if(@caja =0)
		BEGIN
			SELECT	
			fecha_string,
			hora_string,
			no_caja,
			folio,
			folio_fiscal,
			subtotal,
			iva , 
			ieps,
			total_neto
			from [VtReporteVenta] 
			WHERE
					fecha_registro>= @dateIni 
					and fecha_registro<= @dateFin 
					and @sucursal = id_sucursal
		END
		ELSE
		BEGIN
			SELECT	
			fecha_string,
			hora_string,
			no_caja,
			folio,
			folio_fiscal,
			subtotal,
			iva , 
			ieps,
			total_neto
			from [VtReporteVenta] 
			WHERE
					fecha_registro>= @dateIni 
					and fecha_registro<= @dateFin 
					and @sucursal = id_sucursal
					and id_caja = @caja
		END
	END

	SELECT	
			fecha_string,
			hora_string,
			no_caja,
			folio,
			folio_fiscal,
			subtotal,
			iva , 
			ieps,
			total_neto
			from [VtReporteVenta] 
			WHERE
					fecha_registro>= @dateIni 
					and fecha_registro<= @dateFin 
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaReporteVentaUtilidad]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.Mayo.2018
-- Description:	SP
-- =============================================

-- =============================================
-- Author:		Carolina Franco
-- Create date: 21 Abril 2019
-- Description:	SP
-- =============================================

CREATE PROCEDURE [dbo].[spConsultaReporteVentaUtilidad]
	
	@fechaIni as DATETIME,
	@fechaFin as DATETIME,
	@sucursal as int,
	@agrupador as int,
	@linea as int,
	@almacen as int
AS
BEGIN
	select		
		v.id_articulo,
		clave_sucursal,
		clave_almacen,
		v.id_agrupador_articulo,
		v.id_subcategoria,
		v.id_linea_negocio,
		v.desc_super,
		clave_articulo,
		agrupador_clave,
		linea,
		sum (cantidad) as cantidad,
		sum (cantidad_uc) as cantidad_uc, 
		sum (costo)  as costo,
		sum	(total_venta) as total_venta,
		sum	(total_venta) - sum (costo) as utilidad_bruta,
		Case sum(costo) When 0 THEN 0 ELSE (((sum(total_venta) * 1.0) / (sum(costo))) - 1.0) END as utilidad_porcentaje,
		sum (costo_neto) as costo_neto,
		sum(total_venta_neta) as total_venta_neta,
		sum(Ieps)as ieps,
		sum(Iva) as iva
	from	
		VtReporteVentaUtilidad v
	where	
		v.fecha_registro between @fechaIni and @fechaFin
		and ((@sucursal = 0 and v.id_sucursal IS NOT NULL) or (@sucursal != 0 and v.id_sucursal = @sucursal))
		and ((@linea = 0 and v.id_linea_negocio IS NOT NULL) or (@linea != 0 and v.id_linea_negocio = @linea)) 
		and ((@agrupador = 0 and v.id_agrupador_articulo IS NOT NULL) or (@agrupador != 0 and v.id_agrupador_articulo = @agrupador))
		and ((@almacen = 0 and v.id_almacen IS NOT NULL) or (@almacen != 0 and v.id_almacen = @almacen))  
	group by	
		v.id_articulo,	
		v.id_agrupador_articulo,
		v.id_subcategoria,
		v.id_linea_negocio,
		v.desc_super,
		clave_articulo, 
		agrupador_clave,
		clave_sucursal,
		clave_almacen,
		linea,
		v.fecha_registro
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaRetirosPendientes]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-01
-- Description:	Consultar los movimientos de caja de retiro de billetes pendientes 
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaRetirosPendientes]
	@id_sucursal  as int,
	@id_movimiento_caja_tipo as int,
	@id_movimiento_caja_concepto as int
AS
BEGIN
	SELECT 
		mc.id_movimiento_caja,
		c.no_caja,
		mc.folio,
		CONVERT(date, mc.fecha_registro) as dia,
		FORMAT(mc.fecha_registro, 'HH:mm:ss') as hora,
		(mc.importe_total * -1) as importe_total
		
	 FROM movimiento_caja mc INNER JOIN caja c ON mc.id_caja = c.id_Caja
		WHERE mc.id_movimiento_caja_tipo = @id_movimiento_caja_tipo 
		AND mc.id_movimiento_caja_concepto = @id_movimiento_caja_concepto 
		AND mc.id_tira_banco IS NULL
		AND mc.id_sucursal = @id_sucursal
	order by
		dia asc, mc.id_caja asc, hora asc
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarExistenciaAlmacenPV]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Saul Cruces
-- Create date: 25.julio.2018
-- Description:	Controlar existencia para punto de venta
-- =============================================

-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-10-05
-- Description:	Si cantidad es negativa y viene de cotizacion, solo afecta existencia_actual y ni existencia_apartado
-- =============================================

-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-06-14
-- Description:	Se guarda el costo y tasas de impuestos en las minitrasnferencias
-- =============================================

-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-06-18
-- Description:	Cambiar tasas venta por tasas compra
-- =============================================

-- =============================================
-- Author:		Carolina Franco
-- Create date: 2019-06-27
-- Description:	Se corrige existencia inicial
-- =============================================

--=============================================
-- Author:		Ricardo Benitez
-- Create date: 22.Enero.2020
-- Description:	Se modifico completamente el funcionamiento de las
--              transferencias automaticas de mayoreo a super
-- =============================================

CREATE PROCEDURE [dbo].[spConsultarExistenciaAlmacenPV]
	@idArticulo        AS INT,
	@idAlmacen         AS INT,
	@idSucursal        AS INT,
	@idCotizacion      AS INT,
	@cantidad          AS DECIMAL(18,4),
	@idCaja            AS INT,
	@idUsuarioLogueado AS INT,
	@modo              AS INT
AS
BEGIN
	DECLARE @existencia      AS DECIMAL(18,4)
	DECLARE @hayExistencia   AS BIT
	DECLARE @idAlmacenSuc    AS INT
	DECLARE @idAlmEncontro   AS INT
	DECLARE @multiAlmacen    AS BIT
	DECLARE @cantidadInicial AS DECIMAL(18,4)
	DECLARE @cantApartado    AS DECIMAL(18,4)
	DECLARE @cotValida	     AS	BIT
	DECLARE @relacionVenta   AS DECIMAL(18,2)
	DECLARE @tasaIVA         AS DECIMAL(18,2)
	DECLARE @tasaIEPS        AS DECIMAL(18,2)
	DECLARE @costo           AS DECIMAL(18,6)

	SET @cantApartado    = 0
	SET @cantidadInicial = @cantidad
	SET @idAlmEncontro   = 0
	SET @hayExistencia   = 0

	BEGIN TRANSACTION
	BEGIN TRY

	--Si el movimiento NO es de una cotizacion
	IF @idCotizacion = 0
	BEGIN
		--Obtenemos la existencia en el almacen donde estamos haciendo la venta
		SET @existencia    = 0
		SELECT @existencia = ISNULL(existencia_actual, 0) FROM articulo_existencia WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacen

		--Verificar si tenemos la cantidad solicitada en el almacen donde estamos haciendo la venta
		IF @existencia >= @cantidad
		BEGIN
			--Si contamos con la existencia en el almacen de venta donde estamos haciendo la venta pasa directo a actualizar la existencia
			SET @hayExistencia = 1
			SET @idAlmEncontro = @idAlmacen
		END
		ELSE
		BEGIN
			--No encontro existencia en el almacen donde estamos haciendo la venta, asi que buscara en otro almacen existencia
			--Solo si el almacen es de super(ID: 1) realizara la transferencia automatica de mayoreo(ID: 2)
			IF @idAlmacen = 1
			BEGIN
				--A la cantidad solicitada en super le restamos la existencia que tenemos en super
				--Asi solo transferimos la cantidad que nos falta para completar la venta
				SET @cantidad = @cantidad - @existencia

				--De momento se modifico para que solo busque en el almacen de mayoreo y no en otros como merma
				--Pero se dejo la misma estructura del cursor
				DECLARE cAlmacenes CURSOR FOR SELECT id_almacen FROM almacen WHERE id_sucursal = 19 AND id_almacen = 2
				OPEN cAlmacenes
				FETCH NEXT FROM cAlmacenes INTO @idAlmacenSuc
				WHILE @@FETCH_STATUS = 0
				BEGIN
					--Obtenemos la existencia en el almacen de mayoreo del articulo solicitado
					SET @existencia = 0

					SELECT @existencia = existencia_actual FROM articulo_existencia 
					WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacenSuc

					--Verifica si hay la cantidad faltante, si hay el proceso continua de lo contrario aqui termina
					IF @existencia >= @cantidad
					BEGIN
						--Establecemos en las variables que si se encontro la existencia y el almacen de mayoreo donde lo encontro
						SET @hayExistencia = 1
						SET @idAlmEncontro = @idAlmacenSuc

						--Obtenemos el costo del movimiento para el articulo, como es interna la transferencia
						--se utiliza el costo promedio unitario sin impuestos
						DECLARE @cUnitario    AS DECIMAL(18,4)
						DECLARE @idUnidMedida AS INT
						DECLARE @idIVA        AS INT
						DECLARE @idIEPS       AS INT
						DECLARE @IVA          AS DECIMAL(5,2)
						DECLARE @IEPS         AS DECIMAL(5,2)
						DECLARE @subtotal     AS DECIMAL(18,2)
						DECLARE @tIVA         AS DECIMAL(18,2)
						DECLARE @tIEPS        AS DECIMAL(18,2)
						DECLARE @importe      AS DECIMAL(18,2)

						SELECT 
							@costo        = costo_promedio * @cantidad,
							@cUnitario    = costo_promedio,
							@idUnidMedida = id_unidad_venta
						FROM articulo WHERE id_articulo = @idArticulo

						SET @subtotal = @cantidad * @cUnitario
						SET @importe  = @subtotal
						SET @tIVA     = 0
						SET @tIEPS    = 0
						SET @IVA      = 0;
						SET @IEPS     = 0;

						--Se realizara una transferencia automatica de salida Y del almacen de mayoreo al de super por lo que falta para hacer la venta
						--DECLARE @nombreSecuencia AS NVARCHAR(max)
						DECLARE @idTipoMov         AS INT
						DECLARE @idUsuarioAutorizo AS INT
						DECLARE @NextId            AS BIGINT
						DECLARE @noSucursal        AS NVARCHAR(2)
						DECLARE @noCaja            AS NVARCHAR(2)
						DECLARE @folioS            AS NVARCHAR(12)

						--Obtenemos el id del tipo de movimiento Y-TRANS AUTOMATICA EN SUPER (SAL)
						SELECT @idTipoMov = id_movimiento_almacen_tipo FROM movimiento_almacen_tipo WHERE clave = 'Y'

						--Usuaremos el id del usuario master como autorizador del movimiento
						SELECT @idUsuarioAutorizo = id_usuario FROM usuario WHERE nombre = 'MASTER'

						--Obtenemos el numero consecutivo para el movimiento de salida Y-TRANS AUTOMATICA EN SUPER (SAL)
						EXEC spObtenerSiguienteConsecutivoMovimientos
							@idOrigen          = @idTipoMov,
							@idSucursal        = @idSucursal,
							@idCaja            = @idCaja,
							@origenConsecutivo = 1,
							@siguienteNumero   = @NextId OUTPUT

						--Creamos el folio para la transferencia de salida
						SET @noSucursal = REPLICATE('0', 2 - LEN(@idSucursal)) + CAST(@idSucursal AS NVARCHAR)
						SET @noCaja     = REPLICATE('0', 2 - LEN(@idCaja)) + CAST(@idCaja AS NVARCHAR)
						SET @folioS     = REPLICATE('0', 7 - LEN(@NextId)) + CAST(@NextId AS NVARCHAR)
						SET @folioS     = 'Y' + @noSucursal + @noCaja + @folioS

						--Guardardamos la salida en movimiento_almacen
						INSERT INTO movimiento_almacen(
							id_movimiento_almacen_tipo,
							id_sucursal,
							id_almacen,
							id_caja,
							folio,
							subtotal,
							descuento,
							total_neto,
							fecha_registro,
							id_usuario_logueado,
							id_usuario_autorizo,
							consecutivo,
							total_iva,
							total_ieps)
						VALUES(
							@idTipoMov,
							@idSucursal,
							@idAlmacenSuc,
							@idCaja,
							@folioS,
							@costo,
							0,
							@costo,
							GETDATE(),
							@idUsuarioLogueado,
							@idUsuarioAutorizo,
							@NextId,
							0,
							0)

						--Obtenemos el id_movimiento_almacen que se genero para el movimiento_almacen_detalle
						DECLARE @idMovAlmSalida AS INT
						SET @idMovAlmSalida = SCOPE_IDENTITY()

						--Actualizamos la existencia restando la cantidad solicitada al articulo del almacen que sale
						DECLARE @existenciaActualSalida DECIMAL(18,2)

						SET @existenciaActualSalida = 0

						SELECT @existenciaActualSalida = ISNULL(existencia_actual,0) FROM articulo_existencia 
						WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacenSuc

						SET @existenciaActualSalida = @existenciaActualSalida - @cantidad

						UPDATE articulo_existencia SET existencia_actual = @existenciaActualSalida
						WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacenSuc

						--Obtenemos el total de existencia actual del almacen para guardarla en movimiento_almacen_detalle.existencia_al_momento
						SET @existenciaActualSalida = 0

						SELECT @existenciaActualSalida = ISNULL(existencia_actual,0) + ISNULL(existencia_apartado,0) + ISNULL(existencia_venta,0) 
						FROM articulo_existencia WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacenSuc

						--Guardardamos los detalles de la salida en movimiento_almacen_detalle
						INSERT INTO movimiento_almacen_detalle(
							id_movimiento_almacen,
							id_almacen,
							id_articulo,
							consecutivo,
							cantidad,
							costo_unitario,
							id_unidad_medida,
							descuento,
							importe,
							existencia_al_momento,
							subtotal,
							iva,
							ieps,
							es_mayoreo,
							costo,
							tasa_iva,
							tasa_ieps)
						VALUES(
							@idMovAlmSalida,
							@idAlmacenSuc,
							@idArticulo,
							1,
							@cantidad,
							@cUnitario,
							@idUnidMedida,
							0,
							@importe,
							@existenciaActualSalida,
							@subtotal,
							@tIVA,
							@tIEPS,
							0,
							@costo,
							@tasaIVA,
							@tasaIEPS)

						--Se realizara una transferencia automatica de entrada X del almacen de mayoreo al de super por lo que falta para hacer la venta
						--Obtenemos el id del tipo de movimiento X-TRANS AUTOMATICA EN SUPER (ENT)
						SELECT @idTipoMov = id_movimiento_almacen_tipo FROM movimiento_almacen_tipo WHERE clave = 'X'

						--Obtenemos el numero consecutivo para el movimiento de entrada X-TRANS AUTOMATICA EN SUPER (ENT)
						EXEC spObtenerSiguienteConsecutivoMovimientos
							@idOrigen          = @idTipoMov,
							@idSucursal        = @idSucursal,
							@idCaja            = @idCaja,
							@origenConsecutivo = 1,
							@siguienteNumero   = @NextId OUTPUT

						--Creamos el folio para la transferencia de entrada
						DECLARE @idReferencia AS INT
						DECLARE @folioE       AS NVARCHAR(12)
						
						SET @folioE = REPLICATE('0', 7 - LEN(@NextId)) + CAST(@NextId AS NVARCHAR)
						SET @folioE = 'X' + @noSucursal + @noCaja + @folioE

						--Obtenemos el folio de referencia de salida para la entrada
						SELECT @idReferencia = id_movimiento_almacen FROM movimiento_almacen WHERE folio = @folioS

						--Vamos a verificar si el articulo cuenta con registro de existencia en el almacen de super
						--si tiene registro actualiza la existencia, si no tiene la inserta por primera vez
						DECLARE @existenciaActualEntrada DECIMAL(18,2)

						IF EXISTS(SELECT * FROM articulo_existencia WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacen)
						BEGIN
							--Actualizamos la existencia sumando la cantidad solicitada al articulo del almacen que entra
							SET @existenciaActualEntrada = 0

							SELECT @existenciaActualEntrada = ISNULL(existencia_actual,0) FROM articulo_existencia 
							WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacen

							SET @existenciaActualEntrada = @existenciaActualEntrada + @cantidad

							UPDATE articulo_existencia SET existencia_actual = @existenciaActualEntrada
							WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacen

							--Obtenemos el total de existencia actual del almacen para guardarla en movimiento_almacen_detalle.existencia_al_momento
							SET @existenciaActualEntrada = 0

							SELECT @existenciaActualEntrada = ISNULL(existencia_actual,0) + ISNULL(existencia_apartado,0) + ISNULL(existencia_venta,0) 
							FROM articulo_existencia WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacen
						END
						ELSE
						BEGIN
							--Insertamos la existencia_actual por primera vez con la cantidad solicitada al articulo del almacen que sale
							SET @existenciaActualEntrada = 0
							
							INSERT INTO [dbo].[articulo_existencia](
								[id_articulo]
								,[id_almacen]
								,[total_entradas]
								,[total_salidas]
								,[existencia_actual]
								,[existencia_apartado]
								,[existencia_venta]
								,[stock_minimo]
								,[stock_maximo]
								,[existencia_inicial])
							VALUES(
								@idArticulo
								,@idAlmacen
								,1
								,0
								,@cantidad
								,0
								,0
								,1
								,1000
								,0)
						END

						--Guardardamos la entrada en movimiento_almacen
						INSERT INTO movimiento_almacen(
							id_movimiento_almacen_tipo,
							id_sucursal,
							id_almacen,
							id_caja,
							folio,
							subtotal,
							descuento,
							total_neto,
							fecha_registro,
							id_usuario_logueado,
							id_usuario_autorizo,
							id_referencia,
							referencia,
							id_almacen_origen,
							consecutivo,
							total_iva,
							total_ieps)
						VALUES(
							@idTipoMov,
							@idSucursal,
							@idAlmacen,
							@idCaja,
							@folioE,
							0,
							0,
							0,
							GETDATE(),
							@idUsuarioLogueado,
							@idUsuarioAutorizo,
							@idReferencia,
							@folioS,
							@idAlmacenSuc,
							@NextId,
							0,
							0)

						--Obtenemos el id_movimiento_almacen que se genero para el movimiento_almacen_detalle
						DECLARE @idMovAlmEntrada AS INT
						SET @idMovAlmEntrada = SCOPE_IDENTITY()

						--Guardardamos los detalles de la entrada en movimiento_almacen_detalle
						INSERT INTO movimiento_almacen_detalle(
							id_movimiento_almacen,
							id_almacen,
							id_articulo,
							consecutivo,
							cantidad,
							costo_unitario,
							id_unidad_medida,
							descuento,
							importe,
							existencia_al_momento,
							subtotal,
							iva,
							ieps,
							es_mayoreo,
							costo,
							tasa_iva,
							tasa_ieps)
						VALUES(
							@idMovAlmEntrada,
							@idAlmacen,
							@idArticulo,
							1,
							@cantidad,
							@cUnitario,
							@idUnidMedida,
							0,
							@importe,
							@existenciaActualEntrada,
							@subtotal,
							@tIVA,
							@tIEPS,
							0,
							@costo,
							@tasaIVA,
							@tasaIEPS)

						SET @idAlmEncontro = @idAlmacen
						BREAK;
					END
					FETCH NEXT FROM cAlmacenes
					INTO @idAlmacenSuc
				END
				CLOSE cAlmacenes
				DEALLOCATE cAlmacenes
			END
		END
	END

	--Si el movimiento SI es de una cotizacion
	ELSE
	BEGIN
		--Obtenemos el tiempo establecido de duracion de la cotizacion
		DECLARE @tiempoValido AS INT

		SELECT @tiempoValido = CAST(valor AS INT) FROM variable_config WHERE nombre = 'MIN_COT_APARTADO' AND id_sucursal = @idSucursal

		--Obtenemos la fecha_registro de la cotizacion
		DECLARE @fechaRegistroCotizacion AS DATETIME

		SELECT @fechaRegistroCotizacion = fecha_registro FROM cotizacion WHERE id_cotizacion = @idCotizacion

		--Verificamos que la cotizacion siga siendo valida por tiempo
		DECLARE @diferenciaMinutos  AS INT

		SELECT @diferenciaMinutos = DATEDIFF(MINUTE, @fechaRegistroCotizacion, GETDATE())

		--Si la cotizacion sigue siendo valida por tiempo
		IF @tiempoValido >= @diferenciaMinutos
		BEGIN
			DECLARE @cotizacionApartado AS INT
			SELECT @cotizacionApartado = cotizacion_apartada FROM cotizacion WHERE id_cotizacion = @idCotizacion

			--Si la cotizacion sigue siendo valida por estado 1
			IF(@cotizacionApartado = 1)
			BEGIN
				DECLARE @apartado AS DECIMAL(18,4)

				SET @cotValida = 1
				SET @apartado  = 0

				--Obtenemos el id_almacen donde se hizo la cotizacion y el apartado del articulo que tiene ese almacen
				SELECT @idAlmacen = id_almacen FROM cotizacion_detalle WHERE id_cotizacion = @idCotizacion AND id_articulo = @idArticulo
				SELECT @apartado = existencia_apartado FROM articulo_existencia WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacen

				--Si la cantidad apartada puede surtir la cantidad solicitada
				IF @apartado >= @cantidad
				BEGIN
					SET @hayExistencia   = 1
					SET @cantidadInicial = 0
					SET @cantApartado    = @cantidad
					SET @idAlmEncontro   = @idAlmacen
				END
				ELSE
				BEGIN
					SET @hayExistencia = 0
					SET @idAlmEncontro = 0
				END
			END
			--La cotizacion ya no es valida 0
			ELSE
			BEGIN
				SET @hayExistencia = 0
				SET @idAlmEncontro = 0
			END
		END
		--Si la cotizacion ya no es valida por tiempo hay que ver si se puede liberar su existencia 
		ELSE
		BEGIN

			--IF(@cantidadInicial > 0 )
			--BEGIN
			--	SET @cantidadInicial = @cantidadInicial * -1
			--END

			SET @hayExistencia = 0
			SET @idAlmEncontro = 0
		END
	END

	--Si encontro el articulo en algun almacen aplica la actualizacion de existencia para apartado y/o venta
	--@cantidadInicial es la @cantidad que se solicito para venta pero sin modificar por que @cantidad pudo
	--haber cambiado al solicitar solo una parte faltante para hacer la venta
	IF @idAlmEncontro > 0
	BEGIN
			UPDATE 
			articulo_existencia
		SET 
			existencia_actual   = ISNULL(existencia_actual,0) - @cantidadInicial,
			existencia_apartado = ISNULL(existencia_apartado,0) - @cantApartado,
			existencia_venta    = ISNULL(existencia_venta,0)  + @cantidadInicial + @cantApartado
		WHERE 
			id_articulo = @idArticulo AND id_almacen = @idAlmEncontro
	END

	--La actualizacion de existencia es por el movimiento de cancelar cotizacion cuando se
	--iba a cobrar, lo quita de existencia_venta y lo pone en existencia_actual
	IF(@cantidadInicial < 0 AND @idCotizacion != 0)
	BEGIN

		--Hay que validar si es por tiempo o cancelacion que no se procede con la cotizacion
		UPDATE 
			articulo_existencia
		SET 
			existencia_actual = existencia_actual + (@cantidadInicial*-1),
			existencia_venta  = ISNULL(existencia_venta,0) - (@cantidadInicial*-1)
		WHERE 
			id_articulo = @idArticulo AND id_almacen = @idAlmacen
	END

	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		--Si hay un error todo lo regresa en 0 para que no haga ningun movimiento
		SET @hayExistencia = 0
		SET @idAlmEncontro = 0
		ROLLBACK TRANSACTION
	END CATCH	

	--Se entrega el resultado si hay existencia=1, si no hay existencia=0 y 
	--el id del almacen donde lo encontro o 0 si no encontro nada
	SELECT @hayExistencia AS valido, @idAlmEncontro AS id_almacen
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarIDsGaleriaPromocion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 24.julio.2018
-- Description:	Obtener lista de IDs promociones validas
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarIDsGaleriaPromocion]
AS
BEGIN
	SELECT id_promocion
	FROM promocion
	WHERE visible_en_pv = 1 AND
		vigencia_inicio < GETDATE() AND
		vigencia_fin > GETDATE() AND
		activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarListaIDsMADetallePorMA]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 11.julio.2018
-- Description:	Obtener todos los id_movimiento_almacen_detalle por id_movimiento_alamcen
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarListaIDsMADetallePorMA]
	@idMovimientoAlmacen AS INT
AS
BEGIN
	SELECT id_movimiento_almacen_detalle FROM movimiento_almacen_detalle
	WHERE id_movimiento_almacen = @idMovimientoAlmacen
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarMovimientosCajaCorte]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 06.septiembre.2018
-- Description:	Obtener totales por forma de pago para corte de caja
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarMovimientosCajaCorte]
	@idCaja AS int
AS
BEGIN
	DECLARE @idFP AS int
	DECLARE @nombreFP AS nvarchar(50)
	DECLARE @DIEfectivo AS decimal(18,2)
	DECLARE @IEfectivo AS decimal(18,2)
	DECLARE @REfectivo AS decimal(18,2)
	DECLARE @CEfectivo AS decimal(18,2)
	DECLARE @GEfectivo AS decimal(18,2)
	DECLARE @TEfectivo AS decimal(18,2)
	DECLARE @retiros AS decimal(18,2)
	DECLARE @incrementos AS decimal(18,2)
	DECLARE @total AS decimal(18,2)
	DECLARE @fechaUltimoCierre AS datetime
	DECLARE @TVentas AS decimal(18,2)
	DECLARE @TDevoluciones AS decimal(18,2)
	DECLARE @descResumen AS nvarchar(50)
	DECLARE @TDisponible AS decimal(18,2)
	DECLARE @idImpuesto AS int
	DECLARE @tasa AS decimal(5,2)
	DECLARE @ventasTotales AS decimal(18,2)
	DECLARE @descImpuesto AS nvarchar(50)
	DECLARE @valorImpuesto AS decimal(18,2)
	DECLARE @ventasDevueltas AS decimal(18,2)
	DECLARE @valorImpuestoD AS decimal(18,2)
	DECLARE @idMovimientoFinalAnterior AS int
	DECLARE @idMovimientoInicial AS int
	DECLARE @idMovimientoFinal AS int
	DECLARE @numReg AS int

	CREATE TABLE #tblTemp (id_forma_pago int, nombre_forma_pago nvarchar(50), dotacion_inicial_efectivo decimal(18,2),
		incrementos_efectivo decimal(18,2), retiros_efectivo decimal(18,2), cambio_efectivo decimal(18,2),
		gastos_efectivo decimal(18,2), total_efectivo decimal(18,2), descripcion_resumen nvarchar(50))

	--Id movimiento final del último cierre
	SELECT @idMovimientoFinal = MAX(id_movimiento_final) FROM cierre WHERE id_caja = @idCaja
	SET @idMovimientoFinal = ISNULL(@idMovimientoFinal,0)
	--FORMAS DE PAGO
	SET @descResumen = 'Formas de Pago'
	SET @TDisponible = 0
	--EFECTIVO
	SET @idFP = 1
	SELECT @nombreFP = descripcion FROM forma_pago WHERE id_forma_pago = @idFP
	--Dotación Inicial Efectivo
	SET @total = 0
	SELECT @DIEfectivo = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND dotacion_inicial = 1
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal
	--Incrementos Efectivo
	SET @total = 0
	SELECT @IEfectivo = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 3
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal
	--Retiros Efectivo
	SET @total = 0
	SELECT @REfectivo = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_concepto IN (8,9)
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal
	--Cambio Efectivo
	SET @total = 0
	SELECT @CEfectivo = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_concepto = 10
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal
	--Gastos Efectivo
	SET @total = 0
	SELECT @GEfectivo = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 5
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal
	IF @DIEfectivo <> 0 OR @IEfectivo <> 0 OR @REfectivo <> 0 OR @CEfectivo <> 0 OR @GEfectivo <> 0
	BEGIN
		--Total Efectivo
		SET @TEfectivo = @DIEfectivo + @IEfectivo + @REfectivo + @CEfectivo + @GEfectivo
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, @DIEfectivo, @IEfectivo, @REfectivo, @CEfectivo, @GEfectivo, @TEfectivo,
			@descResumen)
		SET @TDisponible = @TDisponible + @TEfectivo
	END

	--CHEQUE
	SET @idFP = 8
	SELECT @nombreFP = descripcion FROM forma_pago WHERE id_forma_pago = @idFP
	--Retiros Cheque
	SET @total = 0
	SELECT @retiros = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 4
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal
	--Incrementos Cheque
	SET @total = 0
	SELECT @incrementos = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 3
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal
	IF @retiros <> 0 OR @incrementos <> 0
	BEGIN
		--Total Cheques
		SELECT @total = @incrementos + @retiros
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, @incrementos, @retiros, 0, 0, @total, @descResumen)
		SET @TDisponible = @TDisponible + @total
	END

	--VALE
	SET @idFP = 13
	SELECT @nombreFP = descripcion FROM forma_pago WHERE id_forma_pago = @idFP
	--Retiros Vale
	SET @total = 0
	SELECT @retiros = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 4
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal
	--Incrementos Vale
	SET @total = 0
	SELECT @incrementos = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 3
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal
	IF @retiros <> 0 OR @incrementos <> 0
	BEGIN
		--Total Vale
		SELECT @total = @incrementos + @retiros
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, @incrementos, @retiros, 0, 0, @total, @descResumen)
		SET @TDisponible = @TDisponible + @total
	END

	--TRANSFERENCIA
	SET @idFP = 15
	SELECT @nombreFP = descripcion FROM forma_pago WHERE id_forma_pago = @idFP
	--Retiros Transferencia
	SET @total = 0
	SELECT @retiros = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 4
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal
	--Incrementos Transferencia
	SET @total = 0
	SELECT @incrementos = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 3
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal
	IF @retiros <> 0 OR @incrementos <> 0
	BEGIN
		--Total Transferencia
		SELECT @total = @incrementos + @retiros
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, @incrementos, @retiros, 0, 0, @total, @descResumen)
		SET @TDisponible = @TDisponible + @total
	END

	--VALE DE DEVOLUCIÓN
	SET @idFP = 11
	SELECT @nombreFP = descripcion FROM forma_pago WHERE id_forma_pago = @idFP
	--Retiros Vale de Devolución
	SET @total = 0
	SELECT @retiros = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 4
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal
	--Incrementos Vale de Devolución
	SET @total = 0
	SELECT @incrementos = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 3
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal
	IF @retiros <> 0 OR @incrementos <> 0
	BEGIN
		--Total Vale de Devolución
		SELECT @total = @incrementos + @retiros
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, @incrementos, @retiros, 0, 0, @total, @descResumen)
		SET @TDisponible = @TDisponible + @total
	END

	--VALE DE DEVOLUCIÓN TRANSACCIÓN
	SET @nombreFP = 'Vales por Devolución Transacción'
	--Retiros Vale de Devolución Transacción
	SET @total = 0
	SELECT @retiros = (ISNULL(SUM(importe),0) * -1) FROM vale_devolucion_transaccion
	WHERE id_caja = @idCaja --AND CONVERT(date,fecha_registro) = CONVERT(date,GETDATE())
		AND aplicado = 0 AND id_cierre IS NULL
	--Incrementos Vale de Devolución Transacción
	SELECT @incrementos = ISNULL(SUM(importe),0) FROM vale_devolucion_transaccion
	WHERE id_caja = @idCaja AND CONVERT(date,fecha_registro) = CONVERT(date,GETDATE())
		AND aplicado = 1 AND id_cierre IS NULL
	IF @retiros <> 0 OR @incrementos <> 0
	BEGIN
		--Total Vale de Devolución Transacción
		SELECT @total = @incrementos + @retiros
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, @incrementos, @retiros, 0, 0, @total, @descResumen)
		SET @TDisponible = @TDisponible + @total
	END

	--TARJETA DÉBITO
	SET @idFP = 99
	SET @nombreFP = 'T. Débito'
	--Retiros Tarjeta
	SET @total = 0
	SELECT @retiros = ISNULL(SUM(mc.importe_total),0)
	FROM movimiento_caja mc
	LEFT OUTER JOIN forma_pago fp ON mc.id_forma_pago = fp.id_forma_pago
	WHERE mc.id_caja = @idCaja AND fp.es_tarjeta = 1 AND fp.usada_en_punto_venta = 1 AND fp.activo = 1 AND fp.es_credito = 0
		AND mc.id_movimiento_caja_tipo = 4 AND mc.id_cierre IS NULL AND mc.id_movimiento_caja > @idMovimientoFinal
	--Incrementos Tarjeta
	SET @total = 0
	SELECT @incrementos = ISNULL(SUM(mc.importe_total),0)
	FROM movimiento_caja mc
	LEFT OUTER JOIN forma_pago fp ON mc.id_forma_pago = fp.id_forma_pago
	WHERE mc.id_caja = @idCaja AND fp.es_tarjeta = 1 AND fp.usada_en_punto_venta = 1 AND fp.activo = 1 AND fp.es_credito = 0
		AND mc.id_movimiento_caja_tipo = 3 AND mc.id_cierre IS NULL AND mc.id_movimiento_caja > @idMovimientoFinal
	IF @retiros <> 0 OR @incrementos <> 0
	BEGIN
		--Total Tarjeta
		SELECT @total = @incrementos + @retiros
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, @incrementos, @retiros, 0, 0, @total, @descResumen)
		SET @TDisponible = @TDisponible + @total
	END

	--TARJETA CRÉDITO
	SET @idFP = 99
	SET @nombreFP = 'T. Crédito'
	--Retiros Tarjeta
	SET @total = 0
	SELECT @retiros = ISNULL(SUM(mc.importe_total),0)
	FROM movimiento_caja mc
	LEFT OUTER JOIN forma_pago fp ON mc.id_forma_pago = fp.id_forma_pago
	WHERE mc.id_caja = @idCaja AND fp.es_tarjeta = 1 AND fp.usada_en_punto_venta = 1 AND fp.activo = 1 AND fp.es_credito = 1
		AND mc.id_movimiento_caja_tipo = 4 AND mc.id_cierre IS NULL AND mc.id_movimiento_caja > @idMovimientoFinal
	--Incrementos Tarjeta
	SET @total = 0
	SELECT @incrementos = ISNULL(SUM(mc.importe_total),0)
	FROM movimiento_caja mc
	LEFT OUTER JOIN forma_pago fp ON mc.id_forma_pago = fp.id_forma_pago
	WHERE mc.id_caja = @idCaja AND fp.es_tarjeta = 1 AND fp.usada_en_punto_venta = 1 AND fp.activo = 1 AND fp.es_credito = 1
		AND mc.id_movimiento_caja_tipo = 3 AND mc.id_cierre IS NULL AND mc.id_movimiento_caja > @idMovimientoFinal
	IF @retiros <> 0 OR @incrementos <> 0
	BEGIN
		--Total Tarjeta
		SELECT @total = @incrementos + @retiros
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, @incrementos, @retiros, 0, 0, @total, @descResumen)
		SET @TDisponible = @TDisponible + @total
	END

	--TOTAL DISPONIBLE
	SET @total = 0
	SET @nombreFP = 'Total Disponible'
	IF @TDisponible <> 0
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @TDisponible, @descResumen)

	--VENTAS/DEVOLUCIONES
	SET @descResumen = 'VtaDev'
	--VENTAS
	SET @total = 0
	SET @nombreFP = 'Ventas'
	--Cambio Efectivo
	SET @idFP = 1
	SET @CEfectivo = 0
	SELECT @CEfectivo = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_concepto = 10
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal
	--Ventas
	SET @idFP = 0
	SELECT @TVentas = ISNULL(SUM(importe_total),0)
	FROM movimiento_caja WHERE id_movimiento_caja_tipo = 3 AND id_movimiento_caja_concepto = 7
		AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinal AND id_caja = @idCaja
	SET @TVentas = @TVentas + @CEfectivo
	IF @TVentas <> 0
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @TVentas, @descResumen)

	--DEVOLUCIONES
	SET @total = 0
	SET @nombreFP = 'Devoluciones'
	SELECT @fechaUltimoCierre = ISNULL(fecha_corte, '') FROM cierre WHERE id_caja = @idCaja
	SET @fechaUltimoCierre = ISNULL(@fechaUltimoCierre, '')
	SELECT @TDevoluciones = ISNULL(SUM(total_neto),0) FROM movimiento_almacen WHERE id_movimiento_almacen_tipo = 7
		AND fecha_registro > @fechaUltimoCierre AND id_caja = @idCaja
	IF @TDevoluciones <> 0
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @TDevoluciones, @descResumen)

	--VTA-DEV
	SET @total = 0
	SET @nombreFP = 'Vta-Dev'
	SET @total = @TVentas - @TDevoluciones
	IF @total <> 0
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @total, @descResumen)

	--CANCELADAS
	SET @descResumen = 'Canceladas'
	--VENTAS CANCELADAS EN PV
	SET @total = 0
	SET @nombreFP = 'Artículos Cancelados'
	SELECT @total = ISNULL(registros,0) FROM venta_cancelacion WHERE id_caja = @idCaja
	IF @total <> 0
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @total, @descResumen)

	--MONTO CANCELADAS EN PV
	SET @total = 0
	SET @nombreFP = 'Monto Canceladas'
	SELECT @total = ISNULL(monto,0) FROM venta_cancelacion WHERE id_caja = @idCaja
	IF @total <> 0
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @total, @descResumen)

	--IMPUESTOS
	SET @descResumen = 'Impuestos'
	--IEPS
	DECLARE cIEPS CURSOR
	FOR SELECT id_impuesto, tasa, descripcion FROM impuesto WHERE descripcion LIKE '%IEPS%'
	OPEN cIEPS
	FETCH NEXT FROM cIEPS INTO @idImpuesto, @tasa, @descImpuesto
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--Ventas totales
		SET @VentasTotales = 0
		SET @nombreFP = @descImpuesto
		SELECT @VentasTotales = SUM((mad.cantidad * mad.costo_unitario)) FROM movimiento_almacen_detalle mad
		LEFT OUTER JOIN articulo a ON a.id_articulo = mad.id_articulo
		WHERE id_movimiento_almacen IN
			(SELECT id_movimiento_almacen FROM movimiento_almacen WHERE id_caja = @idCaja
				AND id_movimiento_almacen_tipo = 12 AND fecha_registro > @fechaUltimoCierre) AND a.id_ieps_venta = @idImpuesto
		SET @VentasTotales = ISNULL(@VentasTotales,0)
		IF @VentasTotales <> 0
		BEGIN
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @VentasTotales, @descResumen)
			SET @valorImpuesto = @VentasTotales * @tasa / 100
			SET @nombreFP = 'Valor ' + @descImpuesto
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @valorImpuesto, @descResumen)
		END
		--Ventas devueltas
		SET @ventasDevueltas = 0
		SET @nombreFP = 'Ventas Devueltas'
		SELECT @ventasDevueltas = SUM((mad.cantidad * mad.costo_unitario)) FROM movimiento_almacen_detalle mad
		LEFT OUTER JOIN articulo a ON a.id_articulo = mad.id_articulo
		WHERE id_movimiento_almacen IN
			(SELECT id_movimiento_almacen FROM movimiento_almacen WHERE id_caja = @idCaja
				AND id_movimiento_almacen_tipo = 7 AND fecha_registro > @fechaUltimoCierre) AND a.id_ieps_venta = @idImpuesto
		SET @ventasDevueltas = ISNULL(@ventasDevueltas,0)
		IF @ventasDevueltas <> 0
		BEGIN
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @ventasDevueltas, @descResumen)
			SET @valorImpuestoD = @ventasDevueltas * @tasa / 100
			SET @nombreFP = 'Valor ' + @descImpuesto + ' V.D.'
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @valorImpuestoD, @descResumen)
		END
		--IEPS Reportado
		IF @ventasTotales <> 0 OR @ventasDevueltas <> 0
		BEGIN
			SET @total = (@ventasTotales + ISNULL(@valorImpuesto,0)) - (@ventasDevueltas + ISNULL(@valorImpuestoD,0))
			SET @nombreFP = @descImpuesto + ' Reportado'
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @total, @descResumen)
		END
		FETCH NEXT FROM cIEPS INTO @idImpuesto, @tasa, @descImpuesto
	END
	CLOSE cIEPS
	DEALLOCATE cIEPS

	--IVA
	DECLARE cIVA CURSOR
	FOR SELECT id_impuesto, tasa, descripcion FROM impuesto WHERE descripcion LIKE '%IVA%'
	OPEN cIVA
	FETCH NEXT FROM cIVA INTO @idImpuesto, @tasa, @descImpuesto
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--Ventas totales
		SET @ventasTotales = 0
		SET @nombreFP = @descImpuesto
		SELECT @VentasTotales = SUM((mad.cantidad * mad.costo_unitario)) FROM movimiento_almacen_detalle mad
		LEFT OUTER JOIN articulo a ON a.id_articulo = mad.id_articulo
		WHERE id_movimiento_almacen IN
			(SELECT id_movimiento_almacen FROM movimiento_almacen WHERE id_caja = @idCaja
				AND id_movimiento_almacen_tipo = 12 AND fecha_registro > @fechaUltimoCierre) AND a.id_iva_venta = @idImpuesto
		SET @ventasTotales = ISNULL(@VentasTotales,0)
		IF @ventasTotales <> 0
		BEGIN
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @ventasTotales, @descResumen)
			SET @valorImpuesto = @ventasTotales * @tasa / 100
			SET @nombreFP = 'Valor ' + @descImpuesto
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @valorImpuesto, @descResumen)
		END
		--Ventas devueltas
		SET @ventasDevueltas = 0
		SET @nombreFP = 'Ventas Devueltas'
		SELECT @ventasDevueltas = SUM((mad.cantidad * mad.costo_unitario)) FROM movimiento_almacen_detalle mad
		LEFT OUTER JOIN articulo a ON a.id_articulo = mad.id_articulo
		WHERE id_movimiento_almacen IN
			(SELECT id_movimiento_almacen FROM movimiento_almacen WHERE id_caja = @idCaja
				AND id_movimiento_almacen_tipo = 7 AND fecha_registro > @fechaUltimoCierre) AND a.id_iva_venta = @idImpuesto
		SET @ventasDevueltas = ISNULL(@ventasDevueltas,0)
		IF @ventasDevueltas <> 0
		BEGIN
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @ventasDevueltas, @descResumen)
			SET @valorImpuestoD = @ventasDevueltas * @tasa / 100
			SET @nombreFP = 'Valor ' + @descImpuesto + ' V.D.'
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @valorImpuestoD, @descResumen)
		END
		--IVA Reportado
		IF @ventasTotales <> 0 OR @ventasDevueltas <> 0
		BEGIN
			SET @total = (@ventasTotales + ISNULL(@valorImpuesto,0)) - (@ventasDevueltas + ISNULL(@valorImpuestoD,0))
			SET @nombreFP = @descImpuesto + ' Reportado'
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @total, @descResumen)
		END
		FETCH NEXT FROM cIVA INTO @idImpuesto, @tasa, @descImpuesto
	END
	CLOSE cIVA
	DEALLOCATE cIVA

	----EXISTENCIAS NEGATIVAS
	--SET @idFP = 999
	--SET @total = 0
	--SET @nombreFP = 'Existencia Actual'
	--SET @descResumen = 'Existencia Negativa'
	--SELECT @total = ISNULL(COUNT(*),0) FROM articulo_existencia WHERE id_almacen IN
	--	(SELECT id_almacen FROM almacen WHERE id_sucursal = (SELECT id_sucursal FROM caja WHERE id_caja = @idCaja))
	--	AND existencia_actual < 0
	--IF @total > 0
	--	INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @total, @descResumen)

	SELECT @numReg = COUNT(*) FROM #tblTemp
	IF @numReg > 0
	BEGIN
		--MOVIMIENTOS
		SET @idFP = 999

		--Movimientos de Caja
		SET @nombreFP = 'Movimientos Caja'

		SET @idMovimientoInicial = 0
		SET @idMovimientoFinal = 0

		SELECT @idMovimientoFinalAnterior = MAX(id_movimiento_final) FROM cierre WHERE id_caja = @idCaja
		SET @idMovimientoFinalAnterior = ISNULL(@idMovimientoFinalAnterior, 0)

		SELECT TOP 1 @idMovimientoInicial = id_movimiento_caja FROM movimiento_caja
		WHERE --fecha_registro = (SELECT MIN(fecha_registro) FROM movimiento_caja WHERE id_caja = @idCaja) AND
			id_caja = @idCaja AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinalAnterior
		ORDER BY id_movimiento_caja ASC

		SELECT TOP 1 @idMovimientoFinal = id_movimiento_caja FROM movimiento_caja
		WHERE --fecha_registro = (SELECT MAX(fecha_registro) FROM movimiento_caja WHERE id_caja = @idCaja) AND
			id_caja = @idCaja AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinalAnterior
		ORDER BY id_movimiento_caja DESC
	
		SET @descResumen = CONVERT(varchar, @idMovimientoInicial) + ' al ' + CONVERT(varchar, @idMovimientoFinal)

		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, 0, @descResumen)

		--Movimientos de Almacén
		SET @nombreFP = 'Movimientos Almacén'
		SET @idMovimientoInicial = 0
		SET @idMovimientoFinal = 0
		SELECT @fechaUltimoCierre = ISNULL(fecha_corte, '') FROM cierre WHERE id_caja = @idCaja
	
		SELECT TOP 1 @idMovimientoInicial = id_movimiento_almacen FROM movimiento_almacen
		WHERE id_caja = @idCaja AND id_movimiento_almacen_tipo = 7 AND fecha_registro > @fechaUltimoCierre
		ORDER BY id_movimiento_almacen ASC
	
		SELECT TOP 1 @idMovimientoFinal = id_movimiento_almacen FROM movimiento_almacen
		WHERE id_caja = @idCaja AND id_movimiento_almacen_tipo = 7 AND fecha_registro > @fechaUltimoCierre
		ORDER BY id_movimiento_almacen DESC
		SET @descResumen = CONVERT(varchar, @idMovimientoInicial) + ' al ' + CONVERT(varchar, @idMovimientoFinal)
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, 0, @descResumen)

		--Facturas
		SET @nombreFP = 'Facturas'
		SET @idMovimientoInicial = 0
		SET @idMovimientoFinal = 0
		SELECT TOP 1 @idMovimientoInicial = ISNULL(id_facturacion, 0) FROM facturacion WHERE CONVERT(DATE, fecha_generado) = CONVERT(DATE, GETDATE()) ORDER BY id_facturacion ASC
		SELECT TOP 1 @idMovimientoFinal = ISNULL(id_facturacion, 0) FROM facturacion WHERE CONVERT(DATE, fecha_generado) = CONVERT(DATE, GETDATE()) ORDER BY id_facturacion DESC
		SET @descResumen = CONVERT(varchar, @idMovimientoInicial) + ' al ' + CONVERT(varchar, @idMovimientoFinal)
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, 0, @descResumen)
	END

	SELECT * FROM #tblTemp
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarMovimientosCajaUltimoCorte]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 06.septiembre.2018
-- Description:	Obtener totales por forma de pago para corte de caja
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarMovimientosCajaUltimoCorte]
	@idCaja AS int
AS
BEGIN
	DECLARE @idFP AS int
	DECLARE @nombreFP AS nvarchar(50)
	DECLARE @DIEfectivo AS decimal(18,2)
	DECLARE @IEfectivo AS decimal(18,2)
	DECLARE @REfectivo AS decimal(18,2)
	DECLARE @CEfectivo AS decimal(18,2)
	DECLARE @GEfectivo AS decimal(18,2)
	DECLARE @TEfectivo AS decimal(18,2)
	DECLARE @retiros AS decimal(18,2)
	DECLARE @incrementos AS decimal(18,2)
	DECLARE @total AS decimal(18,2)
	DECLARE @fechaUltimoCierre AS datetime
	DECLARE @TVentas AS decimal(18,2)
	DECLARE @TDevoluciones AS decimal(18,2)
	DECLARE @descResumen AS nvarchar(50)
	DECLARE @TDisponible AS decimal(18,2)
	DECLARE @idImpuesto AS int
	DECLARE @tasa AS decimal(5,2)
	DECLARE @ventasTotales AS decimal(18,2)
	DECLARE @descImpuesto AS nvarchar(50)
	DECLARE @valorImpuesto AS decimal(18,2)
	DECLARE @ventasDevueltas AS decimal(18,2)
	DECLARE @valorImpuestoD AS decimal(18,2)
	DECLARE @idMovimientoFinalAnterior AS int
	DECLARE @idMovimientoInicial AS int
	DECLARE @idMovimientoFinal AS int
	DECLARE @numReg AS int
	DECLARE @idUltimoCierre AS int

	CREATE TABLE #tblTemp (id_forma_pago int, nombre_forma_pago nvarchar(50), dotacion_inicial_efectivo decimal(18,2),
		incrementos_efectivo decimal(18,2), retiros_efectivo decimal(18,2), cambio_efectivo decimal(18,2),
		gastos_efectivo decimal(18,2), total_efectivo decimal(18,2), descripcion_resumen nvarchar(50))

	--Id movimiento final del último cierre
	--SELECT @idMovimientoFinal = MAX(id_movimiento_final) FROM cierre WHERE id_caja = @idCaja
	--SET @idMovimientoFinal = ISNULL(@idMovimientoFinal,0)
	SELECT TOP 1 @idUltimoCierre = id_cierre FROM cierre WHERE id_caja = @idCaja ORDER BY id_cierre DESC
	--FORMAS DE PAGO
	SET @descResumen = 'Formas de Pago'
	SET @TDisponible = 0
	--EFECTIVO
	SET @idFP = 1
	SELECT @nombreFP = descripcion FROM forma_pago WHERE id_forma_pago = @idFP
	--Dotación Inicial Efectivo
	SET @total = 0
	SELECT @DIEfectivo = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND dotacion_inicial = 1
		AND id_cierre = @idUltimoCierre
	--Incrementos Efectivo
	SET @total = 0
	SELECT @IEfectivo = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 3
		AND id_cierre = @idUltimoCierre
	--Retiros Efectivo
	SET @total = 0
	SELECT @REfectivo = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_concepto IN (8,9)
		AND id_cierre = @idUltimoCierre
	--Cambio Efectivo
	SET @total = 0
	SELECT @CEfectivo = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_concepto = 10
		AND id_cierre = @idUltimoCierre
	--Gastos Efectivo
	SET @total = 0
	SELECT @GEfectivo = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 5
		AND id_cierre = @idUltimoCierre
	IF @DIEfectivo <> 0 OR @IEfectivo <> 0 OR @REfectivo <> 0 OR @CEfectivo <> 0 OR @GEfectivo <> 0
	BEGIN
		--Total Efectivo
		SET @TEfectivo = @DIEfectivo + @IEfectivo + @REfectivo + @CEfectivo + @GEfectivo
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, @DIEfectivo, @IEfectivo, @REfectivo, @CEfectivo, @GEfectivo, @TEfectivo,
			@descResumen)
		SET @TDisponible = @TDisponible + @TEfectivo
	END

	--CHEQUE
	SET @idFP = 8
	SELECT @nombreFP = descripcion FROM forma_pago WHERE id_forma_pago = @idFP
	--Retiros Cheque
	SET @total = 0
	SELECT @retiros = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 4
		AND id_cierre = @idUltimoCierre
	--Incrementos Cheque
	SET @total = 0
	SELECT @incrementos = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 3
		AND id_cierre = @idUltimoCierre
	IF @retiros <> 0 OR @incrementos <> 0
	BEGIN
		--Total Cheques
		SELECT @total = @incrementos + @retiros
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, @incrementos, @retiros, 0, 0, @total, @descResumen)
		SET @TDisponible = @TDisponible + @total
	END

	--VALE
	SET @idFP = 13
	SELECT @nombreFP = descripcion FROM forma_pago WHERE id_forma_pago = @idFP
	--Retiros Vale
	SET @total = 0
	SELECT @retiros = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 4
		AND id_cierre = @idUltimoCierre
	--Incrementos Vale
	SET @total = 0
	SELECT @incrementos = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 3
		AND id_cierre = @idUltimoCierre
	IF @retiros <> 0 OR @incrementos <> 0
	BEGIN
		--Total Vale
		SELECT @total = @incrementos + @retiros
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, @incrementos, @retiros, 0, 0, @total, @descResumen)
		SET @TDisponible = @TDisponible + @total
	END

	--TRANSFERENCIA
	SET @idFP = 15
	SELECT @nombreFP = descripcion FROM forma_pago WHERE id_forma_pago = @idFP
	--Retiros Transferencia
	SET @total = 0
	SELECT @retiros = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 4
		AND id_cierre = @idUltimoCierre
	--Incrementos Transferencia
	SET @total = 0
	SELECT @incrementos = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 3
		AND id_cierre = @idUltimoCierre
	IF @retiros <> 0 OR @incrementos <> 0
	BEGIN
		--Total Transferencia
		SELECT @total = @incrementos + @retiros
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, @incrementos, @retiros, 0, 0, @total, @descResumen)
		SET @TDisponible = @TDisponible + @total
	END

	--VALE DE DEVOLUCIÓN
	SET @idFP = 11
	SELECT @nombreFP = descripcion FROM forma_pago WHERE id_forma_pago = @idFP
	--Retiros Vale de Devolución
	SET @total = 0
	SELECT @retiros = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 4
		AND id_cierre = @idUltimoCierre
	--Incrementos Vale de Devolución
	SET @total = 0
	SELECT @incrementos = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_tipo = 3
		AND id_cierre = @idUltimoCierre
	IF @retiros <> 0 OR @incrementos <> 0
	BEGIN
		--Total Vale de Devolución
		SELECT @total = @incrementos + @retiros
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, @incrementos, @retiros, 0, 0, @total, @descResumen)
		SET @TDisponible = @TDisponible + @total
	END

	--VALE DE DEVOLUCIÓN TRANSACCIÓN
	SET @nombreFP = 'Vales por Devolución Transacción'
	--Retiros Vale de Devolución Transacción
	SET @total = 0
	SELECT @retiros = (ISNULL(SUM(importe),0) * -1) FROM vale_devolucion_transaccion
	WHERE id_caja = @idCaja --AND CONVERT(date,fecha_registro) = CONVERT(date,GETDATE())
		AND aplicado = 0 AND id_cierre = @idUltimoCierre
	--Incrementos Vale de Devolución Transacción
	SELECT @incrementos = ISNULL(SUM(importe),0) FROM vale_devolucion_transaccion
	WHERE id_caja = @idCaja AND CONVERT(date,fecha_registro) = CONVERT(date,GETDATE())
		AND aplicado = 1 AND id_cierre = @idUltimoCierre
	IF @retiros <> 0 OR @incrementos <> 0
	BEGIN
		--Total Vale de Devolución Transacción
		SELECT @total = @incrementos + @retiros
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, @incrementos, @retiros, 0, 0, @total, @descResumen)
		SET @TDisponible = @TDisponible + @total
	END

	--TARJETA DÉBITO
	SET @idFP = 99
	SET @nombreFP = 'T. Débito'
	--Retiros Tarjeta
	SET @total = 0
	SELECT @retiros = ISNULL(SUM(mc.importe_total),0)
	FROM movimiento_caja mc
	LEFT OUTER JOIN forma_pago fp ON mc.id_forma_pago = fp.id_forma_pago
	WHERE mc.id_caja = @idCaja AND fp.es_tarjeta = 1 AND fp.usada_en_punto_venta = 1 AND fp.activo = 1 AND fp.es_credito = 0
		AND mc.id_movimiento_caja_tipo = 4 AND mc.id_cierre = @idUltimoCierre
	--Incrementos Tarjeta
	SET @total = 0
	SELECT @incrementos = ISNULL(SUM(mc.importe_total),0)
	FROM movimiento_caja mc
	LEFT OUTER JOIN forma_pago fp ON mc.id_forma_pago = fp.id_forma_pago
	WHERE mc.id_caja = @idCaja AND fp.es_tarjeta = 1 AND fp.usada_en_punto_venta = 1 AND fp.activo = 1 AND fp.es_credito = 0
		AND mc.id_movimiento_caja_tipo = 3 AND mc.id_cierre = @idUltimoCierre
	IF @retiros <> 0 OR @incrementos <> 0
	BEGIN
		--Total Tarjeta
		SELECT @total = @incrementos + @retiros
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, @incrementos, @retiros, 0, 0, @total, @descResumen)
		SET @TDisponible = @TDisponible + @total
	END

	--TARJETA CRÉDITO
	SET @idFP = 99
	SET @nombreFP = 'T. Crédito'
	--Retiros Tarjeta
	SET @total = 0
	SELECT @retiros = ISNULL(SUM(mc.importe_total),0)
	FROM movimiento_caja mc
	LEFT OUTER JOIN forma_pago fp ON mc.id_forma_pago = fp.id_forma_pago
	WHERE mc.id_caja = @idCaja AND fp.es_tarjeta = 1 AND fp.usada_en_punto_venta = 1 AND fp.activo = 1 AND fp.es_credito = 1
		AND mc.id_movimiento_caja_tipo = 4 AND mc.id_cierre = @idUltimoCierre
	--Incrementos Tarjeta
	SET @total = 0
	SELECT @incrementos = ISNULL(SUM(mc.importe_total),0)
	FROM movimiento_caja mc
	LEFT OUTER JOIN forma_pago fp ON mc.id_forma_pago = fp.id_forma_pago
	WHERE mc.id_caja = @idCaja AND fp.es_tarjeta = 1 AND fp.usada_en_punto_venta = 1 AND fp.activo = 1 AND fp.es_credito = 1
		AND mc.id_movimiento_caja_tipo = 3 AND mc.id_cierre = @idUltimoCierre
	IF @retiros <> 0 OR @incrementos <> 0
	BEGIN
		--Total Tarjeta
		SELECT @total = @incrementos + @retiros
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, @incrementos, @retiros, 0, 0, @total, @descResumen)
		SET @TDisponible = @TDisponible + @total
	END

	--TOTAL DISPONIBLE
	SET @total = 0
	SET @nombreFP = 'Total Disponible'
	IF @TDisponible <> 0
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @TDisponible, @descResumen)

	--VENTAS/DEVOLUCIONES
	SET @descResumen = 'VtaDev'
	--VENTAS
	SET @total = 0
	SET @nombreFP = 'Ventas'
	--Cambio Efectivo
	SET @idFP = 1
	SET @CEfectivo = 0
	SELECT @CEfectivo = ISNULL(SUM(importe_total),0) FROM movimiento_caja
	WHERE id_caja = @idCaja AND id_forma_pago = @idFP AND id_movimiento_caja_concepto = 10
		AND id_cierre = @idUltimoCierre
	--Ventas
	SET @idFP = 0
	SELECT @TVentas = ISNULL(SUM(importe_total),0)
	FROM movimiento_caja WHERE id_movimiento_caja_tipo = 3 AND id_movimiento_caja_concepto = 7
		AND id_cierre = @idUltimoCierre
	SET @TVentas = @TVentas + @CEfectivo
	IF @TVentas <> 0
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @TVentas, @descResumen)

	--DEVOLUCIONES
	SET @total = 0
	SET @nombreFP = 'Devoluciones'
	IF (SELECT COUNT(*) FROM cierre WHERE id_caja = @idCaja) > 1
		SELECT TOP 2 @fechaUltimoCierre = ISNULL(fecha_corte, '') FROM cierre WHERE id_caja = @idCaja ORDER BY id_cierre DESC
	SET @fechaUltimoCierre = ISNULL(@fechaUltimoCierre, '')
	SELECT @TDevoluciones = ISNULL(SUM(total_neto),0) FROM movimiento_almacen WHERE id_movimiento_almacen_tipo = 7
		AND fecha_registro > @fechaUltimoCierre AND id_caja = @idCaja
	IF @TDevoluciones <> 0
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @TDevoluciones, @descResumen)

	--VTA-DEV
	SET @total = 0
	SET @nombreFP = 'Vta-Dev'
	SET @total = @TVentas - @TDevoluciones
	IF @total <> 0
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @total, @descResumen)

	--CANCELADAS
	SET @descResumen = 'Canceladas'
	--VENTAS CANCELADAS EN PV
	SET @total = 0
	SET @nombreFP = 'Artículos Cancelados'
	SELECT @total = ISNULL(registros,0) FROM venta_cancelacion WHERE id_caja = @idCaja
	IF @total <> 0
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @total, @descResumen)

	--MONTO CANCELADAS EN PV
	SET @total = 0
	SET @nombreFP = 'Monto Canceladas'
	SELECT @total = ISNULL(monto,0) FROM venta_cancelacion WHERE id_caja = @idCaja
	IF @total <> 0
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @total, @descResumen)

	--IMPUESTOS
	SET @descResumen = 'Impuestos'
	--IEPS
	DECLARE cIEPS CURSOR
	FOR SELECT id_impuesto, tasa, descripcion FROM impuesto WHERE descripcion LIKE '%IEPS%'
	OPEN cIEPS
	FETCH NEXT FROM cIEPS INTO @idImpuesto, @tasa, @descImpuesto
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--Ventas totales
		SET @VentasTotales = 0
		SET @nombreFP = @descImpuesto
		SELECT @VentasTotales = SUM((mad.cantidad * mad.costo_unitario)) FROM movimiento_almacen_detalle mad
		LEFT OUTER JOIN articulo a ON a.id_articulo = mad.id_articulo
		WHERE id_movimiento_almacen IN
			(SELECT id_movimiento_almacen FROM movimiento_almacen WHERE id_caja = @idCaja
				AND id_movimiento_almacen_tipo = 12 AND fecha_registro > @fechaUltimoCierre) AND a.id_ieps_venta = @idImpuesto
		SET @VentasTotales = ISNULL(@VentasTotales,0)
		IF @VentasTotales <> 0
		BEGIN
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @VentasTotales, @descResumen)
			SET @valorImpuesto = @VentasTotales * @tasa / 100
			SET @nombreFP = 'Valor ' + @descImpuesto
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @valorImpuesto, @descResumen)
		END
		--Ventas devueltas
		SET @ventasDevueltas = 0
		SET @nombreFP = 'Ventas Devueltas'
		SELECT @ventasDevueltas = SUM((mad.cantidad * mad.costo_unitario)) FROM movimiento_almacen_detalle mad
		LEFT OUTER JOIN articulo a ON a.id_articulo = mad.id_articulo
		WHERE id_movimiento_almacen IN
			(SELECT id_movimiento_almacen FROM movimiento_almacen WHERE id_caja = @idCaja
				AND id_movimiento_almacen_tipo = 7 AND fecha_registro > @fechaUltimoCierre) AND a.id_ieps_venta = @idImpuesto
		SET @ventasDevueltas = ISNULL(@ventasDevueltas,0)
		IF @ventasDevueltas <> 0
		BEGIN
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @ventasDevueltas, @descResumen)
			SET @valorImpuestoD = @ventasDevueltas * @tasa / 100
			SET @nombreFP = 'Valor ' + @descImpuesto + ' V.D.'
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @valorImpuestoD, @descResumen)
		END
		--IEPS Reportado
		IF @ventasTotales <> 0 OR @ventasDevueltas <> 0
		BEGIN
			SET @total = (@ventasTotales + ISNULL(@valorImpuesto,0)) - (@ventasDevueltas + ISNULL(@valorImpuestoD,0))
			SET @nombreFP = @descImpuesto + ' Reportado'
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @total, @descResumen)
		END
		FETCH NEXT FROM cIEPS INTO @idImpuesto, @tasa, @descImpuesto
	END
	CLOSE cIEPS
	DEALLOCATE cIEPS

	--IVA
	DECLARE cIVA CURSOR
	FOR SELECT id_impuesto, tasa, descripcion FROM impuesto WHERE descripcion LIKE '%IVA%'
	OPEN cIVA
	FETCH NEXT FROM cIVA INTO @idImpuesto, @tasa, @descImpuesto
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--Ventas totales
		SET @ventasTotales = 0
		SET @nombreFP = @descImpuesto
		SELECT @VentasTotales = SUM((mad.cantidad * mad.costo_unitario)) FROM movimiento_almacen_detalle mad
		LEFT OUTER JOIN articulo a ON a.id_articulo = mad.id_articulo
		WHERE id_movimiento_almacen IN
			(SELECT id_movimiento_almacen FROM movimiento_almacen WHERE id_caja = @idCaja
				AND id_movimiento_almacen_tipo = 12 AND fecha_registro > @fechaUltimoCierre) AND a.id_iva_venta = @idImpuesto
		SET @ventasTotales = ISNULL(@VentasTotales,0)
		IF @ventasTotales <> 0
		BEGIN
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @ventasTotales, @descResumen)
			SET @valorImpuesto = @ventasTotales * @tasa / 100
			SET @nombreFP = 'Valor ' + @descImpuesto
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @valorImpuesto, @descResumen)
		END
		--Ventas devueltas
		SET @ventasDevueltas = 0
		SET @nombreFP = 'Ventas Devueltas'
		SELECT @ventasDevueltas = SUM((mad.cantidad * mad.costo_unitario)) FROM movimiento_almacen_detalle mad
		LEFT OUTER JOIN articulo a ON a.id_articulo = mad.id_articulo
		WHERE id_movimiento_almacen IN
			(SELECT id_movimiento_almacen FROM movimiento_almacen WHERE id_caja = @idCaja
				AND id_movimiento_almacen_tipo = 7 AND fecha_registro > @fechaUltimoCierre) AND a.id_iva_venta = @idImpuesto
		SET @ventasDevueltas = ISNULL(@ventasDevueltas,0)
		IF @ventasDevueltas <> 0
		BEGIN
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @ventasDevueltas, @descResumen)
			SET @valorImpuestoD = @ventasDevueltas * @tasa / 100
			SET @nombreFP = 'Valor ' + @descImpuesto + ' V.D.'
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @valorImpuestoD, @descResumen)
		END
		--IVA Reportado
		IF @ventasTotales <> 0 OR @ventasDevueltas <> 0
		BEGIN
			SET @total = (@ventasTotales + ISNULL(@valorImpuesto,0)) - (@ventasDevueltas + ISNULL(@valorImpuestoD,0))
			SET @nombreFP = @descImpuesto + ' Reportado'
			INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @total, @descResumen)
		END
		FETCH NEXT FROM cIVA INTO @idImpuesto, @tasa, @descImpuesto
	END
	CLOSE cIVA
	DEALLOCATE cIVA

	----EXISTENCIAS NEGATIVAS
	--SET @idFP = 999
	--SET @total = 0
	--SET @nombreFP = 'Existencia Actual'
	--SET @descResumen = 'Existencia Negativa'
	--SELECT @total = ISNULL(COUNT(*),0) FROM articulo_existencia WHERE id_almacen IN
	--	(SELECT id_almacen FROM almacen WHERE id_sucursal = (SELECT id_sucursal FROM caja WHERE id_caja = @idCaja))
	--	AND existencia_actual < 0
	--IF @total > 0
	--	INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, @total, @descResumen)

	SELECT @numReg = COUNT(*) FROM #tblTemp
	IF @numReg > 0
	BEGIN
		--MOVIMIENTOS
		SET @idFP = 999

		--Movimientos de Caja
		SET @nombreFP = 'Movimientos Caja'

		SET @idMovimientoInicial = 0
		SET @idMovimientoFinal = 0

		--SELECT @idMovimientoFinalAnterior = MAX(id_movimiento_final) FROM cierre WHERE id_cierre = @idUltimoCierre
		--SET @idMovimientoFinalAnterior = ISNULL(@idMovimientoFinalAnterior, 0)

		SELECT TOP 1 @idMovimientoInicial = id_movimiento_caja FROM movimiento_caja
		WHERE --fecha_registro = (SELECT MIN(fecha_registro) FROM movimiento_caja WHERE id_caja = @idCaja) AND
			id_caja = @idCaja AND id_cierre = @idUltimoCierre
		ORDER BY id_movimiento_caja ASC

		SELECT TOP 1 @idMovimientoFinal = id_movimiento_caja FROM movimiento_caja
		WHERE --fecha_registro = (SELECT MAX(fecha_registro) FROM movimiento_caja WHERE id_caja = @idCaja) AND
			id_caja = @idCaja AND id_cierre = @idUltimoCierre
		ORDER BY id_movimiento_caja DESC
	
		SET @descResumen = CONVERT(varchar, @idMovimientoInicial) + ' al ' + CONVERT(varchar, @idMovimientoFinal)

		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, 0, @descResumen)

		--Movimientos de Almacén
		SET @nombreFP = 'Movimientos Almacén'
		SET @idMovimientoInicial = 0
		SET @idMovimientoFinal = 0
		--SELECT @fechaUltimoCierre = ISNULL(fecha_corte, '') FROM cierre WHERE id_caja = @idCaja
	
		SELECT TOP 1 @idMovimientoInicial = id_movimiento_almacen FROM movimiento_almacen
		WHERE id_caja = @idCaja AND id_movimiento_almacen_tipo = 7 AND fecha_registro > @fechaUltimoCierre
		ORDER BY id_movimiento_almacen ASC
	
		SELECT TOP 1 @idMovimientoFinal = id_movimiento_almacen FROM movimiento_almacen
		WHERE id_caja = @idCaja AND id_movimiento_almacen_tipo = 7 AND fecha_registro > @fechaUltimoCierre
		ORDER BY id_movimiento_almacen DESC
		SET @descResumen = CONVERT(varchar, @idMovimientoInicial) + ' al ' + CONVERT(varchar, @idMovimientoFinal)
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, 0, @descResumen)

		--Facturas
		SET @nombreFP = 'Facturas'
		SET @idMovimientoInicial = 0
		SET @idMovimientoFinal = 0
		SELECT TOP 1 @idMovimientoInicial = ISNULL(id_facturacion, 0) FROM facturacion WHERE CONVERT(DATE, fecha_generado) = CONVERT(DATE, GETDATE()) ORDER BY id_facturacion ASC
		SELECT TOP 1 @idMovimientoFinal = ISNULL(id_facturacion, 0) FROM facturacion WHERE CONVERT(DATE, fecha_generado) = CONVERT(DATE, GETDATE()) ORDER BY id_facturacion DESC
		SET @descResumen = CONVERT(varchar, @idMovimientoInicial) + ' al ' + CONVERT(varchar, @idMovimientoFinal)
		INSERT INTO #tblTemp VALUES (@idFP, @nombreFP, 0, 0, 0, 0, 0, 0, @descResumen)
	END

	SELECT * FROM #tblTemp
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarPromocionesAplicadas]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 21.enero.2019
-- Description:	Obtener n�mero de promociones aplicadas
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarPromocionesAplicadas]
	@idPromocion AS int
AS
BEGIN
	SELECT SUM([aplicadas]) AS promociones_aplicadas
	  FROM [dbo].[promocion_venta]
	  WHERE [id_promocion] = @idPromocion
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarSiExisteDinamica]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date:	2019-06-26
-- Description:	Busca si existe dinamica activa
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarSiExisteDinamica]
AS
BEGIN
	SELECT
		CONVERT(BIT,(CASE COUNT(id_dinamica) WHEN 0 THEN 0 ELSE 1 END)) AS existeDinamica
	FROM
		dinamica
	WHERE
		GETDATE() BETWEEN inicio_vigencia AND fin_vigencia
		AND activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarSucursalPorClave]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MArco Gonzalez
-- Create date: 2019-03-07
-- Description:	Se agregío columna afilaicion_bancomer
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarSucursalPorClave]
	@clave as nvarchar(50)
AS
BEGIN
	SELECT 
		id_sucursal,
		clave_sucursal,
		nombre,
		id_zona,
		direccion_ip,
		nombre_bd,
		usuario_bd,
		contrasena,
		fecha_alta,
		activo,
		ISNULL(afiliacion_bancomer, '') AS afiliacion_bancomer
	FROM sucursal WHERE clave_sucursal = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarSucursalPorDescripcion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos negrete
-- Create date:  25-05-18
-- Description:	SP
-- =============================================
-- =============================================
-- Author:		MArco Gonzalez
-- Create date: 2019-03-07
-- Description:	Se agregío columna afilaicion_bancomer
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarSucursalPorDescripcion]
	@nombre as nvarchar(50)
AS
BEGIN
	SELECT 
		id_sucursal,
		clave_sucursal,
		nombre,
		id_zona,
		direccion_ip,
		nombre_bd,
		usuario_bd,
		contrasena,
		fecha_alta,
		activo,
		ISNULL(afiliacion_bancomer, '') AS afiliacion_bancomer
	FROM sucursal WHERE nombre = @nombre
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarSucursalPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 11.mayo.2018
-- Description:	Consulta forma de pago por ID
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-07
-- Description:	Se agregó la columna afiliacion_bancomer
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarSucursalPorId]
	@id as int
AS
BEGIN
	SELECT 
		id_sucursal,
		clave_sucursal,
		nombre,
		id_zona,
		direccion_ip,
		nombre_bd,
		usuario_bd,
		contrasena,
		fecha_alta,
		activo,
		ISNULL(afiliacion_bancomer, '') AS afiliacion_bancomer
	FROM sucursal WHERE id_sucursal = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarSucursalPorNombre]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarSucursalPorNombre]
	@nombre as nvarchar(50)
AS
BEGIN
	SELECT * FROM sucursal WHERE nombre = @nombre
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarTicketBancoPorMovCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-20
-- Description:	Consultar ticket bancomer por id movimiento caja
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarTicketBancoPorMovCaja]
	@idMovimientoCaja AS INT
AS
BEGIN
	SELECT
		ISNULL(id_ticket_bancomer,0) as id_ticket_bancomer,
		ISNULL(id_movimiento_almacen,0) as id_movimiento_almacen,
		ISNULL(id_movimiento_caja,0) as id_movimiento_caja,
		ISNULL(id_vale_dev_trans,0) as id_vale_dev_trans,
		ISNULL(id_transaccion_banco,0) as id_transaccion_banco,
		ISNULL(nombre_banco,'') as nombre_banco,
		ISNULL(nombre_comercio,'') as nombre_comercio,
		ISNULL(nombre_cliente,'') as nombre_cliente,
		ISNULL(domicilio_comercio,'') as domicilio_comercio,
		ISNULL(no_afiliacion,'') as no_afiliacion,
		ISNULL(terminal,'') as terminal,
		ISNULL(tipo_transaccion,'') as tipo_transaccion,
		ISNULL(vendedor,'') as vendedor,
		ISNULL(no_tarjeta,'') as no_tarjeta,
		ISNULL(tipo_tarjeta,'') as tipo_tarjeta,
		ISNULL(aprobada,'') as aprobada,
		ISNULL(ticket,'') as ticket,
		ISNULL(fecha_vencimiento,'') as fecha_vencimiento,
		ISNULL(importe,'') as importe,
		ISNULL(total_a_pagar,'') as total_a_pagar,
		ISNULL(no_autorizacion,'') as no_autorizacion,
		ISNULL(criptograma_chip,'') as criptograma_chip,
		ISNULL(fecha_transaccion,'') as fecha_transaccion,
		ISNULL(hora_transaccion,'') as hora_transaccion,
		ISNULL(no_secuencia_tnx,'') as no_secuencia_tnx,
		ISNULL(referencia_financiera,'') as referencia_financiera,
		ISNULL(formato_transaccion,'') as formato_transaccion,
		ISNULL(venta_con_puntos,0) as venta_con_puntos,
		ISNULL(con_chip,0) as con_chip,
		ISNULL(caja,'') as caja,
		ISNULL(aid,'') as aid,
		ISNULL(tipo_firma,0) as tipo_firma,
		ISNULL(fue_aprobada,0) as fue_aprobada,
		ISNULL(monto_pagado_con_puntos,'') as monto_pagado_con_puntos,
		ISNULL(saldo_anterior,'') as saldo_anterior,
		ISNULL(saldo_anterior_en_pesos,'') as saldo_anterior_en_pesos,
		ISNULL(puntos_redimidos,'') as puntos_redimidos,
		ISNULL(puntos_redimidos_en_pesos,'') as puntos_redimidos_en_pesos,
		ISNULL(saldo_actual,'') as saldo_actual,
		ISNULL(saldo_actual_en_pesos,'') as saldo_actual_en_pesos
	FROM 
		ticket_bancomer 
	WHERE
		id_movimiento_caja = @idMovimientoCaja

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarTicketsBancoPorMovAlmacen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-26
-- Description:	Consultar ticket bancomer por id movimiento de almacén
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarTicketsBancoPorMovAlmacen]
	@idMovimientoAlmacen AS INT
AS
BEGIN
	SELECT
		ISNULL(id_ticket_bancomer,0) as id_ticket_bancomer,
		ISNULL(id_movimiento_almacen,0) as id_movimiento_almacen,
		ISNULL(id_movimiento_caja,0) as id_movimiento_caja,
		ISNULL(id_vale_dev_trans,0) as id_vale_dev_trans,
		ISNULL(id_transaccion_banco,0) as id_transaccion_banco,
		ISNULL(nombre_banco,'') as nombre_banco,
		ISNULL(nombre_comercio,'') as nombre_comercio,
		ISNULL(nombre_cliente,'') as nombre_cliente,
		ISNULL(domicilio_comercio,'') as domicilio_comercio,
		ISNULL(no_afiliacion,'') as no_afiliacion,
		ISNULL(terminal,'') as terminal,
		ISNULL(tipo_transaccion,'') as tipo_transaccion,
		ISNULL(vendedor,'') as vendedor,
		ISNULL(no_tarjeta,'') as no_tarjeta,
		ISNULL(tipo_tarjeta,'') as tipo_tarjeta,
		ISNULL(aprobada,'') as aprobada,
		ISNULL(ticket,'') as ticket,
		ISNULL(fecha_vencimiento,'') as fecha_vencimiento,
		ISNULL(importe,'') as importe,
		ISNULL(total_a_pagar,'') as total_a_pagar,
		ISNULL(no_autorizacion,'') as no_autorizacion,
		ISNULL(criptograma_chip,'') as criptograma_chip,
		ISNULL(fecha_transaccion,'') as fecha_transaccion,
		ISNULL(hora_transaccion,'') as hora_transaccion,
		ISNULL(no_secuencia_tnx,'') as no_secuencia_tnx,
		ISNULL(referencia_financiera,'') as referencia_financiera,
		ISNULL(formato_transaccion,'') as formato_transaccion,
		ISNULL(venta_con_puntos,0) as venta_con_puntos,
		ISNULL(con_chip,0) as con_chip,
		ISNULL(caja,'') as caja,
		ISNULL(aid,'') as aid,
		ISNULL(tipo_firma,0) as tipo_firma,
		ISNULL(fue_aprobada,0) as fue_aprobada,
		ISNULL(monto_pagado_con_puntos,'') as monto_pagado_con_puntos,
		ISNULL(saldo_anterior,'') as saldo_anterior,
		ISNULL(saldo_anterior_en_pesos,'') as saldo_anterior_en_pesos,
		ISNULL(puntos_redimidos,'') as puntos_redimidos,
		ISNULL(puntos_redimidos_en_pesos,'') as puntos_redimidos_en_pesos,
		ISNULL(saldo_actual,'') as saldo_actual,
		ISNULL(saldo_actual_en_pesos,'') as saldo_actual_en_pesos
	FROM 
		ticket_bancomer 
	WHERE
		id_movimiento_almacen = @idMovimientoAlmacen

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarTicketsBancoPorTransaccionBanco]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-04-12
-- Description:	Consultar ticket bancomer por id transaccion
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarTicketsBancoPorTransaccionBanco]
	@idTransaccionBanco AS INT
AS
BEGIN
	SELECT
		ISNULL(id_ticket_bancomer,0) as id_ticket_bancomer,
		ISNULL(id_movimiento_almacen,0) as id_movimiento_almacen,
		ISNULL(id_movimiento_caja,0) as id_movimiento_caja,
		ISNULL(id_vale_dev_trans,0) as id_vale_dev_trans,
		ISNULL(id_transaccion_banco,0) as id_transaccion_banco,
		ISNULL(nombre_banco,'') as nombre_banco,
		ISNULL(nombre_comercio,'') as nombre_comercio,
		ISNULL(nombre_cliente,'') as nombre_cliente,
		ISNULL(domicilio_comercio,'') as domicilio_comercio,
		ISNULL(no_afiliacion,'') as no_afiliacion,
		ISNULL(terminal,'') as terminal,
		ISNULL(tipo_transaccion,'') as tipo_transaccion,
		ISNULL(vendedor,'') as vendedor,
		ISNULL(no_tarjeta,'') as no_tarjeta,
		ISNULL(tipo_tarjeta,'') as tipo_tarjeta,
		ISNULL(aprobada,'') as aprobada,
		ISNULL(ticket,'') as ticket,
		ISNULL(fecha_vencimiento,'') as fecha_vencimiento,
		ISNULL(importe,'') as importe,
		ISNULL(total_a_pagar,'') as total_a_pagar,
		ISNULL(no_autorizacion,'') as no_autorizacion,
		ISNULL(criptograma_chip,'') as criptograma_chip,
		ISNULL(fecha_transaccion,'') as fecha_transaccion,
		ISNULL(hora_transaccion,'') as hora_transaccion,
		ISNULL(no_secuencia_tnx,'') as no_secuencia_tnx,
		ISNULL(referencia_financiera,'') as referencia_financiera,
		ISNULL(formato_transaccion,'') as formato_transaccion,
		ISNULL(venta_con_puntos,0) as venta_con_puntos,
		ISNULL(con_chip,0) as con_chip,
		ISNULL(caja,'') as caja,
		ISNULL(aid,'') as aid,
		ISNULL(tipo_firma,0) as tipo_firma,
		ISNULL(fue_aprobada,0) as fue_aprobada,
		ISNULL(monto_pagado_con_puntos,'') as monto_pagado_con_puntos,
		ISNULL(saldo_anterior,'') as saldo_anterior,
		ISNULL(saldo_anterior_en_pesos,'') as saldo_anterior_en_pesos,
		ISNULL(puntos_redimidos,'') as puntos_redimidos,
		ISNULL(puntos_redimidos_en_pesos,'') as puntos_redimidos_en_pesos,
		ISNULL(saldo_actual,'') as saldo_actual,
		ISNULL(saldo_actual_en_pesos,'') as saldo_actual_en_pesos
	FROM 
		ticket_bancomer 
	WHERE
		id_transaccion_banco = @idTransaccionBanco

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarTransaccionBancoPorFechasYFolio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-28
-- Description:	Consulta Transacci�n por folio o por fechas
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-28
-- Description:	Mostrar folio vale de devolucion
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarTransaccionBancoPorFechasYFolio]
	@folio			AS	NVARCHAR(20),
	@fechaInicio	AS	NVARCHAR(50),
	@fechaFin		AS	NVARCHAR(50)
AS
BEGIN
	DECLARE @fechaI AS	DATETIME
	DECLARE @fechaF	AS	DATETIME

	IF(@fechaInicio = '')
	BEGIN
		SELECT @fechaI = NULL
	END
	ELSE
	BEGIN
		SELECT @fechaI = @fechaInicio
	END
	
	IF(@fechaFin = '')
	BEGIN
		SELECT @fechaF = NULL
	END
	ELSE
	BEGIN
		SELECT @fechaF = @fechaFin
	END

	SELECT
		id_transaccion
		,tb.id_sucursal
		,tb.id_caja
		,ISNULL(id_ticket, 0) AS id_ticket
		,(CASE WHEN folio_ticket IS NULL THEN ISNULL(vdt.folio, '--') ELSE folio_ticket END) AS folio_ticket
		,ISNULL(id_movimiento_caja, 0) AS id_movimiento_caja
		,ISNULL(folio_mov_caja, 'VALE DEVOLUCION') AS folio_mov_caja
		,autorizado
		,ISNULL(id_vale_trans_devolucion, 0) AS id_vale_trans_devolucion
		,tb.importe
		,comision
		,banco
		,ISNULL(referencia,'SIN REFERENCIA') AS referencia
		,ISNULL(numero_operacion, 'SIN OPERACION') AS numero_operacion
		,numero_autorizacion
		,tb.id_usuario
		,tb.fecha_registro
  FROM 
		transaccion_banco tb
		LEFT JOIN vale_devolucion_transaccion vdt ON tb.id_vale_trans_devolucion = vdt.id_vale_devolucion_transaccion
  WHERE 
		((@fechaF IS NULL OR @fechaI IS NULL) AND (folio_ticket LIKE '%' + @folio + '%' OR vdt.folio LIKE '%' + @folio + '%')) OR ((folio_ticket LIKE '%' + @folio + '%' OR vdt.folio LIKE '%' + @folio + '%') AND tb.fecha_registro BETWEEN @fechaI AND @fechaF)
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarTransaccionBancoPorMovAlm]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 21.diciembre.2018
-- Description:	Consultar Transacción por Movimiento Almacén
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-04-13
-- Description:	ISNULL en referencia y no operacion
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarTransaccionBancoPorMovAlm]
	@idMovAlm AS int
AS
BEGIN
	SELECT [id_transaccion]
      ,[id_sucursal]
      ,[id_caja]
      ,ISNULL([id_ticket], 0) AS id_ticket
      ,ISNULL([folio_ticket], 0) AS folio_ticket
      ,ISNULL([id_movimiento_caja], 0) AS id_movimiento_caja
      ,ISNULL([folio_mov_caja], 0) AS folio_mov_caja
      ,[autorizado]
      ,ISNULL([id_vale_trans_devolucion], 0) AS id_vale_trans_devolucion
      ,[importe]
      ,[comision]
      ,[banco]
      ,ISNULL([referencia], '--') AS referencia
      ,ISNULL([numero_operacion], '--') AS numero_operacion
      ,[numero_autorizacion]
      ,[id_usuario]
      ,[fecha_registro]
  FROM [dbo].[transaccion_banco]
  WHERE [id_ticket] = @idMovAlm
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarTransaccionBancoPorTicket]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 20.abril.2019
-- Description:	Consulta Transacci�n por ticket
-- =============================================
CREATE PROCEDURE [dbo].[spConsultarTransaccionBancoPorTicket]
	@folioTicket AS nvarchar(20)
AS
BEGIN
	SELECT
		id_transaccion
		,tb.id_sucursal
		,tb.id_caja
		,ISNULL(id_ticket, 0) AS id_ticket
		,(CASE WHEN folio_ticket IS NULL THEN ISNULL(vdt.folio, '--') ELSE folio_ticket END) AS folio_ticket
		,ISNULL(id_movimiento_caja, 0) AS id_movimiento_caja
		,ISNULL(folio_mov_caja, 'VALE DEVOLUCION') AS folio_mov_caja
		,autorizado
		,ISNULL(id_vale_trans_devolucion, 0) AS id_vale_trans_devolucion
		,tb.importe
		,comision
		,banco
		,ISNULL(referencia,'SIN REFERENCIA') AS referencia
		,ISNULL(numero_operacion, 'SIN OPERACION') AS numero_operacion
		,numero_autorizacion
		,tb.id_usuario
		,tb.fecha_registro
  FROM 
		transaccion_banco tb
		LEFT JOIN vale_devolucion_transaccion vdt ON tb.id_vale_trans_devolucion = vdt.id_vale_devolucion_transaccion
  WHERE 
		tb.folio_ticket = @folioTicket
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaSeccionCompra]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--============================================
-- Author:		Carlos Negrete
-- Create date: 20.Septiembre.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaSeccionCompra]
	@idPromocion	 as int
AS
BEGIN
declare @ref as int
select @ref = id_referencia from promocion_compra Where id_promocion = @idPromocion

if(@ref !=1 and @ref !=6)
BEGIN
	SELECT	id_referencia,
		pc.clave,
		ISNULL(a.id_articulo,0) as id_articulo,
		pc.descripcion,
		ISNULL(cantidad,0) as cantidad,
		ISNULL(pc.es_mayoreo,0) as id_unidad_medida,
		CASE pc.es_mayoreo	WHEN 0 THEN 'Unidad Venta'
							WHEN 1 THEN 'Unidad Compra'
		END 
		as sUnidad
		from promocion_compra  pc left join unidad_medida um On um.id_unidad_medida=pc.id_unidad_medida
		left join articulo a on a.clave = pc.clave
		where id_promocion = @idPromocion;
END
ELSE
BEGIN
	SELECT	id_referencia,
		pc.clave,
		ISNULL(a.id_articulo,0) as id_articulo,
		pc.descripcion,
		ISNULL(cantidad,0) as cantidad,
		ISNULL(pc.id_unidad_medida,0) as id_unidad_medida,
		ISNULL(um.descripcion,'s/n') as sUnidad
		from promocion_compra  pc left join unidad_medida um On um.id_unidad_medida=pc.id_unidad_medida
		left join articulo a on a.clave = pc.clave
		where id_promocion = @idPromocion;
END
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaSeccionRegalo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 29.Junio.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaSeccionRegalo]
	@idPromocion	 as int
AS
BEGIN
SELECT	clave,
		ISNULL(art.id_articulo,0) as id_articulo,
		art.desc_super as descripcion,
		cantidad,
		ISNULL(pr.id_unidad_medida,0) as id_unidad_medida,
		ISNULL(um.descripcion,'s/n') as sUnidad,
		(case when ISNULL(pr.id_unidad_medida,0) = art.id_unidad_compra then 1 else 0 end) as es_mayoreo,
		art.relacion_venta
		from promocion_regalo pr 
		Left Join articulo art On art.id_articulo=pr.id_articulo
		Left Join unidad_medida um On um.id_unidad_medida=pr.id_unidad_medida
		where id_promocion = @idPromocion;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaSubcategoriaPorClave]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaSubcategoriaPorClave]
	@clave as nvarchar(50)
AS
BEGIN

	SELECT * FROM subcategoria WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaSubcategoriaPorDescripcion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaSubcategoriaPorDescripcion]
	@descripcion as nvarchar(50)
AS
BEGIN

	SELECT * FROM subcategoria WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaSubcategoriaPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaSubcategoriaPorId]
	@id as int
AS
BEGIN

	SELECT * FROM subcategoria WHERE id_subcategoria = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaTiraBancoPorFolioPanamericano]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-03
-- Description:	Consulta de tira de banco por folio Panamericano
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaTiraBancoPorFolioPanamericano]
	@folioPanamericano as nvarchar(20)
AS
BEGIN
	SELECT [id_tira_banco]
      ,[id_sucursal]
      ,[id_caja]
      ,[id_folio_inicial]
      ,[folio_inicial]
      ,[id_folio_final]
      ,[folio_final]
      ,[monto_total]
      ,[folio_panamericano]
      ,[observaciones]
      ,[fecha_registro]
      ,[id_usuario_logueado]
      ,[id_usuario_autorizo]
  FROM [dbo].[tira_banco] WHERE folio_panamericano = @folioPanamericano
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaUltimoFolioMovimientoAlmacen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 27 octubre 2018
-- Description:	Consulta ultimo folio de movimiento almacen
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaUltimoFolioMovimientoAlmacen]
	@idMovimientoAlmacenTipo as int
AS
BEGIN	
	if @idMovimientoAlmacenTipo = 16
		select top 1 folio from movimiento_almacen where id_movimiento_almacen_tipo in(4,5) order by fecha_registro desc;
	else if @idMovimientoAlmacenTipo = 17
		select top 1 folio from movimiento_almacen where id_movimiento_almacen_tipo in(8,9) order by fecha_registro desc;
	else
		select top 1 folio from movimiento_almacen where id_movimiento_almacen_tipo = @idMovimientoAlmacenTipo order by fecha_registro desc;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaUnidadMedidaPorClaveSAT]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 18.mayo.2018
-- Description:	Consulta unidad de medida por clave SAT
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaUnidadMedidaPorClaveSAT]
	@claveSAT as nvarchar(10)
AS
BEGIN
	SELECT * FROM unidad_medida WHERE clave_sat = @claveSAT
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaUnidadMedidaPorDescripcion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 18.mayo.2018
-- Description:	Consulta unidad de medida por descripcion
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaUnidadMedidaPorDescripcion]
	@descripcion as nvarchar(40)
AS
BEGIN
	SELECT * FROM unidad_medida WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaUnidadMedidaPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 18.mayo.2018
-- Description:	Consulta unidad de medida por ID
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaUnidadMedidaPorId]
	@id as int
AS
BEGIN
	SELECT * FROM unidad_medida WHERE id_unidad_medida = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaUsuarioClaveContrasena]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:          Marco Gonzalez
-- Create date:		31 Mayo 2018
-- Description:     Cambios al consultar por la decodificacion de la contrasena
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaUsuarioClaveContrasena]
	@clave as nvarchar(50),
	@contrasena as nvarchar(50),
	@llave as nvarchar(50)
AS
BEGIN
	DECLARE @contrasenaBD		AS	NVARCHAR(50);
	DECLARE @idUsuario			AS	INT;

	SET @contrasenaBD = NULL;
	SELECT @contrasenaBD = DECRYPTBYPASSPHRASE(@llave, contrasena), @idUsuario = id_usuario FROM usuario WHERE clave = @clave and activo = 1;

	IF(@contrasenaBD IS NOT NULL)
	BEGIN

		IF(@contrasenaBD != @contrasena)
		BEGIN
			SELECT @idUsuario = 0;
		END
	END
	ELSE
	BEGIN
		SELECT @idUsuario = 0;
	END
	

        
	
	SELECT @idUsuario AS id_usuario;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaUsuarioClaveContrasenaForm]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaUsuarioClaveContrasenaForm]
	@clave as nvarchar(50),
	@contrasena as nvarchar(50),
	@llave as nvarchar(50),
	@idCaja	as int
AS
BEGIN
	DECLARE @contrasenaBD		AS	NVARCHAR(50);
	DECLARE @idUsuario			AS	INT;

	SET @contrasenaBD = NULL;
	SELECT @contrasenaBD = DECRYPTBYPASSPHRASE(@llave, contrasena), @idUsuario = id_usuario FROM usuario WHERE clave = @clave and activo = 1;

	IF(@contrasenaBD IS NOT NULL)
	BEGIN

		IF(@contrasenaBD != @contrasena)
		BEGIN
			SELECT @idUsuario = 0;
		END
		ELSE
		BEGIN
			--IF ((select sesion_abierta from caja where id_caja= @idCaja) = 0)
			--BEGIN
				UPDATE
					caja 
				SET 
					ultimo_acceso = GETDATE(),
					sesion_abierta = 1 
				WHERE 
					id_caja = @idCaja
					and activo = 1

				UPDATE
					usuario
				SET
					ultima_sesion = GETDATE()
				WHERE
					id_usuario = @idUsuario
			--END
			--ELSE 
			--BEGIN
			--	SELECT @idUsuario = -1;
			--END
		END
	END
	ELSE
	BEGIN
		SELECT @idUsuario = 0;
	END
	

        
	
	SELECT @idUsuario AS id_usuario;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaUsuarioClaveContrasenaFormSesionAbierta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaUsuarioClaveContrasenaFormSesionAbierta]
	@clave as nvarchar(50),
	@contrasena as nvarchar(50),
	@llave as nvarchar(50),
	@idCaja	as int
AS
BEGIN
	DECLARE @contrasenaBD		AS	NVARCHAR(50);
	DECLARE @idUsuario			AS	INT;
	DECLARE @sesion				AS	INT;

	SET @contrasenaBD = NULL;
	SELECT @contrasenaBD = DECRYPTBYPASSPHRASE(@llave, contrasena), @idUsuario = id_usuario FROM usuario WHERE clave = @clave and activo = 1;

	IF(@contrasenaBD IS NOT NULL)
	BEGIN

		IF(@contrasenaBD != @contrasena)
		BEGIN
			SELECT @idUsuario = 0;
		END
		ELSE
		BEGIN
			select @sesion = sesion_abierta from caja where id_caja= @idCaja
			
		END
	END
	ELSE
	BEGIN
		SELECT @idUsuario = 0;
	END
	

        
	
	SELECT @idUsuario AS id_usuario,  @sesion as sesion;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaUsuarioPorClave]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:          Marco Gonzalez
-- Create date:		31 Mayo 2018
-- Description:     Cambios al consultar por la decodificacion de la contrasena
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaUsuarioPorClave]
	@clave as nvarchar(50),
	@llave as nvarchar(50)
AS
BEGIN
	SELECT
		 id_usuario,
		 nombre,
		 clave,
		 ISNULL(id_perfil,0) AS id_perfil,
		 ISNULL(id_sucursal,0) AS id_sucursal,
		 ISNULL(id_caja_actual,0) AS id_caja_actual,
		 fecha_alta,
		 ISNULL(ultima_sesion,0) AS ultima_sesion,
		 activo,
		 CONVERT(NVARCHAR(50),DECRYPTBYPASSPHRASE(@llave, contrasena)) AS contrasena
	FROM 
		usuario 
	WHERE 
		clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaUsuarioPorId]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:          Marco Gonzalez
-- Create date:		31 Mayo 2018
-- Description:     Cambios al consultar por la decodificacion de la contrasena
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaUsuarioPorId]
	@id as int,
	@llave as nvarchar(50)
AS
BEGIN
	SELECT
		 id_usuario,
		 nombre,
		 clave,
		 ISNULL(id_perfil,0) AS id_perfil,
		 ISNULL(id_sucursal,0) AS id_sucursal,
		 ISNULL(id_caja_actual,0) AS id_caja_actual,
		 fecha_alta,
		 ISNULL(ultima_sesion,0) AS ultima_sesion,
		 activo,
		 CONVERT(NVARCHAR(50),DECRYPTBYPASSPHRASE(@llave, contrasena)) AS contrasena
	FROM 
		usuario 
	WHERE 
		id_usuario = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaUsuarioPorNombre]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:          Marco Gonzalez
-- Create date:		31 Mayo 2018
-- Description:     Cambios al consultar por la decodificacion de la contrasena
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaUsuarioPorNombre]
	@nombre as nvarchar(50),
	@llave as nvarchar(50)
AS
BEGIN
	SELECT
		 id_usuario,
		 nombre,
		 clave,
		 ISNULL(id_perfil,0) AS id_perfil,
		 ISNULL(id_sucursal,0) AS id_sucursal,
		 ISNULL(id_caja_actual,0) AS id_caja_actual,
		 fecha_alta,
		 ISNULL(ultima_sesion,0) AS ultima_sesion,
		 activo,
		 CONVERT(NVARCHAR(50),DECRYPTBYPASSPHRASE(@llave, contrasena)) AS contrasena
	FROM 
		usuario 
	WHERE 
		nombre = @nombre
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaUsuarioSantander]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:          Saúl Cruces
-- Create date:		13.noviembre.2018
-- Description:     Consultar usuario de la sucursal para conexión a Santander
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaUsuarioSantander]
	@idSucursal as int,
	@llave as nvarchar(50)
AS
BEGIN
	SELECT [id_sucursal]
		  ,CONVERT(nvarchar(50), DECRYPTBYPASSPHRASE(@llave, [usuario])) AS usuario
		  ,CONVERT(nvarchar(50), DECRYPTBYPASSPHRASE(@llave, [contrasena])) AS contrasena
		  ,[url]
		  ,[ccType]
		  ,[operType]
	  FROM [dbo].[usuario_santander]
	  WHERE [id_sucursal] = @idSucursal
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaValeDevolucionPorFolio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-09-17
-- Description:	Consulta vale devolución por folio
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-01-21
-- Description:	Uppercase a la busqueda por folio
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaValeDevolucionPorFolio]
	@folio		AS	NVARCHAR(50)
AS
BEGIN
	SELECT
		id_vale_devolucion,
		id_sucursal,
		id_caja,
		id_devolucion,
		folio,
		monto,
		aplicado,
		ISNULL(id_cliente,0) AS id_cliente,
		fecha_registro,
		id_usuario_logueado,
		id_usuario_autorizo
	FROM
		vale_devolucion
	WHERE
		UPPER(folio) = UPPER(@folio)

END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaValeDevolucionTransaccionPorFolio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 22.noviembre.2018
-- Description:	Consulta vale devolución transacción por folio
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-01-21
-- Description:	Uppercase a la busqueda por folio
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaValeDevolucionTransaccionPorFolio]
	@folio AS nvarchar(12)
AS
BEGIN
	SELECT
		id_vale_devolucion_transaccion,
		id_sucursal,
		id_caja,
		folio,
		importe,
		fecha_registro,
		id_usuario,
		aplicado
	FROM
		vale_devolucion_transaccion
	WHERE
		UPPER(folio) = UPPER(@folio)
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaVariableConfiguracion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		carlos negrete
-- Create date: 2018-08-31
-- Description:	Consulta variable de configuracion
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaVariableConfiguracion]
	@idSucursal		INT,
	@idCaja			INT,
	@nombre			NVARCHAR(50)
AS
BEGIN
	SELECT
		id_variable,
		id_sucursal,
		ISNULL(id_caja,0) as id_caja,
		nombre,
		valor,
		tipo
	FROM
		variable_config
	WHERE
		id_sucursal = @idSucursal AND
		id_caja = @idCaja AND
		nombre = @nombre
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaVariableConfiguracionGlobales]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 25.octubre.2018
-- Description:	Obtener variables con caja igual a null
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaVariableConfiguracionGlobales]
	@idSucursal		INT
AS
BEGIN
	SELECT
		id_variable,
		id_sucursal,
		nombre,
		tipo,
		valor,
		ISNULL(descripcion,'') as descripcion
	FROM
		variable_config
	WHERE
		id_sucursal = @idSucursal AND
		id_caja IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaVariableConfiguracionPorCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-10-12
-- Description:	ISNULL descripcion
-- =============================================
CREATE PROCEDURE [dbo].[spConsultaVariableConfiguracionPorCaja]
	@idSucursal		INT,
	@idCaja			INT
AS
BEGIN
	SELECT
		id_variable,
		id_sucursal,
		id_caja,
		nombre,
		tipo,
		valor,
		ISNULL(descripcion,'') as descripcion
	FROM
		variable_config
	WHERE
		id_sucursal = @idSucursal AND
		id_caja = @idCaja 
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaVariableConfiguracionSN]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 2018-08-31
-- Description:	Consulta variable de configuracion
-- =============================================
Create PROCEDURE [dbo].[spConsultaVariableConfiguracionSN]
	@idSucursal		INT,
	@nombre			NVARCHAR(50)
AS
BEGIN
	SELECT
		id_variable,
		id_sucursal,
		ISNULL(id_caja,0) as id_caja,
		nombre,
		valor,
		tipo
	FROM
		variable_config
	WHERE
		id_sucursal = @idSucursal AND
		nombre = @nombre
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultaVentaSoloUnidadCompra]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-08-09
-- Description:	Consulta si un articulo solo puede venderse a unidades de compra
-- =============================================

CREATE PROCEDURE [dbo].[spConsultaVentaSoloUnidadCompra]
    @idArticulo AS	INT,
	@idSucursal	AS	INT
AS
BEGIN
    DECLARE @res	AS	BIT;
	SELECT @res = (CASE WHEN COUNT(a.id_articulo_sucursal_mayoreo) = 0 THEN 0 ELSE 1 END) FROM articulo_sucursal_mayoreo a WHERE id_articulo = @idArticulo AND id_sucursal = @idSucursal;
	SELECT @res AS ventaSoloUnidadCompra;
END
GO
/****** Object:  StoredProcedure [dbo].[spContarEfectivoCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Saul Cruces
-- Create date: 24.agosto.2018
-- Description: Contar efectivo de la caja
-- =============================================
CREATE PROCEDURE [dbo].[spContarEfectivoCaja]
    @idCaja AS INT,
	@esArqueo AS BIT
AS
BEGIN
	DECLARE @efectivo AS DECIMAL(18,2)
	IF @esArqueo = 1
		--Si es arqueo se toma en cuenta la morralla, no importa el tipo de caja
		SELECT @efectivo = SUM(importe_total) FROM movimiento_caja WHERE id_caja = @idCaja AND id_cierre IS NULL AND id_forma_pago = 1
			--AND fecha_registro BETWEEN DATEADD(DAY, -2, GETDATE()) AND GETDATE()
	ELSE
	BEGIN
		DECLARE @tipoCaja AS INT
		--Obtener si es caja de mayoreo o de super
		SELECT @tipoCaja = id_tipo_caja FROM caja WHERE id_caja = @idCaja
		--CAJA MAYOREO
		IF @tipoCaja = 3
			--id_movimiento_caja_concepto
				--2 Habilitar con Morralla
				--7 Incremento con Morralla
				--10 Retiro de Morralla
			SELECT @efectivo = SUM(importe_total) FROM movimiento_caja WHERE id_caja = @idCaja AND id_movimiento_caja_concepto NOT IN (2, 7, 10)
				AND id_cierre IS NULL AND id_forma_pago = 1
				--AND fecha_registro BETWEEN DATEADD(DAY, -2, GETDATE()) AND GETDATE()
		--CAJA SUPER
		ELSE IF @tipoCaja = 4
			SELECT @efectivo = SUM(importe_total) FROM movimiento_caja WHERE id_caja = @idCaja AND id_cierre IS NULL AND id_forma_pago = 1
				--AND fecha_registro BETWEEN DATEADD(DAY, -2, GETDATE()) AND GETDATE()
	END

	--Si el valor es negativo se regresa 0
	IF @efectivo < 0 OR @efectivo IS NULL
		SET @efectivo = 0

	--Regresar efectivo
	SELECT @efectivo AS efectivo
END
GO
/****** Object:  StoredProcedure [dbo].[spCrearJobDesapartado]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-04-05
-- Description:	Crear dinamicamente job desapartado
-- =============================================
CREATE PROCEDURE [dbo].[spCrearJobDesapartado]
	@nombreJob VARCHAR(100),
	@usuarioBD VARCHAR(200),
	@nombreBD VARCHAR(200)
AS
BEGIN
	IF NOT EXISTS (SELECT name FROM msdb.dbo.sysjobs WHERE name=N'' + @nombreJob + '')
	BEGIN
		DECLARE @JobCode VARCHAR(4000)
		SET @JobCode = '
		BEGIN TRANSACTION
		DECLARE @ReturnCode INT
		SELECT @ReturnCode = 0
		IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N''[Uncategorized (Local)]'' AND category_class=1)
		BEGIN
		EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N''JOB'', @type=N''LOCAL'', @name=N''[Uncategorized (Local)]''
		IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

		END

		DECLARE @jobId BINARY(16)
		EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N''' + @nombreJob + ''', 
				@enabled=1, 
				@notify_level_eventlog=0, 
				@notify_level_email=0, 
				@notify_level_netsend=0, 
				@notify_level_page=0, 
				@delete_level=0, 
				@description=N''No description available.'', 
				@category_name=N''[Uncategorized (Local)]'', 
				@owner_login_name=''' + @usuarioBD + ''', @job_id = @jobId OUTPUT
		IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
		EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N''stepDesapartarCotizacion'', 
				@step_id=1, 
				@cmdexec_success_code=0, 
				@on_success_action=1, 
				@on_success_step_id=0, 
				@on_fail_action=2, 
				@on_fail_step_id=0, 
				@retry_attempts=0, 
				@retry_interval=0, 
				@os_run_priority=0, @subsystem=N''TSQL'', 
				@command=N''exec spDesapartarCotizaciones'', 
				@database_name=N''' + @nombreBD + ''', 
				@flags=0
		IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
		EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
		IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
		EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N''scheduleDesapartarCotizacion'', 
				@enabled=1, 
				@freq_type=4, 
				@freq_interval=1, 
				@freq_subday_type=4, 
				@freq_subday_interval=5, 
				@freq_relative_interval=0, 
				@freq_recurrence_factor=0, 
				@active_start_date=20180825, 
				@active_end_date=99991231, 
				@active_start_time=0, 
				@active_end_time=235959, 
				@schedule_uid=N''efbce5a2-766a-4f05-b8d5-e20e2d6eac49''
		IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
		EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N''(local)''
		IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
		COMMIT TRANSACTION
		GOTO EndSave
		QuitWithRollback:
			IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
		EndSave:
		'
		Exec (@JobCode)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spCreaVariablesConfiguracionCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carolina Franco
-- Create date: 2019-04-06
-- Description:	Se agrega la variable SEG_PROMOCION
-- =============================================


-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-09-13
-- Description:	Crear variables de configuracion para la caja creada 
-- =============================================

-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-01-20
-- Description:	Se agregaron LIMITAR_VENTA_FAC_EFEC y ENLACE_BANCO_TIPO
-- =============================================

-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-02-11
-- Description:	Se agregaron NUM_INCREMENTOS_REIM y NUM_RETIROS_REIM
-- =============================================

-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-25
-- Description:	Se agregó PRECIOS_BUSCAR_ARTICULO_PV
-- =============================================
CREATE PROCEDURE [dbo].[spCreaVariablesConfiguracionCaja]
	@idCaja as int,
	@idSucursal as int

AS
BEGIN
	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,@idCaja
           ,'MONTO_AVISO_BLOQUEO_CAJA'
           ,'2000'
           ,'int'
           ,'Monto de aviso de bloqueo de caja');

	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,@idCaja
           ,'MONTO_BLOQUEO_CAJA'
           ,'3000'
           ,'int'
           ,'Monto que bloquea los movimientos de caja');

	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,@idCaja
           ,'MOSTRAR_EXISTENCIA'
           ,'false'
           ,'bool'
           ,'Habilita mostrar existencia de art�culos');

	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,@idCaja
           ,'COMANDO_CAJON'
           ,'7'
           ,'String'
           ,'Comando para abrir el caj�n de dinero');

	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,@idCaja
           ,'IMPRESORA_TICKET_GRANDE'
           ,'false'
           ,'bool'
           ,'Tipo de impresora de tickets');

	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,@idCaja
           ,'LIMITAR_VENTA_FAC_EFEC'
           ,'true'
           ,'bool'
           ,'Indica si el punto de venta debe preguntar si se va a facturar con efectivo al cargar una nueva venta');

	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,@idCaja
           ,'ENLACE_BANCO_TIPO'
           ,'none'
           ,'String'
           ,'Indica que banco se ultilizará para realizar los cobros en pv');

	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,@idCaja
           ,'NUM_INCREMENTOS_REIM'
           ,'30'
           ,'int'
           ,'Indica el número máximo de incrementos que aparecerán en la reimpresión');

	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,@idCaja
           ,'NUM_RETIROS_REIM'
           ,'30'
           ,'int'
           ,'Indica el número máximo de retiros que aparecerán en la reimpresión');

	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,@idCaja
           ,'MIN_RETIRO_MORRALLA'
           ,'0'
           ,'decimal'
           ,'Indica la cantidad minima de retiro de morralla');

	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,@idCaja
           ,'PRECIOS_BUSCAR_ARTICULO_PV'
           ,'true'
           ,'bool'
           ,'Indica si se deben mostrar los precios al buscar artículo y dar tabulador');

	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,@idCaja
           ,'SEG_PROMOCION'
           ,'8'
           ,'int'
           ,'Segundos que se visualiza la imagen de promocion en PV');

	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,@idCaja
           ,'RETIRO_LIBRE'
           ,'true'
           ,'bool'
           ,'Permitir retirar cualquier monto');
END
GO
/****** Object:  StoredProcedure [dbo].[spCreaVariablesConfiguracionGlobales]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-07
-- Description:	Se agregan variables de configuraci�n globales
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-04-12
-- Description:	Se agregó variable redondeo
-- =============================================
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 05.septiembre.2019
-- Description:	Se agregan variables para huella
-- =============================================
CREATE PROCEDURE [dbo].[spCreaVariablesConfiguracionGlobales]
	@idSucursal as int

AS
BEGIN
	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'MIN_COT_APARTADO'
           ,'30'
           ,'int'
           ,'Minutos que se apartar�n los art�culos de una cotizaci�n despu�s de su creaci�n, si no se ha convertido en venta');

	
	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'MULTIALMACEN_COTIZACION'
           ,'true'
           ,'bool'
           ,'Indica si las cotizaciones, buscar�n existencia en todos los almacenes o solamente en el que tengan ligado');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'SEG_GAL_PROMOCIONES'
           ,'10'
           ,'int'
           ,'Indica los segundos que tardar� en quitarse una imagen, del carrusel de promociones desplegado en el punto de venta');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'DIAS_ELIM_PROMO'
           ,'15'
           ,'int'
           ,'Indica los d�as que se mantendr� en base de datos una promoci�n despu�s de su fecha fin');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'DIAS_ELIM_OFERTA'
           ,'15'
           ,'int'
           ,'Indica los d�as que se mantendr� en base de datos una oferta despu�s de su fecha fin');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'DIAS_ELIM_COTIZACION'
           ,'60'
           ,'int'
           ,'Indica los d�as que se mantendr� una cotizaci�n en base de datos despu�s de su fecha de creaci�n');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'NUM_INCREMENTOS_REIM'
           ,'30'
           ,'int'
           ,'Indica el n�mero m�ximo de incrementos a mostrar en la pantalla de reimpresi�n de incrementos');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'NUM_RETIROS_REIM'
           ,'30'
           ,'int'
           ,'Indica el n�mero m�ximo de retiro a mostrar en la pantalla de reimpresi�n de retiros');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'MIN_RUTINA_DESAPARTADO'
           ,'5'
           ,'int'
           ,'Minutos en los que estar� corriendo la rutina que desaparta los art�culos de las cotizaciones');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'SEG_VERIF_PRECIOS'
           ,'5'
           ,'int'
           ,'Segundos que durar� mostrandos un precios, en el m�dulo de verificador de precios');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'DIAS_VIGENCIA_PARTITURA'
           ,'30'
           ,'int'
           ,'Los d�as de vigencia que se le pondr� por default a una partitura al momento de crearla');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'URL_PROMO_DEFAULT'
           ,'C:\Sinfonia\promo_default.jpg'
           ,'String'
           ,'URL de la imagen que se muestra por default si no hay promociones');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'PIX_ANCHO_IMG_PROMO'
           ,'300'
           ,'int'
           ,'Tama�o en pixeles del ancho que debe tener la imagen de promoci�n');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'PIX_ALTO_IMG_PROMO'
           ,'300'
           ,'int'
           ,'Tama�o en pixeles del alto que debe tener la imagen de promoci�n');
	
	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'MAX_PESO_IMG_PROMO'
           ,'1000'
           ,'int'
           ,'Peso del tamaño de la imagen (Bytes)');

	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'DIRECCION_SUCURSAL'
           ,''
           ,'String'
           ,'Direcci�n de la sucursal');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'CP_SUCURSAL'
           ,''
           ,'String'
           ,'C�digo Postal de la sucursal');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'TELEFONO_SUCURSAL'
           ,''
           ,'String'
           ,'N�mero de tel�fono de la sucursal');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'URL_RECARGAS'
           ,'http://saldopago.homeip.net/taepruebas/transact.asmx?wsdl'
           ,'String'
           ,'URL del servicio web de recargas');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'USUARIO_RECARGAS'
           ,'ACV_01'
           ,'String'
           ,'Usuario de acceso al servicio de recargas');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'CONTRASENA_RECARGAS'
           ,'16581Vrn'
           ,'String'
           ,'Contrasena de acceso al servicio de recargas');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'PIE_TICKET'
           ,''
           ,'String'
           ,'Leyenda localizada en el pie del ticket');



	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'CONSOLIDAR_POR_DIA'
           ,'false'
           ,'bool'
           ,'Indica si el reporte global se agrupar� por d�a o todos los que no est�n consolidados');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'TITULO_TICKET'
           ,'ABARROTES CASA VARGAS'
           ,'String'
           ,'Titulo del ticket de venta');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'RAZON_SOCIAL'
           ,'ABARROTES CASA VARGAS S.A. DE C.V.'
           ,'String'
           ,'Razon social de la empresa');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'DIRECCION'
           ,'INSURGENTES NORTE 1894 INT. 702 LINDAVISTA NORTE, DEL. GUSTAVO A. MADERO CD. MEXICO'
           ,'String'
           ,'Direccion de la empresa');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'CODIGO_POSTAL'
           ,'07300'
           ,'String'
           ,'Codigo postal de la empresa');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'TELEFONO'
           ,'52345678'
           ,'String'
           ,'Telefono de la empresa');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'RFC'
           ,'ACV850817FR6'
           ,'String'
           ,'Registro federal del contribuyente');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'ARCHIVO_AUD_PEN_CON_HEADER'
           ,'true'
           ,'bool'
           ,'Indica si el archivo de la auditor�a pendiente cuenta con header');


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (@idSucursal
           ,NULL
           ,'TIPO_RECORTE_2_DECIMALES_PV'
           ,'String'
           ,'redondear'
           ,'Indica el método de recorte a dos decimales en el importe y precio unitario en PV');
		   
	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (19
           ,NULL
           ,'HUELLA_OBLIGATORIA'
           ,'false'
           ,'bool'
           ,'Indica si se obliga a todos los usuariosa  tener huella registrada')


	INSERT INTO [dbo].[variable_config]
           ([id_sucursal]
           ,[id_caja]
           ,[nombre]
           ,[valor]
           ,[tipo]
           ,[descripcion])
     VALUES
           (19
           ,NULL
           ,'ESCANER_ACTIVO'
           ,'false'
           ,'bool'
           ,'Indica si se debe pedir la huella')
END
GO
/****** Object:  StoredProcedure [dbo].[spDesapartarCotizaciones]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-08-25
-- Description:	Pasa la existencia de apartado a existencia actual de las cotizaciones caducadas, transaccional
-- =============================================
CREATE PROCEDURE [dbo].[spDesapartarCotizaciones]
AS
BEGIN	
	BEGIN TRY
		BEGIN TRAN
		DECLARE @idCotizacion			AS	INT;
		DECLARE @fechaRegistro			AS	DATETIME;
		DECLARE @idCotizacionDetalle	AS	INT;
		DECLARE @idArticulo				AS	INT;
		DECLARE @cantidad				AS	DECIMAL(18,2);
		DECLARE @idAlmacen				AS	INT;
		DECLARE @idUnidad				AS	INT;
		DECLARE @idUnidadCompra			AS	INT;
		DECLARE @relacionCompra			AS	INT;
		DECLARE @relacionVenta			AS	INT;
		DECLARE @tiempoApartadoSeg		AS	INT;
		DECLARE @diferenciaFechasSeg	AS	INT;
		DECLARE @existenciaApartado		AS	INT;
		DECLARE @fechaActual			AS	DATETIME;

		SELECT @tiempoApartadoSeg = CONVERT(INT,valor) * 60 FROM variable_config WHERE nombre = 'MIN_COT_APARTADO'; 
		SELECT @fechaActual = GETDATE();

		DECLARE cursorCotizaciones CURSOR FOR
		SELECT id_cotizacion, fecha_registro FROM cotizacion WHERE id_venta IS NULL AND cotizacion_apartada = 1

		OPEN cursorCotizaciones
		FETCH NEXT FROM cursorCotizaciones
		INTO @idCotizacion, @fechaRegistro

		WHILE @@FETCH_STATUS = 0
		BEGIN
		
			IF(DATEDIFF(SECOND, @fechaRegistro, @fechaActual) > @tiempoApartadoSeg)
			BEGIN
				DECLARE detalleCotizacion CURSOR FOR
				SELECT id_cotizacion_detalle, id_articulo, cantidad, id_unidad_medida, id_almacen FROM cotizacion_detalle WHERE id_cotizacion = @idCotizacion

				OPEN detalleCotizacion
				FETCH NEXT FROM detalleCotizacion
				INTO @idCotizacionDetalle, @idArticulo, @cantidad, @idUnidad, @idAlmacen

				WHILE @@FETCH_STATUS = 0
				BEGIN
					SELECT @existenciaApartado  = existencia_apartado FROM articulo_existencia WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacen
					SELECT @cantidad = (CASE WHEN @idUnidad = id_unidad_compra THEN @cantidad * relacion_venta / relacion_compra ELSE @cantidad END) FROM articulo WHERE id_articulo = @idArticulo
			
					IF(@existenciaApartado >= @cantidad)
					BEGIN
						UPDATE 
							articulo_existencia
						SET
							existencia_apartado = existencia_apartado - @cantidad,
							existencia_actual = existencia_actual + @cantidad
						WHERE
							id_articulo = @idArticulo AND
							id_almacen = @idAlmacen
					END

					FETCH NEXT FROM detalleCotizacion
					INTO @idCotizacionDetalle, @idArticulo, @cantidad, @idUnidad, @idAlmacen
				END
				CLOSE detalleCotizacion
				DEALLOCATE detalleCotizacion

				UPDATE
					cotizacion
				SET
					cotizacion_apartada = 0
				WHERE
					id_cotizacion = @idCotizacion
			END
			FETCH NEXT FROM cursorCotizaciones
			INTO @idCotizacion, @fechaRegistro
		END
		CLOSE cursorCotizaciones
		DEALLOCATE cursorCotizaciones
		COMMIT TRAN
	END TRY

	BEGIN CATCH
		ROLLBACK TRAN
	END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminaArticuloProveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spEliminaArticuloProveedor]
	@idArticuloProveedor as int
AS
BEGIN
	DELETE FROM [dbo].[articulo_proveedor]
      WHERE id_articulo_proveedor = @idArticuloProveedor
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminaArticuloSucursalMayoreo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola Martin
-- Create date: 05 junio 2018
-- Description:	Elimina articulo_sucursal_mayoreo
-- =============================================
CREATE PROCEDURE [dbo].[spEliminaArticuloSucursalMayoreo]
	@id as int
AS
BEGIN
	DELETE FROM [dbo].[articulo_sucursal_mayoreo]
      WHERE id_articulo_sucursal_mayoreo = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminaPrecioAgrupador]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 22.mayo.2018
-- Description:	Elimina precio agrupador
-- =============================================
CREATE PROCEDURE [dbo].[spEliminaPrecioAgrupador]
	@id as int
AS
BEGIN
	DELETE precio_agrupador WHERE id_precio_agrupador = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarArtEq]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 30.mayo.2018
-- Description:	Eliminar articulo equivalente
-- =============================================
CREATE PROCEDURE [dbo].[spEliminarArtEq]
	@idArtEq as int
AS
BEGIN
	DELETE FROM articulo_equivalente WHERE id_articulo_equivalente = @idArtEq
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarArticuloOferta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:		Carlos Negrete
-- Create date: 07.Junio.2018
-- Description:	Eliminar Oferta
-- =============================================
CREATE PROCEDURE [dbo].[spEliminarArticuloOferta]
	@idArtOferta as int
AS
BEGIN
	DELETE FROM articulo_oferta WHERE id_articulo_oferta = @idArtOferta
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarArticuloPrecio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spEliminarArticuloPrecio]
	@idArticuloPrecio as int
AS
BEGIN
	DECLARE @noOrdenEliminado as int
	DECLARE @idArticulo as int
	SELECT @noOrdenEliminado = no_orden, @idArticulo = id_articulo FROM articulo_precio WHERE id_articulo_precio = @idArticuloPrecio

	DELETE FROM [dbo].[articulo_precio]
      WHERE id_articulo_precio = @idArticuloPrecio
      
    DECLARE @nOrd as int
    DECLARE @idArtP as int
	DECLARE precios_cursor CURSOR
		FOR SELECT  id_articulo_precio, no_orden
			FROM articulo_precio
			WHERE id_articulo = @idArticulo AND no_orden > @noOrdenEliminado
	OPEN precios_cursor
	FETCH NEXT FROM precios_cursor
	INTO @idArtP, @nOrd
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE articulo_precio SET no_orden = @nOrd - 1 WHERE id_articulo_precio = @idArtP
		FETCH NEXT FROM precios_cursor
		INTO @idArtP, @nOrd
	END
	CLOSE precios_cursor
	DEALLOCATE precios_cursor
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarDatosFacturacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarDatosFacturacion]
           @idDatoFact as int
AS
BEGIN
	DECLARE @tamProv AS INT;
	DECLARE @tamClit AS INT;
	DECLARE @resp AS VARCHAR(10);

	SELECT @tamProv = count(id_proveedor) FROM proveedor WHERE id_datos_facturacion = @idDatoFact
	SELECT @tamClit = count(id_cliente) FROM cliente WHERE id_datos_facturacion = @idDatoFact

	IF @tamProv > 0
	BEGIN
		SET @resp = 'Proveedor'
	END
	ELSE IF @tamClit > 0
	BEGIN
		SET @resp = 'Cliente'
	END
	ELSE
	BEGIN
		DELETE datos_facturacion WHERE id_datos_facturacion = @idDatoFact
		SET @resp = 'OK'
	END

	SELECT @resp
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarMonitoreos]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-09-10
-- Description:	Borrar monitoreos
-- =============================================
CREATE PROCEDURE [dbo].[spEliminarMonitoreos]
	@idSucursal AS INT,
	@origen AS NVARCHAR(100)
AS
BEGIN
	DECLARE @diasParaEliminarMonitoreo INT

	SELECT @diasParaEliminarMonitoreo = ISNULL(max_dias_almacenados,0) FROM configuracion_seguridad WHERE id_sucursal = @idSucursal

	DELETE
		ev
	FROM
		evmoni_detalle ev
		LEFT JOIN evmoni mon ON ev.id_evmoni = mon.id_evmoni
	WHERE
		(@origen = 'consolidacion' AND DATEDIFF(dd, mon.fecha_inicio, GETDATE()) = @diasParaEliminarMonitoreo) OR @origen = 'cierre_base'

	DELETE
		evmoni
	WHERE
		(@origen = 'consolidacion' AND DATEDIFF(dd, fecha_inicio, GETDATE()) = @diasParaEliminarMonitoreo) OR @origen = 'cierre_base'
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarOfertaVolanteBanda]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 07/06/2018
-- Description:	Elimina Oferta
-- =============================================
CREATE PROCEDURE [dbo].[spEliminarOfertaVolanteBanda]
	@idArticulo as int,
	@noOrden as int,
	@tipo as int
AS
BEGIN
DECLARE @oferta as int
	DELETE FROM articulo_oferta where no_orden = @noOrden and id_articulo = @idArticulo and @tipo = id_oferta_tipo
	SET  @oferta = 1;
	select @oferta as 'id_articulo_oferta'
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarPermiso]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 07.noviembre.2018
-- Description:	Eliminar un permiso
-- =============================================
CREATE PROCEDURE [dbo].[spEliminarPermiso]
	@descripcionModulo AS nvarchar(50),
	@descripcionPermiso AS nvarchar(50),
	@idPerfil AS int
AS
BEGIN
	DECLARE @idModulo AS int
	DECLARE @idPermiso AS int

	SELECT @idModulo = [id_modulo] FROM [dbo].[modulo] WHERE [descripcion] = @descripcionModulo
	SELECT @idPermiso = [id_permiso] FROM [dbo].[permiso] WHERE [descripcion] = @descripcionPermiso

	DELETE FROM [dbo].[perfil_modulo_permiso]
		  WHERE [id_modulo] = @idModulo AND
				[id_permiso] = @idPermiso AND
				[id_perfil] = @idPerfil
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminaTodosProductoRecarga]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-10-16
-- Description:	Elimina los productos de Recargas
-- =============================================
CREATE PROCEDURE [dbo].[spEliminaTodosProductoRecarga]
AS
BEGIN
	delete from producto_recargas;
	DBCC CHECKIDENT (producto_recargas, RESEED,1)
END
GO
/****** Object:  StoredProcedure [dbo].[spExistenciaDeApartadoAVenta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 26.julio.2018
-- Description:	Pasar existencia de apartado a venta
-- =============================================
CREATE PROCEDURE [dbo].[spExistenciaDeApartadoAVenta]
	@idArticulo AS INT,
	@idAlmacen AS INT,
	@cantidad AS DECIMAL(18,4)
AS
BEGIN
	UPDATE articulo_existencia SET
		existencia_apartado = existencia_apartado - @cantidad,
		existencia_venta = existencia_venta + @cantidad
	WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacen
END
GO
/****** Object:  StoredProcedure [dbo].[spExisteRFC]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date:	2018-06-15
-- Description:	Busca si un RFC ya est� dado de alta
-- =============================================
CREATE PROCEDURE [dbo].[spExisteRFC]
	@rfc as nvarchar(50)
AS
BEGIN
	DECLARE @idDatos AS INT;
	SET @idDatos = 0;
	SELECT @idDatos = id_datos_facturacion FROM datos_facturacion WHERE rfc = @rfc
	SELECT CASE WHEN @idDatos > 0 THEN 1 ELSE 0 END AS existe;
END
GO
/****** Object:  StoredProcedure [dbo].[spFiltraPromociones]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 29.Junio.2018
-- Description:	SP
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Modification date: 2018-08-31
-- Description:	Ordenar por fecha de vigencia final
-- =============================================
CREATE PROCEDURE [dbo].[spFiltraPromociones]
	@clave		 as nvarchar(10),
	@nombre		 as nvarchar(50),
	@tipo		 as int,
	@estatus		 as int
AS
BEGIN
	IF (@clave!='' and @nombre='' and @tipo=0 and @estatus=2)	
	BEGIN
		SELECT	
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE 
			clave LIKE '%'+@clave+'%'
		ORDER BY
			p.vigencia_fin ASC 
	END
	ELSE IF (@clave='' and @nombre!='' and @tipo=0 and @estatus=2)	
	BEGIN
		SELECT	
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE 
			p.nombre like '%'+@nombre+'%'
		ORDER BY
			p.vigencia_fin ASC
	END
	ELSE IF (@clave='' and @nombre='' and @tipo!=0 and @estatus=2)	
	BEGIN
		SELECT	
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE  
			@tipo = p.id_promocion_tipo
		ORDER BY
			p.vigencia_fin ASC
	END
	ELSE IF (@clave='' and @nombre='' and @tipo=0 and @estatus!=2)	
	BEGIN
		SELECT	
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE  
			@estatus = p.activo
		ORDER BY
			p.vigencia_fin ASC
	END
	ELSE IF (@clave!='' and @nombre!='' and @tipo=0 and @estatus=2)	
	BEGIN
		SELECT	
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE  
			clave like'%'+@clave+'%' and nombre like'%'+@nombre+'%'
		ORDER BY
			p.vigencia_fin ASC
	END
	ELSE IF (@clave!='' and @nombre='' and @tipo!=0 and @estatus=2)	
	BEGIN
		SELECT	
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE  
			clave like '%'+@clave+'%' and @tipo=p.id_promocion_tipo
		ORDER BY
			p.vigencia_fin ASC
	END
	ELSE IF (@clave!='' and @nombre='' and @tipo=0 and @estatus!=2)	
	BEGIN
		SELECT	
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE  
			clave like'%'+@clave+'%' and @estatus= p.activo
		ORDER BY
			p.vigencia_fin ASC
	END
	ELSE IF (@clave='' and @nombre!='' and @tipo=0 and @estatus!=2)	
	BEGIN
		SELECT	
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE  
			nombre like'%'+@nombre+'%' and @estatus= p.activo
		ORDER BY
			p.vigencia_fin ASC
	END
	ELSE IF (@clave='' and @nombre!='' and @tipo!=0 and @estatus=2)	
	BEGIN
		SELECT	
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE  
			nombre like'%'+@nombre+'%' and @tipo= p.id_promocion_tipo
		ORDER BY
			p.vigencia_fin ASC
	END
	ELSE IF (@clave='' and @nombre='' and @tipo!=0 and @estatus!=2)	
	BEGIN
		SELECT
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE  
			@estatus= p.activo and @tipo= p.id_promocion_tipo
		ORDER BY
			p.vigencia_fin ASC
	END
	ELSE IF (@clave!='' and @nombre!='' and @tipo!=0 and @estatus=2)	
	BEGIN
		SELECT	
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE  
			nombre like '%'+@nombre+'%' and @tipo= p.id_promocion_tipo and clave like'%'+@clave+'%'
		ORDER BY
			p.vigencia_fin ASC
	END
	ELSE IF (@clave!='' and @nombre='' and @tipo!=0 and @estatus!=2)	
	BEGIN
		SELECT	
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE  
			@estatus= p.activo and @tipo= p.id_promocion_tipo and clave like '%'+@clave+'%'
		ORDER BY
			p.vigencia_fin ASC
	END
	ELSE IF (@clave='' and @nombre!='' and @tipo!=0 and @estatus!=2)	
	BEGIN
		SELECT
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE  
			@estatus= p.activo and @tipo= p.id_promocion_tipo and nombre like'%'+@nombre+'%'
		ORDER BY
			p.vigencia_fin ASC
	END
	ELSE IF (@clave!='' and @nombre!='' and @tipo=0 and @estatus!=2)	
	BEGIN
		SELECT	
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE  
			@estatus= p.activo and clave like'%'+@clave+'%' and nombre like'%'+@nombre+'%'
		ORDER BY
			p.vigencia_fin ASC
	END
	ELSE IF (@clave!='' and @nombre!='' and @tipo!=0 and @estatus!=2)	
	BEGIN
		SELECT	
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo 
		WHERE  
			@estatus= p.activo and @tipo= p.id_promocion_tipo and nombre like'%'+@nombre+'%' and clave like '%'+@clave+'%'
		ORDER BY
			p.vigencia_fin ASC
	END
	ELSE IF (@clave='' and @nombre='' and @tipo=0 and @estatus=2)	
	BEGIN
		SELECT	
			id_promocion,
			clave as Clave,
			nombre as Nombre, 
			descripcion as Tipo, 
			Convert(nvarchar,vigencia_fin,103)as Vigencia,
			(Case p.activo	when 1 then 'Activo'
							when 0 then 'Inactivo' end) as Estatus				
		FROM 
			promocion p
			LEFT JOIN promocion_tipo pt ON pt.id_promocion_tipo = p.id_promocion_tipo
		ORDER BY
			p.vigencia_fin ASC
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spGeneraRegistroConsolidacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.05.2018
-- Description:	SP
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-13
-- Description:	Cambio sequence por consecutivo
-- =============================================
CREATE PROCEDURE [dbo].[spGeneraRegistroConsolidacion]
	@idSucursal		as int,
	@idAutorizo		as int,
	@base			as nvarchar(50)
	
AS
BEGIN
DECLARE @diasElim as int
Declare @folio AS NVARCHAR(12)
Declare @id decimal;
DECLARE @noSucursal AS NVARCHAR(2)
SET @noSucursal = REPLICATE('0', 2 - LEN(@idSucursal)) + CAST(@idSucursal AS NVARCHAR)
DECLARE @MOVIMIENTO NVARCHAR(MAX),
			@NextId BIGINT

	EXEC spObtenerSiguienteConsecutivoMovimientos
		@idOrigen = 0,
		@idSucursal = @idSucursal,
		@idCaja = 0,
		@origenConsecutivo = 3,
		@siguienteNumero = @NextId OUTPUT

	SET @folio = REPLICATE('0', 4 - LEN(@NextId)) + CAST(@NextId AS NVARCHAR)
	SET @folio = 'CONS' + @noSucursal + @folio

	INSERT INTO consolidacion
	VALUES (GETDATE(), 
			@folio,
			@idSucursal,
			null,
			@NextId,
			GETDATE(),
			GETDATE(),
			@idAutorizo,
			0)
	set @id = @@IDENTITY;

	SELECT @diasElim = valor FROM variable_config WHERE nombre = 'DIAS_ELIM_PROMO' and id_sucursal = @idSucursal
		SET @diasElim = ISNULL(@diasElim, 0)
		--Eliminar imagen promo
		DELETE [dbo].[promocion_imagen] WHERE [id_promocion] IN
			(SELECT [id_promocion] FROM [dbo].[promocion] WHERE DATEDIFF(DAY, vigencia_fin, GETDATE()) >= @diasElim AND id_sucursal = @idSucursal
				AND [id_promocion] NOT IN (SELECT [id_promocion] FROM [dbo].[promocion_venta] GROUP BY [id_promocion]))
		--Eliminar promo compra
		DELETE [dbo].[promocion_compra] WHERE [id_promocion] IN
			(SELECT [id_promocion] FROM [dbo].[promocion] WHERE DATEDIFF(DAY, vigencia_fin, GETDATE()) >= @diasElim AND id_sucursal = @idSucursal
				AND [id_promocion] NOT IN (SELECT [id_promocion] FROM [dbo].[promocion_venta] GROUP BY [id_promocion]))
		--Eliminar promo regalo
		DELETE [dbo].[promocion_regalo] WHERE [id_promocion] IN
			(SELECT [id_promocion] FROM [dbo].[promocion] WHERE DATEDIFF(DAY, vigencia_fin, GETDATE()) >= @diasElim AND id_sucursal = @idSucursal
				AND [id_promocion] NOT IN (SELECT [id_promocion] FROM [dbo].[promocion_venta] GROUP BY [id_promocion]))
		--Eliminar promo
		DELETE [dbo].[promocion] WHERE [id_promocion] IN
			(SELECT [id_promocion] FROM [dbo].[promocion] WHERE DATEDIFF(DAY, vigencia_fin, GETDATE()) >= 15 AND id_sucursal = 48
				AND [id_promocion] NOT IN (SELECT [id_promocion] FROM [dbo].[promocion_venta] GROUP BY [id_promocion]))
		--Desactivar promos
		UPDATE [dbo].[promocion]
		   SET [activo] = 0
		 WHERE DATEDIFF(DAY, [vigencia_fin], GETDATE()) >= @diasElim AND [id_sucursal] = @idSucursal

		--Eliminar ofertas
		SELECT @diasElim = valor FROM variable_config WHERE nombre = 'DIAS_ELIM_OFERTA' and id_sucursal = @idSucursal
		SET @diasElim = ISNULL(@diasElim, 0)
		DELETE articulo_oferta WHERE DATEDIFF(DAY, fecha_termino, GETDATE()) >= @diasElim

		--Pasar valores de existencia venta y apartado, a existecia actual
		UPDATE [dbo].[articulo_existencia]
		   SET [existencia_actual] = ISNULL([existencia_actual],0) + ISNULL([existencia_apartado],0) + ISNULL([existencia_venta],0)
			  ,[existencia_apartado] = 0
			  ,[existencia_venta] = 0
			WHERE [id_almacen] IN (SELECT [id_almacen] FROM [dbo].[almacen] WHERE [id_sucursal] = @idSucursal)

	SELECT	
		ISNULL(id_consolidacion,0) as id_consolidacion,
		ISNULL(id_autorizo,0) as id_autorizo,
		ISNULL(fecha_registro,GETDATE()) as fecha_registro,
		ISNULL(id_sucursal,0) as id_sucursal,
		ISNULL(folio,'')as folio
		from consolidacion
		where id_consolidacion = Cast(@id as int)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetArticulosEquivalentesInexistentesEnAws]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ing. Israel Flores
-- Create date: 04/11/2019
-- Description:	Obtiene los articulos equivalentes para que estos sean agregados a AWS
-- =============================================
CREATE PROCEDURE [dbo].[spGetArticulosEquivalentesInexistentesEnAws] 
	@strClaves as varchar(MAX)
AS
BEGIN


	EXEC('SELECT ar.clave, ae.codigo_barras, convert(int, ae.activo) as activo'+
		' FROM articulo ar'+
		' INNER JOIN articulo_equivalente ae on ae.id_articulo = ar.id_articulo'+
		' WHERE ar.Clave IN ' + @strClaves)

END
GO
/****** Object:  StoredProcedure [dbo].[spGetArticulosInexistentesEnAws]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ing. Israel Flores
-- Create date: 04/11/2019
-- Description:	Obtiene los articulos de las claves enviadas en el parametro para que estos sean agregados a AWS
-- =============================================
CREATE PROCEDURE [dbo].[spGetArticulosInexistentesEnAws] 
	@strClaves as varchar(MAX)
AS
BEGIN


	EXEC('SELECT ar.clave, ar.codigo_barras1, ar.codigo_barras2, ar.desc_super, ar.desc_mayoreo, fa.clave AS familia, li.clave AS linea, convert(int, ar.activo) as estatus,'+
	' (select descripcion from unidad_medida where id_unidad_medida = id_unidad_compra) as UnidadCompra, relacion_venta as RelacionVenta,(select descripcion from unidad_medida where id_unidad_medida = id_unidad_venta) as UnidadVenta' +
	' FROM ARTICULO ar' +
	' INNER JOIN Familia fa on fa.id_familia = ar.id_familia' +
	' INNER JOIN linea_negocio li on li.id_linea_negocio = ar.id_linea_negocio WHERE ar.Clave IN ' + @strClaves)

END
GO
/****** Object:  StoredProcedure [dbo].[spGetFamiliasInexistentesEnAws]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ing. Israel Flores
-- Create date: 04/11/2019
-- Description:	Obtiene los articulos de las claves enviadas en el parametro para que estos sean agregados a AWS
-- =============================================
CREATE PROCEDURE [dbo].[spGetFamiliasInexistentesEnAws] 
	@strClaves as varchar(MAX)
AS
BEGIN


	EXEC('SELECT clave, descripcion FROM Familia WHERE Clave IN ' + @strClaves)

END

GO
/****** Object:  StoredProcedure [dbo].[spGetLineasInexistentesEnAws]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ing. Israel Flores
-- Create date: 04/11/2019
-- Description:	Obtiene los articulos de las claves enviadas en el parametro para que estos sean agregados a AWS
-- =============================================
CREATE PROCEDURE [dbo].[spGetLineasInexistentesEnAws] 
	@strClaves as varchar(MAX)
AS
BEGIN


	EXEC('SELECT clave, descripcion FROM linea_negocio WHERE Clave IN ' + @strClaves)

END

GO
/****** Object:  StoredProcedure [dbo].[spGetSequenceForMovement]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Adrian Ramirez
-- Create date: 2018-07-03
-- Description:	Devuelve el sigueinte folio
--              para cada tipo de movimiento
-- =============================================
CREATE PROCEDURE [dbo].[spGetSequenceForMovement]
	@mov as nvarchar(MAX)
AS
BEGIN


	DECLARE @MOVIMIENTO NVARCHAR(MAX),
			@ErrorMessage NVARCHAR(MAX),
			@NextId BIGINT

	SET @MOVIMIENTO =
		CASE @mov
			WHEN 'Test' THEN 'Test'
			WHEN 'Compra' THEN 'Compra'
			WHEN 'TransferenciaSucursalEntrada' THEN 'TransferenciaSucursalEntrada'
			WHEN 'TransferenciaSucursalSalida' THEN 'TransferenciaSucursalSalida'
			WHEN 'TransferenciaAlmacenEntrada' THEN 'TransferenciaAlmacenEntrada'
			WHEN 'TransferenciaAlmacenSalida' THEN 'TransferenciaAlmacenSalida'
			WHEN 'TransferenciaA' THEN 'TransferenciaA'
			WHEN 'DevolucionCliente' THEN 'DevolucionCliente'
			WHEN 'AjusteInventarioEntrada' THEN 'AjusteInventarioEntrada'
			WHEN 'AjusteInventarioSalida' THEN 'AjusteInventarioSalida'
			WHEN 'DevolucionProveedor' THEN 'DevolucionProveedor'
			WHEN 'ConsumoInterno' THEN 'ConsumoInterno'
			WHEN 'Venta' THEN 'Venta'
			WHEN 'Merma' THEN 'Merma'
			ELSE 'NONE'
	END

	
	SET @ErrorMessage = CONCAT('El tipo de movimiento no existe -',@mov,'-')

	IF(@MOVIMIENTO = 'NONE')
		THROW 51000, @ErrorMessage, 1;  

	BEGIN TRANSACTION;

		IF(@MOVIMIENTO = 'Test')
			SELECT @NextId = NEXT VALUE FOR dbo.seq_Test

		IF(@MOVIMIENTO = 'Compra')
			SELECT @NextId = NEXT VALUE FOR dbo.seq_Compra

		IF(@MOVIMIENTO = 'TransferenciaSucursalEntrada')
			SELECT @NextId = NEXT VALUE FOR dbo.seq_TransferenciaSucursalEntrada

		IF(@MOVIMIENTO = 'TransferenciaSucursalSalida')
			SELECT @NextId = NEXT VALUE FOR dbo.seq_TransferenciaSucursalSalida

		IF(@MOVIMIENTO = 'TransferenciaAlmacenEntrada')
			SELECT @NextId = NEXT VALUE FOR dbo.seq_TransferenciaAlmacenEntrada

		IF(@MOVIMIENTO = 'TransferenciaAlmacenSalida')
			SELECT @NextId = NEXT VALUE FOR dbo.seq_TransferenciaAlmacenSalida

		IF(@MOVIMIENTO = 'TransferenciaA') 
			SELECT @NextId = NEXT VALUE FOR dbo.seq_TransferenciaA

		IF(@MOVIMIENTO = 'DevolucionCliente') 
			SELECT @NextId = NEXT VALUE FOR dbo.seq_DevolucionCliente

		IF(@MOVIMIENTO = 'AjusteInventarioEntrada') 
			SELECT @NextId = NEXT VALUE FOR dbo.seq_AjusteInventarioEntrada

		IF(@MOVIMIENTO = 'AjusteInventarioSalida') 
			SELECT @NextId = NEXT VALUE FOR dbo.seq_AjusteInventarioSalida

		IF(@MOVIMIENTO = 'DevolucionProveedor') 
			SELECT @NextId = NEXT VALUE FOR dbo.seq_DevolucionProveedor

		IF(@MOVIMIENTO = 'ConsumoInterno') 
			SELECT @NextId = NEXT VALUE FOR dbo.seq_ConsumoInterno

		IF(@MOVIMIENTO = 'Venta') 
			SELECT @NextId = NEXT VALUE FOR dbo.seq_Venta

		IF(@MOVIMIENTO = 'Merma') 
			SELECT @NextId = NEXT VALUE FOR dbo.seq_Merma

	COMMIT;

	SELECT @NextId;
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaAlmacen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaAlmacen]
	@idSucursal as int,
	@clave as nvarchar(50),
	@nombre as nvarchar(50),
	@esMayoreo as tinyint
AS
BEGIN
DECLARE @id_almacenR as int
DECLARE @id_sucursalR as int
DECLARE @claveR as nvarchar(5)
DECLARE @nombreR as nvarchar(50)
DECLARE @es_mayoreoR as tinyint
DECLARE @fecha_altaR as DATETIME
DECLARE @activo as tinyint

set @id_almacenR = 0

if exists(select id_almacen from almacen where @clave = clave)
begin
		SET @id_almacenR =-1;
		SET @id_sucursalR =0;
		SET @claveR ='clave_existe';
		SET @nombreR ='nombre';
		SET @es_mayoreoR =0;
		SET @fecha_altaR =getdate();
		SET @activo =0;
end
else 
begin
	if exists(select id_almacen from almacen where nombre = @nombre )
	begin
		SET @id_almacenR =-1;
		SET @id_sucursalR =0;
		SET @claveR ='clave';
		SET @nombreR ='nombre_existe';
		SET @es_mayoreoR =0;
		SET @fecha_altaR =getdate();
		SET @activo =0;
	end
	else
	begin
		if @esMayoreo=0
		begin
			IF exists ( SELECT id_almacen FROM almacen WHERE id_sucursal = @idSucursal and es_mayoreo = 0)
			BEGIN
				SET @id_almacenR =0;
				SET @id_sucursalR =0;
				SET @claveR ='clave';
				SET @nombreR ='nombre';
				SET @es_mayoreoR =0;
				SET @fecha_altaR =getdate();
				SET @activo =0;
			END
			ELSE
			BEGIN
				INSERT INTO almacen (id_sucursal,clave,nombre,es_mayoreo,fecha_alta,activo) VALUES (@idSucursal,@clave,@nombre,@esMayoreo,GETDATE(),1)

				SELECT 
					@id_almacenR = id_almacen,
					@id_sucursalR = id_sucursal,
				@claveR= clave,
				@nombreR= nombre,
				@es_mayoreoR= es_mayoreo,
				@fecha_altaR= fecha_alta,
				@activo= activo
				FROM almacen WHERE clave = @clave
			END
		End
		Else
		Begin
			INSERT INTO almacen (id_sucursal,clave,nombre,es_mayoreo,fecha_alta,activo) VALUES (@idSucursal,@clave,@nombre,@esMayoreo,GETDATE(),1)

				SELECT 
					@id_almacenR = id_almacen,
					@id_sucursalR = id_sucursal,
					@claveR= clave,
					@nombreR= nombre,
					@es_mayoreoR= es_mayoreo,
					@fecha_altaR= fecha_alta,
					@activo= activo
				FROM almacen WHERE clave = @clave
		end
	end
end
	SELECT 
		@id_almacenR as id_almacen,
		@id_sucursalR as id_sucursal,
		@claveR as clave,
		@nombreR as nombre,
		@es_mayoreoR as es_mayoreo,
		@fecha_altaR as fecha_alta,
		@activo as activo

END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaArtCodEq]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 25.mayo.2018
-- Description:	Guardar articulo equivalente
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaArtCodEq]
	@idArticulo as int,
	@codigoBarras as nvarchar(36),
	@cantidadVenta as decimal(18,2)
AS
BEGIN
	INSERT INTO articulo_equivalente
	VALUES (@idArticulo, @codigoBarras, @cantidadVenta, GETDATE(), 1)
	
	DECLARE @idArtEq decimal;
	SET @idArtEq = @@IDENTITY;
	SELECT CAST(@idArtEq AS int) AS 'id_articulo_equivalente'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGuardaArticulo]
	@clave as nvarchar(10),
           @codigo_barras1 as nvarchar(36),
           @clave_sat as nvarchar(8),
           @id_agrupador_articulo as int,
           @id_linea_negocio as int,
           @id_subcategoria as int,
           @id_marca as int,
           @id_submarca as int,
           @desc_super as nvarchar(100),
           @desc_mayoreo as nvarchar(100),
           @tipo as nvarchar(15),
           @id_unidad_compra as int,
           @id_unidad_venta as int,
           @relacion_compra as decimal(12,4),
           @relacion_venta as decimal(12,4),
           @es_inventariable as tinyint,
           @id_iva_compra as int,
           @id_iva_venta as int,
           @id_ieps_compra as int,
           @id_ieps_venta as int,
           @codigo_barras2 as nvarchar(36),
		   @costo_ultimo as Decimal(18,4),
		   @id_familia as int
AS
BEGIN
IF @id_agrupador_articulo!=0
BEGIN
	INSERT INTO [dbo].[articulo]
           ([clave]
           ,[codigo_barras1]
           ,[clave_sat]
           ,[id_agrupador_articulo]
           ,[id_linea_negocio]
           ,[id_subcategoria]
           ,[id_marca]
           ,[id_submarca]
           ,[desc_super]
           ,[desc_mayoreo]
           ,[tipo]
           ,[id_unidad_compra]
           ,[id_unidad_venta]
           ,[relacion_compra]
           ,[relacion_venta]
           ,[es_inventariable]
           ,[id_iva_compra]
           ,[id_iva_venta]
           ,[id_ieps_compra]
           ,[id_ieps_venta]
           ,[fecha_alta]
		   ,[fecha_ultima_modificacion]
           ,[activo]
           ,[codigo_barras2]
		   ,[costo_ultimo]
           ,[costo_promedio]
		   ,[id_articulo_adicionales],
		   [id_familia])

     VALUES
           (@clave,
           @codigo_barras1,
           @clave_sat, 
           @id_agrupador_articulo, 
           @id_linea_negocio, 
           @id_subcategoria, 
           @id_marca, 
           @id_submarca, 
           @desc_super, 
           @desc_mayoreo, 
           @tipo, 
           @id_unidad_compra, 
           @id_unidad_venta, 
           @relacion_compra, 
           @relacion_venta, 
           @es_inventariable, 
           @id_iva_compra, 
           @id_iva_venta, 
           @id_ieps_compra, 
           @id_ieps_venta,
           GETDATE(), 
		   GETDATE(),
           1, 
           @codigo_barras2,
		   @costo_ultimo,
		   0,
		   1,
		   @id_familia)
END 
ELSE 
BEGIN
INSERT INTO [dbo].[articulo]
           ([clave]
           ,[codigo_barras1]
           ,[clave_sat]
           ,[id_agrupador_articulo]
           ,[id_linea_negocio]
           ,[id_subcategoria]
           ,[id_marca]
           ,[id_submarca]
           ,[desc_super]
           ,[desc_mayoreo]
           ,[tipo]
           ,[id_unidad_compra]
           ,[id_unidad_venta]
           ,[relacion_compra]
           ,[relacion_venta]
           ,[es_inventariable]
           ,[id_iva_compra]
           ,[id_iva_venta]
           ,[id_ieps_compra]
           ,[id_ieps_venta]
           ,[fecha_alta]
		   ,[fecha_ultima_modificacion]
           ,[activo]
           ,[codigo_barras2]
		   ,[costo_ultimo]
           ,[costo_promedio]
		   ,[id_articulo_adicionales],
		   [id_familia])

     VALUES
           (@clave,
           @codigo_barras1,
           @clave_sat, 
           NULL, 
           @id_linea_negocio, 
           @id_subcategoria, 
           @id_marca, 
           @id_submarca, 
           @desc_super, 
           @desc_mayoreo, 
           @tipo, 
           @id_unidad_compra, 
           @id_unidad_venta, 
           @relacion_compra, 
           @relacion_venta, 
           @es_inventariable, 
           @id_iva_compra, 
           @id_iva_venta, 
           @id_ieps_compra, 
           @id_ieps_venta,
           GETDATE(), 
		   GETDATE(),
           1, 
           @codigo_barras2,
		   @costo_ultimo,
		   0,
		   1,
		   @id_familia)
END	
	SELECT * FROM articulo WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaArticuloAdicionales]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola Martin
-- Create date: 05 junio 2018
-- Description:	Insertar articulo_adicionales
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-09-08
-- Description:	Cambios por agregar columna es_recarga
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaArticuloAdicionales]
	@idArticulo as int,
	@vendeSinExistencia as tinyint
    ,@cmSuperAncho as int
    ,@cmSuperAlto as int
    ,@cmSuperLargo as int
    ,@cmSuperPeso as int
    ,@cmMayoreoAncho as int
    ,@cmMayoreoAlto as int
    ,@cmMayoreoLargo as int
    ,@cmMayoreoPeso as int
    ,@pideReceta as tinyint
    ,@sobrePedido as tinyint
    ,@descontinuado as tinyint
    ,@margenPrecioSugerido as decimal(5,2)
    ,@utilidadMinima as decimal(5,2)
	,@esRecarga as bit
AS
BEGIN
Declare @id decimal;
	INSERT INTO [dbo].[articulo_adicionales]
           ([vende_sin_existencia]
           ,[cm_super_ancho]
           ,[cm_super_alto]
           ,[cm_super_largo]
           ,[cm_super_peso]
           ,[cm_mayoreo_ancho]
           ,[cm_mayoreo_alto]
           ,[cm_mayoreo_largo]
           ,[cm_mayoreo_peso]
           ,[pide_receta]
           ,[sobre_pedido]
           ,[descontinuado]
           ,[margen_precio_sugerido]
           ,[utilidad_minima]
		   ,[es_recarga])
     VALUES
           (@vendeSinExistencia
           ,@cmSuperAncho
           ,@cmSuperAlto
           ,@cmSuperLargo
           ,@cmSuperPeso
           ,@cmMayoreoAncho
           ,@cmMayoreoAlto
           ,@cmMayoreoLargo
           ,@cmMayoreoPeso
           ,@pideReceta
           ,@sobrePedido
           ,@descontinuado
           ,@margenPrecioSugerido
           ,@utilidadMinima
		   ,@esRecarga)
	set @id = @@IDENTITY;	

	update articulo set id_articulo_adicionales = Cast(@id as int) where id_articulo = @idArticulo
	SELECT	Cast(@id as int) AS 'id_articulo_adicionales'
	
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaArticuloCompra]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 20.Septiembre.2018
-- Description:	SP
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-05-18
-- Description:	se guarda es_mayoreo en tipo 6
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaArticuloCompra]
	@idPromo	 as int, 
	@referencia	 as int,
	@clave		 as nvarchar(100),
	@nombre		 as nvarchar(100),
	@cantidad	 as decimal(18,4),
	@unidad		 as int

AS
BEGIN
DECLARE @es_mayoreo AS BIT
SELECT @es_mayoreo = (CASE WHEN id_unidad_compra = @unidad THEN 1 ELSE 0 END) FROM articulo WHERE clave = @clave
DECLARE @id As int;
	IF NOT EXISTS (select * from promocion_compra where id_promocion = @idPromo and @clave= clave)
	BEGIN
		IF(@referencia != 1 and @referencia != 6 )
		BEGIN
			IF (@unidad = 1)
			BEGIN
				INSERT INTO promocion_compra VALUES(@idPromo,
													@referencia,
													@clave,
													@nombre,
													@cantidad,
													null,
													1)
			END
			ELSE
			BEGIN
				INSERT INTO promocion_compra VALUES(@idPromo,
													@referencia,
													@clave,
													@nombre,
													@cantidad,
													null,
													0)
			END
			set @id = @@IDENTITY;
		END
		ELSE
		BEGIN
			IF (@referencia = 6)
			BEGIN
				IF (@unidad = 0)
				BEGIN
					INSERT INTO promocion_compra VALUES(@idPromo,
														@referencia,
														@clave,
														@nombre,
														null,
														null,
														null)
				END
				ELSE
				BEGIN
					INSERT INTO promocion_compra VALUES(@idPromo,
														@referencia,
														@clave,
														@nombre,
														null,
														@unidad,
														@es_mayoreo)
				END
			END
			ELSE
			BEGIN
				IF (@unidad = 0)
				BEGIN
					INSERT INTO promocion_compra VALUES(@idPromo,
														@referencia,
														@clave,
														@nombre,
														@cantidad,
														null,
														null)
				END
				ELSE
				BEGIN
					INSERT INTO promocion_compra VALUES(@idPromo,
														@referencia,
														@clave,
														@nombre,
														@cantidad,
														@unidad,
														null)
				END
			END
			set @id = @@IDENTITY;
		END
	END 
	ELSE 
	BEGIN
		IF(@referencia != 1 and @referencia != 6)
		BEGIN
			IF (@unidad = 2)
				BEGIN
					UPDATE promocion_compra SET cantidad = @cantidad
					WHERE id_promocion = @idPromo and clave = @clave
				END
				ELSE
				BEGIN
					UPDATE promocion_compra SET cantidad = @cantidad, es_mayoreo = @unidad
					WHERE id_promocion = @idPromo and clave = @clave
				END
				set @id = @idPromo
		END
		ELSE
		BEGIN
			IF (@referencia = 6)
			begin
				IF (@unidad != 0)
					BEGIN
						UPDATE promocion_compra SET id_unidad_medida = @unidad
						WHERE id_promocion = @idPromo and clave = @clave
					END
					set @id = @idPromo
			END
			ELSE
			BEGIN
			IF (@unidad = 0)
					BEGIN
						UPDATE promocion_compra SET cantidad = @cantidad
						WHERE id_promocion = @idPromo and clave = @clave
					END
					ELSE
					BEGIN
						UPDATE promocion_compra SET cantidad = @cantidad, id_unidad_medida = @unidad
						WHERE id_promocion = @idPromo and clave = @clave
					END
					set @id = @idPromo
				END
			END
	END
	SELECT	Cast(@id as int) AS 'idPromocionCompra';
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaArticuloExistencias]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carolina Franco
-- Create date: 2019-06-27
-- Description:	Se corrige existencia inicial
-- =============================================
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 18 de Agosto de 2018
-- Description:	Guardar Articulo existencias
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaArticuloExistencias]
	@idArticulo as int,
    @idAlmacen as int,
    @existenciaIni as decimal(18,4),
    @stockMinimo as decimal(18,4),
    @stockMaximo as decimal(18,4),
    @ubicacion as nvarchar(10)
AS
BEGIN
	INSERT INTO [dbo].[articulo_existencia]
           ([id_articulo]
           ,[id_almacen]
           ,[ubicacion]
           ,[stock_minimo]
           ,[stock_maximo]
           ,[existencia_inicial]	
           ,[total_entradas]
           ,[total_salidas]
           ,[existencia_actual]
           ,[existencia_apartado]
           ,[existencia_venta])
     VALUES
           (@idArticulo
           ,@idAlmacen
           ,@ubicacion
           ,@stockMinimo
           ,@stockMaximo
           ,@existenciaIni
		   ,0
		   ,0
		   ,0
		   ,0
		   ,0)
    -- Insert statements for procedure here
	SELECT * FROM articulo_existencia WHERE id_articulo = @idArticulo and id_almacen = @idAlmacen
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaArticuloPrecio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-30
-- Description:	Se reciben 6 decimales para precio
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaArticuloPrecio]
	@idArticulo as int,
	@noOrden as int,
	@margen as decimal(18,2),
	@precio as decimal(18,6),
	@cantidad as decimal(18,4),
	@utilidad as decimal(18,6)
AS
BEGIN
	INSERT INTO [dbo].[articulo_precio]
           ([id_articulo]
           ,[no_orden]
           ,[margen_utilidad]
           ,[precio_venta]
           ,[cantidad]
           ,[utilidad]
           ,[fecha_modificacion]
           ,[fecha_alta])
     VALUES
           (@idArticulo
           ,@noOrden
           ,@margen
           ,@precio
           ,@cantidad
           ,@utilidad
           ,GETDATE()
           ,GETDATE())
	SELECT * FROM articulo_precio WHERE id_articulo = @idArticulo and no_orden = @noOrden
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaArticuloProveedor]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-29
-- Description:	Agregar clave proveedor en la respuesta
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-04-03
-- Description:	Agregar costo a 6 decimales
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaArticuloProveedor]
	@idArticulo as int,
	@idProveedor as int,
	@prioridad as int,
	@costo as decimal(18,6)
AS
BEGIN
	INSERT INTO [dbo].[articulo_proveedor]
           ([id_articulo]
           ,[id_proveedor]
           ,[prioridad]
           ,[costo]
           ,[fecha_alta])
     VALUES
           (@idArticulo
           ,@idProveedor
           ,@prioridad
           ,@costo
           ,GETDATE())
	SELECT 
		ap.*,
		p.clave 
	FROM 
		articulo_proveedor ap 
		LEFT JOIN  proveedor p ON ap.id_proveedor = p.id_proveedor
	WHERE 
		id_articulo = @idArticulo and ap.id_proveedor = @idProveedor
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaArticuloRegalo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 29.Junio.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaArticuloRegalo]
	@idPromo	 as int,
	@clave		 as nvarchar(100),
	@nombre		 as nvarchar(100),
	@cantidad	 as decimal(18,4),
	@unidad		 as int

AS
BEGIN
DECLARE @id As int;
DECLARE @idArticulo as int; 

SELECT @idArticulo = id_articulo from articulo where clave = @clave;

	IF NOT EXISTS (select * from promocion_regalo where id_promocion = @idPromo and id_articulo = @idArticulo)
	BEGIN
		INSERT INTO promocion_regalo VALUES(@idPromo,
											@idArticulo,
											@cantidad,
											@unidad)
		
		set @id = @@IDENTITY;
	END
	ELSE 
	BEGIN
		UPDATE promocion_regalo SET cantidad = @cantidad, id_unidad_medida = @unidad 
		WHERE id_promocion= @idPromo and id_articulo = @idArticulo
		
		set @id = @idPromo;
	END
	
	SELECT	Cast(@id as int) AS 'idPromocionRegalo';
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaArticuloSucursalMayoreo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola Martin
-- Create date: 05 junio 2018
-- Description:	Inserta articulo_sucursal_mayoreo
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaArticuloSucursalMayoreo]
	@idArticulo as int,
	@idSucursal as int
AS
BEGIN
Declare @id decimal;
	INSERT INTO [dbo].[articulo_sucursal_mayoreo]
           ([id_articulo]
           ,[id_sucursal])
     VALUES
           (@idArticulo
           ,@idSucursal)
		   set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'id_articulo_sucursal_mayoreo'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaBitacoraImpresion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-07-23
-- Description:	Guardar Bitacora de Impresion
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaBitacoraImpresion]
			@id_usuario as int
           ,@id_modulo as int
           ,@referencia as nvarchar(20)
AS
BEGIN
	Declare @id decimal;
	INSERT INTO [dbo].[bitacora_impresion]
           ([id_usuario]
           ,[id_modulo]
           ,[referencia]
           ,[contador]
           ,[fecha])
     VALUES
           (@id_usuario
           ,@id_modulo
           ,@referencia
           ,1
           ,GETDATE())
	set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'id_bitacora_impresion'

END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Saúl Cruces
-- Create date:		17.mayo.2018
-- Description:		Guarda caja y consulta el ID
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaCaja]
    @idTipoCaja as int,
    @idSuc as int,
    @idAlmacen as int,
    @noCaja as int,
    @nombre as nvarchar(30),
    @enUsoPV as tinyint
AS
BEGIN
    INSERT INTO caja VALUES (@idSuc, @idAlmacen, @noCaja, @nombre, 0, @enUsoPV,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, GETDATE(), null, 1, @idTipoCaja,0)
    
    SELECT * FROM caja WHERE no_caja = @noCaja
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaCategoria]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 11.mayo.2018
-- Description:	Guarda categoría y consulta el ID
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaCategoria]
	@clave as nvarchar(100),
	@descripcion as nvarchar(100)
AS
BEGIN
	INSERT INTO categoria VALUES (@clave, @descripcion, GETDATE(), 1)
	
	SELECT * FROM categoria WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaCliente]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 24.mayo.2018
-- Description:	Guarda cliente y consulta el ID
-- =============================================
Create PROCEDURE [dbo].[spGuardaCliente]
	@nombre as nvarchar(200),
	@observaciones as nvarchar(510),
	@idFormaPago as int,
	@tel1 as nvarchar(40),
	@idDatosFacturacion as int,
	@activo as int 
AS
BEGIN
Declare @id decimal;
	INSERT INTO cliente (nombre, observaciones, id_forma_pago, telefono1, fecha_alta, id_datos_facturacion, activo) VALUES (@nombre, @observaciones, @idFormaPago, @tel1, GETDATE(), @idDatosFacturacion, @activo);
	
	set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'id_cliente';
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaConfiguracionPromocion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 10.Septiembre.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaConfiguracionPromocion]
	@idSuc					as int,
	@clave					as nvarchar(100),
	@nombre					as nvarchar(100),
	@idPromocionTipo		as int,
	@idPromocionCondicion	as int,
	@idPromocionAplicacion	as int,
	@vigenciaInicio			as Datetime,
	@vigenciaFin			as Datetime,
	@promosXVenta			as int,
	@visiblePV				as int, 
	@acumulable				as int,
	@limiteSucursal			as int,
	@activo					as int, 
	@img					as image = null,
	@nombreImg				as nvarchar(100) =null,
	@idProveedor			as int,
	@cantidad				as decimal(18,4) = null
AS
BEGIN
	if NOT Exists(Select * from promocion where clave=@clave)
		BEGIN
		DECLARE @id as int;
		if(@idPromocionTipo = 6)
		BEGIN
			INSERT INTO promocion			 VALUES(@idSuc,
												@clave,
												@nombre,
												@idPromocionTipo,
												@idPromocionCondicion,
												@idPromocionAplicacion,
												@vigenciaInicio,
												@vigenciaFin,
												@promosXVenta,
												@visiblePV,
												@acumulable,
												@limiteSucursal,
												GETDATE(),
												GETDATE(),
												@activo,
												@idProveedor,
												@cantidad)
		END
		ELSE
		BEGIN
			INSERT INTO promocion			 VALUES(@idSuc,
												@clave,
												@nombre,
												@idPromocionTipo,
												@idPromocionCondicion,
												@idPromocionAplicacion,
												@vigenciaInicio,
												@vigenciaFin,
												@promosXVenta,
												@visiblePV,
												@acumulable,
												@limiteSucursal,
												GETDATE(),
												GETDATE(),
												@activo,
												@idProveedor,
												null)
		END
		set @id = @@IDENTITY;
		if(@visiblePV=1)
		BEGIN
		Insert Into promocion_imagen VALUES(@id,
											@img,
											@nombreImg)
		END
	END
	ELSE
	BEGIN
		set @id =-1;
	END
	SELECT	Cast(@id as int) AS 'idPromocion';
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaConteoAuditoria]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez - Alter Israel Flores C.
-- Create date: 2019-01-28
-- Description:	Guardar el conteo de auditoria y cambia de estatus la misma
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-02-09
-- Description:	Suma cantidades de articulos duplicados
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaConteoAuditoria]
	@claveSincronizacion as nvarchar(100),
	@idAuditoria as int,
	@idUsuario as int,
	@conteo ConteoAuditoria READONLY
AS
BEGIN
	DECLARE @claveArticulo					AS	NVARCHAR(50)
	DECLARE @idArticulo						AS	INT
	DECLARE @descripcion					AS	NVARCHAR(100)
	DECLARE @conteoExistenciaActual			AS	DECIMAL(18,2)
	DECLARE @conteoExistenciaApartado		AS	DECIMAL(18,2)
	DECLARE @conteoExistenciaVenta			AS	DECIMAL(18,2)
	DECLARE @conteoAuditoria				AS	DECIMAL(18,2)
	DECLARE @almacen						AS	INT
	DECLARE @idAuditoriaDetalle				AS	INT
	DECLARE @articulosAgregados				AS	INT
	DECLARE @cantidadYaGuardada				AS	DECIMAL(18,2)
	DECLARE @diferencia						AS	DECIMAL(18,2)

	SET @articulosAgregados = 0


	--SELECT @idAlmacen = id_almacen FROM auditoria WHERE id_auditoria = @idAuditoria
	UPDATE auditoria SET clave_sincronizacion = @claveSincronizacion where id_auditoria = @idAuditoria

	DECLARE cursorConteo CURSOR FOR
		SELECT * FROM @conteo
		
	OPEN cursorConteo
	FETCH NEXT FROM cursorConteo
	INTO @claveArticulo, @conteoAuditoria, @almacen
	WHILE @@FETCH_STATUS = 0
	BEGIN
		
		IF(@conteoAuditoria >= 0)
		BEGIN
			SET @idArticulo = null
			SELECT 
				@idArticulo = a.id_articulo
			FROM 
				articulo a
				LEFT JOIN articulo_equivalente ae ON a.id_articulo = ae.id_articulo
			WHERE 
				a.clave = @claveArticulo OR a.codigo_barras1 = @claveArticulo OR a.codigo_barras2 = @claveArticulo OR ae.codigo_barras = @claveArticulo

			IF(@idArticulo IS NOT NULL)
			BEGIN

				SET @idAuditoriaDetalle =NULL
				SELECT @idAuditoriaDetalle = id_auditoria_detalle FROM auditoria_detalle WHERE id_auditoria = @idAuditoria AND id_articulo = @idArticulo AND id_almacen = @almacen

				IF(@idAuditoriaDetalle IS NOT NULL)
				BEGIN
					SELECT @conteoExistenciaActual = NULL, @conteoExistenciaApartado = NULL, @conteoExistenciaVenta = NULL
					SELECT @conteoExistenciaActual = ISNULL([existencia_actual], 0)
						  ,@conteoExistenciaApartado = ISNULL([existencia_apartado], 0)
						  ,@conteoExistenciaVenta = ISNULL([existencia_venta], 0)
					  FROM [dbo].[articulo_existencia]
					  WHERE [id_articulo] = @idArticulo AND [id_almacen] = @almacen

					IF(@conteoExistenciaActual IS NULL)
					BEGIN
						SELECT @conteoExistenciaActual = 0
					END
					IF(@conteoExistenciaApartado IS NULL)
					BEGIN
						SELECT @conteoExistenciaApartado = 0
					END
					IF(@conteoExistenciaVenta IS NULL)
					BEGIN
						SELECT @conteoExistenciaVenta = 0
					END

					--SELECT @cantidadYaGuardada = ex_auditoria FROM auditoria_detalle WHERE id_auditoria_detalle = @idAuditoriaDetalle AND id_almacen = @almacen
				
					--IF @cantidadYaGuardada IS NOT NULL
					--BEGIN
					--	SET @conteoAuditoria = @conteoAuditoria + @cantidadYaGuardada
					--END
					
					if @almacen = 2
						BEGIN
							SET @conteoAuditoria = @conteoAuditoria * (SELECT relacion_venta FROM articulo WHERE id_articulo = @idArticulo)
							SET @diferencia = @conteoAuditoria  - (@conteoExistenciaActual + @conteoExistenciaApartado + @conteoExistenciaVenta)
						END
					ELSE
						BEGIN
							SET @conteoAuditoria = @conteoAuditoria
							SET @diferencia = @conteoAuditoria - (@conteoExistenciaActual + @conteoExistenciaApartado + @conteoExistenciaVenta)
						END

					UPDATE 
						auditoria_detalle
					SET
						ex_actual_conteo = @conteoExistenciaActual,
						ex_apartado_conteo = @conteoExistenciaApartado,
						ex_venta_conteo = @conteoExistenciaVenta,
						ex_total_conteo = @conteoExistenciaActual + @conteoExistenciaApartado + @conteoExistenciaVenta,
						ex_auditoria = @conteoAuditoria,
						--diferencia = ex_total_inicio - (@conteoExistenciaActual + @conteoExistenciaApartado + @conteoExistenciaVenta)
						--diferencia = @conteoAuditoria - (@conteoExistenciaActual + @conteoExistenciaApartado + @conteoExistenciaVenta)
						diferencia = @diferencia
					WHERE
						id_auditoria_detalle = @idAuditoriaDetalle AND id_almacen = @almacen

					SET @articulosAgregados = @articulosAgregados + 1
				END
			END
		END
		FETCH NEXT FROM cursorConteo
		INTO @claveArticulo, @conteoAuditoria, @almacen
	END

	IF(@articulosAgregados > 0)
	BEGIN
		UPDATE
			auditoria
		SET
			id_auditoria_estatus = 2,
			id_conto = @idUsuario,
			fecha_conteo = GETDATE()
		WHERe
			id_auditoria = @idAuditoria
	END
	ELSE
	BEGIN
		BEGIN TRY
			THROW 666, 'Ningun elemento del archivo pudo registrarse correctamente', 1
		END TRY
		BEGIN CATCH
			THROW
		END CATCH
	END


END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaDenominacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 10.mayo.2018
-- Description:	Guarda denominacion y consulta el ID
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaDenominacion]
	@descripcion as nvarchar(100),
	@monto as int
AS
BEGIN
	INSERT INTO denominacion VALUES (@descripcion, @monto, GETDATE(), 1)
	
	SELECT * FROM denominacion WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaFacturacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carolina Franco
-- Create date: 2018
-- Description:	Guardar Facturacion
-- =============================================
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-12-03
-- Description:	Guardar Facturacion
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaFacturacion]
	@subtotal as decimal(18,4)
           ,@iva as decimal(18,4)
           ,@ieps as decimal(18,4)
           ,@descuento as decimal(18,4)
           ,@total as decimal(18,4)
           ,@id_cliente as int
		   ,@id_usuario as int
		   ,@id_uso_cfdi as int
AS
BEGIN
	Declare @id decimal;

	INSERT INTO [dbo].[facturacion]
           ([subtotal]
           ,[iva]
           ,[ieps]
           ,[descuento]
           ,[total]
           ,[id_cliente]
		   ,[id_usuario]
		   ,[id_uso_cfdi]
		   ,[fecha_generado])
     VALUES
           (@subtotal
           ,@iva
           ,@ieps
           ,@descuento
           ,@total
           ,@id_cliente
		   ,@id_usuario
		   ,@id_uso_cfdi
		   ,GETDATE())
	set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'id_facturacion'

END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaFormaDePago]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 07.junoi.2018
-- Description:	Cambio tipo dato cargo
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-11-30
-- Description:	Se agregó abre_cajon
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaFormaDePago]
	@descripcion as nvarchar(100),
	@referencia as tinyint,
	@daCambio as tinyint,
	@daCambioCualquierFp as tinyint,
	@repetirForma as tinyint,
	@usadaEnPuntoVenta as tinyint,
	@pideBanco as tinyint,
	@esTarjeta as tinyint,
	@esCredito as tinyint,
	@enlaceBanco as tinyint,
	@porcentajeCargo as decimal(4,2),
	@claveSAT as nvarchar(100),
	@abreCajon as bit
AS
BEGIN
	INSERT INTO forma_pago VALUES (@descripcion,
									@referencia,
									@daCambio,
									@daCambioCualquierFp,
									@repetirForma,
									@usadaEnPuntoVenta,
									@pideBanco,
									@esTarjeta,
									@esCredito,
									@enlaceBanco,
									@porcentajeCargo,
									@claveSAT,
									GETDATE(),
									1,
									@abreCajon)
	
	SELECT * FROM forma_pago WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaOferta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 07/06/2018
-- Description:	Guarda Oferta
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-29
-- Description:	Guarda precio con 4 decimales
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-29
-- Description:	Guarda precio con 6 decimales
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaOferta]
	@IdArticulo as int,
	@tipo as int,
	@noOrden as decimal(18,2),
	@MargenUtilidad as decimal(18,2),
	@PrecioVenta as decimal(18,6),
	@CantidadMin as decimal(18,4),
	@CantidadMax as decimal(18,4),
	@Utilidad as decimal(18,6),
	@FechaInicio as DateTime,
	@FechaTermino as DateTime
AS
BEGIN
	INSERT INTO articulo_oferta
           (id_articulo,
		   no_orden,
		   margen_utilidad,
		   precio_venta,
		   cantidad_min,
		   cantidad_max,
		   utilidad,
		   fecha_inicio,
		   fecha_termino,
		   fecha_alta,
		   activo, 
		   id_oferta_tipo)
     VALUES
			(@IdArticulo,
			@noOrden,
			@MargenUtilidad,
			@PrecioVenta,
			@CantidadMin,
			@CantidadMax,
			@Utilidad,
			@FechaInicio,
			@FechaTermino,
			GETDATE(),
			1, 
			@tipo)

	SELECT id_articulo_oferta FROM articulo_oferta WHERE id_articulo = @idArticulo 
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaOfertaVolanteBanda]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===========================================
-- Author:		Carlos Negrete
-- Create date: 07/06/2018
-- Description:	Guarda Oferta
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaOfertaVolanteBanda]
	@idArticulo as int,
	@noOrden as int,
	@tipo as int,
	@margen as decimal(18,2),
	@precio as decimal(18,2),
	@cantidadMin as decimal(18,4),
	@cantidadMax as decimal(18,4),
	@utilidad as decimal(18,2),
	@FechaInicio as DateTime,
	@FechaTermino as DateTime
AS
BEGIN
	if Exists(select id_articulo from articulo_oferta where id_articulo = @idArticulo and no_orden = @noOrden and @tipo = id_oferta_tipo)
	BEGIN
		UPDATE articulo_oferta
		SET
			   id_articulo = @IdArticulo,
			   no_orden = @noOrden,
			   margen_utilidad = @margen,
			   precio_venta = @precio,
			   cantidad_min = @CantidadMin,
			   cantidad_max = @CantidadMax,
			   utilidad= @Utilidad,
			   fecha_inicio = @FechaInicio,
			   fecha_termino = @FechaTermino,
			   fecha_alta = GETDATE(),
			   activo =1,
			   id_oferta_tipo = @tipo
		WHERE
				id_articulo = @idArticulo
				and no_orden = @noOrden
				and id_oferta_tipo = @tipo
	END
	ELSE
	BEGIN
		INSERT INTO articulo_oferta
			   (id_articulo,
			   no_orden,
			   margen_utilidad,
			   precio_venta,
			   cantidad_min,
			   cantidad_max,
			   utilidad,
			   fecha_inicio,
			   fecha_termino,
			   fecha_alta,
			   activo,
			   id_oferta_tipo)
		 VALUES
				(@IdArticulo,
				@noOrden,
				@margen,
				@precio,
				@CantidadMin,
				@CantidadMax,
				@Utilidad,
				@FechaInicio,
				@FechaTermino,
				GETDATE(),
				1,
				@tipo)
	END
	SELECT id_articulo_oferta FROM articulo_oferta WHERE id_articulo = @idArticulo 
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaOrdenCompra]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-10-17
-- Description:	modificacion del parametro folio
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaOrdenCompra]
	@id_sucursal as int
           ,@folio as nvarchar(12)
           ,@observaciones as nvarchar(100)
           ,@subtotal as decimal(18,2)
           ,@descuento as decimal(18,2)
           ,@total_neto as decimal(18,2)
           ,@id_proveedor as int
           ,@fecha_fin_vigencia as datetime
AS
BEGIN
	Declare @id decimal;
	INSERT INTO [dbo].[orden_compra]
           ([id_sucursal]
           ,[folio]
           ,[observaciones]
           ,[subtotal]
           ,[descuento]
           ,[total_neto]
           ,[fecha_registro]
           ,[id_proveedor]
           ,[fecha_fin_vigencia]
		   ,id_promovimiento_almacen_estado)
     VALUES
           (@id_sucursal
           ,@folio
           ,@observaciones
           ,@subtotal
           ,@descuento
           ,@total_neto
           ,getDate()
           ,@id_proveedor
           ,@fecha_fin_vigencia
           ,1)
	set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'id_orden_compra'

END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaOrdenCompraDetalle]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 28 junio 2018
-- Description:	Guardar orden compra detalle
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaOrdenCompraDetalle]
	@id_orden_compra as int
           ,@id_articulo as int
           ,@consecutivo as int
           ,@cantidad as decimal(18,2)
           ,@costo_unitario as decimal(18,2)
           ,@id_unidad_medida as int
           ,@descuento as decimal(18,2)
           ,@importe as decimal(18,2)
AS
BEGIN
	Declare @id decimal;
	Declare @id_unidad_medida_venta int;
	Declare @id_unidad_medida_compra int;
	Declare @relacion_venta decimal(12,4);
	Declare @es_mayoreo bit;

	SELECT @id_unidad_medida_venta = id_unidad_venta, @id_unidad_medida_compra = id_unidad_compra, @relacion_venta = relacion_venta FROM articulo WHERE id_articulo = @id_articulo

	IF @id_unidad_medida = @id_unidad_medida_compra
	BEGIN
		SET @cantidad = @cantidad * @relacion_venta
		SET @es_mayoreo = 1
		SET @id_unidad_medida = @id_unidad_medida_venta
		SET @costo_unitario = @costo_unitario / @relacion_venta
	END
	ELSE
		SET @es_mayoreo = 0

	INSERT INTO [dbo].[orden_compra_detalle]
           ([id_orden_compra]
           ,[id_articulo]
           ,[consecutivo]
           ,[cantidad]
           ,[costo_unitario]
           ,[id_unidad_medida]
           ,[descuento]
           ,[importe]
		   ,[ingresado]
		   ,[es_mayoreo])
     VALUES
           (@id_orden_compra
           ,@id_articulo
           ,@consecutivo
           ,@cantidad
           ,@costo_unitario
           ,@id_unidad_medida_venta
           ,@descuento
           ,@importe
           ,0
		   ,@es_mayoreo)
	set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'id_orden_compra_detalle'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaPrecioAgrupador]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 05.junio.2018
-- Description:	Quitar campo y clave
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaPrecioAgrupador]
	@idAgrupadorArticulo as int,
	@nivelPrecio as int,
	@cantidad as int
AS
BEGIN
	INSERT INTO precio_agrupador VALUES (@nivelPrecio, @cantidad, GETDATE(), 1, @idAgrupadorArticulo)
	
	SELECT * FROM precio_agrupador WHERE id_agrupador_articulo = @idAgrupadorArticulo
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaPretransferencia]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-10-17
-- Description:	Modificacion parametro folio
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaPretransferencia]
	@id_sucursal as int
           ,@folio as nvarchar(12)
           ,@observaciones as nvarchar(100)
           ,@subtotal as decimal(18,2)
           ,@descuento as decimal(18,2)
           ,@total_neto as decimal(18,2)
           ,@id_sucursal_origen as int
           ,@fecha_fin_vigencia as datetime
AS
BEGIN
	
	Declare @id decimal;
	INSERT INTO [dbo].[pretransferencia]
           ([id_sucursal]
           ,[folio]
           ,[observaciones]
           ,[subtotal]
           ,[descuento]
           ,[total_neto]
           ,[fecha_registro]
           ,[id_sucursal_origen]
           ,[fecha_fin_vigencia]
		   ,id_promovimiento_almacen_estado)
     VALUES
           (@id_sucursal
           ,@folio
           ,@observaciones
           ,@subtotal
           ,@descuento
           ,@total_neto
           ,getdate()
           ,@id_sucursal_origen
           ,@fecha_fin_vigencia
           ,1)
	set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'id_pretransferencia'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaPretransferenciaDetalle]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 28 junio 2018
-- Description:	Guardar Pretransferencia Detalle
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaPretransferenciaDetalle]
	@id_pretransferencia as int
           ,@id_articulo as int
           ,@consecutivo as int
           ,@cantidad as decimal(18,2)
           ,@costo_unitario as decimal(18,2)
           ,@id_unidad_medida as int
           ,@descuento as decimal(18,2)
           ,@importe as decimal(18,2)
AS
BEGIN
	Declare @id decimal;
	Declare @id_unidad_medida_venta int;
	Declare @id_unidad_medida_compra int;
	Declare @relacion_venta decimal(12,4);
	Declare @es_mayoreo bit;

	SELECT @id_unidad_medida_venta = id_unidad_venta, @id_unidad_medida_compra = id_unidad_compra, @relacion_venta = relacion_venta FROM articulo WHERE id_articulo = @id_articulo

	IF @id_unidad_medida = @id_unidad_medida_compra
	BEGIN
		SET @cantidad = @cantidad * @relacion_venta
		SET @es_mayoreo = 1
		SET @id_unidad_medida = @id_unidad_medida_venta
		SET @costo_unitario = @costo_unitario / @relacion_venta
	END
	ELSE
		SET @es_mayoreo = 0

	INSERT INTO [dbo].[pretransferencia_detalle]
           ([id_pretransferencia]
           ,[id_articulo]
           ,[consecutivo]
           ,[cantidad]
           ,[costo_unitario]
           ,[id_unidad_medida]
           ,[descuento]
           ,[importe]
		   ,[es_mayoreo])
     VALUES
           (@id_pretransferencia
           ,@id_articulo
           ,@consecutivo
           ,@cantidad
           ,@costo_unitario
           ,@id_unidad_medida
           ,@descuento
           ,@importe
		   ,@es_mayoreo)
	set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'id_pretransferencia_detalle'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarAuditoriaAplicada]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces - Alter Israel Flores C.
-- Create date: 12.enero.2018
-- Description:	Actualizar auditoría aplicada
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarAuditoriaAplicada]
	@idAuditoria AS int

AS
BEGIN
	UPDATE [dbo].[auditoria]
	   SET [id_auditoria_estatus] = 3
	 WHERE [id_auditoria] = @idAuditoria
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarAuditoriaInicio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Sa�l Cruces - Alter Israel Flores C.
-- Create date: 08.enero.2019
-- Description:	Guardar inicio auditor�a
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarAuditoriaInicio]
	--@almacenes AS ListaIDs READONLY,
	@nombre AS nvarchar(50),
	@idAuditoriaTipo AS int,
	@idAutorizoInicio AS int,
	@ListaArticuloAuditar AS ListaArticuloAuditar READONLY
AS
BEGIN
	DECLARE @idAuditoria AS int
	DECLARE @idArticulo AS int
	DECLARE @idAlmacen AS int
	DECLARE @existenciaActual AS decimal(18,4)
	DECLARE @existenciaApartado AS decimal(18,4)
	DECLARE @existenciaVenta AS decimal(18,4)
	DECLARE @tablaExistencias Table (almacen int, articulo int, existencia decimal(18,4))

	INSERT INTO [dbo].[auditoria]
			   ([id_almacen]
			   ,[nombre]
			   ,[id_auditoria_tipo]
			   ,[id_inicio]
			   ,[fecha_inicio]
			   ,[id_auditoria_estatus])
		 VALUES
			   (1
			   ,@nombre
			   ,@idAuditoriaTipo
			   ,@idAutorizoInicio
			   ,GETDATE()
			   ,1)

	SET @idAuditoria = SCOPE_IDENTITY()

	--DECLARE almacenIDs CURSOR
	--	FOR SELECT Id
	--	FROM @almacenes
	
	--OPEN almacenIDs

	--FETCH NEXT FROM almacenIDs
	--INTO @idAlmacen

	--WHILE @@FETCH_STATUS = 0
	--BEGIN

		--INSERT INTO [dbo].[almacen_auditoria]
  --         ([id_auditoria]
  --         ,[id_almacen])
		--VALUES
  --         (@idAuditoria
  --         ,@idAlmacen)


		DECLARE cIDs CURSOR
		FOR SELECT id, almacen
		FROM @ListaArticuloAuditar
	
		OPEN cIDs

		FETCH NEXT FROM cIDs
		INTO @idArticulo, @idAlmacen

		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @existenciaActual = 0
			SET @existenciaApartado = 0
			SET @existenciaVenta = 0

			SELECT @existenciaActual = ISNULL([existencia_actual], 0)
				  ,@existenciaApartado = ISNULL([existencia_apartado], 0)
				  ,@existenciaVenta = ISNULL([existencia_venta], 0)
			  FROM [dbo].[articulo_existencia]
			  WHERE [id_articulo] = @idArticulo AND [id_almacen] = @idAlmacen

			INSERT INTO [dbo].[auditoria_detalle]
					   ([id_auditoria]
					   ,[id_articulo]
					   ,[ex_actual_inicio]
					   ,[ex_apartado_inicio]
					   ,[ex_venta_inicio]
					   ,[ex_total_inicio]
					   ,[id_almacen])
				 VALUES
					   (@idAuditoria
					   ,@idArticulo
					   ,@existenciaActual
					   ,@existenciaApartado
					   ,@existenciaVenta
					   ,(@existenciaActual + @existenciaApartado + @existenciaVenta)
					   ,@idAlmacen)
					   
			IF @idAlmacen =2 
				INSERT INTO @tablaExistencias VALUES(@idAlmacen,@idArticulo, (@existenciaActual + @existenciaApartado + @existenciaVenta) / (SELECT relacion_venta FROM articulo WHERE id_articulo = @idArticulo))
			ELSE
				INSERT INTO @tablaExistencias VALUES(@idAlmacen,@idArticulo,(@existenciaActual + @existenciaApartado + @existenciaVenta))

			FETCH NEXT FROM cIDs
			INTO @idArticulo, @idAlmacen
		END
		CLOSE cIDs
		DEALLOCATE cIDS
	
	--	FETCH NEXT FROM almacenIDs
	--	INTO @idAlmacen
	--END
	--CLOSE almacenIDs
	--DEALLOCATE almacenIDs

	--SELECT @idAuditoria AS 'id_auditoria'

	SELECT @idAuditoria AS 'id_auditoria', almacen, articulo, existencia FROM @tablaExistencias

END

GO
/****** Object:  StoredProcedure [dbo].[spGuardarAutorizacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Marco Gonzalez
-- Create date:		2018/06/22
-- Description:		Guarda Autorizacion dada
-- =============================================

CREATE PROCEDURE [dbo].[spGuardarAutorizacion]
	@idUsuario	AS	INT,
	@idPermiso	AS	INT,
	@idModulo	AS	INT,
	@idPerfil	AS	INT,
	@idCaja		AS	INT,
	@conHuella	AS	BIT
AS
BEGIN

	DECLARE @vIDPerModPer	AS	INT;
	DECLARE @fecha AS	DATETIME;

	SELECT @fecha = GETDATE();

	SELECT @vIDPerModPer =  id_perf_mod_perm FROM perfil_modulo_permiso WHERE id_perfil = @idPerfil AND id_modulo = @idModulo AND id_permiso = @idPermiso;

	INSERT INTO autorizacion
	VALUES(
		@idUsuario,
		@idPerfil,
		@vIDPerModPer,
		@idCaja,
		@fecha,
		@conHuella
	)
	SELECT id_autorizacion FROM autorizacion WHERE fecha_autorizacion = @fecha;
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarBanco]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarBanco]
	@descripcion as nvarchar(50),
	@puntoVenta as tinyint
AS
BEGIN
	INSERT INTO banco (descripcion,en_punto_venta,fecha_alta,activo) VALUES (@descripcion,@puntoVenta,GETDATE(),1)

	SELECT * FROM banco WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarCierre]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 24.septiembre.2018
-- Description:	Guardar Cierre
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarCierre]
	@idSucursal AS int,
	@idCaja AS int,
	@idUsuarioLogueado AS int,
	@idUsuarioAutorizo AS int,
	@dotacionInicial AS decimal(18,4),
	@totalIncrementos AS decimal(18,4),
	@totalRetiros AS decimal(18,4),
	@totalCambio AS decimal(18,4),
	@totalGastos AS decimal(18,4),
	@totalEfecCaja AS decimal(18,4),
	@totalOtrasFormasPago AS decimal(18,4),
	@totalVenta AS decimal(18,4),
	@totalDevoluciones AS decimal(18,4),
	@folioCierre AS nvarchar(12)
AS
BEGIN
	DECLARE @idMovimientoInicial AS int
	DECLARE @idMovimientoFinal AS int
	DECLARE @folioInicial AS nvarchar(12)
	DECLARE @folioFinal AS nvarchar(12)
	DECLARE @fechaInicio AS datetime
	DECLARE @fechaFinal AS datetime
	DECLARE @idMovimientoFinalAnterior AS int
	DECLARE @diasElim as int

	SELECT @idMovimientoFinalAnterior = MAX(id_movimiento_final) FROM cierre WHERE id_caja = @idCaja
	SET @idMovimientoFinalAnterior = ISNULL(@idMovimientoFinalAnterior, 0)

	--Valores iniciales
	SELECT @idMovimientoInicial = id_movimiento_caja, @folioInicial = folio, @fechaInicio = fecha_registro FROM movimiento_caja
	WHERE fecha_registro = (SELECT MIN(fecha_registro) FROM movimiento_caja WHERE id_caja = @idCaja AND id_cierre IS NULL)
		AND id_caja = @idCaja AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinalAnterior

	--Valores finales
	SELECT @idMovimientoFinal = id_movimiento_caja, @folioFinal = folio, @fechaFinal = fecha_registro FROM movimiento_caja
	WHERE fecha_registro = (SELECT MAX(fecha_registro) FROM movimiento_caja WHERE id_caja = @idCaja AND id_cierre IS NULL)
		AND id_caja = @idCaja AND id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinalAnterior

	--IF @idMovimientoInicial > 0 OR @idMovimientoFinal > 0
	--BEGIN
		--Guardar cierre
		INSERT INTO [dbo].[cierre]
				   ([id_sucursal]
				   ,[id_caja]
				   ,[id_movimiento_inicial]
				   ,[id_movimiento_final]
				   ,[folio_inicial]
				   ,[folio_final]
				   ,[fecha_inicio]
				   ,[fecha_final]
				   ,[fecha_corte]
				   ,[id_usuario_logueado]
				   ,[id_usuario_autorizo]
				   ,[dotacion_inicial]
				   ,[total_incrementos]
				   ,[total_retiros]
				   ,[total_cambio]
				   ,[total_gastos]
				   ,[total_efec_caja]
				   ,[total_otras_formas_pago]
				   ,[total_venta]
				   ,[total_devoluciones])
			 VALUES
				   (@idSucursal
				   ,@idCaja
				   ,@idMovimientoInicial
				   ,@idMovimientoFinal
				   ,@folioInicial
				   ,@folioFinal
				   ,@fechaInicio
				   ,@fechaFinal
				   ,GETDATE()
				   ,@idUsuarioLogueado
				   ,@idUsuarioAutorizo
				   ,@dotacionInicial
				   ,@totalIncrementos
				   ,@totalRetiros
				   ,@totalCambio
				   ,@totalCambio
				   ,@totalEfecCaja
				   ,@totalOtrasFormasPago
				   ,@totalVenta
				   ,@totalDevoluciones)
	
		--Actualizar id_cierre
		UPDATE [dbo].[movimiento_caja]
		   SET [id_cierre] = SCOPE_IDENTITY()
		WHERE id_cierre IS NULL AND id_movimiento_caja > @idMovimientoFinalAnterior AND id_caja = @idCaja

		UPDATE [dbo].[vale_devolucion_transaccion]
			SET [id_cierre] = SCOPE_IDENTITY()
		WHERE [id_caja] = @idCaja --AND CONVERT(date, [fecha_registro]) = CONVERT(date, GETDATE())
			AND [id_cierre] IS NULL

		--Actualizar folio cierre
		UPDATE [dbo].[caja]
		   --SET [folio_corte_actual] = @folioCierre
		   SET [folio_corte_actual] = SCOPE_IDENTITY()
		WHERE id_caja = @idCaja

		SELECT @diasElim = valor FROM variable_config WHERE nombre = 'DIAS_ELIM_COTIZACION' and id_sucursal = @idSucursal
		SET @diasElim = ISNULL(@diasElim, 0)
		--Eliminar cotizaciones detalle
		DELETE cotizacion_detalle WHERE id_cotizacion IN
			(SELECT id_cotizacion FROM cotizacion WHERE DATEDIFF(DAY, fecha_registro, GETDATE()) >= @diasElim
				AND id_sucursal = @idSucursal AND id_caja = @idCaja)
		--Eliminar cotizaciones
		DELETE cotizacion WHERE DATEDIFF(DAY, fecha_registro, GETDATE()) >= @diasElim AND id_sucursal = @idSucursal
			AND id_caja = @idCaja

		--Ceros venta cancelación
		UPDATE [dbo].[venta_cancelacion]
		   SET [registros] = 0
			  ,[monto] = 0
		WHERE id_caja = @idCaja
	--END
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarConsolidacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez      
-- Create date: 21/Noviembre/2019
-- Description:	Nuevo SP para guardar consolidación
--              basandome en el anterior
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarConsolidacion]
	@idSucursal    AS INT,
	@idAutorizo    AS INT,
	@idFacturacion AS INT,
	@fecha         AS DATETIME,
	@numMov        AS INT
AS
	BEGIN
		DECLARE @diasElim AS INT
		DECLARE @folio AS NVARCHAR(12)
		DECLARE @id DECIMAL;
		DECLARE @noSucursal AS NVARCHAR(2)
		SET @noSucursal = REPLICATE('0', 2 - LEN(@idSucursal)) + CAST(@idSucursal AS NVARCHAR)
		DECLARE @MOVIMIENTO NVARCHAR(MAX),@NextId BIGINT

		EXEC spObtenerSiguienteConsecutivoMovimientos
			@idOrigen          = 0,
			@idSucursal        = @idSucursal,
			@idCaja            = 0,
			@origenConsecutivo = 3,
			@siguienteNumero   = @NextId OUTPUT

		SET @folio = REPLICATE('0', 4 - LEN(@NextId)) + CAST(@NextId AS NVARCHAR)
		SET @folio = 'CONS' + @noSucursal + @folio

		INSERT INTO consolidacion VALUES 
		(
			GETDATE(), 
			@folio,
			@idSucursal,
			@idFacturacion,
			@NextId,
			@fecha,
			@fecha,
			@idAutorizo,
			@numMov
		)

		SET @id = @@IDENTITY;

		SELECT @diasElim = valor FROM variable_config WHERE nombre = 'DIAS_ELIM_PROMO' and id_sucursal = @idSucursal

		SET @diasElim = ISNULL(@diasElim, 0)

		--Eliminar imagen promo
		DELETE [dbo].[promocion_imagen] WHERE [id_promocion] IN (SELECT [id_promocion] FROM [dbo].[promocion] 
		WHERE DATEDIFF(DAY, vigencia_fin, GETDATE()) >= @diasElim AND id_sucursal = @idSucursal AND 
		[id_promocion] NOT IN (SELECT [id_promocion] FROM [dbo].[promocion_venta] GROUP BY [id_promocion]))

		--Eliminar promo compra
		DELETE [dbo].[promocion_compra] WHERE [id_promocion] IN (SELECT [id_promocion] FROM [dbo].[promocion] 
		WHERE DATEDIFF(DAY, vigencia_fin, GETDATE()) >= @diasElim AND id_sucursal = @idSucursal AND 
		[id_promocion] NOT IN (SELECT [id_promocion] FROM [dbo].[promocion_venta] GROUP BY [id_promocion]))

		--Eliminar promo regalo
		DELETE [dbo].[promocion_regalo] WHERE [id_promocion] IN (SELECT [id_promocion] FROM [dbo].[promocion] 
		WHERE DATEDIFF(DAY, vigencia_fin, GETDATE()) >= @diasElim AND id_sucursal = @idSucursal AND 
		[id_promocion] NOT IN (SELECT [id_promocion] FROM [dbo].[promocion_venta] GROUP BY [id_promocion]))

		--Eliminar promo
		DELETE [dbo].[promocion] WHERE [id_promocion] IN (SELECT [id_promocion] FROM [dbo].[promocion] 
		WHERE DATEDIFF(DAY, vigencia_fin, GETDATE()) >= 15 AND id_sucursal = 48 AND [id_promocion] NOT IN 
		(SELECT [id_promocion] FROM [dbo].[promocion_venta] GROUP BY [id_promocion]))

		--Desactivar promos
		UPDATE [dbo].[promocion] SET [activo] = 0 WHERE DATEDIFF(DAY, [vigencia_fin], 
		GETDATE()) >= @diasElim AND [id_sucursal] = @idSucursal

		--Eliminar ofertas
		SELECT @diasElim = valor FROM variable_config WHERE nombre = 'DIAS_ELIM_OFERTA' and id_sucursal = @idSucursal

		SET @diasElim = ISNULL(@diasElim, 0)

		DELETE articulo_oferta WHERE DATEDIFF(DAY, fecha_termino, GETDATE()) >= @diasElim

		--Pasar valores de existencia venta y apartado, a existecia actual
		UPDATE [dbo].[articulo_existencia] SET [existencia_actual] = ISNULL([existencia_actual],0) + ISNULL([existencia_apartado],0) + 
		ISNULL([existencia_venta],0),[existencia_apartado] = 0,[existencia_venta] = 0 WHERE [id_almacen] IN 
		(SELECT [id_almacen] FROM [dbo].[almacen] WHERE [id_sucursal] = @idSucursal)

		--Regreso el id_consolidacion y folio
		SELECT id_consolidacion,folio FROM consolidacion WHERE id_consolidacion = CAST(@id AS INT)
	END

GO
/****** Object:  StoredProcedure [dbo].[spGuardarCotizacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 25.septiembre.2018
-- Description:	Guardar cotizaci�n
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-10-31
-- Description:	Guardar cotización detalle con cantidades a unidad de compra
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarCotizacion]
	@idSucursal AS INT,
	@idCaja AS INT, 
	@idCliente AS INT,
	@nombreCliente AS NVARCHAR(50),
	@observaciones AS NVARCHAR(100),
	@subtotal AS DECIMAL(18,2),
	@descuento AS DECIMAL(18,2),
	@totalNeto AS DECIMAL(18,2),
	@idUsuario AS INT,
	@tablaArticulos AS CotizacionDetalle READONLY
AS
BEGIN
	BEGIN TRANSACTION
	DECLARE @error AS nvarchar(1000)
	DECLARE @relacionV AS	DECIMAL(18,2)
	SET @error = ''
	BEGIN TRY
		--Si no existe el cliente
			IF @idCliente = 0
		SET @idCliente = NULL
		--Guardar cotizacion
		INSERT INTO [dbo].[cotizacion]
				([id_sucursal]
				,[id_caja]
				,[id_cliente]
				,[nombre_cliente]
				,[observaciones]
				,[subtotal]
				,[descuento]
				,[total_neto]
				,[fecha_registro]
				,[id_usuario]
				,[id_venta]
				,[cotizacion_apartada])
			VALUES
				(@idSucursal
				,@idCaja
				,@idCliente
				,@nombreCliente
				,@observaciones
				,@subtotal
				,@descuento
				,@totalNeto
				,GETDATE()
				,@idUsuario
				,NULL
				,1)
		--Variables para guardar cotizacion_detalle
		DECLARE @idCotizacion AS INT
		SET @idCotizacion = CAST(SCOPE_IDENTITY() AS INT)
		DECLARE @idArticulo AS INT
		DECLARE @cantidad AS DECIMAL(18,2)
		DECLARE @idUnidadMedida AS INT
		DECLARE @idAlmacen AS INT
		DECLARE @consecutivo AS INT
		DECLARE @esPromocion AS BIT
		SET @consecutivo = 1
		--Cursor para recorrer los articulos
		DECLARE cArticulos CURSOR
			FOR SELECT idArticulo, cantidad, idUnidadMedida, idAlmacen, esPromocion FROM @tablaArticulos
		OPEN cArticulos
		--Recorrer articulos
		FETCH NEXT FROM cArticulos
		INTO @idArticulo, @cantidad, @idUnidadMedida, @idAlmacen, @esPromocion
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @esPromocion = 0
			BEGIN
				SET @relacionV = 0
				SELECT @relacionV = relacion_venta FROM articulo WHERE id_articulo = @idArticulo
				IF(@relacionV != 0)
				BEGIN
					SET @cantidad = @cantidad / @relacionV
				END
			
				--Guardar cotizacion_detalle
				INSERT INTO [dbo].[cotizacion_detalle]
							([id_cotizacion]
							,[id_articulo]
							,[consecutivo]
							,[cantidad]
							,[id_unidad_medida]
							,[id_almacen])
						VALUES
							(@idCotizacion
							,@idArticulo
							,@consecutivo
							,@cantidad
							,@idUnidadMedida
							,@idAlmacen)
				--Aumentar consecutivo
				SET @consecutivo = @consecutivo + 1
				--Actualizar existencia
				SET @cantidad = @cantidad * @relacionV
			END

			UPDATE [dbo].[articulo_existencia]
				SET [existencia_venta] = [existencia_venta] - @cantidad,
					[existencia_apartado] = ISNULL([existencia_apartado], 0) + @cantidad
			WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacen
			FETCH NEXT FROM cArticulos
			INTO @idArticulo, @cantidad, @idUnidadMedida, @idAlmacen, @esPromocion
		END
		CLOSE cArticulos
		DEALLOCATE cArticulos
		--Actualizar caja la columna �folio_cotizacion_actual� 
		UPDATE [dbo].[caja]
			SET [folio_cotizacion_actual] = @idCotizacion
		WHERE id_caja = @idCaja
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		SET @idCotizacion = 0
		SELECT @error = ERROR_MESSAGE()
	END CATCH
	SELECT @idCotizacion AS id_cotizacion, @error as error
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaRecarga]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:			Aldo Barugola
-- Create date:		2018-12-06
-- Description:		Guarda recarga
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaRecarga]
    @id_sucursal as int
    ,@id_caja as int
    ,@descripcion_producto as nvarchar(100)
    ,@monto as decimal(18,2)
    ,@telefono as nvarchar(20)
    ,@id_usuario as int
AS
BEGIN
	Declare @id decimal;
    INSERT INTO [dbo].[recarga]
           ([id_sucursal]
           ,[id_caja]
           ,[descripcion_producto]
           ,[monto]
           ,[telefono]
		   ,[fecha]
           ,[id_usuario])
     VALUES
           (@id_sucursal
           ,@id_caja
           ,@descripcion_producto
           ,@monto
           ,@telefono
           ,GETDATE()
           ,@id_usuario)

	set @id = @@IDENTITY;
	SELECT	Cast(@id as int) AS 'id_recarga'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarEvMoniDetalle]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 27.julio.2019
-- Description:	SP para guardar foto
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarEvMoniDetalle]
	@idEvMoni AS int,
	@imagen AS varbinary(MAX)
AS
BEGIN
	INSERT INTO [dbo].[evmoni_detalle]
			   ([id_evmoni]
			   ,[evmoni]
			   ,[fecha_registro])
		 VALUES
			   (@idEvMoni
			   ,@imagen
			   ,GETDATE())
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarFoto]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 26.julio.2019
-- Description:	SP para guardar foto
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarFoto]
	@imagen as varbinary(MAX)
AS
BEGIN
	INSERT INTO [dbo].[bitacora_fotos]
			   ([fecha_registro]
			   ,[foto])
		 VALUES
			   (GETDATE()
			   ,@imagen)
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarIDCompraEnOrdenCompra]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-11-07
-- Description:	Guarda el id_compra en la tabla orden_compra
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarIDCompraEnOrdenCompra]
	@idCompra	AS	INT,
	@idsOrdenes	AS	ListaIDs READONLY
AS
BEGIN
	UPDATE
		orden_compra
	SET
		id_compra = @idCompra
	FROM
		@idsOrdenes o
	WHERE
		orden_compra.id_orden_compra = o.id
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarLineaDeNegocio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarLineaDeNegocio]
	@descripcion as nvarchar(50),
	@clave as nvarchar(50)
AS
BEGIN
	INSERT INTO linea_negocio (clave,descripcion,fecha_alta, activo) VALUES(@clave, @descripcion,GETDATE(), 1)

	SELECT * FROM linea_negocio WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarListaMovimientoCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-13
-- Description:	Cambio sequence por consecutivo
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-22
-- Description:	Agregar id_movimiento_almacen y id_movimiento_caja a la tabla ticket_bancomer
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-04-16
-- Description:	cambio id caja por no caja en folio
-- =============================================	
CREATE PROCEDURE [dbo].[spGuardarListaMovimientoCaja]
	@tablaMovsCaja AS MovimientoCaja READONLY
AS
BEGIN
	--VARIABLES MODELO MOVIMIENTO CAJA
	DECLARE @idSucursal as int
	DECLARE @idCaja as int
	DECLARE @idFormaPago as int
	DECLARE @idMovCajaT as int
	DECLARE @idMovCajaC as int
	DECLARE @importeTotal as decimal(18,2)
	DECLARE @dotacionInicial as int
	DECLARE @folio as nvarchar(12)
	DECLARE @idUsuLogueado as int
	DECLARE @idUsuAutorizo as int
	DECLARE @observaciones as nvarchar(50) = null
	DECLARE @idValeDevolucion as int
	DECLARE @idVenta as int
	DECLARE @folioVenta as nvarchar(12)
	DECLARE @referencia as nvarchar(20)
	DECLARE @idBanco as int
	DECLARE @idTransaccion as int

	DECLARE cMovCaja CURSOR
		FOR SELECT idSucursal, idCaja, idFormaPago, idMovimientoCajaTipo, idMovimientoCajaConcepto, importeTotal, dotacionInicial, folio,
			idUsuarioLogueado, idUsuarioAutorizo, observaciones, idValeDevolucion, idVenta, folioVenta, referencia, idBanco, idTransaccion
		FROM @tablaMovsCaja
	OPEN cMovCaja
	FETCH NEXT FROM cMovCaja
	INTO @idSucursal, @idCaja, @idFormaPago, @idMovCajaT, @idMovCajaC, @importeTotal, @dotacionInicial, @folio, @idUsuLogueado, @idUsuAutorizo,
		@observaciones, @idValeDevolucion, @idVenta, @folioVenta, @referencia, @idBanco, @idTransaccion
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--VARIABLES PARA CREAR FOLIO
		DECLARE @nombreMovimientoCajaTipo AS NVARCHAR(MAX)
		DECLARE @letraMovimiento AS NVARCHAR(1)
		SELECT @letraMovimiento = clave FROM movimiento_caja_tipo WHERE id_movimiento_caja_tipo = @idMovCajaT
		DECLARE @noSucursal AS NVARCHAR(2)
		SELECT @noSucursal = clave_sucursal from sucursal where id_sucursal = @idSucursal;
		--SET @noSucursal = REPLICATE('0', 2 - LEN(@idSucursal)) + CAST(@idSucursal AS NVARCHAR)
		DECLARE @noCaja AS NVARCHAR(2), @noCajaInt AS INT
		SELECT @noCajaInt = no_caja FROM caja WHERE id_caja = @idCaja
		SET @noCaja = RIGHT('00' + CONVERT(NVARCHAR(10), @noCajaInt), 2)
		SELECT @nombreMovimientoCajaTipo  = nombre FROM movimiento_caja_tipo WHERE id_movimiento_caja_tipo = @idMovCajaT

		--OBTENER CONSECUTIVO SIGUIENTE
		DECLARE @MOVIMIENTO NVARCHAR(MAX),
				@NextId BIGINT

		SET @MOVIMIENTO =
			CASE @nombreMovimientoCajaTipo
				WHEN 'Habilitar' THEN 'Habilitar'
				WHEN 'Cerrar' THEN 'Cerrar'
				WHEN 'Incremento' THEN 'Incremento'
				WHEN 'Retiro' THEN 'Retiro'
				WHEN 'Gasto' THEN 'Gasto'
				ELSE 'NONE'
		END

		EXEC spObtenerSiguienteConsecutivoMovimientos
		@idOrigen = @idMovCajaT,
		@idSucursal = @idSucursal,
		@idCaja = @idCaja,
		@origenConsecutivo = 2,
		@siguienteNumero = @NextId OUTPUT

		--CREAR FOLIO
		SET @folio = REPLICATE('0', 7 - LEN(@NextId)) + CAST(@NextId AS NVARCHAR)
		SET @folio = @letraMovimiento + @noSucursal + @noCaja + @folio

		IF @idVenta = 0
			SET @idVenta = NULL
		IF @folioVenta = ''
			SET @folioVenta = NULL
		IF @referencia = ''
			SET @referencia = NULL
		IF  @idBanco = 0
			SET @idBanco = NULL

		--GUARDAR MOVIMIENTO CAJA
		INSERT INTO movimiento_caja
		(
				id_sucursal,
				id_caja,
				id_forma_pago,
				id_movimiento_caja_tipo,
				id_movimiento_caja_concepto,
				importe_total,
				dotacion_inicial,
				folio,
				fecha_registro,
				id_usuario_logueado,
				id_usuario_autorizo,
				observaciones,
				id_venta,
				folio_venta,
				referencia,
				id_banco,
				consecutivo
		)
		VALUES(
			@idSucursal,
			@idCaja,
			@idFormaPago,
			@idMovCajaT,
			@idMovCajaC,
			@importeTotal,
			@dotacionInicial,
			@folio,
			GETDATE(),
			@idUsuLogueado,
			@idUsuAutorizo,
			@observaciones,
			@idVenta,
			@folioVenta,
			@referencia,
			@idBanco,
			@NextId
		)

		--PONER VALES DEVOLUCION APLICADO
		IF @idFormaPago = 11
		BEGIN
			UPDATE [dbo].[vale_devolucion]
			   SET [aplicado] = 1
			 WHERE [folio] = @referencia

			 UPDATE [dbo].[vale_devolucion_transaccion]
			   SET [aplicado] = 1
			 WHERE [folio] = @referencia
		END
			

		IF @idTransaccion > 0
		BEGIN
			UPDATE [dbo].[transaccion_banco]
			   SET [id_movimiento_caja] = SCOPE_IDENTITY(),
				   [folio_mov_caja] = @folio
			WHERE  [id_transaccion] = @idTransaccion

			UPDATE 
				ticket_bancomer
			SET
				id_movimiento_caja = SCOPE_IDENTITY(),
				id_movimiento_almacen = @idVenta
			WHERE
				id_transaccion_banco = @idTransaccion
		END

		FETCH NEXT FROM cMovCaja
		INTO @idSucursal, @idCaja, @idFormaPago, @idMovCajaT, @idMovCajaC, @importeTotal, @dotacionInicial, @folio, @idUsuLogueado, @idUsuAutorizo,
			@observaciones, @idValeDevolucion, @idVenta, @folioVenta, @referencia, @idBanco, @idTransaccion
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarMAD]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-07-18
-- Description:	Guardar id_referencia_detalle
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Mod date: 2018-09-08
-- Description:	Error dividir entre 0 en costo promedio
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Mod date:	2018-09-21
-- Description:	Si la unidad es de venta, mutiplica el costo unitario por relacion venta
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Mod date:	2018-10-05
-- Description:	Actualizar fecha ultima compra
-- =============================================
-- =============================================
-- Author:		Sa�l Cruces
-- Mod date:	27.octubre.2018
-- Description:	Guardar existencia_al_momento
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Mod date:	2019-03-09
-- Description:	Cambiar costo unitario a venta
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Mod date:	2019-04-03
-- Description:	Guardar costos a 6 decimales
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Mod date:	2019-06-13
-- Description:	Guarda costos y tasas de impuestos
-- =============================================
-- =============================================
-- Author:		Israel Flores C.
-- Mod date:	2020-02-04
-- Description:	Si no existe en la tabla existencía se agrega
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarMAD]
	@idMovimientoAlm AS INT,
	@tablaDetalles MovimientoAlmacenDetalle READONLY
AS
BEGIN
	DECLARE @ExistenciaTotal AS NUMERIC(20,4)
	DECLARE @idMAD AS INT
	DECLARE @idMovimientoAlmacenDetalle AS INT
	DECLARE @idMovimientoAlmacen AS INT
    DECLARE @idAlmacen AS INT
    DECLARE @idArticulo AS INT
    DECLARE @consecutivo AS INT
    DECLARE @cantidad AS DECIMAL(18,2)
	DECLARE @cantidadExistencia AS DECIMAL(18,2)
    DECLARE @costoUnitario AS DECIMAL(18,6)
    DECLARE @idUnidadMedida AS INT
    DECLARE @descuento AS DECIMAL(18,6)
    DECLARE @importe AS DECIMAL(18,6)
    DECLARE @entradaArticuloExistencia AS INT
    DECLARE @salidaArticuloExistencia AS INT
    DECLARE @entradaArticulo AS INT
    DECLARE @salidaArticulo AS INT
    DECLARE @afectaCostoUltimo AS TINYINT
	DECLARE @afectaCostoPromedio AS TINYINT
	DECLARE @existenciaActual AS DECIMAL(18,2)
	DECLARE @vendeSinExistencia	AS	BIT
	DECLARE @subtotal AS DECIMAL(18,6)
	DECLARE @iva AS DECIMAL(18,6)
	DECLARE @ieps AS DECIMAL(18,6)
	DECLARE @idUnidadMedidaCompra AS INT
	DECLARE @idUnidadMedidaVenta AS INT
	DECLARE @esMayoreo AS BIT
	DECLARE @existenciaAlMomento AS DECIMAL(18,2)
	DECLARE @idMovimientoAlmacenTipo AS INT
	DECLARE @tasaIVA AS DECIMAL(18,2)
	DECLARE @tasaIEPS AS DECIMAL(18,2)
	DECLARE @costo AS DECIMAL(18,2)
	DECLARE @costoUltimo AS DECIMAL(18,2)
	DECLARE cMAD CURSOR
		FOR SELECT * FROM @tablaDetalles
	OPEN cMAD
	FETCH NEXT FROM cMAD
	INTO @idMovimientoAlmacenDetalle,@idMovimientoAlmacen,@idAlmacen,@idArticulo,
		@consecutivo,@cantidad,@cantidadExistencia,@costoUnitario,@idUnidadMedida,@descuento,@importe,
		@entradaArticuloExistencia,@salidaArticuloExistencia,@entradaArticulo,
		@salidaArticulo,@afectaCostoUltimo,@afectaCostoPromedio,@vendeSinExistencia,
		@subtotal,@iva,@ieps
	WHILE @@FETCH_STATUS = 0
    BEGIN
		--ARTICULO
        DECLARE @costoAcumulado AS DECIMAL(18,6)
        DECLARE @costoPromedio AS DECIMAL(18,6)
        DECLARE @tEnt AS INT
		DECLARE @idUnidadVenta AS INT
		DECLARE @relacionVenta AS DECIMAL(18,6)
        SELECT @costoAcumulado = ISNULL([costo_acumulado], 0),
				@costoPromedio = ISNULL([costo_promedio], 0),
				@costoUltimo = ISNULL([costo_ultimo], 0),
				@tEnt = ISNULL([total_entradas], 0),
				@idUnidadVenta = [id_unidad_venta],
				@relacionVenta = [relacion_venta]
        FROM [articulo] a WHERE [id_articulo] = @idArticulo

		SELECT 
			@idMovimientoAlmacenTipo = id_movimiento_almacen_tipo 
		FROM 
			movimiento_almacen 
		WHERE 
			id_movimiento_almacen = @idMovimientoAlm

		IF(@idMovimientoAlmacenDetalle = 0)
		BEGIN
			SET @idMovimientoAlmacenDetalle = NULL;
		END
		--UNIDADES MEDIDA
		SELECT @idUnidadMedidaVenta = id_unidad_venta, @idUnidadMedidaCompra = id_unidad_compra FROM articulo WHERE id_articulo = @idArticulo
		--ES MAYOREO
		IF @idUnidadMedida = @idUnidadMedidaCompra
		BEGIN
			SET @esMayoreo = 1
			SET @costoUnitario = @costoUnitario / @relacionVenta
		END
		ELSE
		BEGIN
			SET @esMayoreo = 0
		END
		--EXISTENCIA
		SET @existenciaActual = 0
		SELECT @existenciaActual = ISNULL([existencia_actual],0) FROM [articulo_existencia] WHERE [id_articulo] = @idArticulo AND [id_almacen] = @idAlmacen
		IF @vendeSinExistencia = 0
		BEGIN

			IF EXISTS (SELECT * FROM articulo_existencia WHERE id_almacen = @idAlmacen AND id_articulo = @idArticulo)
				BEGIN
					SET @existenciaActual = @existenciaActual + @cantidad;
					IF @existenciaActual < 0
						SET @existenciaActual = 0
					UPDATE [articulo_existencia]
					SET [existencia_actual] = @existenciaActual,
						[total_entradas] = [total_entradas] + @entradaArticuloExistencia,
						[total_salidas] = [total_salidas] + @salidaArticuloExistencia
					WHERE [id_articulo] = @idArticulo AND [id_almacen] = @idAlmacen
				END
			ELSE
				BEGIN
					INSERT INTO [dbo].[articulo_existencia]
					   ([id_articulo]
					   ,[id_almacen]
					   ,[total_entradas]
					   ,[total_salidas]
					   ,[existencia_actual]
					   ,[existencia_apartado]
					   ,[existencia_venta]
					   ,[ubicacion]
					   ,[stock_minimo]
					   ,[stock_maximo]
					   ,[existencia_inicial])
					VALUES
					   (@idArticulo
					   ,@idAlmacen
					   ,1
					   ,0
					   ,@cantidad
					   ,0
					   ,0
					   ,''
					   ,0
					   ,0
					   ,0)
				END
		END

		--COSTOS Y TASAS IMPUESTOS
		SELECT
			@tasaIVA = iva.tasa,
			@tasaIEPS = ieps.tasa,
			@costoUltimo = a.costo_ultimo
		FROM
			articulo a
			LEFT JOIN impuesto iva ON a.id_iva_compra = iva.id_impuesto
			LEFT JOIN impuesto ieps ON a.id_ieps_compra = ieps.id_impuesto
		WHERE
			a.id_articulo = @idArticulo

		SELECT @costo = @subtotal
		IF(@idMovimientoAlmacenTipo = 7)
		BEGIN
			SELECT @costo = @costoUltimo / @relacionVenta * @cantidad
		END
		--MOVIMIENTO ALMACEN DETALLE
		SET @existenciaAlMomento = 0
		SELECT @existenciaAlMomento = ISNULL([existencia_actual],0) + ISNULL([existencia_apartado],0) + ISNULL([existencia_venta],0) FROM [articulo_existencia] WHERE [id_articulo] = @idArticulo AND [id_almacen] = @idAlmacen
		INSERT INTO [movimiento_almacen_detalle]
			([id_movimiento_almacen]
			   ,[id_almacen]
			   ,[id_articulo]
			   ,[consecutivo]
			   ,[cantidad]
			   ,[costo_unitario]
			   ,[id_unidad_medida]
			   ,[descuento]
			   ,[importe]
			   ,[ingresado]
			   ,[id_referencia_detalle]
			   ,[existencia_al_momento]
			   ,[subtotal]
			   ,[iva]
			   ,[ieps]
			   ,[es_mayoreo]
			   ,[costo]
			   ,[tasa_iva]
			   ,[tasa_ieps])
		 VALUES
			   (@idMovimientoAlm
			   ,@idAlmacen
			   ,@idArticulo
			   ,@consecutivo
			   ,ABS(@cantidad)
			   ,ABS(@costoUnitario)
			   ,@idUnidadMedidaVenta
			   ,@descuento
			   ,@importe
			   ,0
			   ,@idMovimientoAlmacenDetalle
			   ,@existenciaAlMomento
			   ,@subtotal
			   ,@iva
			   ,@ieps
			   ,@esMayoreo
			   ,@costo
			   ,@tasaIVA
			   ,@tasaIEPS);

			   SELECT @idMAD=@@IDENTITY;
        
		--Verifico la existencia total si se queda en 0 no dejar el costo promedio en cero y conservar el anterior por referencia
		SET @ExistenciaTotal = dbo.fnExistenciaTotal(@idArticulo);

		IF @ExistenciaTotal > 0
		BEGIN
			IF @afectaCostoPromedio = 1
			BEGIN
				--SET @costoUnitario = @costoUnitario * @relacionVenta

				--SET @costoAcumulado = @costoAcumulado + @costoUnitario
				--IF((@tEnt + @entradaArticulo) != 0)
				--BEGIN
				--	SET @costoPromedio = @costoAcumulado / (@tEnt + @entradaArticulo)
				--END
				--ELSE
				--BEGIN
				--	SET @costoPromedio = 0;
				--END
				--IF @afectaCostoUltimo = 1
				--BEGIN
				--	SET @costoUltimo = ABS(@costoUnitario)
				--END

				SET @costoUnitario = @costoUnitario * @relacionVenta

				SET @costoAcumulado = @costoAcumulado + @costoUnitario

				SET @costoPromedio = dbo.fnCostoPromedio(@idMAD)

				--BEGIN TRY
				--	SET @costoPromedio = ABS(dbo.fnCostoPromedio(@idMAD));
				--END TRY  
				--BEGIN CATCH
				--	SET @costoPromedio = ABS(@costoUnitario);
				--END CATCH;

				IF @afectaCostoUltimo = 1
				BEGIN
					SET @costoUltimo = ABS(@costoUnitario)
				END
			END
		END

		--Actualizo el costo como esta el costo promedio al momento del movimiento y el valor es unitario
		UPDATE movimiento_almacen_detalle SET costo = @costoPromedio WHERE id_movimiento_almacen_detalle=@idMAD;

		DECLARE @fecha DATETIME
		SET @fecha = GETDATE()

		UPDATE [articulo]
		SET [total_entradas] = ISNULL([total_entradas], 0) + @entradaArticulo,
			[total_salidas] = ISNULL([total_salidas], 0) + @salidaArticulo,
			[costo_acumulado] = @costoAcumulado,
			[costo_promedio] = @costoPromedio,
			[costo_ultimo] = @costoUltimo,
			[fecha_ultima_modificacion] = @fecha
		WHERE [id_articulo] = @idArticulo

		DECLARE @esCompra BIT
		SELECT @esCompra = (CASE id_movimiento_almacen_tipo WHEN 1 THEN 1 ELSE 0 END) FROM movimiento_almacen WHERE id_movimiento_almacen = @idMovimientoAlm 
		IF(@esCompra = 1)
		BEGIN
			UPDATE 
				[articulo]
			SET
				[fecha_ultima_compra] = @fecha
			WHERE
				[id_articulo] = @idArticulo
		END


		FETCH NEXT FROM cMAD
		INTO @idMovimientoAlmacenDetalle,@idMovimientoAlmacen,@idAlmacen,@idArticulo,
			@consecutivo,@cantidad,@cantidadExistencia,@costoUnitario,@idUnidadMedida,@descuento,@importe,
			@entradaArticuloExistencia,@salidaArticuloExistencia,@entradaArticulo,
			@salidaArticulo,@afectaCostoUltimo,@afectaCostoPromedio,@vendeSinExistencia,
			@subtotal,@iva,@ieps
    END
    CLOSE cMAD
    DEALLOCATE cMAD
	SELECT CAST(1 AS BIT) AS 'ok'
END

GO
/****** Object:  StoredProcedure [dbo].[spGuardarMADVentaPV]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Mod date:	2019-03-16
-- Description:	Cambiar montos a 18,6
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Mod date:	2019-06-13
-- Description:	Se guarda costo, tasa iva y tasa ieps
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarMADVentaPV]
	@idMovimientoAlm AS INT,
	@tablaDetalles MovimientoAlmacenDetalle READONLY
AS
BEGIN
	DECLARE @ExistenciaTotal AS NUMERIC(20,4)
	DECLARE @idMAD AS INT
	DECLARE @idMovimientoAlmacenDetalle AS INT
	DECLARE @idMovimientoAlmacen AS INT
    DECLARE @idAlmacen AS INT
    DECLARE @idArticulo AS INT
    DECLARE @consecutivo AS INT
    DECLARE @cantidad AS DECIMAL(18,2)
	DECLARE @cantidadExistencia AS DECIMAL(18,2)
    DECLARE @costoUnitario AS DECIMAL(18,6)
    DECLARE @idUnidadMedida AS INT
    DECLARE @descuento AS DECIMAL(18,6)
    DECLARE @importe AS DECIMAL(18,6)
    DECLARE @entradaArticuloExistencia AS INT
    DECLARE @salidaArticuloExistencia AS INT
    DECLARE @entradaArticulo AS INT
    DECLARE @salidaArticulo AS INT
    DECLARE @afectaCostoUltimo AS TINYINT
	DECLARE @afectaCostoPromedio AS TINYINT
	DECLARE @existenciaActual AS DECIMAL(18,2)
	DECLARE @vendeSinExistencia AS BIT
	DECLARE @subtotal AS DECIMAL(18,6)
	DECLARE @iva AS DECIMAL(18,6)
	DECLARE @ieps AS DECIMAL(18,6)
	DECLARE @idUnidadMedidaCompra AS INT
	DECLARE @idUnidadMedidaVenta AS INT
	DECLARE @esMayoreo AS BIT
	DECLARE @existenciaAlMomento AS DECIMAL(18,2)
	DECLARE @tasaIVA AS DECIMAL(18,2)
	DECLARE @tasaIEPS AS DECIMAL(18,2)
	DECLARE @costo AS DECIMAL(18,6)

	--Variables Receta
	DECLARE @pideReceta AS TINYINT
	DECLARE @idArticuloAdicionales AS INT

	CREATE TABLE #tblTempArtsReceta (id_articulo INT, id_movimiento_almacen_detalle INT)

	DECLARE cMAD CURSOR
		FOR SELECT * FROM @tablaDetalles
	OPEN cMAD
	FETCH NEXT FROM cMAD
	INTO @idMovimientoAlmacenDetalle,@idMovimientoAlmacen,@idAlmacen,@idArticulo,
		@consecutivo,@cantidad,@cantidadExistencia,@costoUnitario,@idUnidadMedida,@descuento,@importe,
		@entradaArticuloExistencia,@salidaArticuloExistencia,@entradaArticulo,
		@salidaArticulo,@afectaCostoUltimo,@afectaCostoPromedio,@vendeSinExistencia,
		@subtotal,@iva,@ieps
	WHILE @@FETCH_STATUS = 0
    BEGIN
		IF(@idMovimientoAlmacenDetalle = 0)
		BEGIN
			SET @idMovimientoAlmacenDetalle = NULL;
		END
		--UNIDADES MEDIDA
		SELECT @idUnidadMedidaVenta = id_unidad_venta, @idUnidadMedidaCompra = id_unidad_compra FROM articulo WHERE id_articulo = @idArticulo
		--ES MAYOREO
		IF @idUnidadMedida = @idUnidadMedidaCompra
			SET @esMayoreo = 1
		ELSE
			SET @esMayoreo = 0
		--EXISTENCIA
		IF @vendeSinExistencia = 0
			UPDATE [articulo_existencia]
			SET [existencia_venta] = [existencia_venta] + @cantidadExistencia,
				[total_entradas] = [total_entradas] + @entradaArticuloExistencia,
				[total_salidas] = [total_salidas] + @salidaArticuloExistencia
			WHERE [id_articulo] = @idArticulo AND [id_almacen] = @idAlmacen
		--EXISTENCIA PROMOCIONES
		IF @importe = 0
			UPDATE [articulo_existencia]
			SET [existencia_venta] = [existencia_venta] - @cantidad
			WHERE [id_articulo] = @idArticulo AND [id_almacen] = @idAlmacen
		--EXISTENCIA_AL_MOMENTO
		SET @existenciaAlMomento = 0
		SELECT @existenciaAlMomento = ISNULL([existencia_actual],0) + ISNULL([existencia_apartado],0) + ISNULL([existencia_venta],0) FROM [articulo_existencia] WHERE [id_articulo] = @idArticulo AND [id_almacen] = @idAlmacen
		--COSTOS Y TASAS IMPUESTOS
		SELECT
			@costo = a.costo_ultimo / a.relacion_venta * @cantidad,
			@tasaIVA = iva.tasa,
			@tasaIEPS = ieps.tasa
		FROM
			articulo a
			LEFT JOIN impuesto iva ON a.id_iva_venta = iva.id_impuesto
			LEFT JOIN impuesto ieps ON a.id_ieps_venta = ieps.id_impuesto
		WHERE
			a.id_articulo = @idArticulo
		
		--MOVIMIENTO ALMACEN DETALLE
		INSERT INTO [movimiento_almacen_detalle]
			([id_movimiento_almacen]
			   ,[id_almacen]
			   ,[id_articulo]
			   ,[consecutivo]
			   ,[cantidad]
			   ,[costo_unitario]
			   ,[id_unidad_medida]
			   ,[descuento]
			   ,[importe]
			   ,[ingresado]
			   ,[id_referencia_detalle]
			   ,[existencia_al_momento]
			   ,[subtotal]
			   ,[iva]
			   ,[ieps]
			   ,[es_mayoreo]
			   ,[costo]
			   ,[tasa_iva]
			   ,[tasa_ieps])
		 VALUES
			   (@idMovimientoAlm
			   ,@idAlmacen
			   ,@idArticulo
			   ,@consecutivo
			   ,ABS(@cantidad)
			   ,ABS(@costoUnitario)
			   ,@idUnidadMedidaVenta
			   ,@descuento
			   ,@importe
			   ,0
			   ,@idMovimientoAlmacenDetalle
			   ,@existenciaAlMomento
			   ,@subtotal
			   ,@iva
			   ,@ieps
			   ,@esMayoreo
			   ,@costo
			   ,@tasaIVA
			   ,@tasaIEPS)

		SELECT @idMAD=@@IDENTITY;

		--Revisar si pide receta
		SELECT @idArticuloAdicionales = id_articulo_adicionales FROM articulo WHERE id_articulo = @idArticulo
		SELECT @pideReceta = pide_receta FROM articulo_adicionales WHERE id_articulo_adicionales = @idArticuloAdicionales
		IF @pideReceta = 1
			INSERT INTO #tblTempArtsReceta VALUES(@idArticulo, SCOPE_IDENTITY())
        --ARTICULO
        DECLARE @costoAcumulado AS DECIMAL(18,2)
        DECLARE @costoPromedio AS DECIMAL(18,2)
        DECLARE @costoUltimo AS DECIMAL(18,2)
        DECLARE @tEnt AS INT
        SELECT @costoAcumulado = ISNULL([costo_acumulado], 0),
				@costoPromedio = ISNULL([costo_promedio], 0),
				@costoUltimo = ISNULL([costo_ultimo], 0),
				@tEnt = ISNULL([total_entradas], 0)
        FROM [articulo] WHERE [id_articulo] = @idArticulo
        
		--Verifico la existencia total si se queda en 0 no dejar el costo promedio en cero y conservar el anterior por referencia
		SET @ExistenciaTotal = dbo.fnExistenciaTotal(@idArticulo);

		IF @ExistenciaTotal > 0
		BEGIN
			IF @afectaCostoPromedio = 1
			BEGIN
				--SET @costoAcumulado = @costoAcumulado + @costoUnitario
				--SET @costoPromedio = @costoAcumulado / (@tEnt + @entradaArticulo)
				--IF @afectaCostoUltimo = 1
				--BEGIN
				--	SET @costoUltimo = ABS(@costoUnitario)
				--END

				SET @costoAcumulado = @costoAcumulado + @costoUnitario
				SET @costoPromedio = dbo.fnCostoPromedio(@idMAD)
				IF @afectaCostoUltimo = 1
				BEGIN
					SET @costoUltimo = ABS(@costoUnitario)
				END
			END
		END

		--Actualizo el costo como esta el costo promedio al momento del movimiento y el valor es unitario
		UPDATE movimiento_almacen_detalle SET costo = @costoPromedio WHERE id_movimiento_almacen_detalle=@idMAD;

		UPDATE [articulo]
		SET [total_entradas] = ISNULL([total_entradas], 0) + @entradaArticulo,
			[total_salidas] = ISNULL([total_salidas], 0) + @salidaArticulo,
			[costo_acumulado] = @costoAcumulado,
			[costo_promedio] = @costoPromedio,
			[costo_ultimo] = @costoUltimo,
			[fecha_ultima_modificacion] = GETDATE()
		WHERE [id_articulo] = @idArticulo
		FETCH NEXT FROM cMAD
		INTO @idMovimientoAlmacenDetalle,@idMovimientoAlmacen,@idAlmacen,@idArticulo,
			@consecutivo,@cantidad,@cantidadExistencia,@costoUnitario,@idUnidadMedida,@descuento,@importe,
			@entradaArticuloExistencia,@salidaArticuloExistencia,@entradaArticulo,
			@salidaArticulo,@afectaCostoUltimo,@afectaCostoPromedio,@vendeSinExistencia,
			@subtotal,@iva,@ieps
    END
    CLOSE cMAD
    DEALLOCATE cMAD
	SELECT * FROM #tblTempArtsReceta 
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarMovimientoAlmacen]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 23.julio.2018
-- Description:	Agregar obtener folio
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-10-29
-- Description:	Cambio transferencia a y consumo interno por auditoria entrada y salida
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-13
-- Description:	Cambio sequence por consecutivo
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-04-16
-- Description:	cambio id caja por no caja en folio
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarMovimientoAlmacen]
	@idMovimientoAlmacenTipo AS INT,
	@nombreMovimientoAlmacenTipo AS NVARCHAR(MAX),
    @idSucursal AS INT,
    @idAlmacen AS INT,
    @idCaja AS INT,
    @folio AS NVARCHAR(12),
    @observaciones AS NVARCHAR(100),
    @subtotal AS DECIMAL(18,2),
    @descuento AS DECIMAL(18,2),
    @totalNeto AS DECIMAL(18,2),
    @idUsuarioLogueado AS INT,
    @idUsuarioAutorizo AS INT,
    --@idFacturacion AS INT,
    @idReferencia AS NVARCHAR(MAX),
    @referencia AS NVARCHAR(MAX),
    @codigoAutorizacion AS NVARCHAR(10),
    @folioFiscal AS NVARCHAR(50),
    @idSucursalOrigen AS INT,
    @idSucursalDestino AS INT,
    @idAlmacenOrigen AS INT,
    @idProveedor AS INT,
    @idCliente AS INT,
	@totalIVA AS DECIMAL(18,2),
	@totalIEPS AS DECIMAL(18,2)
    --@idConsolidacion AS INT
AS
BEGIN
	IF @idSucursal = 0
		SET @idSucursal = NULL
	IF @idSucursalOrigen = 0
		SET @idSucursalOrigen = NULL
	IF @idSucursalDestino = 0
		SET @idSucursalDestino = NULL
	IF @idAlmacenOrigen = 0
		SET @idAlmacenOrigen = NULL
	IF @idProveedor = 0
		SET @idProveedor = NULL
	IF @idCliente = 0
		SET @idCliente = NULL
	DECLARE @letraMovimiento AS NVARCHAR(1)
	SELECT @letraMovimiento = clave FROM movimiento_almacen_tipo WHERE id_movimiento_almacen_tipo = @idMovimientoAlmacenTipo
	DECLARE @noSucursal AS NVARCHAR(2)
	SELECT @noSucursal = clave_sucursal from sucursal where id_sucursal = @idSucursal;
	--SET @noSucursal = REPLICATE('0', 2 - LEN(@idSucursal)) + CAST(@idSucursal AS NVARCHAR)
	DECLARE @noCaja AS NVARCHAR(2), @noCajaInt AS INT
	SELECT @noCajaInt = no_caja FROM caja WHERE id_caja = @idCaja
	SET @noCaja = RIGHT('00' + CONVERT(NVARCHAR(10), @noCajaInt), 2)
	--OBTENER CONSECUTIVO SIGUIENTE
	DECLARE @MOVIMIENTO NVARCHAR(MAX),
			@NextId BIGINT

	SET @MOVIMIENTO =
		CASE @nombreMovimientoAlmacenTipo
			WHEN 'Test' THEN 'Test'
			WHEN 'Compra' THEN 'Compra'
			WHEN 'TransferenciaSucursalEntrada' THEN 'TransferenciaSucursalEntrada'
			WHEN 'TransferenciaSucursalSalida' THEN 'TransferenciaSucursalSalida'
			WHEN 'TransferenciaAlmacenEntrada' THEN 'TransferenciaAlmacenEntrada'
			WHEN 'TransferenciaAlmacenSalida' THEN 'TransferenciaAlmacenSalida'
			WHEN 'AuditoriaEntrada' THEN 'AuditoriaEntrada'
			WHEN 'DevolucionCliente' THEN 'DevolucionCliente'
			WHEN 'AjusteInventarioEntrada' THEN 'AjusteInventarioEntrada'
			WHEN 'AjusteInventarioSalida' THEN 'AjusteInventarioSalida'
			WHEN 'DevolucionProveedor' THEN 'DevolucionProveedor'
			WHEN 'AuditoriaSalida' THEN 'AuditoriaSalida'
			WHEN 'Venta' THEN 'Venta'
			WHEN 'Merma' THEN 'Merma'
			ELSE 'NONE'
	END

	EXEC spObtenerSiguienteConsecutivoMovimientos
		@idOrigen = @idMovimientoAlmacenTipo,
		@idSucursal = @idSucursal,
		@idCaja = @idCaja,
		@origenConsecutivo = 1,
		@siguienteNumero = @NextId OUTPUT

	IF @MOVIMIENTO = 'Venta'
		SELECT @referencia = nombre FROM almacen WHERE id_almacen = @idAlmacen AND id_sucursal = @idSucursal

	SET @folio = REPLICATE('0', 7 - LEN(@NextId)) + CAST(@NextId AS NVARCHAR)
	SET @folio = @letraMovimiento + @noSucursal + @noCaja + @folio
	INSERT INTO [dbo].[movimiento_almacen]
			   ([id_movimiento_almacen_tipo]
			   ,[id_sucursal]
			   ,[id_almacen]
			   ,[id_caja]
			   ,[folio]
			   ,[observaciones]
			   ,[subtotal]
			   ,[descuento]
			   ,[total_neto]
			   ,[fecha_registro]
			   ,[id_usuario_logueado]
			   ,[id_usuario_autorizo]
			   --,[id_facturacion]
			   ,[id_referencia]
			   ,[referencia]
			   ,[codigo_autorizacion]
			   ,[folio_fiscal]
			   ,[id_sucursal_origen]
			   ,[id_sucursal_destino]
			   ,[id_almacen_origen]
			   ,[id_proveedor]
			   ,[id_cliente]
			   --,[id_consolidacion]
			   ,[consecutivo]
			   ,[total_iva]
			   ,[total_ieps])
		 VALUES
			   (@idMovimientoAlmacenTipo
			   ,@idSucursal
			   ,@idAlmacen
			   ,@idCaja
			   ,@folio
			   ,@observaciones
			   ,@subtotal
			   ,@descuento
			   ,@totalNeto
			   ,GETDATE()
			   ,@idUsuarioLogueado
			   ,@idUsuarioAutorizo
			   --,@idFacturacion
			   ,@idReferencia
			   ,@referencia
			   ,@codigoAutorizacion
			   ,@folioFiscal
			   ,@idSucursalOrigen
			   ,@idSucursalDestino
			   ,@idAlmacenOrigen
			   ,@idProveedor
			   ,@idCliente
			   --,@idConsolidacion
			   ,@NextId
			   ,@totalIVA
			   ,@totalIEPS)
			   
		SELECT id_movimiento_almacen, folio FROM movimiento_almacen WHERE folio = @folio
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarMovimientoArqueo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 26.septiembre.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarMovimientoArqueo]
	@idSucursal as int,
	@idCaja as int,
	@montoSistema as decimal(18,4),
	@montoReal as decimal(18,4),
	@idUsuLogueado as int,
	@idUsuAutorizo as int

AS
BEGIN
Declare @id decimal;

	INSERT INTO arqueo
	(
			id_sucursal,
			id_caja,
			fecha_registro,
			monto_sistema,
			monto_real,
			id_usuario_logueado,
			id_usuario_autorizo
	)
	VALUES(
		@idSucursal,
		@idCaja,
		GETDATE(),
		@montoSistema,
		@montoReal,
		@idUsuLogueado,
		@idUsuAutorizo
	)
	set @id = @@IDENTITY;

	SELECT	Cast(@id as int)  AS 'idArqueo'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarMovimientoArqueoDesglose]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 26.Septiembre.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarMovimientoArqueoDesglose]
	@idDenominacion as int,
	@cantidad as decimal(18,4),
	@idMovimientoArqueo as int

AS
BEGIN
Declare @id decimal;

	INSERT INTO arqueo_desglose
	(
			id_arqueo,
			id_denominacion,
			cantidad
	)
	VALUES(
		@idMovimientoArqueo,
		@idDenominacion,
		@cantidad
	)
	set @id = @@IDENTITY;

	SELECT	Cast(@id as int)  AS 'idMovimientoDesglose'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarMovimientoCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 20.Agosto.2018
-- Description:	SP
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-13
-- Description:	Cambio sequence por consecutivo
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-04-16
-- Description:	cambio id caja por no caja en folio
-- =============================================	
CREATE PROCEDURE [dbo].[spGuardarMovimientoCaja]
	@idSucursal as int,
	@idCaja as int,
	@idFormaPago as int,
	@idMovCajaT as int,
	@idMovCajaC as int,
	@importeTotal as decimal(18,2),
	@dotacionInicial as int,
	@folio as nvarchar(12),
	@idUsuLogueado as int,
	@idUsuAutorizo as int,
	@observaciones as nvarchar(50) = null,
	@referencia as nvarchar(12)

AS
BEGIN
Declare @id decimal;
Declare @nombreMovimientoCajaTipo AS NVARCHAR(MAX)
	DECLARE @letraMovimiento AS NVARCHAR(1)
	SELECT @letraMovimiento = clave FROM movimiento_caja_tipo WHERE id_movimiento_caja_tipo = @idMovCajaT
	DECLARE @noSucursal AS NVARCHAR(2)
	SELECT @noSucursal = clave_sucursal from sucursal where id_sucursal = @idSucursal;
	--SET @noSucursal = REPLICATE('0', 2 - LEN(@idSucursal)) + CAST(@idSucursal AS NVARCHAR)
	DECLARE @noCaja AS NVARCHAR(2), @noCajaInt AS INT
	SELECT @noCajaInt = no_caja FROM caja WHERE id_caja = @idCaja
	SET @noCaja = RIGHT('00' + CONVERT(NVARCHAR(10), @noCajaInt), 2)
	SELECT @nombreMovimientoCajaTipo  = nombre FROM movimiento_caja_tipo WHERE id_movimiento_caja_tipo = @idMovCajaT

	--OBTENER CONSECUTIVO SIGUIENTE
	DECLARE @MOVIMIENTO NVARCHAR(MAX),
			@NextId BIGINT

	SET @MOVIMIENTO =
		CASE @nombreMovimientoCajaTipo
			WHEN 'Habilitar' THEN 'Habilitar'
			WHEN 'Cerrar' THEN 'Cerrar'
			WHEN 'Incremento' THEN 'Incremento'
			WHEN 'Retiro' THEN 'Retiro'
			WHEN 'Gasto' THEN 'Gasto'
			ELSE 'NONE'
	END

	--IF(@MOVIMIENTO = 'Habilitar')
	--	SELECT @NextId = NEXT VALUE FOR dbo.seq_MCHabilitar

	--IF(@MOVIMIENTO = 'Cerrar')
	--	SELECT @NextId = NEXT VALUE FOR dbo.seq_MCCerrar

	--IF(@MOVIMIENTO = 'Incremento')
	--	SELECT @NextId = NEXT VALUE FOR dbo.seq_MCIncremento

	--IF(@MOVIMIENTO = 'Retiro')
	--	SELECT @NextId = NEXT VALUE FOR dbo.seq_MCRetiro

	--IF(@MOVIMIENTO = 'Gasto')
	--	SELECT @NextId = NEXT VALUE FOR dbo.seq_MCGasto

	EXEC spObtenerSiguienteConsecutivoMovimientos
		@idOrigen = @idMovCajaT,
		@idSucursal = @idSucursal,
		@idCaja = @idCaja,
		@origenConsecutivo = 2,
		@siguienteNumero = @NextId OUTPUT

	SET @folio = REPLICATE('0', 7 - LEN(@NextId)) + CAST(@NextId AS NVARCHAR)
	SET @folio = @letraMovimiento + @noSucursal + @noCaja + @folio

	INSERT INTO movimiento_caja
	(
			id_sucursal,
			id_caja,
			id_forma_pago,
			id_movimiento_caja_tipo,
			id_movimiento_caja_concepto,
			importe_total,
			dotacion_inicial,
			folio,
			fecha_registro,
			id_usuario_logueado,
			id_usuario_autorizo,
			observaciones,
			consecutivo,
			referencia
	)
	VALUES(
		@idSucursal,
		@idCaja,
		@idFormaPago,
		@idMovCajaT,
		@idMovCajaC,
		@importeTotal,
		@dotacionInicial,
		@folio,
		GETDATE(),
		@idUsuLogueado,
		@idUsuAutorizo,
		@observaciones,
		@NextId,
		@referencia
	)
	set @id = @@IDENTITY;

	SELECT	Cast(@id as int)  AS 'idMovimientoCaja', @folio AS 'FolioMovimientoCaja'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarMovimientoDesglose]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 10.Agosto.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarMovimientoDesglose]
	@idDenominacion as int,
	@cantidad as numeric(20,2),
	@idMovimientoCaja as int

AS
BEGIN
Declare @id decimal;

	INSERT INTO movimiento_caja_desglose
	(
			id_movimiento_caja,
			id_denominacion,
			cantidad
	)
	VALUES(
		@idMovimientoCaja,
		@idDenominacion,
		@cantidad
	)
	set @id = @@IDENTITY;

	SELECT	Cast(@id as int)  AS 'idMovimientoDesglose'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarPerfil]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGuardarPerfil]
	@nombre AS nvarchar(50)
AS
BEGIN
	INSERT INTO [dbo].[perfil]
			   ([nombre]
			   ,[fecha_alta])
		 VALUES
			   (@nombre
			   ,GETDATE())
	SELECT CAST(SCOPE_IDENTITY() AS int) AS 'id_perfil'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarPermiso]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 31.08.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarPermiso]
	@idModulo as int,
	@idPermiso as int,
	@idPerfil as int
AS
BEGIN
Declare @id decimal;
Declare @id_modulo_permiso int;
Declare @id_perfil_modulo_permiso int;

	IF EXISTS (SELECT id_modulo_permiso FROM modulo_permiso WHERE id_permiso= @idPermiso and id_modulo = @idModulo)
	BEGIN
		SELECT @id_modulo_permiso = id_modulo_permiso FROM modulo_permiso WHERE id_permiso= @idPermiso and id_modulo = @idModulo
		IF EXISTS (SELECT id_perf_mod_perm FROM perfil_modulo_permiso WHERE id_permiso= @idPermiso and id_modulo = @idModulo and id_perfil = @idPerfil)
		BEGIN
			SELECT @id_perfil_modulo_permiso = id_perf_mod_perm FROM perfil_modulo_permiso WHERE id_permiso= @idPermiso and id_modulo = @idModulo and id_perfil = @idPerfil
			SET @id_perfil_modulo_permiso = -1
		END
		ELSE
		BEGIN
			INSERT INTO perfil_modulo_permiso
			VALUES(@idPerfil, @idModulo, @idPermiso, @id_modulo_permiso)
			set @id_perfil_modulo_permiso = @@IDENTITY;
		END
	END
	ELSE
	BEGIN 
		INSERT INTO modulo_permiso
		VALUES (@idModulo,@idPermiso)
		set @id_modulo_permiso = @@IDENTITY;

		INSERT INTO perfil_modulo_permiso
		VALUES(@idPerfil, @idModulo, @idPermiso, @id_modulo_permiso)
		set @id_perfil_modulo_permiso = @@IDENTITY;
	END

	
	SELECT	Cast(@id_perfil_modulo_permiso as int) AS 'id_perfil_modulo_permiso'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarPermisoDesdePerfil]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 07.noviembre.2018
-- Description:	Agregar permiso desde perfil
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarPermisoDesdePerfil]
	@descripcionModulo AS nvarchar(50),
	@descripcionPermiso AS nvarchar(50),
	@idPerfil AS int
AS
BEGIN
	DECLARE @idModulo AS int
	DECLARE @idPermiso AS int
	DECLARE @idModuloPermiso AS int

	SELECT @idModulo = [id_modulo] FROM [dbo].[modulo] WHERE [descripcion] = @descripcionModulo
	SELECT @idPermiso = [id_permiso] FROM [dbo].[permiso] WHERE [descripcion] = @descripcionPermiso
	SELECT @idModuloPermiso = [id_modulo_permiso] FROM [dbo].[modulo_permiso]
		WHERE [id_modulo] = @idModulo AND [id_permiso] = @idPermiso

	INSERT INTO [dbo].[perfil_modulo_permiso]
			   ([id_perfil]
			   ,[id_modulo]
			   ,[id_permiso]
			   ,[id_modulo_permiso])
		 VALUES
			   (@idPerfil
			   ,@idModulo
			   ,@idPermiso
			   ,@idModuloPermiso)

	SELECT CAST(SCOPE_IDENTITY() AS int) AS id_perfil_modulo_permiso
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarRecetaVenta]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-08-17
-- Description:	Guarda recetas
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarRecetaVenta]
	@listaRecetas	AS	RecetaVentaType READONLY
AS
BEGIN

	DECLARE @idSucursal					AS	INT;
	DECLARE @idMovimientoAlmacenDetalle AS	INT;
	DECLARE @idVenta					AS	INT;
	DECLARE @idArticulo					AS	INT;
	DECLARE @folioReceta				AS	NVARCHAR(20);
	DECLARE @cedulaProfesional			AS	NVARCHAR(20);
	DECLARE @observaciones				AS	NVARCHAR(200);
	DECLARE @idUsuarioLogueado			AS	INT;


	DECLARE recetaCursor CURSOR FOR
	SELECT * FROM @listaRecetas

	OPEN recetaCursor
	FETCH NEXT FROM recetaCursor
	INTO @idSucursal, @idMovimientoAlmacenDetalle, @idVenta, @idArticulo, @folioReceta, @cedulaProfesional, @observaciones, @idUsuarioLogueado


	WHILE @@FETCH_STATUS = 0
	BEGIN

		INSERT INTO
			receta_venta
		VALUES(
			@idSucursal,
			@idMovimientoAlmacenDetalle,
			@idVenta,
			@idArticulo,
			@folioReceta,
			@cedulaProfesional,
			@observaciones,
			GETDATE(),
			@idUsuarioLogueado
		)


		FETCH NEXT FROM recetaCursor
		INTO @idSucursal, @idMovimientoAlmacenDetalle, @idVenta, @idArticulo, @folioReceta, @cedulaProfesional, @observaciones, @idUsuarioLogueado
	END

	SELECT 'OK' AS respuesta
	
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarRegistroConsolidacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarRegistroConsolidacion]
	@idCon			as int,
	@idMovAlmacen	as int,
	@fecha			as nvarchar(max),
	@mov	as int
AS
BEGIN
Declare @id decimal;
set @id=0;

	UPDATE consolidacion  
	set hasta = (SELECT convert(datetime, @fecha, 103)),
		no_mov_consolidados = @mov
	where id_consolidacion = @idCon

	UPDATE movimiento_almacen
	SET id_consolidacion = @idCon
	where id_movimiento_almacen = @idMovAlmacen

set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'idConsolidacion'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarRegistroConsolidacionPrimero]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 14.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarRegistroConsolidacionPrimero]
	@idCon			as int,
	@idMovAlmacen	as int,
	@fecha			as nvarchar(max),
	@mov	as int
AS
BEGIN
Declare @id decimal;
set @id=0;
	UPDATE consolidacion  
	set desde = (SELECT convert(datetime, @fecha, 103)),
		hasta = (SELECT convert(datetime, @fecha, 103)),
		no_mov_consolidados = @mov
	where id_consolidacion = @idCon

	UPDATE movimiento_almacen
	SET id_consolidacion = @idCon
	where id_movimiento_almacen = @idMovAlmacen
	

set @id = @@IDENTITY;

	
	SELECT	Cast(@id as int) AS 'idConsolidacion'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarSucursal]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-07
-- Description:	Se agregó la columna afiliacion_Bancomer
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarSucursal]
	@clave as nvarchar(50),
	@nombre as nvarchar(50),
	@idZona as int,
	@ip as nvarchar(50),
	@nombreBD as nvarchar(50),
	@usuarioBD as nvarchar(50),
	@contrasena as nvarchar(50),
	@afiliacionBancomer as nvarchar(8)
AS
BEGIN
	INSERT INTO sucursal VALUES(@clave,@nombre,@idZona,@ip,@nombreBD,@usuarioBD,@contrasena,GETDATE(),1, @afiliacionBancomer)

	SELECT * FROM sucursal WHERE clave_sucursal = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarTransaccionBanco]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 22.novimebre.2018
-- Description:	Guardar Transacción Banco
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-01-21
-- Description:	Si ref o no operacion son vacias, cambiar a nullo
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarTransaccionBanco]
	@idSucursal AS int,
	@idCaja AS int,
	@importe AS decimal(18,2),
	@comision AS decimal(18,2),
	@banco AS varchar(50),
	@referencia AS nvarchar(50),
	@numeroOperacion AS nvarchar(50),
	@numeroAutorizacion AS nvarchar(50),
	@idUsuario AS int
AS
BEGIN
	DECLARE @ref	AS	NVARCHAR(50)
	DECLARE @numOp	AS	NVARCHAR(50)
	IF(@referencia = '')
	BEGIN
		SET @ref = NULL
	END
	ELSE
	BEGIN
		SET @ref = @referencia
	END

	IF(@numeroOperacion = '')
	BEGIN
		SET @numOp = NULL
	END
	ELSE
	BEGIN
		SET @numOp = @numeroOperacion
	END

	INSERT INTO [dbo].[transaccion_banco]
			   ([id_sucursal]
			   ,[id_caja]
			   ,[autorizado]
			   ,[importe]
			   ,[comision]
			   ,[banco]
			   ,[referencia]
			   ,[numero_operacion]
			   ,[numero_autorizacion]
			   ,[id_usuario]
			   ,[fecha_registro])
		 VALUES
			   (@idSucursal
			   ,@idCaja
			   ,1
			   ,@importe
			   ,@comision
			   ,@banco
			   ,@ref
			   ,@numOp
			   ,@numeroAutorizacion
			   ,@idUsuario
			   ,GETDATE())

	SELECT CAST(SCOPE_IDENTITY() AS int) AS id_transaccion
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarUsuarioHuella]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date:	15.julio.2019
-- Description:	SP para obtener huella
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarUsuarioHuella]
	@idUsuario AS int,
	@idSucursal AS int,
	@huella AS nvarchar(MAX),
	@idUsuarioAlta AS int,
	@activa AS bit
AS
BEGIN
	INSERT INTO [dbo].[usuario_huella]
           ([id_usuario]
           ,[id_sucursal]
           ,[huella]
           ,[fecha_alta]
           ,[id_usuario_alta]
           ,[activa])
     VALUES
           (@idUsuario
			,@idSucursal
			,@huella
			,GETDATE()
			,@idUsuarioAlta
			,@activa)
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardarVentaCancelacion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 20.Septiembre.2018
-- Description:	Controlar existencia para punto de venta
-- =============================================
CREATE PROCEDURE [dbo].[spGuardarVentaCancelacion]
	@idSucursal AS INT,
	@idCaja AS INT,
	@eliminados  AS INT,
	@monto AS DECIMAL(18,4)
AS
BEGIN
Declare @id decimal;
	IF EXISTS(SELECT id_venta_cancelacion FROM venta_cancelacion WHERE id_sucursal = @idSucursal and id_caja = @idCaja)
	BEGIN
		Update venta_cancelacion
		set registros = registros+@eliminados,
			monto = monto + @monto
		WHERE id_sucursal = @idSucursal and id_caja = @idCaja 
		select id_venta_cancelacion as 'id_VentaCancelacion' from venta_cancelacion  WHERE id_sucursal = @idSucursal and id_caja = @idCaja
	END
	ELSE
	BEGIN
		INSERT INTO venta_cancelacion
		(id_sucursal, id_caja, registros, monto)
		VALUES(@idSucursal, @idCaja, @eliminados, @monto)
		set @id = @@IDENTITY;
	END
	SELECT	Cast(@id as int) AS 'id_VentaCancelacion'
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaSubcategoria]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaSubcategoria]
	@desc as nvarchar(50),
	@idCat as int,
	@clave as nvarchar(50)
AS
BEGIN

	INSERT INTO subcategoria (id_categoria,clave,descripcion,fecha_alta,activo) VALUES (@idCat,@clave,@desc,GETDATE(),1)

	SELECT * FROM subcategoria WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaTicketBanco]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-20
-- Description:	Guarda cliente y consulta el ID
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaTicketBanco]
	@idMovimientoAlmacen AS INT,
	@idMovimientoCaja AS INT,
	@idValeDevTrans AS INT,
	@idTransaccionBanco AS INT,
	@nombreBanco AS NVARCHAR(MAX),
    @nombreComercio AS NVARCHAR(MAX),
    @nombreCliente AS NVARCHAR(MAX),
    @domicilioComercio AS NVARCHAR(MAX),
    @noAfiliacion AS NVARCHAR(MAX),
    @terminal AS NVARCHAR(MAX),
    @tipoTransaccion AS NVARCHAR(MAX),
    @vendedor AS NVARCHAR(MAX),
    @noTarjeta AS NVARCHAR(MAX),
    @tipoTarjeta AS NVARCHAR(MAX),
    @aprobada AS NVARCHAR(MAX),
    @ticket AS NVARCHAR(MAX),
    @fechaVencimiento AS NVARCHAR(MAX),
    @importe AS NVARCHAR(MAX),
    @totalAPagar AS NVARCHAR(MAX),
    @noAutorizacion AS NVARCHAR(MAX),
    @criptogramaChip AS NVARCHAR(MAX),
    @fechaTransaccion AS NVARCHAR(MAX),
    @horaTransaccion AS NVARCHAR(MAX),
    @noSecuenciaTNX AS NVARCHAR(MAX),
    @referenciaFinanciera AS NVARCHAR(MAX),
    @formatoTransaccion AS NVARCHAR(MAX),
    @ventaConPuntos AS BIT,
    @conChip AS BIT,
    @caja AS NVARCHAR(MAX),
    @AID AS NVARCHAR(MAX),
    @tipoFirma AS INT, --1: firma electrónica; 2: autorizada sin firma; 3: pedir firma
    @fueAprobada AS BIT,
    @montoPagadoConPuntos AS NVARCHAR(MAX),
	@saldoAnterior AS NVARCHAR(MAX),
	@saldoAnteriorEnPesos AS NVARCHAR(MAX),
	@puntosRedimidos AS NVARCHAR(MAX),
	@puntosRedimidosEnPuntos AS NVARCHAR(MAX),
	@saldoActual AS NVARCHAR(MAX),
	@saldoActualEnPesos AS NVARCHAR(MAX)
AS
BEGIN
	IF(@idMovimientoAlmacen = 0)
	BEGIN
		SELECT @idMovimientoAlmacen = NULL
	END
	IF(@idMovimientoCaja = 0)
	BEGIN
		SELECT @idMovimientoCaja = NULL
	END
	IF(@idValeDevTrans = 0)
	BEGIN
		SELECT @idValeDevTrans = NULL
	END

	INSERT INTO ticket_bancomer
	VALUES(
		@idMovimientoAlmacen,
		@idMovimientoCaja,
		@idValeDevTrans,
		@idTransaccionBanco,
		@nombreBanco,
		@nombreComercio,
		@nombreCliente,
		@domicilioComercio,
		@noAfiliacion,
		@terminal,
		@tipoTransaccion,
		@vendedor,
		@noTarjeta,
		@tipoTarjeta,
		@aprobada,
		@ticket,
		@fechaVencimiento,
		@importe,
		@totalAPagar,
		@noAutorizacion,
		@criptogramaChip,
		@fechaTransaccion,
		@horaTransaccion,
		@noSecuenciaTNX,
		@referenciaFinanciera,
		@formatoTransaccion,
		@ventaConPuntos,
		@conChip,
		@caja,
		@AID,
		@tipoFirma,
		@fueAprobada,
		@montoPagadoConPuntos,
		@saldoAnterior,
		@saldoAnteriorEnPesos,
		@puntosRedimidos,
		@puntosRedimidosEnPuntos,
		@saldoActual,
		@saldoActualEnPesos
	)

	SELECT id_ticket_bancomer FROM ticket_bancomer WHERE id_movimiento_almacen = @idMovimientoAlmacen AND id_movimiento_caja = @idMovimientoCaja AND id_transaccion_banco = @idTransaccionBanco
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaTiraBanco]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-08-31
-- Description:	Guarda Tira de Banco
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaTiraBanco]
	@id_sucursal as int
           ,@id_caja as int
           ,@id_folio_inicial as int
           ,@folio_inicial as nvarchar(12)
           ,@id_folio_final as int
           ,@folio_final as nvarchar(12)
           ,@monto_total as decimal(18,4)
           ,@folio_panamericano as nvarchar(20)
           ,@observaciones as nvarchar(100)
           ,@id_usuario_logueado as int
           ,@id_usuario_autorizo as int
AS
BEGIN
	Declare @id decimal;
	INSERT INTO [dbo].[tira_banco]
           ([id_sucursal]
           ,[id_caja]
           ,[id_folio_inicial]
           ,[folio_inicial]
           ,[id_folio_final]
           ,[folio_final]
           ,[monto_total]
           ,[folio_panamericano]
           ,[observaciones]
           ,[fecha_registro]
           ,[id_usuario_logueado]
           ,[id_usuario_autorizo])
     VALUES
           (@id_sucursal
           ,@id_caja
           ,@id_folio_inicial
           ,@folio_inicial
           ,@id_folio_final
           ,@folio_final
           ,@monto_total
           ,@folio_panamericano
           ,@observaciones
           ,getdate()
           ,@id_usuario_logueado
           ,@id_usuario_autorizo)
	set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'id_tira_banco'

END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaUnidadMedida]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 04.junio.2018
-- Description:	Se quito el campo esUnidadCompra
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaUnidadMedida]
	@descripcion as nvarchar(40),
	@pesable as tinyint,
	@claveSAT as nvarchar(10)
AS
BEGIN
	INSERT INTO unidad_medida VALUES (@descripcion, @pesable, @claveSAT, GETDATE(), 1)
	
	SELECT * FROM unidad_medida WHERE descripcion = @descripcion
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaUsuario]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:          Marco Gonzalez
-- Create date:		31 Mayo 2018
-- Description:     Cambios al guardar por la codificacion de la contrasena
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaUsuario]
	@nombre as nvarchar(50),
	@clave as nvarchar(50),
	@contrasena as nvarchar(50),
	@idPerfil as int,
	@idSucursal as int,
	@idCajaActual as int = null,
	@llave	as nvarchar(50)
AS
BEGIN
	INSERT INTO usuario
	VALUES(
		@nombre,
		@clave,
		@idPerfil,
		@idSucursal,
		@idCajaActual,
		GETDATE(),
		NULL,
		1,
		ENCRYPTBYPASSPHRASE(@llave,@contrasena)
		)

	SELECT * FROM usuario WHERE clave = @clave
END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaValeDevolucion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-08-24
-- Description:	Guardar Vale de Devolucion
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaValeDevolucion]
	@id_sucursal as int
           ,@id_caja as int
           ,@id_devolucion as int
           ,@folio as nvarchar(12)
           ,@monto as decimal(18,4)
           ,@id_cliente as int
           ,@id_usuario_logueado as int
           ,@id_usuario_autorizo as int
AS
BEGIN
	Declare @id decimal;
	Declare @cliente int;
	select @cliente = case when @id_cliente = 0 then GETANSINULL() else @id_cliente end;

	INSERT INTO [dbo].[vale_devolucion]
           ([id_sucursal]
           ,[id_caja]
           ,[id_devolucion]
           ,[folio]
           ,[monto]
           ,[aplicado]
           ,[id_cliente]
           ,[fecha_registro]
           ,[id_usuario_logueado]
           ,[id_usuario_autorizo])
     VALUES
           (@id_sucursal
           ,@id_caja
           ,@id_devolucion
           ,@folio
           ,@monto
           ,0
           ,@cliente
           ,GETDATE()
           ,@id_usuario_logueado
           ,@id_usuario_autorizo)
	set @id = @@IDENTITY;
	
	SELECT	Cast(@id as int) AS 'id_vale_devolucion'

END
GO
/****** Object:  StoredProcedure [dbo].[spGuardaValeDevolucionTransaccion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saúl Cruces
-- Create date: 22.noviembre.2018
-- Description:	Guardar Vale de Devolucion Transacción
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-12-10
-- Description:	Cambio referencia por numero de autorizacion como folio del vale
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-23
-- Description:	Guardar id vale devolución transacción en tabla ticket_bancomer
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-04-29
-- Description:	Guardar cancelada_por_usurio en transaccion_banco
-- =============================================
CREATE PROCEDURE [dbo].[spGuardaValeDevolucionTransaccion]
	@idSucursal AS int,
	@idCaja AS int,
	@importe AS decimal(18,4),
	@idUsuario AS int,
	@tablaIDsTransacciones AS ListaIDs READONLY,
	@canceladaPorUsuario AS BIT
AS
BEGIN
	DECLARE @folio AS nvarchar(12)
	DECLARE @idTransaccion AS int
	DECLARE @idMovimientoAlmacen AS INT
	SELECT @idTransaccion = id FROM @tablaIDsTransacciones
	SELECT @folio = numero_autorizacion FROM transaccion_banco WHERE id_transaccion = @idTransaccion

	INSERT INTO [dbo].[vale_devolucion_transaccion]
			   ([id_sucursal]
			   ,[id_caja]
			   ,[folio]
			   ,[importe]
			   ,[fecha_registro]
			   ,[id_usuario]
			   ,[aplicado])
		 VALUES
			   (@idSucursal
			   ,@idCaja
			   ,@folio
			   ,@importe
			   ,GETDATE()
			   ,@idUsuario
			   ,0)

	DECLARE @idVale AS int
	SET @idVale = CAST(SCOPE_IDENTITY() AS int)
	DECLARE cTransacciones CURSOR
		FOR SELECT id FROM @tablaIDsTransacciones
	OPEN cTransacciones
	FETCH NEXT FROM cTransacciones
		INTO @idTransaccion
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE [dbo].[transaccion_banco]
		   SET [id_vale_trans_devolucion] = @idVale,
			[cancelada_por_usuario] = @canceladaPorUsuario
		 WHERE [id_transaccion] = @idTransaccion

		 UPDATE ticket_bancomer
		 SET id_vale_dev_trans = @idVale
		 WHERE id_transaccion_banco = @idTransaccion

		FETCH NEXT FROM cTransacciones
			INTO @idTransaccion
	END

	SELECT @idVale AS 'id_vale_devolucion_transaccion', @folio AS 'folio_vale_devolucion_transaccion'
END
GO
/****** Object:  StoredProcedure [dbo].[spHabilitaCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 10.08.2018
-- Description:	Habilita Caja
-- =============================================
Create PROCEDURE [dbo].[spHabilitaCaja]
	@idCaja as int
AS
BEGIN
	UPDATE caja SET habilitada = 1 
	WHERE @idCaja = id_caja
	
	SELECT id_caja FROM caja WHERE @idCaja = id_caja;
End
GO
/****** Object:  StoredProcedure [dbo].[spImagenPromocion]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carlos Negrete
-- Create date: 29.Junio.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spImagenPromocion]
	@id	 as int
AS
BEGIN
SELECT	imagen
		from promocion_imagen
		where id_promocion = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[spInhabilitarCaja]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 21.diciembre.2018
-- Description:	Inhabilitar Caja
-- =============================================
CREATE PROCEDURE [dbo].[spInhabilitarCaja]
	@idCaja AS int
AS
BEGIN
	UPDATE [dbo].[caja]
	   SET [habilitada] = 0
	 WHERE id_caja = @idCaja
END
GO
/****** Object:  StoredProcedure [dbo].[spIniciarEvMon]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-07-27
-- Description:	Se guarda ev mon
-- =============================================
CREATE PROCEDURE [dbo].[spIniciarEvMon]
	@idSucursal			INT,
	@idCaja				INT,
	@idModulo			INT,
	@idNivelSeguridad	INT,
	@intervalo			INT,
	@idUsuarioLogueado	INT
AS
BEGIN
	INSERT INTO evmoni VALUES(
		@idSucursal,
		@idCaja,
		@idModulo,
		@idNivelSeguridad,
		@intervalo,
		@idUsuarioLogueado,
		GETDATE(),
		null
	)
	SELECT CONVERT(INT, SCOPE_IDENTITY()) as id_ev_mon
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarProductoRecarga]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Aldo Barugola
-- Create date: 2018-10-16
-- Description:	Inserta los nuevos productos de Recargas
-- =============================================
CREATE PROCEDURE [dbo].[spInsertarProductoRecarga]
	@name as nvarchar(50),
	@info as nvarchar(100),
	@costo as decimal(18,4),
	@monto as int,
	@opid as int,
	@regex as nvarchar(50),
	@sku as nvarchar(50),
	@stype as int
AS
BEGIN
	DECLARE @id as int;

	select @id = id_producto_recarga from producto_recargas where sku = @sku;

	IF @id is null 	
		INSERT INTO [dbo].[producto_recargas]
			   ([name]
			   ,[info]
			   ,[costo]
			   ,[monto]
			   ,[opid]
			   ,[regex]
			   ,[sku]
			   ,[stype]
			   ,[fecha_registro])
		 VALUES
			   (@name
			   ,@info
			   ,@costo
			   ,@monto
			   ,@opid
			   ,@regex
			   ,@sku
			   ,@stype
			   ,getdate());
	ELSE 
		UPDATE [dbo].[producto_recargas]
		   SET [name] = @name
			  ,[info] = @info
			  ,[costo] = @costo
			  ,[monto] = @monto
			  ,[opid] = @opid
			  ,[regex] = @regex
			  ,[sku] = @sku
			  ,[stype] = @stype
			  ,[fecha_registro] = GETDATE()
		 WHERE id_producto_recarga = @id;

END
GO
/****** Object:  StoredProcedure [dbo].[spKardexArticulo]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez      
-- Create date: 06/Diciembre/2019
-- Description:	Genera el kardex de movimientos de un 
--              articulo por almacen o todos
-- =============================================
CREATE PROCEDURE [dbo].[spKardexArticulo]
	@clave VARCHAR(10),
	@id_almacen INT,
	@fi DATE,
	@ff DATE
AS
BEGIN
	--Declaramos la tabla que contendra el resultado de las consultas
	--y sobre la cual realizaremos las operaciones de conteo
	DECLARE @tabla TABLE(
		Fecha DATETIME,
		Tipo VARCHAR(10),
		Articulo VARCHAR(10),
		Almacen VARCHAR(10),
		Folio VARCHAR(100),
		Referencia VARCHAR(100),
		Observaciones VARCHAR(500),
		Cantidad DECIMAL(10,2),
		Unidad VARCHAR(10),
		usr VARCHAR(50),
		id_mad INT
	)

	--Insertamos la cantidad inicial existente al momento si hay a la fecha solicitada
	IF @id_almacen = 0
	BEGIN
		INSERT INTO @tabla 
		SELECT * FROM (SELECT TOP 1 fecha_registro,'' AS 'x1',art.clave AS 'x2',alm.clave,
		'' AS 'x3','' AS 'x4','Cantidad inicial' AS 'x5',existencia_al_momento,um.descripcion,'' AS 'usr',mad.id_movimiento_almacen_detalle
		FROM movimiento_almacen ma INNER JOIN movimiento_almacen_detalle mad ON ma.id_movimiento_almacen=mad.id_movimiento_almacen
		INNER JOIN articulo art ON mad.id_articulo=art.id_articulo INNER JOIN unidad_medida um ON mad.id_unidad_medida=um.id_unidad_medida
		INNER JOIN almacen alm ON mad.id_almacen=alm.id_almacen WHERE CONVERT(DATE,fecha_registro)<@fi AND art.clave=@clave AND 
		alm.id_almacen=1 ORDER BY fecha_registro DESC,id_movimiento_almacen_detalle DESC) AS TBL1
		UNION ALL
		SELECT * FROM (SELECT TOP 1 fecha_registro,'' AS 'x1',art.clave AS 'x2',alm.clave,
		'' AS 'x3','' AS 'x4','Cantidad inicial' AS 'x5',existencia_al_momento,um.descripcion,'' AS 'usr',mad.id_movimiento_almacen_detalle
		FROM movimiento_almacen ma INNER JOIN movimiento_almacen_detalle mad ON ma.id_movimiento_almacen=mad.id_movimiento_almacen
		INNER JOIN articulo art ON mad.id_articulo=art.id_articulo INNER JOIN unidad_medida um ON mad.id_unidad_medida=um.id_unidad_medida
		INNER JOIN almacen alm ON mad.id_almacen=alm.id_almacen WHERE CONVERT(DATE,fecha_registro)<@fi AND art.clave=@clave AND 
		alm.id_almacen=2 ORDER BY fecha_registro DESC,id_movimiento_almacen_detalle DESC) AS TBL2
	END
	ELSE
	BEGIN
		INSERT INTO @tabla 
		SELECT TOP 1 fecha_registro,'' AS 'x1',art.clave AS 'x2',alm.clave,'' AS 'x3','' AS 'x4','Cantidad inicial' AS 'x5',
		existencia_al_momento,um.descripcion,'' AS 'usr',mad.id_movimiento_almacen_detalle FROM movimiento_almacen ma 
		INNER JOIN movimiento_almacen_detalle mad ON ma.id_movimiento_almacen=mad.id_movimiento_almacen INNER JOIN articulo art ON 
		mad.id_articulo=art.id_articulo INNER JOIN unidad_medida um ON mad.id_unidad_medida=um.id_unidad_medida INNER JOIN almacen alm ON 
		mad.id_almacen=alm.id_almacen WHERE CONVERT(DATE,fecha_registro)<@fi AND art.clave=@clave AND alm.id_almacen=@id_almacen 
		ORDER BY fecha_registro DESC,id_movimiento_almacen_detalle DESC
	END

	--Si no existe existencia al momento a la fecha solicitada se toma la existencia inicial
	IF @@ROWCOUNT = 0
	BEGIN
		IF @id_almacen = 0
		BEGIN
			INSERT INTO @tabla
			SELECT art.fecha_alta,'',art.clave,alm.clave,'','','Cantidad inicial',existencia_inicial,um.descripcion,
			'' AS 'usr',0 FROM articulo art INNER JOIN  articulo_existencia artex ON art.id_articulo=artex.id_articulo
			INNER JOIN almacen alm ON artex.id_almacen=alm.id_almacen INNER JOIN unidad_medida um ON 
			art.id_unidad_venta=um.id_unidad_medida WHERE art.clave=@clave;
		END
		ELSE
		BEGIN
			INSERT INTO @tabla
			SELECT art.fecha_alta,'',art.clave,alm.clave,'','','Cantidad inicial',existencia_inicial,um.descripcion,
			'' AS 'usr',0 FROM articulo art INNER JOIN  articulo_existencia artex ON art.id_articulo=artex.id_articulo
			INNER JOIN almacen alm ON artex.id_almacen=alm.id_almacen INNER JOIN unidad_medida um ON 
			art.id_unidad_venta=um.id_unidad_medida WHERE art.clave=@clave AND alm.id_almacen=@id_almacen;
		END
	END

	--Insertamos todos los movimientos del articulo a la tabla
	IF @id_almacen = 0
	BEGIN
		INSERT INTO @tabla 
		SELECT fecha_registro,mat.clave,art.clave,alm.clave,folio,ISNULL(referencia,''),
		ISNULL(REPLACE(REPLACE(REPLACE(observaciones,CHAR(9),''),CHAR(10),''),CHAR(13),''),''),
		CASE WHEN es_entrada=1 THEN cantidad ELSE cantidad*(-1) END,descripcion AS 'Unidad',usr.clave AS 'usr',
		mad.id_movimiento_almacen_detalle FROM movimiento_almacen ma INNER JOIN movimiento_almacen_detalle mad ON 
		ma.id_movimiento_almacen=mad.id_movimiento_almacen INNER JOIN movimiento_almacen_tipo mat ON 
		ma.id_movimiento_almacen_tipo=mat.id_movimiento_almacen_tipo INNER JOIN almacen alm ON mad.id_almacen=alm.id_almacen 
		INNER JOIN articulo art ON mad.id_articulo=art.id_articulo INNER JOIN unidad_medida um ON 
		mad.id_unidad_medida=um.id_unidad_medida INNER JOIN usuario usr ON ma.id_usuario_logueado=usr.id_usuario WHERE 
		art.clave=@clave AND CONVERT(DATE,fecha_registro) BETWEEN @fi AND @ff AND mad.cantidad >= 0 ORDER BY fecha_registro ASC;
	END
	ELSE
	BEGIN
		INSERT INTO @tabla 
		SELECT fecha_registro,mat.clave,art.clave,alm.clave,folio,ISNULL(referencia,''),
		ISNULL(REPLACE(REPLACE(REPLACE(observaciones,CHAR(9),''),CHAR(10),''),CHAR(13),''),''),
		CASE WHEN es_entrada=1 THEN cantidad ELSE cantidad*(-1) END,descripcion AS 'Unidad',usr.clave AS 'usr',
		mad.id_movimiento_almacen_detalle FROM movimiento_almacen ma INNER JOIN movimiento_almacen_detalle mad ON 
		ma.id_movimiento_almacen=mad.id_movimiento_almacen INNER JOIN movimiento_almacen_tipo mat ON 
		ma.id_movimiento_almacen_tipo=mat.id_movimiento_almacen_tipo INNER JOIN almacen alm ON mad.id_almacen=alm.id_almacen 
		INNER JOIN articulo art ON mad.id_articulo=art.id_articulo INNER JOIN unidad_medida um ON mad.id_unidad_medida=um.id_unidad_medida 
		INNER JOIN usuario usr ON ma.id_usuario_logueado=usr.id_usuario WHERE art.clave=@clave AND alm.id_almacen=@id_almacen AND 
		CONVERT(DATE,fecha_registro) BETWEEN @fi AND @ff AND mad.cantidad >= 0 ORDER BY fecha_registro ASC;
	END

	--Mostramos los datos consultados y realizamos el calculo del total de los movimientos
	SELECT FORMAT(Fecha, 'dd/MM/yyyy') AS 'Fecha',FORMAT(Fecha, 'HH:mm:ss') AS 'Hora',Tipo,Articulo,Almacen,Folio,Referencia,
	Observaciones,Cantidad,Unidad,SUM(SUM(Cantidad)) OVER (ORDER BY id_mad ASC) AS 'Existencia Al Momento',usr AS 'Usuario'
	FROM @tabla GROUP BY Fecha,Tipo,Articulo,Almacen,Folio,Referencia,Observaciones,Cantidad,Unidad,usr,id_mad;
END
GO
/****** Object:  StoredProcedure [dbo].[spLoginArmonia]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez      
-- Create date: 09/Junio/2020
-- Description:	Login para la aplicacion de Armonia
-- =============================================
CREATE PROCEDURE [dbo].[spLoginArmonia]
	@usr VARCHAR(100),
	@pwd VARCHAR(100)
AS
BEGIN
	SELECT id_usuario,nombre,id_perfil FROM usuario WHERE id_perfil IN ('1','10','14','15') AND 
	clave=@usr AND DECRYPTBYPASSPHRASE('S4GR4V.C.2018',contrasena)=@pwd
END

GO
/****** Object:  StoredProcedure [dbo].[spObtenerListaEvMonsFiltros]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 27.julio.2019
-- Description:	SP obtener lista de mons con filtros
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerListaEvMonsFiltros]
	@idModulo AS int,
	@idCaja AS int,
	@fInicio AS datetime,
	@fFin AS datetime
AS
BEGIN
	SELECT [id_evmoni]
		  ,em.[id_sucursal]
		  ,[id_caja]
		  ,em.[id_modulo]
		  ,em.[id_nivel_seguridad]
		  ,[intervalo]
		  ,[id_usuario_logueado]
		  ,[fecha_inicio]
		  ,[fecha_fin]
		  ,m.[descripcion]
		  ,ns.[nombre] AS nom_ns
		  ,u.[nombre] AS nom_usu
		  ,(SELECT COUNT(*) FROM evmoni_detalle WHERE id_evmoni = em.id_evmoni) AS num_mons
	  FROM [dbo].[evmoni] em
	  LEFT JOIN [dbo].[modulo] m ON m.[id_modulo] = em.[id_modulo]
	  LEFT JOIN [dbo].[nivel_seguridad] ns ON ns.[id_nivel_seguridad] = em.[id_nivel_seguridad]
	  LEFT JOIN [dbo].[usuario] u ON u.[id_usuario] = em.[id_usuario_logueado]
	  WHERE (em.[id_modulo] = @idModulo OR @idModulo = 0) AND
			(em.[id_caja] = @idCaja OR @idCaja = 0) AND
			em.[fecha_inicio] >= @fInicio AND em.[fecha_fin] <= @fFin
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerListaModuloNivelSeguridad]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 27.julio.2019
-- Description:	SP obtener lista de modulos con su nivel de seguridad
-- =============================================

-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-09-20
-- Description:	Se agregó la busqueda por sucursal
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerListaModuloNivelSeguridad]
	@idSucursal AS INT
AS
BEGIN

	DECLARE @count AS INT
	DECLARE @nivelSeguridad AS INT

	SELECT
		@count = COUNT(*)
	FROM modulo_nivel_seguridad mns
		LEFT JOIN modulo m ON m.id_modulo = mns.id_modulo
		LEFT JOIN nivel_seguridad ns ON mns.id_nivel_seguridad = ns.id_nivel_seguridad
	WHERE
		ns.id_sucursal = @idSucursal
	
	SET @nivelSeguridad = 0

	SELECT TOP 1 @nivelSeguridad = id_nivel_seguridad FROM nivel_seguridad WHERE id_sucursal = @idSucursal ORDER BY id_nivel_seguridad ASC
	
	IF(@count = 0 AND @nivelSeguridad != 0)
	BEGIN
		INSERT INTO modulo_nivel_seguridad
		SELECT @nivelSeguridad, id_modulo, @idSucursal FROM modulo
	END


	SELECT mns.id_nivel_seguridad
		  ,mns.id_modulo
		  ,m.descripcion
	FROM modulo_nivel_seguridad mns
		LEFT JOIN modulo m ON m.id_modulo = mns.id_modulo
	WHERE
		mns.id_sucursal = @idSucursal
	ORDER BY m.descripcion ASC
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerListaNivelSeguridad]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 27.julio.2019
-- Description:	SP obtener lista de niveles de seguridad
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-09-17
-- Description:	Insertar default si no existe
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerListaNivelSeguridad]
	@idSucursal AS int
AS
BEGIN
	DECLARE @count AS INT

	SELECT @count = count(*) FROM nivel_seguridad WHERE id_sucursal = @idSucursal

	IF @count = 0
	BEGIN

		INSERT INTO [dbo].[nivel_seguridad]
				   ([id_sucursal]
				   ,[nombre]
				   ,[intervalo_toma]
				   ,[fecha_alta]
				   ,[fecha_modificacion])
			 VALUES
				   (@idSucursal
				   ,'NULO'
				   ,-1
				   ,GETDATE()
				   ,GETDATE())

		INSERT INTO [dbo].[nivel_seguridad]
				   ([id_sucursal]
				   ,[nombre]
				   ,[intervalo_toma]
				   ,[fecha_alta]
				   ,[fecha_modificacion])
			 VALUES
				   (@idSucursal
				   ,'BAJO'
				   ,600
				   ,GETDATE()
				   ,GETDATE())

		INSERT INTO [dbo].[nivel_seguridad]
				   ([id_sucursal]
				   ,[nombre]
				   ,[intervalo_toma]
				   ,[fecha_alta]
				   ,[fecha_modificacion])
			 VALUES
				   (@idSucursal
				   ,'MEDIO'
				   ,180
				   ,GETDATE()
				   ,GETDATE())

		INSERT INTO [dbo].[nivel_seguridad]
				   ([id_sucursal]
				   ,[nombre]
				   ,[intervalo_toma]
				   ,[fecha_alta]
				   ,[fecha_modificacion])
			 VALUES
				   (@idSucursal
				   ,'ALTO'
				   ,10
				   ,GETDATE()
				   ,GETDATE())

		INSERT INTO [dbo].[nivel_seguridad]
				   ([id_sucursal]
				   ,[nombre]
				   ,[intervalo_toma]
				   ,[fecha_alta]
				   ,[fecha_modificacion])
			 VALUES
				   (@idSucursal
				   ,'INTENSO'
				   ,3
				   ,GETDATE()
				   ,GETDATE())

	END

	SELECT [id_nivel_seguridad]
		  ,[id_sucursal]
		  ,[nombre]
		  ,[intervalo_toma]
		  ,[fecha_alta]
		  ,[fecha_modificacion]
	  FROM [dbo].[nivel_seguridad]
	  WHERE [id_sucursal] = @idSucursal
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerMonEvDetalles]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-07-27
-- Description:	Consulta mon ev detalle
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerMonEvDetalles]
	@idEvMon INT
AS
BEGIN
	SELECT
		id_evmoni_detalle,
		id_evmoni,
		evmoni,
		fecha_registro
	FROM
		evmoni_detalle
	WHERE
		id_evmoni = @idEvMon
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerPremiosDinamica]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carolina Franco
-- Create date:	2019-06-29
-- Description:	Se redondea el monto
-- =============================================

-- =============================================
-- Author:		Carolina Franco
-- Create date:	2019-06-27
-- Description:	Regresa los premios de la dinamica
-- =============================================

-- =============================================
-- Author:		Marco Gonzalez
-- Create date:	2019-06-26
-- Description:	Regresa los premios de la dinamica
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerPremiosDinamica]
	@folioVenta as nvarchar(20)
AS
BEGIN
	---------------- DATOS DINAMICA ---------------- 
	DECLARE @montoPorBoleto AS DECIMAL(18,6)
	SET @montoPorBoleto = 500
	---------------- INFO DINAMICA ---------------- 
	DECLARE @nombrePremio AS NVARCHAR(50)
	DECLARE @idDinamica AS INT

	SELECT TOP 1 @idDinamica = id_dinamica, @nombrePremio = nombre_premio 
	FROM dinamica
	WHERE
		activo = 1
		and GETDATE() BETWEEN inicio_vigencia and fin_vigencia
	ORDER BY 
		id_dinamica DESC
	-----------------INICIO BUSQUEDA CANTIDAD BOLETOS------------------------------
	DECLARE @numBoletos INT
	DECLARE @montoComprado AS DECIMAL(18,6)

	SET @numBoletos = 0
	SET @montoComprado = 0

	SELECT
		@montoComprado = ISNULL(SUM(mad.importe),0)
	FROM
		movimiento_almacen_detalle mad
		LEFT JOIN movimiento_almacen ma ON mad.id_movimiento_almacen = ma.id_movimiento_almacen
		LEFT JOIN articulo a ON mad.id_articulo = a.id_articulo
	WHERE
		ma.folio = @folioVenta
		AND a.id_linea_negocio NOT IN (7,8,12,13)

	SET @montoComprado = ROUND(@montoComprado, 0)
	SELECT
		@numBoletos = @montoComprado / @montoPorBoleto
	
	IF(@numBoletos > 0)
	BEGIN
		INSERT INTO premio
		VALUES
			(
				@idDinamica, -- Dinamica
				(SELECT id_movimiento_almacen FROM movimiento_almacen WHERE folio = @folioVenta), -- Id Movimiento Almacen
				@numBoletos, -- No Boletos dados
				GETDATE() -- Fecha de registro
			)
		SELECT 'Con esta compra obtuvo ' + CONVERT(NVARCHAR(20), @numBoletos) + CONVERT(NVARCHAR(50), @nombrePremio) + '. ¡FELICIDADES!' AS textoBoletos
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerSiguienteConsecutivoMovimientos]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-12
-- Description:	Obtiene consecutivo para movimiento de almacen, de caja o la consolidaci�n
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-03-16
-- Description:	Si es nulo, regresar 1
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerSiguienteConsecutivoMovimientos]
	@idOrigen AS int,
	@idSucursal AS int,
	@idCaja AS int,
	@origenConsecutivo	AS	int,
	@siguienteNumero AS nvarchar(max) OUTPUT
AS
BEGIN
	--DATO DE ORIGEN CONSECUTIVO
	--1: Movimiento Almacen
	--2: Movimiento Caja
	--3: Consolidacion
	DECLARE @max AS INT
	SET @max = 0
	IF(@origenConsecutivo = 1)
	BEGIN
		SELECT @max = MAX(consecutivo) FROM movimiento_almacen WHERE id_sucursal = @idSucursal AND id_caja = @idCaja AND id_movimiento_almacen_tipo = @idOrigen
	END
	ELSE IF(@origenConsecutivo = 2)
	BEGIN
		SELECT @max = MAX(consecutivo) FROM movimiento_caja WHERE id_sucursal = @idSucursal AND id_caja = @idCaja AND id_movimiento_caja_tipo = @idOrigen
	END
	ELSE IF(@origenConsecutivo = 3)
	BEGIN
		SELECT @max = MAX(consecutivo) FROM consolidacion WHERE id_sucursal = @idSucursal
	END
	SET @max = @max + 1
	IF(@max IS NULL)
	BEGIN
		SET @max = 1
	END
	SET @siguienteNumero = @max

END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerUsuarioHuella]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date:	15.julio.2019
-- Description:	SP para obtener huella
-- =============================================
CREATE PROCEDURE [dbo].[spObtenerUsuarioHuella]
	@idUsuario AS int
AS
BEGIN
	SELECT [id_usuario_huella]
		  ,[id_usuario]
		  ,[id_sucursal]
		  ,[huella]
		  ,[fecha_alta]
		  ,[id_usuario_alta]
		  ,[activa]
	  FROM [dbo].[usuario_huella]
	  WHERE [id_usuario] = @idUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[spQuitarCotizacionApartada]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sa�l Cruces
-- Create date: 31.octubre.2018
-- Description:	Quitar cotizaci�n apartada
-- =============================================
CREATE PROCEDURE [dbo].[spQuitarCotizacionApartada]
	@idCotizacion AS int
AS
BEGIN
	UPDATE [dbo].[cotizacion]
	   SET [cotizacion_apartada] = 0
	 WHERE [id_cotizacion] = @idCotizacion
END
GO
/****** Object:  StoredProcedure [dbo].[spReporteCompra]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 20.10.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spReporteCompra]
	@suc as int,
	@dateIni as datetime,
	@dateFin as datetime
AS
BEGIN
IF @suc=0
begin
SELECT			ROW_NUMBER() OVER(ORDER BY id_movimiento_almacen asc) as 'row', 
				convert(NVARCHAR, fecha_registro, 103) as 'fecha',
				convert(char(8), fecha_registro, 108) as 'horaCaptura',
				folio as 'documento',
				movimiento_almacen.folio_fiscal as 'NoFactura',
				referencia,
				proveedor.clave as 'claveProv',
				proveedor.nombre as 'nombreProv',
				total_neto as 'neto',
				observaciones as 'obs',
				convert(char(8), RF_FECREG, 108) as 'horaRegistro',
				RF_IMPORT
FROM            movimiento_almacen INNER JOIN
                proveedor ON movimiento_almacen.id_proveedor = proveedor.id_proveedor LEFT JOIN
				REGFACTCOMPRAS rf ON rf.RF_FOLFIS= movimiento_almacen.folio_fiscal
				where id_movimiento_almacen_tipo = 1 and
				@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin 
				group by id_movimiento_almacen, fecha_registro, folio, folio_fiscal, clave, nombre, total_neto, observaciones, referencia, RF_FECREG,RF_IMPORT
				order by fecha_registro asc
END
ELSE
BEGIN
SELECT			ROW_NUMBER() OVER(ORDER BY id_movimiento_almacen asc) as 'row', 
				convert(NVARCHAR, fecha_registro, 103) as 'fecha',
				convert(char(8), fecha_registro, 108) as 'horaCaptura',
				folio as 'documento',
				movimiento_almacen.folio_fiscal as 'NoFactura',
				proveedor.clave as 'claveProv',
				proveedor.nombre as 'nombreProv',
				total_neto as 'neto',
				observaciones as 'obs',
				referencia,
				convert(char(8), RF_FECREG, 108) as 'horaRegistro', 
				RF_IMPORT
FROM            movimiento_almacen INNER JOIN
                proveedor ON movimiento_almacen.id_proveedor = proveedor.id_proveedor lEFT JOIN 
				REGFACTCOMPRAS rf ON rf.RF_FOLFIS= movimiento_almacen.folio_fiscal
				where id_movimiento_almacen_tipo = 1 and id_sucursal = @suc and
				@dateIni <= fecha_registro  and 
				fecha_registro <= @dateFin 
				group by id_movimiento_almacen, fecha_registro, folio, folio_fiscal, clave, nombre, total_neto, observaciones, referencia,RF_FECREG, RF_IMPORT
				order by fecha_registro asc
END
END
GO
/****** Object:  StoredProcedure [dbo].[spReporteGerencial]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez      
-- Create date: 22/Abril/2020
-- Description:	Genera el reporte gerencial
--              dentro de un periodo
-- =============================================
CREATE PROCEDURE [dbo].[spReporteGerencial]
	@fi DATE,
	@ff DATE
AS
BEGIN
	--Tabla temporal con los datos del reporte
	DECLARE @tabla TABLE(
		Sucursal INT,
		Fecha VARCHAR(30),
		Hora VARCHAR(30),
		RFC VARCHAR(50),
		Caja VARCHAR(30),
		Cajero VARCHAR(30),
		Folio VARCHAR(30),
		Referencia VARCHAR(30),
		ValorVenta DECIMAL(18,6),
		TIEPS6Venta DECIMAL(18,6),
		TIEPS8Venta DECIMAL(18,6),
		TIVAVenta DECIMAL(18,6),
		ValorVentaNeta DECIMAL(18,6),
		Consolidacion VARCHAR(100),
		FolioFacturacion VARCHAR(200)
	)

	--Resultados de la consulta y se insertan en la tabla temporal
	INSERT INTO @tabla 
	SELECT
	suc.clave_sucursal AS 'Sucursal',
	FORMAT(ma.fecha_registro, 'dd/MM/yyyy') AS 'Fecha',
	FORMAT(ma.fecha_registro, 'HH:mm') AS 'Hora',
	ISNULL(CASE WHEN id_facturacion IS NOT NULL THEN (SELECT rfc FROM facturacion, cliente, datos_facturacion WHERE facturacion.id_cliente = cliente.id_cliente AND cliente.id_datos_facturacion = datos_facturacion.id_datos_facturacion AND id_facturacion = ma.id_facturacion) ELSE (SELECT rfc FROM consolidacion, facturacion, cliente, datos_facturacion WHERE consolidacion.id_facturacion = facturacion.id_facturacion AND facturacion.id_cliente = cliente.id_cliente AND cliente.id_datos_facturacion = datos_facturacion.id_datos_facturacion AND id_consolidacion = ma.id_consolidacion) END, 'N/A') AS 'RFC',
	cj.no_caja AS 'Caja',
	usr.clave AS 'Cajero',
	ma.folio AS 'Folio',
	ma.referencia AS 'Referencia',
	SUM(CASE WHEN mat.clave='D' THEN mad.subtotal*(-1) ELSE mad.subtotal END) AS 'ValorVenta',
	CASE WHEN tasa_ieps=6 THEN SUM(CASE WHEN mat.clave='D' THEN mad.ieps*(-1) ELSE mad.ieps END) ELSE 0 END AS 'T. IEPS 6% Venta',
	CASE WHEN tasa_ieps=8 THEN SUM(CASE WHEN mat.clave='D' THEN mad.ieps*(-1) ELSE mad.ieps END) ELSE 0 END AS 'T. IEPS 8% Venta',
	SUM(CASE WHEN mat.clave='D' THEN mad.iva*(-1) ELSE mad.iva END) AS 'T. IVA Venta',
	SUM(CASE WHEN mat.clave='D' THEN mad.importe*(-1) ELSE mad.importe END) AS 'ValorVentaNeta',
	ISNULL(CASE WHEN id_consolidacion IS NOT NULL THEN (SELECT folio FROM consolidacion WHERE id_consolidacion = ma.id_consolidacion) ELSE dbo.fnObtenerFoliosFacturacion(id_facturacion) END, 'N/A') AS 'Consolidacion',
	ISNULL(CASE WHEN id_facturacion IS NOT NULL THEN(SELECT folio_fiscal FROM facturacion WHERE id_facturacion = ma.id_facturacion) ELSE (SELECT folio_fiscal FROM consolidacion, facturacion WHERE consolidacion.id_facturacion = facturacion.id_facturacion AND id_consolidacion = ma.id_consolidacion)END, 'N/A') AS 'Folio Fact.'
	FROM movimiento_almacen ma
	INNER JOIN movimiento_almacen_detalle mad ON ma.id_movimiento_almacen=mad.id_movimiento_almacen
	INNER JOIN movimiento_almacen_tipo mat ON ma.id_movimiento_almacen_tipo=mat.id_movimiento_almacen_tipo
	INNER JOIN usuario usr ON ma.id_usuario_logueado=usr.id_usuario
	INNER JOIN sucursal suc ON ma.id_sucursal=suc.id_sucursal
	INNER JOIN caja cj ON ma.id_caja = cj.id_caja
	WHERE
	mat.clave IN ('V','D') AND
	mad.importe > 0 AND
	CONVERT(DATE,ma.fecha_registro) BETWEEN @fi AND @ff
	GROUP BY suc.clave_sucursal,ma.fecha_registro,cj.no_caja,ma.id_facturacion,ma.id_consolidacion,mat.clave,ma.folio,ma.referencia,tasa_ieps,usr.clave
	ORDER BY mat.clave,fecha_registro ASC

	SELECT * FROM @tabla ORDER BY Folio,Fecha ASC
END

GO
/****** Object:  StoredProcedure [dbo].[spReporteVentaUtilidad]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ricardo Benitez      
-- Create date: 20/Abril/2020
-- Description:	Genera el reporte de venta-utilidad
--              dentro de un periodo
-- =============================================
CREATE PROCEDURE [dbo].[spReporteVentaUtilidad]
	@fi DATE,
	@ff DATE
AS
BEGIN
	--Tabla temporal con los datos del reporte
	DECLARE @tabla TABLE(
		Almacen VARCHAR(20),
		Categoria VARCHAR(20),
		Articulo VARCHAR(20),
		Descripcion VARCHAR(200),
		F_Venta DECIMAL(12,4),
		Cantidad DECIMAL(10,2),
		Costo DECIMAL(18,6),
		Subtotal DECIMAL(18,6),
		Tasa_IVA DECIMAL(5,2),
		IVA DECIMAL(18,6),
		Tasa_IEPS DECIMAL(5,2),
		IEPS DECIMAL(18,6),
		Total DECIMAL(18,6)
	)

	--Resultados de la consulta y se insertan en la tabla temporal
	INSERT INTO @tabla 
	SELECT
	alm.clave AS 'Almacen',
	ln.clave AS 'Categoria',
	art.clave AS 'Articulo',
	desc_mayoreo AS 'Descripcion',
	relacion_venta AS 'F Venta',
	SUM(CASE WHEN mat.clave='D' THEN cantidad*(-1) ELSE cantidad END) AS 'Cantidad',
	SUM(CASE WHEN mat.clave='D' THEN mad.costo*(-1) ELSE mad.costo END)  AS 'Costo',
	SUM(CASE WHEN mat.clave='D' THEN mad.subtotal*(-1) ELSE mad.subtotal END) AS 'Subtotal',
	tasa_iva AS 'Tasa IVA',
	SUM(CASE WHEN mat.clave='D' THEN mad.iva*(-1) ELSE mad.iva END) AS 'IVA',
	tasa_ieps AS 'Tasa IEPS',
	SUM(CASE WHEN mat.clave='D' THEN mad.ieps*(-1) ELSE mad.ieps END) AS 'IEPS',
	SUM(CASE WHEN mat.clave='D' THEN mad.importe*(-1) ELSE mad.importe END) AS 'Total'
	FROM movimiento_almacen ma
	INNER JOIN movimiento_almacen_detalle mad ON ma.id_movimiento_almacen=mad.id_movimiento_almacen
	INNER JOIN movimiento_almacen_tipo mat ON ma.id_movimiento_almacen_tipo=mat.id_movimiento_almacen_tipo
	INNER JOIN almacen alm ON mad.id_almacen=alm.id_almacen
	INNER JOIN articulo art ON mad.id_articulo=art.id_articulo
	INNER JOIN linea_negocio ln ON art.id_linea_negocio = ln.id_linea_negocio
	WHERE
	mat.clave IN ('V','D') AND
	mad.importe > 0 AND
	CONVERT(DATE, fecha_registro) BETWEEN @fi AND @ff
	GROUP BY alm.clave,ln.clave,art.clave,desc_mayoreo,relacion_venta,tasa_iva,tasa_ieps

	--Entregamos los resultados al usuario
	SELECT Almacen,Categoria,Articulo,Descripcion,F_Venta,Cantidad,Cantidad/F_Venta AS 'Cajas',Costo,Subtotal,
	Tasa_IVA,IVA,Tasa_IEPS,IEPS,Total FROM @tabla WHERE Cantidad != 0 ORDER BY Articulo,Almacen ASC
END

GO
/****** Object:  StoredProcedure [dbo].[spSucursales]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CARLOS NEGRETE
-- Create date: 25.05.2018
-- Description:	SP
-- =============================================
CREATE PROCEDURE [dbo].[spSucursales]
AS
BEGIN
DECLARE @Sucursales TABLE  
    ( idSuc   INT,  
      nombreSuc   NVARCHAR(50));
	    
INSERT INTO @Sucursales (idSuc, nombreSuc) VALUES(0,'TODOS')
INSERT INTO @Sucursales (idSuc,nombreSuc) SELECT id_sucursal, nombre from sucursal
select idSuc, nombreSuc from @Sucursales
END
GO
/****** Object:  StoredProcedure [dbo].[spTerminarEvMon]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-07-27
-- Description:	Inserta la fecha final
-- =============================================
CREATE PROCEDURE [dbo].[spTerminarEvMon]
	@idEvMon INT
AS
BEGIN
	UPDATE
		evmoni
	SET
		fecha_fin = GETDATE()
	WHERE
		id_evmoni = @idEvMon
END
GO
/****** Object:  StoredProcedure [dbo].[spUpsertConfiguracionSeguridad]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2019-07-27
-- Description:	Inserta o actualiza configuracion de seguridad
-- =============================================
CREATE PROCEDURE [dbo].[spUpsertConfiguracionSeguridad]
	@idConfiguracionSeguridad INT,
	@idSucursal INT,
	@monitoreoActivo BIT,
	@forzarModulos BIT,
	@formatoMonitoreo NVARCHAR(50),
	@maxDiasAlmacenados INT,
	@modificadoPor INT
AS
BEGIN
	DECLARE @id INT
	SET @id = 0;
	IF(@idConfiguracionSeguridad = 0)
	BEGIN
		INSERT INTO configuracion_seguridad VALUES(
			@idSucursal,
			@monitoreoActivo,
			@forzarModulos,
			@formatoMonitoreo,
			@maxDiasAlmacenados,
			GETDATE(),
			@modificadoPor
		)
		SELECT @id = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		UPDATE
			configuracion_seguridad
		SET
			monitoreo_activo = @monitoreoActivo,
			forzar_modulos = @forzarModulos,
			formato_monitoreo = @formatoMonitoreo,
			max_dias_almacenados = @maxDiasAlmacenados,
			ultima_modificacion = GETDATE(),
			modificado_por = @modificadoPor
		WHERE
			id_configuracion_seguridad = @idConfiguracionSeguridad
		SELECT @id = @idConfiguracionSeguridad
	END 

	SELECT @id as id_configuracion_seguridad
END
GO
/****** Object:  StoredProcedure [dbo].[spValidarArticuloPrecio]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Saul Cruces
-- Create date: 30.mayo.2018
-- Description:	Validar si se puede guardar el precio
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez
-- Create date: 2018-10-29
-- Description:	cantidades de enteros a decimales
-- =============================================
CREATE PROCEDURE [dbo].[spValidarArticuloPrecio]
	@idArticulo as int,
	@noOrden as int,
	@margen as decimal(18,2),
	@precio as decimal(18,4),
	@cantidad as decimal(18,2),
	@utilidad as decimal(18,2)
AS
BEGIN
	DECLARE @nOrd as int
	DECLARE @mar as decimal(18,2)
	DECLARE @pre as decimal(18,4)
	DECLARE @cant as decimal(18,2)
	DECLARE @uti as decimal(18,2)
	DECLARE @res as int
	SET @res = 1
	
	DECLARE precios_cursor CURSOR
		FOR SELECT  no_orden,
					margen_utilidad,
					precio_venta,
					cantidad,
					utilidad
			FROM articulo_precio WHERE id_articulo = @idArticulo
	OPEN precios_cursor
	FETCH NEXT FROM precios_cursor
	INTO @nOrd, @mar, @pre, @cant, @uti
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @noOrden > @nOrd
		BEGIN
			IF @utilidad >= @uti
				SET @res = -1
			IF @precio >= @pre
				SET @res = -1
			IF @cantidad <= @cant
				SET @res = -1
			IF @margen >= @mar
				SET @res = -1
		END
		IF @noOrden < @nOrd
		BEGIN
			IF @utilidad <= @uti
				SET @res = -1
			IF @precio <= @pre
				SET @res = -1
			IF @cantidad >= @cant
				SET @res = -1
			IF @margen <= @mar
				SET @res = -1
		END
		FETCH NEXT FROM precios_cursor
		INTO @nOrd, @mar, @pre, @cant, @uti
	END
	CLOSE precios_cursor
	DEALLOCATE precios_cursor
	
	SELECT @res AS res
END
GO
/****** Object:  StoredProcedure [dbo].[spValidarArticulosConteoAuditoria]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marco Gonzalez - Alter Israel Flore C.
-- Create date: 2019-01-28
-- Description:	Verifica los artículos que no se pueden agregar a la auditoría
-- =============================================
-- =============================================
-- Author:		Marco Gonzalez 
-- Create date: 2019-02-09
-- Description:	Agregar motivos negativo y duplicado
-- =============================================
CREATE PROCEDURE [dbo].[spValidarArticulosConteoAuditoria]
	@idAuditoria as int,
	@conteo ConteoAuditoria READONLY
AS
BEGIN
	DECLARE @claveArticulo					AS	NVARCHAR(50)
	DECLARE @idArticulo						AS	INT
	DECLARE @almacen						AS	INT
	DECLARE @idAuditoriaDetalle				AS	INT
	DECLARE @totalElementosEnAuditoria		AS	INT
	DECLARE @conteoAuditoria				AS	DECIMAL(18,2)
	DECLARE @codigosNoEncontrados TABLE(codigo NVARCHAR(MAX), motivo int)
	DECLARE @idsEnConteo	TABLE(id INT, idAlmacen INT)
	DECLARE @idsInexistenteConteo	TABLE(id INT, idAlmacen INT)

	--SELECT @idAlmacen = id_almacen FROM auditoria WHERE id_auditoria = @idAuditoria

	DECLARE cursorConteo CURSOR FOR
		SELECT * FROM @conteo
		
	OPEN cursorConteo
	FETCH NEXT FROM cursorConteo INTO @claveArticulo, @conteoAuditoria, @almacen
	WHILE @@FETCH_STATUS = 0
	BEGIN

		IF(@conteoAuditoria >= 0)
			BEGIN
				SET @idArticulo = null
				SELECT 
					@idArticulo = a.id_articulo
				FROM 
					articulo a
					LEFT JOIN articulo_equivalente ae ON a.id_articulo = ae.id_articulo
				WHERE 
					a.clave = @claveArticulo OR a.codigo_barras1 = @claveArticulo OR a.codigo_barras2 = @claveArticulo OR ae.codigo_barras = @claveArticulo

				IF(@idArticulo IS NULL)
					BEGIN
						INSERT INTO @codigosNoEncontrados VALUES(@claveArticulo, 1)
					END
				ELSE
					BEGIN
						IF EXISTS (select id_auditoria_detalle from auditoria_detalle where id_articulo = @idArticulo and @almacen = id_almacen)
							INSERT INTO @idsEnConteo VALUES(@idArticulo, @almacen)
						ELSE
							INSERT INTO @idsInexistenteConteo VALUES(@idArticulo, @almacen)
					END
			END
		ELSE
			BEGIN
				INSERT INTO @codigosNoEncontrados VALUES (@claveArticulo, 3)
			END

		FETCH NEXT FROM cursorConteo INTO @claveArticulo, @conteoAuditoria, @almacen
	END

	--NO ESTAN EN AUDITORIA DETALLE
	INSERT INTO @codigosNoEncontrados
		SELECT 
			ar.clave, 4
		FROM @idsInexistenteConteo c
		left join articulo ar on ar.id_articulo = c.id


	--NO ESTAN EN CONTEO
	INSERT INTO @codigosNoEncontrados
		SELECT 
			concat(ar.clave, ' - ' , ar.desc_mayoreo, ' - ', (SELECT nombre FROM almacen where ad.id_almacen = id_almacen)), 2
		FROM auditoria_detalle ad 
		inner join articulo ar on ar.id_articulo = ad.id_articulo
		left join @conteo c on c.claveArticulo = ar.clave and ad.id_almacen = c.almacen
		WHERE c.almacen is null

	--INSERT INTO @codigosNoEncontrados
	--	SELECT 
	--		a.clave, 4
	--	FROM 
	--		@idsEnConteo c
	--		LEFT JOIN articulo a ON c.id = a.id_articulo
	--		LEFT JOIN auditoria_detalle ad on ad.id_almacen = c.idAlmacen
	--	GROUP BY a.clave, ad.id_almacen
	--	HAVING COUNT(*) > 1

	SELECT @totalElementosEnAuditoria = COUNT(*) FROM auditoria_detalle WHERE id_auditoria = @idAuditoria --AND id_almacen in (select distinct Almacen from @conteo)

	

	SELECT noEncontrados.*, @totalElementosEnAuditoria AS noElementosEnAuditoria FROM @codigosNoEncontrados AS noEncontrados

END

GO
/****** Object:  StoredProcedure [dbo].[spValidarExistencias]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:        Carolina Franco
-- Create date:	  15.mayo.2019
-- Description:   Se modifica para art que venden sin existencia
-- =============================================

-- =============================================
-- Author:        Saúl Cruces
-- Create date: 08.mayo.2019
-- Description:    Validar existencias
-- =============================================
CREATE PROCEDURE [dbo].[spValidarExistencias]
    @idAlmacen AS int,
    @tablaArts AS ListaIDsCantidad READONLY
AS
BEGIN
    DECLARE @idArt AS int
    DECLARE @cantidad AS decimal(18,4)
    DECLARE @existenciaActual AS decimal(18,4)
    DECLARE @existenciaVenta AS decimal(18,4)
    DECLARE @artsSinExistencia AS varchar(200)
    DECLARE @claveArt AS nvarchar(10)
    DECLARE @vendeSinExistencia as INT
    SET @artsSinExistencia = ''
    
    DECLARE cArts CURSOR
        FOR SELECT id, cantidad FROM @tablaArts
    
    OPEN cArts
    FETCH NEXT FROM cArts INTO @idArt, @cantidad

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT @vendeSinExistencia = vende_sin_existencia FROM articulo_adicionales WHERE id_articulo_adicionales =
        (select id_articulo_adicionales from articulo where id_articulo = @idArt)
        
        IF @vendeSinExistencia = 0
        BEGIN
            SELECT @existenciaActual = ISNULL(existencia_actual, 0), @existenciaVenta = ISNULL(existencia_venta, 0)
            FROM articulo_existencia WHERE id_articulo = @idArt AND id_almacen = @idAlmacen

            IF @cantidad >= @existenciaVenta
            BEGIN
                IF @existenciaVenta < 0
                    SET @existenciaVenta = 0
            
                SET @cantidad = @cantidad - @existenciaVenta

                IF @cantidad <= @existenciaActual
                BEGIN
                    UPDATE articulo_existencia
                        SET existencia_actual = existencia_actual - @cantidad,
                            existencia_venta = existencia_venta + @cantidad
                        WHERE id_articulo = @idArt AND id_almacen = @idAlmacen
                END
                ELSE
                BEGIN
                    SELECT @claveArt = clave FROM articulo WHERE id_articulo = @idArt
                    IF @artsSinExistencia = ''
                        SET @artsSinExistencia = @claveArt
                    ELSE
                        SET @artsSinExistencia = CONCAT(@artsSinExistencia, ', ', @claveArt)
                END
            END
        END

        FETCH NEXT FROM cArts INTO @idArt, @cantidad
    END
    CLOSE cArts
    DEALLOCATE cArts

    SELECT @artsSinExistencia as articulos_sin_existencia
END
GO
/****** Object:  StoredProcedure [dbo].[spValidarYAgregarExistencia]    Script Date: 10/09/2020 08:19:25 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Carolina Franco
-- Create date: 2019-06-27
-- Description:	Se corrige existencia inicial
-- =============================================
-- =============================================
-- Author:		Saul Cruces
-- Create date: 11.julio.2018
-- Description:	Si no existe registro, lo agrega
-- =============================================
CREATE PROCEDURE [dbo].[spValidarYAgregarExistencia]
	@idAlmacen AS INT,
	@tablaIDsArtsCant ListaIDsCantidad READONLY
AS
BEGIN
	DECLARE @idArticulo AS INT
	DECLARE @cantidad AS DECIMAL
	DECLARE @existenciaActual AS DECIMAL
	DECLARE cAC CURSOR
		FOR SELECT id, cantidad FROM @tablaIDsArtsCant
	OPEN cAC
	FETCH NEXT FROM cAC INTO @idArticulo, @cantidad
	WHILE @@FETCH_STATUS = 0
    BEGIN
		SET @existenciaActual = NULL
		SELECT @existenciaActual = existencia_actual FROM articulo_existencia
		WHERE id_articulo = @idArticulo AND id_almacen = @idAlmacen
		IF @existenciaActual IS NULL
			INSERT INTO articulo_existencia
				(id_articulo
				,id_almacen
				,total_entradas
				,total_salidas
				,existencia_actual
				,stock_minimo
				,stock_maximo
				,existencia_inicial)
			VALUES
				(@idArticulo
				,@idAlmacen
				,0
				,0
				,0
				,1
				,10000
				,0)
		FETCH NEXT FROM cAC INTO @idArticulo, @cantidad	
    END
    CLOSE cAC
    DEALLOCATE cAC
	SELECT CAST(1 AS BIT) AS 'ok'
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[10] 2[46] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "I1"
            Begin Extent = 
               Top = 138
               Left = 269
               Bottom = 268
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "I2"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "L"
            Begin Extent = 
               Top = 6
               Left = 308
               Bottom = 136
               Right = 485
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ACV_Articulos1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ACV_Articulos1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ACV_Articulos1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 260
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ACV_Articulos2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ACV_Articulos2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[14] 2[44] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 238
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ACV_Articulos3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ACV_Articulos3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 270
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "F"
            Begin Extent = 
               Top = 138
               Left = 280
               Bottom = 268
               Right = 450
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UC"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UV"
            Begin Extent = 
               Top = 270
               Left = 262
               Bottom = 400
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "I1"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "I2"
            Begin Extent = 
               Top = 402
               Left = 246
               Bottom = 532
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ACV_ArticulosInve'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'End
         Begin Table = "L"
            Begin Extent = 
               Top = 6
               Left = 308
               Bottom = 136
               Right = 485
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 534
               Left = 38
               Bottom = 664
               Right = 229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Prov"
            Begin Extent = 
               Top = 534
               Left = 267
               Bottom = 664
               Right = 476
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pr"
            Begin Extent = 
               Top = 666
               Left = 38
               Bottom = 796
               Right = 241
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 798
               Left = 38
               Bottom = 928
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1635
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ACV_ArticulosInve'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ACV_ArticulosInve'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "M"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 283
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "S"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "A"
            Begin Extent = 
               Top = 138
               Left = 272
               Bottom = 268
               Right = 442
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MT"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 283
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CJ"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U1"
            Begin Extent = 
               Top = 402
               Left = 304
               Bottom = 532
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U2"
            Begin Extent = 
               Top = 534
               Left = 38
               Bottom = 664
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ACV_MovAlmacen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'nd
         Begin Table = "C"
            Begin Extent = 
               Top = 534
               Left = 246
               Bottom = 664
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 666
               Left = 38
               Bottom = 796
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ACV_MovAlmacen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ACV_MovAlmacen'
GO
USE [master]
GO
ALTER DATABASE [PV_VIAMORELOS] SET  READ_WRITE 
GO
