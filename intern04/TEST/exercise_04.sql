/*CREATE TABLE plch_orders
(
   order_id     INTEGER PRIMARY KEY
 , order_date   DATE
 , status       VARCHAR2 (100)
) 
/

BEGIN
   INSERT INTO plch_orders
        VALUES (100, DATE '2010-01-15', 'CLOSED');

   INSERT INTO plch_orders
        VALUES (200, DATE '2010-11-15', 'OPEN');

   INSERT INTO plch_orders
        VALUES (300, DATE '2011-01-15', 'CLOSED');

   INSERT INTO plch_orders
        VALUES (400, DATE '2011-11-15', 'OPEN');

   COMMIT;
END;
/*/

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE plch_show_orders
IS
    CURSOR c(an_id     plch_orders.order_id%TYPE)
    IS 
        SELECT  order_id 
        FROM    plch_orders
        WHERE   order_id = an_id;
      CURSOR c1
      IS
          SELECT *
          FROM plch_orders
          ORDER BY status DESC, order_id DESC;
BEGIN
    FOR r1 IN c1 LOOP
        FOR r IN c(r1.order_id) LOOP
            DBMS_OUTPUT.PUT_LINE(r.order_id);
        END LOOP;
    END LOOP;
END;
/

BEGIN
   plch_show_orders;
END;
/