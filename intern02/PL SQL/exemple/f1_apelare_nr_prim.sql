--apel functie cu numar citit de la tastatura.
--determinare numar prim mai mic decat un numar dat
SET SERVEROUTPUT ON
ACCEPT p_number PROMPT 'Insert a number to verify if is prime'
DECLARE
  v_nr  NUMBER := &p_number;
  i NUMBER := 1;
BEGIN      
    IF (gam_prime_number(v_nr) IS NULL ) THEN
        DBMS_OUTPUT.PUT_LINE('0 or 1 are not prime numbers.');
    ELSIF (gam_prime_number(v_nr)) THEN
       DBMS_OUTPUT.PUT_LINE(v_nr||': prime number');
    ELSE
       DBMS_OUTPUT.PUT_LINE(v_nr||': not a prime number. Searching for the next prime number smaller than '||v_nr);
       WHILE v_nr > 0
       LOOP
          v_nr := v_nr - i;
          IF (gam_prime_number(v_nr)) THEN
                DBMS_OUTPUT.PUT_LINE(v_nr||': prime number');
                EXIT;
          ELSE
                i := i + 1;
          END IF;
       END LOOP;
  END IF;
END;
