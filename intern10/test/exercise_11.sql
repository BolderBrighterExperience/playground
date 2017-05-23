DROP TABLE plch_customers;
CREATE TABLE plch_customers
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
/

--Use EXECUTE IMMEDIATE & BULK COLLECT INTO, OPEN cursor FOR & FETCH INTO
CREATE OR REPLACE PROCEDURE plch_show_customers(p_query VARCHAR2)
IS
    TYPE t_bulk_collect IS TABLE OF plch_customers.custname%TYPE;
    lt_bulk_collect t_bulk_collect;
    l_cursor SYS_REFCURSOR;
   /* CURSOR l_cursor
    IS
      SELECT custname
      FROM   plch_customers;*/
BEGIN

    /*OPEN l_cursor FOR p_query;
    FETCH l_cursor
    BULK COLLECT INTO lt_bulk_collect;
    CLOSE l_cursor;*/
    
   -- OR 
    
    EXECUTE IMMEDIATE p_query
    BULK COLLECT INTO lt_bulk_collect;
    
    FOR i in lt_bulk_collect.FIRST..lt_bulk_collect.LAST
    LOOP
    DBMS_OUTPUT.PUT_LINE(lt_bulk_collect(i));
    
    END LOOP;
END plch_show_customers;
/

BEGIN
   plch_show_customers (
     'select custname from plch_customers');
END;
/