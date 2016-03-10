CREATE DATABASE IF NOT EXISTS cataloguebd;
use cataloguebd;

-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Mer 13 Juillet 2011 à 13:03
-- Version du serveur: 5.1.36
-- Version de PHP: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `cataloguebd`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteurs`
--

CREATE TABLE IF NOT EXISTS `auteurs` (
  `aut_id` int(11) NOT NULL AUTO_INCREMENT,
  `aut_nom` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`aut_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Structure de la table `bandesdessinees`
--

CREATE TABLE IF NOT EXISTS `bandesdessinees` (
  `bd_id` int(11) NOT NULL AUTO_INCREMENT,
  `bd_titre` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `bd_resume` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `bd_image` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `bd_auteur_id` int(11) NOT NULL,
  PRIMARY KEY (`bd_id`),
  KEY `fk_aut_bd` (`bd_auteur_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT AUTO_INCREMENT=59 ;

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE IF NOT EXISTS `commentaires` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_bd_id` int(11) NOT NULL,
  `com_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `com_auteur` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `com_texte` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`com_id`),
  KEY `fk_bd_comment` (`com_bd_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Structure de la table `liens_bd_themes`
--

CREATE TABLE IF NOT EXISTS `liens_bd_themes` (
  `lien_bd_id` int(11) NOT NULL,
  `lien_themes_id` int(11) NOT NULL,
  PRIMARY KEY (`lien_bd_id`,`lien_themes_id`),
  KEY `fk_themes_lien` (`lien_themes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `themes`
--

CREATE TABLE IF NOT EXISTS `themes` (
  `th_id` int(11) NOT NULL AUTO_INCREMENT,
  `th_intitule` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`th_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `bandesdessinees`
--
ALTER TABLE `bandesdessinees`
  ADD CONSTRAINT `fk_aut_bd` FOREIGN KEY (`bd_auteur_id`) REFERENCES `auteurs` (`aut_id`);

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `fk_bd_comment` FOREIGN KEY (`com_bd_id`) REFERENCES `bandesdessinees` (`bd_id`);

--
-- Contraintes pour la table `liens_bd_themes`
--
ALTER TABLE `liens_bd_themes`
  ADD CONSTRAINT `fk_bd_lien` FOREIGN KEY (`lien_bd_id`) REFERENCES `bandesdessinees` (`bd_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_themes_lien` FOREIGN KEY (`lien_themes_id`) REFERENCES `themes` (`th_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;