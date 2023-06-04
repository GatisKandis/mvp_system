DELIMITER $

DROP PROCEDURE
    IF EXISTS mvp_system.sp_insertTransactionLog $
CREATE PROCEDURE
    mvp_system.sp_insertTransactionLog (
        IN p_acctID INT,
        IN p_bankID INT,
        IN p_amount INT,
        IN p_isReferral INT,
        IN p_referralID INT,
        OUT o_errMsg VARCHAR(50)
    ) BEGIN
SET o_errMsg = '';

IF p_isReferral = 1 THEN IF EXISTS (
    SELECT referralID
    FROM mvp_system.trxlog
    WHERE
        referralID = p_referralID
) THEN
SET o_errMsg = 996;

ELSE
INSERT INTO mvp_system.trxlog
SET
    acctID = p_acctID,
    bankID = p_bankID,
    dtlog = NOW(),
    amount = p_amount,
    isReferral = p_isReferral,
    referralID = p_referralID;

UPDATE mvp_system.referrals
SET isCredit = 1
WHERE
    referralID = p_referralID;

END IF;

ELSE
INSERT INTO mvp_system.trxlog
SET
    acctID = p_acctID,
    bankID = p_bankID,
    dtlog = NOW(),
    amount = p_amount,
    isReferral = p_isReferral,
    referralID = p_referralID;

END IF;

END 