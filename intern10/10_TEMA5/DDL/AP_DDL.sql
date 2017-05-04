DROP TABLE AP_CREDIT_LINE;
DROP SEQUENCE SEQ_AP_CREDIT_LINE;

CREATE TABLE AP_CREDIT_LINE
   (
    credit_line_id      NUMBER PRIMARY KEY,
    customer_id         NUMBER(8) NOT NULL,
    credit_limit        NUMBER(10,2) NOT NULL,
    creation_date       DATE NOT NULL,
    valid_from          DATE NOT NULL,
    valid_to            DATE NOT NULL,
    last_change_date    DATE NOT NULL,
    CONSTRAINT fk_customer_id FOREIGN KEY(customer_id) REFERENCES CUSTOMERS(customer_id),
    CONSTRAINT ck_credit_lim CHECK(credit_limit > = 0)
   );
    
COMMENT ON COLUMN AP_CREDIT_LINE.credit_line_id IS 'primary key for table';
COMMENT ON COLUMN AP_CREDIT_LINE.customer_id IS 'Customer if for Credit line';
COMMENT ON COLUMN AP_CREDIT_LINE.credit_limit IS 'The amount of credit available to the customer';
COMMENT ON COLUMN AP_CREDIT_LINE.creation_date IS 'Creation date of the credit line';
COMMENT ON COLUMN AP_CREDIT_LINE.valid_from IS 'Credit line valid from date';
COMMENT ON COLUMN AP_CREDIT_LINE.valid_to IS 'Credit line valid to date';
COMMENT ON COLUMN AP_CREDIT_LINE.last_change_date IS 'Date of the last change of credit line amount';
    
CREATE SEQUENCE SEQ_AP_CREDIT_LINE
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;
/
