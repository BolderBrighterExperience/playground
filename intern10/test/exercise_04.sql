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

CREATE OR REPLACE PROCEDURE plch_show_orders
IS
    CURSOR c_get_plch_orders
    IS
      SELECT *
      FROM   plch_orders
      ORDER BY EXTRACT(MONTH FROM order_date) DESC;
    
    CURSOR c_get_id(p_order_id plch_orders.order_id%TYPE)
    IS
      SELECT order_id
      FROM   plch_orders
      WHERE  order_id = p_order_id;
      
    ln_orders   plch_orders%ROWTYPE;
    ln_order_id plch_orders.order_id% TYPE;
    
BEGIN   
      OPEN c_get_plch_orders;
      LOOP
          FETCH c_get_plch_orders INTO ln_orders;
          EXIT WHEN c_get_plch_orders%NOTFOUND;
          
          OPEN c_get_id(ln_orders.order_id);
          LOOP
              FETCH c_get_id INTO ln_order_id;
              EXIT WHEN c_get_id%NOTFOUND;
              DBMS_OUTPUT.PUT_LINE(ln_order_id);
          END LOOP;
          CLOSE c_get_id;
      END LOOP; 
      CLOSE c_get_plch_orders;
END plch_show_orders;
/

SET SERVEROUTPUT ON
BEGIN
   plch_show_orders;
END;





