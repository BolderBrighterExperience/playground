SET serveroutput ON
DECLARE
    ls_result VARCHAR2(40);
BEGIN
    ls_result := pkg_hr_departments.fnc_department_exists_sql(100);
    DBMS_OUTPUT.PUT_LINE(ls_result);
   
   DBMS_OUTPUT.PUT_LINE('Rezultate insert');
   pkg_unit_testing.prc_test_add_employee;
   DBMS_OUTPUT.PUT_LINE(chr(13));
   
   DBMS_OUTPUT.PUT_LINE('Rezultate actualizare'); 
   pkg_unit_testing.prc_test_adjust_employee_data;
   DBMS_OUTPUT.PUT_LINE(chr(13));
   
   DBMS_OUTPUT.PUT_LINE('Rezultate stergere');
   pkg_unit_testing.prc_test_remove_employee;
   DBMS_OUTPUT.PUT_LINE(chr(13));
   
   DBMS_OUTPUT.PUT_LINE('Rezultate insert');
   pkg_unit_testing.prc_test_add_department;
   DBMS_OUTPUT.PUT_LINE(chr(13));
   
   DBMS_OUTPUT.PUT_LINE('Rezultate actualizare');
   pkg_unit_testing.prc_test_adjust_dept_data;
   DBMS_OUTPUT.PUT_LINE(chr(13));
   
   DBMS_OUTPUT.PUT_LINE('Rezultate stergere');
   pkg_unit_testing.prc_test_remove_employee;
END;
/

--select * from employees;
--select * from departments;
--select * from errors;
--delete from errors;
