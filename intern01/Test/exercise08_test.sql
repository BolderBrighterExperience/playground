
DECLARE
    error_date    EXCEPTION;
    PRAGMA EXCEPTION_INIT(error_date, -1858);
    v_date  DATE;
BEGIN
    SELECT TO_DATE( '13-DEC-2004 6:56 PM', 'DD-MON-YYYY HH:MI:SS') INTO v_date FROM dual;
    EXCEPTION
        WHEN error_date THEN
           prc_record_table(  SQLCODE, SQLERRM, 'eroare','bloc anonim');
            DBMS_OUTPUT.PUT_LINE('Exception catched!');
END;
/