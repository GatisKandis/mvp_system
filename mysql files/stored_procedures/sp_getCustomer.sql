DELIMITER $

DROP PROCEDURE
    IF EXISTS mvp_system.sp_getCustomer $
CREATE PROCEDURE
    mvp_system.sp_getCustomer () BEGIN
SELECT *
FROM mvp_system.customers;

END 