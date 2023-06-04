DELIMITER $

DROP PROCEDURE
    IF EXISTS mvp_system.sp_getTrxList $
CREATE PROCEDURE
    mvp_system.sp_getTrxList() BEGIN
SELECT
    trx.trxID,
    acct.acctName,
    acctype.Description,
    trx.dtLog,
    trx.amount,
    bnk.mnemonic
FROM mvp_system.trxlog trx
    INNER JOIN mvp_system.accounts acct ON acct.acctID = trx.acctID
    INNER JOIN mvp_system.accounttype acctype ON acctype.accountType = acctType
    INNER JOIN banks bnk ON bnk.bankID = acct.bankID;

END 