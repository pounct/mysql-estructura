-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 23 juil. 2023 à 23:29
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `spotify`
--

-- --------------------------------------------------------

--
-- Structure de la table `activa`
--

CREATE TABLE `activa` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `addicio`
--

CREATE TABLE `addicio` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataHora` datetime NOT NULL,
  `id_usari` int(10) UNSIGNED NOT NULL,
  `id_compartida` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `album`
--

CREATE TABLE `album` (
  `id` int(10) UNSIGNED NOT NULL,
  `titol` varchar(50) NOT NULL,
  `anyPublicacio` int(11) NOT NULL,
  `imatge` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `artista`
--

CREATE TABLE `artista` (
  `id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `imatge` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cancio`
--

CREATE TABLE `cancio` (
  `id` int(10) UNSIGNED NOT NULL,
  `titol` varchar(50) NOT NULL,
  `durada` int(11) NOT NULL,
  `reproduccions` int(11) NOT NULL,
  `id_album` int(10) UNSIGNED NOT NULL,
  `id_addicio` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `compartida`
--

CREATE TABLE `compartida` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `creaciopl`
--

CREATE TABLE `creaciopl` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataHora` datetime NOT NULL,
  `id_usari` int(10) UNSIGNED NOT NULL,
  `id_playlist` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `eliminacio`
--

CREATE TABLE `eliminacio` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataHora` date NOT NULL,
  `id_usari` int(10) UNSIGNED NOT NULL,
  `id_creaciopl` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `esborrada`
--

CREATE TABLE `esborrada` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `estilomusica`
--

CREATE TABLE `estilomusica` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(40) NOT NULL,
  `id_artista` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `favorite`
--

CREATE TABLE `favorite` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_usari` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `favoritealbum`
--

CREATE TABLE `favoritealbum` (
  `id_favorite` int(10) UNSIGNED NOT NULL,
  `id_album` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `favoritecancio`
--

CREATE TABLE `favoritecancio` (
  `id_favorite` int(10) UNSIGNED NOT NULL,
  `id_cancio` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `free`
--

CREATE TABLE `free` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pagament`
--

CREATE TABLE `pagament` (
  `id` int(10) UNSIGNED NOT NULL,
  `datap` date NOT NULL,
  `total` double NOT NULL,
  `id_subscripcio` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paypal`
--

CREATE TABLE `paypal` (
  `id_paypal` int(10) UNSIGNED NOT NULL,
  `NomUsuari` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `playlist`
--

CREATE TABLE `playlist` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `eliminada` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `playlistcompartidausario`
--

CREATE TABLE `playlistcompartidausario` (
  `id_compartida` int(10) UNSIGNED NOT NULL,
  `id_usari` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `premium`
--

CREATE TABLE `premium` (
  `id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `publicacio`
--

CREATE TABLE `publicacio` (
  `id_album` int(10) UNSIGNED NOT NULL,
  `id_artista` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recuperacio`
--

CREATE TABLE `recuperacio` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataHora` datetime NOT NULL,
  `id_eliminacio` int(10) UNSIGNED NOT NULL,
  `id_usari` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `seguimiento`
--

CREATE TABLE `seguimiento` (
  `id_usari` int(10) UNSIGNED NOT NULL,
  `id_artista` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `subscripcio`
--

CREATE TABLE `subscripcio` (
  `id` int(10) UNSIGNED NOT NULL,
  `dataInici` date NOT NULL,
  `dataRenovacio` date NOT NULL,
  `id_premium` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `targeta`
--

CREATE TABLE `targeta` (
  `id_targeta` int(10) UNSIGNED NOT NULL,
  `Numero` int(11) NOT NULL,
  `caducitat` date NOT NULL,
  `codiSegeritat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `usuari`
--

CREATE TABLE `usuari` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(80) NOT NULL,
  `passwordU` varchar(20) NOT NULL,
  `nomUsuari` varchar(20) NOT NULL,
  `dataNaxement` date NOT NULL,
  `sexe` varchar(10) NOT NULL,
  `pais` varchar(40) NOT NULL,
  `codiPostal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activa`
--
ALTER TABLE `activa`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `addicio`
--
ALTER TABLE `addicio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usari` (`id_usari`),
  ADD KEY `id_compartida` (`id_compartida`);

--
-- Index pour la table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `artista`
--
ALTER TABLE `artista`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cancio`
--
ALTER TABLE `cancio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_album` (`id_album`),
  ADD KEY `id_addicio` (`id_addicio`);

--
-- Index pour la table `compartida`
--
ALTER TABLE `compartida`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `creaciopl`
--
ALTER TABLE `creaciopl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usari` (`id_usari`),
  ADD KEY `id_playlist` (`id_playlist`);

--
-- Index pour la table `eliminacio`
--
ALTER TABLE `eliminacio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usari` (`id_usari`),
  ADD KEY `id_creaciopl` (`id_creaciopl`);

--
-- Index pour la table `esborrada`
--
ALTER TABLE `esborrada`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `estilomusica`
--
ALTER TABLE `estilomusica`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_artista` (`id_artista`);

--
-- Index pour la table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usari` (`id_usari`);

--
-- Index pour la table `favoritealbum`
--
ALTER TABLE `favoritealbum`
  ADD PRIMARY KEY (`id_favorite`,`id_album`),
  ADD KEY `id_album` (`id_album`);

--
-- Index pour la table `favoritecancio`
--
ALTER TABLE `favoritecancio`
  ADD PRIMARY KEY (`id_favorite`,`id_cancio`),
  ADD KEY `id_cancio` (`id_cancio`);

--
-- Index pour la table `free`
--
ALTER TABLE `free`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pagament`
--
ALTER TABLE `pagament`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_subscripcio` (`id_subscripcio`);

--
-- Index pour la table `paypal`
--
ALTER TABLE `paypal`
  ADD PRIMARY KEY (`id_paypal`);

--
-- Index pour la table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `playlistcompartidausario`
--
ALTER TABLE `playlistcompartidausario`
  ADD PRIMARY KEY (`id_usari`,`id_compartida`),
  ADD KEY `id_compartida` (`id_compartida`);

--
-- Index pour la table `premium`
--
ALTER TABLE `premium`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `publicacio`
--
ALTER TABLE `publicacio`
  ADD PRIMARY KEY (`id_album`,`id_artista`),
  ADD KEY `id_artista` (`id_artista`);

--
-- Index pour la table `recuperacio`
--
ALTER TABLE `recuperacio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usari` (`id_usari`),
  ADD KEY `id_eliminacio` (`id_eliminacio`);

--
-- Index pour la table `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD PRIMARY KEY (`id_usari`,`id_artista`),
  ADD KEY `id_artista` (`id_artista`);

--
-- Index pour la table `subscripcio`
--
ALTER TABLE `subscripcio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_premium` (`id_premium`);

--
-- Index pour la table `targeta`
--
ALTER TABLE `targeta`
  ADD PRIMARY KEY (`id_targeta`);

--
-- Index pour la table `usuari`
--
ALTER TABLE `usuari`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `addicio`
--
ALTER TABLE `addicio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `album`
--
ALTER TABLE `album`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `artista`
--
ALTER TABLE `artista`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cancio`
--
ALTER TABLE `cancio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `creaciopl`
--
ALTER TABLE `creaciopl`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `eliminacio`
--
ALTER TABLE `eliminacio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `estilomusica`
--
ALTER TABLE `estilomusica`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pagament`
--
ALTER TABLE `pagament`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `recuperacio`
--
ALTER TABLE `recuperacio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `subscripcio`
--
ALTER TABLE `subscripcio`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `usuari`
--
ALTER TABLE `usuari`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activa`
--
ALTER TABLE `activa`
  ADD CONSTRAINT `activa_ibfk_1` FOREIGN KEY (`id`) REFERENCES `playlist` (`id`);

--
-- Contraintes pour la table `addicio`
--
ALTER TABLE `addicio`
  ADD CONSTRAINT `addicio_ibfk_1` FOREIGN KEY (`id_usari`) REFERENCES `usuari` (`id`),
  ADD CONSTRAINT `addicio_ibfk_2` FOREIGN KEY (`id_compartida`) REFERENCES `compartida` (`id`);

--
-- Contraintes pour la table `cancio`
--
ALTER TABLE `cancio`
  ADD CONSTRAINT `cancio_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id`),
  ADD CONSTRAINT `cancio_ibfk_2` FOREIGN KEY (`id_addicio`) REFERENCES `addicio` (`id`);

--
-- Contraintes pour la table `compartida`
--
ALTER TABLE `compartida`
  ADD CONSTRAINT `compartida_ibfk_1` FOREIGN KEY (`id`) REFERENCES `activa` (`id`);

--
-- Contraintes pour la table `creaciopl`
--
ALTER TABLE `creaciopl`
  ADD CONSTRAINT `creaciopl_ibfk_1` FOREIGN KEY (`id_usari`) REFERENCES `usuari` (`id`),
  ADD CONSTRAINT `creaciopl_ibfk_2` FOREIGN KEY (`id_playlist`) REFERENCES `playlist` (`id`);

--
-- Contraintes pour la table `eliminacio`
--
ALTER TABLE `eliminacio`
  ADD CONSTRAINT `eliminacio_ibfk_1` FOREIGN KEY (`id_usari`) REFERENCES `usuari` (`id`),
  ADD CONSTRAINT `eliminacio_ibfk_2` FOREIGN KEY (`id_creaciopl`) REFERENCES `creaciopl` (`id`);

--
-- Contraintes pour la table `esborrada`
--
ALTER TABLE `esborrada`
  ADD CONSTRAINT `esborrada_ibfk_1` FOREIGN KEY (`id`) REFERENCES `playlist` (`id`);

--
-- Contraintes pour la table `estilomusica`
--
ALTER TABLE `estilomusica`
  ADD CONSTRAINT `estilomusica_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id`);

--
-- Contraintes pour la table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`id_usari`) REFERENCES `usuari` (`id`);

--
-- Contraintes pour la table `favoritealbum`
--
ALTER TABLE `favoritealbum`
  ADD CONSTRAINT `favoritealbum_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id`),
  ADD CONSTRAINT `favoritealbum_ibfk_2` FOREIGN KEY (`id_favorite`) REFERENCES `favorite` (`id`);

--
-- Contraintes pour la table `favoritecancio`
--
ALTER TABLE `favoritecancio`
  ADD CONSTRAINT `favoritecancio_ibfk_1` FOREIGN KEY (`id_cancio`) REFERENCES `cancio` (`id`),
  ADD CONSTRAINT `favoritecancio_ibfk_2` FOREIGN KEY (`id_favorite`) REFERENCES `favorite` (`id`);

--
-- Contraintes pour la table `free`
--
ALTER TABLE `free`
  ADD CONSTRAINT `free_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuari` (`id`);

--
-- Contraintes pour la table `pagament`
--
ALTER TABLE `pagament`
  ADD CONSTRAINT `pagament_ibfk_1` FOREIGN KEY (`id_subscripcio`) REFERENCES `subscripcio` (`id`);

--
-- Contraintes pour la table `paypal`
--
ALTER TABLE `paypal`
  ADD CONSTRAINT `paypal_ibfk_1` FOREIGN KEY (`id_paypal`) REFERENCES `pagament` (`id`);

--
-- Contraintes pour la table `playlistcompartidausario`
--
ALTER TABLE `playlistcompartidausario`
  ADD CONSTRAINT `playlistcompartidausario_ibfk_1` FOREIGN KEY (`id_usari`) REFERENCES `usuari` (`id`),
  ADD CONSTRAINT `playlistcompartidausario_ibfk_2` FOREIGN KEY (`id_compartida`) REFERENCES `compartida` (`id`);

--
-- Contraintes pour la table `premium`
--
ALTER TABLE `premium`
  ADD CONSTRAINT `premium_ibfk_1` FOREIGN KEY (`id`) REFERENCES `usuari` (`id`);

--
-- Contraintes pour la table `publicacio`
--
ALTER TABLE `publicacio`
  ADD CONSTRAINT `publicacio_ibfk_1` FOREIGN KEY (`id_album`) REFERENCES `album` (`id`),
  ADD CONSTRAINT `publicacio_ibfk_2` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id`);

--
-- Contraintes pour la table `recuperacio`
--
ALTER TABLE `recuperacio`
  ADD CONSTRAINT `recuperacio_ibfk_1` FOREIGN KEY (`id_usari`) REFERENCES `usuari` (`id`),
  ADD CONSTRAINT `recuperacio_ibfk_2` FOREIGN KEY (`id_eliminacio`) REFERENCES `eliminacio` (`id`);

--
-- Contraintes pour la table `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD CONSTRAINT `seguimiento_ibfk_1` FOREIGN KEY (`id_usari`) REFERENCES `usuari` (`id`),
  ADD CONSTRAINT `seguimiento_ibfk_2` FOREIGN KEY (`id_artista`) REFERENCES `artista` (`id`);

--
-- Contraintes pour la table `subscripcio`
--
ALTER TABLE `subscripcio`
  ADD CONSTRAINT `subscripcio_ibfk_1` FOREIGN KEY (`id_premium`) REFERENCES `premium` (`id`);

--
-- Contraintes pour la table `targeta`
--
ALTER TABLE `targeta`
  ADD CONSTRAINT `targeta_ibfk_1` FOREIGN KEY (`id_targeta`) REFERENCES `pagament` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
