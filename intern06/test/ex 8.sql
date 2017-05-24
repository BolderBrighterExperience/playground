 DECLARE
   bad_date EXCEPTION;
   PRAGMA EXCEPTION_INIT (bad_date, -01858);
  BEGIN
    DBMS_OUTPUT.PUT_LINE ( TO_DATE ('13-DEC-2004 6:56 PM','DD-MON-YYYY HH:MI:SS'));
   EXCEPTION
     WHEN bad_date
   THEN
    DBMS_OUTPUT.PUT_LINE('Bad date format');
 END;
  /