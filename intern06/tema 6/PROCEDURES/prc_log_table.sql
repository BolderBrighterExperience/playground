



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

DROP SEQUENCE seq_06_log_table;

CREATE SEQUENCE seq_06_log_table
		INCREMENT BY 1
		START WITH 1
		MAXVALUE 99999
		NOCACHE
		NOCYCLE; 
    
	
    
    CREATE OR REPLACE PROCEDURE prc_log_table
                            (
                      p_id_log log_table.id_log%TYPE,
                      p_user_name log_table.user_name%TYPE,
                      p_date_operation log_table.date_operation%TYPE,
                      p_package_name log_table.package_name%TYPE,
                      p_subprogram_name log_table.subprogram_name%TYPE,
                      p_log_code log_table.log_code%TYPE,
					  p_log_message log_table.log_message%TYPE
					)
				IS 
				BEGIN
					INSERT INTO log_table (id_log,user_name,date_operation,package_name,subprogram_name,log_code,log_message)
					VALUES (p_id_log,p_user_name,p_date_operation,p_package_name,p_subprogram_name,p_log_code,p_log_message);         
				END	prc_log_table;