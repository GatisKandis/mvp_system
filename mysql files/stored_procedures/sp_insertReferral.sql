DELIMITER $

DROP PROCEDURE
    IF EXISTS mvp_system.sp_insertReferral $
CREATE PROCEDURE
    mvp_system.sp_insertReferral (
        IN p_referredCust INT,
        IN p_referredBy INT
    ) BEGIN
INSERT INTO
    mvp_system.referrals
SET
    customerID = p_referredCust,
    referredBy = p_referredBy,
    isCredit = 0;

END 