--functie de verificare numar prim
CREATE OR REPLACE FUNCTION gam_prime_number
  (n NUMBER)
RETURN BOOLEAN
IS v_number NUMBER;
   ok NUMBER;
BEGIN
  IF (MOD(n,2)=0) THEN 
      ok := 1;
  ELSE
      v_number := n/2;
      FOR i in 2..v_number
      LOOP
        IF(MOD(n,i)=0) THEN
            ok := 1;
        EXIT;
        ELSE
            ok := 0;
        END IF;
      END LOOP;
  END IF;
  IF ( n IN (0,1)) THEN
      RETURN NULL;
  ELSIF (ok=1) THEN
       RETURN FALSE;
  ELSE
       RETURN TRUE;
  END IF;
END;