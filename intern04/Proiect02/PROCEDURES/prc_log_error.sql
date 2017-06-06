CREATE OR REPLACE PROCEDURE prc_log_error (
                                            p_tip   IN VARCHAR2,
                                            p_code  IN NUMBER,
                                            p_msg   IN VARCHAR2,
                                            p_unit  IN VARCHAR2
                                            )
IS
PRAGMA AUTONOMOUS_TRANSACTION;
    v_code  NUMBER          := p_code;
    v_tip   VARCHAR2(10)    := p_tip;
    v_msg   VARCHAR2(250)   := p_msg;
    V_unit  VARCHAR2(50)    := p_unit;
BEGIN
    INSERT 
    INTO log
    VALUES (
            seq_log_id.NEXTVAL,
            USER,
            SYSDATE,
            v_tip,
            v_code,
            v_msg,
            v_unit
            );
    COMMIT;
END prc_log_error; 
/
