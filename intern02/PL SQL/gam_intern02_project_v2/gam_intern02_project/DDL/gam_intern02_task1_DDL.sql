DROP TABLE GAM_CREDIT_LINE;
CREATE TABLE GAM_CREDIT_LINE (CREDIT_LINE_ID NUMBER PRIMARY KEY,
                              CUSTOMER_ID NUMBER(8),
                              CREDIT_LIMIT NUMBER(10,2) NOT NULL CHECK (credit_limit>0),
                              CREATION_DATE DATE NOT NULL,
                              VALID_FROM DATE NOT NULL,
                              VALID_TO DATE NOT NULL,
                              LAST_CHANGE_DATE DATE NOT NULL,
                              CONSTRAINT gam_fk_custId FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
                              );                       
COMMENT ON COLUMN gam_credit_line.credit_line_id IS 'primary key for table';
COMMENT ON COLUMN gam_credit_line.customer_id IS 'Customer if for Credit line';
COMMENT ON COLUMN gam_credit_line.credit_limit IS 'The amount of credit available to the customer';
COMMENT ON COLUMN gam_credit_line.creation_date IS 'Creation date of the credit line';
COMMENT ON COLUMN gam_credit_line.valid_from IS 'Credit line valid from date';
COMMENT ON COLUMN gam_credit_line.valid_to IS 'Credit line valid to date';
COMMENT ON COLUMN gam_credit_line.last_change_date IS 'Date of the last change of credit line amount';

DROP SEQUENCE seq_intern02_credit_line;
    CREATE SEQUENCE seq_intern02_credit_line
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10000;
