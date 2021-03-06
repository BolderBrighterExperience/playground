CREATE OR REPLACE PACKAGE BODY pkg_hr_employee
IS


PROCEDURE prc_add_employee (
                             an_empid    IN employees.employee_id%TYPE,
                             as_fname    IN employees.first_name%TYPE,
                             as_lname    IN employees.last_name%TYPE,
                             as_email    IN employees.email%TYPE,
                             as_pnumber  IN employees.phone_number%TYPE,
                             ad_hdate    IN employees.hire_date%TYPE,
                             as_jobid    IN employees.job_id%TYPE,
                             an_salary   IN employees.salary%TYPE,
                             an_commpct  IN employees.commission_pct%TYPE,
                             an_managid  IN employees.manager_id%TYPE,
                             an_deptid   IN employees.department_id%TYPE
						    )
IS
    insert_null_excep         EXCEPTION;
    PRAGMA EXCEPTION_INIT(insert_null_excep,-1400);
    insert_constraint_invalid EXCEPTION;
    PRAGMA EXCEPTION_INIT(insert_constraint_invalid,-2290);
BEGIN
    EXECUTE IMMEDIATE  'INSERT 
                        INTO employees(
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
                        VALUES(
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
    USING an_empid,
           as_fname,
           as_lname,
           as_email,
           as_pnumber,
           ad_hdate,
           as_jobid,
           an_salary,
           an_commpct,
           an_managid,
           an_deptid;

    proc_log(SQLCODE,'Inserarea s-a realizat cu succes',' info ', ' pkg_hr_employee.prc_add_employee');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        proc_log(SQLCODE,' Exista un angajat cu acest ID. ',' error ', ' pkg_hr_employee.prc_add_employee');
        RAISE;      
    WHEN insert_null_excep THEN
        proc_log(SQLCODE,' Campurile: EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID trebuie completate. ',' error ', ' pkg_hr_employee.prc_add_employee');
        RAISE;    
    WHEN  insert_constraint_invalid THEN
        proc_log(SQLCODE,' Nu sunt respectate constrangerile. ',' error ', ' pkg_hr_employee.prc_add_employee');
        RAISE;      
    WHEN OTHERS THEN
        proc_log(SQLCODE,SQLERRM,' error ', ' pkg_hr_employee.prc_add_employee');
        RAISE;
       
END prc_add_employee;


FUNCTION fnc_employee_exists( an_empid IN employees.employee_id%TYPE )
RETURN BOOLEAN
IS
    ln_emp NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'SELECT 	1 
                       FROM 	employees 
                       WHERE 	employee_id = :1' INTO 	ln_emp
    USING an_empid; 
    
    RETURN TRUE;
    
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END fnc_employee_exists;


FUNCTION fnc_employee_exists_sql( an_empid IN employees.employee_id%TYPE )
RETURN NUMBER
IS
    ln_emp NUMBER;
BEGIN
    EXECUTE IMMEDIATE 'SELECT 	1 
                       FROM 	employees 
                       WHERE 	employee_id = :1' INTO 	ln_emp
    USING an_empid;
    
    RETURN 1;
    
       
EXCEPTION
    WHEN NO_DATA_FOUND THEN
		RETURN 0;

END fnc_employee_exists_sql;


PROCEDURE prc_adjust_employee_data(
                                   an_empid    IN employees.employee_id%TYPE,
                                   as_fname    IN employees.first_name%TYPE,
                                   as_lname    IN employees.last_name%TYPE,
                                   as_email    IN employees.email%TYPE,
                                   as_pnumber  IN employees.phone_number%TYPE,
                                   ad_hdate    IN employees.hire_date%TYPE,
                                   as_jobid    IN employees.job_id%TYPE,
                                   an_salary   IN employees.salary%TYPE,
                                   an_commpct  IN employees.commission_pct%TYPE,
                                   an_managid  IN employees.manager_id%TYPE,
                                   an_deptid   IN employees.department_id%TYPE
                                   )
                                   
IS
    update_null_excep EXCEPTION;
    PRAGMA EXCEPTION_INIT(update_null_excep,-1400);
BEGIN
    
    EXECUTE IMMEDIATE 'UPDATE employees
                       SET first_name     = :1,
                       last_name      = :2,
                       email          = :3,
                       phone_number   = :4,
                       hire_date      = :5,
                       job_id         = :6,
                       salary         = :7,
                       commission_pct = :8,
                       manager_id     = :9,
                       department_id  = :10
                            
                       WHERE employee_id  = :11'
    USING  as_fname,
           as_lname,
           as_email,
           as_pnumber,
           ad_hdate,
           as_jobid,
           an_salary,
           an_commpct,
           an_managid,
           an_deptid,
           an_empid;
        
        IF SQL%ROWCOUNT  = 0 THEN
            RAISE no_data_found;
        END IF;
        
        proc_log(SQLCODE,'Update-ul s-a realizat cu succes',' info','pkg_hr_employee.prc_adjust_employee_data');

EXCEPTION
	WHEN no_data_found THEN
		proc_log(SQLCODE,'Nu exista acest ID',' error','pkg_hr_employee.prc_adjust_employee_data');
		RAISE;
	WHEN update_null_excep THEN
		proc_log(SQLCODE,' Campurile: EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID trebuie completate.',' error','pkg_hr_employee.prc_adjust_employee_data');
    RAISE;  
	WHEN OTHERS THEN
		proc_log(SQLCODE,SQLERRM,' error','pkg_hr_employee.prc_adjust_employee_data');
		RAISE;
END prc_adjust_employee_data;


PROCEDURE prc_remove_employee( an_empid  IN employees.employee_id%TYPE )
IS
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM employees
                       WHERE employee_id = :1'
    USING an_empid;
    
    IF SQL%ROWCOUNT  = 0 THEN
        RAISE no_data_found;
    END IF;
    
    proc_log(SQLCODE,'Stergerea s-a realizat cu succes.',' info','pkg_hr_employee.prc_remove_employee');
    
EXCEPTION
  WHEN no_data_found THEN
    proc_log(SQLCODE,' Nu exista acest ID ',' error','pkg_hr_employee.prc_remove_employee');
    RAISE;
	WHEN OTHERS THEN
		proc_log(SQLCODE,SQLERRM,' error','pkg_hr_employee.prc_remove_employee');
		RAISE;
END prc_remove_employee;

END pkg_hr_employee; 
/
