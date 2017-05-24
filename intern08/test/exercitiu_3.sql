DECLARE
   l_count      PLS_INTEGER;
   l_partnums   DBMS_SQL.number_table;
BEGIN
  SELECT COUNT (*) INTO l_count FROM plch_parts;

   DBMS_OUTPUT.put_line ('Count = ' || SQL%ROWCOUNT);
END;
/
