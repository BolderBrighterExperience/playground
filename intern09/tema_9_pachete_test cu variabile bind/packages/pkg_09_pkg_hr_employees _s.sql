--package specification

CREATE OR REPLACE PACKAGE pkg_hr_employees AS
    PROCEDURE prc_add_employee(
                                 an_employee_id      IN NUMBER, 
                                 as_first_name       IN VARCHAR2, 
                                 as_last_name        IN VARCHAR2, 
                                 as_email            IN VARCHAR2, 
                                 as_phone_number     IN VARCHAR2, 
                                 ad_hire_date        IN DATE, 
                                 as_job_id           IN VARCHAR2, 
                                 an_salary           IN NUMBER, 
                                 an_commission_pct   IN NUMBER, 
                                 an_manager_id       IN NUMBER, 
                                 an_department_id    IN NUMBER
                              );
	
	PROCEDURE prc_adjust_employee_data
                              (
                                 an_employee_id      IN NUMBER, 
                                 as_first_name       IN VARCHAR2, 
                                 as_last_name        IN VARCHAR2, 
                                 as_email            IN VARCHAR2, 
                                 as_phone_number     IN VARCHAR2, 
                                 ad_hire_date        IN DATE, 
                                 as_job_id           IN VARCHAR2, 
                                 an_salary           IN NUMBER, 
                                 an_commission_pct   IN NUMBER, 
                                 an_manager_id       IN NUMBER, 
                                 an_department_id    IN NUMBER
                              );

	PROCEDURE prc_remove_employee( an_employee_id IN NUMBER );
	
	FUNCTION fnc_employee_exists( an_employee_id NUMBER )
    RETURN BOOLEAN;
	
	FUNCTION fnc_employee_exists_sql( an_employee_id NUMBER )
    RETURN NUMBER;
END pkg_hr_employees;
/
