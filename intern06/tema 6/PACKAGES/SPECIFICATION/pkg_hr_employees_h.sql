

CREATE OR REPLACE PACKAGE pkg_hr_employees 
IS
PROCEDURE prc_add_employee (
      an_employee_id            employees.employee_id%TYPE,
      as_first_name             employees.first_name%TYPE,
      as_last_name              employees.last_name%TYPE,
      as_email                  employees.email%TYPE,
      as_phone_number           employees.phone_number%TYPE,
      ad_hire_date              employees.hire_date%TYPE,
      as_job_id                 employees.job_id%TYPE,
      an_salary                 employees.salary%TYPE,
      an_commission_pct         employees.commission_pct%TYPE,
      an_manager_id             employees.manager_id%TYPE,
      an_department_id          employees.department_id%TYPE
    );	
PROCEDURE prc_adjust_employee_data (
       an_employee_id           employees.employee_id%TYPE,
      as_first_name             employees.first_name%TYPE,
      as_last_name              employees.last_name%TYPE,
      as_email                  employees.email%TYPE,
      as_phone_number           employees.phone_number%TYPE,
      ad_hire_date              employees.hire_date%TYPE,
      as_job_id                 employees.job_id%TYPE,
      an_salary                 employees.salary%TYPE,
      an_commission_pct         employees.commission_pct%TYPE,
      an_manager_id             employees.manager_id%TYPE,
      an_department_id          employees.department_id%TYPE
    );
PROCEDURE	prc_remove_employee (an_employee_id employees.employee_id%TYPE);
FUNCTION fnc_employee_exists (an_employee_id IN NUMBER) RETURN BOOLEAN;
FUNCTION fnc_employee_exists_sql (an_employee_id IN NUMBER) RETURN NUMBER;				
END pkg_hr_employees;  
/
