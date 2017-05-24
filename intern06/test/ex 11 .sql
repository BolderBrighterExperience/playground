


CREATE OR REPLACE PROCEDURE plch_show_customers(p_string varchar2)
AS
    TYPE rc is ref cursor; 
    l_cur rc; 

    TYPE array IS TABLE OF plch_customers.custname%TYPE INDEX BY BINARY_INTEGER; 
    l_data array; 
    BEGIN 
    OPEN l_cur FOR p_string; 
    LOOP 
    FETCH l_cur BULK COLLECT into l_data LIMIT 5; 

    FOR i IN 1 .. l_data.count 
    LOOP 
    dbms_output.put_line( l_data(i) ); 
    END LOOP; 
    EXIT WHEN l_cur%notfound; 
    END LOOP; 
END; 

set serveroutput on;


BEGIN
   plch_show_customers (
     'select custname from plch_customers order by custname');
END;
/
 
