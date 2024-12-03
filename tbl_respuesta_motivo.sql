-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-12-2024 a las 22:11:27
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_escuela_gaitan`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_respuesta_motivo`
--

CREATE TABLE `tbl_respuesta_motivo` (
  `id_motivo` int NOT NULL,
  `motivo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rechazomotivo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rechazosubmotivo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_respuesta_motivo`
--

INSERT INTO `tbl_respuesta_motivo` (`id_motivo`, `motivo`, `rechazomotivo`, `rechazosubmotivo`) VALUES
(1, 'No se puede vender - Datos Inválidos', 'DI', 'NO_VENDIBLE'),
(2, 'No se puede vender - No localizo despues de Info', 'INF', 'NO_VENDIBLE');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_respuesta_motivo`
--
ALTER TABLE `tbl_respuesta_motivo`
  ADD PRIMARY KEY (`id_motivo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_respuesta_motivo`
--
ALTER TABLE `tbl_respuesta_motivo`
  MODIFY `id_motivo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
