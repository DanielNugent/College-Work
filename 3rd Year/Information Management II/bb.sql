USE Breaking_Bad;
SET FOREIGN_KEY_CHECKS = 0;

-- ---------------------
-- Characters Table --
-- ---------------------
DROP TABLE IF EXISTS `Characters`;
CREATE TABLE `Characters`(
    `character_id` int(4) NOT NULL PRIMARY KEY AUTO_INCREMENT, -- Make this auto_increment instead
    `name` varchar(50) NOT NULL,
    `cast_ssn` int(4) NOT NULL,
    `alias` varchar(20),
    `status` varchar(7) NOT NULL, -- Need to make trigger before insert to check if value in (dead, alive, unknown) 

    CONSTRAINT FK_cast_ssn FOREIGN KEY (`cast_ssn`) REFERENCES `Cast` (`cast_ssn`)
);

-- ---------------------
-- Init 'Characters' --
-- ---------------------

BEGIN;

ALTER TABLE `Characters` AUTO_INCREMENT=2130;

INSERT INTO `Characters` (`name`, `cast_ssn`, `alias`, `status`)
VALUES 
    ('Walter White', 3472, 'Heisenberg', 'DEAD');

COMMIT;

-- ---------------------
-- Cast Table --
-- ---------------------
DROP TABLE IF EXISTS `Cast`;
CREATE TABLE `Cast`(
    `cast_ssn` int(4) NOT NULL PRIMARY KEY AUTO_INCREMENT, -- Make this auto_increment instead
    `name` varchar(50) NOT NULL,
    `first_appearance` int NOT NULL,

    CONSTRAINT FK_appearance_id FOREIGN KEY (`first_appearance`) REFERENCES `Episodes` (`episode_id`)
);

BEGIN;

ALTER TABLE `Cast` AUTO_INCREMENT=3472;

INSERT INTO `Cast` (`name`, `first_appearance`)
VALUES 
    ('Bryan Cranston', 11);

COMMIT;


-- ---------------------
-- Episodes Table --
-- ---------------------
DROP TABLE IF EXISTS `Episodes`;
CREATE TABLE `Episodes`(
    `episode_id` int(2) NOT NULL PRIMARY KEY,
    `season` int(1) NOT NULL,
    `mins_long` int(2) NOT NULL,
    `air_date` DATE NOT NULL,
    `written_by` int(4) NOT NULL,

    CONSTRAINT FK_season_id FOREIGN KEY (`season`) REFERENCES `Seasons` (`season_no`),
    CONSTRAINT FK_writer_id FOREIGN KEY (`written_by`) REFERENCES `Writers` (`writer_ssn`)

);

-- ---------------------
-- Init 'Episodes' --
-- ---------------------

BEGIN;

INSERT INTO `Episodes`
VALUES 
    (11, 1, 54, '2008-01-20', 4361);



COMMIT;

-- ---------------------
-- Seasons Table --
-- ---------------------
DROP TABLE IF EXISTS `Seasons`;
CREATE TABLE `Seasons`(
    `season_no` int(1) NOT NULL PRIMARY KEY AUTO_INCREMENT, -- Make this auto_increment instead
    `start_date` date NOT NULL,
    `end_date` date NOT NULL,
    `episodes` int(2) NOT NULL
);

-- ---------------------
-- Init 'Seasons' --
-- ---------------------
BEGIN;


INSERT INTO `Seasons` (`start_date`, `end_date`, `episodes`)
VALUES 
    ('2008-01-20', '2008-03-09', 7),
    ('2009-03-08', '2009-05-31', 13),
    ('2010-03-21', '2010-06-13', 13),
    ('2011-07-17', '2011-10-09', 13),
    ('2012-07-15', '2013-09-29', 16);

COMMIT;

-- ---------------------
-- Writers Table --
-- ---------------------
DROP TABLE IF EXISTS `Writers`;
CREATE TABLE `Writers`(
    `writer_ssn` int(4) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` varchar(20) NOT NULL -- trigger to check if writer is part of writers list
);

-- ---------------------
-- Init 'Writers' --
-- ---------------------
BEGIN;

ALTER TABLE `Writers` AUTO_INCREMENT=4361;

INSERT INTO `Writers` (`name`) 
VALUES 
    ('Vince Gilligan');

COMMIT;


-- ---------------------
-- Locations Table --
-- ---------------------
DROP TABLE IF EXISTS `Locations`;
CREATE TABLE `Locations`(
    `location_id` int(6) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `location` varchar(50) NOT NULL,
    `type` varchar(20) NOT NULL
);


-- ---------------------
-- Init 'Locations' --
-- ---------------------
BEGIN;

ALTER TABLE `Locations` AUTO_INCREMENT=770421;

COMMIT;

DROP TABLE IF EXISTS `Groups`;
CREATE TABLE `Groups`(
    `group_name` varchar(20) NOT NULL PRIMARY KEY,
    `operates_in` int(4) NOT NULL,
    `rival` varchar(20),

    CONSTRAINT FK_location_id FOREIGN KEY (`operates_in`) REFERENCES `Locations` (`location_id`)

);