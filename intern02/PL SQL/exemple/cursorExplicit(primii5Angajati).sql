--Sa se incarce in tabela Mesaje primii 5 angajati
--ALTER TABLE GAM_MESAJEADD COD_ANG VARCHAR2(2);
--ALTER TABLE GAM_MESAJEADD NUME VARCHAR2(30);
DECLARE
    v_codAng gam_angajati2.cod_angajat%TYPE;
    v_nume gam_angajati2.nume%TYPE;
    CURSOR mes_cursor IS
        SELECT cod_angajat, nume
        FROM gam_angajati2;
BEGIN
    OPEN mes_cursor;
    FOR i IN 1..5 
      LOOP
        FETCH mes_cursor INTO v_codAng, v_nume;
        INSERT INTO gam_mesaje VALUES(i, v_codAng, v_nume);
      END LOOP;
    CLOSE mes_cursor;
END;
--SELECT * FROM GAM_MESAJE;