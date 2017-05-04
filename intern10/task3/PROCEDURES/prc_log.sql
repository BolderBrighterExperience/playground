CREATE OR REPLACE PROCEDURE prc_log(as_type VARCHAR2,as_source VARCHAR2)
IS
    PRAGMA AUTONOMOUS_TRANSACTION;
    ln_error_code     NUMBER(10)    := SQLCODE;
    ls_error_message  VARCHAR2(100) := SQLERRM; 
BEGIN
    INSERT 
    INTO errors(
                id_log,
                created_by,
                data_log,
                error_code,
                error_message,
                type,
                source
                )
    VALUES(
           log_seq.NEXTVAL,
           USER,
           SYSDATE,
           ln_error_code,
           ls_error_message,
           as_type,
           as_source
          );

    COMMIT;
END;
/