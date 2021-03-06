CREATE OR REPLACE PACKAGE BODY pkg_hr_employees 
AS

PROCEDURE prc_add_employee (    
                            as_first_name         IN employees.first_name%type,
                            as_last_name          IN employees.last_name%type,
                            as_email              IN employees.email%type,
                            as_phone_number       IN employees.phone_number%type,
                            ad_hire_date          IN employees.hire_date%type,
                            an_job_id             IN employees.job_id%type,
                            an_salary             IN employees.salary%type,
                            an_commission_pct     IN employees.commission_pct%type,
                            an_manager_id         IN employees.manager_id%type,
                            an_department_id      IN employees.department_id%type
                            )
IS
    ls_procedure_name           VARCHAR2(50) := 'pkg_hr_employees.prc_add_employee';
    le_null_into_notnull        EXCEPTION;
    le_check_constraint         EXCEPTION;
    le_integrity_constraint     EXCEPTION;
    PRAGMA EXCEPTION_INIT( le_null_into_notnull, -1400);
    PRAGMA EXCEPTION_INIT( le_check_constraint, -2290);
    PRAGMA EXCEPTION_INIT( le_integrity_constraint, -2291);
BEGIN
    EXECUTE IMMEDIATE  'INSERT 
                        INTO employees ( 
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
                        VALUES ( 
                                :1,
                                :2,
                                :3,
                                :4,
                                :5,
                                :6,
                                :7,
                                :8,
                                :9,
                                :10,
                                :11
                                )'
    USING   employees_seq.NEXTVAL,
            as_first_name, 
            as_last_name, 
            as_email, 
            as_phone_number, 
            ad_hire_date, 
            an_job_id, 
            an_salary, 
            an_commission_pct, 
            an_manager_id, 
            an_department_id;

    prc_log_error( 'info', SQLCODE, SQLERRM, ls_procedure_name);

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        prc_log_error( 'error', SQLCODE, 'Employee_id and email must be unique values!', ls_procedure_name);
        RAISE;
        
    WHEN le_null_into_notnull THEN
        prc_log_error( 'error', SQLCODE, 'Columns: last_name, email, hire_date, job_id must be NOT NULL!', ls_procedure_name);
        RAISE;
        
    WHEN le_check_constraint THEN
        prc_log_error( 'error', SQLCODE, 'Salary must be greater than 0!', ls_procedure_name);
        RAISE;
        
    WHEN le_integrity_constraint THEN
        prc_log_error( 'error', SQLCODE, 'Department_id, manager_id, job_id are Foreign Keys. Values must exist already!', ls_procedure_name);
        RAISE;    
        
    WHEN OTHERS THEN
        prc_log_error( 'error', SQLCODE, SQLERRM, ls_procedure_name);
        RAISE_APPLICATION_ERROR(-20000,'An error has occurred inserting an employee!');    
        
END prc_add_employee;

PROCEDURE prc_adjust_employee_data (
                                    an_employee_id         IN employees.employee_id%type,
                                    as_first_name          IN employees.first_name%type,
                                    as_last_name           IN employees.last_name%type,
                                    as_email               IN employees.email%type,
                                    as_phone_number        IN employees.phone_number%type,
                                    ad_hire_date           IN employees.hire_date%type,
                                    an_job_id              IN employees.job_id%type,
                                    an_salary              IN employees.salary%type,
                                    an_commission_pct      IN employees.commission_pct%type,
                                    an_manager_id          IN employees.manager_id%type,
                                    an_department_id       IN employees.department_id%type
                                    )
IS
    ls_procedure_name           VARCHAR2(50) := 'pkg_hr_employees.prc_adjust_employee_data';
    le_update_to_null           EXCEPTION;
    le_check_constraint         EXCEPTION;
    le_integrity_constraint     EXCEPTION;
    PRAGMA EXCEPTION_INIT( le_update_to_null, -1407);
    PRAGMA EXCEPTION_INIT( le_check_constraint, -2290);
    PRAGMA EXCEPTION_INIT( le_integrity_constraint, -2291);
BEGIN
    EXECUTE IMMEDIATE  'UPDATE     employees 
                        SET     first_name        = :1,
                                last_name         = :2,
                                email             = :3,
                                phone_number      = :4,
                                hire_date         = :5,
                                job_id            = :6,
                                salary            = :7,
                                commission_pct    = :8,
                                manager_id        = :9,
                                department_id     = :10
                        WHERE   employee_id       = :11'
    USING   as_first_name, 
            as_last_name, 
            as_email, 
            as_phone_number, 
            ad_hire_date, 
            an_job_id, 
            an_salary, 
            an_commission_pct, 
            an_manager_id, 
            an_department_id,
            an_employee_id;
    
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001,'An error has occurred updating an employee!');    
    END IF;

    prc_log_error( 'info', SQLCODE, SQLERRM, ls_procedure_name);
   
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        prc_log_error( 'error', SQLCODE, 'Employee_id and email must be unique values!', ls_procedure_name);
        RAISE;
        
    WHEN le_update_to_null THEN
        prc_log_error( 'error', SQLCODE, 'Columns: last_name, email, hire_date, job_id must be NOT NULL!', ls_procedure_name);
        RAISE;
        
    WHEN le_integrity_constraint THEN
        prc_log_error( 'error', SQLCODE, 'Department_id, manager_id, job_id are Foreign Keys. Values must exist already!', ls_procedure_name);
        RAISE;
        
    WHEN le_check_constraint THEN
        prc_log_error( 'error', SQLCODE, 'Salary must be greater than 0!', ls_procedure_name);
        RAISE;
        
    WHEN OTHERS THEN
        prc_log_error( 'error', SQLCODE, SQLERRM, ls_procedure_name);
        RAISE_APPLICATION_ERROR(-20001,'An error has occurred updating an employee!');    
        
END prc_adjust_employee_data;

PROCEDURE prc_remove_employee( an_employee_id IN employees.employee_id%type)
IS
    ls_procedure_name           VARCHAR2(50) := 'pkg_hr_employees.prc_remove_employee';
    le_integrity_constraint     EXCEPTION;
PRAGMA EXCEPTION_INIT( le_integrity_constraint, -2292);
BEGIN
    EXECUTE IMMEDIATE  'DELETE
                        FROM    employees 
                        WHERE     employee_id = :1'
    USING an_employee_id;
        
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20002,'An error has occurred deleting an employee!');
    END IF;

    prc_log_error( 'info', SQLCODE, SQLERRM, ls_procedure_name);
    
EXCEPTION
    WHEN le_integrity_constraint THEN
        prc_log_error( 'error', SQLCODE, 'Integrity constraint violated!', ls_procedure_name);
        RAISE;
        
    WHEN OTHERS THEN
        prc_log_error( 'error', SQLCODE, SQLERRM, ls_procedure_name);
        RAISE_APPLICATION_ERROR(-20002,'An error has occurred deleting an employee!');    
        
END prc_remove_employee;

FUNCTION fnc_employee_exists(an_employee_id IN employees.employee_id%type)
RETURN BOOLEAN
IS
    ls_function_name        VARCHAR2(50) := 'pkg_hr_employees.fnc_employee_exists';
    ln_employee_id          employees.employee_id%type;
BEGIN
    EXECUTE IMMEDIATE 'SELECT employee_id 
                        FROM     employees 
                        WHERE     employee_id = :1' 
    INTO ln_employee_id  USING an_employee_id;
    
    RETURN TRUE;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        prc_log_error( 'error', SQLCODE, 'Employee_id doesn t exist!', ls_function_name );
        RETURN FALSE;

END fnc_employee_exists;

FUNCTION fnc_employee_exists_sql( an_employee_id IN employees.employee_id%type)
RETURN NUMBER
IS
    ls_function_name        VARCHAR2(50) := 'pkg_hr_employees.fnc_employee_exists_sql';
    ln_employee_id          employees.employee_id%type;
BEGIN
    IF fnc_employee_exists(an_employee_id) THEN
        RETURN 1;
    END IF;
    
    RETURN 0;    
    
END fnc_employee_exists_sql;

END pkg_hr_employees;
/
