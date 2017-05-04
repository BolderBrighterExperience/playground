SET SERVEROUTPUT ON;

BEGIN
    pkg_unit_testing.prc_ut_add_department;
    pkg_unit_testing.prc_ut_adjust_department_data;
    pkg_unit_testing.prc_ut_remove_department;
    pkg_unit_testing.prc_ut_add_employee;
    pkg_unit_testing.prc_ut_adjust_employee_data;
    pkg_unit_testing.prc_ut_remove_employee;
END;
/


SELECT * FROM log ORDER BY log_id;
/
