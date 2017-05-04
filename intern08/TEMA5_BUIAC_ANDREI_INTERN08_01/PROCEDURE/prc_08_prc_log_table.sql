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
					INSERT INTO log_table 
					VALUES (p_id_log,p_user_name,p_date_operation,p_package_name,p_subprogram_name,p_log_code,p_log_message);         
				END	prc_log_table; 
        
        
        
  /      