USE Breaking_Bad;
SET FOREIGN_KEY_CHECKS = 0;

-- ---------------------
-- Characters Table --
-- ---------------------
DROP TABLE IF EXISTS `Characters`;
CREATE TABLE `Characters`(
    `character_id` int(4) NOT NULL PRIMARY KEY, -- Make this auto_increment instead
    `name` varchar(50) NOT NULL,
    `cast_ssn` int(4) NOT NULL,
    `status` varchar(7) NOT NULL, -- Need to make trigger before insert to check if value in (dead, alive, unknown) 
    `role` varchar(20) NOT NULL,
    `alias` varchar(20),

    CONSTRAINT FK_cast_ssn FOREIGN KEY (`cast_ssn`) REFERENCES `Cast` (`ssn`)
);

-- ---------------------
-- Init 'Characters' --
-- ---------------------

BEGIN;

INSERT INTO `Characters` VALUES (1111, 'Walter White', 9999, 'DEAD', 'Meth Kingpin', 'Heisenberg');

COMMIT;

-- ---------------------
-- Cast Table --
-- ---------------------
DROP TABLE IF EXISTS `Cast`;
CREATE TABLE `Cast`(
    `ssn` int(4) NOT NULL PRIMARY KEY, -- Make this auto_increment instead
    `name` varchar(50) NOT NULL,
    `character_id` int(4) NOT NULL,

    CONSTRAINT FK_character_id FOREIGN KEY (`character_id`) REFERENCES `Characters` (`character_id`)
);

BEGIN;

INSERT INTO `Cast` VALUES (9999, 'Bryan Cranston', 1111);

COMMIT;

-- ---------------------
-- Seasons Table --
-- ---------------------
DROP TABLE IF EXISTS `Seasons`;
CREATE TABLE `Seasons`(
    `season_no` int(1) NOT NULL PRIMARY KEY, -- Make this auto_increment instead
    `start_date` date NOT NULL,
    `end_date` date NOT NULL,
    `episodes` int(2) NOT NULL
);

-- ---------------------
-- Init 'Seasons' --
-- ---------------------
BEGIN;

INSERT INTO `Seasons` VALUES (1, '2008-01-20', '2008-03-09', 7);
INSERT INTO `Seasons` VALUES (2, '2009-03-08', '2009-05-31', 13);
INSERT INTO `Seasons` VALUES (3, '2010-03-21', '2010-06-13', 13);
INSERT INTO `Seasons` VALUES (4, '2011-07-17', '2011-10-09', 13);
INSERT INTO `Seasons` VALUES (5, '2012-07-15', '2013-09-29', 16);

COMMIT;