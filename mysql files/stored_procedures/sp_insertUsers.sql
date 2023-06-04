DELIMITER $

DROP PROCEDURE
    IF EXISTS mvp_system.sp_insertUsers $
CREATE PROCEDURE
    mvp_system.sp_insertUsers (
        IN p_username VARCHAR(20),
        IN p_userpass VARCHAR(50),
        IN p_firstName VARCHAR(50),
        IN p_lastName VARCHAR(50),
        IN p_gender VARCHAR(10),
        IN p_birthday DATE,
        IN p_contactNo VARCHAR(20),
        IN p_email VARCHAR(30),
        IN p_address VARCHAR(250),
        OUT o_errMsg VARCHAR(50)
    ) BEGIN IF EXISTS (
        SELECT username
        FROM mvp_system.users
        WHERE
            username = p_username
    ) THEN
SET o_errMsg = 996;

ELSE
INSERT INTO mvp_system.users
SET
    username = p_username,
    userpass = p_userpass,
    firstName = p_firstName,
    lastName = p_lastName,
    gender = p_gender,
    birthday = p_Birthday,
    contactNo = p_contactNo,
    emailAddress = p_email,
    address = p_address,
    statusID = 1,
    dtCreated = NOW();

END IF;

END 