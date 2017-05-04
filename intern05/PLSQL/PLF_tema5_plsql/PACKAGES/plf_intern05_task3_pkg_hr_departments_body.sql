CREATE OR REPLACE PACKAGE BODY pkg_hr_departments
IS
PROCEDURE prc_add_department(	
                an_department_id IN NUMBER, 
				as_department_name IN VARCHAR2, 
				an_manager_id IN NUMBER, 
				an_location_id IN NUMBER)
IS 
    pk_duplicate_dept EXCEPTION;
    PRAGMA EXCEPTION_INIT (pk_duplicate_dept,-1);
BEGIN
    EXECUTE IMMEDIATE
        'INSERT INTO departments 
         VALUES (  
                    :department_id,
                    :department_name,
                    :manager_id,
                    :location_id)'
    USING   an_department_id, 
            as_department_name, 
            an_manager_id, 
            an_location_id;
    prc_log_table (USER, SYSDATE,'pkg_hr_departments','prc_add_department',SQLCODE, '1 Rand inserat');

EXCEPTION
    WHEN pk_duplicate_dept 
    THEN
        prc_log_table (USER, SYSDATE,'pkg_hr_departments','prc_add_department',SQLCODE, 'Departamentul trebuie sa fie unic');
        RAISE;
    WHEN OTHERS 
    THEN
        prc_log_table (USER, SYSDATE,'pkg_hr_departments','prc_add_department',SQLCODE, 'Alta eroare');	
        RAISE;
END	prc_add_department;		


PROCEDURE prc_adjust_department_data (	
                an_department_id IN NUMBER, 
				as_department_name IN VARCHAR2, 
				an_manager_id IN NUMBER, 
				an_location_id IN NUMBER)
IS	
    pk_duplicate_dept EXCEPTION;
    PRAGMA EXCEPTION_INIT (pk_duplicate_dept,-1);
BEGIN
	EXECUTE IMMEDIATE
        'UPDATE departments
        SET 	
            department_id = :department_id,
            department_name = :department_name,
            manager_id = :manager_id,
            location_id = :location_id
        WHERE department_id = :department_id'
    USING   an_department_id,
            as_department_name,
            an_manager_id,
            an_location_id;
IF SQL%ROWCOUNT = 0 
	THEN 
		RAISE pk_duplicate_dept;
END IF;	
        prc_log_table (USER, SYSDATE,'pkg_hr_departments','prc_adjust_department_data',SQLCODE, '1 Rand updatat');
EXCEPTION
	WHEN pk_duplicate_dept 	
		THEN
        prc_log_table ( USER, SYSDATE,'pkg_hr_departments','prc_adjust_department_data',SQLCODE, 'Departamentul exista deja');
        RAISE;
	WHEN OTHERS 
		THEN 
		prc_log_table (USER, SYSDATE,'pkg_hr_departments','prc_adjust_department_data',SQLCODE, 'Alta eroare');
		RAISE;
END prc_adjust_department_data;


PROCEDURE	prc_remove_department ( an_department_id IN NUMBER)
IS
    pk_duplicate_dept  EXCEPTION;
BEGIN
    EXECUTE IMMEDIATE
        'DELETE FROM departments
         WHERE department_id = :department_id'
    USING an_department_id;
	prc_log_table (USER, SYSDATE,'pkg_hr_departments','prc_adjust_department_data',SQLCODE, '1 Rand sters');				
	RAISE pk_duplicate_dept;
    
EXCEPTION
	WHEN pk_duplicate_dept 	
		THEN
		prc_log_table (USER, SYSDATE,'pkg_hr_departments','prc_adjust_department_data',SQLCODE, 'Departamentul nu exista');
		RAISE;	
	WHEN OTHERS 
		THEN 
		prc_log_table (USER, SYSDATE,'pkg_hr_departments','prc_adjust_department_data',SQLCODE, 'Alta eroare');
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
			AS
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
