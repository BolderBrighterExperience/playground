--package specifications
   CREATE OR REPLACE PACKAGE pkg_unit_testing
IS
PROCEDURE prc_add_department_test;
PROCEDURE prc_adjust_dep_test;
PROCEDURE prc_remove_department_test;
PROCEDURE prc_add_employee_test;
PROCEDURE prc_adjust_employee_test;
PROCEDURE prc_remove_employee_test;

END;
/
