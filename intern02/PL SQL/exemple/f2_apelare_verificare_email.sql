--apel functie verificare email
--/*
SET SERVEROUTPUT ON
ACCEPT p_email PROMPT 'Insert an address to check: '
DECLARE
    v_email VARCHAR2(50) := '&p_email';
BEGIN
    IF (gam_check_email(v_email)) THEN
        DBMS_OUTPUT.PUT_LINE(v_email||': Adresa corecta de email');
    ELSE 
        DBMS_OUTPUT.PUT_LINE(v_email||': Adresa incorecta de email');
    END IF;
END;
--*/