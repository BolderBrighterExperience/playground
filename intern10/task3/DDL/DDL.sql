DROP TABLE errors;
DROP SEQUENCE log_seq;

CREATE TABLE errors
        (
          id_log        NUMBER,
          created_by    VARCHAR2(40),
          data_log      DATE,
          error_code    NUMBER(10),
          error_message VARCHAR2(100),
          type          VARCHAR2(40),
          source        VARCHAR2(40)
        );

CREATE SEQUENCE log_seq
START WITH 1
INCREMENT BY 1;

ALTER TABLE ORDERS
DROP COLUMN PRINTED;
DROP SEQUENCE printed_id_seq;
DROP TABLE printed_orders;

ALTER TABLE orders
    ADD printed NUMBER(1) DEFAULT 0
    CONSTRAINT chk_val CHECK(printed = 0 OR printed = 1);

CREATE TABLE printed_orders(id NUMBER, 
                            details CLOB
                            );

CREATE SEQUENCE printed_id_seq
START WITH 1
INCREMENT BY 1;
/


