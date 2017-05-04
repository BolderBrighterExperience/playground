--Sa se incarce in tabela Mesaje primii 5 angajati, utilizand atributul %ROWCOUNT
--Am sters coloana REZ
DECLARE
    v_codAng gam_angajati2.cod_angajat%TYPE;
    v_nume gam_angajati2.nume%TYPE;
    CURSOR mes_cursor IS
        SELECT cod_angajat, nume
        FROM gam_angajati2;
BEGIN
    OPEN mes_cursor;
    LOOP
        FETCH mes_cursor INTO v_codAng, v_nume;
        EXIT WHEN mes_cursor%ROWCOUNT>5 OR mes_cursor%NOTFOUND;
        INSERT INTO gam_mesaje VALUES(v_codAng, v_nume);
    END LOOP;
    CLOSE mes_cursor;
END;
--SELECT * FROM gam_mesaje;