/*select * from departments;
insert into departments values(7,'alalala',null,2400);
update departments set location_id = 1700 where department_id=7;
delete from departments where department_id=7;
*/

--apel procedura inserare
/*
SET SERVEROUTPUT ON
BEGIN
  gam_pkg_hr_departments.prc_add_department(7,'alalala',null,2400);
	gam_pkg_hr_departments.prc_add_department(90,'alalala',null,2400);
  gam_pkg_hr_departments.prc_add_department(900,'alalala',null,2400);
  gam_pkg_hr_departments.prc_add_department(9453400,'alalala',null,2400);
END;
*/

--apel procedura modificare angajat
/*
SET SERVEROUTPUT ON
BEGIN
  gam_pkg_hr_departments.prc_adjust_department_data(7,'alalala',null,1700);
  gam_pkg_hr_departments.prc_adjust_department_data(9453400,'alalala',null,2400);
  gam_pkg_hr_departments.prc_adjust_department_data(11,'alalala',null,2400);
END;
*/

--apel procedura stergere angajat
/*
SET SERVEROUTPUT ON
BEGIN
	 gam_pkg_hr_departments.prc_remove_department(7);
   gam_pkg_hr_departments.prc_remove_department(532452457);
   gam_pkg_hr_departments.prc_remove_department(13);
END;
*/

--apel cautare pl/sql
/*
SET SERVEROUTPUT ON
BEGIN
	IF(gam_pkg_hr_departments.fnc_department_exists(7)) THEN
		DBMS_OUTPUT.PUT_LINE('Departamentul cu acest id exista.');
	ELSE
        DBMS_OUTPUT.PUT_LINE('Departamentul cu acest id nu exista.');
	END IF;
END;
*/

--apel cautare sql
/*
SET SERVEROUTPUT ON
BEGIN
	IF(gam_pkg_hr_departments.fnc_department_exists_sql(7)='YES') THEN
		DBMS_OUTPUT.PUT_LINE('Departamentul cu acest id exista');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Departamentul cu acest id nu exista.');
	END IF;
END;
*/