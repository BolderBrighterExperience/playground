/*CREATE TABLE plch_customers
(
   custnum    INTEGER
 , custname   VARCHAR2 (100)
)
/

BEGIN
   INSERT INTO plch_customers
        VALUES (1, 'Oracle Corporation');

   INSERT INTO plch_customers
        VALUES (100, 'Quest Software');

   INSERT INTO plch_customers
        VALUES (500, 'Feuerstein and Associates');

   COMMIT;
END;
/*/

CREATE OR REPLACE PROCEDURE plch_show_customers(as_string  VARCHAR2)
IS
  TYPE t_string 
  IS 
      TABLE OF plch_customers.custname%type;  
  l_string   t_string;
BEGIN
    EXECUTE IMMEDIATE as_string BULK COLLECT INTO l_string ;
    FOR i IN l_string.FIRST..l_string.LAST
    LOOP
      DBMS_OUTPUT.PUT_LINE (l_string(i));
    END LOOP;
END;
/

BEGIN
   plch_show_customers('select custname from plch_customers order by custname') ;
END;
/
