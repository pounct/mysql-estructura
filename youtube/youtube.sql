-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2023 a las 10:00:13
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
-- Base de datos: `youtube`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agrada`
--

CREATE TABLE `agrada` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usario` int(10) UNSIGNED NOT NULL,
  `id_comentari` int(10) UNSIGNED NOT NULL,
  `dataHora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `canal`
--

CREATE TABLE `canal` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL,
  `descripcio` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentari`
--

CREATE TABLE `comentari` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_video` int(10) UNSIGNED NOT NULL,
  `id_usario` int(10) UNSIGNED NOT NULL,
  `textComentari` varchar(200) NOT NULL,
  `dataHora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creaciocanal`
--

CREATE TABLE `creaciocanal` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataHora` datetime NOT NULL,
  `id_usario` int(10) UNSIGNED NOT NULL,
  `id_canal` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creaciopl`
--

CREATE TABLE `creaciopl` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usario` int(10) UNSIGNED NOT NULL,
  `dataHora` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatplaylist`
--

CREATE TABLE `estatplaylist` (
  `id` int(10) UNSIGNED NOT NULL,
  `estado` enum('public','privat') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estatvideo`
--

CREATE TABLE `estatvideo` (
  `id` int(10) UNSIGNED NOT NULL,
  `estado` enum('public','ocult','privat') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etiqueta`
--

CREATE TABLE `etiqueta` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usario` int(10) UNSIGNED NOT NULL,
  `id_video` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL,
  `dataHora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opinion`
--

CREATE TABLE `opinion` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataHora` datetime NOT NULL,
  `estado` enum('like','dislike') NOT NULL,
  `id_video` int(10) UNSIGNED NOT NULL,
  `id_usario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `playlist`
--

CREATE TABLE `playlist` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_creacio_pl` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subscripcio`
--

CREATE TABLE `subscripcio` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataSubscripcio` date NOT NULL,
  `id_usario` int(10) UNSIGNED NOT NULL,
  `id_canal` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usario`
--

CREATE TABLE `usario` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL,
  `nomUsario` varchar(50) NOT NULL,
  `dataNaxement` date NOT NULL,
  `sexe` varchar(20) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `codiPostal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video`
--

CREATE TABLE `video` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcio` varchar(150) NOT NULL,
  `grandaria` int(10) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL,
  `durada` int(10) UNSIGNED NOT NULL,
  `thumbnail` varchar(50) NOT NULL,
  `reproduccions` int(11) NOT NULL,
  `likes` int(11) DEFAULT NULL,
  `dislikes` int(11) DEFAULT NULL,
  `id_etiqueta` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videoplaylist`
--

CREATE TABLE `videoplaylist` (
  `id_video` int(10) UNSIGNED NOT NULL,
  `id_playlist` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agrada`
--
ALTER TABLE `agrada`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usario` (`id_usario`),
  ADD KEY `id_comentari` (`id_comentari`);

--
-- Indices de la tabla `canal`
--
ALTER TABLE `canal`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentari`
--
ALTER TABLE `comentari`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_video` (`id_video`),
  ADD KEY `id_usario` (`id_usario`);

--
-- Indices de la tabla `creaciocanal`
--
ALTER TABLE `creaciocanal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usario` (`id_usario`),
  ADD KEY `id_canal` (`id_canal`);

--
-- Indices de la tabla `creaciopl`
--
ALTER TABLE `creaciopl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usario` (`id_usario`);

--
-- Indices de la tabla `estatplaylist`
--
ALTER TABLE `estatplaylist`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estatvideo`
--
ALTER TABLE `estatvideo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usario` (`id_usario`),
  ADD KEY `id_video` (`id_video`);

--
-- Indices de la tabla `opinion`
--
ALTER TABLE `opinion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_video` (`id_video`),
  ADD KEY `id_usario` (`id_usario`);

--
-- Indices de la tabla `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_creacio_pl` (`id_creacio_pl`);

--
-- Indices de la tabla `subscripcio`
--
ALTER TABLE `subscripcio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usario` (`id_usario`),
  ADD KEY `id_canal` (`id_canal`);

--
-- Indices de la tabla `usario`
--
ALTER TABLE `usario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `videoplaylist`
--
ALTER TABLE `videoplaylist`
  ADD PRIMARY KEY (`id_video`,`id_playlist`),
  ADD KEY `id_playlist` (`id_playlist`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agrada`
--
ALTER TABLE `agrada`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `canal`
--
ALTER TABLE `canal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comentari`
--
ALTER TABLE `comentari`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `creaciocanal`
--
ALTER TABLE `creaciocanal`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `creaciopl`
--
ALTER TABLE `creaciopl`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estatplaylist`
--
ALTER TABLE `estatplaylist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estatvideo`
--
ALTER TABLE `estatvideo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `opinion`
--
ALTER TABLE `opinion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `subscripcio`
--
ALTER TABLE `subscripcio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usario`
--
ALTER TABLE `usario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `video`
--
ALTER TABLE `video`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agrada`
--
ALTER TABLE `agrada`
  ADD CONSTRAINT `agrada_ibfk_1` FOREIGN KEY (`id_usario`) REFERENCES `usario` (`id`),
  ADD CONSTRAINT `agrada_ibfk_2` FOREIGN KEY (`id_comentari`) REFERENCES `comentari` (`id`);

--
-- Filtros para la tabla `comentari`
--
ALTER TABLE `comentari`
  ADD CONSTRAINT `comentari_ibfk_1` FOREIGN KEY (`id_video`) REFERENCES `video` (`id`),
  ADD CONSTRAINT `comentari_ibfk_2` FOREIGN KEY (`id_usario`) REFERENCES `usario` (`id`);

--
-- Filtros para la tabla `creaciocanal`
--
ALTER TABLE `creaciocanal`
  ADD CONSTRAINT `creaciocanal_ibfk_1` FOREIGN KEY (`id_usario`) REFERENCES `usario` (`id`),
  ADD CONSTRAINT `creaciocanal_ibfk_2` FOREIGN KEY (`id_canal`) REFERENCES `canal` (`id`);

--
-- Filtros para la tabla `creaciopl`
--
ALTER TABLE `creaciopl`
  ADD CONSTRAINT `creaciopl_ibfk_1` FOREIGN KEY (`id_usario`) REFERENCES `usario` (`id`);

--
-- Filtros para la tabla `estatplaylist`
--
ALTER TABLE `estatplaylist`
  ADD CONSTRAINT `estatplaylist_ibfk_1` FOREIGN KEY (`id`) REFERENCES `playlist` (`id`);

--
-- Filtros para la tabla `estatvideo`
--
ALTER TABLE `estatvideo`
  ADD CONSTRAINT `estatvideo_ibfk_1` FOREIGN KEY (`id`) REFERENCES `video` (`id`);

--
-- Filtros para la tabla `etiqueta`
--
ALTER TABLE `etiqueta`
  ADD CONSTRAINT `etiqueta_ibfk_1` FOREIGN KEY (`id_usario`) REFERENCES `usario` (`id`),
  ADD CONSTRAINT `etiqueta_ibfk_2` FOREIGN KEY (`id_video`) REFERENCES `video` (`id`);

--
-- Filtros para la tabla `opinion`
--
ALTER TABLE `opinion`
  ADD CONSTRAINT `opinion_ibfk_1` FOREIGN KEY (`id_video`) REFERENCES `video` (`id`),
  ADD CONSTRAINT `opinion_ibfk_2` FOREIGN KEY (`id_usario`) REFERENCES `usario` (`id`);

--
-- Filtros para la tabla `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`id_creacio_pl`) REFERENCES `creaciopl` (`id`);

--
-- Filtros para la tabla `subscripcio`
--
ALTER TABLE `subscripcio`
  ADD CONSTRAINT `subscripcio_ibfk_1` FOREIGN KEY (`id_usario`) REFERENCES `usario` (`id`),
  ADD CONSTRAINT `subscripcio_ibfk_2` FOREIGN KEY (`id_canal`) REFERENCES `canal` (`id`);

--
-- Filtros para la tabla `videoplaylist`
--
ALTER TABLE `videoplaylist`
  ADD CONSTRAINT `videoplaylist_ibfk_1` FOREIGN KEY (`id_video`) REFERENCES `video` (`id`),
  ADD CONSTRAINT `videoplaylist_ibfk_2` FOREIGN KEY (`id_playlist`) REFERENCES `playlist` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
