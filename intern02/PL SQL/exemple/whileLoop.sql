--sa se afiseze pe ecran structura WHILE loop..end loop numerele 9,7,4,0
SET SERVEROUTPUT ON
DECLARE
    v_number NUMBER(2) := 10;
    i NUMBER(1) := 1;
BEGIN
    WHILE v_number > 0
    LOOP
        v_number := v_number - i;
        i := i + 1;
        DBMS_OUTPUT.PUT_LINE(v_number);
        EXIT WHEN v_number < 0;
    END LOOP;
END;