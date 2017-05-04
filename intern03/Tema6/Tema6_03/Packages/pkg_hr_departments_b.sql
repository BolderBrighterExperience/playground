CREATE OR REPLACE PACKAGE BODY pkg_hr_departments
IS


PROCEDURE prc_add_department(
                             an_deptid    IN departments.department_id%TYPE,
                             as_deptname  IN departments.department_name%TYPE,
                             an_managid   IN departments.manager_id%TYPE,
                             an_locid     IN departments.location_id%TYPE
						     )
IS

    insert_null_excep    EXCEPTION;
    PRAGMA EXCEPTION_INIT(insert_null_excep,-1400);
    insert_constraint_invalid EXCEPTION;
    PRAGMA EXCEPTION_INIT(insert_constraint_invalid,-2290);
BEGIN
    INSERT 
    INTO departments(
                     department_id,
                     department_name,
                     manager_id,
                     location_id
                     )
    VALUES(
           an_deptid,
           as_deptname,
           an_managid,
           an_locid
          );
    proc_log(SQLCODE,'Inserarea s-a realizat cu succes',' info ',' pkg_hr_departments.prc_add_department ');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
  
        proc_log(SQLCODE,' Exista un departament cu acest ID. ',' error ',' pkg_hr_departments.prc_add_department ' );
        RAISE;      
    WHEN insert_null_excep THEN
       
        proc_log(SQLCODE,' Campurile: DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID trebuie completate. ', ' error ',' pkg_hr_departments.prc_add_department ' );
        RAISE;    
    WHEN  insert_constraint_invalid THEN
        
        proc_log(SQLCODE,' Nu sunt respectate constrangerile. ',' error ',' pkg_hr_departments.prc_add_department ');
        RAISE;      
    WHEN OTHERS THEN
      
        proc_log(SQLCODE,SQLERRM,' error ',' pkg_hr_departments.prc_add_department ');
        RAISE;
       
END prc_add_department;

FUNCTION fnc_department_exists( an_deptid   IN departments.department_id%TYPE )
RETURN BOOLEAN
IS
    ln_dep NUMBER;
BEGIN
    SELECT 	1 
    INTO 	ln_dep
    FROM 	departments
    WHERE 	department_id = an_deptid;
    
    RETURN TRUE;
    
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
END fnc_department_exists;

FUNCTION fnc_department_exists_sql( an_deptid  IN departments.department_id%TYPE )
RETURN NUMBER
IS
    ln_dep NUMBER;
BEGIN
    SELECT 	1 
    INTO 	ln_dep
    FROM 	departments 
    WHERE 	department_id = an_deptid;
    
    RETURN 1;
    
   
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		RETURN 0;

END fnc_department_exists_sql;


PROCEDURE prc_adjust_department_data(
                                     an_deptid    IN departments.department_id%TYPE,
                                     as_deptname  IN departments.department_name%TYPE,
                                     an_managid   IN departments.manager_id%TYPE,
                                     an_locid     IN departments.location_id%TYPE
                                    )
IS
BEGIN
        UPDATE departments
        SET department_name  = as_deptname,
            manager_id       = an_managid,
            location_id      = an_locid
        WHERE department_id  = an_deptid;

        
        
        IF SQL%ROWCOUNT  = 0 THEN
            RAISE no_data_found;
        END IF;
        
        proc_log(SQLCODE,'Update-ul s-a realizat cu succes',' info ',' pkg_hr_departments.prc_adjust_department_data ');
        
EXCEPTION
	WHEN no_data_found THEN
		proc_log(SQLCODE,' Nu exista acest ID. ',' error ', ' pkg_hr_departments.prc_adjust_department_data ');
		RAISE;
	WHEN OTHERS THEN
		ROLLBACK;
		proc_log(SQLCODE,SQLERRM,' error ', ' pkg_hr_departments.prc_adjust_department_data ');
		RAISE;
END prc_adjust_department_data;

PROCEDURE prc_remove_department( an_deptid   departments.department_id%TYPE )
IS
BEGIN
    DELETE FROM departments
    WHERE department_id = an_deptid;
    
    IF SQL%ROWCOUNT  = 0 THEN
       RAISE no_data_found;
    END IF;
    
    proc_log(SQLCODE,'Stergerea s-a realizat cu succes.',' info ', ' pkg_hr_departments.prc_remove_department '); 
    
EXCEPTION
       WHEN no_data_found THEN
          proc_log(SQLCODE,' Nu exista acest ID ',' error','pkg_hr_department.prc_remove_department');
          RAISE;
        WHEN OTHERS THEN
            proc_log(SQLCODE,SQLERRM,' error ', ' pkg_hr_departments.prc_remove_department' );
            RAISE;
END prc_remove_department;

END pkg_hr_departments; 
/

