--
-- Table structure for table `prefix_anticipate`
--

CREATE TABLE IF NOT EXISTS `prefix_tw` (
	`tw_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`tw_date_start` datetime NOT NULL,
	`tw_date_end` datetime NOT NULL,
	`tw_title` varchar(255) NOT NULL DEFAULT '',
	`tw_text` text NOT NULL DEFAULT '',
	`tw_include` varchar(255) NOT NULL DEFAULT '*',
	`tw_exclude` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`tw_id`),
	KEY `tw_title` (`tw_title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------