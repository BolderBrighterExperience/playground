SET SERVEROUTPUT ON
CREATE OR REPLACE PACKAGE BODY pkg_unit_testing
IS
    PROCEDURE prc_test_add_employee
    IS
    BEGIN
        BEGIN
            pkg_hr_employees.prc_add_employee(380,'Avram','Ana','aana@gmail.com','075604425',TO_DATE('26.01.2017','dd.MM.yyyy'),'IT_PROG',4000,0.35,100,80);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost inserat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE INSERARE!!');
            COMMIT;
        END;
        
        BEGIN
            pkg_hr_employees.prc_add_employee(100,'Pohariu','Sabina','psabina@gmail.com','0723852990',TO_DATE('12.04.2010','dd.MM.yyyy'),'AD_PRES',6000,0.1,120,50);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost inserat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE INSERARE!!');
        END;      
            
        BEGIN    
            pkg_hr_employees.prc_add_employee(301,'Panturu',NULL,'pcrina@gmail.com','0712239878',TO_DATE('12.08.2008','dd.MM.yyyy'),'ST_MAN',6000,NULL,148,50);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost inserat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE INSERARE!!');
        END;  
        
        BEGIN    
            pkg_hr_employees.prc_add_employee(310,'Popa','Crina','pcrina@gmail.com','0752299877',TO_DATE('22.07.2012','dd.MM.yyyy'),'SH_CLERK',3200,0.2,145,90);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost inserat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE INSERARE!!');
            COMMIT;
        END;      
            
        BEGIN    
            pkg_hr_employees.prc_add_employee(312,'Popa','Crina','pcrina@gmail.com','0752299877',TO_DATE('22.07.2012','dd.MM.yyyy'),'SH_CLERK',3200,0.2,145,90);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost inserat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE INSERARE!!');
        END;      
            
        BEGIN    
            pkg_hr_employees.prc_add_employee(314,'Alexandru','Lucian','alucian@gmail.com','0734235849',TO_DATE('22.07.2012','dd.MM.yyyy'),'AD_MCR',3200,0.2,145,90);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost inserat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE INSERARE!!');
        END;      
            
        BEGIN
            pkg_hr_employees.prc_add_employee(315,'Popa','Ion','pion@gmail.com','0723847722',TO_DATE('22.07.2012','dd.MM.yyyy'),'AD_MGR',-4000,NULL,100,90);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost inserat un rand.');   
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE INSERARE!!');
        END;
    END prc_test_add_employee;
    
    PROCEDURE prc_test_adjust_employee_data
    IS
    BEGIN
        BEGIN
            pkg_hr_employees.prc_adjust_employee_data(310,'Ionescu','Dan','idan@gmail.com','0723847722',TO_DATE('30.04.2010','dd.MM.yyyy'),'MK_MAN',4000,NULL,100,90);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost actualizat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE ACTUALIZARE!!');     
        END;
        
        BEGIN
            pkg_hr_employees.prc_adjust_employee_data(400,'Ionescu','Dan','idan@gmail.com','0723847722',TO_DATE('30.04.2010','dd.MM.yyyy'),'MK_MAN',4000,NULL,100,90);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost actualizat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE ACTUALIZARE!!');        
        END;
        
        BEGIN
            pkg_hr_employees.prc_adjust_employee_data(301,'Anton','Ana','aana@gmail.com','0723847722',TO_DATE('30.04.2010','dd.MM.yyyy'),'MK_MAN',4000,NULL,100,90);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost actualizat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE ACTUALIZARE!!');        
        END;
        
        BEGIN
            pkg_hr_employees.prc_adjust_employee_data(301,'Anton','Ana','aana@gmail.com','0723847722',TO_DATE('30.04.2010','dd.MM.yyyy'),'AC_MCR',4000,NULL,100,90);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost actualizat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE ACTUALIZARE!!');        
        END;
        
        BEGIN
            pkg_hr_employees.prc_adjust_employee_data(301,'Anton','Ana','aana@gmail.com','0723847722',TO_DATE('30.04.2010','dd.MM.yyyy'),'AC_MGR',-2000,NULL,100,90);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost actualizat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE ACTUALIZARE!!');       
        END;
    END prc_test_adjust_employee_data;
    
    PROCEDURE prc_test_remove_employee
    IS
    BEGIN
        BEGIN
            pkg_hr_employees.prc_remove_employee(380);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost sters un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE STERGERE!!');     
        END;
        
        BEGIN
            pkg_hr_employees.prc_remove_employee(500);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost sters un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE STERGERE!!');     
        END;
    END prc_test_remove_employee;
    
    PROCEDURE prc_test_add_department
    IS
    BEGIN
        BEGIN
            pkg_hr_departments.prc_add_department(280,'HR',NULL,1700);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost inserat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE INSERARE!!');
        END;
        
        BEGIN
            pkg_hr_departments.prc_add_department(240,'HR',NULL,1700);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost inserat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE INSERARE!!');
        END;
        
        BEGIN
            pkg_hr_departments.prc_add_department(290,'HR',NULL,2500);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost inserat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE INSERARE!!');
        END;
        
        BEGIN
            pkg_hr_departments.prc_add_department(290,NULL,NULL,2500);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost inserat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE INSERARE!!');
        END;
         
    END prc_test_add_department;
    
    PROCEDURE prc_test_adjust_dept_data
    IS
    BEGIN
        BEGIN
            pkg_hr_departments.prc_adjust_department_data(270,'Accounting',NULL,1700);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost actualizat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE ACTUALIZARE!!');
        END;
        
        BEGIN
            pkg_hr_departments.prc_adjust_department_data(300,'Accounting',NULL,1700);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost actualizat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE ACTUALIZARE!!');
        END;
        
        BEGIN
            pkg_hr_departments.prc_adjust_department_data(270,NULL,200,1700);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost actualizat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE ACTUALIZARE!!');
        END;
        
        BEGIN
            pkg_hr_departments.prc_adjust_department_data(270,'Accounting',200,2500);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost actualizat un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE ACTUALIZARE!!');
        END;
    END prc_test_adjust_dept_data ;
    
    PROCEDURE prc_test_remove_department
    IS
    BEGIN
        BEGIN
            pkg_hr_departments.prc_remove_department(240);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost sters un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE STERGERE!!');
        END;
        
        BEGIN
            pkg_hr_departments.prc_remove_department(400);
            DBMS_OUTPUT.PUT_LINE('SUCCES.A fost sters un rand.');
            COMMIT;
        EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('EROARE STERGERE!!');
        END;
    END prc_test_remove_department;     
END;
/


