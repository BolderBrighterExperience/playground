--package body
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