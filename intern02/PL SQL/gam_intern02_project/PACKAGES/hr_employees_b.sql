CREATE OR REPLACE PACKAGE BODY hr_employees 
IS
    --GS_PACK_NAME VARCHAR2(32) := 'hr_employees';
	PROCEDURE prc_add_employee( an_empId 		    IN  employees.employee_id%TYPE,
                                as_first_name  	    IN  employees.first_name%TYPE,
                                as_last_name   	    IN  employees.last_name%TYPE,
                                as_email        	IN  employees.email%TYPE,
                                as_phone 		    IN  employees.phone_number%TYPE,
                                ad_hire_date 	    IN  employees.hire_date%TYPE,
                                as_job_id 		    IN  employees.job_id%TYPE,
                                an_salary 		    IN  employees.salary%TYPE,
                                an_commission 	    IN  employees.commission_pct%TYPE,
                                an_manager_id 	    IN  employees.manager_id%TYPE,
                                an_department_id    IN  employees.department_id%TYPE  )
	IS
        LS_PROC_NAME        VARCHAR2(32) := 'prc_add_employee';
		le_invalid_employee EXCEPTION;
	BEGIN
		IF fnc_employee_exists( an_empId ) THEN
			RAISE le_invalid_employee;
		ELSE
            INSERT 
            INTO 	employees ( employee_id,
                                first_name,
                                last_name,
                                email,
                                phone_number,
                                hire_date,
                                job_id,
                                salary,
                                commission_pct,
                                manager_id,
                                department_id )
            VALUES 	( an_empId,
                      as_first_name,
                      as_last_name,
                      as_email,
                      as_phone,
                      ad_hire_date,
                      as_job_id,
                      an_salary,
                      an_commission,
                      an_manager_id,
                      an_department_id );
						
			prc_log_table ( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, '1 row inserted into EMPLOYEES' );
		END IF;
        
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            prc_log_table ( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, SQLCODE, 'Duplicate values on an index.' );
            RAISE;
                            
        WHEN le_invalid_employee THEN
            prc_log_table ( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, 'This employee exists. Please insert another.');
            RAISE;
                            
        WHEN OTHERS THEN
            prc_log_table ( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, SQLCODE, SQLERRM);
            RAISE;
    END;
	
	PROCEDURE prc_adjust_employee_data (  an_empId 		    IN  employees.employee_id%TYPE,
                                          as_first_name     IN  employees.first_name%TYPE,
                                          as_last_name      IN  employees.last_name%TYPE,
                                          as_email          IN  employees.email%TYPE,
                                          as_phone 		    IN  employees.phone_number%TYPE,
                                          ad_hire_date 	    IN  employees.hire_date%TYPE,
                                          as_job_id 	    IN  employees.job_id%TYPE,
                                          an_salary         IN  employees.salary%TYPE,
                                          an_commission     IN  employees.commission_pct%TYPE,
                                          an_manager_id     IN  employees.manager_id%TYPE,
                                          an_department_id  IN  employees.department_id%TYPE  )
	IS
        LS_PROC_NAME        VARCHAR2(32) := 'prc_adjust_employee_data';
		le_invalid_employee    EXCEPTION;
	BEGIN
        UPDATE 	employees
        SET 	first_name = as_first_name,
                last_name = as_last_name,
                email = as_email,
                phone_number = as_phone,
                hire_date = ad_hire_date,
                job_id = as_job_id,
                salary = an_salary,
                commission_pct = an_commission,
                manager_id = an_manager_id,
                department_id = an_department_id
        WHERE 	employee_id = an_empId;
        
        IF SQL%ROWCOUNT = 0 THEN
            RAISE le_invalid_employee;
        END IF;
        
        prc_log_table ( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, '1 row updated into EMPLOYEES.' );
        
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            prc_log_table ( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, SQLCODE, 'Duplicate values on an index.' );
            RAISE;

        WHEN le_invalid_employee THEN
            prc_log_table ( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, 'This employee does not exists.');
            RAISE;
  
        WHEN OTHERS THEN
            prc_log_table ( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, SQLCODE, SQLERRM);
            RAISE;
	END;
				
	PROCEDURE prc_remove_employee	( an_empId 	IN  employees.employee_id%TYPE )
	IS
        LS_PROC_NAME        VARCHAR2(32) := 'prc_remove_employee';
		le_invalid_employee    EXCEPTION;
	BEGIN
		IF fnc_employee_exists( an_empId ) THEN
			DELETE 
			FROM 	employees
			WHERE	employee_id = an_empId;
            
			prc_log_table ( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, '1 row deleted from EMPLOYEES');
		ELSE 
			RAISE le_invalid_employee;
		END IF;
        
    EXCEPTION
        WHEN le_invalid_employee THEN
            prc_log_table ( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, 'This employee does not exists.');
            RAISE;

        WHEN OTHERS THEN
            prc_log_table ( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, SQLCODE, SQLERRM);
            RAISE;
	END;
	
	FUNCTION fnc_employee_exists ( an_empId   IN  employees.employee_id%TYPE )
    RETURN BOOLEAN
	IS
		v_ok NUMBER := 0;
	BEGIN
		SELECT 1 
		INTO v_ok
		FROM employees
		WHERE employee_id = an_empId;
		
		RETURN TRUE;
		
    EXCEPTION
		WHEN NO_DATA_FOUND THEN
			RETURN FALSE;
	END;
	 
	FUNCTION fnc_employee_exists_sql ( an_empId   IN  employees.employee_id%TYPE )
    RETURN 	VARCHAR2
    IS
        v_check VARCHAR2(3) := 'NO';
	BEGIN
		IF ( fnc_employee_exists ( an_empId )) THEN
            v_check := 'YES';
        END IF;
        
		RETURN v_check;
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN v_check;
	END;
END;
/	