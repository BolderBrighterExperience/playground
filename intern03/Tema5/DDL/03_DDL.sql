DROP SEQUENCE seq_credit_line_id;
DROP TABLE credit_line;

CREATE TABLE credit_line( 
                            credit_line_id      NUMBER,
                            customer_id         NUMBER(8),
                            credit_limit        NUMBER(10,2) NOT NULL,
                            creation_date       DATE NOT NULL,
                            valid_from          DATE NOT NULL,
                            valid_to            DATE NOT NULL,
                            last_change_date    DATE NOT NULL,
                            CONSTRAINT CHK_creditlimit CHECK (credit_limit>=0),
                            CONSTRAINT credit_line_pk PRIMARY KEY (credit_line_id),
                            CONSTRAINT CREDITLINE_CUSTOMERS_fk FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
                        );
                        
COMMENT ON COLUMN credit_line.credit_line_id IS 'primary key for table';
COMMENT ON COLUMN credit_line.customer_id IS 'Customer if for Credit line';
COMMENT ON COLUMN credit_line.credit_limit IS 'The amount of credit available to the customer';
COMMENT ON COLUMN credit_line.creation_date IS 'Creation date of the credit line';
COMMENT ON COLUMN credit_line.valid_from IS 'Credit line valid from date';
COMMENT ON COLUMN credit_line.valid_to IS 'Credit line valid to date';
COMMENT ON COLUMN credit_line.last_change_date IS 'Date of the last change of credit line amount';

CREATE SEQUENCE seq_credit_line_id
INCREMENT BY 1 
MAXVALUE 5000;
/
