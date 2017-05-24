CREATE OR REPLACE PROCEDURE  plch_show_orders 
IS
   CURSOR cur_orders (as_status   plch_orders.status%TYPE)
    IS    
    SELECT *
    FROM plch_orders   
    WHERE status = as_status
    ORDER BY order_date DESC;
   
   var_orders   cur_orders%ROWTYPE;
   
   BEGIN
   OPEN cur_orders('OPEN');
   LOOP  
   FETCH cur_orders
   INTO  var_orders;     
   EXIT WHEN cur_orders%NOTFOUND;   
        DBMS_OUTPUT.PUT_LINE(var_orders.order_id);
  END LOOP;   
  CLOSE cur_orders; 
  
  OPEN cur_orders('CLOSED');
   LOOP  
   FETCH cur_orders 
   INTO  var_orders;     
   EXIT WHEN cur_orders%NOTFOUND;   
        DBMS_OUTPUT.PUT_LINE(var_orders.order_id);
  END LOOP;   
  CLOSE cur_orders; 
  END; 
 /

set serveroutput on; 
BEGIN
   plch_show_orders;
END;
/