CREATE OR REPLACE PACKAGE hr_departments
IS
	PROCEDURE 	prc_add_department	( an_dept_id        IN  departments.department_id%TYPE,
                                      as_dept_name 	    IN  departments.department_name%TYPE,
                                      an_manager_id 	IN  departments.manager_id%TYPE,
                                      an_location_id 	IN  departments.location_id%TYPE 
                                    );
										
	PROCEDURE 	prc_adjust_department_data  ( an_dept_id 	    IN  departments.department_id%TYPE,
                                              as_dept_name  	IN  departments.department_name%TYPE,
                                              an_manager_id     IN  departments.manager_id%TYPE,
                                              an_location_id 	IN  departments.location_id%TYPE 
                                            );
											
	PROCEDURE 	prc_remove_department( an_dept_id    IN  departments.department_id%TYPE );
	
	FUNCTION 	fnc_department_exists( an_dept_id 	IN  departments.department_id%TYPE )
	RETURN BOOLEAN;
	
	FUNCTION 	fnc_department_exists_sql( an_dept_id    IN  departments.department_id%TYPE )
	RETURN VARCHAR2;
END;
/
