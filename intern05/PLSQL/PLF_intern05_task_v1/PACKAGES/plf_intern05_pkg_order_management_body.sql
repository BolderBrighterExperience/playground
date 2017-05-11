CREATE OR REPLACE PACKAGE BODY pkg_order_management
IS
    TYPE rec_order_items_type IS RECORD ( order_id      order_items.order_id%TYPE,
                                        line_item_id    order_items.line_item_id%TYPE,
                                        product_id      order_items.product_id%TYPE,
                                        unit_price      order_items.unit_price%TYPE,
                                        discount_price  order_items.discount_price%TYPE,
                                        quantity        order_items.quantity%TYPE );

    TYPE t_order_items_type IS TABLE OF rec_order_items_type INDEX BY BINARY_INTEGER;

    TYPE rec_orders_type IS RECORD (order_id            orders.order_id%TYPE,
                                    order_date          orders.order_date%TYPE,
                                    printed             orders.printed%TYPE,
                                    customer_id         customers.customer_id%TYPE,
                                    cust_first_name     customers.cust_first_name%TYPE,
                                    cust_last_name      customers.cust_last_name%TYPE,
                                    orders_table        t_order_items_type );

    TYPE t_orders_type IS TABLE OF rec_orders_type
        INDEX BY BINARY_INTEGER;

    plf_orders  t_orders_type;

    PROCEDURE prc_load_order (an_order_id IN orders.order_id%TYPE)
    IS
        LS_PROC_NAME        VARCHAR2(32) := 'prc_load_order';
        le_invalid_order    EXCEPTION;
        i                   NUMBER := 0;
        j                   NUMBER := 0;

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

        CURSOR cur_order_items(p_order_id orders.order_id%TYPE)
        IS
            SELECT  order_id,
                    line_item_id, 
                    product_id, 
                    unit_price, 
                    discount_price, 
                    quantity
            FROM    order_items
            WHERE   order_id = NVL(p_order_id, order_id);

    BEGIN
        FOR rec_orders IN cur_orders
        LOOP
            i := i + 1;
            plf_orders(i).order_id := rec_orders.order_id;
            plf_orders(i).order_date := rec_orders.order_date;
            plf_orders(i).printed := rec_orders.printed;
            plf_orders(i).customer_id := rec_orders.customer_id;
            plf_orders(i).cust_first_name := rec_orders.cust_first_name;
            plf_orders(i).cust_last_name := rec_orders.cust_last_name;

            /* DBMS_OUTPUT.PUT_LINE('Order date: '||plf_orders(i).order_date
                                    ||', Customer_id: '||plf_orders(i).customer_id
                                    ||', Cust_first_name: '||plf_orders(i).cust_first_name
                                    ||', Cust_last_name: '||plf_orders(i).cust_last_name); */
            
            FOR rec_order_items IN cur_order_items(rec_orders.order_id)
            LOOP
                j := j + 1;
                plf_orders(i).orders_table(j).order_id := rec_order_items.order_id;
                plf_orders(i).orders_table(j).line_item_id := rec_order_items.line_item_id;
                plf_orders(i).orders_table(j).product_id := rec_order_items.product_id;
                plf_orders(i).orders_table(j).unit_price := rec_order_items.unit_price;
                plf_orders(i).orders_table(j).discount_price := rec_order_items.discount_price;
                plf_orders(i).orders_table(j).quantity := rec_order_items.quantity;

           /*  DBMS_OUTPUT.PUT_LINE('Item id: '||plf_orders(i).orders_table(j).line_item_id
                                    ||', product id: '||plf_orders(i).orders_table(j).product_id
                                    ||', discount price: '||plf_orders(i).orders_table(j).discount_price
                                    ||', quantity: '||plf_orders(i).orders_table(j).quantity);  */
            END LOOP;
        END LOOP;

        IF (i = 0 OR j=0) THEN
            RAISE le_invalid_order;   
        END IF;

        prc_log_table( USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, 'load order' );

        EXCEPTION
            WHEN le_invalid_order THEN
                prc_log_table( USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, 'Invalid order id' );
            WHEN INVALID_CURSOR THEN
                prc_log_table( USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, SQLERRM );
            WHEN OTHERS THEN
                prc_log_table( USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, SQLCODE, SQLERRM );
                RAISE;
    END;
PROCEDURE prc_print_order (an_order_id IN orders.order_id%TYPE DEFAULT NULL )
IS

        LS_PROC_NAME    VARCHAR2(32):='prc_print_order';
        ls_count_number     NUMBER  := 0;
        lc_clob_detail      CLOB;
        ln_amount           NUMBER;
        ln_amount_discount  NUMBER;
        le_invalid_order    EXCEPTION;
        NewLineChar         VARCHAR2 :=  CHR(13) || CHR(10);
        
CURSOR c_print IS SELECT order_id FROM orders WHERE printed = 0;
BEGIN
        IF(an_order_id IS NULL) THEN
            FOR r_print IN c_print
            LOOP
                pkg_order_management.prc_load_order(r_print.order_id);
        FOR i IN plf_orders.FIRST .. plf_orders.LAST
                LOOP               
                  lc_clob_detail :=  'HEADER'
                                || NewLineChar 
                                || NewLineChar ||' Customer id: '        ||plf_orders(i).customer_id
                                || NewLineChar ||' First name: '         ||plf_orders(i).cust_first_name
                                || NewLineChar ||' Last name: '          ||plf_orders(i).cust_last_name
                                || NewLineChar ||' Order id: '           ||plf_orders(i).order_id
                                || NewLineChar ||' Order creation date: '||plf_orders(i).order_date
                                || NewLineChar 
                                || NewLineChar ||'BODY'
                                || NewLineChar;
                    ln_amount           := 0;
                    ln_amount_discount  := 0;
                    ls_count_number            := 0;
        FOR j IN plf_orders(i).orders_table.FIRST .. plf_orders(i).orders_table.LAST
                    LOOP
                        ls_count_number     := ls_count_number +1; 
                        ln_amount           := ln_amount        + plf_orders(i).orders_table(j).quantity * plf_orders(i).orders_table(j).unit_price;
                        ln_amount_discount  := ln_amount_discount   + plf_orders(i).orders_table(j).quantity * plf_orders(i).orders_table(j).discount_price;
                        lc_clob_detail      := CONCAT(lc_clob_detail, NewLineChar 
                                            ||' Line item id: '           ||plf_orders(i).orders_table(j).line_item_id
                                            ||' Product id: '            ||plf_orders(i).orders_table(j).product_id
                                            ||' Unit price: '            ||plf_orders(i).orders_table(j).unit_price
                                            ||' Discount price: '        ||plf_orders(i).orders_table(j).discount_price
                                            ||' Quantity: '              ||plf_orders(i).orders_table(j).quantity);
                    END LOOP;
                plf_orders(i).orders_table.DELETE;
                lc_clob_detail := CONCAT (lc_clob_detail, NewLineChar || 'Number of items: ' || ls_count_number || NewLineChar || NewLineChar);
                lc_clob_detail := CONCAT (lc_clob_detail, 'FOOTER'
                                        || NewLineChar 
                                        || NewLineChar || 'Amount price: '                 || ln_amount
                                        || NewLineChar || 'Amount with discount : ' || ln_amount_discount
                                        || NewLineChar); 
                END LOOP;               
                plf_orders.DELETE;                
                INSERT 
                INTO    printed_orders 
                VALUES  (SEQ_ID_TYPE.NEXTVAL, lc_clob_detail);
                
                UPDATE  orders 
                SET     printed = 1 
                WHERE   order_id = r_print.order_id;
                
                lc_clob_detail := NULL;            
            END LOOP;
        ELSE
            pkg_order_management.prc_load_order(an_order_id);
        FOR i IN plf_orders.FIRST .. plf_orders.LAST
            LOOP               
              lc_clob_detail :=  'HEADER'
                            || NewLineChar 
                            || NewLineChar ||' Customer id: '        ||plf_orders(i).customer_id
                            || NewLineChar ||' First name: '         ||plf_orders(i).cust_first_name
                            || NewLineChar ||' Last name: '          ||plf_orders(i).cust_last_name
                            || NewLineChar ||' Order id: '           ||plf_orders(i).order_id
                            || NewLineChar ||' Order creation date: '||plf_orders(i).order_date
                            || NewLineChar 
                            || NewLineChar ||'BODY'
                            || NewLineChar;
                ln_amount           := 0;
                ln_amount_discount  := 0;
                ls_count_number     := 0;
                
        FOR j IN plf_orders(i).orders_table.FIRST .. plf_orders(i).orders_table.LAST
                LOOP
                    ls_count_number     := ls_count_number +1; 
                    ln_amount           := ln_amount        + plf_orders(i).orders_table(j).quantity * plf_orders(i).orders_table(j).unit_price;
                    ln_amount_discount  := ln_amount_discount   + plf_orders(i).orders_table(j).quantity * plf_orders(i).orders_table(j).discount_price;
                    lc_clob_detail      := CONCAT(lc_clob_detail, NewLineChar 
                                        ||' Line item id: '           ||plf_orders(i).orders_table(j).line_item_id
                                        ||' Product id: '            ||plf_orders(i).orders_table(j).product_id
                                        ||' Unit price: '            ||plf_orders(i).orders_table(j).unit_price
                                        ||' Discount price: '        ||plf_orders(i).orders_table(j).discount_price
                                        ||' Quantity: '              ||plf_orders(i).orders_table(j).quantity );                                              
                END LOOP;
                plf_orders(i).orders_table.DELETE;
                lc_clob_detail := CONCAT (lc_clob_detail, NewLineChar || 'Number of items: ' || ls_count_number || NewLineChar || NewLineChar);
                lc_clob_detail := CONCAT (lc_clob_detail, 'FOOTER'
                                        || NewLineChar 
                                        || NewLineChar || 'Amount price: '                 || ln_amount
                                        || NewLineChar || 'Amount with discount: ' || ln_amount_discount
                                        || NewLineChar); 
            END LOOP;            
            plf_orders.DELETE;            
            INSERT 
            INTO    printed_orders 
            VALUES  (SEQ_ID_TYPE.NEXTVAL, lc_clob_detail);
            
            UPDATE  orders 
            SET     printed = 1 
            WHERE   order_id = an_order_id;
            
        END IF;   
         prc_log_table( USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, 'load order' );

        EXCEPTION
            WHEN le_invalid_order THEN
                prc_log_table( USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, 'Invalid order id' );
            WHEN INVALID_CURSOR THEN
                prc_log_table( USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, NULL, SQLERRM );
            WHEN OTHERS THEN
                prc_log_table( USER, SYSDATE, $$PLSQL_UNIT, LS_PROC_NAME, SQLCODE, SQLERRM );
                RAISE;
                
END prc_print_order;
END pkg_order_management;
/