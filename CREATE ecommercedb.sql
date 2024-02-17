CREATE TABLE IF NOT EXISTS `ecommercedb`.`backup_config` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `backup_path` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;
