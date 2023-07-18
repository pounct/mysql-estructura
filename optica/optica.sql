-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-07-2023 a las 09:57:48
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adreca`
--

CREATE TABLE `adreca` (
  `id` int(10) UNSIGNED NOT NULL,
  `carrer` varchar(100) NOT NULL,
  `numero` int(11) NOT NULL,
  `pis` int(11) NOT NULL,
  `porta` int(11) NOT NULL,
  `ciutat` varchar(40) NOT NULL,
  `codiPostal` int(11) NOT NULL,
  `pais` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `adrecaId` int(10) UNSIGNED NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `email` varchar(60) NOT NULL,
  `dataRegistre` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataC` date NOT NULL,
  `preuTotal` double NOT NULL,
  `poveidorId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleat`
--

CREATE TABLE `empleat` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcaprovridor`
--

CREATE TABLE `marcaprovridor` (
  `proveidorid` int(10) UNSIGNED NOT NULL,
  `marcaId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

CREATE TABLE `proveidor` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `adrecaId` int(10) UNSIGNED NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `fax` varchar(9) NOT NULL,
  `nif` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recomanat`
--

CREATE TABLE `recomanat` (
  `id` int(10) UNSIGNED NOT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id` int(10) UNSIGNED NOT NULL,
  `graduacioVidres` int(11) NOT NULL,
  `tipusMuntura` varchar(40) NOT NULL,
  `colorMuntura` varchar(40) NOT NULL,
  `ColorVidre` varchar(40) NOT NULL,
  `preu` double NOT NULL,
  `marcaId` int(10) UNSIGNED NOT NULL,
  `compraId` int(10) UNSIGNED NOT NULL,
  `ventaId` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataV` date NOT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `empleatId` int(10) UNSIGNED NOT NULL,
  `preuTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adreca`
--
ALTER TABLE `adreca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `adrecaId` (`adrecaId`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `poveidorId` (`poveidorId`);

--
-- Indices de la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `marcaprovridor`
--
ALTER TABLE `marcaprovridor`
  ADD PRIMARY KEY (`marcaId`,`proveidorid`),
  ADD KEY `ind` (`marcaId`),
  ADD KEY `proveidorid` (`proveidorid`);

--
-- Indices de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nif` (`nif`),
  ADD KEY `ind` (`id`),
  ADD KEY `adrecaId` (`adrecaId`);

--
-- Indices de la tabla `recomanat`
--
ALTER TABLE `recomanat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`nom`),
  ADD KEY `clientId` (`clientId`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `compraId` (`compraId`),
  ADD KEY `marcaId` (`marcaId`),
  ADD KEY `ventaId` (`ventaId`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `empleatId` (`empleatId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adreca`
--
ALTER TABLE `adreca`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleat`
--
ALTER TABLE `empleat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recomanat`
--
ALTER TABLE `recomanat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`adrecaId`) REFERENCES `adreca` (`id`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`poveidorId`) REFERENCES `proveidor` (`id`);

--
-- Filtros para la tabla `marcaprovridor`
--
ALTER TABLE `marcaprovridor`
  ADD CONSTRAINT `marcaprovridor_ibfk_1` FOREIGN KEY (`marcaId`) REFERENCES `marca` (`id`),
  ADD CONSTRAINT `marcaprovridor_ibfk_2` FOREIGN KEY (`proveidorid`) REFERENCES `proveidor` (`id`);

--
-- Filtros para la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD CONSTRAINT `proveidor_ibfk_1` FOREIGN KEY (`adrecaId`) REFERENCES `adreca` (`id`);

--
-- Filtros para la tabla `recomanat`
--
ALTER TABLE `recomanat`
  ADD CONSTRAINT `recomanat_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`);

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`compraId`) REFERENCES `compra` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ulleres_ibfk_2` FOREIGN KEY (`marcaId`) REFERENCES `marca` (`id`),
  ADD CONSTRAINT `ulleres_ibfk_3` FOREIGN KEY (`ventaId`) REFERENCES `venta` (`id`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`empleatId`) REFERENCES `empleat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
