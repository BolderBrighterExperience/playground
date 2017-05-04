--package body
CREATE OR REPLACE PACKAGE BODY pkg_hr_employees 
IS
				PROCEDURE prc_add_employee (
                              p_employee_id IN NUMBER, 
	                            p_first_name IN VARCHAR2, 
	                            p_last_name IN VARCHAR2, 
	                            p_email IN VARCHAR2, 
	                            p_phone_number IN VARCHAR2, 
	                            p_hire_date IN DATE, 
	                            p_job_id IN VARCHAR2, 
	                            p_salary IN NUMBER, 
	                            p_commission_pct IN NUMBER, 
	                            p_manager_id IN NUMBER, 
	                            p_department_id IN NUMBER
                    )
				IS 
				eroare_employee  EXCEPTION;
				BEGIN
					IF(fnc_employee_exists(p_employee_id)) 
					THEN 
						RAISE eroare_employee;
					ELSE
					INSERT INTO employees 
					VALUES (p_employee_id,
                  p_first_name,
                  p_last_name,
                  p_email,
                  p_phone_number,
                  p_hire_date,
                  p_job_id,p_salary,
                  p_commission_pct,
                  p_manager_id,
                  p_department_id);
					prc_log_table	(seq_08_log_table.NEXTVAL, 
										USER, 
										SYSDATE,  
										'pkg_hr_employees',
										'prc_add_employee',
										SQLCODE, 
										'1 Rand INSERAT');


					END IF;
						EXCEPTION
						    WHEN eroare_employee THEN 
								prc_log_table	(seq_08_log_table.NEXTVAL, 
										USER, 
										SYSDATE,  
										'pkg_hr_employees',
										'prc_add_employee',
										SQLCODE, 
										'Angatul exista');
										RAISE;
							WHEN DUP_VAL_ON_INDEX THEN
								prc_log_table	(seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_employees',
													'prc_add_employee',
													SQLCODE, 
													'Email-ul trebuie sa fie unic');
													RAISE;
							WHEN OTHERS THEN
							prc_log_table	(seq_08_log_table.NEXTVAL, 
												USER, 
												SYSDATE,  
												'pkg_hr_employees',
												'prc_add_employee',
												SQLCODE, 
												'Alta eroare');
												RAISE;
				END	prc_add_employee;		



				PROCEDURE prc_adjust_employee (
                                       p_employee_id IN NUMBER, 
                                       p_first_name IN VARCHAR2, 
	                                     p_last_name IN VARCHAR2, 
	                                     p_email IN VARCHAR2, 
	                                     p_phone_number IN VARCHAR2, 
	                                     p_hire_date IN DATE, 
	                                     p_job_id IN VARCHAR2, 
                                       p_salary IN NUMBER, 
	                                     p_commission_pct IN NUMBER, 
	                                     p_manager_id IN NUMBER, 
	                                     p_department_id IN NUMBER 
                    )
				IS	
				eroare_employee  EXCEPTION;
				BEGIN
						UPDATE employees
						   SET             employee_id = p_employee_id,
                               first_name = p_first_name,
                               last_name = p_last_name,
                               email = p_email,
                               phone_number = p_phone_number,
                               hire_date = p_hire_date,
                               job_id = p_job_id,
                               salary = p_salary,
                               commission_pct = p_commission_pct,
                               manager_id = p_manager_id,
                               department_id = p_department_id
					       WHERE employee_id = p_employee_id;
								IF SQL%ROWCOUNT = 0 
								THEN 
									RAISE eroare_employee;
								END IF;									
						   prc_log_table	(seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_employees',
													'prc_adjust_employee',
													SQLCODE, 
													'1 Rand UPDATAT');
									EXCEPTION
									WHEN eroare_employee THEN
									prc_log_table	(seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_employees',
													'prc_adjust_employee',
													SQLCODE, 
													'Angajatul nu exista');
													RAISE;

										WHEN DUP_VAL_ON_INDEX 
										THEN 
										prc_log_table	(seq_08_log_table.NEXTVAL, 
															USER, 
															SYSDATE,  
															'pkg_hr_employees',
															'prc_adjust_employee',
															SQLCODE, 
															'Email-ul trebuie sa fie unic');
															RAISE;												
										WHEN OTHERS 
										THEN 
										prc_log_table	(seq_08_log_table.NEXTVAL, 
															USER, 
															SYSDATE,  
															'pkg_hr_employees',
															'prc_adjust_employee',
															SQLCODE, 
															'Alta eroare');
															RAISE;
				END prc_adjust_employee;



				PROCEDURE	prc_remove_employee ( p_employee_id IN NUMBER)
				IS
				eroare_employee EXCEPTION;
				BEGIN
					IF fnc_employee_exists(p_employee_id) 
					THEN DELETE FROM employees
							   WHERE employee_id = p_employee_id;
						prc_log_table (seq_08_log_table.NEXTVAL, 
															USER, 
															SYSDATE,  
															'pkg_hr_employees',
															'prc_remove_employee',
															SQLCODE, 
															'1 Rand sters');
					ELSE 
						RAISE eroare_employee;
					END IF;
					EXCEPTION
					WHEN eroare_employee
					THEN prc_log_table (seq_08_log_table.NEXTVAL, 
															USER, 
															SYSDATE,  
															'pkg_hr_employees',
															'prc_remove_employee',
															SQLCODE, 
															'Angajatul nu exista');
															RAISE;
					 WHEN OTHERS 
					THEN 
										prc_log_table	(seq_08_log_table.NEXTVAL, 
															USER, 
															SYSDATE,  
															'pkg_hr_employees',
															'prc_adjust_employee',
															SQLCODE, 
															'Alta eroare');
															RAISE;										
				END prc_remove_employee;


				FUNCTION fnc_employee_exists	(p_employee_id IN NUMBER)
					RETURN BOOLEAN
				AS
					v_res NUMBER(1) := 0;
				BEGIN
					SELECT 1 
				    INTO v_res
			        FROM employees
					WHERE employee_id = p_employee_id;

				RETURN TRUE;       
							EXCEPTION
								WHEN NO_DATA_FOUND 
								THEN RETURN FALSE;
		        END fnc_employee_exists;



			    FUNCTION fnc_employee_exists_sql (p_employee_id IN NUMBER)
					RETURN NUMBER
				IS
					v_result NUMBER := 0;
				BEGIN
					SELECT 1 
					INTO v_result
					FROM employees
					WHERE employee_id = p_employee_id;
						IF ( v_result = 1) 
						THEN RETURN 1;
						ELSE RETURN 0;
						END IF;
							EXCEPTION
								WHEN NO_DATA_FOUND 
								THEN RETURN 0;
				END fnc_employee_exists_sql;					
END pkg_hr_employees;
/ 
