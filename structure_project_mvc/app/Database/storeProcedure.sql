DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `sp_delete_user`$$
CREATE PROCEDURE `sp_delete_user` (IN `userId` INT)   BEGIN
DELETE FROM user WHERE user_id=userId;
END$$

DROP PROCEDURE IF EXISTS `sp_insert_user`$$
CREATE PROCEDURE `sp_insert_user` (IN `userUser` VARCHAR(30), IN `userPassword` VARCHAR(256), IN `roleId` INT, IN `userStatusId` INT)   BEGIN
INSERT INTO user(`user_id`, `user_user`, `user_password`, `role_id`, `user_status_id`) VALUES (null,userUser,userPassword,roleId,userStatusId);
END$$

DROP PROCEDURE IF EXISTS `sp_select_module_all`$$
CREATE PROCEDURE `sp_select_module_all` ()   BEGIN
SELECT * FROM module;
END$$

DROP PROCEDURE IF EXISTS `sp_select_role_all`$$
CREATE PROCEDURE `sp_select_role_all` ()   BEGIN
SELECT * FROM role;
END$$

DROP PROCEDURE IF EXISTS `sp_select_user_all`$$
CREATE PROCEDURE `sp_select_user_all` ()   BEGIN
SELECT US.user_id, US.user_user,US.user_password,RL.role_name,UST.user_status_name FROM user US
INNER JOIN role RL ON US.role_id=RL.role_id
INNER JOIN user_status UST ON US.user_status_id=UST.user_status_id ORDER BY US.user_id ASC;
END$$

DROP PROCEDURE IF EXISTS `sp_select_user_id`$$
CREATE PROCEDURE `sp_select_user_id` (IN `userId` INT)   BEGIN
SELECT US.user_id, US.user_user,US.user_password,RL.role_name,UST.user_status_name FROM user US
INNER JOIN role RL ON US.role_id=RL.role_id
INNER JOIN user_status UST ON US.user_status_id=UST.user_status_id WHERE US.user_id=userId;
END$$

DROP PROCEDURE IF EXISTS `sp_select_user_status_all`$$
CREATE PROCEDURE `sp_select_user_status_all` ()   BEGIN
SELECT * FROM user_status;
END$$

DROP PROCEDURE IF EXISTS `sp_select_user_user`$$
CREATE PROCEDURE `sp_select_user_user` (IN `userUser` VARCHAR(50))   BEGIN
SELECT * FROM user WHERE user_user=userUser;
END$$

DROP PROCEDURE IF EXISTS `sp_update_user`$$
CREATE PROCEDURE `sp_update_user` (IN `userId` INT, IN `userUser` VARCHAR(30), IN `roleId` INT, IN `userStatusId` INT)   BEGIN
UPDATE user SET user_user=userUser, role_id=roleId,user_status_id=userStatusId WHERE user_id=userId;
END$$

DELIMITER ;

-- --------------------------------------------------------
