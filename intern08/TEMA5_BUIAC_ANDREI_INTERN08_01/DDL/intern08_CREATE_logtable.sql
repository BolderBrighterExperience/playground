DROP TABLE log_table;

CREATE TABLE log_table( 
						id_log NUMBER PRIMARY KEY,
						user_name VARCHAR2(100) NOT NULL,
						date_operation TIMESTAMP NOT NULL,
						package_name VARCHAR2(100) NOT NULL,
						subprogram_name VARCHAR2(300) NOT NULL,
						log_code NUMBER,
						log_message VARCHAR2(300)
				      ); 
