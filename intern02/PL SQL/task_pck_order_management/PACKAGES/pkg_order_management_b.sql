CREATE OR REPLACE PACKAGE BODY pkg_order_management
IS
    TYPE rec_order_items_type IS RECORD ( order_id      order_items.order_id%TYPE,
                                        line_item_id    order_items.line_item_id%TYPE,
                                        product_id      order_items.product_id%TYPE,
                                        unit_price      order_items.unit_price%TYPE,
                                        discount_price  order_items.discount_price%TYPE,
                                        quantity        order_items.quantity%TYPE );
    
    TYPE t_order_items_type IS TABLE OF rec_order_items_type
        INDEX BY BINARY_INTEGER;
        
    TYPE rec_orders_type IS RECORD (order_id            orders.order_id%TYPE,
                                    order_date          orders.order_date%TYPE,
                                    printed             orders.printed%TYPE,
                                    customer_id         customers.customer_id%TYPE,
                                    cust_first_name     customers.cust_first_name%TYPE,
                                    cust_last_name      customers.cust_last_name%TYPE,
                                    orders_table        t_order_items_type );
                                   
    TYPE t_orders_type IS TABLE OF rec_orders_type
        INDEX BY BINARY_INTEGER;
        
    aat_orders  t_orders_type;
    
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
            aat_orders(cur_orders%ROWCOUNT).order_id            := rec_orders.order_id;
            aat_orders(cur_orders%ROWCOUNT).order_date          := rec_orders.order_date;
            aat_orders(cur_orders%ROWCOUNT).printed             := rec_orders.printed;
            aat_orders(cur_orders%ROWCOUNT).customer_id         := rec_orders.customer_id;
            aat_orders(cur_orders%ROWCOUNT).cust_first_name     := rec_orders.cust_first_name;
            aat_orders(cur_orders%ROWCOUNT).cust_last_name      := rec_orders.cust_last_name;
            
            FOR rec_order_items IN cur_order_items(rec_orders.order_id)
            LOOP
                aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).order_id         := rec_order_items.order_id;
                aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).line_item_id     := rec_order_items.line_item_id;
                aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).product_id       := rec_order_items.product_id;
                aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).unit_price       := rec_order_items.unit_price;
                aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).discount_price   := rec_order_items.discount_price;
                aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).quantity         := rec_order_items.quantity;
                
            END LOOP;
        END LOOP;
   
        prc_log_table( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, 'load order' );
        
        IF ( aat_orders.COUNT = 0) THEN
            RAISE le_invalid_order;   
        END IF;
        
        EXCEPTION
            WHEN le_invalid_order THEN
                prc_log_table( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, 'Invalid order id' );
                RAISE;
            WHEN OTHERS THEN
                prc_log_table( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, SQLCODE, SQLERRM );
                RAISE;
    END;
    
    PROCEDURE prc_print_order (an_order_id IN orders.order_id%TYPE)
    IS
        LS_PROC_NAME        VARCHAR2(32) := 'prc_print_order';
        lc_details          CLOB;
        ln_amount           NUMBER;
        
        CURSOR cur_no_prt 
        IS
        SELECT order_id  
        FROM orders
        WHERE printed = 0 ;

        BEGIN
            IF (an_order_id IS NULL) THEN
                FOR r_not_prt IN cur_no_prt
                LOOP    
                    pkg_order_management.prc_load_order(r_not_prt.order_id);
                    
                    FOR idx IN aat_orders.FIRST..aat_orders.LAST
                    LOOP
                        ln_amount   := 0;
                        lc_details  :=   'Customer id: ' || aat_orders(idx).customer_id 
                                        ||CHR(13) || 'Name: ' || aat_orders(idx).cust_first_name || ' ' || aat_orders(idx).cust_last_name 
                                        ||CHR(13) || 'Order id: ' || aat_orders(idx).order_id 
                                        ||CHR(13) || 'Order date: ' || aat_orders(idx).order_date;
                                        
                        FOR idx2 IN aat_orders(idx).orders_table.FIRST..aat_orders(idx).orders_table.LAST
                        LOOP
                            ln_amount   := ln_amount + aat_orders(idx).orders_table(idx2).unit_price * aat_orders(idx).orders_table(idx2).quantity ;
                            lc_details  := CONCAT ( lc_details, 
                                                       CHR(13) || 'Line item id: ' || aat_orders(idx).orders_table(idx2).line_item_id
                                                    || CHR(13) || 'Product id: ' || aat_orders(idx).orders_table(idx2).product_id
                                                    || CHR(13) || 'Unit price: ' || aat_orders(idx).orders_table(idx2).unit_price
                                                    || CHR(13) || 'Discount price: ' || aat_orders(idx).orders_table(idx2).discount_price
                                                    || CHR(13) || 'Quantity: ' || aat_orders(idx).orders_table(idx2).quantity );
                        END LOOP;
                        aat_orders(idx).orders_table.DELETE;    
                            
                        lc_details := CONCAT ( lc_details,
                                                CHR(13) || 'Amount for entire order: ' || ln_amount );
                    END LOOP;
                    aat_orders.DELETE;

                    INSERT 
                    INTO    printed_orders 
                    VALUES  (seq_printed_order_id.NEXTVAL, lc_details);
                    
                    lc_details := NULL;
                    
                    UPDATE  orders 
                    SET     printed = 1 
                    WHERE   order_id = r_not_prt.order_id;

                    COMMIT;
                END LOOP;
            ELSE
                pkg_order_management.prc_load_order(an_order_id);
                    
                    FOR idx IN aat_orders.FIRST..aat_orders.LAST
                    LOOP
                        ln_amount   := 0;
                        lc_details  :=  'Customer id: ' || aat_orders(idx).customer_id 
                                        ||CHR(13) || 'Name: ' || aat_orders(idx).cust_first_name || ' ' || aat_orders(idx).cust_last_name 
                                        ||CHR(13) || 'Order id: ' || aat_orders(idx).order_id 
                                        ||CHR(13) || 'Order date: ' || aat_orders(idx).order_date || CHR(13) || CHR(13);
                                        
                        FOR idx2 IN aat_orders(idx).orders_table.FIRST..aat_orders(idx).orders_table.LAST
                        LOOP
                            ln_amount   := ln_amount + aat_orders(idx).orders_table(idx2).unit_price * aat_orders(idx).orders_table(idx2).quantity ;
                            lc_details  := CONCAT ( lc_details, 
                                                      CHR(13)  || 'Line item id: ' || aat_orders(idx).orders_table(idx2).line_item_id
                                                    || CHR(13) || 'Product id: ' || aat_orders(idx).orders_table(idx2).product_id
                                                    || CHR(13) || 'Unit price: ' || aat_orders(idx).orders_table(idx2).unit_price
                                                    || CHR(13) || 'Discount price: ' || aat_orders(idx).orders_table(idx2).discount_price
                                                    || CHR(13) || 'Quantity: ' || aat_orders(idx).orders_table(idx2).quantity || CHR(13) ) ;
                        END LOOP;
                        aat_orders(idx).orders_table.DELETE;    
                            
                        lc_details := CONCAT ( lc_details,
                                               CHR(13) || CHR(13) || 'Amount for entire order: ' || ln_amount );
                    END LOOP;
                    aat_orders.DELETE;

                    INSERT 
                    INTO    printed_orders 
                    VALUES  (seq_printed_order_id.NEXTVAL, lc_details);
                    
                    lc_details := NULL;
                    
                    UPDATE  orders 
                    SET     printed = 1 
                    WHERE   order_id = an_order_id;

                    COMMIT;
            END IF;
            
            prc_log_table( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, 'printed order' );
        
        EXCEPTION
            WHEN OTHERS THEN
                 prc_log_table( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, SQLCODE, SQLERRM );
                RAISE;   
    END;

END pkg_order_management;
/
