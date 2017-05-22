DROP TABLE qz_toys;
CREATE TABLE qz_toys (toy_name VARCHAR2 (20))
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
/

DECLARE
    TYPE t_toys IS TABLE OF qz_toys%ROWTYPE INDEX BY PLS_INTEGER;
    lt_toys t_toys;      
BEGIN 
    SELECT *
    BULK COLLECT INTO lt_toys
    FROM qz_toys;
    
    FOR i IN lt_toys.FIRST..lt_toys.LAST
    LOOP
        DBMS_OUTPUT.PUT_LINE(lt_toys(i).toy_name);
    END LOOP;
END;
/

