CREATE OR REPLACE PROCEDURE plch_show_customers(as_custname  plch_customers.custname%TYPE)
IS
  TYPE t_custname IS 
      TABLE OF plch_customers.custname%type;  
  l_custname   t_custname;
BEGIN
    EXECUTE IMMEDIATE as_custname BULK COLLECT INTO l_custname ;
    FOR i IN l_custname.FIRST..l_custname.LAST
    LOOP
      DBMS_OUTPUT.PUT_LINE (l_custname(i));
    END LOOP;
END;
/

SET SERVEROUTPUT ON
BEGIN
   plch_show_customers('SELECT custname FROM plch_customers ORDER BY custname') ;
END;
/