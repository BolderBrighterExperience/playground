CREATE OR REPLACE PROCEDURE plch_show_customers(as_cust VARCHAR2)
IS
    TYPE t_bulk_collect IS TABLE OF plch_customers.custname%TYPE;
    lt_bulk_collect t_bulk_collect;
   
BEGIN
    EXECUTE IMMEDIATE as_cust 
    BULK COLLECT INTO lt_bulk_collect;

    FOR i in lt_bulk_collect.FIRST..lt_bulk_collect.LAST
    LOOP
        DBMS_OUTPUT.PUT_LINE(lt_bulk_collect(i));

    END LOOP;
END plch_show_customers;
/ 

BEGIN
   plch_show_customers (
     'select custname from plch_customers order by custname');
END;
/