CREATE OR REPLACE PROCEDURE plch_show_orders 
IS
CURSOR c_orders (as_status  plch_orders.status%TYPE)
IS 
  SELECT order_id
  FROM plch_orders
  WHERE UPPER(status) = UPPER(as_status)
  ORDER BY status, order_date DESC;  
rec_orders c_orders%ROWTYPE;
BEGIN
    OPEN c_orders('OPEN');
    LOOP
      FETCH c_orders INTO rec_orders;
      EXIT WHEN c_orders%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(rec_orders.order_id);
    END LOOP;
    CLOSE c_orders;
    
    OPEN c_orders('CLOSED');
    LOOP
      FETCH c_orders INTO rec_orders;
      EXIT WHEN c_orders%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(rec_orders.order_id);
    END LOOP;
    CLOSE c_orders;
END;
/ 

SET SERVEROUTPUT ON
BEGIN
  plch_show_orders;
END;