--sa se afiseze pe ecran structura FOR..end loop numerele 9,7,4,0
SET SERVEROUTPUT ON
DECLARE
    v_number NUMBER(2) := 10;
    i NUMBER(1);
BEGIN
    FOR i IN 1..10
    LOOP
        v_number := v_number - i;
        DBMS_OUTPUT.PUT_LINE(v_number);
        EXIT WHEN v_number = 0;
    END LOOP;
END;