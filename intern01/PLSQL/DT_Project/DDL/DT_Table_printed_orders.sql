ALTER TABLE Orders DROP COLUMN  printed;     
ALTER TABLE Orders ADD printed  NUMBER(1) DEFAULT 0 CONSTRAINT chk_val CHECK(printed = 0 OR printed = 1);



DROP TABLE PRINTED_ORDERS;
CREATE TABLE PRINTED_ORDERS(  id NUMBER,
                              details CLOB
                            );
                              
DROP SEQUENCE SEQ_PRINTED_ORDERS;      

CREATE SEQUENCE SEQ_PRINTED_ORDERS
START WITH 1
INCREMENT BY 1;


