--functie pentru verificare adresa email
CREATE OR REPLACE FUNCTION gam_check_email
  (email VARCHAR2)
  RETURN BOOLEAN
  IS  v_email VARCHAR2(50);
BEGIN
    v_email := email;
    IF (v_email LIKE '_%@ibm%.__%') THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;