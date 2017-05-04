
CREATE OR REPLACE PACKAGE BODY pkg_hr_departments
AS

PROCEDURE prc_add_department(
                            as_department_name      IN departments.department_name%type,
                            an_manager_id           IN departments.manager_id%type,
                            an_location_id          IN departments.location_id%type
)
IS
    ls_procedure_name           VARCHAR2(50) := 'pkg_hr_departments.prc_add_department';
    le_integrity_constraint     EXCEPTION;
    le_null_into_notnull        EXCEPTION;
    PRAGMA EXCEPTION_INIT( le_integrity_constraint, -2291);
    PRAGMA EXCEPTION_INIT( le_null_into_notnull, -1400);
BEGIN
    INSERT
    INTO departments(
                    department_id,
                    department_name,
                    manager_id,
                    location_id
                    )
    VALUES( 
            departments_seq.NEXTVAL,
            as_department_name,
            an_manager_id,
            an_location_id
            );
    
    prc_log_error( 'info', SQLCODE, SQLERRM, ls_procedure_name);
    
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        prc_log_error( 'error', SQLCODE, 'Unique constraint violated!', ls_procedure_name);
        RAISE;
        
    WHEN le_integrity_constraint THEN
        prc_log_error( 'error', SQLCODE, 'Department_id, manager_id are Foreign Keys. Values must exist already!', ls_procedure_name);
        RAISE;
        
    WHEN le_null_into_notnull THEN
        prc_log_error( 'error', SQLCODE, 'Department_name must be NOT NULL!', ls_procedure_name); 
        RAISE;
        
    WHEN OTHERS THEN
        prc_log_error( 'error', SQLCODE, SQLERRM, ls_procedure_name);
        RAISE_APPLICATION_ERROR(-20003,'An error has occurred inserting a department!');        
  
END prc_add_department;

PROCEDURE prc_adjust_department_data(
                                    an_department_id         IN departments.department_id%type,
                                    as_department_name        IN departments.department_name%type,
                                    an_manager_id             IN departments.manager_id%type,
                                    an_location_id            IN departments.location_id%type
                                    )
IS
    LS_PROCEDURE_NAME           CONSTANT    VARCHAR2(50) := 'pkg_hr_departments.prc_adjust_department_data';
    
    le_integrity_constraint     EXCEPTION;
    le_null_into_notnull        EXCEPTION;
    PRAGMA EXCEPTION_INIT( le_integrity_constraint, -2291);
    PRAGMA EXCEPTION_INIT( le_null_into_notnull, -1407);
BEGIN
    UPDATE     departments
    SET        department_name = as_department_name,
            manager_id        =  an_manager_id,
            location_id        = an_location_id
    WHERE     department_id    =  an_department_id;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20047,'An error has occurred updating a department!');    
    END IF;

    prc_log_error( 'info', SQLCODE, SQLERRM, ls_procedure_name);

EXCEPTION
    WHEN le_integrity_constraint THEN
        prc_log_error( 'error', SQLCODE, 'Department_id, manager_id are Foreign Keys. Values must exist already!', ls_procedure_name);
        RAISE;
        
    WHEN le_null_into_notnull THEN
        prc_log_error( 'error', SQLCODE, 'Department_name must be NOT NULL!', ls_procedure_name); 
        RAISE;
        
    WHEN OTHERS THEN
        prc_log_error( 'error', SQLCODE, SQLERRM, ls_procedure_name);
        RAISE_APPLICATION_ERROR(-20004,'An error has occurred updating a department!');   
        
END prc_adjust_department_data;

PROCEDURE prc_remove_department( an_department_id  IN departments.department_id%type)
IS
    ls_procedure_name           VARCHAR2(50) := 'pkg_hr_departments.prc_remove_department';
    le_integrity_constraint     EXCEPTION;
    PRAGMA EXCEPTION_INIT( le_integrity_constraint, -2292);
BEGIN
    DELETE 
    FROM     departments
    WHERE     department_id = an_department_id;
    
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20005,'An error has occurred deleting a department!');    
    END IF;

    prc_log_error( 'info', SQLCODE, SQLERRM, ls_procedure_name);
  
EXCEPTION
    WHEN le_integrity_constraint THEN
        prc_log_error( 'error', SQLCODE, 'Integrity constraint violated!', ls_procedure_name);
        RAISE;
        
    WHEN OTHERS THEN
        prc_log_error( 'error', SQLCODE, SQLERRM, ls_procedure_name);
            RAISE_APPLICATION_ERROR(-20005,'An error has occurred deleting a department!');   
            
END prc_remove_department;

FUNCTION fnc_department_exists( an_department_id IN departments.department_id%type)
RETURN BOOLEAN
IS
    ls_function_name        VARCHAR2(50) := 'pkg_hr_departments.fnc_department_exists';
    ln_department_id        departments.department_id%type;
BEGIN
    SELECT     department_id 
    INTO     ln_department_id
    FROM     departments 
    WHERE     department_id = an_department_id;
    
    RETURN TRUE;
        
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        prc_log_error( 'error', SQLCODE, 'Department_id doesn t exist!', ls_function_name);
        RETURN FALSE;
        
END fnc_department_exists;

FUNCTION fnc_department_exists_sql (an_department_id IN departments.department_id%type)
RETURN NUMBER
IS
    ls_function_name        VARCHAR2(50) := 'pkg_hr_departments.fnc_department_exists_sql';
    ln_department_id        departments.department_id%type;
BEGIN
    IF fnc_department_exists( an_department_id ) THEN    
        RETURN 1;
    END IF;
    
    RETURN 0;
    
END fnc_department_exists_sql;

END pkg_hr_departments;
/
