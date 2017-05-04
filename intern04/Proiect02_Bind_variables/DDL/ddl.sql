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
/