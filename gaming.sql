-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th1 10, 2018 lúc 04:32 PM
-- Phiên bản máy phục vụ: 5.7.19
-- Phiên bản PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `gaming`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `bill_id` bigint(10) NOT NULL,
  `user_id` bigint(10) NOT NULL,
  `bill_date` timestamp NOT NULL,
  `bill_payment` varchar(16) NOT NULL,
  `bill_adress` varchar(255) NOT NULL,
  `bill_total` double NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetail`
--

DROP TABLE IF EXISTS `billdetail`;
CREATE TABLE IF NOT EXISTS `billdetail` (
  `bd_id` bigint(10) NOT NULL,
  `bill_id` bigint(10) NOT NULL,
  `product_id` bigint(10) NOT NULL,
  `bd_price` double NOT NULL,
  `bd_quantity` int(11) NOT NULL,
  PRIMARY KEY (`bd_id`),
  KEY `product_id` (`product_id`),
  KEY `bill_id` (`bill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(128) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(0, 'All genres'),
(1, 'Action'),
(2, 'Adventure'),
(3, 'Cards'),
(4, 'Multiplayer'),
(5, 'Racing'),
(6, 'Sports'),
(7, 'Strategy'),
(8, 'Stimulation');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `news_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(10) DEFAULT NULL,
  `news_title` varchar(128) NOT NULL,
  `news_content` longtext NOT NULL,
  `news_date` date NOT NULL,
  `news_image` varchar(64) NOT NULL,
  PRIMARY KEY (`news_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`news_id`, `category_id`, `news_title`, `news_content`, `news_date`, `news_image`) VALUES
(1, 2, 'Daily Deal - Cat Quest, 20% Off', 'Today\'s Deal: Save 20% on Cat Quest!\r\n<br>Look for the deals each day on the front page of Steam. Or follow us on twitter or Facebook for instant notifications wherever you are!\r\n', '2018-01-05', 'img/news/catquest.jpg'),
(2, 1, 'Daily Deal - Armello, 50% Off', 'Today\'s Deal: Save 50% on Armello!\r\n<br>Look for the deals each day on the front page of Steam. Or follow us on twitter or Facebook for instant notifications wherever you are!', '2018-01-05', 'img/news/devilmaycry.jpg'),
(3, 4, 'Now Available on Steam - Bridge Constructor Portal', 'Bridge Constructor Portal is Now Available on Steam!\r\n<br>Enter the Aperture Science Enrichment Center and experience Bridge Constructor Portal - the unique merging of the classic Portal&trade; and Bridge Constructor&trade; games.', '2018-01-05', 'img/news/tomclancy.jpg'),
(4, 1, 'Daily Deal - Cat Quest, 20% Off', 'Today&#39;s Deal: Save 20% on Cat Quest!\r<br>Look for the deals each day on the front page of Steam. Or follow us on twitter or Facebook for instant notifications wherever you are! ', '2018-01-06', 'img/news/risingstorm.jpg'),
(5, 7, 'Now Available on Steam - Bridge Constructor Portal', 'Bridge Constructor Portal is Now Available on Steam!\r<br>\r<br>Enter the Aperture Science Enrichment Center and experience Bridge Constructor Portal &acirc;&#128;&#147; the unique merging of the classic Portal&acirc;&#132;&cent; and Bridge Constructor&acirc;&#132;&cent; games.', '2018-01-06', 'img/news/catquest.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(10) DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_image` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `product_price` double NOT NULL,
  `product_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `product_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`product_id`, `category_id`, `product_name`, `product_image`, `product_price`, `product_content`, `product_key`) VALUES
(1, 1, 'Mafia', 'mafia.jpg', 2, 'Play the role of Tommy, a man unhappy with his job as a driver in the Mafia. You control Tommy through the streets of 1930\'s American city, complete with simulated traffic and authentic buildings. Unwillingly accept assignments such as mob hits, car chases, bootlegging, shootouts, assassinations and bank robberies. Drive over 60 cars based on real models from the 30\'s. Choose from over 12 weapons ranging from baseball bats to the Tommy gun, to deal with those that dare to cross your path. In the Mafia, there\'s never a dull moment.', ''),
(2, 1, 'Tomb Rider', 'tomb.jpg', 3, 'Lara uncovers an ancient mystery that places her in the cross-hairs of a ruthless organization known as Trinity. As she races to find the secret before Trinity, the trail leads to a myth about the Lost City of Kitezh. Lara knows she must reach the Lost City and its hidden secrets before Trinity. With that, she sets out for Siberia on her first Tomb Raiding expedition.', ''),
(3, 1, 'Diablo 3', 'Diablo3.jpg', 4, 'This Ultimate Evil Edition contains both Diablo III and the Reaper of Souls expansion set, together in one definitive volume. Rise as one of humanity\'s last defenders - crusader, barbarian, witch doctor, demon hunter, monk, or wizard - and collect legendary loot while mastering devastating new powers and abilities. Play solo or form a party of up to four other heroes, either with local players together on the same screen or online. Lay waste to hordes of evil throughout all five acts of the Diablo III storyline, or explore the open world in Adventure Mode to hunt bounties on the elder evils that lurk throughout the mortal realms. This download contains the full game.', ''),
(4, 1, 'crysis', 'crysis.jpg', 5, 'The Games on Demand version supports English, French, Italian, German, Spanish, Czech, Russian, Japanese. Earth, 2019. A team of US scientists makes a frightening discovery on an island in the South China Sea. All contact with the team is lost when the North Korean Government quickly seals off the area. The United States responds by dispatching an elite team of Delta Force Operators to recon the situation.', ''),
(5, 1, 'DarkSoul', 'darksoul.jpg', 7, 'The Games on Demand version supports English, French, Spanish. Dark Souls is an action RPG (role playing game) set in a rich, dark fantasy universe. Tense dungeon crawling, fearsome enemy encounters and groundbreaking online features combine for a truly unique RPG experience. Dark Souls breaks down barriers with a seamless world design that encourages exploration and fosters an adaptable gameplay experience. The unerring foundation of challenge and reward will engulf you and offer an unparalleled sense of achievement.', ''),
(6, 1, 'Dynasit Warrior 8', 'dynasit.jpg', 1, 'DYNASTY WARRIORS 8 Empires is the latest installment of the \"Empires\" series, in which you aim to conquer ancient China using both strategy and the one warrior versus one thousand tactical action the WARRIORS series is known for\r\nThe player becomes a hero from Three Kingdoms era, with the goal of unifying all of ancient China under their rule via strategy and battles!\r\nYou can also import save data from Free Alliances Version into DYNASTY WARRIORS 8 Empires!', ''),
(7, 1, 'Evil Within', 'evil.jpg', 6, 'Developed by Shinji Mikami and the talented team at Tango Gameworks, The Evil Within embodies the meaning of pure survival horror. Highly-crafted environments, horrifying anxiety, and an intricate story are combined to create an immersive world that will bring you to the height of tension. With limited resources at your disposal, you’ll fight for survival and experience profound fear in this perfect blend of horror and action.', ''),
(8, 1, 'Hitman', 'hitman.jpg', 3, 'Play the beginning of HITMAN for free and become the master assassin. The first location in the game is a secret training facility, where players step into the shoes of Agent 47 for the very first time and must learn what it takes to become an agent for the International Contract Agency.\r\n\r\nAnyone who downloads the game for free will have full access to everything included in the ICA Facility location; ', ''),
(9, 2, 'Payday 2', 'payday.jpg', 7, 'PAYDAY is an action-packed, four-player co-op shooter where you rob banks and get paid.\r\nThe Crimewave edition includes an enhanced graphic engine. Up to four friends co-operate on the hits and as the crew progresses the jobs become bigger, better and more rewarding. Along with earning more money and becoming a legendary criminal Crime does pay – use your funds to customize your character with new skillsets that change the way you play and kit them out with their own guns and gear. Rebuilt visuals bring heisting into 1080p resolution. See every bank note fly and Feel every bullet blast past your head in full HD .', ''),
(10, 2, 'Pes 2016', 'pes.jpg', 3, 'PES barged itself back into the discussion last year, standing shoulder-to-shoulder with FIFA as a genuine contender for the year’s best footie game. Konami delivered a huge overhaul that delighted long-standing fans who waited years for the series’ return to form. PES 2018 continues the developers push to win back fans, but sadly offers small steps rather than giant leaps in gameplay. As a result, while the football on the pitch is sublime, elements off it remain in dire need of fixing.', ''),
(11, 2, 'Fuse', 'fuse.jpg', 4, 'Fuse is a four-player cooperative third-person shooter video game developed by Insomniac Games and published by Electronic Arts for PlayStation 3 and Xbox 360. The game was announced as Overstrike before it was rebranded in August 2012. It was released on May 28, 2013 in North America, May 30, 2013 in Australia and on May 31, 2013 in Europe. Fuse was both a critical and commercial failure for Electronic Arts.', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_dob` date DEFAULT NULL,
  `user_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_pass`, `user_email`, `user_dob`, `user_address`, `user_image`, `user_admin`) VALUES
(1, 'admin', '$2a$10$9aNugE0QUJlFoLdz526pA.2f3POh6WU.ouj9a8kxZNzRq3IAGbP1u', 'tgmaster94@gmail.com', '2018-01-10', '11 Thong Nhat', 'admin.png', 1);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Các ràng buộc cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD CONSTRAINT `billdetail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `billdetail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `billdetail_ibfk_3` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`);

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
