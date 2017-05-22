/*CREATE TABLE qz_toys (toy_name VARCHAR2 (20))
/

BEGIN
   INSERT INTO qz_toys (toy_name)
        VALUES ('blocks');

   INSERT INTO qz_toys (toy_name)
        VALUES ('princesses');

   INSERT INTO qz_toys (toy_name)
        VALUES ('rocking horse');

   COMMIT;
END;
/*/

DECLARE
  TYPE toys_t
  IS
    TABLE OF qz_toys%rowtype;
  l_toys toys_t;
  BEGIN
    SELECT * BULK COLLECT INTO l_toys FROM qz_toys;
    FOR i IN 1..l_toys.count
    LOOP
      DBMS_OUTPUT.PUT_LINE (l_toys(i).toy_name);
    END LOOP;
END;
/


