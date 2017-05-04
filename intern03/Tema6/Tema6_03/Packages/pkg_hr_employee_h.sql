CREATE OR REPLACE PACKAGE pkg_hr_employee
IS
PROCEDURE prc_add_employee(
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
						   );
                           
                           
FUNCTION fnc_employee_exists( an_empid IN employees.employee_id%TYPE )
RETURN BOOLEAN;


FUNCTION fnc_employee_exists_sql( an_empid IN employees.employee_id%TYPE )
RETURN NUMBER;


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
                                   );
                                   
                                   
PROCEDURE prc_remove_employee(an_empid  IN employees.employee_id%TYPE );
                               

   
  
END pkg_hr_employee;
/
