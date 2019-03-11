CREATE TABLE `curator_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_name` VARCHAR(64) NOT NULL,
  `language_author` VARCHAR(64) NOT NULL,
  `language_description` VARCHAR(64) NOT NULL,
  'language_words' VARCHAR(64) NOT NULL,
  'language_default_rule' VARCHAR(64) NOT NULL,
  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=LATIN1;