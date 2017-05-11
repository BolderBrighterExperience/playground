CREATE OR REPLACE PACKAGE unit_testing
IS 
    PROCEDURE call_prc_add_dept;
    PROCEDURE call_prc_adjust_dept;
    PROCEDURE call_prc_remove_dept;
    PROCEDURE call_prc_add_emp;
    PROCEDURE call_prc_adjust_emp;
    PROCEDURE call_prc_remove_emp;
    PROCEDURE call_prc_load_order;
    PROCEDURE call_prc_print_order;
END;
/
