DECLARE
  TYPE toys_name
  IS
    TABLE OF qz_toys%rowtype;
  l_toys toys_name;
  BEGIN
    SELECT * BULK COLLECT INTO l_toys FROM qz_toys;
    FOR i IN 1..l_toys.count
    LOOP
      DBMS_OUTPUT.PUT_LINE (l_toys(i).toy_name);
    END LOOP;
END;
/