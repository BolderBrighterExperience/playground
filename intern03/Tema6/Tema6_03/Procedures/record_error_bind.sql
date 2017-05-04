CREATE OR REPLACE PROCEDURE proc_log(
                                         an_code   NUMBER,
                                         as_mesg   VARCHAR2,
                                         as_types  VARCHAR2,
                                         as_source VARCHAR2
					                     )
IS
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    EXECUTE IMMEDIATE   'INSERT 
                        INTO table_log
                        VALUES (
                                err_seq.NEXTVAL,
                                :1,
                                :2, 
                                SYSDATE,
                                USER,
                                :3,
                                :4
                                );'
    USING an_code,  
          as_mesg,
          as_types,
          as_source;
    COMMIT;

END proc_log;
/
