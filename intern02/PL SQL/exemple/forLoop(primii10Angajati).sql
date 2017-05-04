--primii 10 angajati cu FOR
SET SERVEROUTPUT ON
DECLARE
    v_angid GAM_ANGAJATI2.COD_ANGAJAT%TYPE;
    v_angnume gam_angajati2.nume%TYPE;
    CURSOR ang_gam_cursor IS
        SELECT cod_angajat, nume
        FROM gam_angajati2;
BEGIN
    OPEN ang_gam_cursor;
    FOR i IN 1..10 LOOP
        FETCH ang_gam_cursor INTO v_angid, v_angnume;
        DBMS_OUTPUT.PUT_LINE(v_angid||'     '||v_angnume);
    END LOOP;
    CLOSE ang_gam_cursor;
END;
