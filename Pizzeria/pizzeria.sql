-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2023 a las 09:46:21
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
-- Base de datos: `pizzeria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `beguda`
--

CREATE TABLE `beguda` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `botiga`
--

CREATE TABLE `botiga` (
  `id` int(10) UNSIGNED NOT NULL,
  `adreca` varchar(150) NOT NULL,
  `codiPostal` int(11) NOT NULL,
  `localitatId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `cognoms` varchar(100) NOT NULL,
  `adreca` varchar(151) NOT NULL,
  `codiPostal` int(11) NOT NULL,
  `telefon` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comanda`
--

CREATE TABLE `comanda` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataHora` datetime NOT NULL,
  `clientId` int(10) UNSIGNED NOT NULL,
  `botigaId` int(10) UNSIGNED NOT NULL,
  `preuTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuiner`
--

CREATE TABLE `cuiner` (
  `id` int(10) UNSIGNED NOT NULL,
  `funcio` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleat`
--

CREATE TABLE `empleat` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `cognoms` varchar(80) NOT NULL,
  `nif` varchar(9) NOT NULL,
  `telefon` varchar(9) NOT NULL,
  `botigaId` int(10) UNSIGNED NOT NULL,
  `tipo` enum('cuiner','repartidor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hamburguesa`
--

CREATE TABLE `hamburguesa` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liniacomanda`
--

CREATE TABLE `liniacomanda` (
  `id` int(10) UNSIGNED NOT NULL,
  `comandaId` int(10) UNSIGNED NOT NULL,
  `producteId` int(10) UNSIGNED NOT NULL,
  `quantitat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lliurament`
--

CREATE TABLE `lliurament` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `comandaId` int(10) UNSIGNED NOT NULL,
  `repartidorId` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localitat`
--

CREATE TABLE `localitat` (
  `id` int(10) UNSIGNED NOT NULL,
  `provinciaId` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizza`
--

CREATE TABLE `pizza` (
  `id` int(10) UNSIGNED NOT NULL,
  `categoria` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producte`
--

CREATE TABLE `producte` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `descripcio` varchar(250) NOT NULL,
  `imatge` varchar(120) NOT NULL,
  `preu` double NOT NULL,
  `tipo` enum('hamburguesa','pizza','beguda') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `repartidor`
--

CREATE TABLE `repartidor` (
  `id` int(10) UNSIGNED NOT NULL,
  `funcio` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `beguda`
--
ALTER TABLE `beguda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `botiga`
--
ALTER TABLE `botiga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `localitatId` (`localitatId`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `botigaId` (`botigaId`);

--
-- Indices de la tabla `cuiner`
--
ALTER TABLE `cuiner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `botigaId` (`botigaId`);

--
-- Indices de la tabla `hamburguesa`
--
ALTER TABLE `hamburguesa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `liniacomanda`
--
ALTER TABLE `liniacomanda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `comandaId` (`comandaId`),
  ADD KEY `producteId` (`producteId`);

--
-- Indices de la tabla `lliurament`
--
ALTER TABLE `lliurament`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `comandaId` (`comandaId`),
  ADD KEY `repartidorId` (`repartidorId`);

--
-- Indices de la tabla `localitat`
--
ALTER TABLE `localitat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `provinciaId` (`provinciaId`);

--
-- Indices de la tabla `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `producte`
--
ALTER TABLE `producte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Indices de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `botiga`
--
ALTER TABLE `botiga`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comanda`
--
ALTER TABLE `comanda`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuiner`
--
ALTER TABLE `cuiner`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleat`
--
ALTER TABLE `empleat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `liniacomanda`
--
ALTER TABLE `liniacomanda`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lliurament`
--
ALTER TABLE `lliurament`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `localitat`
--
ALTER TABLE `localitat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producte`
--
ALTER TABLE `producte`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `repartidor`
--
ALTER TABLE `repartidor`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `beguda`
--
ALTER TABLE `beguda`
  ADD CONSTRAINT `beguda_ibfk_1` FOREIGN KEY (`id`) REFERENCES `producte` (`id`);

--
-- Filtros para la tabla `botiga`
--
ALTER TABLE `botiga`
  ADD CONSTRAINT `botiga_ibfk_1` FOREIGN KEY (`localitatId`) REFERENCES `localitat` (`id`);

--
-- Filtros para la tabla `comanda`
--
ALTER TABLE `comanda`
  ADD CONSTRAINT `comanda_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `comanda_ibfk_2` FOREIGN KEY (`botigaId`) REFERENCES `botiga` (`id`);

--
-- Filtros para la tabla `cuiner`
--
ALTER TABLE `cuiner`
  ADD CONSTRAINT `cuiner_ibfk_1` FOREIGN KEY (`id`) REFERENCES `empleat` (`id`);

--
-- Filtros para la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD CONSTRAINT `empleat_ibfk_1` FOREIGN KEY (`botigaId`) REFERENCES `botiga` (`id`);

--
-- Filtros para la tabla `hamburguesa`
--
ALTER TABLE `hamburguesa`
  ADD CONSTRAINT `hamburguesa_ibfk_1` FOREIGN KEY (`id`) REFERENCES `producte` (`id`);

--
-- Filtros para la tabla `liniacomanda`
--
ALTER TABLE `liniacomanda`
  ADD CONSTRAINT `liniacomanda_ibfk_1` FOREIGN KEY (`comandaId`) REFERENCES `comanda` (`id`),
  ADD CONSTRAINT `liniacomanda_ibfk_2` FOREIGN KEY (`producteId`) REFERENCES `producte` (`id`);

--
-- Filtros para la tabla `lliurament`
--
ALTER TABLE `lliurament`
  ADD CONSTRAINT `lliurament_ibfk_1` FOREIGN KEY (`comandaId`) REFERENCES `comanda` (`id`),
  ADD CONSTRAINT `lliurament_ibfk_2` FOREIGN KEY (`repartidorId`) REFERENCES `repartidor` (`id`);

--
-- Filtros para la tabla `localitat`
--
ALTER TABLE `localitat`
  ADD CONSTRAINT `localitat_ibfk_1` FOREIGN KEY (`provinciaId`) REFERENCES `provincia` (`id`);

--
-- Filtros para la tabla `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `pizza_ibfk_1` FOREIGN KEY (`id`) REFERENCES `producte` (`id`);

--
-- Filtros para la tabla `repartidor`
--
ALTER TABLE `repartidor`
  ADD CONSTRAINT `repartidor_ibfk_1` FOREIGN KEY (`id`) REFERENCES `empleat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
