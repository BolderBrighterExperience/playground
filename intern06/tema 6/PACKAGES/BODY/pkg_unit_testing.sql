




CREATE OR REPLACE PACKAGE pkg_unit_testing
IS 
    PROCEDURE prc_add_department_test;
    PROCEDURE prc_adjust_dep_test;
    PROCEDURE prc_remove_department_test;
    PROCEDURE prc_add_employee_test;
    PROCEDURE prc_adjust_emp_test;
    PROCEDURE prc_remove_employee_test;
    
END;
/

CREATE OR REPLACE PACKAGE BODY pkg_unit_testing
IS
    PROCEDURE prc_add_employee_test
    IS
    BEGIN
        BEGIN
            pkg_hr_employees.prc_add_employee(208,'Adi','Ghita','Aghitax','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);

            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL INSERT STATEMENT'); 
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO INSERT');
        END;
        
        BEGIN
            pkg_hr_employees.prc_add_employee(208,'Adi','Ghita','Aghitax','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL INSERT STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO INSERT');
        END;
        
        BEGIN
            pkg_hr_employees.prc_add_employee(208,'Adi','adsda','sasafe','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL INSERT STATEMENT'); 
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO INSERT');
        END;
    END;
    
    PROCEDURE prc_adjust_emp_test
    IS
    BEGIN
        BEGIN
           pkg_hr_employees.prc_adjust_employee_data(4565,'aaaww','Gdddd','Aghitax','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL UPDATE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO UPDATE');
        END;
        
        BEGIN
            pkg_hr_employees.prc_adjust_employee_data(208,'Adi','Ghita','Aghitax','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'M_MAN',1000,null,100,20);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL UPDATE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO UPDATE');
        END;
        
        BEGIN
            pkg_hr_employees.prc_adjust_employee_data(208,'Adi','Ghita','Aghitax','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL UPDATE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO UPDATE');
        END;
        
    END;
    
    PROCEDURE prc_remove_employee_test
    IS
    BEGIN
        BEGIN
              pkg_hr_employees.prc_remove_employee(205);
              DBMS_OUTPUT.PUT_LINE('SUCCESSFUL DELETE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO DELETE');
        END;
        
        BEGIN
              pkg_hr_employees.prc_remove_employee(350);
              DBMS_OUTPUT.PUT_LINE('SUCCESSFUL DELETE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO DELETE');
        END;
    END;
    PROCEDURE prc_add_department_test
    IS
    BEGIN
        BEGIN
            pkg_hr_departments.prc_add_department(190,'saddsdd',null,2400);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL INSERT STATEMENT'); 
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO INSERT');
        END;
        
        BEGIN
            pkg_hr_departments.prc_add_department(270,'wwwwwww',null,2600);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL INSERT STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO INSERT');
        END;
        
        BEGIN
            pkg_hr_departments.prc_add_department(23434,'SASFFX',null,2400);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL INSERT STATEMENT'); 
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO INSERT');
        END;
    END;
    
    PROCEDURE prc_adjust_dep_test
    IS
    BEGIN
        BEGIN
           pkg_hr_departments.prc_adjust_department_data(260,'zzzzzz',null,1700);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL UPDATE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO UPDATE');
        END;
        
        BEGIN
            pkg_hr_departments.prc_adjust_department_data(666,'alalala',null,2400);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL UPDATE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO UPDATE');
        END;
        
        BEGIN
            pkg_hr_departments.prc_adjust_department_data(11,'sdffsf',null,2400);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL UPDATE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO UPDATE');
        END;
        
    END;
    
    PROCEDURE prc_remove_department_test
    IS
    BEGIN
        BEGIN
              pkg_hr_departments.prc_remove_department(300);
              DBMS_OUTPUT.PUT_LINE('SUCCESSFUL DELETE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO DELETE');
        END;
        
        BEGIN
              pkg_hr_departments.prc_remove_department(350);
              DBMS_OUTPUT.PUT_LINE('SUCCESSFUL DELETE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO DELETE');
        END;
    END;       
END;
/








