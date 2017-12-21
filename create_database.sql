-- ----------------------------
    -- Table structure for news
    -- ----------------------------
    CREATE TABLE IF NOT EXISTS `news`(
    	`news_id` BIGINT(11) NOT NULL AUTO_INCREMENT,
    	`product_id` BIGINT(20) DEFAULT NULL,
    	`news_title` VARCHAR(128) NOT NULL,
    	`news_content` LONGTEXT NOT NULL,
    	`news_date` DATE NOT NULL,
    	`news_image` VARCHAR(64) NOT NULL,
    	PRIMARY KEY(`news_id`),
	FOREIGN KEY (product_id) REFERENCES product(product_id)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;
-- --------------------------------------------------------
-- ----------------------------
-- Table structure for category
-- ----------------------------
CREATE TABLE IF NOT EXISTS `category`(
	`category_id` BIGINT(11) NOT NULL AUTO_INCREMENT,
	`category_name` VARCHAR(128) NOT NULL,
	PRIMARY KEY(`category_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;
-- --------------------------------------------------------
-- ----------------------------
-- Table structure for product
-- ----------------------------
CREATE TABLE IF NOT EXISTS `product`(
	`product_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`category_id` BIGINT(11) DEFAULT NULL,
	`product_name` VARCHAR(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`product_image` VARCHAR(64) COLLATE utf8_unicode_ci DEFAULT NULL,
	`product_price` DOUBLE DEFAULT NULL,
	`product_description` LONGTEXT COLLATE utf8_unicode_ci,
	`product_discount` BIGINT(11) DEFAULT NULL,
	PRIMARY KEY(`product_id`),
	FOREIGN KEY (category_id) REFERENCES category(category_id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
-- --------------------------------------------------------
-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE IF NOT EXISTS `users`(
	`user_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`user_email` VARCHAR(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`user_pass` VARCHAR(255) COLLATE utf8_unicode_ci DEFAULT NULL,
	`user_role` BIT(1) DEFAULT NULL,
	PRIMARY KEY(`user_id`)
) ENGINE = MyISAM DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
-- ----------------------------
