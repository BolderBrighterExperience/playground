
CREATE OR REPLACE PACKAGE BODY unit_testing
IS
    PROCEDURE call_prc_add_dept
    IS
    BEGIN
        BEGIN
            hr_departments.prc_add_department(7,'alalala;',null,2400);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL INSERT STATEMENT'); 
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO INSERT. CHECK LOG_TABLE');
        END;
        
        BEGIN
            hr_departments.prc_add_department(9,'alalala',null,2400);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL INSERT STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO INSERT. CHECK LOG_TABLE');
        END;
        
        BEGIN
            hr_departments.prc_add_department(9453400,'alalala',null,2400);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL INSERT STATEMENT'); 
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO INSERT. CHECK LOG_TABLE');
        END;
    END;
    
    PROCEDURE call_prc_adjust_dept
    IS
    BEGIN
        BEGIN
            hr_departments.prc_adjust_department_data(7,'alalala',null,1700);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL UPDATE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO UPDATE. CHECK LOG_TABLE');
        END;
        
        BEGIN
            hr_departments.prc_adjust_department_data(54,'alalala',null,2400);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL UPDATE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO UPDATE. CHECK LOG_TABLE');
        END;
        
        BEGIN
            hr_departments.prc_adjust_department_data(11,'alalala',null,2400);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL UPDATE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO UPDATE. CHECK LOG_TABLE');
        END;
        
    END;
    
    PROCEDURE call_prc_remove_dept
    IS
    BEGIN
        BEGIN
              hr_departments.prc_remove_department(7);
              DBMS_OUTPUT.PUT_LINE('SUCCESSFUL DELETE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO DELETE. CHECK LOG_TABLE');
        END;
        
        BEGIN
              hr_departments.prc_remove_department(6546);
              DBMS_OUTPUT.PUT_LINE('SUCCESSFUL DELETE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO DELETE. CHECK LOG_TABLE');
        END;
    END;
    
    PROCEDURE call_prc_add_emp
    IS
    BEGIN
        BEGIN
            hr_employees.prc_add_employee(999,'Ana','Gherca','AGHERCA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL INSERT STATEMENT'); 
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO INSERT. CHECK LOG_TABLE');
        END;
        
        BEGIN
            hr_employees.prc_add_employee(900,'Ana','Gherca','AGHEfasaRCA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL INSERT STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO INSERT. CHECK LOG_TABLE');
        END;
        
        BEGIN
            hr_employees.prc_add_employee(999,'Ana','Maria','AMARIA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL INSERT STATEMENT'); 
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO INSERT. CHECK LOG_TABLE');
        END;
        
        BEGIN
            hr_employees.prc_add_employee(1234567,'Ana','Gherca','AGHERCA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
        DBMS_OUTPUT.PUT_LINE('SUCCESSFUL INSERT STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO INSERT. CHECK LOG_TABLE');
        END;
    END;
    
    PROCEDURE call_prc_adjust_emp
    IS
    BEGIN
        BEGIN
            hr_employees.prc_adjust_employee_data(999,'Ana','Gherca','AGHERCA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1400,null,100,20);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL UPDATE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO UPDATE. CHECK LOG_TABLE');
        END;
        
        BEGIN
            hr_employees.prc_adjust_employee_data(888,'Ana','Maria','AGHERCA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL UPDATE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO UPDATE. CHECK LOG_TABLE');
        END;
        
        BEGIN
            hr_employees.prc_adjust_employee_data(12345,'Oana','Gavrila','OGAVRILA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1400,null,100,20);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL UPDATE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO UPDATE. CHECK LOG_TABLE');
        END;
    END;
    
    PROCEDURE call_prc_remove_emp
    IS
    BEGIN
        BEGIN
            hr_employees.prc_remove_employee(999);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL DELETE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO DELETE. CHECK LOG_TABLE');
        END;
        
        BEGIN
            hr_employees.prc_remove_employee(4321);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL DELETE STATEMENT');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO DELETE. CHECK LOG_TABLE');
        END;
    END;
END;
/