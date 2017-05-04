DROP TABLE DT_Credit_line CASCADE CONSTRAINTS;


CREATE TABLE DT_Credit_line(credit_line_id NUMBER PRIMARY KEY,
                            customer_id NUMBER(8),
                            CONSTRAINT DT_credit_line_customer_id_FK FOREIGN KEY(customer_id) REFERENCES Customers(customer_id),
                            credit_limit NUMBER(10,2) NOT NULL CHECK (credit_limit >= 0), 
                            creation_date DATE NOT NULL,
                            valid_form DATE NOT NULL ,
                            valid_to DATE NOT NULL ,
                            last_change_date DATE NOT NULL);
                            
COMMENT ON COLUMN DT_Credit_line.credit_line_id  IS 'primary key for table';
COMMENT ON COLUMN DT_Credit_line.customer_id IS 'Customer if for Credit line';
COMMENT ON COLUMN DT_Credit_line.credit_limit IS 'The amount of credit available to the customer';
COMMENT ON COLUMN DT_Credit_line.creation_date IS 'Creation date of the credit line';
COMMENT ON COLUMN DT_Credit_line.valid_form IS 'Credit line valid from date';
COMMENT ON COLUMN DT_Credit_line.valid_to IS 'Credit line valid to date';
COMMENT ON COLUMN DT_Credit_line.last_change_date IS 'Date of the last change of credit line amount';

