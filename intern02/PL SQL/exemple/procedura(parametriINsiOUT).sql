--procedura cu parametri de tip IN si parametrii de tip OUT
CREATE OR REPLACE PROCEDURE gam_query_emp
  (p_cod   IN   GAM_ANGAJATI2.COD_ANGAJAT%TYPE,
  p_nume   OUT  GAM_ANGAJATI2.NUME%TYPE,
  p_prenume OUT GAM_ANGAJATI2.PRENUME%TYPE,
  p_salariu OUT GAM_ANGAJATI2.SALARIU%TYPE)
IS
BEGIN
    SELECT nume, prenume, salariu
    INTO p_nume, p_prenume, p_salariu
    FROM GAM_ANGAJATI2
    WHERE cod_angajat=p_cod;
    DBMS_OUTPUT.PUT_LINE('Angajatul '||p_nume||' '||p_prenume||' are salariul de '||p_salariu||' lei.');
END;
--apel procedura
/*SET SERVEROUTPUT ON
DECLARE
    v_nume GAM_ANGAJATI2.NUME%TYPE;
    v_prenume GAM_ANGAJATI2.PRENUME%TYPE;
    v_salariu GAM_ANGAJATI2.SALARIU%TYPE;
BEGIN
    gam_query_emp('AI', v_nume, v_prenume, v_salariu);
    gam_query_emp('GA', v_nume, v_prenume, v_salariu);
    gam_query_emp('GV', v_nume, v_prenume, v_salariu);
END;*/