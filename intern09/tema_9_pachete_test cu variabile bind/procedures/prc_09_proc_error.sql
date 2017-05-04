CREATE OR REPLACE procedure prc_log_table(
                                            an_id            IN NUMBER,
                                            as_log_code      IN VARCHAR2,
                                            ad_time          IN date,
                                            as_log_message   IN VARCHAR2,
                                            as_package_name  IN VARCHAR2
                                         ) 
IS
PRAGMA autonomous_transaction;
BEGIN
    INSERT INTO errorlog
    VALUES (
            seq_09_errorlog_id.NEXTVAL,
            as_log_code,
            SYSDATE,
            as_log_message,
            as_package_name
          );
COMMIT;
END prc_log_table;
/
