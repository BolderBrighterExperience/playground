SET SERVEROUTPUT ON
BEGIN
	hr_employees.prc_add_employee(999,'Ana','Gherca','AGHERCA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
  hr_employees.prc_add_employee(900,'Ana','Gherca','AGHERCA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
  hr_employees.prc_add_employee(999,'Ana','Maria','AMARIA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
  hr_employees.prc_add_employee(1234567,'Ana','Gherca','AGHERCA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
  hr_employees.prc_adjust_employee_data(999,'Ana','Gherca','AGHERCA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1400,null,100,20);
  hr_employees.prc_adjust_employee_data(888,'Ana','Maria','AGHERCA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1000,null,100,20);
  hr_employees.prc_adjust_employee_data(12345,'Oana','Gavrila','OGAVRILA','0761502592',to_date('12.03.2016','DD.MM.YYYY'),'MK_MAN',1400,null,100,20);
  hr_employees.prc_remove_employee(999);
  hr_employees.prc_remove_employee(4321);
END;

