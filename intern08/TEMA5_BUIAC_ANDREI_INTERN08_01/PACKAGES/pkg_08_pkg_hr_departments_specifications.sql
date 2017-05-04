--package specifications
CREATE OR REPLACE PACKAGE pkg_hr_departments 
IS  
   
   PROCEDURE prc_add_department(p_department_id IN NUMBER, 
	                              p_department_name IN VARCHAR2, 
	                              p_manager_id IN NUMBER, 
	                              p_location_id IN NUMBER); 
   PROCEDURE prc_adjust_department      (p_department_id IN NUMBER, 
	                                       p_department_name IN VARCHAR2, 
	                                       p_manager_id IN NUMBER, 
	                                       p_location_id IN NUMBER);
   PROCEDURE prc_remove_department (p_department_id IN NUMBER); 
    FUNCTION fnc_department_exists (p_department_id IN NUMBER) 
      RETURN BOOLEAN; 
   FUNCTION fnc_department_exists_sql(p_department_id IN NUMBER) 
      RETURN NUMBER;
END pkg_hr_departments; 
/