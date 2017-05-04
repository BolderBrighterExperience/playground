DROP table credit_line;

CREATE TABLE credit_line (
        CREDIT_LINE_ID	number,	
      	CUSTOMER_ID number(8),
        CREDIT_LIMIT number(10,2) NOT NULL CONSTRAINT credit_limit_positive CHECK (credit_limit>0),
        CREATION_DATE  date  DEFAULT sysdate NOT NULL,
        VALID_FROM date	 DEFAULT TO_DATE('01.01.2017','DD.MM.YYYY') NOT NULL,
        VALID_TO date  DEFAULT TO_DATE('31.12.2020','DD.MM.YYYY') NOT NULL,
        LAST_CHANGE_DATE date DEFAULT sysdate NOT NULL,
        CONSTRAINT pk_CREDIT_LINE_ID PRIMARY KEY(CREDIT_LINE_ID),
        CONSTRAINT fk_CUSTOMER_ID FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
        );
        
    
 COMMENT ON COLUMN credit_line.credit_line_id IS 'primary key for table';  
 COMMENT ON COLUMN credit_line.customer_id IS 'Customer if for Credit line';  
 COMMENT ON COLUMN credit_line.credit_limit IS 'The amount of credit available to the customer';  
 COMMENT ON COLUMN credit_line.creation_date IS 'Creation date of the credit line';  
 COMMENT ON COLUMN credit_line.valid_from IS 'Credit line valid from date';
 COMMENT ON COLUMN credit_line.valid_to IS 'Credit line valid to date';     
 COMMENT ON COLUMN credit_line.last_change_date IS 'Date of the last change of credit line amount'; 
 

 DROP sequence seq_06_credit_line;
 
 CREATE sequence seq_06_credit_line
		INCREMENT BY 1
		START WITH 1
		MAXVALUE 99999
		NOCACHE
		NOCYCLE; 