SET SERVEROUTPUT ON
BEGIN
  hr_departments.prc_add_department(7,'alalala;',null,2400);
	hr_departments.prc_add_department(9,'alalala',null,2400);
  hr_departments.prc_add_department(9453400,'alalala',null,2400);
  hr_departments.prc_adjust_department_data(7,'alalala',null,1700);
  hr_departments.prc_adjust_department_data(54,'alalala',null,2400);
  hr_departments.prc_adjust_department_data(11,'alalala',null,2400);
  hr_departments.prc_remove_department(7);
  hr_departments.prc_remove_department(6546);
  hr_departments.prc_remove_department(13);
END;

