DROP TABLE credit_line;

CREATE TABLE credit_line 
( 
    credit_line_id      NUMBER PRIMARY KEY,
    customer_id         NUMBER(8) NOT NULL, 
    credit_limit        NUMBER(10,2) DEFAULT 10000 NOT NULL,
    creation_date       DATE DEFAULT SYSDATE NOT NULL,
    valid_from          DATE DEFAULT TO_DATE('01.01.2017','DD.MM.YYYY') NOT NULL,
    valid_to            DATE DEFAULT TO_DATE('31.12.2020','DD.MM.YYYY') NOT NULL,
    last_change_date    DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT customer_id_fk FOREIGN KEY ( customer_id ) REFERENCES customers( customer_id ),
    CONSTRAINT credit_limit_neg CHECK ( credit_limit>0 )   
);

COMMENT ON COLUMN credit_line.credit_line_id IS 'primary key for table';  
COMMENT ON COLUMN credit_line.customer_id IS 'Customer if for Credit line';  
COMMENT ON COLUMN credit_line.credit_limit IS 'The amount of credit available to the customer';  
COMMENT ON COLUMN credit_line.creation_date IS 'Creation date of the credit line';  
COMMENT ON COLUMN credit_line.valid_from IS 'Credit line valid from date';
COMMENT ON COLUMN credit_line.valid_to IS 'Credit line valid to date';     
COMMENT ON COLUMN credit_line.last_change_date IS 'Date of the last change of credit line amount';  
/
