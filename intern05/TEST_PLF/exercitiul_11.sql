CREATE OR REPLACE PROCEDURE prc_plch_customers ( l_names IN plch_customers.custname%TYPE,
                                                 l_num IN plch_customers.custnum%TYPE)
IS
TYPE rec_cust IS TABLE OF plch_customers.custnum%TYPE INDEX BY PLS_INTEGER; 
     l_custnum_ids   rec_cust;
     l_custname_ids   rec_cust;

BEGIN
    SELECT custnum
    BULK COLLECT INTO l_custnum_ids
    FROM plch_customers;
END prc_plch_customers;
/
