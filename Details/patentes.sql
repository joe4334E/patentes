-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 31-08-2024 a las 21:16:59
-- Versión del servidor: 11.5.2-MariaDB
-- Versión de PHP: 8.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `patentes`
--
CREATE DATABASE IF NOT EXISTS `patentes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `patentes`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad_economicas`
--

DROP TABLE IF EXISTS `actividad_economicas`;
CREATE TABLE `actividad_economicas` (
  `cod` int(11) NOT NULL,
  `tipo_actividad` varchar(50) DEFAULT NULL,
  `descripcion_actividad` varchar(250) DEFAULT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `monto_t` decimal(10,2) DEFAULT 0.00,
  `usuario_cod` int(11) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncar tablas antes de insertar `actividad_economicas`
--

TRUNCATE TABLE `actividad_economicas`;
--
-- Volcado de datos para la tabla `actividad_economicas`
--

INSERT INTO `actividad_economicas` (`cod`, `tipo_actividad`, `descripcion_actividad`, `ubicacion`, `monto_t`, `usuario_cod`, `fecha_registro`) VALUES
(1, 'Comercio de Alimentos', 'Venta de alimentos y bebidas', 'Calle 123, Ciudad', 10000.00, 1, '2024-08-31 19:53:40'),
(2, 'Servicios de Consultoría', 'Consultoría en tecnología de la información', 'Avenida 456, Ciudad', 5000.00, 1, '2024-08-31 19:53:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comerciantes`
--

DROP TABLE IF EXISTS `comerciantes`;
CREATE TABLE `comerciantes` (
  `cod` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `ci` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `sindicato_cod` int(11) DEFAULT NULL,
  `usuario_cod` int(11) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncar tablas antes de insertar `comerciantes`
--

TRUNCATE TABLE `comerciantes`;
--
-- Volcado de datos para la tabla `comerciantes`
--

INSERT INTO `comerciantes` (`cod`, `nombre`, `ci`, `direccion`, `sindicato_cod`, `usuario_cod`, `fecha_registro`) VALUES
(1, 'Comerciante Juan', '12345678', 'Calle 123, Ciudad', 1, 1, '2024-08-31 19:53:40'),
(2, 'Comerciante Ana', '87654321', 'Avenida 456, Ciudad', 2, 1, '2024-08-31 19:53:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patentes`
--

DROP TABLE IF EXISTS `patentes`;
CREATE TABLE `patentes` (
  `cod` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp(),
  `usuario_cod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncar tablas antes de insertar `patentes`
--

TRUNCATE TABLE `patentes`;
--
-- Volcado de datos para la tabla `patentes`
--

INSERT INTO `patentes` (`cod`, `nombre`, `descripcion`, `fecha_registro`, `usuario_cod`) VALUES
(1, 'Patente de Comercio A', 'Descripción actualizada', '2024-08-31 19:53:40', 1),
(2, 'Patente de Consultoría B', 'Patente para servicios de consultoría', '2024-08-31 19:53:40', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sindicatos`
--

DROP TABLE IF EXISTS `sindicatos`;
CREATE TABLE `sindicatos` (
  `cod` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `nombre_presidente` varchar(100) DEFAULT NULL,
  `zona` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `usuario_cod` int(11) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncar tablas antes de insertar `sindicatos`
--

TRUNCATE TABLE `sindicatos`;
--
-- Volcado de datos para la tabla `sindicatos`
--

INSERT INTO `sindicatos` (`cod`, `nombre`, `nombre_presidente`, `zona`, `area`, `usuario_cod`, `fecha_registro`) VALUES
(1, 'Sindicato de Comerciante A', 'Juan Pérez', 'Zona Norte', 'Área Comercial', 1, '2024-08-31 19:53:39'),
(2, 'Sindicato de Comerciante B', 'Ana Gómez', 'Zona Sur', 'Área Industrial', 1, '2024-08-31 19:53:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tramites`
--

DROP TABLE IF EXISTS `tramites`;
CREATE TABLE `tramites` (
  `cod` int(11) NOT NULL,
  `patente_cod` int(11) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `comerciante_cod` int(11) DEFAULT NULL,
  `actividad_economica_cod` int(11) DEFAULT NULL,
  `usuario_cod` int(11) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncar tablas antes de insertar `tramites`
--

TRUNCATE TABLE `tramites`;
--
-- Volcado de datos para la tabla `tramites`
--

INSERT INTO `tramites` (`cod`, `patente_cod`, `monto`, `fecha_inicio`, `fecha_fin`, `estado`, `comerciante_cod`, `actividad_economica_cod`, `usuario_cod`, `fecha_registro`) VALUES
(1, 1, 1500.00, '2024-08-01', '2024-12-31', 'activo', 1, 1, 1, '2024-08-31 19:53:40'),
(2, 2, 2000.00, '2024-08-15', '2024-11-15', 'activo', 2, 2, 1, '2024-08-31 19:53:40'),
(3, 1, 3000.00, '2024-08-01', '2024-12-31', 'activo', 1, 1, 2, '2024-09-01 00:00:00'),
(4, 2, 4000.00, '2024-08-15', '2024-11-15', 'activo', 2, 2, 1, '2024-09-01 00:00:00'),
(5, 1, 3500.00, '2024-09-01', '2024-12-01', 'activo', 1, 1, 2, '2024-09-01 00:00:00'),
(6, 2, 2500.00, '2024-09-10', '2024-11-10', 'activo', 2, 2, 1, '2024-09-01 00:00:00'),
(7, 1, 2000.00, '2024-09-15', '2024-12-15', 'activo', 1, 1, 2, '2024-09-01 00:00:00'),
(8, 2, 4500.00, '2024-09-20', '2024-11-20', 'activo', 2, 2, 1, '2024-09-01 00:00:00'),
(9, 1, 3800.00, '2024-10-01', '2024-12-01', 'activo', 1, 1, 2, '2024-09-01 00:00:00'),
(10, 2, 5000.00, '2024-10-10', '2024-12-10', 'activo', 2, 2, 1, '2024-09-01 00:00:00'),
(11, 1, 3200.00, '2024-10-15', '2024-12-15', 'activo', 1, 1, 2, '2024-09-01 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `cod` int(11) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contrasenia` varchar(250) DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `tipo_usuario` enum('administrador','cajero','usuario') DEFAULT 'usuario',
  `fecha_registro` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Truncar tablas antes de insertar `usuarios`
--

TRUNCATE TABLE `usuarios`;
--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`cod`, `correo`, `contrasenia`, `estado`, `tipo_usuario`, `fecha_registro`) VALUES
(1, 'actualizado@example.com', 'nueva_contrasenia', 'inactivo', 'administrador', '2024-08-31 19:52:43'),
(2, 'cajero@example.com', 'cajero_password', 'activo', 'cajero', '2024-08-31 19:52:43'),
(3, 'usuario@example.com', 'usuario_password', 'activo', 'usuario', '2024-08-31 19:52:43'),
(4, 'nuevo_usuario@example.com', 'password', 'activo', 'usuario', '2024-08-31 20:34:58');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_administrador`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_administrador`;
CREATE TABLE `vista_administrador` (
`id_tramite` int(11)
,`tipo_patente` varchar(50)
,`tipo_actividad` varchar(50)
,`descripcion_actividad` varchar(250)
,`nombre_comerciante` varchar(100)
,`ubicacion_actividad` varchar(100)
,`zona` varchar(50)
,`fecha_deuda` date
,`estado_deuda` varchar(7)
,`estado_tramite` enum('activo','inactivo')
,`id_comerciante` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_cajero`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_cajero`;
CREATE TABLE `vista_cajero` (
`id_tramite` int(11)
,`tipo_patente` varchar(50)
,`tipo_actividad` varchar(50)
,`descripcion_actividad` varchar(250)
,`nombre_comerciante` varchar(100)
,`ubicacion_actividad` varchar(100)
,`zona` varchar(50)
,`fecha_deuda` date
,`estado_deuda` varchar(7)
,`estado_tramite` enum('activo','inactivo')
,`monto_tramite` decimal(10,2)
,`estado_pago` varchar(17)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_usuario_normal`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_usuario_normal`;
CREATE TABLE `vista_usuario_normal` (
`id_tramite` int(11)
,`tipo_patente` varchar(50)
,`tipo_actividad` varchar(50)
,`descripcion_actividad` varchar(250)
,`nombre_comerciante` varchar(100)
,`ubicacion_actividad` varchar(100)
,`zona` varchar(50)
,`fecha_deuda` date
,`estado_tramite` enum('activo','inactivo')
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_administrador`
--
DROP TABLE IF EXISTS `vista_administrador`;

DROP VIEW IF EXISTS `vista_administrador`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_administrador`  AS SELECT `t`.`cod` AS `id_tramite`, `p`.`nombre` AS `tipo_patente`, `a`.`tipo_actividad` AS `tipo_actividad`, `a`.`descripcion_actividad` AS `descripcion_actividad`, `c`.`nombre` AS `nombre_comerciante`, `a`.`ubicacion` AS `ubicacion_actividad`, `s`.`zona` AS `zona`, `t`.`fecha_fin` AS `fecha_deuda`, CASE WHEN `t`.`fecha_fin` < curdate() THEN 'debe' ELSE 'no debe' END AS `estado_deuda`, `t`.`estado` AS `estado_tramite`, `c`.`cod` AS `id_comerciante` FROM ((((`tramites` `t` join `patentes` `p` on(`t`.`patente_cod` = `p`.`cod`)) join `actividad_economicas` `a` on(`t`.`actividad_economica_cod` = `a`.`cod`)) join `comerciantes` `c` on(`t`.`comerciante_cod` = `c`.`cod`)) join `sindicatos` `s` on(`c`.`sindicato_cod` = `s`.`cod`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_cajero`
--
DROP TABLE IF EXISTS `vista_cajero`;

DROP VIEW IF EXISTS `vista_cajero`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_cajero`  AS SELECT `t`.`cod` AS `id_tramite`, `p`.`nombre` AS `tipo_patente`, `a`.`tipo_actividad` AS `tipo_actividad`, `a`.`descripcion_actividad` AS `descripcion_actividad`, `c`.`nombre` AS `nombre_comerciante`, `a`.`ubicacion` AS `ubicacion_actividad`, `s`.`zona` AS `zona`, `t`.`fecha_fin` AS `fecha_deuda`, CASE WHEN `t`.`fecha_fin` < curdate() THEN 'debe' ELSE 'no debe' END AS `estado_deuda`, `t`.`estado` AS `estado_tramite`, `t`.`monto` AS `monto_tramite`, CASE WHEN `t`.`estado` = 'activo' THEN 'pendiente de pago' ELSE 'pagado' END AS `estado_pago` FROM ((((`tramites` `t` join `patentes` `p` on(`t`.`patente_cod` = `p`.`cod`)) join `actividad_economicas` `a` on(`t`.`actividad_economica_cod` = `a`.`cod`)) join `comerciantes` `c` on(`t`.`comerciante_cod` = `c`.`cod`)) join `sindicatos` `s` on(`c`.`sindicato_cod` = `s`.`cod`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_usuario_normal`
--
DROP TABLE IF EXISTS `vista_usuario_normal`;

DROP VIEW IF EXISTS `vista_usuario_normal`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuario_normal`  AS SELECT `t`.`cod` AS `id_tramite`, `p`.`nombre` AS `tipo_patente`, `a`.`tipo_actividad` AS `tipo_actividad`, `a`.`descripcion_actividad` AS `descripcion_actividad`, `c`.`nombre` AS `nombre_comerciante`, `a`.`ubicacion` AS `ubicacion_actividad`, `s`.`zona` AS `zona`, `t`.`fecha_fin` AS `fecha_deuda`, `t`.`estado` AS `estado_tramite` FROM ((((`tramites` `t` left join `patentes` `p` on(`t`.`patente_cod` = `p`.`cod`)) left join `actividad_economicas` `a` on(`t`.`actividad_economica_cod` = `a`.`cod`)) left join `comerciantes` `c` on(`t`.`comerciante_cod` = `c`.`cod`)) left join `sindicatos` `s` on(`c`.`sindicato_cod` = `s`.`cod`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad_economicas`
--
ALTER TABLE `actividad_economicas`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `usuario_cod` (`usuario_cod`);

--
-- Indices de la tabla `comerciantes`
--
ALTER TABLE `comerciantes`
  ADD PRIMARY KEY (`cod`),
  ADD UNIQUE KEY `ci` (`ci`),
  ADD KEY `sindicato_cod` (`sindicato_cod`),
  ADD KEY `usuario_cod` (`usuario_cod`);

--
-- Indices de la tabla `patentes`
--
ALTER TABLE `patentes`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `usuario_cod` (`usuario_cod`);

--
-- Indices de la tabla `sindicatos`
--
ALTER TABLE `sindicatos`
  ADD PRIMARY KEY (`cod`),
  ADD UNIQUE KEY `nombre` (`nombre`),
  ADD KEY `usuario_cod` (`usuario_cod`);

--
-- Indices de la tabla `tramites`
--
ALTER TABLE `tramites`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `comerciante_cod` (`comerciante_cod`),
  ADD KEY `actividad_economica_cod` (`actividad_economica_cod`),
  ADD KEY `usuario_cod` (`usuario_cod`),
  ADD KEY `patente_cod` (`patente_cod`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cod`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad_economicas`
--
ALTER TABLE `actividad_economicas`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `comerciantes`
--
ALTER TABLE `comerciantes`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `patentes`
--
ALTER TABLE `patentes`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `sindicatos`
--
ALTER TABLE `sindicatos`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tramites`
--
ALTER TABLE `tramites`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividad_economicas`
--
ALTER TABLE `actividad_economicas`
  ADD CONSTRAINT `actividad_economicas_ibfk_1` FOREIGN KEY (`usuario_cod`) REFERENCES `usuarios` (`cod`);

--
-- Filtros para la tabla `comerciantes`
--
ALTER TABLE `comerciantes`
  ADD CONSTRAINT `comerciantes_ibfk_1` FOREIGN KEY (`sindicato_cod`) REFERENCES `sindicatos` (`cod`),
  ADD CONSTRAINT `comerciantes_ibfk_2` FOREIGN KEY (`usuario_cod`) REFERENCES `usuarios` (`cod`);

--
-- Filtros para la tabla `patentes`
--
ALTER TABLE `patentes`
  ADD CONSTRAINT `patentes_ibfk_1` FOREIGN KEY (`usuario_cod`) REFERENCES `usuarios` (`cod`);

--
-- Filtros para la tabla `sindicatos`
--
ALTER TABLE `sindicatos`
  ADD CONSTRAINT `sindicatos_ibfk_1` FOREIGN KEY (`usuario_cod`) REFERENCES `usuarios` (`cod`);

--
-- Filtros para la tabla `tramites`
--
ALTER TABLE `tramites`
  ADD CONSTRAINT `tramites_ibfk_1` FOREIGN KEY (`comerciante_cod`) REFERENCES `comerciantes` (`cod`),
  ADD CONSTRAINT `tramites_ibfk_2` FOREIGN KEY (`actividad_economica_cod`) REFERENCES `actividad_economicas` (`cod`),
  ADD CONSTRAINT `tramites_ibfk_3` FOREIGN KEY (`usuario_cod`) REFERENCES `usuarios` (`cod`),
  ADD CONSTRAINT `tramites_ibfk_4` FOREIGN KEY (`patente_cod`) REFERENCES `patentes` (`cod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
