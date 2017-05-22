DECLARE
   l_count      PLS_INTEGER;
   l_partnums   DBMS_SQL.NUMBER_TABLE;

BEGIN
    TYPE array_t IS TABLE OF plch_parts.partname%TYPE INDEX BY PLS_INTEGER;
    SELECT COUNT (*) INTO l_count FROM plch_parts; 
    DBMS_OUTPUT.PUT_LINE ('Count = ' || l_count || SQL%ROWCOUNT);
END;
/
