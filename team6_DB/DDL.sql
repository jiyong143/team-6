drop database if exists `webcafe`;

create database if not exists `webcafe`;

USE `webcafe`;

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
	`ca_num`	INT	primary key auto_increment,
	`ca_title`	VARCHAR(10)	NOT NULL UNIQUE
);

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
	`bo_num`	INT	primary key auto_increment,
	`bo_title`	VARCHAR(20) 	NOT NULL UNIQUE,
	`bo_ca_num`	INT	NOT NULL
);

--  17:18:55	DROP TABLE IF EXISTS `board`	
-- Error Code: 3730. Cannot drop table 'board' referenced by a foreign key constraint 
-- 'FK_board_TO_file_1' on table 'file'.	0.015 sec
 

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
	`po_num`	INT	primary key auto_increment,
	`po_title`	VARCHAR(30)	NOT NULL,
	`po_content`	TEXT	NOT NULL,
	`po_date`	DATE	NOT NULL,
	`po_views`	INT	NOT NULL default 0,
	`po_bo_num`	INT	NOT NULL,
	`po_me_id`	VARCHAR(8)	NOT NULL
);

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
	`co_num`	INT	primary key auto_increment,
	`co_content`	VARCHAR(500)NOT NULL,
	`co_po_num`	INT	NOT NULL,
	`co_me_id`	VARCHAR(8)	NOT NULL
);

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`me_id`	VARCHAR(8)	primary key,
	`me_birth`	INT	NOT NULL,
	`me_email`	VARCHAR(30)	not NULL,
	`me_phone`	CHAR(11)	not NULL,
	`me_pw`	VARCHAR(14)	NOT NULL,
	`me_address`	VARCHAR(50)	NOT NULL,
	`me_name`	VARCHAR(5)	NOT NULL,
	`me_ms_state`	VARCHAR(10)	NOT NULL,
	`me_authority`	VARCHAR(5)	NOT NULL
);

DROP TABLE IF EXISTS `memberState`;

CREATE TABLE `memberState` (
	`ms_state`	VARCHAR(10)	primary key
);

ALTER TABLE `board` ADD CONSTRAINT `FK_category_TO_board_1` FOREIGN KEY (
	`bo_ca_num`
)
REFERENCES `category` (
	`ca_num`
);

ALTER TABLE `post` ADD CONSTRAINT `FK_board_TO_post_1` FOREIGN KEY (
	`po_bo_num`
)
REFERENCES `board` (
	`bo_num`
);

ALTER TABLE `post` ADD CONSTRAINT `FK_member_TO_post_1` FOREIGN KEY (
	`po_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_post_TO_comment_1` FOREIGN KEY (
	`co_po_num`
)
REFERENCES `post` (
	`po_num`
);

ALTER TABLE `comment` ADD CONSTRAINT `FK_member_TO_comment_1` FOREIGN KEY (
	`co_me_id`
)
REFERENCES `member` (
	`me_id`
);

ALTER TABLE `member` ADD CONSTRAINT `FK_memberState_TO_member_1` FOREIGN KEY (
	`me_ms_state`
)
REFERENCES `memberState` (
	`ms_state`
);