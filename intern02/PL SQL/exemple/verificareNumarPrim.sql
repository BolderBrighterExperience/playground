--functie de verificare numar prim
/*CREATE OR REPLACE FUNCTION gam_prime_number
  (n NUMBER)
RETURN VARCHAR2
IS v_number NUMBER;
   prime VARCHAR2(50);
BEGIN
  v_number := n/2;
  FOR i in 2..v_number
  LOOP
      IF(MOD(n,i)=0) THEN
          prime := 'not a prime number';
      EXIT;
      ELSE
          prime := 'prime number';
      END IF;
  END LOOP;
  RETURN prime;
END;*/

--apel functie
--citire numar de la tastatura
SET SERVEROUTPUT ON
ACCEPT p_number PROMPT 'Insert a number to verify if is prime'
DECLARE
  V_PRIME VARCHAR2(50);
  v_nr  NUMBER := &p_number;
BEGIN
  V_PRIME := gam_prime_number(&p_number);
  DBMS_OUTPUT.PUT_LINE(v_nr||': '||V_PRIME);
END;

