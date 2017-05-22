CREATE TABLE plch_parts
(
   partnum    INTEGER PRIMARY KEY,
   partname   VARCHAR2 (100) UNIQUE
)
/

BEGIN
   INSERT INTO plch_parts VALUES (1, 'Mouse');
   INSERT INTO plch_parts VALUES (100, 'Keyboard');
   INSERT INTO plch_parts VALUES (500, 'Monitor');
   COMMIT;
END;
/

TYPE DBMS_SQL.number_table IS TABLE OF NUMBER INDEX BY PLS_INTEGER;

DECLARE
   l_count      PLS_INTEGER;
   l_partnums   DBMS_SQL.number_table;
BEGIN
   SELECT * BULK COLLECT INTO l_partnums FROM plch_parts;
  
   DBMS_OUTPUT.put_line ('Count = ' || SQL%ROWCOUNT);
END;
/
/*
-- Nu avem acces la DBMS_SQL

Error report -
ORA-06550: line 3, column 17:
PLS-00201: identifier 'DBMS_SQL' must be declared

*/
