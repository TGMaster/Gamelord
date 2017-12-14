-- ----------------------------
-- Table structure for news
-- ----------------------------

CREATE TABLE IF NOT EXISTS `news` (
  `news_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(128) NOT NULL,
  `news_content` longtext NOT NULL,
  `news_date` date NOT NULL,
  `news_image` varchar(64) NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(128) NOT NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(11) default NULL,
  `product_name` varchar(255) collate utf8_unicode_ci default NULL,
  `product_image` varchar(64) collate utf8_unicode_ci default NULL,
  `product_price` double default NULL,
  `product_description` longtext collate utf8_unicode_ci,
  PRIMARY KEY  (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) collate utf8_unicode_ci default NULL,
  `user_pass` varchar(255) collate utf8_unicode_ci default NULL,
  `user_role` bit(1) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------

