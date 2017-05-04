CREATE OR REPLACE PACKAGE BODY pkg_unit_testing
AS
PROCEDURE prc_ut_add_department
IS
BEGIN
    BEGIN
        pkg_hr_departments.prc_add_department('Internship', 200, 1700);
        dbms_output.put_line('Success on insert department.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on insert department.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_departments.prc_add_department(NULL, 100, 1800);
        dbms_output.put_line('Success on insert department.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on insert department.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_departments.prc_add_department('DB', 200, 900);
        dbms_output.put_line('Success on insert department.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on insert department.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_departments.prc_add_department('Intern', 13, 1700);
        dbms_output.put_line('Success on insert department.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on insert department.');
            ROLLBACK;
    END;
END prc_ut_add_department;

PROCEDURE prc_ut_adjust_department_data
IS
BEGIN
    BEGIN
        pkg_hr_departments.prc_adjust_department_data(120, 'Treasury', 108, 2700);
        dbms_output.put_line('Success on update department.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on update department.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_departments.prc_adjust_department_data(500, 'Operator', 108, 2700);
        dbms_output.put_line('Success on update department.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on update department.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_departments.prc_adjust_department_data(120, null, 108, 2700);
        dbms_output.put_line('Success on update department.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on update department.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_departments.prc_adjust_department_data(120, 'Treasury', 13, 2700);
         dbms_output.put_line('Success on update department.');
         COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on update department.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_departments.prc_adjust_department_data(120, 'Treasury', 100, 700);
        dbms_output.put_line('Success on update department.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on update department.');
            ROLLBACK;
    END;
END prc_ut_adjust_department_data;

PROCEDURE prc_ut_remove_department
IS
BEGIN
    BEGIN
        pkg_hr_departments.prc_remove_department(290);
        dbms_output.put_line('Success on delete department.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on delete department.');
            ROLLBACK;
    END;  
    BEGIN
        pkg_hr_departments.prc_remove_department(460);
        dbms_output.put_line('Success on delete department.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on delete department.');
            ROLLBACK;
    END;  
    BEGIN
        pkg_hr_departments.prc_remove_department(340);
        dbms_output.put_line('Success on delete department.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on delete department.');
            ROLLBACK;
    END;  
END prc_ut_remove_department;

PROCEDURE prc_ut_add_employee
IS
BEGIN
    BEGIN
        pkg_hr_employees.prc_add_employee( 'Mihaela', 'Spirache', 'miha', '076.644.1217', SYSDATE, 'AC_MGR', 12000, NULL, 101, 290);
        dbms_output.put_line('Success on insert employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on insert employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_add_employee( 'Mihaela', NULL, 'mihaelaspirache', '076.644.1217', SYSDATE, 'AC_MGR', 12000, NULL, 101, 290);
        dbms_output.put_line('Success on insert employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on insert employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_add_employee( 'Mihaela', 'Spirache', 'miha', '076.644.1217', TO_DATE('24/07/2006','dd/mm/yyyy'), 'AC_MGR', 12000, NULL, 101, 290);
        dbms_output.put_line('Success on insert employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on insert employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_add_employee( 'Mihaela', 'Spirache', 'mihaelaspirache', '076.644.1217', NULL, 'AC_MGR', 12000, NULL, 101, 290);
        dbms_output.put_line('Success on insert employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on insert employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_add_employee( 'Mihaela', 'Spirache', 'mihaelaspirache', '076.644.1217', TO_DATE('25/03/2008','dd/mm/yyyy'), 'AC_', 12000, NULL, 101, 290);
        dbms_output.put_line('Success on insert employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on insert employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_add_employee( 'Mihaela', 'Spirache', 'mihaelaspirache', '076.644.1217', SYSDATE, NULL, 12000, NULL, 101, 290);
        dbms_output.put_line('Success on insert employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on insert employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_add_employee( 'Mihaela', 'Spirache', 'mihaelaspirache', '076.644.1217', SYSDATE, 'AC_MGR', -1000, NULL, 101, 290);
        dbms_output.put_line('Success on insert employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on insert employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_add_employee( 'Mihaela', 'Spirache', 'mihaelaspirache', '076.644.1217', SYSDATE, 'AC_MGR', 12000, NULL, 13, 290);
        dbms_output.put_line('Success on insert employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on insert employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_add_employee( 'Mihaela', 'Spirache', 'mihaelaspirache', '076.644.1217', SYSDATE, 'AC_MGR', 12000, NULL, 101, 500);
        dbms_output.put_line('Success on insert employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on insert employee.');
            ROLLBACK;
    END;
  
    
END prc_ut_add_employee;

PROCEDURE prc_ut_adjust_employee_data
IS
BEGIN
    BEGIN
        pkg_hr_employees.prc_adjust_employee_data( 228, 'Miha', NULL, 'mihaelaspirache', '076.644.1217', SYSDATE, 'MK_REP', 6000, NULL, 201, 20);
        dbms_output.put_line('Success on update employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on update employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_adjust_employee_data( 228, 'Miha', 'Dumitrescu', 'mihaeladumitrescu', '076.555.1217', TO_DATE('14/08/2001','dd/mm/yyyy'), 'MK_REP', 6000, NULL, 201, 20);
        dbms_output.put_line('Success on update employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on update employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_adjust_employee_data( 228, 'Miha', 'Dumitrescu', 'jseo', '076.555.1217', SYSDATE, 'MK_REP', 6000, NULL, 201, 500);
        dbms_output.put_line('Success on update employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on update employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_adjust_employee_data( 228, 'Miha', 'Dumitrescu', 'mihaeladumitrescu', '076.555.1217', NULL, 'MK_REP', 6000, NULL, 201, 20);
        dbms_output.put_line('Success on update employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on update employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_adjust_employee_data( 228, 'Miha', 'Dumitrescu', 'mihaeladumitrescu', '076.555.1217', SYSDATE, 'MK', 6000, NULL, 201, 20);
        dbms_output.put_line('Success on update employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on update employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_adjust_employee_data( 228, 'Miha', 'Dumitrescu', 'mihaeladumitrescu', '076.555.1217', SYSDATE, NULL, 6000, NULL, 201, 20);
        dbms_output.put_line('Success on update employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on update employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_adjust_employee_data( 228, 'Miha', 'Dumitrescu', 'mihaeladumitrescu', '076.555.1217', TO_DATE('14/08/2001','dd/mm/yyyy'), 'MK_REP', 6000, NULL, 201, 20);
        dbms_output.put_line('Success on update employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on update employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_adjust_employee_data( 228, 'Miha', 'Dumitrescu', 'mihaeladumitrescu', '076.555.1217', SYSDATE, 'MK_REP', -600, NULL, 201, 20);
        dbms_output.put_line('Success on update employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on update employee.');
            ROLLBACK;
    END;
END prc_ut_adjust_employee_data;

PROCEDURE prc_ut_remove_employee
IS
BEGIN
     BEGIN
        pkg_hr_employees.prc_remove_employee(186);
        dbms_output.put_line('Success on delete employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on delete employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_remove_employee(405);
        dbms_output.put_line('Success on delete employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on delete employee.');
            ROLLBACK;
    END;
    BEGIN
        pkg_hr_employees.prc_remove_employee(180);
        dbms_output.put_line('Success on delete employee.');
        COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Fail on delete employee.');
            ROLLBACK;
    END;
END prc_ut_remove_employee;

END pkg_unit_testing;
/
