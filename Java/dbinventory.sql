-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 23 mars 2025 à 11:27
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dbinventory`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `IDACTIVITE` int(11) NOT NULL,
  `DATEACTIVITE` date DEFAULT NULL,
  `TYPEACTIVITE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `addproductsave`
--

CREATE TABLE `addproductsave` (
  `IDADDPRODUCT` int(11) NOT NULL,
  `IDCATEGORY` int(11) NOT NULL,
  `QUANTITYRECEIVED_` int(11) DEFAULT NULL,
  `NAMESUPPLIER` varchar(50) DEFAULT NULL,
  `DATERECEIPT` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `appartenir`
--

CREATE TABLE `appartenir` (
  `IDPRODUCT_` int(11) NOT NULL,
  `IDWAREHOUSE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `IDCATEGORY` int(11) NOT NULL,
  `NAMECATEGORY` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`IDCATEGORY`, `NAMECATEGORY`) VALUES
(2, 'Household appliances'),
(4, 'Clothing'),
(10, 'Electronics'),
(11, 'Eating');

-- --------------------------------------------------------

--
-- Structure de la table `contenir`
--

CREATE TABLE `contenir` (
  `IDACTIVITE` int(11) NOT NULL,
  `IDPRODUCT_` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `employee`
--

CREATE TABLE `employee` (
  `IDEMPLOYEE` int(11) NOT NULL,
  `IDWAREHOUSE` int(11) NOT NULL,
  `NAMEEMPLOYEE` varchar(255) DEFAULT NULL,
  `TELEMPLOYEE` varchar(255) DEFAULT NULL,
  `JOBEMPLOYEE` varchar(255) DEFAULT NULL,
  `CITYEMPLOYEE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `IDPRODUCT` int(11) NOT NULL,
  `IDCATEGORY` int(11) NOT NULL,
  `NAMEPRODUCT` varchar(255) DEFAULT NULL,
  `PURCHASEPRICE` int(11) DEFAULT NULL,
  `DATERECEIPT` date DEFAULT NULL,
  `QUANTITYPRODUCT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`IDPRODUCT`, `IDCATEGORY`, `NAMEPRODUCT`, `PURCHASEPRICE`, `DATERECEIPT`, `QUANTITYPRODUCT`) VALUES
(1, 10, 'Laptop', 2, '2025-03-06', 3),
(3, 10, 'Mouse', 5, '2025-03-06', 3),
(4, 4, 'Clothes', 5, '2025-03-06', 3),
(5, 4, 'Shoes', 4, '2025-03-06', 4),
(6, 10, 'Phones', 6, '2025-03-14', 15);

-- --------------------------------------------------------

--
-- Structure de la table `remoteproductsave`
--

CREATE TABLE `remoteproductsave` (
  `IDPRODUCT` int(11) NOT NULL,
  `IDCATEGORY` int(11) NOT NULL,
  `QUANTITYREMOVED` int(11) DEFAULT NULL,
  `REMOVEDREASON` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `warehouse`
--

CREATE TABLE `warehouse` (
  `IDWAREHOUSE` int(11) NOT NULL,
  `NAMEWAREHOUSE` varchar(255) DEFAULT NULL,
  `CITYWAREHOUSE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `warehouse`
--

INSERT INTO `warehouse` (`IDWAREHOUSE`, `NAMEWAREHOUSE`, `CITYWAREHOUSE`) VALUES
(1, 'MainHouse', 'Tenkodogo'),
(2, 'SecondWarehouse', 'Ouagadougou'),
(3, 'ohff', 'alf');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`IDACTIVITE`);

--
-- Index pour la table `addproductsave`
--
ALTER TABLE `addproductsave`
  ADD PRIMARY KEY (`IDADDPRODUCT`),
  ADD KEY `FK_ADDPRODU_AJOUTER_CATEGORY` (`IDCATEGORY`);

--
-- Index pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD PRIMARY KEY (`IDPRODUCT_`,`IDWAREHOUSE`),
  ADD KEY `FK_APPARTEN_APPARTENI_WAREHOUS` (`IDWAREHOUSE`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`IDCATEGORY`);

--
-- Index pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD PRIMARY KEY (`IDACTIVITE`,`IDPRODUCT_`),
  ADD KEY `FK_CONTENIR_CONTENIR_PRODUCT` (`IDPRODUCT_`);

--
-- Index pour la table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`IDEMPLOYEE`),
  ADD KEY `FK_EMPLOYEE_GERER_WAREHOUS` (`IDWAREHOUSE`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`IDPRODUCT`),
  ADD KEY `FK_PRODUCT_POSSEDER_CATEGORY` (`IDCATEGORY`);

--
-- Index pour la table `remoteproductsave`
--
ALTER TABLE `remoteproductsave`
  ADD PRIMARY KEY (`IDPRODUCT`),
  ADD KEY `FK_REMOTEPR_REMOVE_CATEGORY` (`IDCATEGORY`);

--
-- Index pour la table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`IDWAREHOUSE`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `IDCATEGORY` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `IDPRODUCT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `IDWAREHOUSE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `addproductsave`
--
ALTER TABLE `addproductsave`
  ADD CONSTRAINT `FK_ADDPRODU_AJOUTER_CATEGORY` FOREIGN KEY (`IDCATEGORY`) REFERENCES `category` (`IDCATEGORY`);

--
-- Contraintes pour la table `appartenir`
--
ALTER TABLE `appartenir`
  ADD CONSTRAINT `FK_APPARTEN_APPARTENI_PRODUCT` FOREIGN KEY (`IDPRODUCT_`) REFERENCES `product` (`IDPRODUCT`),
  ADD CONSTRAINT `FK_APPARTEN_APPARTENI_WAREHOUS` FOREIGN KEY (`IDWAREHOUSE`) REFERENCES `warehouse` (`IDWAREHOUSE`);

--
-- Contraintes pour la table `contenir`
--
ALTER TABLE `contenir`
  ADD CONSTRAINT `FK_CONTENIR_CONTENIR2_ACTIVITE` FOREIGN KEY (`IDACTIVITE`) REFERENCES `activite` (`IDACTIVITE`),
  ADD CONSTRAINT `FK_CONTENIR_CONTENIR_PRODUCT` FOREIGN KEY (`IDPRODUCT_`) REFERENCES `product` (`IDPRODUCT`);

--
-- Contraintes pour la table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `FK_EMPLOYEE_GERER_WAREHOUS` FOREIGN KEY (`IDWAREHOUSE`) REFERENCES `warehouse` (`IDWAREHOUSE`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_PRODUCT_POSSEDER_CATEGORY` FOREIGN KEY (`IDCATEGORY`) REFERENCES `category` (`IDCATEGORY`);

--
-- Contraintes pour la table `remoteproductsave`
--
ALTER TABLE `remoteproductsave`
  ADD CONSTRAINT `FK_REMOTEPR_REMOVE_CATEGORY` FOREIGN KEY (`IDCATEGORY`) REFERENCES `category` (`IDCATEGORY`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
