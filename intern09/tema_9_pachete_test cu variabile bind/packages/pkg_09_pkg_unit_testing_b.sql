--package body


CREATE OR REPLACE PACKAGE BODY pkg_unit_testing AS
   PROCEDURE test_create_emp
      IS
      BEGIN
        BEGIN
            pkg_hr_employees.prc_add_employee(999,'Alin','Ghita','AGHITA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
                DBMS_OUTPUT.PUT_LINE('Insert Done!');
            COMMIT;
        EXCEPTION
            WHEN OTHERS then
                DBMS_OUTPUT.PUT_LINE('Insert Error'); 
            ROLLBACK;
        END;
        
        BEGIN
            pkg_hr_employees.prc_add_employee(999,'Alin','Ghita','AGHITA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
                DBMS_OUTPUT.PUT_LINE('Insert Done!');
            COMMIT;    
        EXCEPTION
            WHEN OTHERS then
                DBMS_OUTPUT.PUT_LINE('Insert Error');
            ROLLBACK;        
        END;
        
        BEGIN
            pkg_hr_employees.prc_add_employee(999,'Alin','Ghita','AGHITA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
                DBMS_OUTPUT.PUT_LINE('Insert Done!');
            COMMIT;    
        EXCEPTION
            WHEN OTHERS then
                DBMS_OUTPUT.PUT_LINE('Insert Error');   
            ROLLBACK;        
        END;

      END;

        PROCEDURE test_update_emp 
        IS
        BEGIN 
          BEGIN
            pkg_hr_employees.prc_adjust_employee_data(5555,'ALina','Gavrila','agav','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1400,null,100,20);
                DBMS_OUTPUT.PUT_LINE('Update Done!');
             COMMIT;   
          EXCEPTION
            WHEN OTHERS then
                DBMS_OUTPUT.PUT_LINE('Update Error');
             ROLLBACK;       
          END;
          
          BEGIN
            pkg_hr_employees.prc_adjust_employee_data(55555,'ALina','Gavrila','agav','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1400,null,100,20);
                DBMS_OUTPUT.PUT_LINE('Update Done!');
             COMMIT;   
          EXCEPTION
            WHEN OTHERS then
                DBMS_OUTPUT.PUT_LINE('Update Error'); 
             ROLLBACK;       
          END;
          
        END;  

     PROCEDURE test_delete_emp
     IS
     BEGIN
        BEGIN
            pkg_hr_employees.prc_remove_employee(999);
                DBMS_OUTPUT.PUT_LINE('Delete Done!');
            COMMIT;    
        EXCEPTION
          WHEN OTHERS then
            DBMS_OUTPUT.PUT_LINE('Delete Error');
             ROLLBACK;   
        END;
        
        BEGIN   
            pkg_hr_employees.prc_remove_employee(999);
                DBMS_OUTPUT.PUT_LINE('Delete Done!');
            COMMIT;    
        EXCEPTION
            WHEN OTHERS then
                DBMS_OUTPUT.PUT_LINE('Delete Error');
             ROLLBACK;       
        END;
     END;       
        
        
      PROCEDURE test_create_dept
      IS
      BEGIN
        BEGIN
            pkg_hr_departments.prc_add_department(7777,'marke',null,2400);
                DBMS_OUTPUT.PUT_LINE('Insert Done!');
            COMMIT;    
        EXCEPTION
            WHEN OTHERS then
                DBMS_OUTPUT.PUT_LINE('Insert Error');
            ROLLBACK;        
        END;
        
        BEGIN
            pkg_hr_departments.prc_add_department(7777,'marke',null,2400);
                DBMS_OUTPUT.PUT_LINE('Insert Done!');
            COMMIT;    
        EXCEPTION
            WHEN OTHERS then
                DBMS_OUTPUT.PUT_LINE('Insert Error'); 
            ROLLBACK;        
        END;
        
        BEGIN
            pkg_hr_departments.prc_add_department(77777,'marke',null,2400);
                DBMS_OUTPUT.PUT_LINE('Insert Done!');
            COMMIT;    
        EXCEPTION
            WHEN OTHERS then
                DBMS_OUTPUT.PUT_LINE('Insert Error'); 
            ROLLBACK;
        END;

      END;

        PROCEDURE test_update_dept 
        IS
        BEGIN 
          BEGIN
            pkg_hr_departments.prc_adjust_department_data(7777,'piti',null,1700);
               DBMS_OUTPUT.PUT_LINE('Update Done!');
            COMMIT;   
          EXCEPTION
            WHEN OTHERS then
                DBMS_OUTPUT.PUT_LINE('Update Error');
             ROLLBACK;       
          END;
          
          BEGIN
            pkg_hr_departments.prc_adjust_department_data(777,'piti',null,1700);
                DBMS_OUTPUT.PUT_LINE('Update Done!');
             COMMIT;   
          EXCEPTION
            WHEN OTHERS then
                DBMS_OUTPUT.PUT_LINE('Update Error');
             ROLLBACK;       
          END;
          
        END;
      
      PROCEDURE test_delete_dept
      IS
      BEGIN
        BEGIN
            pkg_hr_departments.prc_remove_department(7777);
                DBMS_OUTPUT.PUT_LINE('Delete Done!');
            COMMIT;    
        EXCEPTION
          WHEN OTHERS then
            DBMS_OUTPUT.PUT_LINE('Delete Error'); 
          ROLLBACK;  
        END;
        
        BEGIN   
            pkg_hr_departments.prc_remove_department(7777);
                DBMS_OUTPUT.PUT_LINE('Delete Done!');
             COMMIT;   
        EXCEPTION
          WHEN OTHERS then
            DBMS_OUTPUT.PUT_LINE('Delete Error'); 
          ROLLBACK;  
        END;
     END;       
END pkg_unit_testing;   
/