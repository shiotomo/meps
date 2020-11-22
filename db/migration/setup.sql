CREATE DATABASE  IF NOT EXISTS meps;
use meps;
CREATE TABLE IF NOT EXISTS `access_log` (
    `id` BIGINT AUTO_INCREMENT,
    `caused_at` VARCHAR(256),
    `level` VARCHAR(256),
    `log` VARCHAR(256),
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);
CREATE TABLE IF NOT EXISTS `minecraft_log` (
    `id` BIGINT AUTO_INCREMENT,
    `caused_at` VARCHAR(256),
    `level` VARCHAR(256),
    `log` VARCHAR(256),
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);
