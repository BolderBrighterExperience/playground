DROP TABLE errorlog;

CREATE TABLE errorlog
(
id NUMBER,
log_code VARCHAR2(9),
time DATE NOT NULL,
log_message VARCHAR2(2000) NOT NULL,
package_name varchar(50) not null,
CONSTRAINT error_logs_pk PRIMARY KEY (id)
);

DROP SEQUENCE seq_09_errorlog_id;

CREATE SEQUENCE seq_09_errorlog_id
MINVALUE 1
MAXVALUE 9999999
INCREMENT BY 1
START WITH 1
NOCYCLE;