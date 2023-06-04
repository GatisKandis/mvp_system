DELIMITER $

DROP PROCEDURE
    IF EXISTS mvp_system.sp_insertCustomer $
CREATE PROCEDURE
    mvp_system.sp_insertCustomer (
        IN p_firstName VARCHAR(50),
        IN p_lastName VARCHAR(50),
        IN p_gender VARCHAR(10),
        IN p_Birthday DATE,
        IN p_contactNo VARCHAR(20),
        IN p_email VARCHAR(30),
        IN p_address VARCHAR(250),
        IN p_isReferral TINYINT,
        IN p_referredBy INT,
        OUT o_errMsg VARCHAR(50)
    ) BEGIN DECLARE REFERRED TINYINT DEFAULT 1;

INSERT INTO
    mvp_system.customers
SET
    firstName = p_firstName,
    lastName = p_lastName,
    gender = p_gender,
    birthday = p_Birthday,
    contactNo = p_contactNo,
    emailAddress = p_email,
    address = p_address,
    statusID = 4,
    memberSince = NOW();

SET @lastID = LAST_INSERT_ID();

IF p_isReferral = REFERRED THEN
CALL
    mvp_system.sp_insertReferral(@lastID, p_referredBy);

END IF;

END 