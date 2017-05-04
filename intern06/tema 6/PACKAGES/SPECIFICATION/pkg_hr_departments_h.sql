



CREATE OR REPLACE PACKAGE pkg_hr_departments 
IS
PROCEDURE prc_add_department (
      an_department_id               departments.department_id%TYPE,
      as_department_name             departments.department_name%TYPE,
      an_manager_id                  departments.manager_id%TYPE,
      an_location_id                 departments.location_id%TYPE
    );	
PROCEDURE prc_adjust_department_data (
      an_department_id               departments.department_id%TYPE,
      as_department_name             departments.department_name%TYPE,
      an_manager_id                  departments.manager_id%TYPE,
      an_location_id                 departments.location_id%TYPE
    );
PROCEDURE prc_remove_department  (an_department_id departments.department_id%TYPE);
FUNCTION fnc_department_exists (an_department_id IN NUMBER) RETURN BOOLEAN;
FUNCTION fnc_department_exists_sql (an_department_id IN NUMBER) RETURN NUMBER;				
END pkg_hr_departments;  
/
