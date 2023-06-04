DELIMITER $

DROP PROCEDURE
    IF EXISTS mvp_system.sp_getCheckReferralCredit$
CREATE PROCEDURE
    mvp_system.sp_getCheckReferralCredit (
        IN p_referredBy INT,
        OUT o_count INT
    ) BEGIN
SELECT *
FROM mvp_system.referrals
WHERE
    referredBy = p_referredBy
    AND isCredit = 0;

-- zero (0) Referral fee is pending

END 