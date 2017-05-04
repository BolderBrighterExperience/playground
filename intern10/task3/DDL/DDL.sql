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
/