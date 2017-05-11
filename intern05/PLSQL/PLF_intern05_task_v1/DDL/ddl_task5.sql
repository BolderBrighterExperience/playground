-- Table Orders: Add new column PRINTED type: number(1). Values allow: 0, 1. Default value: 0 (not printed).    
ALTER TABLE orders ADD PRINTED number(1) check ( PRINTED = 1 or PRINTED = 0 );

--  Create a new table: 'PRINTED_ORDERS' (id type number (generated with a sequence), details type clob).

DROP SEQUENCE SEQ_ID_TYPE;

CREATE SEQUENCE SEQ_ID_TYPE
    MINVALUE 1
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 99999
    NOCACHE
    NOCYCLE;

DROP TABLE printed_orders CASCADE CONSTRAINTS;
CREATE TABLE PRINTED_ORDERS ( id_type number , details clob);