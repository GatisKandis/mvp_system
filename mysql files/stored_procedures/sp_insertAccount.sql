DELIMITER $

DROP PROCEDURE
    IF EXISTS mvp_system.sp_insertAccount $
CREATE PROCEDURE
    mvp_system.sp_insertAccount (
        IN p_acctNo VARCHAR(50),
        IN p_acctName VARCHAR(50),
        IN p_customerID INT,
        IN p_acctType INT,
        IN p_bankID INT,
        IN p_statusID INT,
        OUT o_errMsg VARCHAR(50)
    ) BEGIN
SET o_errMsg = '';

IF EXISTS (
    SELECT AcctNo
    FROM mvp_system.accounts
    WHERE
        accountNo = p_acctNo
) THEN
SET o_errMsg = 996;

ELSE
INSERT INTO
    mvp_system.accounts
SET
    acctNo = p_acctNo,
    acctName = p_acctName,
    customerID = p_customerID,
    acctType = p_acctType,
    bankID = p_bankID,
    balance = 0,
    statusID = p_statusID,
    dtCreated = NOW();

END IF;

END 