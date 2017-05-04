DROP TABLE cs_credit_line CASCADE CONSTRAINTS;
DROP SEQUENCE seq_cs_credit_line;

CREATE TABLE cs_credit_line (
	credit_line_id NUMBER PRIMARY KEY,
	customer_id NUMBER(8),
	credit_limit NUMBER(10,2) NOT NULL CHECK (credit_limit > 0),
	creation_date DATE NOT NULL, 
	valid_from DATE NOT NULL,
	valid_to DATE NOT NULL,
	last_change_date DATE NOT NULL,
	CONSTRAINT fk_cs_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

COMMENT ON COLUMN cs_credit_line.credit_line_id IS 'primary key for table';
COMMENT ON COLUMN cs_credit_line.customer_id IS 'Customer if for Credit line';
COMMENT ON COLUMN cs_credit_line.credit_limit IS 'The amount of credit available to the customer';
COMMENT ON COLUMN cs_credit_line.creation_date IS 'Creation date of the credit line';
COMMENT ON COLUMN cs_credit_line.valid_from IS 'Credit line valid from date';
COMMENT ON COLUMN cs_credit_line.valid_to IS 'Credit line valid to date';
COMMENT ON COLUMN cs_credit_line.last_change_date IS 'Date of the last change of credit line amount';

CREATE SEQUENCE seq_cs_credit_line
START WITH 1
INCREMENT BY 1;