--package specifications

CREATE OR REPLACE PACKAGE pkg_hr_employees 
IS  
    
   PROCEDURE prc_add_employee(p_employee_id IN NUMBER, 
	                            p_first_name IN VARCHAR2, 
	                            p_last_name IN VARCHAR2, 
	                            p_email IN VARCHAR2, 
	                            p_phone_number IN VARCHAR2, 
	                            p_hire_date IN DATE, 
	                            p_job_id IN VARCHAR2, 
	                            p_salary IN NUMBER, 
	                            p_commission_pct IN NUMBER, 
	                            p_manager_id IN NUMBER, 
	                            p_department_id IN NUMBER ); 
   PROCEDURE prc_adjust_employee     (p_employee_id IN NUMBER, 
                                       p_first_name IN VARCHAR2, 
	                                     p_last_name IN VARCHAR2, 
	                                     p_email IN VARCHAR2, 
	                                     p_phone_number IN VARCHAR2, 
	                                     p_hire_date IN DATE, 
	                                     p_job_id IN VARCHAR2, 
                                       p_salary IN NUMBER, 
	                                     p_commission_pct IN NUMBER, 
	                                     p_manager_id IN NUMBER, 
	                                     p_department_id IN NUMBER ); 
   PROCEDURE prc_remove_employee (p_employee_id IN NUMBER);
    FUNCTION fnc_employee_exists (p_employee_id IN NUMBER) 
      RETURN BOOLEAN; 
   FUNCTION fnc_employee_exists_sql(p_employee_id IN NUMBER) 
      RETURN NUMBER;
END pkg_hr_employees; 
/