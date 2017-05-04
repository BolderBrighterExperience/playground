CREATE OR REPLACE PACKAGE pkg_hr_departments 
IS
PROCEDURE prc_add_department  (
                               as_department_name  IN   departments.department_name%TYPE,
                               an_manager_id       IN   departments.manager_id%TYPE,
                               an_location_id      IN   departments.location_id%TYPE
                               );

PROCEDURE prc_adjust_department_data    ( 
                                         an_department_id    IN   departments.department_id%TYPE,
                                         as_department_name  IN   departments.department_name%TYPE,
                                         an_manager_id       IN   departments.manager_id%TYPE,
                                         an_location_id      IN   departments.location_id%TYPE
                                         );
                              
PROCEDURE prc_remove_department  (
                                  an_department_id    IN   departments.department_id%TYPE,
                                  as_department_name  IN   departments.department_name%TYPE,
                                  an_manager_id       IN   departments.manager_id%TYPE,
                                  an_location_id      IN   departments.location_id%TYPE
                                  );
                              
FUNCTION fnc_department_exists (an_department_id  IN departments.department_id%TYPE)
RETURN BOOLEAN;
FUNCTION fnc_department_exists_sql(an_department_id  IN departments.department_id%TYPE)
RETURN NUMBER;                              
                                 
END pkg_hr_departments;
/

