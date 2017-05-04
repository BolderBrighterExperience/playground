CREATE OR REPLACE PROCEDURE prc_log_error (
                                            as_tip   IN VARCHAR2,
                                            an_code  IN NUMBER,
                                            as_msg   IN VARCHAR2,
                                            as_unit  IN VARCHAR2
                                            )
IS
PRAGMA AUTONOMOUS_TRANSACTION;
    ln_code  NUMBER          := an_code;
    ls_tip   VARCHAR2(10)    := as_tip;
    ls_msg   VARCHAR2(250)   := as_msg;
    ls_unit  VARCHAR2(50)    := as_unit;
BEGIN
    EXECUTE IMMEDIATE  'INSERT 
                        INTO log 
                        VALUES (
                                :1,
                                :2,
                                :3,
                                :4,
                                :5,
                                :6,
                                :7                            
                                )'
    USING   seq_log_id.NEXTVAL,
            USER,
            SYSDATE,
            ls_tip,
            ln_code,
            ls_msg,
            ls_unit;
            
    COMMIT;
END prc_log_error; 
/
