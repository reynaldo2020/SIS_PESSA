-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 26-08-2020 a las 19:54:40
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbproyectofinal`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `fk_categoria_usuarios_idx` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `categoria`, `estado`, `id_usuario`) VALUES
(2, 'aceites', '1', 1),
(6, 'jabones', '1', 1),
(7, 'harinas', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_cliente` varchar(100) NOT NULL,
  `nombre_cliente` varchar(100) NOT NULL,
  `apellido_cliente` varchar(100) NOT NULL,
  `telefono_cliente` varchar(100) NOT NULL,
  `correo_cliente` varchar(100) NOT NULL,
  `direccion_cliente` varchar(100) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `fk_clientes_usuario_idx` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `cedula_cliente`, `nombre_cliente`, `apellido_cliente`, `telefono_cliente`, `correo_cliente`, `direccion_cliente`, `fecha_ingreso`, `estado`, `id_usuario`) VALUES
(5, '159966666', 'Jorge', 'Rodriguez', '459966666', 'jorge@gmail.com', 'california', '2018-02-05', '1', 1),
(6, '45', 'karla', 'rodriguez', '789', 'karla@gmail.com', 'chicago', '2018-02-13', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `id_compras` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_compra` date NOT NULL,
  `numero_compra` varchar(100) NOT NULL,
  `proveedor` varchar(100) NOT NULL,
  `cedula_proveedor` varchar(100) NOT NULL,
  `comprador` varchar(100) NOT NULL,
  `moneda` varchar(100) NOT NULL,
  `subtotal` varchar(100) NOT NULL,
  `total_iva` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL,
  `tipo_pago` varchar(100) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  PRIMARY KEY (`id_compras`),
  KEY `fk_compras_usuario_idx` (`id_usuario`),
  KEY `fk_compras_proveedor_idx` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compras`, `fecha_compra`, `numero_compra`, `proveedor`, `cedula_proveedor`, `comprador`, `moneda`, `subtotal`, `total_iva`, `total`, `tipo_pago`, `estado`, `id_usuario`, `id_proveedor`) VALUES
(1, '2018-01-31', 'F000001', 'luis lopez', '14789', 'eyter', 'USD$', '100', '20', '120', 'CHEQUE', '0', 1, 3),
(2, '2018-02-06', 'F000002', 'luis lopez', '14789', 'eyter', 'USD$', '400', '80', '480', 'CHEQUE', '0', 1, 3),
(3, '2018-02-07', 'F000003', 'luis lopez', '14789', 'eyter', 'USD$', '400', '80', '480', 'EFECTIVO', '1', 1, 3),
(4, '2018-02-07', 'F000004', 'luis lopez', '14789', 'eyter', 'USD$', '160', '32', '192', 'EFECTIVO', '1', 1, 3),
(7, '2018-10-26', 'F000005', 'roberto perez', '45965', 'eyter', 'USD$', '280', '56', '336', 'CHEQUE', '0', 1, 4),
(8, '2020-06-14', 'F000006', 'luis lopez', '14789', 'Reynaldo Augusto', 'USD$', '100', '20', '120', 'CHEQUE', '1', 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

DROP TABLE IF EXISTS `detalle_compras`;
CREATE TABLE IF NOT EXISTS `detalle_compras` (
  `id_detalle_compras` int(11) NOT NULL AUTO_INCREMENT,
  `numero_compra` varchar(100) NOT NULL,
  `cedula_proveedor` varchar(100) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `moneda` varchar(100) NOT NULL,
  `precio_compra` varchar(100) NOT NULL,
  `cantidad_compra` varchar(100) NOT NULL,
  `descuento` varchar(100) NOT NULL,
  `importe` varchar(100) NOT NULL,
  `fecha_compra` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_compras`),
  KEY `fk_detalle_compras_producto_idx` (`id_producto`),
  KEY `fk_detalle_compras_usuario_idx` (`id_usuario`),
  KEY `fk_detalle_compras_proveedor_idx` (`id_proveedor`),
  KEY `fk_detalle_compras_categoria_idx` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`id_detalle_compras`, `numero_compra`, `cedula_proveedor`, `id_producto`, `producto`, `moneda`, `precio_compra`, `cantidad_compra`, `descuento`, `importe`, `fecha_compra`, `id_usuario`, `id_proveedor`, `estado`, `id_categoria`) VALUES
(1, 'F000001', '14789', 4, 'jabon ACE', 'USD$', '100', '1', '0', '100', '2018-01-31', 1, 3, '0', 6),
(2, 'F000002', '14789', 9, 'jabon casa', 'USD$', '80', '5', '0', '400', '2018-02-06', 1, 3, '0', 6),
(3, 'F000003', '14789', 4, 'jabon ACE', 'USD$', '100', '4', '0', '400', '2018-02-07', 1, 3, '1', 6),
(4, 'F000004', '14789', 7, 'harina pan', 'USD$', '60', '1', '0', '60', '2018-02-07', 1, 3, '1', 7),
(5, 'F000004', '14789', 4, 'jabon ACE', 'USD$', '100', '1', '0', '100', '2018-02-07', 1, 3, '1', 6),
(9, 'F000005', '45965', 4, 'jabon ACE', 'USD$', '100', '2', '0', '200', '2018-10-26', 1, 4, '0', 6),
(10, 'F000005', '45965', 9, 'jabon casa', 'USD$', '80', '1', '0', '80', '2018-10-26', 1, 4, '0', 6),
(11, 'F000006', '14789', 4, 'jabon ACE', 'USD$', '100', '1', '0', '100', '2020-06-14', 3, 3, '1', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
CREATE TABLE IF NOT EXISTS `detalle_ventas` (
  `id_detalle_ventas` int(11) NOT NULL AUTO_INCREMENT,
  `numero_venta` varchar(100) NOT NULL,
  `cedula_cliente` varchar(100) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `moneda` varchar(100) NOT NULL,
  `precio_venta` varchar(100) NOT NULL,
  `cantidad_venta` varchar(100) NOT NULL,
  `descuento` varchar(100) NOT NULL,
  `importe` varchar(100) NOT NULL,
  `fecha_venta` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  PRIMARY KEY (`id_detalle_ventas`),
  KEY `fk_detalle_ventas_producto_idx` (`id_producto`),
  KEY `fk_detalle_ventas_usuario_idx` (`id_usuario`),
  KEY `fk_detalle_ventas_clientes_idx` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`id_detalle_ventas`, `numero_venta`, `cedula_cliente`, `id_producto`, `producto`, `moneda`, `precio_venta`, `cantidad_venta`, `descuento`, `importe`, `fecha_venta`, `id_usuario`, `id_cliente`, `estado`) VALUES
(2, 'F000001', '159966666', 9, 'jabon casa', 'USD$', '200', '1', '0', '200', '2018-02-07', 1, 5, '1'),
(3, 'F000002', '159966666', 4, 'jabon ACE', 'USD$', '200', '1', '0', '200', '2018-02-07', 1, 5, '1'),
(4, 'F000002', '159966666', 9, 'jabon casa', 'USD$', '200', '1', '0', '200', '2018-02-07', 1, 5, '1'),
(5, 'F000002', '159966666', 7, 'harina pan', 'USD$', '90', '1', '0', '90', '2018-02-07', 1, 5, '1'),
(12, 'F000003', '159966666', 4, 'jabon ACE', 'USD$', '200', '2', '0', '400', '2018-10-26', 1, 5, '0'),
(13, 'F000003', '159966666', 8, 'pan ', 'USD$', '81', '1', '0', '81', '2018-10-26', 1, 5, '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

DROP TABLE IF EXISTS `empresa`;
CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_empresa` varchar(100) NOT NULL,
  `nombre_empresa` varchar(100) NOT NULL,
  `direccion_empresa` varchar(100) NOT NULL,
  `correo_empresa` varchar(100) NOT NULL,
  `telefono_empresa` varchar(100) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_empresa`),
  KEY `fk_empresa_usuario_idx` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `cedula_empresa`, `nombre_empresa`, `direccion_empresa`, `correo_empresa`, `telefono_empresa`, `id_usuario`) VALUES
(1, '1223459988', 'eyter', 'california san jose', 'eyterdaniel@gmail.com', '12899665588', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `id_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `nombre`) VALUES
(1, 'Categoria'),
(2, 'Productos'),
(3, 'Proveedores'),
(4, 'Compras'),
(5, 'Clientes'),
(6, 'Ventas'),
(7, 'Reporte de Compras'),
(8, 'Reporte de Ventas'),
(9, 'Usuarios'),
(10, 'Empresa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `presentacion` varchar(100) NOT NULL,
  `unidad` varchar(45) NOT NULL,
  `moneda` varchar(45) NOT NULL,
  `precio_compra` varchar(45) NOT NULL,
  `precio_venta` varchar(45) NOT NULL,
  `stock` varchar(45) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `fk_producto_categoria_idx` (`id_categoria`),
  KEY `fk_producto_usuario_idx` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `id_categoria`, `producto`, `presentacion`, `unidad`, `moneda`, `precio_compra`, `precio_venta`, `stock`, `estado`, `imagen`, `fecha_vencimiento`, `id_usuario`) VALUES
(4, 6, 'jabon ACE', 'Caja', 'kilo', 'USD$', '100', '200', '21', '1', '1982969361.jpg', '2018-01-31', 1),
(6, 2, 'aceite carro', 'Caja', 'kilo', 'USD$', '100', '300', '20', '0', '216717336.jpg', '2018-01-25', 1),
(7, 7, 'harina pan', 'Saco', 'kilo', 'USD$', '60', '90', '20', '1', '234611002.jpg', '2018-01-30', 1),
(8, 7, 'pan ', 'Saco', 'kilo', 'USD$', '60', '81', '20', '1', '1407078505.jpg', '2018-01-24', 1),
(9, 6, 'jabon casa', 'Saco', 'kilo', 'USD$', '80', '200', '20', '1', '1121250455.jpg', '2018-01-29', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE IF NOT EXISTS `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(45) NOT NULL,
  `razon_social` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `fecha` date NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `fk_proveedor_usuario_idx` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `cedula`, `razon_social`, `telefono`, `correo`, `direccion`, `fecha`, `estado`, `id_usuario`) VALUES
(3, '14789', 'luis lopez', '12399888', 'luis@gmail.com', 'california', '2018-01-29', '1', 1),
(4, '45965', 'roberto perez', '48859', 'roberto@gmail.com', 'texas', '2018-02-13', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `cedula` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `cargo` enum('0','1') NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `password2` varchar(100) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `estado` enum('0','1') NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombres`, `apellidos`, `cedula`, `telefono`, `correo`, `direccion`, `cargo`, `usuario`, `password`, `password2`, `fecha_ingreso`, `estado`) VALUES
(1, 'eyter', 'higuera', '1', '123456', 'eyter@gmail.com', 'san jose', '1', 'daniel', 'Qw/*12345678', 'Qw/*12345678', '2017-12-26', '1'),
(2, 'alejandro', 'perez', '12', '12968566', 'alejandro@gmail.com', 'california', '0', 'alejandro', 'Qw/*12345678', 'Qw/*12345678', '2018-02-13', '1'),
(3, 'Reynaldo Augusto', 'Valencia Vallecillo', '0012707790018', '22702608', 'reynaldovalencia@hotmail.com', 'Villas San Angel 02-06', '1', 'reynaldo', 'Qw/*12345678', 'Qw/*12345678', '2020-03-21', '1'),
(4, 'Andrea', 'Lucia', '0011011090018', '88516880', 'andrea.lucia@productoselsol.com', 'Villas de San Angel 02-06', '0', 'Lucy', 'Qw/*12345678', 'Qw/*12345678', '2020-06-02', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

DROP TABLE IF EXISTS `usuario_permiso`;
CREATE TABLE IF NOT EXISTS `usuario_permiso` (
  `id_usuario_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario_permiso`),
  KEY `fk_usuario_permiso_usuario_idx` (`id_usuario`),
  KEY `fk_usuario_permiso_permiso_idx` (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`id_usuario_permiso`, `id_usuario`, `id_permiso`) VALUES
(32, 2, 1),
(33, 2, 2),
(121, 3, 1),
(122, 3, 2),
(123, 3, 3),
(124, 3, 4),
(125, 3, 5),
(126, 3, 6),
(127, 3, 7),
(128, 3, 8),
(129, 3, 9),
(130, 3, 10),
(131, 4, 1),
(132, 4, 2),
(133, 1, 1),
(134, 1, 2),
(135, 1, 3),
(136, 1, 4),
(137, 1, 5),
(138, 1, 6),
(139, 1, 7),
(140, 1, 8),
(141, 1, 9),
(142, 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

DROP TABLE IF EXISTS `ventas`;
CREATE TABLE IF NOT EXISTS `ventas` (
  `id_ventas` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_venta` date NOT NULL,
  `numero_venta` varchar(100) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `cedula_cliente` varchar(100) NOT NULL,
  `vendedor` varchar(100) NOT NULL,
  `moneda` varchar(100) NOT NULL,
  `subtotal` varchar(100) NOT NULL,
  `total_iva` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL,
  `tipo_pago` varchar(100) NOT NULL,
  `estado` enum('0','1') NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id_ventas`),
  KEY `fk_ventas_usuario_idx` (`id_usuario`),
  KEY `fk_ventas_cliente_idx` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_ventas`, `fecha_venta`, `numero_venta`, `cliente`, `cedula_cliente`, `vendedor`, `moneda`, `subtotal`, `total_iva`, `total`, `tipo_pago`, `estado`, `id_usuario`, `id_cliente`) VALUES
(2, '2018-02-07', 'F000001', 'Jorge', '159966666', 'eyter', 'USD$', '200', '40', '240', 'EFECTIVO', '1', 1, 5),
(3, '2018-02-07', 'F000002', 'Jorge', '159966666', 'eyter', 'USD$', '490', '98', '588', 'EFECTIVO', '1', 1, 5),
(7, '2018-10-26', 'F000003', 'Jorge', '159966666', 'eyter', 'USD$', '481', '96', '577', 'CHEQUE', '0', 1, 5);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_categoria_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_compras_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compras_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `fk_detalle_compras_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_compras_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_compras_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_compras_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `fk_detalle_ventas_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_ventas_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_ventas_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_empresa_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_producto_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
