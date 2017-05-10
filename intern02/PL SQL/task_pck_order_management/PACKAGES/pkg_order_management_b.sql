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
            
            /*
            DBMS_OUTPUT.PUT_LINE('');
            DBMS_OUTPUT.PUT_LINE('cur_orders%ROWCOUNT: '||cur_orders%ROWCOUNT);
            DBMS_OUTPUT.PUT_LINE('Order id: '||aat_orders(cur_orders%ROWCOUNT).order_id
                                ||', order date: '||aat_orders(cur_orders%ROWCOUNT).order_date
                                ||', customer name: '||aat_orders(cur_orders%ROWCOUNT).cust_first_name||' '||aat_orders(cur_orders%ROWCOUNT).cust_last_name);
            */
            FOR rec_order_items IN cur_order_items(rec_orders.order_id)
            LOOP
                aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).order_id         := rec_order_items.order_id;
                aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).line_item_id     := rec_order_items.line_item_id;
                aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).product_id       := rec_order_items.product_id;
                aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).unit_price       := rec_order_items.unit_price;
                aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).discount_price   := rec_order_items.discount_price;
                aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).quantity         := rec_order_items.quantity;
                
                /*DBMS_OUTPUT.PUT_LINE('cur_order_items%ROWCOUNT: '||cur_order_items%ROWCOUNT);
                DBMS_OUTPUT.PUT_LINE('Item id: '||aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).order_id
                                    ||', product id: '||aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).product_id
                                    ||', discount price: '||aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).discount_price
                                    ||', quantity: '||aat_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).quantity);*/
                
            END LOOP;
            --DBMS_OUTPUT.PUT_LINE('aat_orders.count: '||aat_orders.count);
        END LOOP;
   
        prc_log_table( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, 'load order' );
        
        IF ( aat_orders.EXISTS( an_order_id ) = FALSE ) THEN
            RAISE le_invalid_order;   
        END IF;
        
        EXCEPTION
            WHEN le_invalid_order THEN
                prc_log_table( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, 'Invalid order id' );
                RAISE;
            WHEN INVALID_CURSOR THEN
                prc_log_table( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, SQLERRM );
                RAISE;
            WHEN OTHERS THEN
                prc_log_table( seq_intern02_log_table.NEXTVAL, USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, SQLCODE, SQLERRM );
                RAISE;
    END;
END pkg_order_management;
/
