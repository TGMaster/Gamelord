<<<<<<< HEAD
=======
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
>>>>>>> f7eaa6e4508af656ca42478b99102fd1554a56cc
-- --------------------------------------------------------
-- ----------------------------
-- Table structure for category
-- ----------------------------
CREATE TABLE IF NOT EXISTS `category`(
	`category_id` BIGINT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`category_name` VARCHAR(128) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;
-- ----------------------------
-- Table structure for news
-- ----------------------------
CREATE TABLE IF NOT EXISTS `news`(
    `news_id` BIGINT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category_id` BIGINT(10) DEFAULT NULL,
    `news_title` VARCHAR(128) NOT NULL,
    `news_content` LONGTEXT NOT NULL,
    `news_date` DATE NOT NULL,
    `news_image` VARCHAR(64) NOT NULL,
	FOREIGN KEY (category_id) REFERENCES category(category_id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 AUTO_INCREMENT = 1;
-- --------------------------------------------------------
-- ----------------------------
-- Table structure for product
-- ----------------------------
CREATE TABLE IF NOT EXISTS `product`(
	`product_id` BIGINT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`category_id` BIGINT(10) DEFAULT NULL,
	`product_name` VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
	`product_image` VARCHAR(64) COLLATE utf8_unicode_ci NOT NULL,
	`product_price` DOUBLE NOT NULL,
	`product_content` LONGTEXT COLLATE utf8_unicode_ci NOT NULL,
	FOREIGN KEY (category_id) REFERENCES category(category_id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
-- --------------------------------------------------------
-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE IF NOT EXISTS `users`(
	`user_id` BIGINT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`user_email` VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
	`user_pass` VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
	`user_admin` TINYINT(1) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;
-- ----------------------------
