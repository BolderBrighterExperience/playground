
--package body
CREATE OR REPLACE PACKAGE BODY pkg_hr_employees 
AS
    PROCEDURE prc_add_employee(
                                an_employee_id       IN NUMBER, 
                                as_first_name        IN VARCHAR2, 
                                as_last_name         IN VARCHAR2, 
                                as_email             IN VARCHAR2, 
                                as_phone_number      IN VARCHAR2, 
                                ad_hire_date         IN DATE, 
                                as_job_id            IN VARCHAR2, 
                                an_salary            IN NUMBER, 
                                an_commission_pct    IN NUMBER, 
                                an_manager_id        IN NUMBER, 
                                an_department_id     IN NUMBER
                              ) 
	IS
    invalid_employee EXCEPTION;
    BEGIN
	    IF(fnc_employee_exists(an_employee_id)) THEN
		    RAISE invalid_employee;
                
	    ELSE
            EXECUTE IMMEDIATE
      		'INSERT INTO employees	
      		VALUES (:employee_id,
					:first_name,
					:last_name,
					:email,
					:phone_number,
					:hire_date,
					:job_id,
					:salary,
					:commission_pct,
					:manager_id,
					:department_id)'
             USING  
                    an_employee_id,
					as_first_name,
					as_last_name,
					as_email,
					as_phone_number,
					ad_hire_date,
					as_job_id,
					an_salary,
					an_commission_pct,
					an_manager_id,
					an_department_id;
                    
          prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'1 rand inserat','package_emp_insert');
		END IF;
    
	EXCEPTION
        WHEN invalid_employee THEN
            prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'Angajatul exista deja!','package_emp_insert');
        RAISE;
        
		WHEN OTHERS THEN
			prc_log_table(seq_09_errorlog_id.NEXTVAL,SQLCODE,SYSDATE,SQLERRM,'package_emp_insert');        
        RAISE;
    END; 
 
    PROCEDURE prc_adjust_employee_data(
                                        an_employee_id       IN NUMBER, 
                                        as_first_name        IN VARCHAR2, 
                                        as_last_name         IN VARCHAR2, 
                                        as_email             IN VARCHAR2, 
                                        as_phone_number      IN VARCHAR2, 
                                        ad_hire_date         IN DATE, 
                                        as_job_id            IN VARCHAR2, 
                                        an_salary            IN NUMBER, 
                                        an_commission_pct    IN NUMBER, 
                                        an_manager_id        IN NUMBER, 
                                        an_department_id     IN NUMBER
                                       )
    IS
    invalid_employee EXCEPTION;
    BEGIN
            EXECUTE IMMEDIATE
			'UPDATE 	employees 
			 SET 	
				  first_name     = :first_name,
				  last_name      = :last_name,
				  email          = :email,
				  phone_number   = :phone_number,
				  hire_date      = :hire_date,
				  job_id         = :job_id,
				  salary         = :salary,
				  commission_pct = :commission_pct,
				  manager_id     = :manager_id,
				  department_id  = :department_id  
			WHERE employee_id    = :employee_id'
            
            USING
                  as_first_name,
				  as_last_name,      
				  as_email,          
				  as_phone_number,
				  ad_hire_date,     
				  as_job_id,         
				  an_salary,         
				  an_commission_pct, 
				  an_manager_id,     
				  an_department_id,
                  an_employee_id;
            
        IF SQL%ROWCOUNT=0 THEN
      		RAISE invalid_employee;         
        END IF;
        
         prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'1 rand updatat','package_emp_update');
        
        
	EXCEPTION
      WHEN invalid_employee THEN
        prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'Nu exista angajatul','package_emp_update');
      RAISE;
      
	  WHEN OTHERS THEN
		prc_log_table(seq_09_errorlog_id.NEXTVAL,SQLCODE,SYSDATE,SQLERRM,'package_emp_update'); 
      RAISE;
                  
    END;

    PROCEDURE prc_remove_employee( an_employee_id IN NUMBER )
    IS
    invalid_employee EXCEPTION;
    BEGIN
	    IF(fnc_employee_exists(an_employee_id)) THEN
            EXECUTE IMMEDIATE
      		'DELETE 
             FROM employees
      		 WHERE employee_id=:employee_id'
             
             USING
                    an_employee_id;
                    
          prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'1 rand sters','package_emp_delete');
        ELSE 
            RAISE invalid_employee;
        END IF;
    EXCEPTION
        WHEN invalid_employee THEN
            prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'Nu s-a sters nici o intregistrare','package_emp_delete');
        RAISE;
        WHEN OTHERS THEN
            prc_log_table(seq_09_errorlog_id.NEXTVAL,SQLCODE,SYSDATE,SQLERRM,'package_emp_delete'); 
        RAISE;
    END;

    FUNCTION fnc_employee_exists( an_employee_id NUMBER )
    RETURN BOOLEAN
    AS
		v_emp_id NUMBER(1) :=0;
    BEGIN
		SELECT 1
		INTO v_emp_id
        FROM employees
		WHERE employee_id = an_employee_id;
      
		RETURN TRUE;
		
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			RETURN FALSE;
	END;

    FUNCTION fnc_employee_exists_sql( an_employee_id NUMBER )
    RETURN NUMBER
    AS
		v_emp_id NUMBER(1) :=0;
    BEGIN
		SELECT 1
		INTO v_emp_id
        FROM employees
		WHERE employee_id = an_employee_id;
      
	    RETURN 1;
		
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			RETURN 0;
	END;
 END pkg_hr_employees;
/  