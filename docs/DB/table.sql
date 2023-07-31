
-- drop database ssap_db;
CREATE DATABASE IF NOT EXISTS ssap_db;
USE ssap_db;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ssap_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ssap_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ssap_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `ssap_db` ;

-- -----------------------------------------------------
-- Table `ssap_db`.`user_state_ns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssap_db`.`user_state_ns` (
  `name` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `ssap_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssap_db`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `bussiness` BIT(1) NOT NULL,
  `image_path` VARCHAR(45) NULL DEFAULT NULL,
  `state_time` TIMESTAMP NULL DEFAULT NULL,
  `state` VARCHAR(10) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_status_ns1_idx` (`state` ASC) VISIBLE,
  CONSTRAINT `fk_user_status_ns1`
    FOREIGN KEY (`state`)
    REFERENCES `ssap_db`.`user_state_ns` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `ssap_db`.`interest_tag_ns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssap_db`.`interest_tag_ns` (
  `name` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `ssap_db`.`interest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssap_db`.`interest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `tag` VARCHAR(6) NOT NULL,
  INDEX `fk_interest_user1_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  INDEX `fk_interest_interest_ns1_idx` (`tag` ASC) VISIBLE,
  CONSTRAINT `fk_interest_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ssap_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_interest_interest_ns1`
    FOREIGN KEY (`tag`)
    REFERENCES `ssap_db`.`interest_tag_ns` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `ssap_db`.`alarm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssap_db`.`alarm` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `notice` BIT(1) NOT NULL DEFAULT 0,
  `time` TIMESTAMP NOT NULL DEFAULT now(),
  `title` VARCHAR(20) NOT NULL,
  `detail` TEXT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_alarm_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_alarm_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ssap_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `ssap_db`.`todo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssap_db`.`todo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `done_flag` BIT(1) NOT NULL DEFAULT 0,
  `objective` VARCHAR(20) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_todo_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_todo_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ssap_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `ssap_db`.`entrance_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssap_db`.`entrance_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `room_title` VARCHAR(45) NOT NULL,
  `enter_time` TIMESTAMP NOT NULL,
  `spend_hour` TIME NOT NULL DEFAULT 0,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_entrance_log_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_entrance_log_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ssap_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `ssap_db`.`report_category_ns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssap_db`.`report_category_ns` (
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `ssap_db`.`report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssap_db`.`report` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `detail` TEXT NOT NULL,
  `target` INT NOT NULL,
  `reporter` INT NOT NULL,
  `category` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_report_report_ns1_idx` (`category` ASC) VISIBLE,
  INDEX `fk_report_user1_idx` (`reporter` ASC) VISIBLE,
  CONSTRAINT `fk_report_report_ns1`
    FOREIGN KEY (`category`)
    REFERENCES `ssap_db`.`report_category_ns` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_user1`
    FOREIGN KEY (`reporter`)
    REFERENCES `ssap_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `ssap_db`.`answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssap_db`.`answer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `detail` TEXT NOT NULL,
  `register_time` TIMESTAMP NOT NULL DEFAULT now(),
  `rating` INT NOT NULL DEFAULT 0,
  `question_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_answer_question1_idx` (`question_id` ASC) VISIBLE,
  INDEX `fk_answer_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_answer_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `ssap_db`.`question` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_answer_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ssap_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `ssap_db`.`question_category_ns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssap_db`.`question_category_ns` (
  `name` VARCHAR(10) NOT NULL,
  `level` TINYINT NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `ssap_db`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ssap_db`.`question` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(20) NOT NULL,
  `detail` TEXT NOT NULL,
  `register_time` TIMESTAMP NOT NULL DEFAULT now(),
  `best_answer` INT NULL,
  `category` VARCHAR(10) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_question_answer1_idx` (`best_answer` ASC) VISIBLE,
  INDEX `fk_question_category_ns1_idx` (`category` ASC) VISIBLE,
  INDEX `fk_question_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_question_answer1`
    FOREIGN KEY (`best_answer`)
    REFERENCES `ssap_db`.`answer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_category_ns1`
    FOREIGN KEY (`category`)
    REFERENCES `ssap_db`.`question_category_ns` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `ssap_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



-- --------------------------
-- ---- namespace insert ----
-- 질문글 카테고리 namespace INSERT
INSERT INTO question_category_ns(name, level)
values 
	('수능',1), ('국어',2), ('수학',2), ('모의고사',2), ('6월 모의고사',3),
    ('개발&프로그래밍',1), ('DB',2), ('JAVA',2), ('PYTHON',2),
    ('알고리즘',2), ('다익스트라 알고리즘',3)
;

-- 관심태그 5종을 위한 namespace INSERT
INSERT INTO interest_tag_ns
VALUES 
	('자습'), ('면접'), ('자격증'), ('IT'), ('공무원'),
    ('독서'), ('자기계발'), ('코딩'), ('과제'), ('교양')
;

-- 유저ID의 상태표현을 위한 namespace INSERT
INSERT INTO user_state_ns
VALUES 
	('')
    ,('deleted')
    ,('banned') 
;

-- 신고 카테고리를 위한 namespace INSERT
INSERT INTO report_category_ns
VALUES
	('욕설')
    ,('음란')
    ,('스터디룸 룰 미준수')
;
-- ns테이블 INSERT 끝
-- -------------------

-- ------------------------
-- 8개 테이블 sample data 생성
-- ------------------------

-- user테이블 sample data
INSERT INTO user(email, nickname, password, bussiness)
VALUES 
	('ssap@no-reply.com', '운영자', 'ssafy', 0)
    ,('eorms96@naver.com', '이대근', 'dleorms', 0)
;

-- interest테이블 sample data
INSERT INTO interest(user_id, tag)
VALUES
	(2,'자습')
    , (2,'면접')
    , (2,'자격증')
    , (2,'IT')
    , (2,'공무원')
;

-- todo테이블 sample data
INSERT INTO todo(done_flag, objective, user_id)
VALUES
	(0,'저녁 먹기 전에 운동하기',2)
    ,(1,'ㅇㅇ책 xx페이지까지',2)
    ,(0,'ㅁㅁ책 xx페이지까지',2)
;

-- report테이블 sample data
INSERT INTO report(detail, target, reporter, category)
VALUES
	('자꾸 개인 화상으로 욕을 합니다.',2,1,'욕설')
;

-- entrance_log테이블 sample data
INSERT INTO entrance_log(room_title, enter_time, spend_hour, user_id)
VALUES
	('개인자습방', now(), hour(2), 2)
    ,('알아서하는방~', date_add(now(), interval 3 hour), hour(3), 2)
;

-- question테이블 sample data
INSERT INTO question(title, detail, register_time, category, user_id)
VALUES
	(
		'제발 도와주세요 ㅜㅜㅜ 고3 수학' -- title
		,'1+2가 왜 3이죠' -- detail
		,now() -- register_time (default)
		,'수능' -- category
		,2 -- user_id
    )
;

-- answer테이블 sample data
INSERT INTO answer(detail, question_id, user_id)
VALUES
	(
		'정답은 3입니다.' -- detail
		,1 -- question_id
		,1 -- user_id
    )
;

-- alarm테이블 sample data
INSERT INTO alarm (notice, title, detail, user_id)
VALUES
	(0, '질문글에 답변이 달렸습니다.', 'do we need datail?', 2)
    ,(1,'홈페이지 점검 안내','~부분 유지보수로 인해 X시부터 Y시까지 홈페이지 사용에 제한이 있을 수 있습니다.', 1) -- 공지사항 알림일 시 수신자를 관리자(user_id=1)로 하고, 수신자가 1일 시 전체 유저에게 보내는 로직 구현하기?
;

select * from user;
select * from question;
select * from answer;
select * from question_category_ns;
select * from interest;

select * from interest_tag_ns;
select * from entrance_log;
select * from alarm;
select * from todo;
select * from report;

select * from report_category_ns;
