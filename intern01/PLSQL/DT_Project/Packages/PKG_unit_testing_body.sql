CREATE OR REPLACE PACKAGE BODY  pkg_unit_testing
AS
PROCEDURE prc_unit_add_employee
IS
BEGIN

    BEGIN
        pkg_hr_employees.prc_add_employee('Elena','Enescu','elenaene1',790609543,SYSDATE,'MK_MAN',200,null,145,80);
        dbms_output.put_line('Employee added');
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Failed to insert new employee.');
            ROLLBACK;
    END;
        
        
    BEGIN
        pkg_hr_employees.prc_add_employee('Ghinea','Mara',null,79866509543,SYSDATE,'MK_MAN',200,null,114,30);
        dbms_output.put_line('Employee added.');
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
             dbms_output.put_line('Failed to insert new employee.');
             ROLLBACK;
    END; 
        
  
    BEGIN
        pkg_hr_employees.prc_add_employee('Pana','Aura','aurap',79755443,SYSDATE,'PU_MAN',0,null,125,30);
        dbms_output.put_line('Employee added');
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
             dbms_output.put_line('Failed to insert new employee.');
             ROLLBACK;
    END; 
        
     BEGIN
        pkg_hr_employees.prc_add_employee('Zina','Ana','aurap',7975867443,SYSDATE,'PU_MAN',640,null,124,30);
        dbms_output.put_line('Employee added.');
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
              dbms_output.put_line('Failed to insert new employee.');
              ROLLBACK;
    END;    

    BEGIN
        pkg_hr_employees.prc_add_employee('Zoe',null,'zoe',766867443,SYSDATE,'FI_ACCOUNT',700,null,124,30);
        dbms_output.put_line('Employee added.');
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
             dbms_output.put_line('Failed to insert new employee.');
             ROLLBACK;
    END;    
    
     BEGIN
        pkg_hr_employees.prc_add_employee('Paula','Popa','paulap',76657443,null,'PU_CLERK',700,null,145,30);
        dbms_output.put_line('Employee added.');
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
             dbms_output.put_line('Failed to insert new employee.');
             ROLLBACK;
    END;   

     BEGIN
        pkg_hr_employees.prc_add_employee('Claudia','Pinta','claudia',76657443,null,'PU_CLERK',700,null,145,30);
        dbms_output.put_line('Employee added.');
     COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Failed to insert new employee.');
            ROLLBACK;
    END;    

END prc_unit_add_employee;  
 
PROCEDURE prc_unit_adjust_employee_data
IS
BEGIN

    BEGIN 
        pkg_hr_employees.prc_adjust_employee_data(210,'Georgescu','Elena','elenag',790609543,TO_DATE('26.02.2017','DD.MM.YYYY'),'MK_MAN',200,NULL,130,100);
        dbms_output.put_line('Employee data modified.');
        COMMIT;
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Failed to update data.');
            ROLLBACK;
    END; 
        
  
    BEGIN 
        pkg_hr_employees.prc_adjust_employee_data(320,'Ionescu','Elvira','elvion',798876543,SYSDATE,'PU_MAN',600,NULL,101,100);
        dbms_output.put_line('Employee data modified.');
        COMMIT;
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Failed to update data.');
            ROLLBACK;
    END; 
       
END prc_unit_adjust_employee_data;

PROCEDURE prc_unit_remove_employee
IS
BEGIN  

    BEGIN 
        pkg_hr_employees.prc_remove_employee(295);
        dbms_output.put_line('Employee deleted.');
        COMMIT;
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Failed to delete employee.');
            ROLLBACK;
    END; 
        
 
     BEGIN 
        pkg_hr_employees.prc_remove_employee(250);
        dbms_output.put_line('Employee deleted.');
        COMMIT;
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Failed to delete employee.');
            ROLLBACK;
    END; 
       
END prc_unit_remove_employee;  

PROCEDURE  prc_unit_add_department
IS
BEGIN

    BEGIN
        pkg_hr_departments.prc_add_department('Administration',205,1700);
        dbms_output.put_line('Department inserted.');
        COMMIT;
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Failed to insert department.');
            ROLLBACK;
    END; 
    
    BEGIN
        pkg_hr_departments.prc_add_department(null,205,1700);
        dbms_output.put_line('Department inserted.');
        COMMIT;
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Failed to insert department.');
            ROLLBACK;
    END; 
    
    BEGIN
        pkg_hr_departments.prc_add_department('IT',null,1700);
        dbms_output.put_line('Department inserted.');
        COMMIT;
          
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Failed to insert department.');
            ROLLBACK;
    END; 
    
END prc_unit_add_department;

PROCEDURE prc_unit_adjust_dep_data
IS
BEGIN

    BEGIN
        pkg_hr_departments.prc_adjust_department_data(360,'IT',null,1700);
        dbms_output.put_line('Department updated.');
        COMMIT;
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Failed to update department.');
            ROLLBACK;
    END; 
    
    BEGIN
        pkg_hr_departments.prc_adjust_department_data(400,'IT',null,1700);
        dbms_output.put_line('Department updated.');
        COMMIT;
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Failed to update department.');
            ROLLBACK;
    END; 
 END prc_unit_adjust_dep_data;   

PROCEDURE prc_unit_remove_department 
IS
BEGIN

     BEGIN
        pkg_hr_departments.prc_remove_department(340,'Administration',200,1700);
        dbms_output.put_line('Department deleted.');
        COMMIT;
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Failed to delete department.');
            ROLLBACK;
    END; 
     
     BEGIN
        pkg_hr_departments.prc_remove_department(500,'IT',200,1700);
        dbms_output.put_line('Department deleted.');
        COMMIT;
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('Failed to delete department.');
            ROLLBACK;
    END; 
END prc_unit_remove_department ;    
END pkg_unit_testing;
/
