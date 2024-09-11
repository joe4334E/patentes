- phpMyAdmin SQL Dump
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
  `rotulo_actividad` varchar(250) DEFAULT NULL,
  `monto_t` decimal(10,2) DEFAULT 0.00,
  `usuario_cod` int(11) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `patentes`;
CREATE TABLE `patentes` (
  `cod` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp(),
  `usuario_cod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `patentes`
--
-- Estructura de tabla para la tabla `sindicatos`
--

DROP TABLE IF EXISTS `sindicatos`;
CREATE TABLE `sindicatos` (
  `cod` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `zona` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `usuario_cod` int(11) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sindicatos`

DROP TABLE IF EXISTS `tramites`;
CREATE TABLE `tramites` (
  `cod` int(11) NOT NULL,
  `patente_cod` int(11) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `usuario_cod` int(11) DEFAULT NULL,
  `actividad_economica_cod` int(11) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tramites`
--
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `cod` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `ci` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `sindicato_cod` int(11) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `contrasenia` varchar(250) DEFAULT NULL,
  `estado` enum('activo','inactivo') DEFAULT 'activo',
  `tipo_usuario` enum('administrador','cajero','usuario') DEFAULT 'usuario',
  `fecha_registro` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Estructura para la vista `vista_administrador`
--

DROP VIEW IF EXISTS `vista_administrador`;
CREATE VIEW `vista_administrador` AS
SELECT 
  t.cod AS id_tramite,
  p.nombre AS tipo_patente,
  a.tipo_actividad,
  a.descripcion_actividad,
  u.nombre AS nombre_usuario,
  a.ubicacion AS ubicacion_actividad,
  s.zona,
  t.fecha_fin AS fecha_deuda,
  CASE WHEN t.fecha_fin < CURDATE() THEN 'debe' ELSE 'no debe' END AS estado_deuda,
  t.estado AS estado_tramite,
  u.cod AS id_usuario
FROM 
  tramites t
  JOIN patentes p ON t.patente_cod = p.cod
  JOIN actividad_economicas a ON t.actividad_economica_cod = a.cod
  JOIN usuarios u ON t.usuario_cod = u.cod
  JOIN sindicatos s ON u.sindicato_cod = s.cod;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_cajero`
--

DROP VIEW IF EXISTS `vista_cajero`;
CREATE VIEW `vista_cajero` AS
SELECT 
  t.cod AS id_tramite,
  p.nombre AS tipo_patente,
  a.tipo_actividad,
  a.descripcion_actividad,
  u.nombre AS nombre_usuario,
  a.ubicacion AS ubicacion_actividad,
  s.zona,
  t.fecha_fin AS fecha_deuda,
  CASE WHEN t.fecha_fin < CURDATE() THEN 'debe' ELSE 'no debe' END AS estado_deuda,
  t.estado AS estado_tramite,
  t.monto AS monto_tramite,
  CASE WHEN t.estado = 'activo' THEN 'pendiente de pago' ELSE 'pagado' END AS estado_pago
FROM 
  tramites t
  JOIN patentes p ON t.patente_cod = p.cod
  JOIN actividad_economicas a ON t.actividad_economica_cod = a.cod
  JOIN usuarios u ON t.usuario_cod = u.cod
  JOIN sindicatos s ON u.sindicato_cod = s.cod;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_usuario_normal`
--

DROP VIEW IF EXISTS `vista_usuario_normal`;
CREATE VIEW `vista_usuario_normal` AS
SELECT 
  t.cod AS id_tramite,
  p.nombre AS tipo_patente,
  a.tipo_actividad,
  a.descripcion_actividad,
  u.nombre AS nombre_usuario,
  a.ubicacion AS ubicacion_actividad,
  s.zona,
  t.fecha_fin AS fecha_deuda,
  t.estado AS estado_tramite
FROM 
  tramites t
  LEFT JOIN patentes p ON t.patente_cod = p.cod
  LEFT JOIN actividad_economicas a ON t.actividad_economica_cod = a.cod
  LEFT JOIN usuarios u ON t.usuario_cod = u.cod
  LEFT JOIN sindicatos s ON u.sindicato_cod = s.cod;

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
  ADD KEY `usuario_cod` (`usuario_cod`),
  ADD KEY `actividad_economica_cod` (`actividad_economica_cod`),
  ADD KEY `patente_cod` (`patente_cod`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cod`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `ci` (`ci`),
  ADD KEY `sindicato_cod` (`sindicato_cod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad_economicas`
--
ALTER TABLE `actividad_economicas`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT
