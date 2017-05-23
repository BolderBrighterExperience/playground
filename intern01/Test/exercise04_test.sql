CREATE OR REPLACE PROCEDURE  plch_show_orders 
IS
  CURSOR cur_orders (an_order_id plch_orders.order_id%TYPE)
  IS
  SELECT   order_id 
  FROM  plch_orders 
  WHERE  order_id =an_order_id;
 
 CURSOR cur_plch
 IS SELECT * FROM plch_orders
 ORDER BY status DESC,order_date DESC;
     
     r_orders   plch_orders%ROWTYPE;
     var_order_id plch_orders.order_id%TYPE;
    
    BEGIN
    OPEN cur_plch;
    LOOP
    FETCH cur_plch INTO r_orders;
     EXIT WHEN cur_plch%NOTFOUND;
        OPEN cur_orders(r_orders.order_id);
        LOOP
        FETCH cur_orders INTO var_order_id;
        EXIT WHEN cur_orders%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(var_order_id);
        END LOOP;
        CLOSE cur_orders;
    END LOOP;
    CLOSE cur_plch;
END;
/              
                  
 
 set serveroutput on;
BEGIN
   plch_show_orders;
END;
/