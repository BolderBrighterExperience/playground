CREATE OR REPLACE PACKAGE pkg_hr_departments
AS
PROCEDURE prc_add_department(
                            as_department_name        IN departments.department_name%type,
                            an_manager_id             IN departments.manager_id%type,
                            an_location_id            IN departments.location_id%type
                            );
                            
PROCEDURE prc_adjust_department_data(
                                    an_department_id         IN departments.department_id%type,
                                    as_department_name       IN departments.department_name%type,
                                    an_manager_id            IN departments.manager_id%type,
                                    an_location_id           IN departments.location_id%type
                                    );    
                                    
PROCEDURE prc_remove_department( an_department_id     IN departments.department_id%type);

FUNCTION fnc_department_exists( an_department_id      IN departments.department_id%type)
RETURN BOOLEAN;

FUNCTION fnc_department_exists_sql( an_department_id  IN departments.department_id%type)
RETURN NUMBER;

END pkg_hr_departments;
/