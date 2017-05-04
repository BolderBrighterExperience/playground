--package body
CREATE OR REPLACE PACKAGE BODY pkg_hr_departments
IS
				PROCEDURE prc_add_department (
                                p_department_id IN NUMBER, 
	                              p_department_name IN VARCHAR2, 
	                              p_manager_id IN NUMBER, 
	                              p_location_id IN NUMBER
                    )
				IS 
				eroare_department  EXCEPTION;
				BEGIN
					IF(fnc_department_exists(p_department_id)) THEN 
										RAISE eroare_department;
					ELSE
					INSERT INTO departments 
					VALUES (p_department_id,
                  p_department_name,
                  p_manager_id,
                  p_location_id);
				    prc_log_table (seq_08_log_table.NEXTVAL, 
										USER, 
										SYSDATE,  
										'pkg_hr_departments',
										'prc_add_department',
										SQLCODE, 
										'1 Rand inserat');
					END IF;
						EXCEPTION
              WHEN eroare_department THEN
                  prc_log_table (seq_08_log_table.NEXTVAL, 
									    	USER, 
									    	SYSDATE,  
											'pkg_hr_departments',
											'prc_add_department',
											SQLCODE, 
											'Departamentul trebuie sa fie unic');
											RAISE;
							WHEN OTHERS 
              THEN
                        prc_log_table (seq_08_log_table.NEXTVAL, 
												USER, 
												SYSDATE,  
												'pkg_hr_departments',
												'prc_add_department',
												SQLCODE, 
												'Alta eroare');	
												RAISE;
				END	prc_add_department;		


				PROCEDURE prc_adjust_department (
                                p_department_id IN NUMBER, 
	                              p_department_name IN VARCHAR2, 
	                              p_manager_id IN NUMBER, 
	                              p_location_id IN NUMBER 
                    )
				IS	
				eroare_department  EXCEPTION;
				BEGIN
						UPDATE departments
						   SET department_id = p_department_id,
						       department_name = p_department_name,
						       manager_id = p_manager_id,
						       location_id = p_location_id
					       WHERE department_id = p_department_id;

								IF SQL%ROWCOUNT = 0 
								THEN 
            			RAISE eroare_department;
								END IF;	

						   prc_log_table (seq_08_log_table.NEXTVAL, 
												USER, 
												SYSDATE,  
												'pkg_hr_departments',
												'prc_adjust_department',
												SQLCODE, 
												'1 Rand updatat');
									EXCEPTION
										WHEN eroare_department 	
                    THEN
										prc_log_table (seq_08_log_table.NEXTVAL, 
												USER, 
												SYSDATE,  
												'pkg_hr_departments',
												'prc_adjust_department',
												SQLCODE, 
												'Departamentul exista deja');
                      RAISE;
										WHEN OTHERS 
										THEN 
										prc_log_table (seq_08_log_table.NEXTVAL, 
												USER, 
												SYSDATE,  
												'pkg_hr_departments',
												'prc_adjust_department',
												SQLCODE, 
												'Alta eroare');
												RAISE;
				END prc_adjust_department;


				PROCEDURE	prc_remove_department ( p_department_id IN NUMBER)
				IS
          eroare_department  EXCEPTION;
				BEGIN
					IF fnc_department_exists(p_department_id) 
					THEN DELETE FROM departments
							   WHERE department_id = p_department_id;			
              	prc_log_table (seq_08_log_table.NEXTVAL, 
												USER, 
												SYSDATE,  
												'pkg_hr_departments',
												'prc_adjust_department',
												SQLCODE, 
												'1 Rand sters');
					ELSE 					
									RAISE eroare_department;
					END IF;
          EXCEPTION
										WHEN eroare_department 	
                    THEN
										prc_log_table (seq_08_log_table.NEXTVAL, 
												USER, 
												SYSDATE,  
												'pkg_hr_departments',
												'prc_adjust_department',
												SQLCODE, 
												'Departamentul nu exista');
                      RAISE;
										WHEN OTHERS 
										THEN 
										prc_log_table (seq_08_log_table.NEXTVAL, 
												USER, 
												SYSDATE,  
												'pkg_hr_departments',
												'prc_adjust_department',
												SQLCODE, 
												'Alta eroare');
												RAISE;
				END prc_remove_department;


				FUNCTION fnc_department_exists (p_department_id IN NUMBER)
					RETURN BOOLEAN
				AS
					v_res NUMBER(1) := 0;
				BEGIN
					SELECT 1 
				    INTO v_res
			        FROM departments
					WHERE department_id = p_department_id;

				RETURN TRUE;       
							EXCEPTION
								WHEN NO_DATA_FOUND 
								THEN RETURN FALSE;
		        END fnc_department_exists;


			    FUNCTION fnc_department_exists_sql (p_department_id IN NUMBER)
					RETURN NUMBER
				IS
					v_result NUMBER := 0;
				BEGIN
					SELECT 1 
					INTO v_result
					FROM departments
					WHERE department_id = p_department_id;
						IF ( v_result = 1) 
						THEN RETURN 1;
						ELSE RETURN 0;
						END IF;
							EXCEPTION
								WHEN NO_DATA_FOUND 
								THEN RETURN 0;
				END fnc_department_exists_sql;					
END pkg_hr_departments;
/ 