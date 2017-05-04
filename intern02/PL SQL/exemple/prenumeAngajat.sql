--se afiseaza salariul si prenumele angajatului cu numele Leonid
SET SERVEROUTPUT ON
DECLARE
    v_nume GAM_ANGAJATI2.NUME%TYPE;
    v_prenume GAM_ANGAJATI2.PRENUME%TYPE := 'Leonid';
    v_salariu GAM_ANGAJATI2.SALARIU%TYPE;
BEGIN
    SELECT nume, salariu
    INTO v_nume, v_salariu
    FROM gam_angajati2
    WHERE prenume = v_prenume;
    DBMS_OUTPUT.PUT_LINE('Angajatul '||v_nume||' '||v_prenume||' are '||v_salariu||' lei salariu.');
END;