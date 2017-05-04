CREATE OR REPLACE PACKAGE pkg_hr_employees 
AS
PROCEDURE prc_add_employee (
                            as_first_name       IN employees.first_name%type,
                            as_last_name        IN employees.last_name%type,
                            as_email            IN employees.email%type,
                            as_phone_number     IN employees.phone_number%type,
                            ad_hire_date        IN employees.hire_date%type,
                            an_job_id           IN employees.job_id%type,
                            an_salary           IN employees.salary%type,
                            an_commission_pct   IN employees.commission_pct%type,
                            an_manager_id       IN employees.manager_id%type,
                            an_department_id    IN employees.department_id%type
                            );

PROCEDURE prc_adjust_employee_data (
                                    an_employee_id      IN employees.employee_id%type,
                                    as_first_name       IN employees.first_name%type,
                                    as_last_name        IN employees.last_name%type,
                                    as_email            IN employees.email%type,
                                    as_phone_number     IN employees.phone_number%type,
                                    ad_hire_date        IN employees.hire_date%type,
                                    an_job_id           IN employees.job_id%type,
                                    an_salary           IN employees.salary%type,
                                    an_commission_pct   IN employees.commission_pct%type,
                                    an_manager_id       IN employees.manager_id%type,
                                    an_department_id    IN employees.department_id%type
                                    );

PROCEDURE prc_remove_employee( an_employee_id   IN employees.employee_id%type);

FUNCTION fnc_employee_exists( an_employee_id    IN employees.employee_id%type)
RETURN BOOLEAN;

FUNCTION fnc_employee_exists_sql( an_employee_id IN employees.employee_id%type)
RETURN NUMBER;

END pkg_hr_employees;
/
