--primii 10 angajati cu atributele cursorului explicit
SET SERVEROUTPUT ON
DECLARE
    v_angid GAM_ANGAJATI2.COD_ANGAJAT%TYPE;
    v_angnume gam_angajati2.nume%TYPE;
    CURSOR ang_gam_cursor IS
        SELECT cod_angajat, nume
        FROM gam_angajati2;
BEGIN
    OPEN ang_gam_cursor;
    LOOP
        FETCH ang_gam_cursor INTO v_angid, v_angnume;
        EXIT WHEN ang_gam_cursor%ROWCOUNT > 10 OR ang_gam_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_angid||'     '||v_angnume);
    END LOOP;
    CLOSE ang_gam_cursor;
END;