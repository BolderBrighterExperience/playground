CREATE OR REPLACE PROCEDURE prc_log_table 
	(an_id 			    IN  gam_log_table.id%TYPE,
	 as_user 			IN  gam_log_table.user_name%TYPE,
	 ad_date 			IN  gam_log_table.date_operation%TYPE,
	 as_package 		IN  gam_log_table.package_name%TYPE,
	 as_sub_name 		IN  gam_log_table.subprogram_name%TYPE,
     an_error_code 	    IN  gam_log_table.error_code%TYPE,
	 as_error_message   IN  gam_log_table.error_message%TYPE)
IS
BEGIN 
	INSERT
	INTO 	log_table
	VALUES 	( an_id,
              as_user,
			  ad_date,
			  as_package,
			  as_sub_name,
              an_error_code,
			  as_error_message );
  COMMIT;
END;