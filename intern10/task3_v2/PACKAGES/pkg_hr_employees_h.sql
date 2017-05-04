CREATE OR REPLACE PACKAGE pkg_hr_employees
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
                               );
                         
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
                                       an_department_id  IN  employees.department_id%TYPE
                                       );
                                   
    PROCEDURE prc_remove_employee(an_employee_id employees.employee_id%TYPE);

    FUNCTION fnc_employee_exists(an_employee_id employees.employee_id%TYPE)
    RETURN BOOLEAN;

    FUNCTION fnc_employee_exists_sql(an_employee_id employees.employee_id%TYPE)
    RETURN VARCHAR2;
      
END;
/
