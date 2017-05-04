DROP TABLE log_table;
CREATE TABLE log_table
(
	id                  NUMBER PRIMARY KEY,
	user_name           VARCHAR2(50) NOT NULL,
	date_operation      TIMESTAMP NOT NULL,
	package_name        VARCHAR2(50) NOT NULL,
	subprogram_name     VARCHAR2(255) NOT NULL,
    error_code          NUMBER,
	error_message       VARCHAR2(255)
);

DROP SEQUENCE seq_intern02_log_table;
CREATE SEQUENCE seq_intern02_log_table
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 10000000000000000;
    