DELIMITER $$
DROP PROCEDURE IF EXISTS sp_select_user_all $$
CREATE PROCEDURE sp_select_user_all()
BEGIN
SELECT * FROM user;
END $$
DELIMITER ;

