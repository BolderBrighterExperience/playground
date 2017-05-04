--Sa se afiseze lista cu numele, prenumele si salariul angajatilor din oficiul CH folosind un cursor explicit
--si trei variabile scalare
SET SERVEROUTPUT ON
DECLARE
    v_nume gam_angajati2.nume%TYPE;
    v_prenume gam_angajati2.prenume%TYPE;
    v_sal gam_angajati2.salariu%TYPE;
    CURSOR ang_cursor IS
          SELECT nume, prenume, salariu
          FROM gam_angajati2
          WHERE UPPER(cod_oficiu)='CH';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Lista cu angajatii din oficiul CH: ');
    OPEN ang_cursor;
    LOOP
        FETCH ang_cursor INTO v_nume, v_prenume, v_sal;
        EXIT WHEN ang_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_nume||' '||v_prenume||' are '||v_sal||' lei salariu.');
    END LOOP;
    CLOSE ang_cursor;
END;