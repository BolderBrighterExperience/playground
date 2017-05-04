
CREATE OR REPLACE PACKAGE BODY hr_departments
IS
    --GS_PACK_NAME VARCHAR2(32) := 'hr_departments';
	PROCEDURE 	prc_add_department( an_dept_id 	    IN  departments.department_id%TYPE,
                                    as_dept_name 	IN  departments.department_name%TYPE,
                                    an_manager_id 	IN  departments.manager_id%TYPE,
                                    an_location_id 	IN  departments.location_id%TYPE )
	IS
        LS_PROC_NAME        VARCHAR2(32) := 'prc_add_department';
        invalid_department  EXCEPTION;
	BEGIN
		IF fnc_department_exists( an_dept_id ) THEN
            RAISE invalid_department;
		ELSE
			INSERT
			INTO    departments
			VALUES ( an_dept_id,
					 as_dept_name,
					 an_manager_id,
					 an_location_id );
                    
			prc_log_table(  seq_intern02_log_table.NEXTVAL, 
                            USER, 
                            SYSDATE,  
                            $$PLSQL_UNIT,
                            LS_PROC_NAME,
                            NULL, 
                            '1 row inserted into DEPARTMENTS.'
                        );
		END IF;
        
    EXCEPTION
        WHEN invalid_department THEN
            prc_log_table(  seq_intern02_log_table.NEXTVAL, 
                            USER, 
                            SYSDATE,  
                            $$PLSQL_UNIT,
                            LS_PROC_NAME,
                            NULL, 
                            'This department exists. Please insert another.' );
                           
        WHEN OTHERS THEN
            prc_log_table(   seq_intern02_log_table.NEXTVAL, 
                            USER, 
                            SYSDATE,  
                            $$PLSQL_UNIT,
                            LS_PROC_NAME,
                            SQLCODE, 
                            SQLERRM );
    END;
	
	PROCEDURE prc_adjust_department_data	( an_dept_id 	    IN  departments.department_id%TYPE,
											  as_dept_name 	    IN  departments.department_name%TYPE,
											  an_manager_id     IN 	departments.manager_id%TYPE,
											  an_location_id    IN	departments.location_id%TYPE )
	IS
        LS_PROC_NAME        VARCHAR2(32) := 'prc_adjust_department_data';
        invalid_department  EXCEPTION;
	BEGIN
        UPDATE	departments
        SET 	department_id = an_dept_id,
                department_name = as_dept_name,
                manager_id = an_manager_id,
                location_id = an_location_id
        WHERE 	department_id = an_dept_id;
        
        IF SQL%ROWCOUNT = 0 THEN
            RAISE invalid_department;
        END IF;
        
        prc_log_table	(   seq_intern02_log_table.NEXTVAL, 
                            USER, 
                            SYSDATE,  
                            $$PLSQL_UNIT,
                            LS_PROC_NAME,
                            NULL, 
                            '1 row updated into DEPARTMENTS.'
                        );
                      
    EXCEPTION
        WHEN invalid_department THEN
            prc_log_table	(   seq_intern02_log_table.NEXTVAL, 
                                USER, 
                                SYSDATE,  
                                $$PLSQL_UNIT,
                                LS_PROC_NAME,
                                NULL, 
                                'This department does not exists.' );
                                
        WHEN OTHERS THEN
            prc_log_table	(   seq_intern02_log_table.NEXTVAL, 
                                USER, 
                                SYSDATE,  
                                $$PLSQL_UNIT,
                                LS_PROC_NAME,
                                SQLCODE, 
                                SQLERRM );
	END;
	
	PROCEDURE prc_remove_department	( an_dept_id  IN  departments.department_id%TYPE )
	IS
        LS_PROC_NAME        VARCHAR2(32) := 'prc_remove_department';
        invalid_department  EXCEPTION;
	BEGIN
		IF ( fnc_department_exists ( an_dept_id ) ) THEN
			DELETE 
			FROM departments
			WHERE department_id = an_dept_id;
            
			prc_log_table	(   seq_intern02_log_table.NEXTVAL, 
                                USER, 
                                SYSDATE,  
                                $$PLSQL_UNIT,
                                LS_PROC_NAME,
                                NULL, 
                                '1 row deleted from DEPARTMENTS.'
                            );
			ELSE 
				RAISE invalid_department;
		END IF;
    EXCEPTION
        WHEN invalid_department THEN
            prc_log_table(   seq_intern02_log_table.NEXTVAL, 
                            USER, 
                            SYSDATE,  
                            $$PLSQL_UNIT,
                            LS_PROC_NAME,
                            null, 
                            'This department does not exists.' );
                            
        WHEN OTHERS THEN
            prc_log_table(  seq_intern02_log_table.NEXTVAL, 
                            USER, 
                            SYSDATE,  
                            $$PLSQL_UNIT,
                            LS_PROC_NAME, 
                            SQLCODE, 
                            SQLERRM );
	END;
	
	FUNCTION 	fnc_department_exists	( an_dept_id    IN  departments.department_id%TYPE )
	RETURN BOOLEAN
	IS 
		v_ok NUMBER := 0;
	BEGIN
		SELECT 1 
		INTO v_ok
		FROM departments
		WHERE department_id = an_dept_id;
		
		RETURN TRUE;
		
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN FALSE;
	END;
	
	FUNCTION 	fnc_department_exists_sql	( an_dept_id    IN  departments.department_id%TYPE )
	RETURN VARCHAR2
	IS
		v_check VARCHAR2(3) := 'NO';
	BEGIN
        IF ( fnc_department_exists ( an_dept_id )) THEN
            v_check := 'YES';
        END IF;
        
		RETURN v_check;
        
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN v_check;
	END;
END;
/	