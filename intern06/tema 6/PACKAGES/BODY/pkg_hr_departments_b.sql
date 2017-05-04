
CREATE OR REPLACE PACKAGE BODY pkg_hr_departments
IS
PROCEDURE prc_add_department (
                                an_department_id            departments.department_id%TYPE,
                                as_department_name          departments.department_name%TYPE,
                                an_manager_id               departments.manager_id%TYPE,
                                an_location_id              departments.location_id%TYPE
                                )
IS 
    invalid_department  EXCEPTION;
BEGIN
    IF(fnc_department_exists(an_department_id)) 
    THEN 
        RAISE invalid_department;
    ELSE
        INSERT INTO departments (department_id,department_name,manager_id,location_id)
        VALUES (an_department_id,as_department_name,an_manager_id,an_location_id);
       prc_log_table (seq_06_log_table.NEXTVAL, USER, SYSDATE,  'pkg_hr_departments','prc_add_department',SQLCODE, '1 ROW INSERTED');
    END IF;
    EXCEPTION
        WHEN invalid_department
        THEN prc_log_table (seq_06_log_table.NEXTVAL, USER, SYSDATE,  'pkg_hr_departments','prc_add_department',SQLCODE,'DEPARTMENT MUST BE UNIQUE');
        RAISE;
    WHEN OTHERS 
    THEN prc_log_table (seq_06_log_table.NEXTVAL, USER, SYSDATE,  'pkg_hr_departments','prc_add_department',SQLCODE, 'OTHER ERROR');	
                        RAISE;
END	prc_add_department;		
	
	
PROCEDURE prc_adjust_department_data (
                                        an_department_id            departments.department_id%TYPE,
                                        as_department_name          departments.department_name%TYPE,
                                        an_manager_id               departments.manager_id%TYPE,
                                        an_location_id              departments.location_id%TYPE
                                        )
IS	
invalid_department  EXCEPTION;
BEGIN
    UPDATE departments
    SET  department_id = an_department_id,
         department_name = as_department_name,
         manager_id = an_manager_id,
         location_id = an_location_id
    WHERE department_id = an_department_id;

    IF SQL%ROWCOUNT = 0 
    THEN 
    RAISE invalid_department;
    END IF;	

    prc_log_table (seq_06_log_table.NEXTVAL, USER, SYSDATE,  'pkg_hr_departments','prc_add_department',SQLCODE, '1 ROW UPDATED');
        EXCEPTION
        WHEN invalid_department 	
        THEN prc_log_table (seq_06_log_table.NEXTVAL, USER, SYSDATE,  'pkg_hr_departments','prc_add_department',SQLCODE, 'THE DEPARTMENT EXISTS. INSERT ANOTHER.');
       RAISE;
        WHEN OTHERS 
        THEN 
        prc_log_table (seq_06_log_table.NEXTVAL, USER, SYSDATE,  'pkg_hr_departments','prc_add_department',SQLCODE, 'OTHER ERROR');
        RAISE;
END prc_adjust_department_data;
	
	
PROCEDURE	prc_remove_department ( an_department_id departments.department_id%TYPE)
IS
    invalid_department  EXCEPTION;
BEGIN
    IF fnc_department_exists(an_department_id) 
    THEN DELETE FROM departments
        WHERE department_id = an_department_id;			
        prc_log_table (seq_06_log_table.NEXTVAL, USER, SYSDATE,  'pkg_hr_departments','prc_add_department',SQLCODE,'1 ROW DELETED');
    ELSE 					
    RAISE invalid_department;
    END IF;
EXCEPTION
    WHEN invalid_department 	
    THEN prc_log_table (seq_06_log_table.NEXTVAL, USER, SYSDATE,  'pkg_hr_departments','prc_add_department',SQLCODE,'THE DEPARTMENT DOES NOT EXISTS.');
      RAISE;
    WHEN OTHERS 
    THEN prc_log_table (seq_06_log_table.NEXTVAL, USER, SYSDATE,  'pkg_hr_departments','prc_add_department',SQLCODE, 'OTHER ERROR');
    RAISE;
END prc_remove_department;
	
	
FUNCTION fnc_department_exists (an_department_id IN NUMBER)
    RETURN BOOLEAN
AS
    v_res NUMBER(1) := 0;
BEGIN
    SELECT 1 
    INTO v_res
    FROM departments
    WHERE department_id = an_department_id;
        
RETURN TRUE;       
            EXCEPTION
                WHEN NO_DATA_FOUND 
                THEN RETURN FALSE;
END fnc_department_exists;
        

FUNCTION fnc_department_exists_sql (an_department_id IN NUMBER)
    RETURN NUMBER
IS
    v_result NUMBER := 0;
BEGIN
    SELECT 1 
    INTO v_result
    FROM departments
    WHERE department_id = an_department_id;
        IF ( v_result = 1) 
        THEN RETURN 1;
        ELSE RETURN 0;
        END IF;
            EXCEPTION
                WHEN NO_DATA_FOUND 
                THEN RETURN 0;
END fnc_department_exists_sql;					
END pkg_hr_departments;
/