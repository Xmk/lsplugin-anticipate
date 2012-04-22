--
-- Table structure for table `prefix_anticipate`
--

CREATE TABLE IF NOT EXISTS `prefix_anticipate` (
	`anticipate_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`anticipate_date_start` datetime NOT NULL,
	`anticipate_date_end` datetime NOT NULL,
	`anticipate_percent` int(3) DEFAULT '0',
	`anticipate_title` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
	`anticipate_text` text NOT NULL DEFAULT '',
	PRIMARY KEY (`anticipate_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------