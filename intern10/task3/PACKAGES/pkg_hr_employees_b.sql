CREATE OR REPLACE PACKAGE BODY pkg_hr_employees
IS
    PROCEDURE prc_add_employee(an_employee_id    IN  employees.employee_id%TYPE,
                               as_first_name     IN  employees.first_name%TYPE,
                               as_last_name      IN  employees.last_name%TYPE,
                               as_email          IN  employees.email%TYPE,
                               as_phone_number   IN  employees.phone_number%TYPE,
                               ad_hire_date      IN  employees.hire_date%TYPE,
                               an_job_id         IN  employees.job_id%TYPE,
                               an_salary         IN  employees.salary%TYPE,
                               an_commission_pct IN  employees.commission_pct%TYPE,
                               an_manager_id     IN  employees.manager_id%TYPE,
                               an_department_id  IN  employees.department_id%TYPE
                               )
    IS
    BEGIN
        INSERT 
        INTO employees( employee_id,
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
        VALUES( an_employee_id,
                as_first_name,
                as_last_name,
                as_email,
                as_phone_number,
                ad_hire_date,
                an_job_id,
                an_salary,
                an_commission_pct,
                an_manager_id,
                an_department_id
                );
                
        prc_log('info','pkg_hr_employees.prc_add_employee');
    EXCEPTION
        WHEN OTHERS THEN
            prc_log('eroare','pkg_hr_employees.prc_add_employee');
            RAISE;
    END prc_add_employee;
    
    PROCEDURE prc_adjust_employee_data(an_employee_id    IN  employees.employee_id%TYPE,
                                       as_first_name     IN  employees.first_name%TYPE,
                                       as_last_name      IN  employees.last_name%TYPE,
                                       as_email          IN  employees.email%TYPE,
                                       as_phone_number   IN  employees.phone_number%TYPE,
                                       ad_hire_date      IN  employees.hire_date%TYPE,
                                       an_job_id         IN  employees.job_id%TYPE,
                                       an_salary         IN  employees.salary%TYPE,
                                       an_commission_pct IN  employees.commission_pct%TYPE,
                                       an_manager_id     IN  employees.manager_id%TYPE,
                                       an_department_id  IN  employees.department_id%TYPE)
    IS
    BEGIN
            UPDATE employees
            SET    first_name     = as_first_name, 
                   last_name      = as_last_name, 
                   email          = as_email, 
                   phone_number   = as_phone_number, 
                   hire_date      = ad_hire_date, 
                   job_id         = an_job_id,
                   salary         = an_salary,
                   commission_pct = an_commission_pct,
                   manager_id     = an_manager_id,
                   department_id  = an_department_id
            WHERE  employee_id    = an_employee_id;
            
            IF SQL%ROWCOUNT = 0 THEN
              RAISE NO_DATA_FOUND;
            END IF;
        
          prc_log('info','pkg_hr_employees.prc_adjust_employee_data');
                
    EXCEPTION
         WHEN NO_DATA_FOUND THEN
            prc_log('eroare','pkg_hr_employees.prc_adjust_employee_data');
        WHEN OTHERS THEN
            prc_log('eroare','pkg_hr_employees.prc_adjust_employee_data');
            RAISE;
    END prc_adjust_employee_data;
    
    PROCEDURE prc_remove_employee(an_employee_id employees.employee_id%TYPE)
    IS
    BEGIN
            DELETE
            FROM employees
            WHERE employee_id = an_employee_id;
            
            IF SQL%ROWCOUNT = 0 THEN
              RAISE NO_DATA_FOUND;
            END IF;
            
            prc_log('info','pkg_hr_employees.prc_remove_employee');
        
    EXCEPTION
        WHEN OTHERS THEN
            prc_log('eroare','pkg_hr_employees.prc_remove_employee');
            RAISE;
    END prc_remove_employee;
    
    FUNCTION fnc_employee_exists(an_employee_id employees.employee_id%TYPE)
    RETURN BOOLEAN
    IS
        ln_employee_id NUMBER;
    BEGIN 
        SELECT employee_id
        INTO   ln_employee_id
        FROM   employees 
        WHERE  employee_id = an_employee_id;
        
        RETURN TRUE;
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN FALSE;
    END fnc_employee_exists;
    
    FUNCTION fnc_employee_exists_sql(an_employee_id employees.employee_id%TYPE)
    RETURN VARCHAR2
    IS
        ln_employee_id NUMBER;
    BEGIN
        IF fnc_employee_exists(an_employee_id) THEN
            RETURN 'YES';
        ELSE
            RETURN 'NO';
        END IF;
    END fnc_employee_exists_sql;
   
END;
/







