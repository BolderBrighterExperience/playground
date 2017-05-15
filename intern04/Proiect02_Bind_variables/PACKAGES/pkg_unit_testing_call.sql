SET SERVEROUTPUT ON;

BEGIN
    pkg_unit_testing.prc_ut_order_management;
END;
/

SELECT * FROM printed_orders ORDER BY id DESC;
SELECT * FROM log ORDER BY log_id DESC;
SELECT * FROM orders;
/

DELETE printed_orders;
UPDATE orders SET printed = 0;
COMMIT;
/
