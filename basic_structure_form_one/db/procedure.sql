
#Ahutor:DIEGO CASALLAS
#Busines: 
#Date:14/07/2023
#Description:Projects Database
#Vesion:1.0
       
DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_select_all_user`$$
CREATE PROCEDURE `sp_select_all_user`() BEGIN
SELECT User_id,User_name,User_lastName,DT.DocumentType_name,User_document,User_email,User_cellphone,User_password,GT.GenderType_name,User_birthdate,ST.Status_name FROM user US 
INNER JOIN status ST ON US.Status_id=ST.Status_id
INNER JOIN gendertype GT ON US.GenderType_id=GT.GenderType_id
INNER JOIN document_type DT ON US.DocumentType_id=DT.DocumentType_id;
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_select_user_id`$$
CREATE PROCEDURE `sp_select_user_id`(IN userId INT) BEGIN
SELECT User_id,User_name,User_lastName,DT.DocumentType_name,User_document,User_email,User_cellphone,User_password,GT.GenderType_name,User_birthdate,ST.Status_name,DT.DocumentType_id,GT.GenderType_id,ST.Status_id,User_user FROM user US 
INNER JOIN status ST ON US.Status_id=ST.Status_id
INNER JOIN gendertype GT ON US.GenderType_id=GT.GenderType_id
INNER JOIN document_type DT ON US.DocumentType_id=DT.DocumentType_id
WHERE User_id=userId;
END$$



