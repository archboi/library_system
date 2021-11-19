CREATE TABLE `Vypozicanie knihy` (
	`id_knihy` INT NOT NULL,
	`id_zakaznika` INT NOT NULL,
	`datum_vypozicania` DATE NOT NULL,
	`datum_vratenia` DATE NOT NULL
);

CREATE TABLE `Poskodenie` (
	`poskodenie` VARCHAR(255) NOT NULL,
	`id_kniha` INT NOT NULL,
	`id_zakaznik` INT NOT NULL
);

CREATE TABLE `osoba` (
	`meno` varchar(255) NOT NULL,
	`priezvisko` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`type` varchar(255) NOT NULL,
	`tel_cislo` INT(255) NOT NULL
);

CREATE TABLE `kniha` (
	`id_kniha` INT NOT NULL AUTO_INCREMENT,
	`id_template` INT NOT NULL,
	`branch` VARCHAR(255) NOT NULL,
	`umiestnenie_knihy` VARCHAR(255) NOT NULL,
	`dostupnost` BOOLEAN NOT NULL,
	PRIMARY KEY (`id_kniha`)
);

CREATE TABLE `kniha_template` (
	`id_template` INT NOT NULL AUTO_INCREMENT,
	`nazov` VARCHAR(255) NOT NULL,
	`autor` VARCHAR(255) NOT NULL,
	`rok_vydania` DATE NOT NULL,
	`vydavatelsvo` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id_template`)
);

CREATE TABLE `Librarian` (
	`id Librarian` INT NOT NULL AUTO_INCREMENT,
	`type` INT NOT NULL,
	`branch` VARCHAR(255) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id Librarian`)
);

CREATE TABLE `zakaznik` (
	`id_zakaznik` INT NOT NULL AUTO_INCREMENT,
	`type` INT NOT NULL,
	PRIMARY KEY (`id_zakaznik`)
);

ALTER TABLE `Vypozicanie knihy` ADD CONSTRAINT `Vypozicanie knihy_fk0` FOREIGN KEY (`id_knihy`) REFERENCES `kniha`(`id_kniha`);

ALTER TABLE `Vypozicanie knihy` ADD CONSTRAINT `Vypozicanie knihy_fk1` FOREIGN KEY (`id_zakaznika`) REFERENCES `zakaznik`(`id_zakaznik`);

ALTER TABLE `Poskodenie` ADD CONSTRAINT `Poskodenie_fk0` FOREIGN KEY (`id_kniha`) REFERENCES `kniha`(`id_kniha`);

ALTER TABLE `Poskodenie` ADD CONSTRAINT `Poskodenie_fk1` FOREIGN KEY (`id_zakaznik`) REFERENCES `zakaznik`(`id_zakaznik`);

ALTER TABLE `kniha` ADD CONSTRAINT `kniha_fk0` FOREIGN KEY (`id_template`) REFERENCES `kniha_template`(`id_template`);

ALTER TABLE `Librarian` ADD CONSTRAINT `Librarian_fk0` FOREIGN KEY (`type`) REFERENCES `osoba`(`type`);

ALTER TABLE `zakaznik` ADD CONSTRAINT `zakaznik_fk0` FOREIGN KEY (`type`) REFERENCES `osoba`(`type`);








