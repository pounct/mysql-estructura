-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 16 juil. 2023 à 02:48
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
-- Base de données : `pizzeria`
--

-- --------------------------------------------------------

--
-- Structure de la table `beguda`
--

CREATE TABLE `beguda` (
  `id` int(11) NOT NULL,
  `categoria` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `botiga`
--

CREATE TABLE `botiga` (
  `id` int(11) NOT NULL,
  `adreca` varchar(150) NOT NULL,
  `codiPostal` int(11) NOT NULL,
  `localitatId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `cognoms` varchar(80) NOT NULL,
  `adreca` varchar(151) NOT NULL,
  `codiPostal` int(11) NOT NULL,
  `telefon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `comanda`
--

CREATE TABLE `comanda` (
  `id` int(11) NOT NULL,
  `dataHora` varchar(19) NOT NULL,
  `clientId` int(11) NOT NULL,
  `botigaId` int(11) NOT NULL,
  `preuTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cuiner`
--

CREATE TABLE `cuiner` (
  `id` int(11) NOT NULL,
  `funcio` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `empleat`
--

CREATE TABLE `empleat` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `cognoms` varchar(80) NOT NULL,
  `nif` varchar(11) NOT NULL,
  `telefon` int(11) NOT NULL,
  `botigaId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `hamburguesa`
--

CREATE TABLE `hamburguesa` (
  `id` int(11) NOT NULL,
  `categoria` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `liniacomanda`
--

CREATE TABLE `liniacomanda` (
  `id` int(11) NOT NULL,
  `comandaId` int(11) NOT NULL,
  `producteId` int(11) NOT NULL,
  `quantitat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `lliurament`
--

CREATE TABLE `lliurament` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `comandaId` int(11) NOT NULL,
  `repartidorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `localitat`
--

CREATE TABLE `localitat` (
  `id` int(11) NOT NULL,
  `provinciaId` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pizza`
--

CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `categoria` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `producte`
--

CREATE TABLE `producte` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `descripcio` varchar(250) NOT NULL,
  `imatge` varchar(120) NOT NULL,
  `preu` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `provincia`
--

CREATE TABLE `provincia` (
  `id` int(11) NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `repartidor`
--

CREATE TABLE `repartidor` (
  `id` int(11) NOT NULL,
  `funcio` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `beguda`
--
ALTER TABLE `beguda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Index pour la table `botiga`
--
ALTER TABLE `botiga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `localitatId` (`localitatId`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD KEY `ind` (`id`);

--
-- Index pour la table `comanda`
--
ALTER TABLE `comanda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `clientId` (`clientId`),
  ADD KEY `botigaId` (`botigaId`);

--
-- Index pour la table `cuiner`
--
ALTER TABLE `cuiner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Index pour la table `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `botigaId` (`botigaId`);

--
-- Index pour la table `hamburguesa`
--
ALTER TABLE `hamburguesa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Index pour la table `liniacomanda`
--
ALTER TABLE `liniacomanda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `comandaId` (`comandaId`),
  ADD KEY `producteId` (`producteId`);

--
-- Index pour la table `lliurament`
--
ALTER TABLE `lliurament`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `comandaId` (`comandaId`),
  ADD KEY `repartidorId` (`repartidorId`);

--
-- Index pour la table `localitat`
--
ALTER TABLE `localitat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`),
  ADD KEY `provinciaId` (`provinciaId`);

--
-- Index pour la table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- Index pour la table `producte`
--
ALTER TABLE `producte`
  ADD KEY `ind` (`id`);

--
-- Index pour la table `provincia`
--
ALTER TABLE `provincia`
  ADD KEY `ind` (`id`);

--
-- Index pour la table `repartidor`
--
ALTER TABLE `repartidor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ind` (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `beguda`
--
ALTER TABLE `beguda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `botiga`
--
ALTER TABLE `botiga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `comanda`
--
ALTER TABLE `comanda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cuiner`
--
ALTER TABLE `cuiner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `empleat`
--
ALTER TABLE `empleat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `hamburguesa`
--
ALTER TABLE `hamburguesa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `liniacomanda`
--
ALTER TABLE `liniacomanda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `localitat`
--
ALTER TABLE `localitat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `producte`
--
ALTER TABLE `producte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `repartidor`
--
ALTER TABLE `repartidor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `beguda`
--
ALTER TABLE `beguda`
  ADD CONSTRAINT `beguda_ibfk_1` FOREIGN KEY (`id`) REFERENCES `producte` (`id`);

--
-- Contraintes pour la table `botiga`
--
ALTER TABLE `botiga`
  ADD CONSTRAINT `botiga_ibfk_1` FOREIGN KEY (`localitatId`) REFERENCES `localitat` (`id`);

--
-- Contraintes pour la table `comanda`
--
ALTER TABLE `comanda`
  ADD CONSTRAINT `comanda_ibfk_1` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `comanda_ibfk_2` FOREIGN KEY (`botigaId`) REFERENCES `botiga` (`id`);

--
-- Contraintes pour la table `cuiner`
--
ALTER TABLE `cuiner`
  ADD CONSTRAINT `cuiner_ibfk_1` FOREIGN KEY (`id`) REFERENCES `empleat` (`id`);

--
-- Contraintes pour la table `empleat`
--
ALTER TABLE `empleat`
  ADD CONSTRAINT `empleat_ibfk_1` FOREIGN KEY (`botigaId`) REFERENCES `botiga` (`id`);

--
-- Contraintes pour la table `hamburguesa`
--
ALTER TABLE `hamburguesa`
  ADD CONSTRAINT `hamburguesa_ibfk_1` FOREIGN KEY (`id`) REFERENCES `producte` (`id`);

--
-- Contraintes pour la table `liniacomanda`
--
ALTER TABLE `liniacomanda`
  ADD CONSTRAINT `liniacomanda_ibfk_1` FOREIGN KEY (`comandaId`) REFERENCES `comanda` (`id`),
  ADD CONSTRAINT `liniacomanda_ibfk_2` FOREIGN KEY (`producteId`) REFERENCES `producte` (`id`);

--
-- Contraintes pour la table `lliurament`
--
ALTER TABLE `lliurament`
  ADD CONSTRAINT `lliurament_ibfk_1` FOREIGN KEY (`comandaId`) REFERENCES `comanda` (`id`),
  ADD CONSTRAINT `lliurament_ibfk_2` FOREIGN KEY (`repartidorId`) REFERENCES `repartidor` (`id`);

--
-- Contraintes pour la table `localitat`
--
ALTER TABLE `localitat`
  ADD CONSTRAINT `localitat_ibfk_1` FOREIGN KEY (`provinciaId`) REFERENCES `provincia` (`id`);

--
-- Contraintes pour la table `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `pizza_ibfk_1` FOREIGN KEY (`id`) REFERENCES `producte` (`id`);

--
-- Contraintes pour la table `repartidor`
--
ALTER TABLE `repartidor`
  ADD CONSTRAINT `repartidor_ibfk_1` FOREIGN KEY (`id`) REFERENCES `empleat` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
