/**/

DROP DATABASE my_project;

/**/

CREATE DATABASE my_project;

/**/

use my_project;

/**/

DROP TABLE IF EXISTS module;

/**/

CREATE TABLE
    module (
        module_id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
        module_name VARCHAR(20) NOT NULL UNIQUE,
        updated_at DATETIME NULL,
        create_at DATETIME DEFAULT current_timestamp()
    );

/**/

DROP TABLE IF EXISTS user_status;

/**/

CREATE TABLE
    user_status (
        user_status_id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
        user_status_name VARCHAR(20) NOT NULL UNIQUE,
        updated_at DATETIME NULL,
        create_at DATETIME DEFAULT current_timestamp()
    );

DROP TABLE IF EXISTS role;

/**/

CREATE TABLE
    role (
        role_id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
        role_name VARCHAR(20) NOT NULL UNIQUE,
        updated_at DATETIME NULL,
        create_at DATETIME DEFAULT current_timestamp()
    );

DROP TABLE IF EXISTS user;

/**/

CREATE TABLE
    user (
        user_id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
        user_user VARCHAR(30) NOT NULL UNIQUE,
        user_password VARCHAR(256) NOT NULL,
        updated_at DATETIME NULL,
        create_at DATETIME DEFAULT current_timestamp(),
        role_id INT(11) NOT NULL,
        user_status_id INT(11) NOT NULL,
        CONSTRAINT User_Role_FK FOREIGN KEY (role_id) REFERENCES role (role_id),
        CONSTRAINT User_User_Status_FK FOREIGN KEY (user_status_id) REFERENCES user_status(user_status_id)
    );

/**/

DROP TABLE IF EXISTS role_module;

/**/

CREATE TABLE
    role_module(
        role_module_id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
        role_id INT(11) NOT NULL,
        module_id INT(11) NOT NULL,
        CONSTRAINT role_module_role_fk FOREIGN KEY (role_id) REFERENCES role (role_id),
        CONSTRAINT role_module_module_fk FOREIGN KEY (module_id) REFERENCES module (module_id)
    );