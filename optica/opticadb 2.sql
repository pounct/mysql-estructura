-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 17 juil. 2023 à 01:49
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
-- Base de données : `opticadb`
--

-- --------------------------------------------------------

--
-- Structure de la table `adreca`
--

CREATE TABLE `adreca` (
  `id` int(11) NOT NULL,
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
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `adrecaId` int(11) NOT NULL,
  `telefon` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `dataRegistre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `compra`
--

CREATE TABLE `compra` (
  `id` int(11) NOT NULL,
  `dataC` varchar(10) NOT NULL,
  `preuTotal` double NOT NULL,
  `poveidorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `empleat`
--

CREATE TABLE `empleat` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `marcaprovridor`
--

CREATE TABLE `marcaprovridor` (
  `proveidorid` int(11) NOT NULL,
  `marcaId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `proveidor`
--

CREATE TABLE `proveidor` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `adrecaId` int(11) NOT NULL,
  `telefon` int(11) NOT NULL,
  `fax` int(11) NOT NULL,
  `nif` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `recomanat`
--

CREATE TABLE `recomanat` (
  `id` int(11) NOT NULL,
  `clientId` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ulleres`
--

CREATE TABLE `ulleres` (
  `id` int(11) NOT NULL,
  `graduacioVidres` int(11) NOT NULL,
  `tipusMuntura` varchar(40) NOT NULL,
  `colorMuntura` varchar(40) NOT NULL,
  `ColorVidre` varchar(40) NOT NULL,
  `preu` double NOT NULL,
  `marcaId` int(11) NOT NULL,
  `compraId` int(11) NOT NULL,
  `ventaId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `venta`
--

CREATE TABLE `venta` (
  `id` int(11) NOT NULL,
  `dataV` varchar(10) NOT NULL,
  `clientId` int(11) NOT NULL,
  `empleatId` int(11) NOT NULL,
  `preuTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adreca`
--
ALTER TABLE `adreca`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`nom`),
  ADD KEY `adrecaId` (`adrecaId`);

--
-- Index pour la table `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`dataC`),
  ADD KEY `poveidorId` (`poveidorId`);

--
-- Index pour la table `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `marcaprovridor`
--
ALTER TABLE `marcaprovridor`
  ADD PRIMARY KEY (`marcaId`,`proveidorid`),
  ADD KEY `ind` (`marcaId`),
  ADD KEY `proveidorid` (`proveidorid`);

--
-- Index pour la table `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`nom`),
  ADD KEY `adrecaId` (`adrecaId`);

--
-- Index pour la table `recomanat`
--
ALTER TABLE `recomanat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`nom`),
  ADD KEY `clientId` (`clientId`);

--
-- Index pour la table `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`compraId`),
  ADD KEY `marcaId` (`marcaId`),
  ADD KEY `ventaId` (`ventaId`);

--
-- Index pour la table `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`dataV`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `empleatId` (`empleatId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adreca`
--
ALTER TABLE `adreca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `compra`
--
ALTER TABLE `compra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `empleat`
--
ALTER TABLE `empleat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `marca`
--
ALTER TABLE `marca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `proveidor`
--
ALTER TABLE `proveidor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `recomanat`
--
ALTER TABLE `recomanat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `venta`
--
ALTER TABLE `venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`adrecaId`) REFERENCES `adreca` (`id`);

--
-- Contraintes pour la table `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`poveidorId`) REFERENCES `proveidor` (`id`);

--
-- Contraintes pour la table `marcaprovridor`
--
ALTER TABLE `marcaprovridor`
  ADD CONSTRAINT `marcaprovridor_ibfk_1` FOREIGN KEY (`marcaId`) REFERENCES `marca` (`id`),
  ADD CONSTRAINT `marcaprovridor_ibfk_2` FOREIGN KEY (`proveidorid`) REFERENCES `proveidor` (`id`);

--
-- Contraintes pour la table `proveidor`
--
ALTER TABLE `proveidor`
  ADD CONSTRAINT `proveidor_ibfk_1` FOREIGN KEY (`adrecaId`) REFERENCES `adreca` (`id`);

--
-- Contraintes pour la table `recomanat`
--
ALTER TABLE `recomanat`
  ADD CONSTRAINT `recomanat_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`compraId`) REFERENCES `compra` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ulleres_ibfk_2` FOREIGN KEY (`marcaId`) REFERENCES `marca` (`id`),
  ADD CONSTRAINT `ulleres_ibfk_3` FOREIGN KEY (`ventaId`) REFERENCES `venta` (`id`);

--
-- Contraintes pour la table `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`empleatId`) REFERENCES `empleat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
