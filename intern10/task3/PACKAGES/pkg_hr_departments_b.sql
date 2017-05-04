CREATE OR REPLACE PACKAGE BODY pkg_hr_departments
IS
    PROCEDURE prc_add_department(an_department_id   IN departments.department_id%TYPE,
                                 as_department_name IN departments.department_name%TYPE,
                                 an_manager_id 	    IN departments.manager_id%TYPE,
                                 an_location_id     IN departments.location_id%TYPE
                                 )
    IS 
    BEGIN
        INSERT
        INTO departments(department_id,
                        department_name,
                        manager_id,
                        location_id
                        )
        VALUES(an_department_id,
               as_department_name,
               an_manager_id,
               an_location_id
               );
               
        prc_log('info','pkg_hr_departments.prc_add_department');
        
    EXCEPTION
        WHEN OTHERS THEN
            prc_log('eroare','pkg_hr_departments.prc_add_department');
            RAISE;
    END prc_add_department;
	
    PROCEDURE prc_adjust_department_data(an_department_id   IN departments.department_id%TYPE,
                                         as_department_name IN departments.department_name%TYPE,
                                         an_manager_id 	    IN departments.manager_id%TYPE,
                                         an_location_id	    IN departments.location_id%TYPE)
    IS
	  BEGIN
            UPDATE departments    
            SET	   department_name = as_department_name,
                   manager_id = an_manager_id,
                   location_id = an_location_id
            WHERE  department_id = an_department_id;
            
            IF SQL%ROWCOUNT = 0 THEN
              RAISE NO_DATA_FOUND;
            END IF;
      
        prc_log('info','pkg_hr_departments.prc_adjust_department_data');		

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            prc_log('eroare','pkg_hr_departments.prc_adjust_department_data');
        WHEN OTHERS THEN
            prc_log('eroare','pkg_hr_departments.prc_adjust_department_data');
            RAISE;
    END prc_adjust_department_data;

    PROCEDURE prc_remove_department(an_department_id departments.department_id%TYPE)
    IS
    BEGIN
            DELETE
            FROM departments
            WHERE department_id = an_department_id;
    
        IF SQL%ROWCOUNT = 0 THEN
              RAISE NO_DATA_FOUND;
            END IF;
         
         prc_log('info','pkg_hr_departments.prc_adjust_department_data');   
          
    EXCEPTION
        WHEN OTHERS THEN
            prc_log('eroare','pkg_hr_departments.prc_remove_department');
            RAISE;
    END prc_remove_department;

    FUNCTION fnc_department_exists(an_department_id departments.department_id%TYPE)
    RETURN BOOLEAN
    IS
        ln_department_id NUMBER;
    BEGIN 
        SELECT department_id
        INTO ln_department_id
        FROM departments 
        WHERE department_id = an_department_id;
        RETURN TRUE;
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
    END fnc_department_exists;	
	
    FUNCTION fnc_department_exists_sql(an_department_id departments.department_id%TYPE)
    RETURN VARCHAR2
    IS
        ln_department_id NUMBER;
    BEGIN
        SELECT department_id
        INTO ln_department_id
        FROM departments 
        WHERE department_id = an_department_id;
        RETURN 'YES';
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        RETURN 'NO';
    END fnc_department_exists_sql;
END;
/
	