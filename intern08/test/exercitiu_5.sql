DECLARE
  TYPE t_toys IS TABLE OF qz_toys%ROWTYPE;
  r_toys t_toys;
  BEGIN
    SELECT * BULK COLLECT INTO r_toys FROM qz_toys;
    FOR i IN 1..r_toys.count
    LOOP
      DBMS_OUTPUT.PUT_LINE (r_toys(i).toy_name);
    END LOOP;
END;
/ 
