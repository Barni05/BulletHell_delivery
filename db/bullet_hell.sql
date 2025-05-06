-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2025 at 05:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bullet_hell`
--

-- --------------------------------------------------------

--
-- Table structure for table `maps`
--

CREATE TABLE `maps` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `music_pack_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `maps`
--

INSERT INTO `maps` (`id`, `name`, `file_name`, `description`, `music_pack_id`) VALUES
(1, 'Slaughterhouse', 'slaughterhouse.png', 'This is the kind of place you really shouldn\'t go into, but out of sheer curiosity, you step in. The scent of blood and what you see overloads your senses. You will never get out.', 3),
(3, 'Palace of the Setting Sun', 'medieval_japan.png', 'I live by the sword, you die by my sword.', 2),
(4, 'Limitless', 'practice.png', 'Every weapon deserves a chance to shine. Even if they are trash. But you never know.', 5);

-- --------------------------------------------------------

--
-- Table structure for table `map_weapons`
--

CREATE TABLE `map_weapons` (
  `map_id` int(11) NOT NULL,
  `weapon_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `map_weapons`
--

INSERT INTO `map_weapons` (`map_id`, `weapon_id`) VALUES
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(3, 31),
(3, 32),
(3, 33),
(3, 34),
(3, 35),
(3, 36);

-- --------------------------------------------------------

--
-- Table structure for table `music_packs`
--

CREATE TABLE `music_packs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cover_image` varchar(40) NOT NULL,
  `anthem` varchar(50) NOT NULL,
  `main_menu_theme1` varchar(50) NOT NULL,
  `main_menu_theme2` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `music_packs`
--

INSERT INTO `music_packs` (`id`, `name`, `cover_image`, `anthem`, `main_menu_theme1`, `main_menu_theme2`, `description`) VALUES
(2, 'CRT_HEAD1', 'crt1_coverart.png', 'kit_crt1/crt_head - Night Ops.wav', 'kit_crt1/crt_head - Electrosphere.wav', 'kit_crt1/crt_head - Gunstar Heroes.wav', 'Adrenaline and bloodthirst come together in this engaging kit, if it makes your skin crawl, it\'s already made the difference.'),
(3, 'CRT_HEAD2', 'crt2_coverart.png', 'kit_crt2/azure.ogg', 'kit_crt2/boctok.ogg', 'kit_crt2/deja_vu.ogg', 'The slaughterhouse has produced another set of electric screams just for you to consume.'),
(4, 'hellstar plus', 'hellstar_plus.png', 'kit_hellstar.plus/red_raw_against_the_grain.ogg', 'kit_hellstar.plus/heretical_priestess.ogg', 'kit_hellstar.plus/sever.ogg', 'Adjust your heart rate to the beat, and you are guaranteed to see things in slow motion. Use your time gains, practice makes perfect.'),
(5, 'Mute City', 'mutecity1_coverart.png', 'kit_mutecity1/loser_talk.ogg', 'kit_mutecity1/how_to_disassociate_completely.ogg', 'kit_mutecity1/compliance.ogg', 'Mute City is the place you stand, all alone, after beating every one of your brothers. You may think to yourself: \"Where do we go from here?\"... Who said you can\'t do it again?');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `username` varchar(255) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `all_wins` int(11) NOT NULL DEFAULT 0,
  `all_games_played` int(11) NOT NULL DEFAULT 0,
  `kills` int(11) NOT NULL DEFAULT 0,
  `deaths` int(11) NOT NULL DEFAULT 0,
  `music_pack_id` int(11) DEFAULT 1,
  `active_skin_id` int(11) DEFAULT 3
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`username`, `points`, `all_wins`, `all_games_played`, `kills`, `deaths`, `music_pack_id`, `active_skin_id`) VALUES
('admin', 0, 0, 0, 0, 0, NULL, 3),
('batyuzo', 0, 0, 0, 0, 0, NULL, 3),
('girmany', 0, 0, 0, 0, 0, NULL, 3),
('user3', 0, 0, 0, 0, 0, NULL, 3),
('user4', 0, 0, 0, 0, 0, NULL, 3),
('user5', 0, 0, 0, 0, 0, NULL, 3),
('user6', 0, 0, 0, 0, 0, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `player_login`
--

CREATE TABLE `player_login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `player_login`
--

INSERT INTO `player_login` (`username`, `password`, `is_admin`) VALUES
('admin', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 1),
('batyuzo', '2d8555fc6d8b5e60baef404b48647f85773ceda476b9cf970b0c1d31eb49094988cde5a7fba16284e1328ccee855509fa6ed0a5f9aba6e340dd3e2d3c5e62216', 1),
('girmany', '6a8116f0149f7b23d468ef490537a27330e325ac60397ecb41e704e3611f898c26b402637a9e1e626e5f6acadc6711d6bf672f8eea6f6fb48e9897b4cd7d8272', 0),
('user3', '8ac4145c8e388ddfe3cd94886f026260d917cab07903c533f3a26945019bc4a50e6f23f266acbb0cbae89130fa3242c9a5145e4218c3ef1deebccb58d1a64a43', 0),
('user4', '6725c0435c585ea54b0dbba81ae7cad2e56257efd6ab10940ffc3e7adc1274b44379a1c1e8f0e5bd1fe01e3774ffe2b2a53f5f31f7cb091a9fd6be55471457d7', 0),
('user5', '4f796267fa62838c0146d10fae3394877ccdb5197be86f20adcc3b0b844ab913a9530ae6b51f3f117d616899befac104daac2dc302e1e42c11451e8612e042e8', 0),
('user6', '98e0de00aaf6c95eaafcd4e99a1258a06cf2c2465badf0c138e5fd5c462bdd27f37573b830b60a23946cf2e0fb77762c1b1daef9b44ff9dd9ca509a64a4069b5', 0);

-- --------------------------------------------------------

--
-- Table structure for table `player_music_inventory`
--

CREATE TABLE `player_music_inventory` (
  `player_id` varchar(255) NOT NULL,
  `music_pack_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `player_music_inventory`
--

INSERT INTO `player_music_inventory` (`player_id`, `music_pack_id`) VALUES
('admin', 2),
('batyuzo', 2),
('user3', 2),
('user4', 2),
('user5', 2),
('user6', 2);

-- --------------------------------------------------------

--
-- Table structure for table `player_skins`
--

CREATE TABLE `player_skins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_image` varchar(255) NOT NULL,
  `background_image` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `player_skins`
--

INSERT INTO `player_skins` (`id`, `name`, `display_image`, `background_image`, `description`) VALUES
(1, 'bull', 'bull.png', 'bull_bg.png', 'Tormented by visions of the slaughterhouse, the one bull broken free now wields a weapon in one hand, vengeance in the other.'),
(2, 'butcher', 'butcher.png', 'butcher_bg.png', 'Once a surgeon of the flesh, the Butcher now harvests screams, cleaving through flesh with chilling precision. The past, forever stained red.'),
(3, 'knight', 'knight.png', 'knight_bg.png', 'The most common soldier'),
(4, 'entity', 'entity.png', 'entity_bg.png', 'Zero identity, defined only by its boundaries.'),
(5, 'rogue', 'rogue.png', 'rogue_bg.png', 'Beheaded his own master. Imagine what he can do to you...'),
(6, 'samurai', 'samurai.png', 'samurai_bg.png', 'Bound by loyalty, but not by law. Beware!');

-- --------------------------------------------------------

--
-- Table structure for table `player_skin_inventory`
--

CREATE TABLE `player_skin_inventory` (
  `player_id` varchar(255) NOT NULL,
  `skin_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `player_skin_inventory`
--

INSERT INTO `player_skin_inventory` (`player_id`, `skin_id`) VALUES
('admin', 3),
('batyuzo', 3),
('user3', 3),
('user4', 3),
('user5', 3),
('user6', 3);

-- --------------------------------------------------------

--
-- Table structure for table `rarities`
--

CREATE TABLE `rarities` (
  `id` int(11) NOT NULL,
  `rarity` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `rarities`
--

INSERT INTO `rarities` (`id`, `rarity`) VALUES
(1, 'Common'),
(2, 'Rare'),
(3, 'Unique');

-- --------------------------------------------------------

--
-- Table structure for table `weapons`
--

CREATE TABLE `weapons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `damage` int(11) NOT NULL,
  `fire_rate` float NOT NULL,
  `semi_auto` tinyint(1) NOT NULL,
  `rarity_id` int(11) NOT NULL,
  `projectile_speed` float DEFAULT NULL,
  `mag` int(11) DEFAULT NULL,
  `description` text DEFAULT 'A deadly weapon',
  `devinfo` text DEFAULT 'FIRE:'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Dumping data for table `weapons`
--

INSERT INTO `weapons` (`id`, `name`, `file_name`, `damage`, `fire_rate`, `semi_auto`, `rarity_id`, `projectile_speed`, `mag`, `description`, `devinfo`) VALUES
(11, 'Death', 'def_death.png', 100, 1, 1, 3, NULL, NULL, 'A lethal and cool-looking weapon wielded by Death itself', 'FIRE: melee attack\nALTFIRE: take away enemy weapon\nUNEQUIP: default'),
(12, 'Nailgun', 'def_nailgun.png', 20, 3, 2, 2, 0.8, 13, 'Safety instructions would suggest you NOT to pin coworkers to a wall...', 'FIRE: shoot (gravity)\nALTFIRE: -\nUNEQUIP: default'),
(13, 'Cleaver', 'def_cleaver.png', 70, 0.8, 1, 1, 0.4, NULL, 'Chop things up with this very nuanced instrument of destruction. Don\'t cut your finger.', 'FIRE: melee attack\nALTFIRE: -\nUNEQUIP: default'),
(14, 'Chainsaw', 'def_chainsaw.png', 3, 20, 2, 2, NULL, 200, 'Ever heard of Mick Gordon? The Doom Slayer? Hell, maybe?', 'FIRE: rev, damage on\nALTFIRE: -\nUNEQUIP: default'),
(15, 'Taser', 'def_taser.png', 50, 1, 1, 1, NULL, NULL, 'Some crackhead clunker cranked the crap out of this cruel (but previously non-lethal) critter.', 'FIRE: check triggerbox in front of muzzle\nALTFIRE: -\nUNEQUIP: default'),
(16, 'Knife', 'def_knife.png', 50, 1.5, 3, 1, 0.4, NULL, 'If the glove don\'t fit, stop wearing them and continue stabbing', 'FIRE: melee attack\nALTFIRE: throw (gravity)\nUNEQUIP: default'),
(21, 'The Power of Words', 'def_hatespeech.png', 10, 30, 2, 3, 343, 90, 'SPREAD AWARENESS IN A CONE', 'FIRE: check triggerbox in front of muzzle\nALFTIRE: -\nUNEQUIP: default'),
(22, 'Pistol', 'def_pistol.png', 35, 3, 1, 1, 1, 12, '9 millimeters is a LOT.', 'FIRE: shoot particle\nALTFIRE: -\nUNEQUIP: default'),
(23, 'Shotgun', 'def_shotgun.png', 15, 0.75, 1, 2, 0.85, 7, 'If you get the general direction right, you\'ll have no problems with this one', 'FIRE: shoot particles(7)\nALTFIRE: -\nUNEQUIP: default'),
(24, 'Pressure!', 'def_sawedoff.png', 7, 4, 1, 2, 0.85, 2, 'You already massacred a perfectly good metal tube, so everyone knows you have the resolve', 'FIRE: shoot particles(15)\nALTFIRE: -\nUNEQUIP: default'),
(31, 'Wrath of Nobunaga', 'def_musket.png', 400, 1, 1, 3, 0.8, 1, 'The legendary daimyo left you a present. He will smile upon you if you put it to good use!', 'FIRE: shoot particle (3 ricochet, every bounce halves damage)\nALTFIRE: -\nUNEQUIP: default'),
(32, 'Bow', 'def_bow.png', 70, 0.3, 1, 2, 0.6, 1, 'Ranged weapon against pointy sticks, who would win?', 'FIRE: shoot particle (gravity)\nALTFIRE: refill\nUNEQUIP: default'),
(33, 'Kunai', 'def_kunai.png', 40, 1, 1, 1, 0.6, NULL, 'If your arms aren\'t long enough... damn that\'s a straight line...', 'FIRE: melee attack\nALTFIRE: throw\nUNEQUIP: default'),
(34, 'Dagger', 'def_dagger.png', 50, 1.5, 3, 1, NULL, NULL, 'If all else fails...', 'FIRE: melee attack\nALTFIRE: -\nUNEQUIP: default'),
(35, 'Katana', 'def_katana.png', 75, 1, 3, 2, NULL, NULL, 'Craftsmanship and lethality meet in your hands.', 'FIRE: melee attack\nALTFIRE: stab\nUNEQUIP: default'),
(36, 'Kusarigama', 'def_kusarigama.png', 50, 0.6, 3, 1, 0.4, NULL, 'A deadly weapon...', 'FIRE: melee attack\nALTFIRE: throw (gravity)\nUNEQUIP: default'),
(41, 'Sniper', 'def_sniper.png', 20, 1, 0, 3, 10, 5, 'A deadly weapon', 'FIRE:');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `maps`
--
ALTER TABLE `maps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `music_pack_id` (`music_pack_id`);

--
-- Indexes for table `map_weapons`
--
ALTER TABLE `map_weapons`
  ADD PRIMARY KEY (`map_id`,`weapon_id`),
  ADD KEY `weapon_id` (`weapon_id`);

--
-- Indexes for table `music_packs`
--
ALTER TABLE `music_packs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`username`),
  ADD KEY `music_pack_id` (`music_pack_id`),
  ADD KEY `fk_players_player_skins` (`active_skin_id`);

--
-- Indexes for table `player_login`
--
ALTER TABLE `player_login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `player_music_inventory`
--
ALTER TABLE `player_music_inventory`
  ADD PRIMARY KEY (`player_id`,`music_pack_id`),
  ADD KEY `music_pack_id` (`music_pack_id`);

--
-- Indexes for table `player_skins`
--
ALTER TABLE `player_skins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_skin_inventory`
--
ALTER TABLE `player_skin_inventory`
  ADD PRIMARY KEY (`player_id`,`skin_id`),
  ADD KEY `skin_id` (`skin_id`);

--
-- Indexes for table `rarities`
--
ALTER TABLE `rarities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rarity_id` (`rarity_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `maps`
--
ALTER TABLE `maps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `music_packs`
--
ALTER TABLE `music_packs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `player_skins`
--
ALTER TABLE `player_skins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `rarities`
--
ALTER TABLE `rarities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `weapons`
--
ALTER TABLE `weapons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `maps`
--
ALTER TABLE `maps`
  ADD CONSTRAINT `maps_ibfk_1` FOREIGN KEY (`music_pack_id`) REFERENCES `music_packs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `map_weapons`
--
ALTER TABLE `map_weapons`
  ADD CONSTRAINT `map_weapons_ibfk_1` FOREIGN KEY (`map_id`) REFERENCES `maps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `map_weapons_ibfk_2` FOREIGN KEY (`weapon_id`) REFERENCES `weapons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `fk_players_player_skins` FOREIGN KEY (`active_skin_id`) REFERENCES `player_skins` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`music_pack_id`) REFERENCES `music_packs` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `player_login`
--
ALTER TABLE `player_login`
  ADD CONSTRAINT `player_login_ibfk_1` FOREIGN KEY (`username`) REFERENCES `players` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `player_music_inventory`
--
ALTER TABLE `player_music_inventory`
  ADD CONSTRAINT `player_music_inventory_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`username`) ON DELETE CASCADE,
  ADD CONSTRAINT `player_music_inventory_ibfk_2` FOREIGN KEY (`music_pack_id`) REFERENCES `music_packs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `player_skin_inventory`
--
ALTER TABLE `player_skin_inventory`
  ADD CONSTRAINT `player_skin_inventory_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `weapons`
--
ALTER TABLE `weapons`
  ADD CONSTRAINT `weapons_ibfk_1` FOREIGN KEY (`rarity_id`) REFERENCES `rarities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
