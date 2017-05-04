CREATE OR REPLACE PACKAGE BODY pkg_hr_employees 
IS
PROCEDURE prc_add_employee (
    an_employee_id IN NUMBER, 
	as_first_name IN VARCHAR2, 
    as_last_name IN VARCHAR2, 
    as_email IN VARCHAR2, 
    as_phone_number IN VARCHAR2, 
    ad_hire_date IN DATE, 
    as_job_id IN VARCHAR2, 
    an_salary IN NUMBER, 
    an_commission_pct IN NUMBER, 
    an_manager_id IN NUMBER, 
    an_department_id IN NUMBER)
IS 
    pk_duplicate_emp  EXCEPTION;
    PRAGMA EXCEPTION_INIT(pk_duplicate_emp,-1);
BEGIN
	EXECUTE IMMEDIATE
        'INSERT INTO employees VALUES (
            :employee_id,
            :first_name,
            :last_name,
            :email,
            :phone_number,
            :hire_date,
            :job_id,p_salary,
            :commission_pct,
            :manager_id,
            :department_id)'
    USING   an_employee_id, 
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
			prc_log_table	( USER,SYSDATE,'pkg_hr_employees','prc_add_employee',SQLCODE,'1 Rand INSERAT');
            
EXCEPTION
    WHEN pk_duplicate_emp 
		THEN 
		prc_log_table	( USER,SYSDATE,'pkg_hr_employees','prc_add_employee',SQLCODE, 'Angajatul exista');
		RAISE;
	WHEN DUP_VAL_ON_INDEX 
		THEN
		prc_log_table	( USER, SYSDATE,'pkg_hr_employees','prc_add_employee',SQLCODE, 'Email-ul trebuie sa fie unic');
		RAISE;
	WHEN OTHERS 
		THEN
        prc_log_table	(USER, SYSDATE,'pkg_hr_employees','prc_add_employee',SQLCODE, 'Alta eroare');
		RAISE;
END	prc_add_employee;		


PROCEDURE prc_adjust_employee_data ( 
    an_employee_id IN NUMBER, 
    as_first_name IN VARCHAR2, 
    as_last_name IN VARCHAR2, 
    as_email IN VARCHAR2, 
    as_phone_number IN VARCHAR2, 
    ad_hire_date IN DATE, 
    as_job_id IN VARCHAR2, 
    an_salary IN NUMBER, 
    an_commission_pct IN NUMBER, 
    an_manager_id IN NUMBER, 
    an_department_id IN NUMBER )
IS	
    pk_duplicate_emp  EXCEPTION;
BEGIN
    EXECUTE IMMEDIATE
        'UPDATE employees SET  
                           employee_id = :employee_id,
                           first_name = :first_name,
                           last_name = :last_name,
                           email = :email,
                           phone_number = :phone_number,
                           hire_date = :hire_date,
                           job_id = :job_id,
                           salary = :salary,
                           commission_pct = :commission_pct,
                           manager_id = :manager_id,
                           department_id = :department_id
        WHERE employee_id= :employee_id' 
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
IF SQL%ROWCOUNT = 0 
    THEN 
        RAISE pk_duplicate_emp;
END IF;									
        prc_log_table	(USER, SYSDATE,'pkg_hr_employees','prc_adjust_employee_data',SQLCODE, '1 Rand UPDATAT');
        
EXCEPTION
	WHEN pk_duplicate_emp 
		THEN
		prc_log_table	(USER,SYSDATE,'pkg_hr_employees','prc_adjust_employee_data',SQLCODE, 'Angajatul nu exista');
		RAISE;
	WHEN DUP_VAL_ON_INDEX 
		THEN 
        prc_log_table	(USER, SYSDATE,'pkg_hr_employees','prc_adjust_employee_data',SQLCODE, 'Email-ul trebuie sa fie unic');
		RAISE;												
	WHEN OTHERS 
		THEN 
		prc_log_table (USER, SYSDATE,'pkg_hr_employees','prc_adjust_employee_data',SQLCODE, 'Alta eroare');
		RAISE;
END prc_adjust_employee_data;


PROCEDURE prc_remove_employee ( an_employee_id IN NUMBER)
IS
	pk_duplicate_emp EXCEPTION;
BEGIN
	EXECUTE IMMEDIATE
        'DELETE FROM employees
         WHERE employee_id = :employee_id'
	USING an_employee_id;
		prc_log_table (USER, SYSDATE,'pkg_hr_employees','prc_remove_employee',SQLCODE, '1 Rand sters'); 
		RAISE pk_duplicate_emp;
		
EXCEPTION
	WHEN pk_duplicate_emp
		THEN 
		prc_log_table(USER, SYSDATE,'pkg_hr_employees','prc_remove_employee',SQLCODE, 'Angajatul nu exista');
		RAISE;
	WHEN OTHERS 
		THEN 
        prc_log_table(USER, SYSDATE,'pkg_hr_employees','prc_adjust_employee_data',SQLCODE, 'Alta eroare');
		RAISE;										
END prc_remove_employee;


FUNCTION fnc_employee_exists (an_employee_id IN NUMBER)
	RETURN BOOLEAN
		AS
			v_res NUMBER(1) := 0;
	BEGIN
		SELECT 1 
		INTO v_res
		FROM employees
			WHERE employee_id = an_employee_id;
			RETURN TRUE;       
				EXCEPTION
					WHEN NO_DATA_FOUND 
						THEN RETURN FALSE;
END fnc_employee_exists;


FUNCTION fnc_employee_exists_sql (an_employee_id IN NUMBER)
	RETURN NUMBER
		AS
			v_result NUMBER := 0;
	BEGIN
		SELECT 1 
		INTO v_result
		FROM employees
			WHERE employee_id = an_employee_id;
				IF ( v_result = 1) 
					THEN RETURN 1;
				ELSE RETURN 0;
				END IF;
			EXCEPTION
				WHEN NO_DATA_FOUND 
					THEN RETURN 0;
END fnc_employee_exists_sql;
	
END pkg_hr_employees;
/ 
