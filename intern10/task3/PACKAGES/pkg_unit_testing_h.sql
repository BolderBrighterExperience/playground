CREATE OR REPLACE PACKAGE pkg_unit_testing
IS
    PROCEDURE prc_test_add_employee;
    PROCEDURE prc_test_adjust_employee_data;
    PROCEDURE prc_test_remove_employee;
    
    PROCEDURE prc_test_add_department;
    PROCEDURE prc_test_adjust_dept_data;
    PROCEDURE prc_test_remove_department;
    
    PROCEDURE prc_order_management_ut;
    
END;
/
