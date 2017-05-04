DROP TABLE table_log;

CREATE TABLE table_log(
                        log_id 		        NUMBER PRIMARY KEY,
                        username 	        VARCHAR2(50),
                        error_date 	        DATE,
                        error_code          INTEGER,
                        error_message       VARCHAR2(250),
                        information_type    VARCHAR2(150),
                        location            VARCHAR2(150)
                        );  
                  
DROP SEQUENCE seq_log_id;   

CREATE SEQUENCE seq_log_id
START WITH 1
INCREMENT BY 1;