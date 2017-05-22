CREATE OR REPLACE PROCEDURE plch_show_orders
IS
CURSOR cur_orders (an_order_id plch_orders.order_id%TYPE)
IS
    SELECT  order_id,
            order_date,
            status
    FROM    plch_orders
    WHERE   order_id = an_order_id;
    var_orders orders.order_id%TYPE;
BEGIN
OPEN cur_orders;
  FETCH cur_orders INTO var_orders;
  EXIT WHEN cur_orders%NOTFOUND;
  DBMS_OUTPUT.PUT_LINE ('Order id: ' || var_orders.order_id);
  CLOSE cur_orders;
 -- DBMS_OUTPUT.PUT_LINE ('ORDERS:'|| plch_show_orders);
END plch_show_orders;
/