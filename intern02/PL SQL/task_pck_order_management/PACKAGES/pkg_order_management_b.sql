CREATE OR REPLACE PACKAGE BODY pkg_order_management 
IS
    TYPE rec_order_items_type IS RECORD ( order_id       order_items.order_id%TYPE,
                                        line_item_id   order_items.line_item_id%TYPE,
                                        product_id     order_items.product_id%TYPE,
                                        unit_price     order_items.unit_price%TYPE,
                                        discount_price order_items.discount_price%TYPE,
                                        quantity       order_items.quantity%TYPE );

    TYPE t_order_items_type IS TABLE OF rec_order_items_type INDEX BY BINARY_INTEGER;

    TYPE rec_orders_type IS RECORD (  order_id        orders.order_id%TYPE,
                                    order_date      orders.order_date%TYPE,
                                    printed         orders.printed%TYPE,
                                    customer_id     customers.customer_id%TYPE,
                                    cust_first_name customers.cust_first_name%TYPE,
                                    cust_last_name  customers.cust_last_name%TYPE,
                                    orders_table    t_order_items_type );

    TYPE t_orders_type IS TABLE OF rec_orders_type INDEX BY BINARY_INTEGER;

    gt_orders t_orders_type;

    PROCEDURE prc_load_order (an_order_id IN orders.order_id%TYPE)
    IS
        LS_PROC_NAME        VARCHAR2(32) := 'prc_load_order';
        le_invalid_order    EXCEPTION;
        
        CURSOR cur_orders
        IS
            SELECT  order_id,
                    order_date,
                    printed,
                    o.customer_id,
                    cust_first_name, 
                    cust_last_name
            FROM    orders o, customers c
            WHERE   o.customer_id = c.customer_id
            AND     order_id = NVL(an_order_id, order_id);
        
        CURSOR cur_order_items(par_order_id orders.order_id%TYPE)
        IS
            SELECT  order_id,
                    line_item_id, 
                    product_id, 
                    unit_price, 
                    discount_price, 
                    quantity
            FROM    order_items
            WHERE   order_id = NVL(par_order_id, order_id);
 
    BEGIN
        FOR rec_orders IN cur_orders 
    LOOP
        gt_orders(an_order_id).order_id := rec_orders.order_id;
        gt_orders(an_order_id).order_date := rec_orders.order_date;
        gt_orders(an_order_id).printed := rec_orders.printed;
        gt_orders(an_order_id).customer_id := rec_orders.customer_id;
        gt_orders(an_order_id).cust_first_name := rec_orders.cust_first_name;
        gt_orders(an_order_id).cust_last_name := rec_orders.cust_last_name;

      FOR rec_order_items IN cur_order_items(rec_orders.order_id) 
      LOOP
        gt_orders(an_order_id).orders_table(cur_order_items%ROWCOUNT).order_id := rec_order_items.order_id;
        gt_orders(an_order_id).orders_table(cur_order_items%ROWCOUNT).line_item_id := rec_order_items.line_item_id;
        gt_orders(an_order_id).orders_table(cur_order_items%ROWCOUNT).product_id := rec_order_items.product_id;
        gt_orders(an_order_id).orders_table(cur_order_items%ROWCOUNT).unit_price := rec_order_items.unit_price;
        gt_orders(an_order_id).orders_table(cur_order_items%ROWCOUNT).discount_price := rec_order_items.discount_price;
        gt_orders(an_order_id).orders_table(cur_order_items%ROWCOUNT).quantity := rec_order_items.quantity;
      END LOOP;
      prc_log_table(seq_intern02_log_table.NEXTVAL,USER,SYSDATE,$$PLSQL_UNIT,LS_PROC_NAME,NULL,'load order');
    END LOOP;
   
        --prc_log_table(seq_intern02_log_table.NEXTVAL,USER,SYSDATE,$$PLSQL_UNIT,LS_PROC_NAME,NULL,'load order');
        
        IF ( gt_orders.EXISTS(an_order_id) = FALSE ) THEN
            RAISE le_invalid_order;       
        END IF;
        
        EXCEPTION
            WHEN le_invalid_order THEN
                prc_log_table( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, 'Invalid order id to load' );
                RAISE;
            WHEN INVALID_CURSOR THEN
                prc_log_table( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, SQLERRM );
                RAISE;
            WHEN OTHERS THEN
                prc_log_table( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, SQLCODE, SQLERRM );
                RAISE;
    END;

  
  PROCEDURE prc_print_order(an_order_id IN orders.order_id%TYPE DEFAULT NULL) 
  IS
    LS_PROC_NAME        CONSTANT VARCHAR2(32) := 'prc_print_order';
    lc_details          CLOB;
    ln_amount           NUMBER;
    le_printed_order    EXCEPTION;
    ln_index1           NUMBER;
    ln_index2           NUMBER;
  

    BEGIN
        IF (an_order_id IS NULL)
        THEN
            IF( gt_orders.COUNT > 0) 
            THEN
            
                ln_index1 := gt_orders.FIRST;
            
                WHILE ln_index1 IS NOT NULL 
                LOOP
                    IF ( gt_orders(ln_index1).printed = 0) 
                    THEN
                            ln_amount  := 0;
                            lc_details := 'Customer id: ' || gt_orders(ln_index1).customer_id ||
                                            CHR(13) || 'Name: ' || gt_orders(ln_index1).cust_first_name || ' ' || gt_orders(ln_index1).cust_last_name || 
                                            CHR(13) || 'Order id: ' || gt_orders(ln_index1).order_id || 
                                            CHR(13) || 'Order date: ' || gt_orders(ln_index1).order_date;
                            
                            ln_index2 := gt_orders(ln_index1).orders_table.FIRST;
                            WHILE ln_index2 IS NOT NULL  
                            LOOP
                                ln_amount  := ln_amount + gt_orders(ln_index1).orders_table(ln_index2).unit_price * gt_orders(ln_index1).orders_table(ln_index2).quantity;
                                lc_details := CONCAT(lc_details,
                                                     CHR(13) || 'Line item id: ' || gt_orders(ln_index1).orders_table(ln_index2).line_item_id || 
                                                     CHR(13) || 'Product id: ' || gt_orders(ln_index1).orders_table(ln_index2).product_id || 
                                                     CHR(13) || 'Unit price: ' || gt_orders(ln_index1).orders_table(ln_index2).unit_price || 
                                                     CHR(13) || 'Discount price: ' || gt_orders(ln_index1).orders_table(ln_index2).discount_price || 
                                                     CHR(13) || 'Quantity: ' || gt_orders(ln_index1).orders_table(ln_index2).quantity );
                                                     
                                ln_index2 := gt_orders(ln_index1).orders_table.NEXT(ln_index2);
                            END LOOP;
                        
                            gt_orders(ln_index1).orders_table.DELETE;
                
                            lc_details := CONCAT(lc_details, CHR(13) || CHR(13) || 'Amount for entire order: ' || ln_amount);
                            
                            INSERT 
                            INTO printed_orders
                            VALUES (seq_printed_order_id.NEXTVAL, lc_details);

                            lc_details := NULL;

                            UPDATE orders
                            SET printed = 1
                            WHERE order_id = gt_orders(ln_index1).order_id;
                            
                            COMMIT;
                            
                            ln_index1 := gt_orders.NEXT(ln_index1);
                    ELSE
                        ln_index1 := gt_orders.NEXT(ln_index1);
                    END IF;
                END LOOP;
                
                gt_orders.DELETE;  
            END IF;
        
            prc_log_table(seq_intern02_log_table.NEXTVAL,USER,SYSDATE,$$PLSQL_UNIT,LS_PROC_NAME,NULL,'All orders printed');
            
        ELSE
            IF( gt_orders(an_order_id).printed = 0) 
            THEN
                ln_index1 := gt_orders.FIRST;
                WHILE ln_index1 IS NOT NULL 
                LOOP
                    IF ( gt_orders(ln_index1).order_id = an_order_id ) 
                    THEN
                            ln_amount  := 0;
                            lc_details := 'Customer id: ' || gt_orders(ln_index1).customer_id ||
                                            CHR(13) || 'Name: ' || gt_orders(ln_index1).cust_first_name || ' ' || gt_orders(ln_index1).cust_last_name || 
                                            CHR(13) || 'Order id: ' || gt_orders(ln_index1).order_id || 
                                            CHR(13) || 'Order date: ' || gt_orders(ln_index1).order_date;
                            
                            ln_index2 := gt_orders(ln_index1).orders_table.FIRST;
                            WHILE ln_index2 IS NOT NULL  
                            LOOP
                                ln_amount  := ln_amount + gt_orders(ln_index1).orders_table(ln_index2).unit_price * gt_orders(ln_index1).orders_table(ln_index2).quantity;
                                lc_details := CONCAT(lc_details,
                                                     CHR(13) || 'Line item id: ' || gt_orders(ln_index1).orders_table(ln_index2).line_item_id || 
                                                     CHR(13) || 'Product id: ' || gt_orders(ln_index1).orders_table(ln_index2).product_id || 
                                                     CHR(13) || 'Unit price: ' || gt_orders(ln_index1).orders_table(ln_index2).unit_price || 
                                                     CHR(13) || 'Discount price: ' || gt_orders(ln_index1).orders_table(ln_index2).discount_price || 
                                                     CHR(13) || 'Quantity: ' || gt_orders(ln_index1).orders_table(ln_index2).quantity );
                                                     
                                ln_index2 := gt_orders(ln_index1).orders_table.NEXT(ln_index2);
                            END LOOP;
                            
                            gt_orders(ln_index1).orders_table.DELETE;
                
                            lc_details := CONCAT(lc_details, CHR(13) || CHR(13) || 'Amount for entire order: ' || ln_amount);
                            
                            INSERT 
                            INTO printed_orders
                            VALUES (seq_printed_order_id.NEXTVAL, lc_details);

                            UPDATE orders
                            SET printed = 1
                            WHERE order_id = an_order_id;
                            
                            COMMIT;
                            lc_details := NULL;
                            ln_index1 := gt_orders.NEXT(ln_index1);
                    ELSE
                        ln_index1 := gt_orders.NEXT(ln_index1);
                    END IF;
                END LOOP;
                
                gt_orders.DELETE; 
            ELSE
                RAISe le_printed_order;
            END IF;

            prc_log_table(seq_intern02_log_table.NEXTVAL,USER,SYSDATE,$$PLSQL_UNIT,LS_PROC_NAME,NULL,'printed order');
        
        END IF;

    EXCEPTION
        WHEN le_printed_order THEN
            prc_log_table(seq_intern02_log_table.NEXTVAL,USER,SYSDATE,$$PLSQL_UNIT,LS_PROC_NAME,NULL,'Order printed already');
            RAISE;
        WHEN OTHERS THEN
            prc_log_table(seq_intern02_log_table.NEXTVAL,USER,SYSDATE,$$PLSQL_UNIT,LS_PROC_NAME,SQLCODE,SQLERRM);
            RAISE;
    END prc_print_order;

END pkg_order_management;
/

