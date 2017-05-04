CREATE OR REPLACE PACKAGE BODY pkg_hr_employees
IS
PROCEDURE prc_add_employee (
                          an_employee_id           employees.employee_id%TYPE,
                          as_first_name            employees.first_name%TYPE,
                          as_last_name             employees.last_name%TYPE,
                          as_email                 employees.email%TYPE,
                          as_phone_number          employees.phone_number%TYPE,
                          ad_hire_date             employees.hire_date%TYPE,
                          as_job_id                employees.job_id%TYPE,
                          an_salary                employees.salary%TYPE,
                          an_commission_pct        employees.commission_pct%TYPE,
                          an_manager_id            employees.manager_id%TYPE,
                          an_department_id         employees.department_id%TYPE
                            )
IS
invalid_employee  EXCEPTION;
BEGIN
    INSERT INTO employees VALUES  (
                                an_employee_id ,
                                as_first_name,
                                as_last_name,
                                as_email,
                                as_phone_number,
                                ad_hire_date,
                                as_job_id,
                                an_salary,
                                an_commission_pct,
                                an_manager_id,
                                an_department_id);
    prc_log_table ( seq_06_log_table.NEXTVAL, USER, SYSDATE, 'pkg_hr_employees','prc_add_employee', SQLCODE, '1 ROW INSERTED');                                
EXCEPTION
    WHEN invalid_employee THEN 
        prc_log_table(seq_06_log_table.NEXTVAL, USER, SYSDATE, 'pkg_hr_employees','prc_add_employee', SQLCODE,'EMPLOYEE EXISTS');
        RAISE;
        
    WHEN DUP_VAL_ON_INDEX THEN
        prc_log_table   (seq_06_log_table.NEXTVAL, USER, SYSDATE, 'pkg_hr_employees', 'prc_add_employee', SQLCODE, 'EMAIL MUST BE UNIQUE');
        RAISE;
        
    WHEN OTHERS THEN
        prc_log_table    (seq_06_log_table.NEXTVAL, USER, SYSDATE, 'pkg_hr_employees', 'prc_add_employee', SQLCODE, 'OTHER ERROR');
        RAISE;
        
END    prc_add_employee;        
    
    
    
PROCEDURE prc_adjust_employee_data (
                                      an_employee_id           employees.employee_id%TYPE,
                                      as_first_name            employees.first_name%TYPE,
                                      as_last_name             employees.last_name%TYPE,
                                      as_email                 employees.email%TYPE,
                                      as_phone_number          employees.phone_number%TYPE,
                                      ad_hire_date             employees.hire_date%TYPE,
                                      as_job_id                employees.job_id%TYPE,
                                      an_salary                employees.salary%TYPE,
                                      an_commission_pct        employees.commission_pct%TYPE,
                                      an_manager_id            employees.manager_id%TYPE,
                                      an_department_id         employees.department_id%TYPE
                                    )
IS    
    invalid_employee  EXCEPTION;
    
BEGIN
UPDATE employees SET    first_name = as_first_name,
                        last_name = as_last_name,
                        email = as_email,
                        phone_number = as_phone_number,
                        hire_date = ad_hire_date,
                        job_id = as_job_id,
                        salary = an_salary,
                        commission_pct = an_commission_pct,
                        manager_id = an_manager_id,
                        department_id = an_department_id
    WHERE  employee_id = an_employee_id;        
    IF SQL%ROWCOUNT = 0 
    THEN 
        RAISE invalid_employee;
    END IF;
            
    prc_log_table    (seq_06_log_table.NEXTVAL, USER, SYSDATE,'pkg_hr_employees','prc_adjust_employee_data',SQLCODE, '1 ROW UPDATED');

EXCEPTION
    WHEN invalid_employee THEN
        prc_log_table    (seq_06_log_table.NEXTVAL, USER, SYSDATE,'pkg_hr_employees','prc_adjust_employee_data',SQLCODE, 'THE EMPLOYEES DOES NOT EXISTS');
        RAISE;

    WHEN DUP_VAL_ON_INDEX THEN 
        prc_log_table    (seq_06_log_table.NEXTVAL, USER, SYSDATE,'pkg_hr_employees','prc_adjust_employee_data',SQLCODE,'EMAIL MUST BE UNIQUE');
        RAISE;    
        
    WHEN OTHERS THEN 
        prc_log_table    (seq_06_log_table.NEXTVAL, USER, SYSDATE,'pkg_hr_employees','prc_adjust_employee_data',SQLCODE,'OTHER ERROR');
        RAISE;
        
END prc_adjust_employee_data;
    
    

PROCEDURE    prc_remove_employee ( an_employee_id employees.employee_id%TYPE)
IS
invalid_employee EXCEPTION;
BEGIN
IF fnc_employee_exists(an_employee_id) 
THEN DELETE FROM employees
           WHERE employee_id = an_employee_id;
    prc_log_table (seq_06_log_table.NEXTVAL,USER, SYSDATE, 'pkg_hr_employees','prc_remove_employee', SQLCODE,'1 ROW DELETED');
ELSE 
    RAISE invalid_employee;
END IF;
EXCEPTION
    WHEN invalid_employee
    THEN prc_log_table (seq_06_log_table.NEXTVAL,USER, SYSDATE,'pkg_hr_employees','prc_remove_employee', SQLCODE,  'EMPLOYEE DOES NOT EXISTS');
         RAISE;
    WHEN OTHERS 
    THEN prc_log_table    (seq_06_log_table.NEXTVAL,USER,SYSDATE,'pkg_hr_employees','prc_adjust_employee_data',SQLCODE,'OTHER ERROR');
         RAISE;                                        
END prc_remove_employee;
    
    
FUNCTION fnc_employee_exists    (an_employee_id IN NUMBER)
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
IS
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
