CREATE OR REPLACE PROCEDURE plch_show_orders 
IS
CURSOR c_ord (as_status  plch_orders.status%TYPE)
IS 
  SELECT order_id,
         order_date,
         status
  FROM plch_orders
  WHERE UPPER(status) = UPPER(as_status)
  ORDER BY status, order_date DESC;

r_ord  c_ord%ROWTYPE;
BEGIN
    OPEN c_ord('OPEN');
    LOOP
      FETCH c_ord INTO r_ord;
      EXIT WHEN c_ord%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(r_ord.order_id);
    END LOOP;
    CLOSE c_ord;

    OPEN c_ord('CLOSED');
    LOOP
      FETCH c_ord INTO r_ord;
      EXIT WHEN c_ord%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE(r_ord.order_id);
    END LOOP;
    CLOSE c_ord;
END;
/
