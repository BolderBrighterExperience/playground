CREATE OR REPLACE PACKAGE pkg_unit_testing
AS
PROCEDURE prc_ut_add_department;
PROCEDURE prc_ut_adjust_department_data;
PROCEDURE prc_ut_remove_department;
PROCEDURE prc_ut_add_employee;
PROCEDURE prc_ut_adjust_employee_data;
PROCEDURE prc_ut_remove_employee;
END pkg_unit_testing;
/