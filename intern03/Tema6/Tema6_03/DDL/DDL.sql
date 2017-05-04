DROP TABLE table_log;
DROP SEQUENCE err_seq;

CREATE TABLE table_log
        (  
          id_seq        NUMBER,
          error_code    NUMBER(10),
          error_message VARCHAR2(250),
          data_log      DATE,
          created_by    VARCHAR2(40),
          types         VARCHAR2(50),
          source        VARCHAR2(50)
        );

CREATE SEQUENCE err_seq
START WITH 1
INCREMENT BY 1;
/ 
