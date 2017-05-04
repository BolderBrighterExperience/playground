CREATE OR REPLACE PACKAGE BODY pkg_hr_employees
IS
PROCEDURE prc_add_employee (
                             as_first_name     IN employees.first_name%TYPE,
                             as_last_name      IN  employees.last_name%TYPE,
                             as_email          IN  employees.email%TYPE,
                             as_phone_number   IN  employees.phone_number%TYPE,
                             ad_hire_date      IN employees.hire_date%TYPE,
                             as_job_id         IN  employees.job_id%TYPE,
                             an_salary         IN  employees.salary%TYPE,
                             an_commission_pct IN employees.commission_pct%TYPE,
                             an_manager_id     IN employees.manager_id%TYPE,
                             an_department_id  IN employees.department_id%TYPE
                             )
     
IS
    NOT_NULL EXCEPTION;
    PRAGMA EXCEPTION_INIT( NOT_NULL,-01400);
    
BEGIN
    INSERT 
    INTO employees  ( 
                       employee_id,
                       first_name,
                       last_name,
                       email,
                       phone_number,
                       hire_date,
                       job_id,
                       salary,
                       commission_pct,
                       manager_id,
                       department_id
                    )
    VALUES  (
            employees_seq.NEXTVAL,
            as_first_name,
            as_last_name,
            as_email,
            as_phone_number,
            ad_hire_date,
            as_job_id,
            an_salary,
            an_commission_pct,
            an_manager_id,
            an_department_id
             );

        prc_record_table( SQLCODE, SQLERRM, 'info','pkg_hr_employees.prc_add_employee' );
	
EXCEPTION 
	WHEN NOT_NULL THEN
		prc_record_table( 01400,'It cannot be null','error','pkg_hr_employees.prc_add_employee' );
		RAISE;
	WHEN OTHERS THEN
		prc_record_table( SQLCODE, SQLERRM,'error','pkg_hr_employees.prc_add_employee' );
		RAISE;
END prc_add_employee;
  
PROCEDURE prc_adjust_employee_data  ( 
                                      an_employee_id    IN  employees.employee_id%TYPE,
                                      as_first_name     IN employees.first_name%TYPE,
                                      as_last_name      IN  employees.last_name%TYPE,
                                      as_email          IN  employees.email%TYPE,
                                      as_phone_number   IN  employees.phone_number%TYPE,
                                      ad_hire_date      IN employees.hire_date%TYPE,
                                      as_job_id         IN  employees.job_id%TYPE,
                                      an_salary         IN  employees.salary%TYPE,
                                      an_commission_pct IN employees.commission_pct%TYPE,
                                      an_manager_id     IN employees.manager_id%TYPE,
                                      an_department_id  IN employees.department_id%TYPE
                                      )
IS
BEGIN
	
	UPDATE 	  employees 
	SET 	  first_name      = as_first_name,
              last_name       = as_last_name,
              email           = as_email,
              phone_number    = as_phone_number,
              hire_date       = ad_hire_date,
              job_id          = as_job_id,
              salary          = an_salary,
              commission_pct  = an_commission_pct,
              manager_id      = an_manager_id,
              department_id   = an_department_id   
     WHERE    employee_id 	  = an_employee_id;

	IF SQL%ROWCOUNT = 0 THEN  
    	RAISE_APPLICATION_ERROR(-20002, 'Employee_id' || an_employee_id || ' ' || 'doesn''t exists!');
	END IF; 
		prc_record_table( SQLCODE, SQLERRM, 'info','pkg_hr_employees.prc_adjust_employee_data' );
	
EXCEPTION
	WHEN OTHERS THEN 
        prc_record_table(SQLCODE, SQLERRM,'error','pkg_hr_employees.prc_adjust_employee_data' );
		RAISE;
END prc_adjust_employee_data;

PROCEDURE  prc_remove_employee (an_employee_id IN employees.employee_id%TYPE)
IS
BEGIN 
    
     DELETE FROM employees
     WHERE       employee_id = an_employee_id;

	
	IF SQL%ROWCOUNT = 0 THEN  
        RAISE_APPLICATION_ERROR(-20001, 'Employee_id '|| an_employee_id || ' ' || 'doesn''t exists!');
    END IF; 
		prc_record_table(SQLCODE, SQLERRM,'info','pkg_hr_employees.prc_remove_employee' );
	
EXCEPTION
    WHEN OTHERS THEN 
        prc_record_error();
		RAISE;
END prc_remove_employee;


FUNCTION fnc_employee_exists(an_employee_id  IN  employees.employee_id%TYPE)
RETURN BOOLEAN
IS
    ln_employee_id NUMBER;
BEGIN
    SELECT 	    employee_id 
    INTO 	    ln_employee_id 
    FROM 	    employees 
    WHERE       employee_id = an_employee_id;
    
    RETURN TRUE;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;

END fnc_employee_exists;  

FUNCTION fnc_employee_exists_sql(an_employee_id IN employees.employee_id%TYPE)
RETURN NUMBER
IS                           
    ln_employee_id NUMBER;
BEGIN

    IF fnc_employee_exists( an_employee_id ) THEN
        RETURN 1;
    END IF;

    RETURN 0;

END fnc_employee_exists_sql;
END;
/

