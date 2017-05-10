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

    tt_orders  orders_type;

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
          
            tt_orders(cur_orders%ROWCOUNT).order_id        := rec_orders.order_id;
            tt_orders(cur_orders%ROWCOUNT).order_date      := rec_orders.order_date;
            tt_orders(cur_orders%ROWCOUNT).printed         := rec_orders.printed;
            tt_orders(cur_orders%ROWCOUNT).customer_id     := rec_orders.customer_id;
            tt_orders(cur_orders%ROWCOUNT).cust_first_name := rec_orders.cust_first_name;
            tt_orders(cur_orders%ROWCOUNT).cust_last_name  := rec_orders.cust_last_name;

            DBMS_OUTPUT.PUT_LINE('');
            DBMS_OUTPUT.PUT_LINE('Order '||tt_orders(cur_orders%ROWCOUNT).order_id ||' from '||tt_orders(cur_orders%ROWCOUNT).cust_first_name||' '||tt_orders(cur_orders%ROWCOUNT).cust_last_name
                                 ||' on '||tt_orders(cur_orders%ROWCOUNT).order_date);

            

            FOR rec_order_items IN cur_order_items(rec_orders.order_id)
            LOOP
               
                
                tt_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).order_id := rec_order_items.order_id;
                tt_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).line_item_id   := rec_order_items.line_item_id;
                tt_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).product_id     := rec_order_items.product_id;
                tt_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).unit_price     := rec_order_items.unit_price;
                tt_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).discount_price := rec_order_items.discount_price;
                tt_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).quantity       := rec_order_items.quantity;

                DBMS_OUTPUT.PUT_LINE('Item id: '||tt_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).line_item_id||', product id: '||tt_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).product_id
                                    ||', discount price: '||tt_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).discount_price||', quantity: '||tt_orders(cur_orders%ROWCOUNT).orders_table(cur_order_items%ROWCOUNT).quantity);
                                    
                                   
                                    
            END LOOP;
            DBMS_OUTPUT.PUT_LINE('Au fost incarcate:' || tt_orders.count);
        END LOOP;

        
        IF tt_orders.exists(an_order_id)=false THEN
            RAISE le_invalid_order
        END IF;
        
        prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'date incarcate','package_order_load');

        EXCEPTION
            WHEN le_invalid_order THEN
                prc_log_table(seq_09_errorlog_id.NEXTVAL,NULL,SYSDATE,'invalid id order','package_order_load');
            WHEN OTHERS THEN
                prc_log_table(seq_09_errorlog_id.NEXTVAL,SQLCODE,SYSDATE,SQLERRM,'package_order_load'); 
                RAISE;
    END;
END pkg_order_management;
/