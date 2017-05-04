--package body

CREATE OR REPLACE PACKAGE BODY pkg_hr_departments 
AS
    PROCEDURE prc_add_department (
                                    an_department_id         IN NUMBER, 
                                    as_department_name       IN VARCHAR2, 
                                    an_manager_id            IN NUMBER, 
                                    an_location_id           IN NUMBER
                                 ) 
	IS
    invalid_department EXCEPTION;
    BEGIN
	    IF(fnc_department_exists(an_department_id)) THEN
		    RAISE invalid_department;
	    ELSE
            EXECUTE IMMEDIATE
      		'INSERT INTO departments	
      		VALUES (
                    :id, 
                    :department_name, 
                    :manager_id, 
                    :location_id
                   )'
             USING
                    an_department_id,
                    as_department_name,
                    an_manager_id,
                    an_location_id;
                        
            prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'1 rand inserat','package_emp_insert');
		END IF;
    EXCEPTION
        WHEN invalid_department THEN
            prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'Departamentul exista deja!','package_dept_insert');
        RAISE;
                  
        WHEN OTHERS THEN
            prc_log_table(seq_09_errorlog_id.NEXTVAL,SQLCODE,SYSDATE,SQLERRM,'package_dept_insert');     
        RAISE;                      
    END; 
 
    PROCEDURE prc_adjust_department_data(
                                            an_department_id          IN NUMBER, 
                                            as_department_name        IN VARCHAR2, 
                                            an_manager_id             IN NUMBER, 
                                            an_location_id            IN NUMBER
                                        )
    IS
    invalid_department EXCEPTION;
    BEGIN
            EXECUTE IMMEDIATE
            'UPDATE 	departments 
			SET 	 
				  department_name = :department_name, 
				  manager_id      = :manager_id, 
				  location_id     = :location_id
			WHERE department_id   = :department_id'
            
            USING             
                   as_department_name, 
                   an_manager_id,     
                   an_location_id,
                   an_department_id;
                    
      
	    IF SQL%ROWCOUNT=0 THEN
      		RAISE invalid_department;
        END IF;
        
        prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'1 rand updatat','package_emp_update');
                                 
    EXCEPTION
        WHEN invalid_department THEN
            prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'Departamentul nu exista!','package_dept_update');
        RAISE;
                  
        WHEN OTHERS THEN
            prc_log_table(seq_09_errorlog_id.NEXTVAL,SQLCODE,SYSDATE,SQLERRM,'package_dept_update');
        RAISE;
    END;

    PROCEDURE prc_remove_department( an_department_id IN NUMBER )
    IS
    invalid_department EXCEPTION;
    BEGIN
	    IF(fnc_department_exists(an_department_id)) THEN
            EXECUTE IMMEDIATE
      		'DELETE 
			 FROM departments
      		 WHERE department_id = :department_id'
            
            USING an_department_id;
            
            prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'Inregistrare stearsa','package_dept_delete'); 
            
        ELSE 
             RAISE invalid_department;
        END IF;
        
    EXCEPTION
        WHEN invalid_department THEN
            prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'Nu s-a sters nici o intregistrare','package_dept_delete'); 
        RAISE;
                      
        WHEN OTHERS THEN
            prc_log_table(seq_09_errorlog_id.NEXTVAL,SQLCODE,SYSDATE,SQLERRM,'package_dept_delete'); 
        RAISE;
    END;

    FUNCTION fnc_department_exists( an_department_id NUMBER )
    RETURN BOOLEAN
    AS
		v_dept_id NUMBER(1) :=0;
    BEGIN
		SELECT 1
		INTO v_dept_id
        FROM departments
		WHERE department_id = an_department_id;
      
		RETURN TRUE;
        
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			RETURN FALSE;
	END;

    FUNCTION fnc_department_exists_sql( an_department_id NUMBER )
    RETURN NUMBER
    AS
		v_dept_id NUMBER(1) :=0;
    BEGIN
		SELECT 1
		INTO v_dept_id
        FROM departments
		WHERE department_id = an_department_id;
      
		RETURN 1;
		
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			RETURN 0;
	END;
 END pkg_hr_departments;
/  

