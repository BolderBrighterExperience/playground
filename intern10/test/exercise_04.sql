CREATE TABLE plch_orders
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
/

CREATE OR REPLACE PROCEDURE plch_show_orders(p_status plch_orders.status%TYPE)
IS
    CURSOR c_get_id(p_status plch_orders.status%TYPE)
    IS
      SELECT order_id
      FROM   plch_orders
      WHERE  status = p_status
      ORDER BY order_date DESC;
      
    --ln_orders   plch_orders%ROWTYPE;
    ln_order_id plch_orders.order_id% TYPE;
    
BEGIN   
          OPEN c_get_id(p_status);
          LOOP
              FETCH c_get_id INTO ln_order_id;
              EXIT WHEN c_get_id%NOTFOUND;
              DBMS_OUTPUT.PUT_LINE(ln_order_id);
          END LOOP;
          CLOSE c_get_id;
END plch_show_orders;
/

SET SERVEROUTPUT ON
BEGIN
   plch_show_orders('OPEN');
   plch_show_orders('CLOSED');
END;
/





