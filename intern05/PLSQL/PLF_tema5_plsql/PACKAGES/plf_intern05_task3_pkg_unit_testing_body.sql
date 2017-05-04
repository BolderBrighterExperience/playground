CREATE OR REPLACE PACKAGE BODY pkg_unit_testing
IS
    PROCEDURE prc_ut_add_department
IS
    BEGIN
BEGIN
    pkg_hr_departments.prc_add_department(340,'Marketing1',null,2400);
    DBMS_OUTPUT.PUT_LINE('Inregistrare inserata');
EXCEPTION
	WHEN OTHERS THEN
		BMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut insera');
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
END prc_ut_add_department;

	
PROCEDURE prc_ut_adjust_department_data
IS
	BEGIN
BEGIN
	pkg_hr_departments.prc_adjust_department_data(130,'Marketing4',null,1700);
	DBMS_OUTPUT.PUT_LINE('Inregistrare updatata cu succes');
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut updata');
END;

BEGIN
	pkg_hr_departments.prc_adjust_department_data(500,'Marketing5',null,2400);
	DBMS_OUTPUT.PUT_LINE('Inregistrare updatata cu succes');
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut updata');
END;

BEGIN
	pkg_hr_departments.prc_adjust_department_data(31,'Marketing6',null,2400);
	DBMS_OUTPUT.PUT_LINE('Inregistrare updatata cu succes');
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut updata');
END;
END prc_ut_adjust_department_data;

PROCEDURE prc_ut_remove_department
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
END prc_ut_remove_department;

PROCEDURE prc_ut_add_employee
IS
	BEGIN
BEGIN
	pkg_hr_employees.prc_add_employee(209,'Neymar','Junior','Jneymar','0733135632',to_date('23.03.2009','DD.MM.YYYY'),'SH_CLERK',1000,null,101,100); 
	DBMS_OUTPUT.PUT_LINE('Inregistrare inserata');
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut insera');
END;

BEGIN
	pkg_hr_employees.prc_add_employee(207,'Neymar','Junior','Jneymar','0733135632',to_date('23.03.2009','DD.MM.YYYY'),'SH_CLERK',1000,null,101,100); 
	DBMS_OUTPUT.PUT_LINE('Inregistrare inserata');
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut insera');
END;

BEGIN
	pkg_hr_employees.prc_add_employee(125,'Julia','Roberts','JRoberts','650.124.1214',to_date('16.07.1997','DD.MM.YYYY'),'SH_CLERK',3200,null,120,50); 
	DBMS_OUTPUT.PUT_LINE('Inregistrare inserata');
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut insera');
END;
END prc_ut_add_employee;

PROCEDURE prc_ut_adjust_employee_data
IS
	BEGIN
BEGIN
	pkg_hr_employees.prc_adjust_employee_data(126,'Julia','Roberts','JRoberts','650.154.1214',to_date('16.07.1997','DD.MM.YYYY'),'SH_CLERK',3200,null,120,50); 
	DBMS_OUTPUT.PUT_LINE('Inregistrare updatata cu succes');
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut updata');
END;

BEGIN
	pkg_hr_employees.prc_adjust_employee_data(2335,'Julia','Roberts','JRoberts','650.124.1214',to_date('16.07.1997','DD.MM.YYYY'),'SH_CLERK',3200,null,120,50); 
	DBMS_OUTPUT.PUT_LINE('Inregistrare updatata cu succes');
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut updata');
END;

BEGIN
	pkg_hr_employees.prc_adjust_employee_data(129,'Julia','Roberts','JRoberts','650.124.1564',to_date('16.07.1997','DD.MM.YYYY'),'SH_CLERK',3200,null,120,50); 
	DBMS_OUTPUT.PUT_LINE('Inregistrare updatata cu succes');
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('Inregistrarea nu s-a putut updata');
END;
END prc_ut_adjust_employee_data;

PROCEDURE prc_ut_remove_employee
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
END prc_ut_remove_employee;

END pkg_unit_testing;
/   
