CREATE DATABASE msns;
use msns;
CREATE TABLE IF NOT EXISTS `operation_log` (
    `id` BIGINT AUTO_INCREMENT,
    `caused_at` VARCHAR(256),
    `level` VARCHAR(256),
    `log` VARCHAR(256),
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
);