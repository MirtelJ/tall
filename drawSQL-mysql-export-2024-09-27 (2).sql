CREATE TABLE `Tervis`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `vaksiin` VARCHAR(255) NOT NULL,
    `ravikuurid` VARCHAR(255) NOT NULL,
    `kuupäev` DATE NOT NULL,
    `hobune` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `Töötaja`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `telefon` VARCHAR(255) NOT NULL
);
CREATE TABLE `Tall`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Tallinr` VARCHAR(255) NOT NULL,
    `asukoht` VARCHAR(255) NOT NULL
);
CREATE TABLE `Varustus`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `väärtus` VARCHAR(255) NOT NULL,
    `tall` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `Hobune`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nimi` VARCHAR(255) NOT NULL,
    `synniaasta` VARCHAR(255) NOT NULL,
    `omanikud` BIGINT UNSIGNED NOT NULL,
    `Tall` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `Treeninggraafik`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `kuupäev` VARCHAR(255) NOT NULL,
    `kellaaeg` VARCHAR(255) NOT NULL,
    `töötaja` BIGINT UNSIGNED NOT NULL,
    `hobune` BIGINT UNSIGNED NOT NULL
);
CREATE TABLE `Omanik`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Aadress` VARCHAR(255) NOT NULL,
    `Telefon` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Treeninggraafik` ADD CONSTRAINT `treeninggraafik_hobune_foreign` FOREIGN KEY(`hobune`) REFERENCES `Hobune`(`id`);
ALTER TABLE
    `Hobune` ADD CONSTRAINT `hobune_tall_foreign` FOREIGN KEY(`Tall`) REFERENCES `Tall`(`id`);
ALTER TABLE
    `Treeninggraafik` ADD CONSTRAINT `treeninggraafik_töötaja_foreign` FOREIGN KEY(`töötaja`) REFERENCES `Töötaja`(`id`);
ALTER TABLE
    `Varustus` ADD CONSTRAINT `varustus_tall_foreign` FOREIGN KEY(`tall`) REFERENCES `Tall`(`id`);
ALTER TABLE
    `Hobune` ADD CONSTRAINT `hobune_omanikud_foreign` FOREIGN KEY(`omanikud`) REFERENCES `Omanik`(`id`);
ALTER TABLE
    `Tervis` ADD CONSTRAINT `tervis_hobune_foreign` FOREIGN KEY(`hobune`) REFERENCES `Hobune`(`id`);