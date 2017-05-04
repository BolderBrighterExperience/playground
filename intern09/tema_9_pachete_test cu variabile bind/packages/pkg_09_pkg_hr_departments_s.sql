--package specification

CREATE OR REPLACE PACKAGE pkg_hr_departments AS

	PROCEDURE prc_add_department(	
                                  an_department_id       IN NUMBER, 
                                  as_department_name     IN VARCHAR2, 
                                  an_manager_id          IN NUMBER, 
                                  an_location_id         IN NUMBER
                                );

	PROCEDURE prc_adjust_department_data(	
                                          an_department_id     IN NUMBER, 
                                          as_department_name   IN VARCHAR2, 
                                          an_manager_id        IN NUMBER, 
                                          an_location_id       IN NUMBER
                                        );

	PROCEDURE prc_remove_department( an_department_id IN NUMBER );

	FUNCTION fnc_department_exists( an_department_id NUMBER )
    RETURN BOOLEAN;
	
	FUNCTION fnc_department_exists_sql( an_department_id NUMBER )
    RETURN NUMBER;
END pkg_hr_departments;
/
