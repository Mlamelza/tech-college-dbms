/*First we create our database, and then choose the database so we can work with it*/
DROP DATABASE IF EXISTS college;
CREATE DATABASE college;
USE college;

/*Here we will create our database tables and define the column data types*/
CREATE TABLE building
( 
  db_building_id        INT            PRIMARY KEY    AUTO_INCREMENT,
  db_building_name      VARCHAR(10)    NOT NULL    
);

CREATE TABLE location
(
  db_location_id        INT            PRIMARY KEY    AUTO_INCREMENT,
  db_location_name      VARCHAR(40)    NOT NULL
);


CREATE TABLE campus
(
  db_campus_id              INT             PRIMARY KEY   	AUTO_INCREMENT,
  db_campus_name            VARCHAR(40)     NOT NULL,    
  db_location_id            INT             NOT NULL,
  db_campus_abbreviation    VARCHAR(10)     NOT NULL,
  CONSTRAINT campus_fk_location
    FOREIGN KEY (db_location_id) REFERENCES location (db_location_id)
);

CREATE TABLE class_attribute
(
  db_class_attribute_id        INT             PRIMARY KEY    AUTO_INCREMENT,
  db_class_attribute_name      VARCHAR(30)     NOT NULL  
);

CREATE TABLE section_type
(
  db_section_type_id              INT             PRIMARY KEY    AUTO_INCREMENT,
  db_section_type_name            VARCHAR(30)     NOT NULL,
  db_section_type_abbreviation    VARCHAR(10)     NOT NULL      UNIQUE
);

CREATE TABLE section
(
  db_section_id              INT             PRIMARY KEY     AUTO_INCREMENT,
  db_section_name            VARCHAR(20)     NOT NULL,    
  db_section_type_id         INT             NOT NULL,
  CONSTRAINT section_fk_section_type
    FOREIGN KEY (db_section_type_id) REFERENCES section_type (db_section_type_id)
);

CREATE TABLE permission
(
  db_permission_id              INT             PRIMARY KEY    AUTO_INCREMENT,
  db_permission_name            VARCHAR(20)     NOT NULL,
  db_permission_description     VARCHAR(50)     NOT NULL
);

CREATE TABLE status
(
  db_status_id              INT             PRIMARY KEY    AUTO_INCREMENT,
  db_status_name            VARCHAR(20)     NOT NULL,
  db_status_abbreviation    VARCHAR(7)      NOT NULL      UNIQUE
);

CREATE TABLE term
(
  db_term_id            INT             PRIMARY KEY    AUTO_INCREMENT,
  db_term_name          VARCHAR(50)     NOT NULL,
  db_term_start_date    DATE            NOT NULL,
  db_term_end_date      DATE            NOT NULL
);

ALTER TABLE term
	MODIFY db_term_start_date	DATE	NULL;
    
ALTER TABLE term
	MODIFY db_term_end_date	DATE	NULL;

CREATE TABLE title
(
  db_title_id              INT             PRIMARY KEY     AUTO_INCREMENT,
  db_title_name            VARCHAR(30)     NOT NULL,    
  db_permission_id         INT             NOT NULL,
  CONSTRAINT title_fk_permission
    FOREIGN KEY (db_permission_id) REFERENCES permission (db_permission_id)
);

CREATE TABLE day
(
  db_day_id              INT             PRIMARY KEY    AUTO_INCREMENT,
  db_day_name            VARCHAR(75)     NOT NULL,
  db_day_abbreviation    VARCHAR(10)     NOT NULL      UNIQUE
);

CREATE TABLE department_type
(
  db_department_type_id              INT             PRIMARY KEY    AUTO_INCREMENT,
  db_department_type_name            VARCHAR(30)     NOT NULL
);

CREATE TABLE department
(
  db_department_id              INT             PRIMARY KEY     AUTO_INCREMENT,
  db_department_name            VARCHAR(50)     NOT NULL,    
  db_department_type_id         INT             NOT NULL,
  CONSTRAINT department_fk_department_type
    FOREIGN KEY (db_department_type_id) REFERENCES department_type (db_department_type_id),
  db_department_abbreviation    VARCHAR(6)     NOT NULL         UNIQUE
);

CREATE TABLE course
(
  db_course_id              INT             PRIMARY KEY     AUTO_INCREMENT,
  db_course_name            VARCHAR(100)    NOT NULL,    
  db_course_number          VARCHAR(10)     NOT NULL,  
  db_department_id          INT             NOT NULL,
  CONSTRAINT course_fk_department
    FOREIGN KEY (db_department_id) REFERENCES department (db_department_id),
  db_course_credit          INT             NOT NULL         
);

CREATE TABLE user
(
  db_user_id              INT            PRIMARY KEY     AUTO_INCREMENT,
  db_user_first_name      VARCHAR(50)    NOT NULL,
  db_user_last_name       VARCHAR(50)    NOT NULL,
  db_user_email           VARCHAR(30),
  db_user_home_phone      VARCHAR(13),
  db_user_cell_phone      VARCHAR(13),
  db_user_address1        VARCHAR(40),
  db_user_address2        VARCHAR(40),
  db_user_city            VARCHAR(20),
  db_user_state           VARCHAR(2),
  db_user_zip             VARCHAR(10),
  db_user_start_date      DATE,
  db_campus_id            INT             NOT NULL,
  CONSTRAINT user_fk_campus
    FOREIGN KEY (db_campus_id) REFERENCES campus (db_campus_id),
  db_status_id            INT             NOT NULL,
  CONSTRAINT user_fk_status
    FOREIGN KEY (db_status_id) REFERENCES status (db_status_id),
  db_department_id        INT             NOT NULL,
  CONSTRAINT user_fk_department
    FOREIGN KEY (db_department_id) REFERENCES department (db_department_id),
  db_title_id             INT             NOT NULL,
  CONSTRAINT user_fk_title
    FOREIGN KEY (db_title_id) REFERENCES title (db_title_id)       
);

CREATE TABLE class
(
  db_class_id                   INT            PRIMARY KEY     AUTO_INCREMENT,
  db_status_id                  INT            NOT NULL,
  CONSTRAINT class_fk_status
    FOREIGN KEY (db_status_id) REFERENCES status (db_status_id),
  db_class_reference_number     VARCHAR(10)    NOT NULL,
  db_department_id              INT            NOT NULL,
  CONSTRAINT class_fk_department
    FOREIGN KEY (db_department_id) REFERENCES department (db_department_id),
  db_course_id                  INT            NOT NULL,
  CONSTRAINT class_fk_course
    FOREIGN KEY (db_course_id) REFERENCES course (db_course_id),
  db_section_id                 INT            NOT NULL,
  CONSTRAINT class_fk_section
    FOREIGN KEY (db_section_id) REFERENCES section (db_section_id),
  db_campus_id                  INT            NOT NULL,
  CONSTRAINT class_fk_campus
    FOREIGN KEY (db_campus_id) REFERENCES campus (db_campus_id),
  db_day_id                     INT            NOT NULL,
  CONSTRAINT class_fk_day
    FOREIGN KEY (db_day_id) REFERENCES day (db_day_id),  
  db_class_time_start           TIME,
  db_class_time_ends            TIME,
  db_user_id                    INT            NOT NULL,
  CONSTRAINT class_fk_user
    FOREIGN KEY (db_user_id) REFERENCES user (db_user_id),
  db_term_id                    INT            NOT NULL,
  CONSTRAINT class_fk_term
    FOREIGN KEY (db_term_id) REFERENCES term (db_term_id),  
  db_building_id                INT            NOT NULL,
  CONSTRAINT class_fk_building
    FOREIGN KEY (db_building_id) REFERENCES building (db_building_id),
  db_class_room_number          VARCHAR(10), 
  db_class_attribute_id         INT            NOT NULL,
  CONSTRAINT class_fk_class_attribute
    FOREIGN KEY (db_class_attribute_id) REFERENCES class_attribute (db_class_attribute_id)    
);







