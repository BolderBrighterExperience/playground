CREATE OR REPLACE PACKAGE BODY pkg_order_management
IS
    TYPE rec_order_items IS RECORD ( 
                                    order_id        order_items.order_id%TYPE,
                                    line_item_id    order_items.line_item_id%TYPE,
                                    product_id      order_items.product_id%TYPE,
                                    unit_price      order_items.unit_price%TYPE,
                                    discount_price  order_items.discount_price%TYPE,
                                    quantity        order_items.quantity%TYPE 
                                    );

    TYPE order_items_type IS TABLE OF rec_order_items
        INDEX BY BINARY_INTEGER;

    TYPE rec_orders_type IS RECORD (
                                    order_id            orders.order_id%TYPE,
                                    order_date          orders.order_date%TYPE,
                                    printed             orders.printed%TYPE,
                                    customer_id         customers.customer_id%TYPE,
                                    cust_first_name     customers.cust_first_name%TYPE,
                                    cust_last_name      customers.cust_last_name%TYPE,
                                    orders_table        order_items_type 
                                    );

    TYPE orders_type IS TABLE OF rec_orders_type
        INDEX BY BINARY_INTEGER;

    gt_orders  orders_type;

    PROCEDURE prc_load_order (an_order_id IN orders.order_id%TYPE)
    IS
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

        CURSOR cur_order_items(p_order_id NUMBER)
        IS
            SELECT  order_id,
                    line_item_id, 
                    product_id, 
                    unit_price, 
                    discount_price, 
                    quantity
            FROM    order_items
            WHERE   order_id = p_order_id;


    BEGIN
        FOR rec_orders IN cur_orders
        LOOP
          
            gt_orders(an_order_id).order_id        := rec_orders.order_id;
            gt_orders(an_order_id).order_date      := rec_orders.order_date;
            gt_orders(an_order_id).printed         := rec_orders.printed;
            gt_orders(an_order_id).customer_id     := rec_orders.customer_id;
            gt_orders(an_order_id).cust_first_name := rec_orders.cust_first_name;
            gt_orders(an_order_id).cust_last_name  := rec_orders.cust_last_name;   

            FOR rec_order_items IN cur_order_items(rec_orders.order_id)
            LOOP
                  
                gt_orders(an_order_id).orders_table(cur_order_items%ROWCOUNT).order_id       := rec_order_items.order_id;
                gt_orders(an_order_id).orders_table(cur_order_items%ROWCOUNT).line_item_id   := rec_order_items.line_item_id;
                gt_orders(an_order_id).orders_table(cur_order_items%ROWCOUNT).product_id     := rec_order_items.product_id;
                gt_orders(an_order_id).orders_table(cur_order_items%ROWCOUNT).unit_price     := rec_order_items.unit_price;
                gt_orders(an_order_id).orders_table(cur_order_items%ROWCOUNT).discount_price := rec_order_items.discount_price;
                gt_orders(an_order_id).orders_table(cur_order_items%ROWCOUNT).quantity       := rec_order_items.quantity;
            END LOOP;      
        END LOOP;

        prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'date incarcate','package_order_load');
        
        IF (gt_orders.COUNT = 0) THEN 
               RAISE le_invalid_order;
        END IF;

        EXCEPTION
            WHEN le_invalid_order THEN
                prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'invalid id order','package_order_load');
                RAISE;
            WHEN OTHERS THEN
                prc_log_table(seq_09_errorlog_id.NEXTVAL,SQLCODE,SYSDATE,SQLERRM,'package_order_load'); 
                RAISE;
    END;
    
    PROCEDURE prc_print_order (an_order_id IN orders.order_id%TYPE)
    IS
    l_amount    NUMBER;
    l_header    CLOB;
    l_body      CLOB;
    l_footer    CLOB;
    l_line      VARCHAR2(10) := chr(13)||chr(10);
    l_tot       CLOB;
    CURSOR cur_print
    IS 
        SELECT order_id
        FROM orders
        WHERE printed=0;
    BEGIN    
        IF (an_order_id IS NULL) THEN
            FOR i IN gt_orders.FIRST .. gt_orders.LAST
                LOOP
                    IF ( gt_orders.EXISTS(i) ) THEN
                    
                        l_header   := 'Customer id: '||gt_orders(i).customer_id || 
                                      l_line || 'First name: ' || gt_orders(i).cust_first_name || 
                                      l_line || 'Last name:' || gt_orders(i).cust_last_name|| 
                                      l_line ||'Order id: ' || gt_orders(i).order_id || 
                                      l_line || 'Order date: ' || gt_orders(i).order_date||
                                      l_line;
                        l_amount   :=0;
                    
                        FOR j IN gt_orders(i).orders_table.FIRST .. gt_orders(i).orders_table.LAST 
                            LOOP
                                l_amount  := l_amount + gt_orders(i).orders_table(j).quantity * gt_orders(i).orders_table(j).unit_price;
                                l_body    := 'Line item id:' || gt_orders(i).orders_table(j).line_item_id || 
                                             l_line || 'Product id: ' || gt_orders(i).orders_table(j).product_id|| 
                                             l_line || 'Unit price: ' || gt_orders(i).orders_table(j).unit_price || 
                                             l_line||' Discount: ' ||gt_orders(i).orders_table(j).discount_price || 
                                             l_line ||' Quantity: ' || gt_orders(i).orders_table(j).quantity || 
                                             l_line;
                                             
                            END LOOP;
                            
                     gt_orders(i).orders_table.DELETE;
                            
                     l_footer := 'Amount: ' || l_amount;
                     
                l_tot :=l_header || l_body || l_footer;   
                 
                INSERT
                INTO printed_orders 
                VALUES (seq_09_id.NEXTVAL, l_tot);
            
                l_tot :=NULL;
            
                UPDATE orders
                SET printed=1
                WHERE order_id = gt_orders(i).order_id;
                
                COMMIT;
                END IF;     
        END LOOP; 
        gt_orders.DELETE;
        
        ELSE
            
            FOR i IN gt_orders.FIRST .. gt_orders.LAST
                    LOOP
                        l_header   := 'Customer id: '||gt_orders(i).customer_id || 
                                      l_line || 'First name: ' || gt_orders(i).cust_first_name || 
                                      l_line || 'Last name:' || gt_orders(i).cust_last_name||
                                      l_line ||'Order id: ' || gt_orders(i).order_id || 
                                      l_line || 'Order date: ' || gt_orders(i).order_date || 
                                      l_line;
                        l_amount   :=0;
                    
                        FOR j IN gt_orders(i).orders_table.FIRST .. gt_orders(i).orders_table.LAST 
                            LOOP
                                l_amount  := l_amount + gt_orders(i).orders_table(j).quantity * gt_orders(i).orders_table(j).unit_price;
                                l_body    := 'Line item id:' || gt_orders(i).orders_table(j).line_item_id || 
                                             l_line|| 'Product id: ' || gt_orders(i).orders_table(j).product_id|| 
                                             l_line|| 'Unit price: ' || gt_orders(i).orders_table(j).unit_price || 
                                             l_line||' Discount: ' ||gt_orders(i).orders_table(j).discount_price || 
                                             l_line||' Quantity: ' || gt_orders(i).orders_table(j).quantity || 
                                             l_line ;
                                             
                            END LOOP;
                            
                     gt_orders(i).orders_table.DELETE;
                            
                     l_footer := 'Amount: ' || l_amount;
                     
                     END LOOP;
                     
                gt_orders.DELETE;
                     
                l_tot :=l_header || l_body || l_footer;   
                 
                INSERT
                INTO printed_orders 
                VALUES (seq_09_id.NEXTVAL, l_tot);
                
                l_tot :=NULL;
            
                UPDATE orders
                SET printed=1
                WHERE order_id = an_order_id;
                COMMIT;
            END IF;
            
    prc_log_table(seq_09_errorlog_id.NEXTVAL,SQLCODE,SYSDATE,SQLERRM,'package_order_print'); 
EXCEPTION
    WHEN OTHERS THEN
          prc_log_table(seq_09_errorlog_id.NEXTVAL,SQLCODE,SYSDATE,SQLERRM,'package_order_print'); 
          RAISE;
END;   

END pkg_order_management;
/