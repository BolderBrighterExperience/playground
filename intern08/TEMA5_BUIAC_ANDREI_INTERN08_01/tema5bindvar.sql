
CREATE OR REPLACE PACKAGE pkg_hr_employees 
IS  
    
   PROCEDURE prc_add_employee(  an_employee_id IN NUMBER, 
	                            as_first_name IN VARCHAR2, 
	                            as_last_name IN VARCHAR2, 
	                            as_email IN VARCHAR2, 
	                            as_phone_number IN VARCHAR2, 
	                            ad_hire_date IN DATE, 
	                            as_job_id IN VARCHAR2, 
	                            an_salary IN NUMBER, 
	                            an_commission_pct IN NUMBER, 
	                            an_manager_id IN NUMBER, 
	                            an_department_id IN NUMBER 
							 ); 
   PROCEDURE prc_adjust_employee     (  an_employee_id IN NUMBER, 
										as_first_name IN VARCHAR2, 
										as_last_name IN VARCHAR2, 
										as_email IN VARCHAR2, 
										as_phone_number IN VARCHAR2, 
										ad_hire_date IN DATE, 
										as_job_id IN VARCHAR2, 
										an_salary IN NUMBER, 
										an_commission_pct IN NUMBER, 
										an_manager_id IN NUMBER, 
										an_department_id IN NUMBER  
									 ); 
   PROCEDURE prc_remove_employee (an_employee_id IN NUMBER);
    FUNCTION fnc_employee_exists (an_employee_id IN NUMBER) 
      RETURN BOOLEAN; 
   FUNCTION fnc_employee_exists_sql(an_employee_id IN NUMBER) 
      RETURN NUMBER;
END pkg_hr_employees; 
/
CREATE OR REPLACE PACKAGE BODY pkg_hr_employees 
IS
	PROCEDURE prc_add_employee (an_employee_id IN NUMBER, 
	                            as_first_name IN VARCHAR2, 
	                            as_last_name IN VARCHAR2, 
	                            as_email IN VARCHAR2, 
	                            as_phone_number IN VARCHAR2, 
	                            ad_hire_date IN DATE, 
	                            as_job_id IN VARCHAR2, 
	                            an_salary IN NUMBER, 
	                            an_commission_pct IN NUMBER, 
	                            an_manager_id IN NUMBER, 
	                            an_department_id IN NUMBER 
                                )
				IS 
				eroare_employee  EXCEPTION;
				BEGIN
					IF(fnc_employee_exists(an_employee_id)) 
					THEN 
						RAISE eroare_employee;
					ELSE
						EXECUTE IMMEDIATE
					'INSERT INTO employees 
					VALUES (:employee_id,
                  :first_name,
                  :last_name,
                  :email,
                  :phone_number,
                  :hire_date,
                  :job_id,p_salary,
                  :commission_pct,
                  :manager_id,
                  :department_id)'
				        USING   an_employee_id, 
	                            as_first_name, 
	                            as_last_name, 
	                            as_email, 
	                            as_phone_number, 
	                            ad_hire_date, 
	                            as_job_id, 
	                            an_salary, 
	                            an_commission_pct, 
	                            an_manager_id, 
	                            an_department_id;
					prc_log_table	(   seq_08_log_table.NEXTVAL, 
										USER, 
										SYSDATE,  
										'pkg_hr_employees',
										'prc_add_employee',
										SQLCODE, 
										'1 Rand INSERAT'
									);


					END IF;
						EXCEPTION
						    WHEN eroare_employee 
									THEN 
								prc_log_table	(   seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_employees',
													'prc_add_employee',
													SQLCODE, 
													'Angajatul exista');
									RAISE;
							WHEN DUP_VAL_ON_INDEX 
									THEN
								prc_log_table	(   seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_employees',
													'prc_add_employee',
													SQLCODE, 
													'Email-ul trebuie sa fie unic'
												);
									RAISE;
							WHEN OTHERS 
									THEN
								prc_log_table	(   seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_employees',
													'prc_add_employee',
													SQLCODE, 
													'Alta eroare'
												);
									RAISE;
	END	prc_add_employee;		



	PROCEDURE prc_adjust_employee ( an_employee_id IN NUMBER, 
									as_first_name IN VARCHAR2, 
									as_last_name IN VARCHAR2, 
									as_email IN VARCHAR2, 
									as_phone_number IN VARCHAR2, 
									ad_hire_date IN DATE, 
									as_job_id IN VARCHAR2, 
									an_salary IN NUMBER, 
									an_commission_pct IN NUMBER, 
									an_manager_id IN NUMBER, 
									an_department_id IN NUMBER 
								   )
				IS	
				eroare_employee  EXCEPTION;
				BEGIN
					EXECUTE IMMEDIATE
						'UPDATE employees
									SET    employee_id = :employee_id,
										   first_name = :first_name,
										   last_name = :last_name,
										   email = :email,
										   phone_number = :phone_number,
										   hire_date = :hire_date,
										   job_id = :job_id,
										   salary = :salary,
										   commission_pct = :commission_pct,
										   manager_id = :manager_id,
										   department_id = :department_id
					     WHERE employee_id= :employee_id' 
					USING     
											an_employee_id, 
											as_first_name, 
											as_last_name, 
											as_email, 
											as_phone_number, 
											ad_hire_date, 
											as_job_id, 
											an_salary, 
											an_commission_pct, 
											an_manager_id, 
											an_department_id;
					IF SQL%ROWCOUNT = 0 
							THEN 
									RAISE eroare_employee;
					END IF;									
						    prc_log_table	    (    seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_employees',
													'prc_adjust_employee',
													SQLCODE, 
													'1 Rand UPDATAT'
												);
					EXCEPTION
						WHEN eroare_employee 
							THEN
							prc_log_table	    (   seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_employees',
													'prc_adjust_employee',
													SQLCODE, 
													'Angajatul nu exista'
												);
									RAISE;

						WHEN DUP_VAL_ON_INDEX 
							THEN 
							prc_log_table	    (   seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_employees',
													'prc_adjust_employee',
													SQLCODE, 
													'Email-ul trebuie sa fie unic'
												);
									RAISE;												
						WHEN OTHERS 
							THEN 
							prc_log_table	    (   seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_employees',
													'prc_adjust_employee',
													SQLCODE, 
													'Alta eroare'
												);
									RAISE;
	END prc_adjust_employee;



	PROCEDURE	prc_remove_employee ( an_employee_id IN NUMBER)
				IS
				eroare_employee EXCEPTION;
				BEGIN
				
				IF fnc_employee_exists(an_employee_id) 
							THEN 
					EXECUTE IMMEDIATE
					'DELETE FROM employees
							WHERE employee_id = :employee_id'
				    USING an_employee_id;
							prc_log_table 		(	seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_employees',
													'prc_remove_employee',
													SQLCODE, 
													'1 Rand sters'
												);
					ELSE 
								RAISE eroare_employee;
				END IF;
					EXCEPTION
						WHEN eroare_employee
							THEN 
							prc_log_table 		(   seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_employees',
													'prc_remove_employee',
													SQLCODE, 
													'Angajatul nu exista'
												);
								RAISE;
						WHEN OTHERS 
							THEN 
							prc_log_table		(   seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_employees',
													'prc_adjust_employee',
													SQLCODE, 
													'Alta eroare');
													RAISE;										
				END prc_remove_employee;


	FUNCTION fnc_employee_exists	(an_employee_id IN NUMBER)
			RETURN BOOLEAN
				AS
				v_res NUMBER(1) := 0;
		BEGIN
		SELECT 1 
		INTO v_res
		FROM employees
			WHERE employee_id = an_employee_id;

			RETURN TRUE;       
				EXCEPTION
					WHEN NO_DATA_FOUND 
						THEN RETURN FALSE;
	END fnc_employee_exists;



	FUNCTION fnc_employee_exists_sql (an_employee_id IN NUMBER)
			RETURN NUMBER
				AS
				v_result NUMBER := 0;
		BEGIN
		SELECT 1 
		INTO v_result
		FROM employees
			WHERE employee_id = an_employee_id;
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

CREATE OR REPLACE PACKAGE pkg_hr_departments 
IS  
   
   PROCEDURE prc_add_department    ( an_department_id IN NUMBER, 
									 as_department_name IN VARCHAR2, 
									 an_manager_id IN NUMBER, 
									 an_location_id IN NUMBER
								   ); 
   PROCEDURE prc_adjust_department  (	an_department_id IN NUMBER, 
										as_department_name IN VARCHAR2, 
										an_manager_id IN NUMBER, 
										an_location_id IN NUMBER);
   PROCEDURE prc_remove_department ( an_department_id IN NUMBER); 
    FUNCTION fnc_department_exists ( an_department_id IN NUMBER) 
      RETURN BOOLEAN; 
   FUNCTION fnc_department_exists_sql( an_department_id IN NUMBER) 
      RETURN NUMBER;
	  
END pkg_hr_departments; 
/



CREATE OR REPLACE PACKAGE BODY pkg_hr_departments
IS
	PROCEDURE prc_add_department (	an_department_id IN NUMBER, 
									as_department_name IN VARCHAR2, 
									an_manager_id IN NUMBER, 
									an_location_id IN NUMBER
								 )
		IS 
		eroare_department  EXCEPTION;
			BEGIN
				IF(fnc_department_exists(an_department_id)) THEN 
								RAISE eroare_department;
									ELSE
								EXECUTE IMMEDIATE
									'INSERT INTO departments 
									VALUES (  :department_id,
											  :department_name,
											  :manager_id,
											  :location_id)'
									USING     an_department_id, 
											  as_department_name, 
											  an_manager_id, 
											  an_location_id;
								prc_log_table (     seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_departments',
													'prc_add_department',
													SQLCODE, 
													'1 Rand inserat'
											   );
				END IF;
					EXCEPTION
						WHEN eroare_department 
							THEN
								prc_log_table (		seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_departments',
													'prc_add_department',
													SQLCODE, 
													'Departamentul trebuie sa fie unic');
								RAISE;
						WHEN OTHERS 
							THEN
								prc_log_table (				seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_departments',
													'prc_add_department',
													SQLCODE, 
													'Alta eroare');	
													RAISE;
	END	prc_add_department;		


	PROCEDURE prc_adjust_department (	an_department_id IN NUMBER, 
										as_department_name IN VARCHAR2, 
										an_manager_id IN NUMBER, 
										an_location_id IN NUMBER
									)
		IS	
		eroare_department  EXCEPTION;
			BEGIN
				EXECUTE IMMEDIATE
					'UPDATE departments
						SET 	department_id = :department_id,
								department_name = :department_name,
								manager_id = :manager_id,
								location_id = :location_id
							WHERE department_id = :department_id'
				USING     an_department_id,
						  as_department_name,
						  an_manager_id,
						  an_location_id;

						IF SQL%ROWCOUNT = 0 
							THEN 
								RAISE eroare_department;
						END IF;	

								prc_log_table (		seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_departments',
													'prc_adjust_department',
													SQLCODE, 
													'1 Rand updatat'
												);
					EXCEPTION
						WHEN eroare_department 	
							THEN
								prc_log_table (		seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_departments',
													'prc_adjust_department',
													SQLCODE, 
													'Departamentul exista deja'
												);
                      RAISE;
										WHEN OTHERS 
										THEN 
								prc_log_table (		seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_departments',
													'prc_adjust_department',
													SQLCODE, 
													'Alta eroare'
											  );
										RAISE;
	END prc_adjust_department;


	PROCEDURE	prc_remove_department ( an_department_id IN NUMBER)
		IS
         eroare_department  EXCEPTION;
			BEGIN
				IF fnc_department_exists(an_department_id) 
					THEN
						EXECUTE IMMEDIATE
							'DELETE FROM departments
							 WHERE department_id = :department_id'
						USING an_department_id;
								prc_log_table (		seq_08_log_table.NEXTVAL, 
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
								prc_log_table (		seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_departments',
													'prc_adjust_department',
													SQLCODE, 
													'Departamentul nu exista'
											  );
										RAISE;	
						WHEN OTHERS 
							THEN 
								prc_log_table (		seq_08_log_table.NEXTVAL, 
													USER, 
													SYSDATE,  
													'pkg_hr_departments',
													'prc_adjust_department',
													SQLCODE, 
													'Alta eroare');
										RAISE;
	END prc_remove_department;


	FUNCTION fnc_department_exists (an_department_id IN NUMBER)
			RETURN BOOLEAN
				AS
				v_res NUMBER(1) := 0;
		BEGIN
		SELECT 1 
		INTO v_res
		FROM departments
			WHERE department_id = an_department_id;
				RETURN TRUE;       
					EXCEPTION
						WHEN NO_DATA_FOUND 
							THEN RETURN FALSE;
	END fnc_department_exists;


	FUNCTION fnc_department_exists_sql (an_department_id IN NUMBER)
			RETURN NUMBER
				AS
				v_result NUMBER := 0;
		BEGIN
		SELECT 1 
		INTO v_result
		FROM departments
			WHERE department_id = an_department_id;
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

DROP TABLE log_table;

CREATE TABLE log_table(
						id_log NUMBER PRIMARY KEY,
						user_name VARCHAR2(100) NOT NULL,
						date_operation TIMESTAMP NOT NULL,
						package_name VARCHAR2(100) NOT NULL,
						subprogram_name VARCHAR2(300) NOT NULL,
						log_code NUMBER,
						log_message VARCHAR2(300)
					  ); 

DROP SEQUENCE seq_08_log_table;

CREATE SEQUENCE seq_08_log_table
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 99999
			NOCACHE
			NOCYCLE;
/    
	CREATE OR REPLACE PROCEDURE prc_log_table
                            (
								  an_id_log log_table.id_log%TYPE,
								  as_user_name log_table.user_name%TYPE,
								  ad_date_operation log_table.date_operation%TYPE,
								  as_package_name log_table.package_name%TYPE,
								  as_subprogram_name log_table.subprogram_name%TYPE,
								  an_log_code log_table.log_code%TYPE,
								  as_log_message log_table.log_message%TYPE
							)
		IS 
		BEGIN
			INSERT INTO log_table 
				VALUES (an_id_log,
						as_user_name,
						ad_date_operation,
						as_package_name,
						as_subprogram_name,
						an_log_code,
						as_log_message);   
						
	END	prc_log_table; 
               
  /      
        
	CREATE OR REPLACE PACKAGE pkg_unit_testing
		IS
			PROCEDURE prc_add_department_test;
			PROCEDURE prc_adjust_dep_test;
			PROCEDURE prc_remove_department_test;
			PROCEDURE prc_add_employee_test;
			PROCEDURE prc_adjust_employee_test;
			PROCEDURE prc_remove_employee_test;

	END pkg_unit_testing;
	
/

	CREATE OR REPLACE PACKAGE BODY pkg_unit_testing
		IS
			PROCEDURE prc_add_department_test
				IS
		BEGIN
		BEGIN
		pkg_hr_departments.prc_add_department(170,'Marketing1',null,2400);
			DBMS_OUTPUT.PUT_LINE('Inregistrare inserata');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut insera');
	END;

		BEGIN
		pkg_hr_departments.prc_add_department(300,'Marketing2',null,2600);
			DBMS_OUTPUT.PUT_LINE('Inregistrare inserata');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut insera');
	END;

		BEGIN
		pkg_hr_departments.prc_add_department(1000,'Marketing3',null,2400);
			DBMS_OUTPUT.PUT_LINE('Inregistrare inserata');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut insera');
	END;
	END;

	PROCEDURE prc_adjust_dep_test
	IS
		BEGIN
		BEGIN
		pkg_hr_departments.prc_adjust_department(130,'Marketing4',null,1700);
			DBMS_OUTPUT.PUT_LINE('Inregistrare updatata cu succes');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut updata');
	END;

		BEGIN
		pkg_hr_departments.prc_adjust_department(500,'Marketing5',null,2400);
			DBMS_OUTPUT.PUT_LINE('Inregistrare updatata cu succes');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut updata');
	END;

		BEGIN
		pkg_hr_departments.prc_adjust_department(31,'Marketing6',null,2400);
			DBMS_OUTPUT.PUT_LINE('Inregistrare updatata cu succes');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut updata');
	END;
	END;

	PROCEDURE prc_remove_department_test
	IS
		BEGIN
		BEGIN
		pkg_hr_departments.prc_remove_department(28);
			DBMS_OUTPUT.PUT_LINE('Inregistrarea stearsa cu succes');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut sterge');
	END;

		BEGIN
		pkg_hr_departments.prc_remove_department(450);
			DBMS_OUTPUT.PUT_LINE('Inregistrarea stearsa cu succes');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut sterge');
	END;
	END;

	PROCEDURE prc_add_employee_test
	IS
		BEGIN
		BEGIN
		pkg_hr_employees.prc_add_employee(207,'George','Sacasanu','Geosac','0733135632',to_date('23.03.2009','DD.MM.YYYY'),'SH_CLERK',1000,null,101,100); 
			DBMS_OUTPUT.PUT_LINE('Inregistrare inserata');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut insera');
	END;

		BEGIN
		pkg_hr_employees.prc_add_employee(207,'George','Sacasanu','Geosac','0733135632',to_date('23.03.2009','DD.MM.YYYY'),'SH_CLERK',1000,null,101,100); 
			DBMS_OUTPUT.PUT_LINE('Inregistrare inserata');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut insera');
	END;

		BEGIN
		pkg_hr_employees.prc_add_employee(125,'Julia','Nayer','JNAYER','650.124.1214',to_date('16.07.1997','DD.MM.YYYY'),'SH_CLERK',3200,null,120,50); 
			DBMS_OUTPUT.PUT_LINE('Inregistrare inserata');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut insera');
	END;
	END;

	PROCEDURE prc_adjust_employee_test
	IS
		BEGIN
		BEGIN
		pkg_hr_employees.prc_adjust_employee(125,'Julia','Nayer','JNAYER','650.154.1214',to_date('16.07.1997','DD.MM.YYYY'),'SH_CLERK',3200,null,120,50); 
			DBMS_OUTPUT.PUT_LINE('Inregistrare updatata cu succes');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut updata');
	END;

		BEGIN
		pkg_hr_employees.prc_adjust_employee(2335,'Julia','Nayer','JNAYER','650.124.1214',to_date('16.07.1997','DD.MM.YYYY'),'SH_CLERK',3200,null,120,50); 
			DBMS_OUTPUT.PUT_LINE('Inregistrare updatata cu succes');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut updata');
	END;

	BEGIN
	pkg_hr_employees.prc_adjust_employee(125,'Julia','Nayer','JNAYER','650.124.1564',to_date('16.07.1997','DD.MM.YYYY'),'SH_CLERK',3200,null,120,50); 
		DBMS_OUTPUT.PUT_LINE('Inregistrare updatata cu succes');
			EXCEPTION
				WHEN OTHERS THEN
					DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut updata');
	END;
	END;

	PROCEDURE prc_remove_employee_test
	IS
		BEGIN
		BEGIN
		pkg_hr_employees.prc_remove_employee(999); 
			DBMS_OUTPUT.PUT_LINE('Inregistrarea stearsa cu succes');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut sterge');
	END;

		BEGIN
		pkg_hr_employees.prc_remove_employee(1000);
			DBMS_OUTPUT.PUT_LINE('Inregistrarea stearsa cu succes');
				EXCEPTION
					WHEN OTHERS THEN
						DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut sterge');
	END;
	END;
	END;
/   
begin 
pkg_unit_testing.prc_add_department_test;
pkg_unit_testing.prc_adjust_dep_test;
pkg_unit_testing.prc_remove_department_test;
pkg_unit_testing.prc_add_employee_test;
pkg_unit_testing.prc_adjust_employee_test;
pkg_unit_testing.prc_remove_employee_test;
end;