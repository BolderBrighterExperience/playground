 SET SERVEROUTPUT ON
DECLARE
    TYPE array IS TABLE OF qz_toys.toy_name%TYPE INDEX BY BINARY_INTEGER;
    l_data array;
    CURSOR cur_toy IS
    SELECT toy_name
    FROM qz_toys;
BEGIN
    OPEN cur_toy;
    FETCH cur_toy BULK COLLECT INTO l_data;
    CLOSE cur_toy;
    FOR i IN l_data.FIRST .. l_data.LAST
    LOOP
      DBMS_OUTPUT.PUT_LINE(l_data(i));
    END LOOP;
END;
/ 