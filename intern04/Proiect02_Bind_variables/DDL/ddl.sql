DROP TABLE log;
DROP SEQUENCE seq_log_id;

CREATE TABLE log( 
                log_id      NUMBER PRIMARY KEY,
                username    VARCHAR2(50), 
                data        DATE, 
                tip         VARCHAR2(10),   
                cod         NUMBER(6),
                message     VARCHAR2(250),
                unit        VARCHAR2(50)
);

CREATE SEQUENCE seq_log_id  
START WITH 1
INCREMENT BY 1;


DROP TABLE      printed_orders;

DROP SEQUENCE   seq_printed_orders;

ALTER TABLE     orders 
DROP COLUMN     printed;

ALTER TABLE     orders 
ADD             printed     NUMBER(1) DEFAULT 0 
CONSTRAINT      ck_printed  CHECK (printed IN (0,1));

CREATE SEQUENCE seq_printed_orders 
    START WITH  1 
    INCREMENT BY 1;

CREATE TABLE printed_orders(
                            id          NUMBER PRIMARY KEY,
                            details     CLOB
                            );

/

