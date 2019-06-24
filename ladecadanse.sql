-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Lun 24 Juin 2019 à 22:29
-- Version du serveur :  10.1.37-MariaDB-0+deb9u1
-- Version de PHP :  7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ladecadanse2`
--

-- --------------------------------------------------------

--
-- Structure de la table `affiliation`
--

CREATE TABLE `affiliation` (
  `idPersonne` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `idAffiliation` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `genre` set('lieu','association','groupe') NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `breve`
--

CREATE TABLE `breve` (
  `idBreve` mediumint(8) UNSIGNED NOT NULL,
  `titre` varchar(255) NOT NULL DEFAULT '',
  `contenu` text NOT NULL,
  `img_breve` varchar(255) NOT NULL DEFAULT '',
  `date_debut` date NOT NULL DEFAULT '0000-00-00',
  `date_fin` date NOT NULL DEFAULT '0000-00-00',
  `idPersonne` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `actif` tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  `dateAjout` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_derniere_modif` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `statut` enum('actif','inactif') NOT NULL DEFAULT 'actif'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `idCommentaire` mediumint(11) UNSIGNED NOT NULL,
  `idPersonne` smallint(11) UNSIGNED NOT NULL DEFAULT '0',
  `id` mediumint(11) UNSIGNED NOT NULL DEFAULT '0',
  `element` enum('evenement','lieu') NOT NULL DEFAULT 'evenement',
  `titre` varchar(255) NOT NULL DEFAULT '',
  `contenu` text NOT NULL,
  `titreEvenement` varchar(255) NOT NULL DEFAULT '',
  `statut` enum('actif','inactif','archive') NOT NULL DEFAULT 'actif',
  `dateAjout` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_derniere_modif` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `descriptionlieu`
--

CREATE TABLE `descriptionlieu` (
  `idLieu` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `idPersonne` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `type` enum('description','presentation') NOT NULL DEFAULT 'description',
  `dateAjout` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `contenu` text,
  `date_derniere_modif` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `idevenement` mediumint(8) UNSIGNED NOT NULL,
  `idLieu` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `idSalle` mediumint(9) NOT NULL DEFAULT '0',
  `idPersonne` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `statut` enum('actif','inactif','annule','complet','propose') NOT NULL DEFAULT 'actif',
  `genre` varchar(20) NOT NULL DEFAULT 'divers',
  `titre` varchar(100) NOT NULL DEFAULT '',
  `dateEvenement` date NOT NULL DEFAULT '0000-00-00',
  `nomLieu` varchar(255) NOT NULL DEFAULT '',
  `adresse` text NOT NULL,
  `quartier` varchar(255) NOT NULL DEFAULT 'autre',
  `localite_id` smallint(6) NOT NULL,
  `region` varchar(2) NOT NULL,
  `urlLieu` varchar(255) NOT NULL DEFAULT '',
  `horaire_debut` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `horaire_fin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `horaire_complement` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `flyer` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `price_type` varchar(40) DEFAULT NULL,
  `prix` varchar(255) NOT NULL DEFAULT '',
  `prelocations` varchar(80) NOT NULL DEFAULT '',
  `URL1` varchar(255) NOT NULL DEFAULT '',
  `URL2` varchar(255) NOT NULL DEFAULT '',
  `ref` varchar(255) NOT NULL DEFAULT '',
  `remarque` text,
  `user_email` varchar(255) DEFAULT NULL,
  `dateAjout` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_derniere_modif` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evenement_favori`
--

CREATE TABLE `evenement_favori` (
  `idPersonne` smallint(5) NOT NULL DEFAULT '0',
  `idEvenement` mediumint(8) NOT NULL DEFAULT '0',
  `date_ajout` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evenement_fichierrecu`
--

CREATE TABLE `evenement_fichierrecu` (
  `idEvenement` mediumint(9) NOT NULL DEFAULT '0',
  `idFichierrecu` mediumint(9) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `evenement_organisateur`
--

CREATE TABLE `evenement_organisateur` (
  `idEvenement` mediumint(9) NOT NULL DEFAULT '0',
  `idOrganisateur` mediumint(9) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fichierrecu`
--

CREATE TABLE `fichierrecu` (
  `idFichierrecu` mediumint(9) NOT NULL,
  `idElement` int(10) NOT NULL DEFAULT '0',
  `type_element` enum('lieu','evenement') NOT NULL DEFAULT 'lieu',
  `description` char(255) NOT NULL DEFAULT '',
  `mime` char(80) NOT NULL DEFAULT '',
  `extension` char(6) NOT NULL DEFAULT '',
  `type` enum('document','image') NOT NULL DEFAULT 'document',
  `dateAjout` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `groupes`
--

CREATE TABLE `groupes` (
  `idgroupe` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `nom` varchar(80) DEFAULT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `groupes`
--

INSERT INTO `groupes` (`idgroupe`, `nom`, `description`) VALUES
(1, 'superadmin', 'BDFL'),
(4, 'admin', 'administrateurs régionaux'),
(6, 'auteur', 'accès à tous les contenus'),
(8, 'acteur', 'ajout et modif de ses even, éventuellement de sa fiche organisateur'),
(10, 'contributeur', '? (33 personnes)'),
(12, 'membre', 'favoris, commentaires');

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

CREATE TABLE `lieu` (
  `idLieu` smallint(5) UNSIGNED NOT NULL,
  `idpersonne` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `statut` enum('actif','inactif','ancien') NOT NULL DEFAULT 'actif',
  `nom` varchar(60) NOT NULL DEFAULT '',
  `adresse` varchar(80) NOT NULL DEFAULT '',
  `quartier` varchar(255) NOT NULL DEFAULT 'Plainpalais',
  `localite_id` smallint(6) NOT NULL,
  `region` varchar(2) NOT NULL,
  `lat` float(10,6) NOT NULL DEFAULT '0.000000',
  `lng` float(10,6) NOT NULL DEFAULT '0.000000',
  `horaire_general` text NOT NULL,
  `horaire_evenement` text NOT NULL,
  `entree` varchar(255) NOT NULL DEFAULT '',
  `categorie` set('bistrot','salle','restaurant','cinema','theatre','galerie','boutique','musee','autre') NOT NULL DEFAULT '',
  `telephone` varchar(40) NOT NULL DEFAULT '',
  `photo1` varchar(255) NOT NULL DEFAULT '',
  `photo2` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `URL` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `plan` varchar(255) NOT NULL DEFAULT '',
  `acces_tpg` varchar(255) NOT NULL DEFAULT '',
  `dateAjout` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `actif` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `determinant` varchar(40) NOT NULL DEFAULT '',
  `date_derniere_modif` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `lieu_favori`
--

CREATE TABLE `lieu_favori` (
  `idPersonne` smallint(5) NOT NULL DEFAULT '0',
  `idLieu` smallint(5) NOT NULL DEFAULT '0',
  `date_ajout` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `lieu_fichierrecu`
--

CREATE TABLE `lieu_fichierrecu` (
  `idLieu` mediumint(9) NOT NULL DEFAULT '0',
  `idFichierrecu` mediumint(9) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `lieu_organisateur`
--

CREATE TABLE `lieu_organisateur` (
  `idOrganisateur` mediumint(9) NOT NULL DEFAULT '0',
  `idLieu` mediumint(9) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `localite`
--

CREATE TABLE `localite` (
  `id` int(6) NOT NULL,
  `localite` varchar(255) NOT NULL,
  `commune` varchar(255) NOT NULL,
  `npa` int(4) NOT NULL,
  `canton` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `localite`
--

INSERT INTO `localite` (`id`, `localite`, `commune`, `npa`, `canton`) VALUES
(1, 'Autre', '', 0, ''),
(2, 'Aïre', 'Vernier', 1219, 'ge'),
(3, 'Aire-la-Ville', 'Aire-la-Ville', 1288, 'ge'),
(4, 'Anières', 'Anières', 1247, 'ge'),
(5, 'Arare', 'Plan-les-Ouates', 1212, 'ge'),
(6, 'Athenaz', 'Avusy', 1285, 'ge'),
(7, 'Avully', 'Avully', 1237, 'ge'),
(8, 'Avusy', 'Avusy', 1285, 'ge'),
(9, 'Bardonnex', 'Bardonnex', 1257, 'ge'),
(10, 'Bellerive', 'Collonge-Bellerive', 1222, 'ge'),
(11, 'Bellevue', 'Bellevue', 1293, 'ge'),
(12, 'Bernex', 'Bernex', 1233, 'ge'),
(13, 'Bossy', 'Collex-Bossy', 1239, 'ge'),
(14, 'Bourdigny', 'Satigny', 1242, 'ge'),
(15, 'Cara', 'Presinge', 1243, 'ge'),
(16, 'Carouge', 'Carouge (GE)', 1227, 'ge'),
(17, 'Cartigny', 'Cartigny', 1236, 'ge'),
(18, 'Céligny', 'Céligny', 1298, 'ge'),
(19, 'Certoux', 'Perly-Certoux', 1258, 'ge'),
(20, 'Chambésy', 'Pregny-Chambésy', 1292, 'ge'),
(21, 'Chancy', 'Chancy', 1284, 'ge'),
(22, 'Charrot', 'Bardonnex', 1257, 'ge'),
(23, 'Châtelaine', 'Vernier', 1219, 'ge'),
(24, 'Chêne-Bougeries', 'Chêne-Bougeries', 1224, 'ge'),
(25, 'Chêne-Bourg', 'Chêne-Bourg', 1225, 'ge'),
(26, 'Chevrens', 'Anières', 1247, 'ge'),
(27, 'Chèvres', 'Bernex', 1233, 'ge'),
(28, 'Chevrier', 'Choulex', 1244, 'ge'),
(29, 'Chougny', 'Vandoeuvres', 1253, 'ge'),
(30, 'Choulex', 'Choulex', 1244, 'ge'),
(31, 'Choully', 'Satigny', 1242, 'ge'),
(32, 'Cointrin', 'Meyrin', 1216, 'ge'),
(33, 'Collex', 'Collex-Bossy', 1239, 'ge'),
(34, 'Collonge', 'Collonge-Bellerive', 1245, 'ge'),
(35, 'Cologny', 'Cologny', 1223, 'ge'),
(36, 'Conches', 'Chêne-Bougeries', 1231, 'ge'),
(37, 'Confignon', 'Confignon', 1232, 'ge'),
(38, 'Corsier', 'Corsier (GE)', 1246, 'ge'),
(39, 'Corsinge', 'Meinier', 1252, 'ge'),
(40, 'Dardagny', 'Dardagny', 1283, 'ge'),
(41, 'Eaumorte', 'Avully', 1236, 'ge'),
(42, 'Fossard', 'Thônex', 1225, 'ge'),
(43, 'Frontenex', 'Cologny', 1223, 'ge'),
(44, 'Genève', 'Genève', 1200, 'ge'),
(45, 'Genthod', 'Genthod', 1294, 'ge'),
(46, 'Grand-Lancy', 'Lancy', 1212, 'ge'),
(47, 'Gy', 'Gy', 1251, 'ge'),
(48, 'Hermance', 'Hermance', 1248, 'ge'),
(49, 'Jussy', 'Jussy', 1254, 'ge'),
(50, 'Jussy-le-Château', 'Jussy', 1254, 'ge'),
(51, 'La Capite', 'Choulex', 1222, 'ge'),
(52, 'La Croix-de-Rozon', 'Bardonnex', 1257, 'ge'),
(53, 'La Gradelle', 'Cologny', 1224, 'ge'),
(54, 'La Pallanterie', 'Collonge-Bellerive', 1222, 'ge'),
(55, 'La Plaine', 'Dardagny', 1283, 'ge'),
(56, 'La Praille', 'Carouge (GE)', 1227, 'ge'),
(57, 'Laconnex', 'Laconnex', 1287, 'ge'),
(58, 'Lancy', 'Lancy', 1212, 'ge'),
(59, 'Landecy', 'Bardonnex', 1257, 'ge'),
(60, 'Le Cannelet', 'Chancy', 1285, 'ge'),
(61, 'Le Grand-Saconnex', 'Le Grand-Saconnex', 1218, 'ge'),
(62, 'Le Lignon', 'Vernier', 1219, 'ge'),
(63, 'Le Petit-Saconnex', 'Genève', 1200, 'ge'),
(64, 'Les Acacias', 'Carouge (GE)', 1227, 'ge'),
(65, 'Les Avanchets', 'Vernier', 1220, 'ge'),
(66, 'Les Eaux-Vives', 'Genève', 1200, 'ge'),
(67, 'Loëx', 'Bernex', 1233, 'ge'),
(68, 'Lullier', 'Jussy', 1254, 'ge'),
(69, 'Lully', 'Bernex', 1223, 'ge'),
(70, 'Malagny', 'Genthod', 1294, 'ge'),
(71, 'Malval', 'Dardagny', 1283, 'ge'),
(72, 'Mategnin', 'Meyrin', 1217, 'ge'),
(73, 'Meinier', 'Meinier', 1252, 'ge'),
(74, 'Merlinge', 'Meinier', 1251, 'ge'),
(75, 'Meyrin', 'Meyrin', 1217, 'ge'),
(76, 'Moillesulaz', 'Thônex', 1225, 'ge'),
(77, 'Mon-Idee', 'Puplinge', 1241, 'ge'),
(78, 'Monniaz', 'Jussy', 1254, 'ge'),
(79, 'Montfleury', 'Meyrin', 1242, 'ge'),
(80, 'Onex', 'Onex', 1213, 'ge'),
(81, 'Peissy', 'Satigny', 1242, 'ge'),
(82, 'Peney', 'Satigny', 1242, 'ge'),
(83, 'Perly', 'Perly-Certoux', 1258, 'ge'),
(84, 'Petit-Lancy', 'Lancy', 1213, 'ge'),
(85, 'Pinchat', 'Carouge (GE)', 1234, 'ge'),
(86, 'Plainpalais', 'Genève', 1200, 'ge'),
(87, 'Plan-les-Ouates', 'Plan-les-Ouates', 1228, 'ge'),
(88, 'Pregny', 'Pregny-Chambésy', 1292, 'ge'),
(89, 'Presinge', 'Presinge', 1243, 'ge'),
(90, 'Pressy', 'Vandoeuvres', 1253, 'ge'),
(91, 'Puplinge', 'Puplinge', 1241, 'ge'),
(92, 'Ruè', 'Cologny', 1223, 'ge'),
(93, 'Russin', 'Russin', 1281, 'ge'),
(94, 'Saconnex-d\'Arve', 'Plan-les-Ouates', 1212, 'ge'),
(95, 'Satigny', 'Satigny', 1242, 'ge'),
(96, 'Sauverny', 'Versoix', 1290, 'ge'),
(97, 'Sécheron', 'Genève', 1200, 'ge'),
(98, 'Sézegnin', 'Avusy', 1285, 'ge'),
(99, 'Sézenove', 'Bernex', 1233, 'ge'),
(100, 'Sierne', 'Veyrier', 1255, 'ge'),
(101, 'Soral', 'Soral', 1286, 'ge'),
(102, 'St-Georges', 'Lancy', 1213, 'ge'),
(103, 'St-Maurice', 'Collonge-Bellerive', 1222, 'ge'),
(104, 'Thônex', 'Thônex', 1226, 'ge'),
(105, 'Troinex', 'Troinex', 1256, 'ge'),
(106, 'Valavran', 'Bellevue', 1293, 'ge'),
(107, 'Vandoeuvres', 'Vandoeuvres', 1253, 'ge'),
(108, 'Veigy (Suisse)', 'Anières', 1251, 'ge'),
(109, 'Vernier', 'Vernier', 1214, 'ge'),
(110, 'Versoix', 'Versoix', 1290, 'ge'),
(111, 'Versoix la Ville', 'Versoix', 1290, 'ge'),
(112, 'Versoix le Bourg', 'Versoix', 1290, 'ge'),
(113, 'Vésenaz', 'Cologny', 1222, 'ge'),
(114, 'Vessy', 'Veyrier', 1234, 'ge'),
(115, 'Veyrier', 'Veyrier', 1255, 'ge'),
(116, 'Villette', 'Thônex', 1225, 'ge'),
(117, 'Vireloup', 'Collex-Bossy', 1239, 'ge'),
(120, 'Aclens', 'Aclens', 1123, 'vd'),
(121, 'Agiez', 'Agiez', 1352, 'vd'),
(122, 'Aigle', 'Aigle', 1860, 'vd'),
(123, 'Allaman', 'Allaman', 1165, 'vd'),
(124, 'Allens', 'Cossonay', 1304, 'vd'),
(125, 'Antagnes', 'Ollon', 1867, 'vd'),
(126, 'Anzeinda', 'Bex', 1882, 'vd'),
(127, 'Apples', 'Apples', 1143, 'vd'),
(128, 'Aran', 'Bourg-en-Lavaux', 1091, 'vd'),
(129, 'Arnex-sur-Nyon', 'Arnex-sur-Nyon', 1277, 'vd'),
(130, 'Arnex-sur-Orbe', 'Arnex-sur-Orbe', 1321, 'vd'),
(131, 'Arrissoules', 'Rovray', 1463, 'vd'),
(132, 'Arveyes', 'Ollon', 1884, 'vd'),
(133, 'Arzier', 'Arzier-Le Muids', 1273, 'vd'),
(134, 'Assens', 'Assens', 1042, 'vd'),
(135, 'Aubonne', 'Aubonne', 1170, 'vd'),
(136, 'Auliens', 'Ollon', 1867, 'vd'),
(137, 'Avenches', 'Avenches', 1580, 'vd'),
(138, 'Avenex', 'Signy-Avenex', 1274, 'vd'),
(139, 'Ballaigues', 'Ballaigues', 1338, 'vd'),
(140, 'Ballens', 'Ballens', 1144, 'vd'),
(141, 'Bassins', 'Bassins', 1269, 'vd'),
(142, 'Baugy', 'Montreux', 1815, 'vd'),
(143, 'Baulmes', 'Baulmes', 1446, 'vd'),
(144, 'Bavois', 'Bavois', 1372, 'vd'),
(145, 'Begnins', 'Begnins', 1268, 'vd'),
(146, 'Bellerive', 'Vully-les-Lacs', 1585, 'vd'),
(147, 'Belmont-sur-Lausanne', 'Belmont-sur-Lausanne', 1092, 'vd'),
(148, 'Belmont-sur-Yverdon', 'Belmont-sur-Yverdon', 1432, 'vd'),
(149, 'Bénex', 'Prangins', 1197, 'vd'),
(150, 'Bercher', 'Bercher', 1038, 'vd'),
(151, 'Berolle', 'Berolle', 1149, 'vd'),
(152, 'Bettens', 'Bettens', 1042, 'vd'),
(153, 'Bex', 'Bex', 1880, 'vd'),
(154, 'Bière', 'Bière', 1145, 'vd'),
(155, 'Bioley-Magnoux', 'Bioley-Magnoux', 1407, 'vd'),
(156, 'Bioley-Orjulaz', 'Bioley-Orjulaz', 1042, 'vd'),
(157, 'Blonay', 'Blonay', 1807, 'vd'),
(158, 'Bofflens', 'Bofflens', 1353, 'vd'),
(159, 'Bogis-Bossey', 'Bogis-Bossey', 1279, 'vd'),
(160, 'Bois-Bougy', 'Nyon', 1260, 'vd'),
(161, 'Bonvillars', 'Bonvillars', 1427, 'vd'),
(162, 'Borex', 'Borex', 1277, 'vd'),
(163, 'Bottens', 'Bottens', 1041, 'vd'),
(164, 'Bougy-Villars', 'Bougy-Villars', 1172, 'vd'),
(165, 'Boulens', 'Boulens', 1063, 'vd'),
(166, 'Bournens', 'Bournens', 1035, 'vd'),
(167, 'Boussens', 'Boussens', 1034, 'vd'),
(168, 'Bremblens', 'Bremblens', 1121, 'vd'),
(169, 'Brenles', 'Brenles', 1683, 'vd'),
(170, 'Brent', 'Montreux', 1817, 'vd'),
(171, 'Bressonnaz', 'Moudon', 1510, 'vd'),
(172, 'Bretaye', 'Ollon', 1884, 'vd'),
(173, 'Bretigny-sur-Morrens', 'Bretigny-sur-Morrens', 1053, 'vd'),
(174, 'Bretonnières', 'Bretonnières', 1329, 'vd'),
(175, 'Buchillon', 'Buchillon', 1164, 'vd'),
(176, 'Bugnaux', 'Essertines-sur-Rolle', 1180, 'vd'),
(177, 'Bullet', 'Bullet', 1453, 'vd'),
(178, 'Burier', 'La Tour-de-Peilz', 1814, 'vd'),
(179, 'Bursinel', 'Bursinel', 1195, 'vd'),
(180, 'Bursins', 'Bursins', 1183, 'vd'),
(181, 'Burtigny', 'Burtigny', 1268, 'vd'),
(182, 'Bussigny-près-Lausanne', 'Bussigny', 1030, 'vd'),
(183, 'Bussigny-sur-Oron', 'Oron', 1608, 'vd'),
(184, 'Bussy-Chardonney', 'Bussy-Chardonney', 1136, 'vd'),
(185, 'Bussy-sur-Moudon', 'Bussy-sur-Moudon', 1514, 'vd'),
(186, 'Carrouge', 'Carrouge (VD)', 1084, 'vd'),
(187, 'Caux', 'Montreux', 1824, 'vd'),
(188, 'Cergnat', 'Ormont-Dessous', 1863, 'vd'),
(189, 'Cerniaz', 'Valbroye', 1682, 'vd'),
(190, 'Chabrey', 'Vully-les-Lacs', 1589, 'vd'),
(191, 'Chailly', 'Lausanne', 1000, 'vd'),
(192, 'Chailly', 'Montreux', 1816, 'vd'),
(193, 'Chamblon', 'Chamblon', 1436, 'vd'),
(194, 'Chamby', 'Montreux', 1832, 'vd'),
(195, 'Champagne', 'Champagne', 1424, 'vd'),
(196, 'Champmartin', 'Cudrefin', 1588, 'vd'),
(197, 'Champtauroz', 'Champtauroz', 1537, 'vd'),
(198, 'Champvent', 'Champvent', 1443, 'vd'),
(199, 'Chanéaz', 'Montanaire', 1409, 'vd'),
(200, 'Chapelle-sur-Moudon', 'Montanaire', 1063, 'vd'),
(201, 'Chardonne', 'Chardonne', 1803, 'vd'),
(202, 'Chardonney', 'Jorat-Menthue', 1041, 'vd'),
(203, 'Chasseron', 'Bullet', 1452, 'vd'),
(204, 'Chataigneriaz', 'Founex', 1297, 'vd'),
(205, 'Château-d\'Oex', 'Château-d\'Oex', 1660, 'vd'),
(206, 'Châtelard', 'Lutry', 1095, 'vd'),
(207, 'Châtel-sur-Rolle', 'Essertines-sur-Rolle', 1186, 'vd'),
(208, 'Châtillens', 'Oron', 1610, 'vd'),
(209, 'Chavannes-de-Bogis', 'Chavannes-de-Bogis', 1279, 'vd'),
(210, 'Chavannes-des-Bois', 'Chavannes-des-Bois', 1290, 'vd'),
(211, 'Chavannes-le-Chêne', 'Chavannes-le-Chêne', 1464, 'vd'),
(212, 'Chavannes-le-Veyron', 'Chavannes-le-Veyron', 1148, 'vd'),
(213, 'Chavannes-près-Renens', 'Chavannes-près-Renens', 1022, 'vd'),
(214, 'Chavannes-sur-Moudon', 'Chavannes-sur-Moudon', 1512, 'vd'),
(215, 'Chavornay', 'Chavornay', 1373, 'vd'),
(216, 'Chenaux', 'Bourg-en-Lavaux', 1091, 'vd'),
(217, 'Chêne-Pâquier', 'Chêne-Pâquier', 1464, 'vd'),
(218, 'Chernex', 'Montreux', 1822, 'vd'),
(219, 'Chesalles-sur-Moudon', 'Chesalles-sur-Moudon', 1683, 'vd'),
(220, 'Chesalles-sur-Oron', 'Oron', 1608, 'vd'),
(221, 'Cheseaux', 'Cheseaux-Noréaz', 1400, 'vd'),
(222, 'Cheseaux-sur-Lausanne', 'Cheseaux-sur-Lausanne', 1033, 'vd'),
(223, 'Chéserex', 'Chéserex', 1275, 'vd'),
(224, 'Chesières', 'Ollon', 1885, 'vd'),
(225, 'Chessel', 'Chessel', 1846, 'vd'),
(226, 'Chevilly', 'Chevilly', 1316, 'vd'),
(227, 'Chevroux', 'Chevroux', 1545, 'vd'),
(228, 'Chexbres', 'Chexbres', 1071, 'vd'),
(229, 'Chexbres', 'Saint-Saphorin (Lavaux)', 1071, 'vd'),
(230, 'Chez le Maìtre', 'Le Chenit', 1347, 'vd'),
(231, 'Chez-Meylan', 'Le Chenit', 1348, 'vd'),
(232, 'Chigny', 'Chigny', 1134, 'vd'),
(233, 'Clarens', 'Montreux', 1815, 'vd'),
(234, 'Clarmont', 'Clarmont', 1127, 'vd'),
(235, 'Coinsins', 'Coinsins', 1267, 'vd'),
(236, 'Col-du-Pillon', 'Ormont-Dessus', 1865, 'vd'),
(237, 'Colombier', 'Echichens', 1114, 'vd'),
(238, 'Combremont-le-Grand', 'Valbroye', 1535, 'vd'),
(239, 'Combremont-le-Petit', 'Valbroye', 1536, 'vd'),
(240, 'Commugny', 'Commugny', 1291, 'vd'),
(241, 'Concise', 'Concise', 1426, 'vd'),
(242, 'Constantine', 'Vully-les-Lacs', 1587, 'vd'),
(243, 'Coppet', 'Coppet', 1296, 'vd'),
(244, 'Corbeyrier', 'Corbeyrier', 1856, 'vd'),
(245, 'Corcelettes', 'Grandson', 1422, 'vd'),
(246, 'Corcelles-le-Jorat', 'Corcelles-le-Jorat', 1082, 'vd'),
(247, 'Corcelles-près-Concise', 'Corcelles-près-Concise', 1426, 'vd'),
(248, 'Corcelles-près-Payerne', 'Corcelles-près-Payerne', 1562, 'vd'),
(249, 'Corcelles-sur-Chavornay', 'Corcelles-sur-Chavornay', 1374, 'vd'),
(250, 'Cornes de Cerf', 'Forel (Lavaux)', 1072, 'vd'),
(251, 'Corrençon', 'Montanaire', 1410, 'vd'),
(252, 'Correvon', 'Montanaire', 1410, 'vd'),
(253, 'Corseaux', 'Corseaux', 1802, 'vd'),
(254, 'Corsier-sur-Vevey', 'Corsier-sur-Vevey', 1804, 'vd'),
(255, 'Corsy', 'Lutry', 1095, 'vd'),
(256, 'Cossonay-Gare', 'Penthalaz', 1305, 'vd'),
(257, 'Cossonay-Ville', 'Cossonay', 1304, 'vd'),
(258, 'Cottens', 'Cottens (VD)', 1116, 'vd'),
(259, 'Cotterd', 'Vully-les-Lacs', 1585, 'vd'),
(260, 'Crans-près-Céligny', 'Crans-près-Céligny', 1299, 'vd'),
(261, 'Crassier', 'Crassier', 1263, 'vd'),
(262, 'Crebelley', 'Noville', 1845, 'vd'),
(263, 'Cremières', 'Puidoux', 1071, 'vd'),
(264, 'Cremin', 'Cremin', 1526, 'vd'),
(265, 'Crissier', 'Crissier', 1023, 'vd'),
(266, 'Cronay', 'Cronay', 1406, 'vd'),
(267, 'Croy', 'Croy', 1322, 'vd'),
(268, 'Cuarnens', 'Cuarnens', 1148, 'vd'),
(269, 'Cuarny', 'Cuarny', 1404, 'vd'),
(270, 'Cudrefin', 'Cudrefin', 1588, 'vd'),
(271, 'Cugy', 'Cugy (VD)', 1053, 'vd'),
(272, 'Cully', 'Bourg-en-Lavaux', 1096, 'vd'),
(273, 'Curtilles', 'Curtilles', 1521, 'vd'),
(274, 'Daillens', 'Daillens', 1306, 'vd'),
(275, 'Démoret', 'Démoret', 1415, 'vd'),
(276, 'Denens', 'Denens', 1135, 'vd'),
(277, 'Denezy', 'Montanaire', 1410, 'vd'),
(278, 'Denges', 'Denges', 1026, 'vd'),
(279, 'Dizy', 'Dizy', 1304, 'vd'),
(280, 'Dommartin', 'Montilliez', 1041, 'vd'),
(281, 'Dompierre', 'Dompierre (VD)', 1682, 'vd'),
(282, 'Donatyre', 'Avenches', 1580, 'vd'),
(283, 'Donneloye', 'Donneloye', 1407, 'vd'),
(284, 'Duillier', 'Duillier', 1266, 'vd'),
(285, 'Dully', 'Dully', 1195, 'vd'),
(286, 'Echallens', 'Echallens', 1040, 'vd'),
(287, 'Echandens', 'Echandens', 1026, 'vd'),
(288, 'Echichens', 'Echichens', 1112, 'vd'),
(289, 'Eclagnens', 'Goumoëns', 1376, 'vd'),
(290, 'Eclépens', 'Eclépens', 1312, 'vd'),
(291, 'Ecoteaux', 'Oron', 1612, 'vd'),
(292, 'Ecublens', 'Ecublens (VD)', 1024, 'vd'),
(293, 'Envy', 'Romainmôtier-Envy', 1323, 'vd'),
(294, 'Epalinges', 'Epalinges', 1066, 'vd'),
(295, 'Epautheyres', 'Essertines-sur-Yverdon', 1417, 'vd'),
(296, 'Ependes', 'Ependes (VD)', 1434, 'vd'),
(297, 'Epesses', 'Bourg-en-Lavaux', 1098, 'vd'),
(298, 'Essertes', 'Essertes', 1078, 'vd'),
(299, 'Essertines-sur-Rolle', 'Essertines-sur-Rolle', 1186, 'vd'),
(300, 'Essertines-sur-Yverdon', 'Essertines-sur-Yverdon', 1417, 'vd'),
(301, 'Essert-Pittet', 'Essert-Pittet', 1435, 'vd'),
(302, 'Essert-sous-Champvent', 'Champvent', 1443, 'vd'),
(303, 'Etagnières', 'Etagnières', 1037, 'vd'),
(304, 'Etoy', 'Etoy', 1163, 'vd'),
(305, 'Etrabloz', 'Payerne', 1551, 'vd'),
(306, 'Exergillod', 'Ollon', 1866, 'vd'),
(307, 'Eysins', 'Eysins', 1262, 'vd'),
(308, 'Faoug', 'Faoug', 1595, 'vd'),
(309, 'Féchy', 'Féchy', 1173, 'vd'),
(310, 'Fenalet-sur-Bex', 'Bex', 1880, 'vd'),
(311, 'Fenil-sur-Corsier', 'Corsier-sur-Vevey', 1809, 'vd'),
(312, 'Ferlens', 'Ferlens (VD)', 1076, 'vd'),
(313, 'Ferreyres', 'Ferreyres', 1313, 'vd'),
(314, 'Fey', 'Fey', 1044, 'vd'),
(315, 'Feydey', 'Leysin', 1854, 'vd'),
(316, 'Fiez', 'Fiez', 1420, 'vd'),
(317, 'Flendruz', 'Rougemont', 1659, 'vd'),
(318, 'Fontaines-sur-Grandson', 'Fontaines-sur-Grandson', 1421, 'vd'),
(319, 'Fontanezier', 'Tévenon', 1423, 'vd'),
(320, 'Fontanney', 'Aigle', 1860, 'vd'),
(321, 'Forchex', 'Ollon', 1867, 'vd'),
(322, 'Forel (Lavaux)', 'Forel (Lavaux)', 1072, 'vd'),
(323, 'Forel-sur-Lucens', 'Forel-sur-Lucens', 1526, 'vd'),
(324, 'Founex', 'Founex', 1297, 'vd'),
(325, 'Frenières-sur-Bex', 'Bex', 1880, 'vd'),
(326, 'Froideville', 'Froideville', 1055, 'vd'),
(327, 'Genolier', 'Genolier', 1272, 'vd'),
(328, 'Giez', 'Giez', 1429, 'vd'),
(329, 'Gilly', 'Gilly', 1182, 'vd'),
(330, 'Gimel', 'Gimel', 1188, 'vd'),
(331, 'Gingins', 'Gingins', 1276, 'vd'),
(332, 'Givrins', 'Givrins', 1271, 'vd'),
(333, 'Gland', 'Gland', 1196, 'vd'),
(334, 'Glion', 'Montreux', 1823, 'vd'),
(335, 'Glutières', 'Ollon', 1867, 'vd'),
(336, 'Gollion', 'Gollion', 1124, 'vd'),
(337, 'Gossens', 'Donneloye', 1407, 'vd'),
(338, 'Goumoens-la-Ville', 'Goumoëns', 1376, 'vd'),
(339, 'Goumoens-le-Jux', 'Goumoëns', 1376, 'vd'),
(340, 'Grancy', 'Grancy', 1117, 'vd'),
(341, 'Grand Mont', 'Le Mont-sur-Lausanne', 1052, 'vd'),
(342, 'Grandchamp', 'Veytaux', 1820, 'vd'),
(343, 'Grandcour', 'Grandcour', 1543, 'vd'),
(344, 'Grandevent', 'Grandevent', 1421, 'vd'),
(345, 'Grandson', 'Grandson', 1422, 'vd'),
(346, 'Grandvaux', 'Bourg-en-Lavaux', 1091, 'vd'),
(347, 'Granges-près-Marnand', 'Valbroye', 1523, 'vd'),
(348, 'Granges-sous-Trey', 'Trey', 1552, 'vd'),
(349, 'Grens', 'Grens', 1274, 'vd'),
(350, 'Gressy', 'Yverdon-les-Bains', 1432, 'vd'),
(351, 'Gryon', 'Gryon', 1882, 'vd'),
(352, 'Guévaux', 'Vully-les-Lacs', 1787, 'vd'),
(353, 'Hauteville (Vevey)', 'Saint-Légier-La Chiésaz', 1800, 'vd'),
(354, 'Henniez', 'Henniez', 1525, 'vd'),
(355, 'Hermenches', 'Hermenches', 1513, 'vd'),
(356, 'Huémoz', 'Ollon', 1884, 'vd'),
(357, 'Ittens', 'La Chaux (Cossonay)', 1308, 'vd'),
(358, 'Jongny', 'Jongny', 1805, 'vd'),
(359, 'Jor', 'Montreux', 1833, 'vd'),
(360, 'Jouxtens', 'Jouxtens-Mézery', 1008, 'vd'),
(361, 'Juriens', 'Juriens', 1326, 'vd'),
(362, 'La Barboleusaz', 'Gryon', 1882, 'vd'),
(363, 'La Chaux (Cossonay)', 'La Chaux (Cossonay)', 1308, 'vd'),
(364, 'La Chaux-de-Ste-Croix', 'Sainte-Croix', 1454, 'vd'),
(365, 'La Chiésaz', 'Saint-Légier-La Chiésaz', 1806, 'vd'),
(366, 'La Comballaz', 'Ormont-Dessous', 1862, 'vd'),
(367, 'La Conversion', 'Lutry', 1093, 'vd'),
(368, 'La Coudre', 'L\'Isle', 1148, 'vd'),
(369, 'La Croix', 'Lutry', 1090, 'vd'),
(370, 'La Cure', 'Saint-Cergue', 1265, 'vd'),
(371, 'La Forclaz', 'Ormont-Dessous', 1866, 'vd'),
(372, 'La Givrine', 'Saint-Cergue', 1264, 'vd'),
(373, 'La Golisse', 'Le Chenit', 1347, 'vd'),
(374, 'La Lécherette', 'Château-d\'Oex', 1660, 'vd'),
(375, 'La Mauguettaz', 'Yvonand', 1462, 'vd'),
(376, 'La Mothe', 'Vugelles-La Mothe', 1431, 'vd'),
(377, 'La Praz', 'La Praz', 1148, 'vd'),
(378, 'La Rippe', 'La Rippe', 1278, 'vd'),
(379, 'La Robellaz', 'Essertines-sur-Yverdon', 1417, 'vd'),
(380, 'La Rogivue', 'Maracon', 1613, 'vd'),
(381, 'La Rosiaz', 'Pully', 1009, 'vd'),
(382, 'La Russille', 'Les Clées', 1356, 'vd'),
(383, 'La Sagne', 'Sainte-Croix', 1450, 'vd'),
(384, 'La Sallaz', 'Lausanne', 1000, 'vd'),
(385, 'La Sarraz', 'La Sarraz', 1315, 'vd'),
(386, 'La Tine', 'Rossinière', 1658, 'vd'),
(387, 'La Tour-de-Peilz', 'La Tour-de-Peilz', 1814, 'vd'),
(388, 'La Vraconnaz', 'Sainte-Croix', 1454, 'vd'),
(389, 'L\'Abbaye', 'L\'Abbaye', 1344, 'vd'),
(390, 'L\'Abergement', 'L\'Abergement', 1355, 'vd'),
(391, 'L\'Allex', 'Bex', 1880, 'vd'),
(392, 'L\'Alliaz', 'Blonay', 1807, 'vd'),
(393, 'Lally', 'Blonay', 1807, 'vd'),
(394, 'L\'Auberson', 'Sainte-Croix', 1454, 'vd'),
(395, 'Lausanne', 'Lausanne', 1000, 'vd'),
(396, 'Lavey-les-Bains', 'Lavey-Morcles', 1892, 'vd'),
(397, 'Lavey-Village', 'Lavey-Morcles', 1892, 'vd'),
(398, 'Lavigny', 'Lavigny', 1175, 'vd'),
(399, 'Le Bévieux', 'Bex', 1880, 'vd'),
(400, 'Le Brassus', 'Le Chenit', 1348, 'vd'),
(401, 'Le Campe', 'Le Chenit', 1348, 'vd'),
(402, 'Le Carroz', 'Le Chenit', 1348, 'vd'),
(403, 'Le Chalet-à-Gobet', 'Lausanne', 1000, 'vd'),
(404, 'Le Château-de-Ste-Croix', 'Sainte-Croix', 1450, 'vd'),
(405, 'Le Chenit', 'Le Chenit', 1347, 'vd'),
(406, 'Le Coudray', 'Bavois', 1372, 'vd'),
(407, 'Le Day', 'Vallorbe', 1337, 'vd'),
(408, 'Le Dézaley', 'Puidoux', 1071, 'vd'),
(409, 'Le Lieu', 'Le Lieu', 1345, 'vd'),
(410, 'Le Marchairuz', 'Le Chenit', 1348, 'vd'),
(411, 'Le Mont-Pèlerin', 'Chardonne', 1801, 'vd'),
(412, 'Le Mont-sur-Lausanne', 'Le Mont-sur-Lausanne', 1052, 'vd'),
(413, 'Le Muids', 'Arzier-Le Muids', 1273, 'vd'),
(414, 'Le Pont', 'L\'Abbaye', 1342, 'vd'),
(415, 'Le Rocheray', 'Le Chenit', 1347, 'vd'),
(416, 'Le Rosex', 'Ormont-Dessus', 1864, 'vd'),
(417, 'Le Séchey', 'Le Lieu', 1345, 'vd'),
(418, 'Le Sentier', 'Le Chenit', 1347, 'vd'),
(419, 'Le Sépey', 'Ormont-Dessous', 1863, 'vd'),
(420, 'Le Solliat', 'Le Chenit', 1347, 'vd'),
(421, 'Le Tronchet', 'Bourg-en-Lavaux', 1091, 'vd'),
(422, 'Le Vaud', 'Le Vaud', 1261, 'vd'),
(423, 'Les Avants', 'Montreux', 1833, 'vd'),
(424, 'Les Aviolats', 'Ormont-Dessus', 1864, 'vd'),
(425, 'Les Bioux', 'L\'Abbaye', 1346, 'vd'),
(426, 'Les Bovets', 'Ormont-Dessus', 1865, 'vd'),
(427, 'Les Charbonnières', 'Le Lieu', 1343, 'vd'),
(428, 'Les Chevalleyres', 'Blonay', 1807, 'vd'),
(429, 'Les Clées', 'Les Clées', 1356, 'vd'),
(430, 'Les Croisettes', 'Epalinges', 1066, 'vd'),
(431, 'Les Cullayes', 'Servion', 1080, 'vd'),
(432, 'Les Dévens', 'Bex', 1880, 'vd'),
(433, 'Les Diablerets', 'Ormont-Dessus', 1865, 'vd'),
(434, 'Les Granges', 'Château-d\'Oex', 1660, 'vd'),
(435, 'Les Monts-de-Corsier', 'Corsier-sur-Vevey', 1808, 'vd'),
(436, 'Les Monts-de-Pully', 'Pully', 1068, 'vd'),
(437, 'Les Mosses', 'Ormont-Dessous', 1862, 'vd'),
(438, 'Les Moulins', 'Château-d\'Oex', 1660, 'vd'),
(439, 'Les Planches', 'Ormont-Dessous', 1863, 'vd'),
(440, 'Les Planches', 'Le Mont-sur-Lausanne', 1052, 'vd'),
(441, 'Les Planches', 'Montreux', 1820, 'vd'),
(442, 'Les Plans-sur-Bex', 'Bex', 1880, 'vd'),
(443, 'Les Posses-sur-Bex', 'Bex', 1880, 'vd'),
(444, 'Les Rasses', 'Bullet', 1452, 'vd'),
(445, 'Les Tavernes', 'Oron', 1607, 'vd'),
(446, 'Les Thioleyres', 'Oron', 1607, 'vd'),
(447, 'Les Tuileries', 'Grandson', 1422, 'vd'),
(448, 'Les Voëttes', 'Ormont-Dessous', 1862, 'vd'),
(449, 'Les Vullierens', 'Bonvillars', 1424, 'vd'),
(450, 'L\'Etivaz', 'Château-d\'Oex', 1660, 'vd'),
(451, 'Leysin', 'Leysin', 1854, 'vd'),
(452, 'Lignerolle', 'Lignerolle', 1357, 'vd'),
(453, 'L\'Isle', 'L\'Isle', 1148, 'vd'),
(454, 'Lonay', 'Lonay', 1027, 'vd'),
(455, 'Longirod', 'Longirod', 1261, 'vd'),
(456, 'L\'Orient', 'Le Chenit', 1341, 'vd'),
(457, 'Lovatens', 'Lovatens', 1682, 'vd'),
(458, 'Lucens', 'Lucens', 1522, 'vd'),
(459, 'Luins', 'Luins', 1184, 'vd'),
(460, 'Lully', 'Lully (VD)', 1132, 'vd'),
(461, 'Lussery', 'Lussery-Villars', 1307, 'vd'),
(462, 'Lussy-sur-Morges', 'Lussy-sur-Morges', 1167, 'vd'),
(463, 'Lutry', 'Lutry', 1095, 'vd'),
(464, 'Malapalud', 'Assens', 1042, 'vd'),
(465, 'Malley', 'Lausanne', 1000, 'vd'),
(466, 'Maracon', 'Maracon', 1613, 'vd'),
(467, 'Marchissy', 'Marchissy', 1261, 'vd'),
(468, 'Marnand', 'Valbroye', 1524, 'vd'),
(469, 'Martherenges', 'Montanaire', 1063, 'vd'),
(470, 'Mathod', 'Mathod', 1438, 'vd'),
(471, 'Mauborget', 'Mauborget', 1453, 'vd'),
(472, 'Mauraz', 'Mauraz', 1148, 'vd'),
(473, 'Mex', 'Mex (VD)', 1031, 'vd'),
(474, 'Mézery', 'Jouxtens-Mézery', 1008, 'vd'),
(475, 'Mézery-près-Donneloye', 'Donneloye', 1407, 'vd'),
(476, 'Mézières', 'Mézières (VD)', 1083, 'vd'),
(477, 'Mies', 'Mies', 1295, 'vd'),
(478, 'Missy', 'Missy', 1565, 'vd'),
(479, 'Moiry', 'Moiry', 1148, 'vd'),
(480, 'Mollendruz', 'Mont-la-Ville', 1148, 'vd'),
(481, 'Mollens', 'Mollens (VD)', 1146, 'vd'),
(482, 'Mollie-Margot', 'Savigny', 1073, 'vd'),
(483, 'Molondin', 'Molondin', 1415, 'vd'),
(484, 'Monnaz', 'Echichens', 1125, 'vd'),
(485, 'Montagny-près-Yverdon', 'Montagny-près-Yverdon', 1442, 'vd'),
(486, 'Montaubion', 'Jorat-Menthue', 1041, 'vd'),
(487, 'Montblesson', 'Lausanne', 1000, 'vd'),
(488, 'Montcherand', 'Montcherand', 1354, 'vd'),
(489, 'Montet', 'Cudrefin', 1588, 'vd'),
(490, 'Montherod', 'Montherod', 1174, 'vd'),
(491, 'Montheron', 'Lausanne', 1053, 'vd'),
(492, 'Mont-la-Ville', 'Mont-la-Ville', 1148, 'vd'),
(493, 'Montmagny', 'Vully-les-Lacs', 1587, 'vd'),
(494, 'Montpreveyres', 'Montpreveyres', 1081, 'vd'),
(495, 'Montreux', 'Montreux', 1820, 'vd'),
(496, 'Montricher', 'Montricher', 1147, 'vd'),
(497, 'Mont-sur-Rolle', 'Mont-sur-Rolle', 1185, 'vd'),
(498, 'Morcles', 'Lavey-Morcles', 1892, 'vd'),
(499, 'Mordagne', 'Yvonand', 1462, 'vd'),
(500, 'Morges', 'Morges', 1110, 'vd'),
(501, 'Morrens', 'Morrens (VD)', 1054, 'vd'),
(502, 'Moudon', 'Moudon', 1510, 'vd'),
(503, 'Mur', 'Vully-les-Lacs', 1787, 'vd'),
(504, 'Mutrux', 'Mutrux', 1428, 'vd'),
(505, 'Nant', 'Corsier-sur-Vevey', 1804, 'vd'),
(506, 'Naz', 'Montilliez', 1041, 'vd'),
(507, 'Neyruz-sur-Moudon', 'Montanaire', 1515, 'vd'),
(508, 'Niédens', 'Yvonand', 1462, 'vd'),
(509, 'Nonfoux', 'Essertines-sur-Yverdon', 1417, 'vd'),
(510, 'Noréaz', 'Cheseaux-Noréaz', 1400, 'vd'),
(511, 'Novalles', 'Novalles', 1431, 'vd'),
(512, 'Noville', 'Noville', 1845, 'vd'),
(513, 'Nyon', 'Nyon', 1260, 'vd'),
(514, 'Ogens', 'Ogens', 1045, 'vd'),
(515, 'Oleyres', 'Avenches', 1580, 'vd'),
(516, 'Ollon', 'Ollon', 1867, 'vd'),
(517, 'Onnens', 'Onnens (VD)', 1425, 'vd'),
(518, 'Oppens', 'Oppens', 1047, 'vd'),
(519, 'Orbe', 'Orbe', 1350, 'vd'),
(520, 'Orges', 'Orges', 1430, 'vd'),
(521, 'Ormont-Dessous', 'Ormont-Dessous', 1862, 'vd'),
(522, 'Ormont-Dessus', 'Ormont-Dessus', 1865, 'vd'),
(523, 'Orny', 'Orny', 1317, 'vd'),
(524, 'Oron-la-Ville', 'Oron', 1610, 'vd'),
(525, 'Oron-le-Châtel', 'Oron', 1608, 'vd'),
(526, 'Orzens', 'Orzens', 1413, 'vd'),
(527, 'Ouchy', 'Lausanne', 1000, 'vd'),
(528, 'Oulens-sous-Echallens', 'Oulens-sous-Echallens', 1377, 'vd'),
(529, 'Oulens-sur-Lucens', 'Lucens', 1522, 'vd'),
(530, 'Pailly', 'Pailly', 1416, 'vd'),
(531, 'Palézieux-Gare', 'Oron', 1607, 'vd'),
(532, 'Palézieux-Village', 'Oron', 1607, 'vd'),
(533, 'Pampigny', 'Pampigny', 1142, 'vd'),
(534, 'Panex', 'Ollon', 1867, 'vd'),
(535, 'Paudex', 'Paudex', 1094, 'vd'),
(536, 'Payerne', 'Payerne', 1530, 'vd'),
(537, 'Peney (Vuiteboeuf)', 'Vuiteboeuf', 1445, 'vd'),
(538, 'Peney-le-Jorat', 'Jorat-Menthue', 1059, 'vd'),
(539, 'Penthalaz', 'Penthalaz', 1305, 'vd'),
(540, 'Penthaz', 'Penthaz', 1303, 'vd'),
(541, 'Penthéréaz', 'Penthéréaz', 1375, 'vd'),
(542, 'Perroy', 'Perroy', 1166, 'vd'),
(543, 'Petit Mont', 'Le Mont-sur-Lausanne', 1052, 'vd'),
(544, 'Peyres-Possens', 'Montanaire', 1063, 'vd'),
(545, 'Piguet-Dessous', 'Le Chenit', 1348, 'vd'),
(546, 'Piguet-Dessus', 'Le Chenit', 1348, 'vd'),
(547, 'Pizy', 'Aubonne', 1174, 'vd'),
(548, 'Plambuit', 'Ollon', 1867, 'vd'),
(549, 'Planchamp', 'Montreux', 1815, 'vd'),
(550, 'Poliez-le-Grand', 'Montilliez', 1041, 'vd'),
(551, 'Poliez-Pittet', 'Poliez-Pittet', 1041, 'vd'),
(552, 'Pompaples', 'Pompaples', 1318, 'vd'),
(553, 'Pomy', 'Pomy', 1405, 'vd'),
(554, 'Pont-de-la-Tine', 'Ormont-Dessous', 1863, 'vd'),
(555, 'Prahins', 'Donneloye', 1408, 'vd'),
(556, 'Prangins', 'Prangins', 1197, 'vd'),
(557, 'Premier', 'Premier', 1324, 'vd'),
(558, 'Préverenges', 'Préverenges', 1028, 'vd'),
(559, 'Prévonloup', 'Prévonloup', 1682, 'vd'),
(560, 'Prilly', 'Prilly', 1008, 'vd'),
(561, 'Provence', 'Provence', 1428, 'vd'),
(562, 'Puidoux', 'Puidoux', 1070, 'vd'),
(563, 'Puidoux-Gare', 'Puidoux', 1070, 'vd'),
(564, 'Pully', 'Pully', 1009, 'vd'),
(565, 'Rances', 'Rances', 1439, 'vd'),
(566, 'Renens', 'Renens (VD)', 1020, 'vd'),
(567, 'Renges', 'Ecublens (VD)', 1024, 'vd'),
(568, 'Rennaz', 'Rennaz', 1847, 'vd'),
(569, 'Ressudens', 'Grandcour', 1543, 'vd'),
(570, 'Reverolle', 'Reverolle', 1128, 'vd'),
(571, 'Riex', 'Bourg-en-Lavaux', 1097, 'vd'),
(572, 'Rivaz', 'Rivaz', 1071, 'vd'),
(573, 'Roche', 'Roche (VD)', 1852, 'vd'),
(574, 'Rolle', 'Rolle', 1180, 'vd'),
(575, 'Romainmôtier', 'Romainmôtier-Envy', 1323, 'vd'),
(576, 'Romairon', 'Tévenon', 1423, 'vd'),
(577, 'Romanel-sur-Lausanne', 'Romanel-sur-Lausanne', 1032, 'vd'),
(578, 'Romanel-sur-Morges', 'Romanel-sur-Morges', 1122, 'vd'),
(579, 'Ropraz', 'Ropraz', 1088, 'vd'),
(580, 'Rossenges', 'Rossenges', 1513, 'vd'),
(581, 'Rossens', 'Villarzel', 1554, 'vd'),
(582, 'Rossinière', 'Rossinière', 1658, 'vd'),
(583, 'Rougemont', 'Rougemont', 1659, 'vd'),
(584, 'Rovray', 'Rovray', 1463, 'vd'),
(585, 'Rueyres', 'Rueyres', 1046, 'vd'),
(586, 'Salavaux', 'Vully-les-Lacs', 1585, 'vd'),
(587, 'Salaz', 'Ollon', 1867, 'vd'),
(588, 'Sarzens', 'Sarzens', 1683, 'vd'),
(589, 'Sassel', 'Valbroye', 1534, 'vd'),
(590, 'Saubraz', 'Saubraz', 1189, 'vd'),
(591, 'Savigny', 'Savigny', 1073, 'vd'),
(592, 'Savuit', 'Lutry', 1095, 'vd'),
(593, 'Sédeilles', 'Villarzel', 1554, 'vd'),
(594, 'Seigneux', 'Valbroye', 1525, 'vd'),
(595, 'Senarclens', 'Senarclens', 1304, 'vd'),
(596, 'Sergey', 'Sergey', 1355, 'vd'),
(597, 'Serix', 'Oron', 1607, 'vd'),
(598, 'Sermuz', 'Yverdon-les-Bains', 1412, 'vd'),
(599, 'Servion', 'Servion', 1077, 'vd'),
(600, 'Sévery', 'Sévery', 1141, 'vd'),
(601, 'Signal-de-Bougy', 'Bougy-Villars', 1172, 'vd'),
(602, 'Signy', 'Signy-Avenex', 1274, 'vd'),
(603, 'Solalex', 'Bex', 1882, 'vd'),
(604, 'Sonzier', 'Montreux', 1822, 'vd'),
(605, 'Sottens', 'Jorat-Menthue', 1062, 'vd'),
(606, 'St-Barthélemy', 'Saint-Barthélemy (VD)', 1040, 'vd'),
(607, 'St-Cergue', 'Saint-Cergue', 1264, 'vd'),
(608, 'St-Cierges', 'Montanaire', 1410, 'vd'),
(609, 'St-Denis', 'Chavannes-le-Veyron', 1117, 'vd'),
(610, 'Ste-Croix', 'Sainte-Croix', 1450, 'vd'),
(611, 'St-George', 'Saint-George', 1188, 'vd'),
(612, 'St-Légier', 'Saint-Légier-La Chiésaz', 1806, 'vd'),
(613, 'St-Livres', 'Saint-Livres', 1176, 'vd'),
(614, 'St-Loup', 'Pompaples', 1318, 'vd'),
(615, 'St-Maurice', 'Champagne', 1424, 'vd'),
(616, 'St-Oyens', 'Saint-Oyens', 1187, 'vd'),
(617, 'St-Prex', 'Saint-Prex', 1162, 'vd'),
(618, 'St-Saphorin (Lavaux)', 'Saint-Saphorin (Lavaux)', 1071, 'vd'),
(619, 'St-Saphorin-sur-Morges', 'Echichens', 1113, 'vd'),
(620, 'St-Sulpice', 'Saint-Sulpice (VD)', 1025, 'vd'),
(621, 'St-Triphon', 'Ollon', 1867, 'vd'),
(622, 'Suchy', 'Suchy', 1433, 'vd'),
(623, 'Sugnens', 'Montilliez', 1043, 'vd'),
(624, 'Sullens', 'Sullens', 1036, 'vd'),
(625, 'Suscévaz', 'Suscévaz', 1437, 'vd'),
(626, 'Syens', 'Syens', 1510, 'vd'),
(627, 'Tannay', 'Tannay', 1295, 'vd'),
(628, 'Tartegnin', 'Tartegnin', 1180, 'vd'),
(629, 'Territet', 'Montreux', 1820, 'vd'),
(630, 'Thierrens', 'Montanaire', 1410, 'vd'),
(631, 'Tolochenaz', 'Tolochenaz', 1131, 'vd'),
(632, 'Treize-Cantons', 'Valbroye', 1525, 'vd'),
(633, 'Trélex', 'Trélex', 1270, 'vd'),
(634, 'Trey', 'Trey', 1552, 'vd'),
(635, 'Treycovagnes', 'Treycovagnes', 1436, 'vd'),
(636, 'Treytorrens (Lavaux)', 'Puidoux', 1096, 'vd'),
(637, 'Treytorrens (Payerne)', 'Treytorrens (Payerne)', 1538, 'vd'),
(638, 'Trois Chasseurs', 'Pully', 1068, 'vd'),
(639, 'Ursins', 'Ursins', 1412, 'vd'),
(640, 'Valeyres-sous-Montagny', 'Valeyres-sous-Montagny', 1441, 'vd'),
(641, 'Valeyres-sous-Rances', 'Valeyres-sous-Rances', 1358, 'vd'),
(642, 'Valeyres-sous-Ursins', 'Valeyres-sous-Ursins', 1412, 'vd'),
(643, 'Vallamand-Dessous', 'Vully-les-Lacs', 1586, 'vd'),
(644, 'Vallamand-Dessus', 'Vully-les-Lacs', 1586, 'vd'),
(645, 'Vallorbe', 'Vallorbe', 1337, 'vd'),
(646, 'Vaugondry', 'Tévenon', 1423, 'vd'),
(647, 'Vaulion', 'Vaulion', 1325, 'vd'),
(648, 'Vaux-sur-Morges', 'Vaux-sur-Morges', 1126, 'vd'),
(649, 'Vennes', 'Lausanne', 1000, 'vd'),
(650, 'Vernand-Dessous', 'Lausanne', 1033, 'vd'),
(651, 'Vernand-Dessus', 'Lausanne', 1032, 'vd'),
(652, 'Vernex', 'Montreux', 1820, 'vd'),
(653, 'Vers chez Patthey', 'Fiez', 1420, 'vd'),
(654, 'Vers-chez-Jaccard', 'Sainte-Croix', 1450, 'vd'),
(655, 'Vers-chez-les-Blancs', 'Lausanne', 1000, 'vd'),
(656, 'Vers-chez-Perrin', 'Payerne', 1551, 'vd'),
(657, 'Vers-l\'Eglise', 'Ormont-Dessus', 1864, 'vd'),
(658, 'Vers-Morey', 'Yvorne', 1853, 'vd'),
(659, 'Versvey', 'Yvorne', 1852, 'vd'),
(660, 'Vevey', 'Vevey', 1800, 'vd'),
(661, 'Veytaux', 'Veytaux', 1820, 'vd'),
(662, 'Vich', 'Vich', 1267, 'vd'),
(663, 'Villar-Bozon', 'L\'Isle', 1148, 'vd'),
(664, 'Villard-sur-Chamby', 'Montreux', 1832, 'vd'),
(665, 'Villaret', 'Belmont-sur-Yverdon', 1432, 'vd'),
(666, 'Villars-Bramard', 'Valbroye', 1682, 'vd'),
(667, 'Villars-Burquin', 'Tévenon', 1423, 'vd'),
(668, 'Villars-Epeney', 'Villars-Epeney', 1404, 'vd'),
(669, 'Villars-le-Comte', 'Villars-le-Comte', 1515, 'vd'),
(670, 'Villars-le-Grand', 'Vully-les-Lacs', 1584, 'vd'),
(671, 'Villars-le-Terroir', 'Villars-le-Terroir', 1040, 'vd'),
(672, 'Villars-Lussery', 'Lussery-Villars', 1307, 'vd'),
(673, 'Villars-Mendraz', 'Jorat-Menthue', 1061, 'vd'),
(674, 'Villars-sous-Champvent', 'Champvent', 1443, 'vd'),
(675, 'Villars-sous-Yens', 'Villars-sous-Yens', 1168, 'vd'),
(676, 'Villars-Ste-Croix', 'Villars-Sainte-Croix', 1029, 'vd'),
(677, 'Villars-sur-Ollon', 'Ollon', 1884, 'vd'),
(678, 'Villars-Tiercelin', 'Jorat-Menthue', 1058, 'vd'),
(679, 'Villarzel', 'Villarzel', 1555, 'vd'),
(680, 'Villeneuve', 'Villeneuve (VD)', 1844, 'vd'),
(681, 'Villette (Lavaux)', 'Bourg-en-Lavaux', 1096, 'vd'),
(682, 'Villy', 'Ollon', 1867, 'vd'),
(683, 'Vincy', 'Gilly', 1182, 'vd'),
(684, 'Vinzel', 'Vinzel', 1184, 'vd'),
(685, 'Vuarennes', 'Montreux', 1820, 'vd'),
(686, 'Vuarrengel', 'Vuarrens', 1418, 'vd'),
(687, 'Vuarrens', 'Vuarrens', 1418, 'vd'),
(688, 'Vucherens', 'Vucherens', 1509, 'vd'),
(689, 'Vufflens-la-Ville', 'Vufflens-la-Ville', 1302, 'vd'),
(690, 'Vufflens-le-Château', 'Vufflens-le-Château', 1134, 'vd'),
(691, 'Vugelles', 'Vugelles-La Mothe', 1431, 'vd'),
(692, 'Vuibroye', 'Oron', 1610, 'vd'),
(693, 'Vuiteboeuf', 'Vuiteboeuf', 1445, 'vd'),
(694, 'Vulliens', 'Vulliens', 1085, 'vd'),
(695, 'Vullierens', 'Vullierens', 1115, 'vd'),
(696, 'Yens', 'Yens', 1169, 'vd'),
(697, 'Yverdon-les-Bains', 'Yverdon-les-Bains', 1400, 'vd'),
(698, 'Yvonand', 'Yvonand', 1462, 'vd'),
(699, 'Yvorne', 'Yvorne', 1853, 'vd'),
(700, 'Agriswil', 'Ried bei Kerzers', 3216, 'fr'),
(701, 'Albeuve', 'Haut-Intyamon', 1669, 'fr'),
(702, 'Allières', 'Haut-Intyamon', 1669, 'fr'),
(703, 'Altavilla', 'Murten', 3280, 'fr'),
(704, 'Alterswil', 'Alterswil', 1715, 'fr'),
(705, 'Arconciel', 'Arconciel', 1732, 'fr'),
(706, 'Arruffens', 'Romont (FR)', 1680, 'fr'),
(707, 'Attalens', 'Attalens', 1616, 'fr'),
(708, 'Auboranges', 'Auboranges', 1673, 'fr'),
(709, 'Aumont', 'Les Montets', 1484, 'fr'),
(710, 'Autafond', 'Belfaux', 1782, 'fr'),
(711, 'Autavaux', 'Vernay', 1475, 'fr'),
(712, 'Autigny', 'Autigny', 1742, 'fr'),
(713, 'Avry-devant-Pont', 'Pont-en-Ogoz', 1644, 'fr'),
(714, 'Avry-sur-Matran', 'Avry', 1754, 'fr'),
(715, 'Barberêche', 'Barberêche', 1783, 'fr'),
(716, 'Bas-Vully', 'Mont-Vully', 1786, 'fr'),
(717, 'Belfaux', 'Belfaux', 1782, 'fr'),
(718, 'Bellechasse', 'Mont-Vully', 1786, 'fr'),
(719, 'Berlens', 'Mézières (FR)', 1680, 'fr'),
(720, 'Besencens', 'Saint-Martin (FR)', 1609, 'fr'),
(721, 'Bionnens', 'Ursy', 1670, 'fr'),
(722, 'Blessens', 'Rue', 1675, 'fr'),
(723, 'Bollion', 'Lully (FR)', 1470, 'fr'),
(724, 'Bonnefontaine', 'Le Mouret', 1724, 'fr'),
(725, 'Bösingen', 'Bösingen', 3178, 'fr'),
(726, 'Bossonnens', 'Bossonnens', 1615, 'fr'),
(727, 'Botterens', 'Botterens', 1652, 'fr'),
(728, 'Bouloz', 'Le Flon', 1699, 'fr'),
(729, 'Bourguillon', 'Fribourg', 1722, 'fr'),
(730, 'Breilles', 'Barberêche', 1783, 'fr'),
(731, 'Broc', 'Broc', 1636, 'fr'),
(732, 'Broc-Fabrique', 'Broc', 1636, 'fr'),
(733, 'Brünisried', 'Brünisried', 1719, 'fr'),
(734, 'Büchslen', 'Murten', 3215, 'fr'),
(735, 'Bulle', 'Bulle', 1630, 'fr'),
(736, 'Bundtels', 'Düdingen', 3186, 'fr'),
(737, 'Burg bei Murten', 'Murten', 3280, 'fr'),
(738, 'Bussy', 'Bussy (FR)', 1541, 'fr'),
(739, 'Carignan', 'Vallon', 1565, 'fr'),
(740, 'Cerniat', 'Val-de-Charmey', 1654, 'fr'),
(741, 'Châbles', 'Châbles', 1474, 'fr'),
(742, 'Chamblioux', 'Givisiez', 1763, 'fr'),
(743, 'Chamblioux', 'Granges-Paccot', 1763, 'fr'),
(744, 'Chandon', 'Belmont-Broye', 1773, 'fr'),
(745, 'Chandossel', 'Villarepos', 1583, 'fr'),
(746, 'Chapelle (Broye)', 'Cheiry', 1534, 'fr'),
(747, 'Chapelle (Glâne)', 'Chapelle (Glâne)', 1608, 'fr'),
(748, 'Charmey', 'Val-de-Charmey', 1637, 'fr'),
(749, 'Châtel-St-Denis', 'Châtel-Saint-Denis', 1618, 'fr'),
(750, 'Châtel-sur-Montsalvens', 'Châtel-sur-Montsalvens', 1653, 'fr'),
(751, 'Châtillon', 'Châtillon (FR)', 1473, 'fr'),
(752, 'Châtonnaye', 'Châtonnaye', 1553, 'fr'),
(753, 'Chavannes-les-Forts', 'Siviriez', 1676, 'fr'),
(754, 'Chavannes-sous-Orsonnens', 'Villorsonnens', 1694, 'fr'),
(755, 'Cheiry', 'Cheiry', 1529, 'fr'),
(756, 'Chénens', 'Chénens', 1744, 'fr'),
(757, 'Chésopelloz', 'Chésopelloz', 1720, 'fr'),
(758, 'Cheyres', 'Cheyres', 1468, 'fr'),
(759, 'Corbières', 'Corbières', 1647, 'fr'),
(760, 'Corcelles', 'Attalens', 1616, 'fr'),
(761, 'Cordast', 'Gurmels', 1792, 'fr'),
(762, 'Corjolens', 'Avry', 1754, 'fr'),
(763, 'Cormagens', 'La Sonnaz', 1782, 'fr'),
(764, 'Cormanon', 'Villars-sur-Glâne', 1752, 'fr'),
(765, 'Cormérod', 'Misery-Courtion', 1721, 'fr'),
(766, 'Corminboeuf', 'Corminboeuf', 1720, 'fr'),
(767, 'Corpataux', 'Gibloux', 1727, 'fr'),
(768, 'Corsalettes', 'Grolley', 1772, 'fr'),
(769, 'Corserey', 'Corserey', 1747, 'fr'),
(770, 'Cottens', 'Cottens (FR)', 1741, 'fr'),
(771, 'Coumin', 'Cheiry', 1529, 'fr'),
(772, 'Courgevaux', 'Courgevaux', 1796, 'fr'),
(773, 'Courlevon', 'Murten', 1795, 'fr'),
(774, 'Cournillens', 'Misery-Courtion', 1721, 'fr'),
(775, 'Courtaman', 'Courtepin', 1791, 'fr'),
(776, 'Courtepin', 'Courtepin', 1784, 'fr'),
(777, 'Courtion', 'Misery-Courtion', 1721, 'fr'),
(778, 'Cousset', 'Montagny (FR)', 1774, 'fr'),
(779, 'Coussiberlé', 'Murten', 1795, 'fr'),
(780, 'Cressier', 'Cressier (FR)', 1785, 'fr'),
(781, 'Crésuz', 'Crésuz', 1653, 'fr'),
(782, 'Cugy', 'Cugy (FR)', 1482, 'fr'),
(783, 'Cutterwil', 'Belfaux', 1782, 'fr'),
(784, 'Delley', 'Delley-Portalban', 1567, 'fr'),
(785, 'Dietisberg', 'Wünnewil-Flamatt', 3184, 'fr'),
(786, 'Domdidier', 'Belmont-Broye', 1564, 'fr'),
(787, 'Dompierre FR', 'Belmont-Broye', 1563, 'fr'),
(788, 'Drognens', 'Siviriez', 1680, 'fr'),
(789, 'Düdingen', 'Düdingen', 3186, 'fr'),
(790, 'Echarlens', 'Echarlens', 1646, 'fr'),
(791, 'Ecublens', 'Ecublens (FR)', 1673, 'fr'),
(792, 'Ecuvillens', 'Hauterive (FR)', 1730, 'fr'),
(793, 'Elswil', 'Wünnewil-Flamatt', 3184, 'fr'),
(794, 'Enney', 'Bas-Intyamon', 1667, 'fr'),
(795, 'Epagny', 'Gruyères', 1663, 'fr'),
(796, 'Ependes', 'Ependes (FR)', 1731, 'fr'),
(797, 'Eschiens', 'Ecublens (FR)', 1673, 'fr'),
(798, 'Esmonts', 'Ursy', 1670, 'fr'),
(799, 'Essert', 'Le Mouret', 1724, 'fr'),
(800, 'Estavannens', 'Bas-Intyamon', 1665, 'fr'),
(801, 'Estavayer-le-Gibloux', 'Gibloux', 1695, 'fr'),
(802, 'Estavayer-le-Lac', 'Estavayer-le-Lac', 1470, 'fr'),
(803, 'Estévenens', 'Vuisternens-dev-Romont', 1687, 'fr'),
(804, 'Farvagny', 'Gibloux', 1726, 'fr'),
(805, 'Farvagny-le-Grand', 'Gibloux', 1726, 'fr'),
(806, 'Farvagny-le-Petit', 'Gibloux', 1726, 'fr'),
(807, 'Fendringen', 'Bösingen', 3178, 'fr'),
(808, 'Ferpicloz', 'Ferpicloz', 1724, 'fr'),
(809, 'Fétigny', 'Fétigny', 1532, 'fr'),
(810, 'Fiaugères', 'Saint-Martin (FR)', 1609, 'fr'),
(811, 'Fillistorf', 'Schmitten (FR)', 3185, 'fr'),
(812, 'Flamatt', 'Wünnewil-Flamatt', 3175, 'fr'),
(813, 'Font', 'Estavayer-le-Lac', 1473, 'fr'),
(814, 'Forel', 'Vernay', 1475, 'fr'),
(815, 'Formangueires', 'La Sonnaz', 1782, 'fr'),
(816, 'Franex', 'Murist', 1489, 'fr'),
(817, 'Fräschels', 'Fräschels', 3284, 'fr'),
(818, 'Frasses', 'Les Montets', 1483, 'fr'),
(819, 'Fribourg', 'Fribourg', 1700, 'fr'),
(821, 'Fruence', 'Châtel-Saint-Denis', 1618, 'fr'),
(822, 'Galmiz', 'Galmiz', 3285, 'fr'),
(823, 'Galteren', 'Alterswil', 1712, 'fr'),
(824, 'Garmiswil', 'Düdingen', 3186, 'fr'),
(825, 'Gempenach', 'Gempenach', 3215, 'fr'),
(826, 'Giffers', 'Giffers', 1735, 'fr'),
(827, 'Gillarens', 'Rue', 1673, 'fr'),
(828, 'Givisiez', 'Givisiez', 1762, 'fr'),
(829, 'Gletterens', 'Gletterens', 1544, 'fr'),
(830, 'Grandsivaz', 'Montagny (FR)', 1775, 'fr'),
(831, 'Grandvillard', 'Grandvillard', 1666, 'fr'),
(832, 'Granges (Veveyse)', 'Granges (Veveyse)', 1614, 'fr'),
(833, 'Granges-de-Vesin', 'Les Montets', 1484, 'fr'),
(834, 'Granges-Paccot', 'Granges-Paccot', 1763, 'fr'),
(835, 'Grangettes', 'Grangettes', 1686, 'fr'),
(836, 'Grattavache', 'La Verrerie', 1624, 'fr'),
(837, 'Greng', 'Greng', 3280, 'fr'),
(838, 'Grenilles', 'Gibloux', 1726, 'fr'),
(839, 'Grolley', 'Grolley', 1772, 'fr'),
(840, 'Grossguschelmuth', 'Gurmels', 1792, 'fr'),
(841, 'Grossried (Ueberstorf)', 'Ueberstorf', 3175, 'fr'),
(842, 'Gruyères', 'Gruyères', 1663, 'fr'),
(843, 'Gumefens', 'Pont-en-Ogoz', 1643, 'fr'),
(844, 'Gurmels', 'Gurmels', 3212, 'fr'),
(845, 'Guschelmuth', 'Gurmels', 1792, 'fr'),
(846, 'Hauteville', 'Hauteville', 1648, 'fr'),
(847, 'Haut-Vully', 'Mont-Vully', 1789, 'fr'),
(848, 'Heitenried', 'Heitenried', 1714, 'fr'),
(849, 'Heitiwil', 'Düdingen', 3186, 'fr'),
(850, 'Hennens', 'Billens-Hennens', 1681, 'fr'),
(851, 'Im Fang', 'Jaun', 1656, 'fr'),
(852, 'Jaun', 'Jaun', 1656, 'fr'),
(853, 'Jetschwil', 'Düdingen', 3186, 'fr'),
(854, 'Jeuss', 'Murten', 1793, 'fr'),
(855, 'Joressens', 'Mont-Vully', 1789, 'fr'),
(856, 'Kerzers', 'Kerzers', 3210, 'fr'),
(857, 'Kleinbösingen', 'Kleinbösingen', 3213, 'fr'),
(858, 'Kleingurmels', 'Gurmels', 3212, 'fr'),
(859, 'Kleinguschelmuth', 'Gurmels', 1792, 'fr'),
(860, 'La Corbaz', 'La Sonnaz', 1782, 'fr'),
(861, 'La Faye', 'Givisiez', 1763, 'fr'),
(862, 'La Faye', 'Granges-Paccot', 1763, 'fr'),
(863, 'La Joux', 'Vuisternens-dev-Romont', 1697, 'fr'),
(864, 'La Magne', 'Vuisternens-dev-Romont', 1687, 'fr'),
(865, 'La Neirigue', 'Vuisternens-dev-Romont', 1686, 'fr'),
(866, 'La Roche', 'La Roche', 1634, 'fr'),
(867, 'La Rougève', 'Semsales', 1623, 'fr'),
(868, 'La Sonnaz', 'La Sonnaz', 1783, 'fr'),
(869, 'La Tour-de-Trême', 'Bulle', 1635, 'fr'),
(870, 'La Tsintre', 'Val-de-Charmey', 1637, 'fr'),
(871, 'La Valsainte', 'Val-de-Charmey', 1654, 'fr'),
(872, 'La Verrerie', 'La Verrerie', 1624, 'fr'),
(873, 'La Vounaise', 'Murist', 1489, 'fr'),
(874, 'Le Bry', 'Pont-en-Ogoz', 1645, 'fr'),
(875, 'Le Châtelard-près-Romont', 'Le Châtelard', 1689, 'fr'),
(876, 'Le Crêt-près-Semsales', 'La Verrerie', 1611, 'fr'),
(877, 'Le Jordil', 'Saint-Martin (FR)', 1609, 'fr'),
(878, 'Le Mouret', 'Ferpicloz', 1724, 'fr'),
(879, 'Le Mouret', 'Le Mouret', 1724, 'fr'),
(880, 'Le Pafuet', 'Le Mouret', 1724, 'fr'),
(881, 'Le Pâquier', 'Le Pâquier (FR)', 1661, 'fr'),
(882, 'Le Péage', 'Mont-Vully', 1788, 'fr'),
(883, 'Le Saulgy', 'Siviriez', 1678, 'fr'),
(884, 'Léchelles', 'Belmont-Broye', 1773, 'fr'),
(885, 'Lentigny', 'La Brillaz', 1745, 'fr'),
(886, 'Les Chavannes-sous-Romont', 'Romont (FR)', 1680, 'fr'),
(887, 'Les Daillettes', 'Villars-sur-Glâne', 1752, 'fr'),
(888, 'Les Ecasseys', 'Vuisternens-dev-Romont', 1697, 'fr'),
(889, 'Les Friques', 'Saint-Aubin (FR)', 1566, 'fr'),
(890, 'Les Paccots', 'Châtel-Saint-Denis', 1619, 'fr'),
(891, 'Les Planches', 'Vernay', 1475, 'fr'),
(892, 'Les Ponts', 'Vaulruz', 1627, 'fr'),
(893, 'Les Sciernes-d\'Albeuve', 'Haut-Intyamon', 1669, 'fr'),
(894, 'Lessoc', 'Haut-Intyamon', 1669, 'fr'),
(895, 'Liderrey', 'Val-de-Charmey', 1637, 'fr'),
(896, 'Liebistorf', 'Gurmels', 3213, 'fr'),
(897, 'Lieffrens', 'Vuisternens-dev-Romont', 1688, 'fr'),
(898, 'Litzistorf', 'Bösingen', 3178, 'fr'),
(899, 'Lossy', 'La Sonnaz', 1782, 'fr'),
(900, 'Lovens', 'La Brillaz', 1756, 'fr'),
(901, 'Lugnorre', 'Mont-Vully', 1789, 'fr'),
(902, 'Lully', 'Lully (FR)', 1470, 'fr'),
(903, 'Lurtigen', 'Murten', 3215, 'fr'),
(904, 'Lussy', 'La Folliaz', 1690, 'fr'),
(905, 'Magnedens', 'Gibloux', 1727, 'fr'),
(906, 'Mannens', 'Montagny (FR)', 1775, 'fr'),
(907, 'Mariahilf', 'Düdingen', 3186, 'fr'),
(908, 'Marly', 'Marly', 1723, 'fr'),
(909, 'Marsens', 'Marsens', 1633, 'fr'),
(910, 'Massonnens', 'Massonnens', 1692, 'fr'),
(911, 'Matran', 'Matran', 1753, 'fr'),
(912, 'Maules', 'Sâles', 1625, 'fr'),
(913, 'Ménières', 'Ménières', 1533, 'fr'),
(914, 'Meyriez', 'Meyriez', 3280, 'fr'),
(915, 'Mézières', 'Mézières (FR)', 1684, 'fr'),
(916, 'Middes', 'Torny', 1749, 'fr'),
(917, 'Misery', 'Misery-Courtion', 1721, 'fr'),
(918, 'Moléson-Village', 'Gruyères', 1663, 'fr'),
(919, 'Montagny-la-Ville', 'Montagny (FR)', 1776, 'fr'),
(920, 'Montagny-les-Monts', 'Montagny (FR)', 1774, 'fr'),
(921, 'Montborget', 'Murist', 1489, 'fr'),
(922, 'Montbovon', 'Haut-Intyamon', 1669, 'fr'),
(923, 'Montbrelloz', 'Vernay', 1475, 'fr'),
(924, 'Montécu', 'Le Mouret', 1724, 'fr'),
(925, 'Monterschu', 'Gurmels', 3212, 'fr'),
(926, 'Montet (Broye)', 'Les Montets', 1483, 'fr'),
(927, 'Montet (Glâne)', 'Montet (Glâne)', 1674, 'fr'),
(928, 'Montévraz', 'Le Mouret', 1724, 'fr'),
(929, 'Morens', 'Morens (FR)', 1541, 'fr'),
(930, 'Morlens', 'Ursy', 1674, 'fr'),
(931, 'Morlon', 'Morlon', 1638, 'fr'),
(932, 'Mossel', 'Ursy', 1675, 'fr'),
(933, 'Môtier (Vully)', 'Mont-Vully', 1787, 'fr'),
(934, 'Mülital', 'Schmitten (FR)', 3185, 'fr'),
(935, 'Mülital', 'Wünnewil-Flamatt', 3185, 'fr'),
(936, 'Muntelier', 'Muntelier', 3286, 'fr'),
(937, 'Mur', 'Mont-Vully', 1787, 'fr'),
(938, 'Murist', 'Murist', 1489, 'fr'),
(939, 'Murten', 'Murten', 3280, 'fr'),
(940, 'Nant', 'Mont-Vully', 1786, 'fr'),
(941, 'Neirivue', 'Haut-Intyamon', 1669, 'fr'),
(942, 'Neyruz', 'Neyruz (FR)', 1740, 'fr'),
(943, 'Nidermonten', 'St. Antoni', 1714, 'fr'),
(944, 'Niedermuhren', 'Heitenried', 1714, 'fr'),
(945, 'Niedermuhren', 'St. Antoni', 1714, 'fr'),
(946, 'Nierlet-les-Bois', 'Ponthaux', 1772, 'fr'),
(947, 'Nierlet-le-Toit', 'Neyruz (FR)', 1740, 'fr'),
(948, 'Noflen', 'Bösingen', 3178, 'fr'),
(949, 'Noréaz', 'Noréaz', 1757, 'fr'),
(950, 'Nuvilly', 'Nuvilly', 1485, 'fr'),
(951, 'Obermonten', 'St. Antoni', 1713, 'fr'),
(952, 'Oberriet', 'Le Mouret', 1724, 'fr'),
(953, 'Oberschrot', 'Oberschrot', 1716, 'fr'),
(954, 'Onnens', 'La Brillaz', 1756, 'fr'),
(955, 'Orsonnens', 'Villorsonnens', 1694, 'fr'),
(956, 'Pensier', 'Barberêche', 1783, 'fr'),
(957, 'Pfaffenholz', 'Wünnewil-Flamatt', 3184, 'fr'),
(958, 'Pierrafortscha', 'Pierrafortscha', 1723, 'fr'),
(959, 'Plaffeien', 'Plaffeien', 1716, 'fr'),
(960, 'Plasselb', 'Plasselb', 1737, 'fr'),
(961, 'Pont (Veveyse)', 'Le Flon', 1699, 'fr'),
(962, 'Ponthaux', 'Ponthaux', 1772, 'fr'),
(963, 'Pont-la-Ville', 'Pont-la-Ville', 1649, 'fr'),
(964, 'Porsel', 'Le Flon', 1699, 'fr'),
(965, 'Portalban', 'Delley-Portalban', 1568, 'fr'),
(966, 'Posat', 'Gibloux', 1726, 'fr'),
(967, 'Posieux', 'Hauterive (FR)', 1725, 'fr'),
(968, 'Praratoud', 'Surpierre', 1528, 'fr'),
(969, 'Praroman', 'Le Mouret', 1724, 'fr'),
(970, 'Prayoud', 'Châtel-Saint-Denis', 1618, 'fr'),
(971, 'Praz (Vully)', 'Mont-Vully', 1788, 'fr'),
(972, 'Prévondavaux', 'Prévondavaux', 1410, 'fr'),
(973, 'Prez-vers-Noréaz', 'Prez-vers-Noréaz', 1746, 'fr'),
(974, 'Prez-vers-Siviriez', 'Siviriez', 1677, 'fr'),
(975, 'Pringy', 'Gruyères', 1663, 'fr'),
(976, 'Progens', 'La Verrerie', 1624, 'fr'),
(977, 'Promasens', 'Rue', 1673, 'fr'),
(978, 'Rechthalten', 'Rechthalten', 1718, 'fr'),
(979, 'Remaufens', 'Remaufens', 1617, 'fr'),
(980, 'Riaz', 'Riaz', 1632, 'fr'),
(981, 'Richterwil', 'Bösingen', 3178, 'fr'),
(982, 'Ried bei Kerzers', 'Ried bei Kerzers', 3216, 'fr'),
(983, 'Riederberg', 'Bösingen', 3178, 'fr'),
(984, 'Romanens', 'Sâles', 1626, 'fr'),
(985, 'Römerswil', 'St. Ursen', 1722, 'fr'),
(986, 'Romont', 'Romont (FR)', 1680, 'fr'),
(987, 'Rosé', 'Avry', 1754, 'fr'),
(988, 'Rossens FR', 'Gibloux', 1728, 'fr'),
(989, 'Rue', 'Rue', 1673, 'fr'),
(990, 'Rueyres', 'Sâles', 1626, 'fr'),
(991, 'Rueyres-les-Prés', 'Rueyres-les-Prés', 1542, 'fr'),
(992, 'Rueyres-St-Laurent', 'Gibloux', 1695, 'fr'),
(993, 'Russy', 'Belmont-Broye', 1773, 'fr'),
(994, 'Sales', 'Ependes (FR)', 1731, 'fr'),
(995, 'Sâles (Gruyère)', 'Sâles', 1625, 'fr'),
(996, 'Salvenach', 'Murten', 1794, 'fr'),
(997, 'Schmitten', 'Schmitten (FR)', 3185, 'fr'),
(998, 'Schwarzsee', 'Plaffeien', 1716, 'fr'),
(999, 'Seiry', 'Lully (FR)', 1470, 'fr'),
(1000, 'Semsales', 'Semsales', 1623, 'fr'),
(1001, 'Senèdes', 'Senèdes', 1724, 'fr'),
(1002, 'Sévaz', 'Sévaz', 1541, 'fr'),
(1003, 'Siviriez', 'Siviriez', 1678, 'fr'),
(1004, 'Sommentier', 'Vuisternens-dev-Romont', 1688, 'fr'),
(1005, 'Sorens', 'Sorens', 1642, 'fr'),
(1006, 'St. Antoni', 'St. Antoni', 1713, 'fr'),
(1007, 'St. Silvester', 'St. Silvester', 1736, 'fr'),
(1008, 'St. Ursen', 'St. Ursen', 1717, 'fr'),
(1009, 'St. Wolfgang', 'Düdingen', 3186, 'fr'),
(1010, 'St-Aubin', 'Saint-Aubin (FR)', 1566, 'fr'),
(1011, 'St-Martin', 'Saint-Martin (FR)', 1609, 'fr'),
(1012, 'Sugiez', 'Mont-Vully', 1786, 'fr'),
(1013, 'Surpierre', 'Surpierre', 1528, 'fr'),
(1014, 'Tafers', 'Tafers', 1712, 'fr'),
(1015, 'Tatroz', 'Attalens', 1617, 'fr'),
(1016, 'Tentlingen', 'Tentlingen', 1734, 'fr'),
(1017, 'Torny-le-Grand', 'Torny', 1748, 'fr'),
(1018, 'Torny-le-Petit', 'Torny', 1749, 'fr'),
(1019, 'Treyfayes', 'Sâles', 1626, 'fr'),
(1020, 'Treyvaux', 'Treyvaux', 1733, 'fr'),
(1021, 'Tuftera', 'Bösingen', 3178, 'fr'),
(1022, 'Ueberstorf', 'Ueberstorf', 3182, 'fr'),
(1023, 'Uebewil', 'Düdingen', 1700, 'fr'),
(1024, 'Ulmiz', 'Ulmiz', 3214, 'fr'),
(1025, 'Ursy', 'Ursy', 1670, 'fr'),
(1026, 'Vallon', 'Vallon', 1565, 'fr'),
(1027, 'Vauderens', 'Ursy', 1675, 'fr'),
(1028, 'Vaulruz', 'Vaulruz', 1627, 'fr'),
(1029, 'Vesin', 'Cugy (FR)', 1483, 'fr'),
(1030, 'Villangeaux', 'Ecublens (FR)', 1673, 'fr'),
(1031, 'Villaraboud', 'Siviriez', 1679, 'fr'),
(1032, 'Villaranon', 'Siviriez', 1678, 'fr'),
(1033, 'Villarbeney', 'Botterens', 1652, 'fr'),
(1034, 'Villarepos', 'Villarepos', 1583, 'fr'),
(1035, 'Villarey', 'Montagny (FR)', 1774, 'fr'),
(1036, 'Villargiroud', 'Villorsonnens', 1694, 'fr'),
(1037, 'Villariaz', 'Vuisternens-dev-Romont', 1685, 'fr'),
(1038, 'Villarimboud', 'La Folliaz', 1691, 'fr'),
(1039, 'Villarlod', 'Gibloux', 1695, 'fr'),
(1040, 'Villarsel-le-Gibloux', 'Gibloux', 1695, 'fr'),
(1041, 'Villarsel-sur-Marly', 'Villarsel-sur-Marly', 1723, 'fr'),
(1042, 'Villarsiviriaux', 'Villorsonnens', 1694, 'fr'),
(1043, 'Villars-les-Joncs', 'Düdingen', 1700, 'fr'),
(1044, 'Villars-sous-Mont', 'Bas-Intyamon', 1666, 'fr'),
(1045, 'Villars-sur-Glâne', 'Villars-sur-Glâne', 1752, 'fr'),
(1046, 'Villarvolard', 'Corbières', 1651, 'fr'),
(1047, 'Villaz-St-Pierre', 'Villaz-Saint-Pierre', 1690, 'fr'),
(1048, 'Villeneuve', 'Villeneuve (FR)', 1527, 'fr'),
(1049, 'Vuadens', 'Vuadens', 1628, 'fr'),
(1050, 'Vuarat', 'Attalens', 1616, 'fr'),
(1051, 'Vuarmarens', 'Ursy', 1674, 'fr'),
(1052, 'Vuippens', 'Marsens', 1633, 'fr'),
(1053, 'Vuissens', 'Vuissens', 1486, 'fr'),
(1054, 'Vuisternens-devant-Romont', 'Vuisternens-dev-Romont', 1687, 'fr'),
(1055, 'Vuisternens-en-Ogoz', 'Gibloux', 1696, 'fr'),
(1056, 'Wallenbuch', 'Gurmels', 3206, 'fr'),
(1057, 'Wallenried', 'Wallenried', 1784, 'fr'),
(1058, 'Wengliswil', 'Alterswil', 1715, 'fr'),
(1059, 'Wiler vor Holz', 'Heitenried', 1714, 'fr'),
(1060, 'Wünnewil', 'Wünnewil-Flamatt', 3184, 'fr'),
(1061, 'Zénauva', 'Le Mouret', 1724, 'fr'),
(1062, 'Zollhaus', 'Plaffeien', 1716, 'fr'),
(1063, 'Zumholz', 'Alterswil', 1713, 'fr'),
(1064, 'Zumholz bei Plaffeien', 'Zumholz', 1719, 'fr');

-- --------------------------------------------------------

--
-- Structure de la table `organisateur`
--

CREATE TABLE `organisateur` (
  `idOrganisateur` mediumint(9) NOT NULL,
  `idPersonne` mediumint(9) NOT NULL DEFAULT '0',
  `nom` varchar(255) NOT NULL DEFAULT '',
  `adresse` varchar(255) NOT NULL DEFAULT '',
  `region` varchar(2) NOT NULL DEFAULT 'ge',
  `URL` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `telephone` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '',
  `presentation` text NOT NULL,
  `statut` enum('actif','inactif','ancien') NOT NULL DEFAULT 'actif',
  `date_ajout` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_derniere_modif` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

CREATE TABLE `personne` (
  `idPersonne` smallint(5) UNSIGNED NOT NULL,
  `pseudo` varchar(60) NOT NULL DEFAULT '',
  `mot_de_passe` varchar(40) NOT NULL DEFAULT '',
  `cookie` varchar(32) NOT NULL DEFAULT '',
  `session` varchar(32) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `groupe` tinyint(4) UNSIGNED NOT NULL DEFAULT '12',
  `statut` enum('actif','inactif','demande') NOT NULL DEFAULT 'actif',
  `nom` varchar(40) NOT NULL DEFAULT '',
  `prenom` varchar(40) NOT NULL DEFAULT '',
  `affiliation` varchar(255) NOT NULL DEFAULT '',
  `adresse` text NOT NULL,
  `region` varchar(2) NOT NULL DEFAULT 'ge',
  `telephone` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(80) NOT NULL DEFAULT '',
  `URL` text NOT NULL,
  `signature` enum('pseudo','prenom','nomcomplet','aucune') NOT NULL DEFAULT 'pseudo',
  `avec_affiliation` enum('oui','non') NOT NULL DEFAULT 'non',
  `notification_commentaires` enum('oui','non') NOT NULL DEFAULT 'non',
  `gds` varchar(255) NOT NULL DEFAULT '',
  `actif` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `remarque` varchar(255) NOT NULL,
  `dateAjout` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_derniere_modif` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `personne_organisateur`
--

CREATE TABLE `personne_organisateur` (
  `idOrganisateur` mediumint(9) NOT NULL DEFAULT '0',
  `idPersonne` smallint(6) NOT NULL DEFAULT '0',
  `role` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `idSalle` mediumint(9) NOT NULL,
  `idLieu` mediumint(9) NOT NULL DEFAULT '0',
  `idPersonne` mediumint(9) NOT NULL DEFAULT '0',
  `nom` varchar(255) NOT NULL DEFAULT '',
  `emplacement` varchar(255) NOT NULL DEFAULT '',
  `dateAjout` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_derniere_modif` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `temp`
--

CREATE TABLE `temp` (
  `id` mediumint(9) NOT NULL,
  `idPersonne` mediumint(9) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) NOT NULL DEFAULT '',
  `expiration` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `affiliation`
--
ALTER TABLE `affiliation`
  ADD PRIMARY KEY (`idPersonne`,`idAffiliation`);

--
-- Index pour la table `breve`
--
ALTER TABLE `breve`
  ADD PRIMARY KEY (`idBreve`),
  ADD KEY `breve_dateajout` (`dateAjout`),
  ADD KEY `breve_actif` (`actif`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`idCommentaire`);

--
-- Index pour la table `descriptionlieu`
--
ALTER TABLE `descriptionlieu`
  ADD PRIMARY KEY (`idLieu`,`idPersonne`),
  ADD KEY `desclieu_dateajout` (`dateAjout`);

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`idevenement`),
  ADD KEY `semaine` (`genre`,`dateEvenement`),
  ADD KEY `dateajout` (`dateAjout`),
  ADD KEY `ev_idlieu_dateev` (`idLieu`,`dateEvenement`);

--
-- Index pour la table `evenement_favori`
--
ALTER TABLE `evenement_favori`
  ADD PRIMARY KEY (`idPersonne`,`idEvenement`);

--
-- Index pour la table `evenement_fichierrecu`
--
ALTER TABLE `evenement_fichierrecu`
  ADD PRIMARY KEY (`idEvenement`,`idFichierrecu`);

--
-- Index pour la table `evenement_organisateur`
--
ALTER TABLE `evenement_organisateur`
  ADD PRIMARY KEY (`idEvenement`,`idOrganisateur`);

--
-- Index pour la table `fichierrecu`
--
ALTER TABLE `fichierrecu`
  ADD PRIMARY KEY (`idFichierrecu`);

--
-- Index pour la table `groupes`
--
ALTER TABLE `groupes`
  ADD PRIMARY KEY (`idgroupe`);

--
-- Index pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD PRIMARY KEY (`idLieu`),
  ADD KEY `nom` (`nom`),
  ADD KEY `lieu_dateajout` (`dateAjout`);

--
-- Index pour la table `lieu_favori`
--
ALTER TABLE `lieu_favori`
  ADD PRIMARY KEY (`idPersonne`,`idLieu`);

--
-- Index pour la table `lieu_fichierrecu`
--
ALTER TABLE `lieu_fichierrecu`
  ADD PRIMARY KEY (`idLieu`,`idFichierrecu`);

--
-- Index pour la table `lieu_organisateur`
--
ALTER TABLE `lieu_organisateur`
  ADD PRIMARY KEY (`idOrganisateur`,`idLieu`);

--
-- Index pour la table `localite`
--
ALTER TABLE `localite`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `organisateur`
--
ALTER TABLE `organisateur`
  ADD PRIMARY KEY (`idOrganisateur`);

--
-- Index pour la table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`idPersonne`),
  ADD KEY `pseudo` (`pseudo`);

--
-- Index pour la table `personne_organisateur`
--
ALTER TABLE `personne_organisateur`
  ADD PRIMARY KEY (`idOrganisateur`,`idPersonne`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`idSalle`);

--
-- Index pour la table `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idPersonne` (`idPersonne`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `breve`
--
ALTER TABLE `breve`
  MODIFY `idBreve` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `idCommentaire` mediumint(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `idevenement` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `fichierrecu`
--
ALTER TABLE `fichierrecu`
  MODIFY `idFichierrecu` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `lieu`
--
ALTER TABLE `lieu`
  MODIFY `idLieu` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `localite`
--
ALTER TABLE `localite`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `organisateur`
--
ALTER TABLE `organisateur`
  MODIFY `idOrganisateur` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `personne`
--
ALTER TABLE `personne`
  MODIFY `idPersonne` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `salle`
--
ALTER TABLE `salle`
  MODIFY `idSalle` mediumint(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `temp`
--
ALTER TABLE `temp`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
