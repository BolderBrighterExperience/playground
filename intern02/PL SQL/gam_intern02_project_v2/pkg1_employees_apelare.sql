
/*insert into employees values(999,'Ana','Gherca','AGHERCA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
select * from employees where employee_id=999;
update employees set salary=1400 where employee_id=999;
select * from employees where employee_id=999;
delete from employees where employee_id=999;
*/

--apel procedura inserare
/*
SET SERVEROUTPUT ON
BEGIN
	gam_pkg_hr_employees.prc_add_employee(999,'Ana','Gherca','AGHERCA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
END;
*/

--apel procedura modificare angajat
/*
SET SERVEROUTPUT ON
BEGIN
	gam_pkg_hr_employees.prc_adjust_employee_data(999,'Ana','Gherca','AGHERCA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1400,null,100,20);
END;
*/

--apel procedura stergere angajat
/*
SET SERVEROUTPUT ON
BEGIN
	gam_pkg_hr_employees.prc_remove_employee(999);
END;
*/

--apel cautare pl/sql
/*
SET SERVEROUTPUT ON
BEGIN
	IF(gam_pkg_hr_employees.fnc_employee_exists(999)) THEN
		DBMS_OUTPUT.PUT_LINE('Angajatul cu acest id exista.');
	ELSE
        DBMS_OUTPUT.PUT_LINE('Angajatul cu acest id nu exista.');
	END IF;
END;
*/

--apel cautare sql
/*
SET SERVEROUTPUT ON
BEGIN
	IF(gam_pkg_hr_employees.fnc_employee_exists_sql(999)='YES') THEN
		DBMS_OUTPUT.PUT_LINE('Angajatul cu acest id exista');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Angajatul cu acest id nu exista.');
	END IF;
END;
*/
