CREATE OR REPLACE PROCEDURE prc_record_table(
                                             an_error_code       table_log.error_code%TYPE,
                                             as_error_message    table_log.error_message%TYPE,
                                             as_information_type table_log.information_type%TYPE,
                                             as_location         table_log.location%TYPE
                                             )
IS
    PRAGMA AUTONOMOUS_TRANSACTION;
	
BEGIN
	INSERT 
	INTO table_log 
    VALUES(
			        seq_log_id.nextval,
                    USER,
                    SYSDATE,
                    an_error_code,
                    as_error_message,
                    as_information_type, 
			        as_location                   
                    );
COMMIT;              
END;                  
/