--sa se incarce in tabela mesaje numere de la 1..10, fara 6 si 8
CREATE TABLE GAM_MESAJE
(
    REZ VARCHAR2(30)
);
SET SERVEROUTPUT ON
DECLARE
    i NUMBER(2);
BEGIN
    FOR i IN 1..10
    LOOP
        IF( i=6 OR i=8) THEN
            NULL;
        ELSE
            INSERT INTO GAM_MESAJE(REZ) VALUES(i);
        END IF;
        --COMMIT;
    END LOOP;
END;
--SELECT * FROM GAM_MESAJE;
