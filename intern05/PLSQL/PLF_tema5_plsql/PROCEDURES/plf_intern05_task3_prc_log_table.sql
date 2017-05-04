
CREATE OR REPLACE PROCEDURE prc_log_table (
	as_user 		       plf_log_table.user_name%TYPE,
	ad_date_operation	 plf_log_table.date_operation%TYPE,
	as_package_name    plf_log_table.package_name%TYPE,
	as_subprogram_name plf_log_table.subprogram_name%TYPE,
    an_log_code        plf_log_table.log_code%TYPE,
	as_log_message     plf_log_table.log_message%TYPE)
IS
  PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN 

	INSERT
	INTO 	plf_log_table
	VALUES 	(
			    seq_intern05_log_table.NEXTVAL,
		      as_user,
		      ad_date_operation,
		      as_package_name,
		      as_subprogram_name,
		      an_log_code,
		      as_log_message);
	COMMIT;

END prc_log_table;
/
