--se afiseaza pe ecran utilizand structura LOOP..end loop numerele 9,7,4,0
SET SERVEROUTPUT ON
DECLARE
    v_nr NUMBER(2) := 10;
    i NUMBER(1) := 1;
BEGIN
    LOOP
        v_nr := v_nr - i;
        i := i + 1;
        EXIT WHEN v_nr<0;
        DBMS_OUTPUT.PUT_LINE(v_nr||' ');
    END LOOP;
END;