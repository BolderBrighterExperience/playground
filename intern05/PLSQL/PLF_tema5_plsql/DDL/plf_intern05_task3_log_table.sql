DROP TABLE plf_log_table;
CREATE TABLE plf_log_table(
						id_log NUMBER PRIMARY KEY,
						user_name VARCHAR2(100) NOT NULL,
						date_operation DATE NOT NULL,
						package_name VARCHAR2(100) NOT NULL,
						subprogram_name VARCHAR2(300) NOT NULL,
						log_code NUMBER,
						log_message VARCHAR2(300)
					  ); 
/

DROP SEQUENCE seq_intern05_log_table;
CREATE SEQUENCE seq_intern05_log_table
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 99999
			NOCACHE
			NOCYCLE;
/  