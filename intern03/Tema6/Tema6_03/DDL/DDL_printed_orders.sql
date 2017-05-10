/*1. Table Orders: Add new column PRINTED type: number(1). 
    Values allow: 0, 1. Default value: 0 (not printed). 
  2.Create a new table: 'PRINTED_ORDERS' (id type number (generated with a sequence), details type clob)*/
ALTER TABLE orders
DROP COLUMN printed;
DROP SEQUENCE id_type_seq;
DROP TABLE printed_orders;

ALTER TABLE orders
ADD printed NUMBER(1) DEFAULT 0
CONSTRAINT ck_print_order CHECK (printed IN (0, 1));

CREATE SEQUENCE id_type_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 8000;

CREATE TABLE printed_orders(
                            id_type NUMBER PRIMARY KEY,
                            details CLOB
                            );
/

