CREATE OR REPLACE PACKAGE BODY pkg_unit_testing 
AS
PROCEDURE prc_ut_load_order
IS
BEGIN
    BEGIN
        pkg_order_management.prc_load_order(2440);
        dbms_output.put_line('SUCCESS on loading order.');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('FAIL on loading order.');
    END;
    BEGIN
        pkg_order_management.prc_load_order(null);
        dbms_output.put_line('SUCCESS on loading order.');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('FAIL on loading order.');
    END;
    BEGIN
        pkg_order_management.prc_load_order(-101);
        dbms_output.put_line('SUCCESS on loading order.');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('FAIL on loading order.');
    END;
END prc_ut_load_order;
PROCEDURE prc_ut_print_order
IS
BEGIN
  BEGIN
        pkg_order_management.prc_print_order(null);
        DBMS_OUTPUT.PUT_LINE('SUCCES on printing  order !');
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('FAIL on printing  order !');
            ROLLBACK;
     END;
    BEGIN
        pkg_order_management.prc_print_order(2397);
        DBMS_OUTPUT.PUT_LINE('SUCCES on printing order !');
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('FAIL on printing order !');
            ROLLBACK;
    END;
    BEGIN
        pkg_order_management.prc_print_order(2457);
        DBMS_OUTPUT.PUT_LINE('SUCCESS on printing order !');
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('FAIL on printing  order !');
            ROLLBACK;
    END;
    BEGIN
        pkg_order_management.prc_print_order(-103);
        DBMS_OUTPUT.PUT_LINE('SUCCESS on printing order !');
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('FAIL on printing  order.');
            ROLLBACK;
    END;
END prc_ut_print_order;
END pkg_unit_testing;
/
