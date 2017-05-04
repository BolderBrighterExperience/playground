CREATE OR REPLACE PROCEDURE proc_log(
                                         an_code   NUMBER,
                                         as_mesg   VARCHAR2,
                                         as_types  VARCHAR2,
                                         as_source VARCHAR2
					                     )
IS
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    INSERT 
    INTO table_log
    VALUES (
            err_seq.NEXTVAL,
            an_code,
            as_mesg, 
            SYSDATE,
            USER,
            as_types,
            as_source
            );
    COMMIT;

END proc_log;
/
