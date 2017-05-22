DECLARE
    e_date    EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_date, -1858);
    v_date  DATE;
BEGIN
    SELECT TO_DATE( '13-DEC-2004 6:56 PM', 'DD-MON-YYYY HH:MI:SS') INTO v_date FROM dual;
    EXCEPTION
        WHEN e_date THEN
            PRC_LOG_ERROR( 'error', SQLCODE, SQLERRM, 'anonymous block');
            DBMS_OUTPUT.PUT_LINE('Exceptia pentru data a fost prinsa');
END;
/