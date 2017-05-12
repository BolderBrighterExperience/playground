SET SERVEROUTPUT ON;

BEGIN
    pkg_unit_testing.prc_ut_load_order;
    pkg_unit_testing.prc_ut_print_order;
END;
/

SELECT * FROM printed_orders ORDER BY id DESC;
SELECT * FROM log ORDER BY log_id DESC;
/

UPDATE orders SET printed = 0;
/