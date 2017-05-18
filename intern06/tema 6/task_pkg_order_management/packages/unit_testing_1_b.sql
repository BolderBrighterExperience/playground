CREATE OR REPLACE PACKAGE BODY unit_testing_1
IS
 PROCEDURE call_prc_load_order
    IS 
    BEGIN
        BEGIN 
            pkg_order_management.prc_load_order(2421);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL LOAD ORDER');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO LOAD ORDER. CHECK LOG_TABLE');
        END;
        
        BEGIN 
            pkg_order_management.prc_load_order(1000000);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL LOAD ORDER');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO LOAD ORDER. CHECK LOG_TABLE');
        END;
    END call_prc_load_order;
    
    PROCEDURE call_prc_print_order
    IS
    BEGIN
        BEGIN
            pkg_order_management.prc_print_order(2458);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL PRINT ORDER');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO PRINT ORDER. CHECK LOG_TABLE');
        END;
    END call_prc_print_order;
    
END unit_testing_1;
/