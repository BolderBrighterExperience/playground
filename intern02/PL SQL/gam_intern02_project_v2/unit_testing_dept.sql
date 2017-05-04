CREATE OR REPLACE PACKAGE unit_testing
IS 
    PROCEDURE call_prc_add_dept;
    PROCEDURE call_prc_adjust_dept;
    PROCEDURE call_prc_remove_dept;
END;
/

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
END;
/