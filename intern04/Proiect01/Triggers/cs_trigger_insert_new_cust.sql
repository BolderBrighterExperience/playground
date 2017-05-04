DROP TRIGGER trg_cs_insert_new_cust;

CREATE OR REPLACE TRIGGER trg_cs_insert_new_cust 
AFTER INSERT ON customers
FOR EACH ROW
BEGIN
	INSERT INTO cs_credit_line(
		credit_line_id, 
		customer_id, 
		credit_limit, 
		creation_date, 
		valid_from, 
		valid_to, 
		last_change_date)
	VALUES(
		seq_cs_credit_line.NEXTVAL, 
		:NEW.customer_id, 10000, 
		SYSDATE, 
		To_Date('01.01.2017','dd.mm.yyyy'), 
		To_Date('31.12.2020','dd.mm.yyyy'), 
		SYSDATE);
END;
/