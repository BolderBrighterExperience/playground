--package body
CREATE OR REPLACE PACKAGE BODY pkg_order_management
IS
    TYPE r_order_items IS RECORD( order_id      	order_items.order_id%TYPE,
                                  line_item_id    order_items.line_item_id%TYPE,
                                  product_id      order_items.product_id%TYPE,
                                  unit_price      order_items.unit_price%TYPE,
                                  discount_price  order_items.discount_price%TYPE,
                                  quantity        order_items.quantity%TYPE
                                );

    TYPE t_order_items IS TABLE OF r_order_items INDEX BY BINARY_INTEGER;

    TYPE r_orders IS RECORD( order_id            orders.order_id%TYPE,
                             order_date          orders.order_date%TYPE,
                             printed             orders.printed%TYPE,
                             customer_id         customers.customer_id%TYPE,
                             cust_first_name     customers.cust_first_name%TYPE,
                             cust_last_name      customers.cust_last_name%TYPE,
                             orders_table        order_items_type
                           );

    TYPE orders_type IS TABLE OF r_orders INDEX BY BINARY_INTEGER;

    gt_orders  orders_type ;

    PROCEDURE prc_load_order( an_order_id IN orders.order_id%TYPE )
    IS
        PROC_NAME           CONSTANT VARCHAR2(32) := 'prc_load_order';
        
        invalid_order       EXCEPTION;
        i                   NUMBER := 0;
        j                   NUMBER := 0;

        CURSOR c_ord
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

        CURSOR c_ord_items( p_order_id NUMBER )
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
        FOR rec_orders IN c_ord
        LOOP
           
            gt_orders(c_ord%ROWCOUNT).order_id           :=      rec_orders.order_id;
            gt_orders(c_ord%ROWCOUNT).order_date         :=      rec_orders.order_date;
            gt_orders(c_ord%ROWCOUNT).printed            :=      rec_orders.printed;
            gt_orders(c_ord%ROWCOUNT).customer_id        :=      rec_orders.customer_id;
            gt_orders(c_ord%ROWCOUNT).cust_first_name    :=      rec_orders.cust_first_name;
            gt_orders(c_ord%ROWCOUNT).cust_last_name     :=      rec_orders.cust_last_name;

            DBMS_OUTPUT.PUT_LINE('');
            DBMS_OUTPUT.PUT_LINE('Order '||gt_orders(c_ord%ROWCOUNT).order_id
                                ||' from '||gt_orders(c_ord%ROWCOUNT).cust_first_name||' '||gt_orders(c_ord%ROWCOUNT).cust_last_name
                                ||' on '||gt_orders(c_ord%ROWCOUNT).order_date); 

            FOR rec_order_items IN c_ord_items(rec_orders.order_id)
            LOOP
              
                gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).order_id          :=      rec_order_items.order_id;
                gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).line_item_id      :=      rec_order_items.line_item_id;
                gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).product_id        :=      rec_order_items.product_id;
                gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).unit_price        :=      rec_order_items.unit_price;
                gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).discount_price    :=      rec_order_items.discount_price;
                gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).quantity          :=      rec_order_items.quantity;

                DBMS_OUTPUT.PUT_LINE('Item id: '||gt_orders(c_ord%ROWCOUNT).orders_table(cur_ord_items%ROWCOUNT).line_item_id
                                    ||', product id: '||gt_orders(c_ord%ROWCOUNT).orders_table(cur_ord_items%ROWCOUNT).product_id
                                    ||', discount price: '||gt_orders(c_ord%ROWCOUNT).orders_table(cur_ord_items%ROWCOUNT).discount_price
                                    ||', quantity: '||gt_orders(c_ord%ROWCOUNT).orders_table(cur_ord_items%ROWCOUNT).quantity);
            END LOOP;
            DBMS_OUTPUT.PUT_LINE('Au fost incarcate: '||gt_orders.COUNT);
        END LOOP;

        IF gt_orders.EXISTS(an_order_id) THEN
            RAISE invalid_order;   
        END IF;

        prc_log_table( seq_08_log_table.NEXTVAL, USER, SYSDATE, 'pkg_order_management', PROC_NAME, NULL, 'load order' );

        EXCEPTION
            WHEN invalid_order THEN
                prc_log_table( seq_08_log_table.NEXTVAL, USER, SYSDATE, 'pkg_order_management',  PROC_NAME, NULL, 'Invalid order id' );
            WHEN OTHERS THEN
                prc_log_table( seq_08_log_table.NEXTVAL, USER, SYSDATE, 'pkg_order_management',  PROC_NAME, SQLCODE, SQLERRM );
                RAISE;
    END;
END pkg_order_management;
/ 
