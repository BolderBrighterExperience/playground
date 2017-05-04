CREATE OR REPLACE PACKAGE pkg_hr_departments
IS

PROCEDURE prc_add_department(
                           	 an_deptid    IN departments.department_id%TYPE,
                             as_deptname  IN departments.department_name%TYPE,
                             an_managid   IN departments.manager_id%TYPE,
                             an_locid     IN departments.location_id%TYPE
						     );
                             
FUNCTION fnc_department_exists( an_deptid   IN departments.department_id%TYPE )
RETURN BOOLEAN;

FUNCTION fnc_department_exists_sql( an_deptid  IN departments.department_id%TYPE )
RETURN NUMBER;

PROCEDURE prc_adjust_department_data(
                                     an_deptid    IN departments.department_id%TYPE,
                                     as_deptname  IN departments.department_name%TYPE,
                                     an_managid   IN departments.manager_id%TYPE,
                                     an_locid     IN departments.location_id%TYPE
                                     );
                                    
PROCEDURE prc_remove_department( an_deptid   IN departments.department_id%TYPE );
                               

   
  
END pkg_hr_departments;
/
