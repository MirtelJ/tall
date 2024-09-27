CREATE TABLE `Tervis`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `vaktsineerimised` VARCHAR(255) NOT NULL,
    `ravikuurid` VARCHAR(255) NOT NULL
);
CREATE TABLE `Töötaja`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `telefon` VARCHAR(255) NOT NULL
);
CREATE TABLE `Tall`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Tallinr` VARCHAR(255) NOT NULL,
    `asukoht` VARCHAR(255) NOT NULL,
    `Varustus` VARCHAR(255) NOT NULL
);
CREATE TABLE `Varustus`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `väärtus` VARCHAR(255) NOT NULL
);
CREATE TABLE `Hobune`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nimi` VARCHAR(255) NOT NULL,
    `synniaasta` VARCHAR(255) NOT NULL,
    `omanikud` VARCHAR(255) NOT NULL,
    `Tall` VARCHAR(255) NOT NULL,
    `treeninggraafik` VARCHAR(255) NOT NULL,
    `Terviseandmed` BIGINT NOT NULL
);
CREATE TABLE `Treeninggraafik`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `kuupäev` VARCHAR(255) NOT NULL,
    `kellaaeg` VARCHAR(255) NOT NULL,
    `töötaja` VARCHAR(255) NOT NULL
);
CREATE TABLE `Omanik`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Aadress` VARCHAR(255) NOT NULL,
    `Telefon` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Hobune` ADD CONSTRAINT `hobune_tall_foreign` FOREIGN KEY(`Tall`) REFERENCES `Tall`(`id`);
ALTER TABLE
    `Treeninggraafik` ADD CONSTRAINT `treeninggraafik_töötaja_foreign` FOREIGN KEY(`töötaja`) REFERENCES `Töötaja`(`id`);
ALTER TABLE
    `Hobune` ADD CONSTRAINT `hobune_treeninggraafik_foreign` FOREIGN KEY(`treeninggraafik`) REFERENCES `Treeninggraafik`(`id`);
ALTER TABLE
    `Hobune` ADD CONSTRAINT `hobune_omanikud_foreign` FOREIGN KEY(`omanikud`) REFERENCES `Omanik`(`id`);
ALTER TABLE
    `Hobune` ADD CONSTRAINT `hobune_terviseandmed_foreign` FOREIGN KEY(`Terviseandmed`) REFERENCES `Tervis`(`id`);
ALTER TABLE
    `Tall` ADD CONSTRAINT `tall_varustus_foreign` FOREIGN KEY(`Varustus`) REFERENCES `Varustus`(`id`);