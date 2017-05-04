SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE BODY pkg_unit_test
IS

PROCEDURE prc_add_department_ut
IS 
BEGIN

    BEGIN
        pkg_hr_departments.prc_add_department(401,'Planing',202,1500);
        DBMS_OUTPUT.PUT_LINE(' Inserarea s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Inserarea nu s-a realizat. ');
            ROLLBACK;
               
    END;
  
    BEGIN
        pkg_hr_departments.prc_add_department(290,'Planing',202,1500);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(' Inserarea s-a realizat cu succes. ');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE(' Inserarea nu s-a realizat. ');       
    END;
  
    BEGIN
        pkg_hr_departments.prc_add_department(100,NULL,202,1500);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(' Inserarea s-a realizat cu succes. ');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE(' Inserarea nu s-a realizat. ');       
    END;
  
    BEGIN
        pkg_hr_departments.prc_add_department(300,'Planing',208,1500);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(' Inserarea s-a realizat cu succes. ');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE(' Inserarea nu s-a realizat. ');       
    END;

END prc_add_department_ut;

PROCEDURE prc_adjust_department_data_ut
IS 
BEGIN
    BEGIN
        pkg_hr_departments.prc_adjust_department_data(400,'Planing',202,1400);
        DBMS_OUTPUT.PUT_LINE(' Update-ul s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Update-ul nu s-a realizat. ');
            ROLLBACK;
    END;
  
    BEGIN
        pkg_hr_departments.prc_adjust_department_data(290,NULL,202,1500);
        DBMS_OUTPUT.PUT_LINE(' Update-ul s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Update-ul nu s-a realizat. ');
            ROLLBACK;
    END;
  
    BEGIN
        pkg_hr_departments.prc_adjust_department_data(250,'Planing',430,1500);
        DBMS_OUTPUT.PUT_LINE(' Update-ul s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Update-ul nu s-a realizat. ');
            ROLLBACK;
    END;
  
    BEGIN
        pkg_hr_departments.prc_adjust_department_data(400,'Planing',202,1500);
        DBMS_OUTPUT.PUT_LINE(' Update-ul s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Update-ul nu s-a realizat. ');
            ROLLBACK;
    END;
END prc_adjust_department_data_ut;


PROCEDURE prc_remove_department_ut
IS 
BEGIN
    BEGIN
        pkg_hr_departments.prc_remove_department(290);
        DBMS_OUTPUT.PUT_LINE(' Stergerea s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Stergerea nu s-a realizat. ');
            ROLLBACK;
    END;
  
    BEGIN
        pkg_hr_departments.prc_remove_department(400);
        DBMS_OUTPUT.PUT_LINE(' Stergerea s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Stergerea nu s-a realizat. ');
            ROLLBACK;
    END;
END prc_remove_department_ut;

PROCEDURE prc_add_employee_ut
IS 
BEGIN
    BEGIN
        pkg_hr_employee.prc_add_employee(210,'Elena','Munteanu','munteanue1','234.255.5567',TO_DATE('15.12.2000','dd.mm.yyyy'),'PU_MAN',1500,NULL,108,30);
        DBMS_OUTPUT.PUT_LINE(' Inserarea s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Inserarea nu s-a realizat. ');
            ROLLBACK;
               
    END;
  
    BEGIN
        pkg_hr_employee.prc_add_employee(201,'Elena','Munteanu','munteanue','234.255.5567',TO_DATE('15.12.2000','dd.mm.yyyy'),'PU_MAN',1500,NULL,108,30);
        DBMS_OUTPUT.PUT_LINE(' Inserarea s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Inserarea nu s-a realizat. ');
            ROLLBACK;
               
    END;
  
    BEGIN
        pkg_hr_employee.prc_add_employee(207,'Elena','Munteanu','HBAER','234.255.5567',TO_DATE('15.12.2000','dd.mm.yyyy'),'PU_MAN',1500,NULL,108,30);
        DBMS_OUTPUT.PUT_LINE(' Inserarea s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Inserarea nu s-a realizat. ');
            ROLLBACK;
               
    END;
  
    BEGIN
        pkg_hr_employee.prc_add_employee(207,'Elena','Munteanu','munteanue','234.255.5567',TO_DATE('15.12.2000','dd.mm.yyyy'),'PU_MAN',1500,NULL,108,400);
        DBMS_OUTPUT.PUT_LINE(' Inserarea s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Inserarea nu s-a realizat. ');
            ROLLBACK;
                       
    END;

    BEGIN
        pkg_hr_employee.prc_add_employee(207,'Elena','Munteanu','munteanue','234.255.5567',TO_DATE('15.12.2000','dd.mm.yyyy'),'PU_MAN',0,NULL,108,30);
        DBMS_OUTPUT.PUT_LINE(' Inserarea s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Inserarea nu s-a realizat. ');
            ROLLBACK;
               
    END;
  
    BEGIN
        pkg_hr_employee.prc_add_employee(207,'Elena','Munteanu','munteanue','234.255.5567',NULL,'PU_MAN',1500,NULL,108,30);
        DBMS_OUTPUT.PUT_LINE(' Inserarea s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Inserarea nu s-a realizat. ');
            ROLLBACK;
               
    END;

END prc_add_employee_ut;


PROCEDURE prc_adjust_employee_data_ut
IS 
BEGIN

    BEGIN
        pkg_hr_employee.prc_adjust_employee_data(105,'Elena','Munteanu','alinag','234.255.5567',TO_DATE('15.12.2000','dd.mm.yyyy'),'PU_MAN',1500,NULL,108,30);
        DBMS_OUTPUT.PUT_LINE(' Update-ul s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Update-ul nu s-a realizat. ');
            ROLLBACK;
               
    END;
  
    BEGIN
        pkg_hr_employee.prc_adjust_employee_data(303,'Elena','Munteanu','munteanue','234.255.5567',TO_DATE('15.12.2000','dd.mm.yyyy'),'PU_MAN',1500,NULL,108,30);
        DBMS_OUTPUT.PUT_LINE(' Update-ul s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Update-ul nu s-a realizat. ');
            ROLLBACK;
               
    END;
  
    BEGIN
        pkg_hr_employee.prc_adjust_employee_data(105,'Elena','Munteanu','HBAER','234.255.5567',TO_DATE('15.12.2000','dd.mm.yyyy'),'PU_MAN',1500,NULL,108,30);
        DBMS_OUTPUT.PUT_LINE(' Update-ul s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Update-ul nu s-a realizat. ');
            ROLLBACK;
               
    END;
  
    BEGIN
        pkg_hr_employee.prc_adjust_employee_data(105,'Elena','Munteanu','munteanue','234.255.5567',TO_DATE('15.12.2000','dd.mm.yyyy'),'PU_MAN',1500,NULL,108,400);
        DBMS_OUTPUT.PUT_LINE(' Update-ul s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Update-ul nu s-a realizat. ');
            ROLLBACK;
                       
    END;

    BEGIN
        pkg_hr_employee.prc_adjust_employee_data(105,'Elena','Munteanu','munteanue','234.255.5567',TO_DATE('15.12.2000','dd.mm.yyyy'),'PU_MAN',0,NULL,108,30);
        DBMS_OUTPUT.PUT_LINE(' Update-ul s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Update-ul nu s-a realizat. ');
            ROLLBACK;
               
    END;
  
    BEGIN
        pkg_hr_employee.prc_adjust_employee_data(105,'Elena','Munteanu','munteanue','234.255.5567',NULL,'PU_MAN',1500,NULL,108,30);
        DBMS_OUTPUT.PUT_LINE(' Update-ul s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Update-ul nu s-a realizat. ');
            ROLLBACK;
               
    END;

END prc_adjust_employee_data_ut;

PROCEDURE prc_remove_employee_ut
IS 
BEGIN
    BEGIN
        pkg_hr_employee.prc_remove_employee(206);
        DBMS_OUTPUT.PUT_LINE(' Stergerea s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Stergerea nu s-a realizat. ');
            ROLLBACK;
    END;
  
    BEGIN
        pkg_hr_employee.prc_remove_employee(100);
        DBMS_OUTPUT.PUT_LINE(' Stergerea s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Stergerea nu s-a realizat. ');
            ROLLBACK;
    END;
  
    BEGIN
        pkg_hr_employee.prc_remove_employee(210);
        DBMS_OUTPUT.PUT_LINE(' Stergerea s-a realizat cu succes. ');
        COMMIT;
  
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE(' Stergerea nu s-a realizat. ');
            ROLLBACK;
    END;
END prc_remove_employee_ut;
END pkg_unit_test;
/
