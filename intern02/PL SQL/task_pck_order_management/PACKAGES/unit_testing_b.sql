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
    END call_prc_add_dept;
    
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
    END call_prc_adjust_dept;
    
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
    END call_prc_remove_dept;
    
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
    END call_prc_add_emp;
    
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
    END call_prc_adjust_emp;
    
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
    END call_prc_remove_emp;
    
    PROCEDURE call_prc_load_order
    IS 
    BEGIN
        BEGIN 
            pkg_order_management.prc_load_order(2421);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL LOAD ORDER');
            pkg_order_management.prc_load_order(2436);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL LOAD ORDER');
            pkg_order_management.prc_load_order(2396);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL LOAD ORDER');
            pkg_order_management.prc_load_order(2406);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL LOAD ORDER');
            pkg_order_management.prc_load_order(2367);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL LOAD ORDER');
            pkg_order_management.prc_load_order(2361);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL LOAD ORDER');
            pkg_order_management.prc_load_order(2364);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL LOAD ORDER');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO LOAD ORDER. CHECK LOG_TABLE');
        END;
        
        BEGIN 
            pkg_order_management.prc_load_order(1000000);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL LOAD ORDER');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO LOAD ORDER. CHECK LOG_TABLE');
        END;
    END call_prc_load_order;
    
    PROCEDURE call_prc_print_order
    IS
    BEGIN
        BEGIN
            pkg_order_management.prc_print_order(2396);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL PRINT ORDER');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO PRINT ORDER. CHECK LOG_TABLE');
        END;
        
        BEGIN
            pkg_order_management.prc_print_order(1);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL PRINT ORDER');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO PRINT ORDER. CHECK LOG_TABLE');
        END;
        
        BEGIN
            pkg_order_management.prc_print_order(null);
            DBMS_OUTPUT.PUT_LINE('SUCCESSFUL PRINT ORDER');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('FAILED TO PRINT ORDER. CHECK LOG_TABLE');
        END;
    END call_prc_print_order;
    
END unit_testing;
/
