--package specification

CREATE OR REPLACE PACKAGE pkg_unit_testing AS
        PROCEDURE test_create_emp; 
        PROCEDURE test_update_emp;
        PROCEDURE test_delete_emp;
        PROCEDURE test_create_dept;
        PROCEDURE test_update_dept;
        PROCEDURE test_delete_dept;
END pkg_unit_testing; 
/