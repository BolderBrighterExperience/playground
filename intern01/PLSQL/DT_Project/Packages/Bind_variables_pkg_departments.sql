CREATE OR REPLACE PACKAGE BODY pkg_hr_departments 
IS
PROCEDURE prc_add_department (
                               as_department_name  IN  departments.department_name%TYPE,
                               an_manager_id       IN  departments.manager_id%TYPE,
                               an_location_id      IN  departments.location_id%TYPE
                               )
IS
    NOT_NULL EXCEPTION;
    PRAGMA EXCEPTION_INIT( NOT_NULL,-01400);
BEGIN 
    EXECUTE IMMEDIATE 
    'INSERT 
    INTO departments   ( 
                        department_id, 
                        department_name,
                        manager_id,
                        location_id
                        )
    VALUES  ( 
              :a,
              :b,
              :c,
              :d
              )' 
    USING 
            departments_seq.NEXTVAL,
            as_department_name,
            an_manager_id,
            an_location_id;         
                        
        prc_record_table(SQLCODE, SQLERRM, 'info','pkg_hr_departments.prc_add_department');
EXCEPTION
    WHEN NOT_NULL THEN 
        prc_record_table(SQLCODE,'It cannot be null','error','pkg_hr_departments.prc_add_department');
        RAISE;
    WHEN OTHERS THEN
        prc_record_table(SQLCODE,'Try again','error','pkg_hr_departments.prc_add_department');
        RAISE;
 END prc_add_department; 
  
  
PROCEDURE prc_adjust_department_data(
                                     an_department_id     IN   departments.department_id%TYPE,
                                     as_department_name   IN   departments.department_name%TYPE,
                                     an_manager_id        IN   departments.manager_id%TYPE,
                                     an_location_id       IN   departments.location_id%TYPE
                                     )

IS
BEGIN
    EXECUTE IMMEDIATE 
    'UPDATE   departments 
     SET      department_name = :a,
              manager_id      = :b,
              location_id     = :c
     WHERE    department_id   = :d' 
     USING    as_department_name,
              an_manager_id,
              an_location_id,
              an_department_id;
                                              
             
             
        IF SQL%ROWCOUNT = 0 THEN  
           RAISE_APPLICATION_ERROR(-20002, 'Department_id ' || an_department_id || ' ' || 'doesn''t exists!');
        END IF; 
            prc_record_table(SQLCODE, SQLERRM, 'info','pkg_hr_departments.prc_adjust_department_data');
        
EXCEPTION
       WHEN OTHERS THEN 
        prc_record_table(SQLCODE,'Try again','error','pkg_hr_departments.prc_adjust_department_data');
        RAISE;
END prc_adjust_department_data;               


PROCEDURE prc_remove_department  (
                                  an_department_id    IN  departments.department_id%TYPE,
                                  as_department_name  IN  departments.department_name%TYPE,
                                  an_manager_id       IN  departments.manager_id%TYPE,
                                  an_location_id      IN  departments.location_id%TYPE
                                  )
IS
BEGIN
    EXECUTE IMMEDIATE 
   'DELETE FROM  departments
    WHERE        department_id = :a' 
    USING        an_department_id;

     
    IF SQL%ROWCOUNT = 0 THEN 
        RAISE_APPLICATION_ERROR( -20003, 'Department_id ' || an_department_id || ' ' ||' doesn''t exists!' );
    END IF; 
        prc_record_table(SQLCODE,SQLERRM,'info','pkg_hr_departments.prc_remove_department ');
    
EXCEPTION
    WHEN OTHERS THEN
        prc_record_table(SQLCODE,'Try again','error','pkg_hr_departments.prc_remove_department');
        RAISE;
END prc_remove_department;          

FUNCTION fnc_department_exists ( an_department_id  IN departments.department_id%TYPE )
RETURN BOOLEAN
IS
    ln_department_id NUMBER;
BEGIN
     EXECUTE IMMEDIATE
     'SELECT  department_id 
     FROM       departments
     WHERE    department_id = :a'
     INTO       ln_department_id 
     USING    an_department_id;
    
    RETURN TRUE;
    
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
         RETURN FALSE;
        

END fnc_department_exists;

FUNCTION fnc_department_exists_sql ( an_department_id  IN departments.department_id%TYPE )
RETURN NUMBER    
IS               
    ln_department_id NUMBER;
BEGIN    
    IF fnc_employee_exists( an_department_id ) THEN
        RETURN 1;
    END IF;

    RETURN 0;
    
END fnc_department_exists_sql;
END;
/