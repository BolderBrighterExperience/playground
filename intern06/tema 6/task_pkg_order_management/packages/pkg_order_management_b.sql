CREATE OR REPLACE PACKAGE BODY pkg_order_management 
IS


gt_orders t_orders_type;

PROCEDURE prc_load_order(an_order_id IN orders.order_id%TYPE) 
IS
le_invalid_order    EXCEPTION;
ln_counter          NUMBER;

CURSOR c1_orders
IS
  SELECT o.order_id,
         o.order_date,
         o.printed,
         o.customer_id,
         c.cust_first_name,
         c.cust_last_name
    FROM orders o, customers c
   WHERE o.customer_id = c.customer_id
     AND order_id = NVL(an_order_id, order_id);

CURSOR c2_order_items(par_order_id orders.order_id%TYPE) 
IS
  SELECT order_id,
         line_item_id,
         product_id,
         unit_price,
         discount_price,
         quantity
    FROM order_items
   WHERE order_id = NVL(par_order_id, order_id);

BEGIN

FOR rec_orders IN c1_orders
LOOP
    gt_orders(an_order_id).order_id := rec_orders.order_id;
    gt_orders(an_order_id).order_date := rec_orders.order_date;
    gt_orders(an_order_id).printed := rec_orders.printed;
    gt_orders(an_order_id).customer_id := rec_orders.customer_id;
    gt_orders(an_order_id).cust_first_name := rec_orders.cust_first_name;
    gt_orders(an_order_id).cust_last_name := rec_orders.cust_last_name;

  FOR rec_order_items IN c2_order_items(rec_orders.order_id) 
  LOOP
    gt_orders(an_order_id).orders_table(c2_order_items%ROWCOUNT).order_id := rec_order_items.order_id;
    gt_orders(an_order_id).orders_table(c2_order_items%ROWCOUNT).line_item_id := rec_order_items.line_item_id;
    gt_orders(an_order_id).orders_table(c2_order_items%ROWCOUNT).product_id := rec_order_items.product_id;
    gt_orders(an_order_id).orders_table(c2_order_items%ROWCOUNT).unit_price := rec_order_items.unit_price;
    gt_orders(an_order_id).orders_table(c2_order_items%ROWCOUNT).discount_price := rec_order_items.discount_price;
    gt_orders(an_order_id).orders_table(c2_order_items%ROWCOUNT).quantity := rec_order_items.quantity;
  END LOOP;
END LOOP;

prc_log_table( SEQ_06_LOG_TABLE.NEXTVAL, USER, SYSDATE, 'pkg_order_management', 'prc_load_order', NULL, 'load order' );

IF (gt_orders.COUNT = 0) THEN
  RAISE le_invalid_order;
END IF;

EXCEPTION
    WHEN le_invalid_order THEN
        prc_log_table( SEQ_06_LOG_TABLE.NEXTVAL, USER, SYSDATE, 'pkg_order_management', 'prc_load_order', NULL,'Invalid order id');
        RAISE;
    WHEN OTHERS THEN
        prc_log_table( SEQ_06_LOG_TABLE.NEXTVAL, USER, SYSDATE, 'pkg_order_management', 'prc_load_order',SQLCODE,SQLERRM);
      RAISE;
END;

PROCEDURE prc_print_order(an_order_id IN orders.order_id%TYPE ) 
IS
var_ch VARCHAR2(12) := chr(10)||chr(13);
lc_details CLOB;
ln_amount  NUMBER;

CURSOR c3_print IS
  SELECT order_id 
  FROM orders 
  WHERE printed = 0;

BEGIN
IF (an_order_id IS NULL) 
THEN
    FOR i IN gt_orders.FIRST .. gt_orders.LAST 
    LOOP
        IF( gt_orders.EXISTS(i) ) 
        THEN
            IF ( gt_orders(i).printed = 0) 
            THEN
                    ln_amount  := 0;
                    lc_details := 'Customer id: ' || gt_orders(i).customer_id ||
                                    var_ch || 'Customer name : ' || gt_orders(i).cust_first_name || ' ' || gt_orders(i).cust_last_name || 
                                    var_ch || 'Order id: ' || gt_orders(i).order_id || 
                                    var_ch || 'Order date: ' || gt_orders(i).order_date;
                    
                FOR j IN gt_orders(i).orders_table.FIRST .. gt_orders(i).orders_table.LAST 
                LOOP
                    ln_amount  := ln_amount + gt_orders(i).orders_table(j).unit_price * gt_orders(i).orders_table(j).quantity;
                    lc_details := CONCAT(lc_details,
                                         var_ch || 'Line item id: ' || gt_orders(i).orders_table(j).line_item_id || 
                                         var_ch || 'Product id: ' || gt_orders(i).orders_table(j).product_id || 
                                         var_ch || 'Unit price: ' || gt_orders(i).orders_table(j).unit_price || 
                                         var_ch || 'Discount price: ' || gt_orders(i).orders_table(j).discount_price || 
                                         var_ch || 'Quantity: ' || gt_orders(i).orders_table(j).quantity);
                END LOOP;
                
                gt_orders(i).orders_table.DELETE;
    
                lc_details := CONCAT(lc_details, var_ch || var_ch || 'Amount for entire order: ' || ln_amount);
                
                INSERT INTO printed_orders
                VALUES (printed_orders_seq.NEXTVAL, lc_details);

                lc_details := NULL;

                UPDATE orders
                SET printed = 1
                WHERE order_id = gt_orders(i).order_id;

                COMMIT;
            END IF;
        END IF;
    END LOOP;
    gt_orders.DELETE;

ELSE
    FOR i IN gt_orders.FIRST .. gt_orders.LAST 
    LOOP
        ln_amount  := 0;
        lc_details := 'Customer id: ' || gt_orders(i).customer_id ||
                      var_ch || 'Name: ' || gt_orders(i).cust_first_name || ' ' || gt_orders(i).cust_last_name || 
                      var_ch || 'Order id: ' || gt_orders(i).order_id || 
                      var_ch || 'Order date: ' || gt_orders(i).order_date || var_ch || var_ch;
  
        FOR j IN gt_orders(i).orders_table.FIRST .. gt_orders(i).orders_table.LAST 
        LOOP
            ln_amount  := ln_amount + gt_orders(i).orders_table(j).unit_price * gt_orders(i).orders_table(j).quantity;
            lc_details := CONCAT(lc_details,
                               var_ch || 'Line item id: ' || gt_orders(i).orders_table(j).line_item_id || 
                               var_ch || 'Product id: ' || gt_orders(i).orders_table(j).product_id || 
                               var_ch || 'Unit price: ' || gt_orders(i).orders_table(j).unit_price || 
                               var_ch || 'Discount price: ' || gt_orders(i).orders_table(j).discount_price || 
                               var_ch || 'Quantity: ' || gt_orders(i).orders_table(j).quantity || var_ch );
        END LOOP;
        gt_orders(i).orders_table.DELETE;
  
        lc_details := CONCAT ( lc_details, var_ch || var_ch || 'Amount for entire order: ' || ln_amount);
    END LOOP;
    gt_orders.DELETE;

    INSERT INTO printed_orders
    VALUES (printed_orders_seq.NEXTVAL, lc_details);

    lc_details := NULL;

    UPDATE orders 
    SET printed = 1 
    WHERE order_id = an_order_id;
    COMMIT;
END IF;

prc_log_table( SEQ_06_LOG_TABLE.NEXTVAL, USER, SYSDATE, 'pkg_order_management', 'prc_print_order', NULL,'printed order');

EXCEPTION
    WHEN OTHERS THEN
        prc_log_table( SEQ_06_LOG_TABLE.NEXTVAL, USER, SYSDATE, 'pkg_order_management', 'prc_print_order',SQLCODE,SQLERRM);
  RAISE;
END;
END pkg_order_management;
