The attempt to convert this string "13-DEC-2004 6:56 PM" to a date 
using this format mask "DD-MON-YYYY HH:MI:SS" will result in Oracle raising the ORA-01858 error.

Write a block that generates and catches this particular error in an exception.
Hint: use EXCEPTION_INIT pragma to deal with the exception. 


DECLARE
   error_date EXCEPTION;
   PRAGMA EXCEPTION_INIT(error_date, -01858);
BEGIN
   NULL;
EXCEPTION
   WHEN error_date THEN
      DBMS_OUTPUT.PUT_LINE('HANDLING INVALID INPUT BY ROLLING BACK.');
END;
/  
