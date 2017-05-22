CREATE OR REPLACE PROCEDURE plch_show_orders()
IS
CURSOR cur_proc(order_id) IS
    SELECT order_id,status
    FROM plch_orders
    WHERE status = 'Open'
    ORDER BY order_id DESC;
BEGIN
   
END;