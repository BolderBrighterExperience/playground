--2. Create a new table: 'PRINTED_ORDERS' (id type number (generated with a sequence), details type clob).
DROP TABLE printed_orders;
CREATE TABLE printed_orders
(
    id_printed_order    NUMBER PRIMARY KEY,
    details             CLOB
);

DROP SEQUENCE seq_printed_order_id;
CREATE SEQUENCE seq_printed_order_id
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;
