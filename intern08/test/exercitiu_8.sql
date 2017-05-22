DECLARE
   wrong_date EXCEPTION;
   PRAGMA EXCEPTION_INIT(wrong_date, -01858);
BEGIN
   NULL; 
EXCEPTION
   WHEN wrong_date THEN
      NULL; 
END;
/
