CREATE OR REPLACE PACKAGE BODY pkg_order_management
IS
    TYPE r_items_type IS RECORD(
                                order_id        order_items.order_id%TYPE,
                                line_item_id    order_items.line_item_id%TYPE,
                                product_id      order_items.product_id%TYPE,
                                unit_price      order_items.unit_price%TYPE,
                                discount_price  order_items.discount_price%TYPE,
                                quantity        order_items.quantity%TYPE
    );
    TYPE t_items_tab IS TABLE OF r_items_type INDEX BY BINARY_INTEGER;
    TYPE r_orders_type IS RECORD(
                            order_id        orders.order_id%TYPE,
                            order_date      orders.order_date%TYPE,
                            customer_id     orders.customer_id%TYPE,
                            printed         orders.printed%TYPE,
                            cust_first_name customers.cust_first_name%TYPE,
                            cust_last_name  customers.cust_last_name%TYPE,
                            city            customers.city%TYPE,
                            country         customers.country%TYPE,
                            o_items         t_items_tab
                            );
    TYPE t_orders_tab IS TABLE OF r_orders_type INDEX BY BINARY_INTEGER;
    gt_orders            t_orders_tab;
    
    PROCEDURE prc_load_order (an_order_id IN orders.order_id%TYPE) 
    IS
        ls_procedure_name   VARCHAR2(50) := 'pkg_order_management.prc_load_order';
        
        i                   INTEGER := 0;
        j                   INTEGER := 0;
        
        CURSOR c_items (an_o_id orders.order_id%TYPE)
        IS 
            SELECT  order_id, 
                    line_item_id, 
                    product_id, 
                    unit_price, 
                    discount_price, 
                    quantity 
            FROM    order_items
            WHERE   order_id = NVL(an_o_id,order_id);

        CURSOR c_orders 
        IS
            SELECT  o.customer_id, 
                    o.order_id, 
                    o.order_date,
                    c.cust_first_name,
                    c.cust_last_name,
                    c.city,
                    c.country
            FROM    orders o, customers c
            WHERE   o.order_id       = NVL(an_order_id,o.order_id)  
            AND     o.customer_id    = c.customer_id;

    BEGIN
        FOR r_orders IN c_orders
        LOOP
            i := i + 1;
            gt_orders(i).customer_id         := r_orders.customer_id;
            gt_orders(i).order_id            := r_orders.order_id;
            gt_orders(i).order_date          := r_orders.order_date;
            gt_orders(i).cust_first_name     := r_orders.cust_first_name;
            gt_orders(i).cust_last_name      := r_orders.cust_last_name;
            gt_orders(i).city                := r_orders.city;
            gt_orders(i).country             := r_orders.country;
            DBMS_OUTPUT.PUT_LINE(gt_orders(i).order_id);
                      
            FOR r_items IN c_items(r_orders.order_id)
            LOOP
                j := j + 1; 
                gt_orders(i).o_items(j).order_id         := r_items.order_id;
                gt_orders(i).o_items(j).line_item_id     := r_items.line_item_id;
                gt_orders(i).o_items(j).product_id       := r_items.product_id;
                gt_orders(i).o_items(j).unit_price       := r_items.unit_price;
                gt_orders(i).o_items(j).discount_price   := r_items.discount_price;
                gt_orders(i).o_items(j).quantity         := r_items.quantity;
                DBMS_OUTPUT.PUT_LINE(gt_orders(i).o_items(j).order_id||' '||
                gt_orders(i).o_items(j).line_item_id||' '||
                gt_orders(i).o_items(j).product_id||' '||
                gt_orders(i).o_items(j).unit_price ||' '||
                gt_orders(i).o_items(j).discount_price ||' '||
                gt_orders(i).o_items(j).quantity );
                
            END LOOP;
            
        END LOOP;
      
    IF (i = 0 OR j=0) THEN
        RAISE_APPLICATION_ERROR(-20001,'Order_id doesn t exist!');    
    END IF;
    
    prc_log_error( 'info', SQLCODE, SQLERRM, ls_procedure_name);
    
    EXCEPTION
        WHEN OTHERS THEN
            prc_log_error( 'error', SQLCODE, SQLERRM, ls_procedure_name);
            RAISE;
                
    END prc_load_order;
    
    PROCEDURE prc_print_order (an_order_id IN orders.order_id%TYPE DEFAULT NULL)
    IS
        ls_procedure_name   VARCHAR2(50):='pkg_order_management.prc_print_order';
        ls_count            NUMBER  := 0;
        lc_clob             CLOB;
        ln_amount           NUMBER;
        ln_amount_disc      NUMBER;
        CURSOR c_var IS SELECT order_id FROM orders WHERE printed = 0;
    BEGIN
    
        IF(an_order_id IS NULL) THEN
            FOR r_var IN c_var 
            LOOP
                pkg_order_management.prc_load_order(r_var.order_id);
                
                FOR i IN gt_orders.FIRST .. gt_orders.LAST
                LOOP               
                    lc_clob :=  'Order Header'
                                || CHR(10) 
                                || CHR(10) ||'Customer id: '        ||gt_orders(i).customer_id
                                || CHR(10) ||'First name: '         ||gt_orders(i).cust_first_name
                                || CHR(10) ||'Last name: '          ||gt_orders(i).cust_last_name
                                || CHR(10) ||'City: '               ||gt_orders(i).city
                                || CHR(10) ||'Country: '            ||gt_orders(i).country
                                || CHR(10) ||'Order id: '           ||gt_orders(i).order_id
                                || CHR(10) ||'Order creation date: '||gt_orders(i).order_date
                                || CHR(10) 
                                || CHR(10) ||'Order Body'
                                || CHR(10);
                    ln_amount       := 0;
                    ln_amount_disc  := 0;
                    ls_count        := 0;
                    
                    FOR j IN gt_orders(i).o_items.FIRST .. gt_orders(i).o_items.LAST
                    LOOP
                        ls_count        := ls_count +1; 
                        ln_amount       := ln_amount        + gt_orders(i).o_items(j).quantity * gt_orders(i).o_items(j).unit_price;
                        ln_amount_disc  := ln_amount_disc   + gt_orders(i).o_items(j).quantity * gt_orders(i).o_items(j).discount_price;
                        lc_clob   := CONCAT(lc_clob, CHR(10) 
                                            ||'Line item id: '           ||gt_orders(i).o_items(j).line_item_id
                                            ||' Product id: '            ||gt_orders(i).o_items(j).product_id
                                            ||' Unit price: '            ||gt_orders(i).o_items(j).unit_price
                                            ||' Discount price: '        ||gt_orders(i).o_items(j).discount_price
                                            ||' Quantity: '              ||gt_orders(i).o_items(j).quantity
                                            );

                    END LOOP;
                    gt_orders(i).o_items.DELETE;
                   
                lc_clob := CONCAT (lc_clob, CHR(10) || 'Number of items: ' || ls_count || CHR(10) || CHR(10));
                lc_clob := CONCAT (lc_clob, 'Order Footer'
                                    || CHR(10) 
                                    || CHR(10) || 'Amount: '                 || ln_amount
                                    || CHR(10) || 'Amount (with discount): ' || ln_amount_disc
                                    || CHR(10)); 

                END LOOP;
                
                INSERT INTO printed_orders VALUES( seq_printed_orders.NEXTVAL, lc_clob);
                UPDATE orders SET printed = 1 WHERE order_id = r_var.order_id;
                COMMIT;
                
                lc_clob := NULL;
                
            END LOOP;
        ELSE
            pkg_order_management.prc_load_order(an_order_id);
            
            FOR i IN gt_orders.FIRST .. gt_orders.LAST
            LOOP               
                lc_clob :=  'Order Header'
                            || CHR(10) 
                            || CHR(10) ||'Customer id: '        ||gt_orders(i).customer_id
                            || CHR(10) ||'First name: '         ||gt_orders(i).cust_first_name
                            || CHR(10) ||'Last name: '          ||gt_orders(i).cust_last_name
                            || CHR(10) ||'City: '               ||gt_orders(i).city
                            || CHR(10) ||'Country: '            ||gt_orders(i).country
                            || CHR(10) ||'Order id: '           ||gt_orders(i).order_id
                            || CHR(10) ||'Order creation date: '||gt_orders(i).order_date
                            || CHR(10) 
                            || CHR(10) ||'Order Body'
                            || CHR(10);
                ln_amount       := 0;
                ln_amount_disc  := 0;
                ls_count        := 0;
                
                FOR j IN gt_orders(i).o_items.FIRST .. gt_orders(i).o_items.LAST
                LOOP
                    ls_count        := ls_count +1; 
                    ln_amount       := ln_amount        + gt_orders(i).o_items(j).quantity * gt_orders(i).o_items(j).unit_price;
                    ln_amount_disc  := ln_amount_disc   + gt_orders(i).o_items(j).quantity * gt_orders(i).o_items(j).discount_price;
                    lc_clob   := CONCAT(lc_clob, CHR(10) 
                                        ||'Line item id: '           ||gt_orders(i).o_items(j).line_item_id
                                        ||' Product id: '            ||gt_orders(i).o_items(j).product_id
                                        ||' Unit price: '            ||gt_orders(i).o_items(j).unit_price
                                        ||' Discount price: '        ||gt_orders(i).o_items(j).discount_price
                                        ||' Quantity: '              ||gt_orders(i).o_items(j).quantity
                                        );
                                        

                   
                END LOOP;
                gt_orders(i).o_items.DELETE;
               
                lc_clob := CONCAT (lc_clob, CHR(10) || 'Number of items: ' || ls_count || CHR(10) || CHR(10));
                lc_clob := CONCAT (lc_clob, 'Order Footer'
                                    || CHR(10) 
                                    || CHR(10) || 'Amount: '                 || ln_amount
                                    || CHR(10) || 'Amount (with discount): ' || ln_amount_disc
                                    || CHR(10)); 
            END LOOP;
            
            INSERT INTO printed_orders VALUES( seq_printed_orders.NEXTVAL, lc_clob);
            UPDATE orders SET printed = 1 WHERE order_id = an_order_id;
            COMMIT;
            
        END IF;
        
    prc_log_error( 'info', SQLCODE, SQLERRM, ls_procedure_name);
    
    EXCEPTION
        WHEN OTHERS THEN
            prc_log_error( 'error', SQLCODE, SQLERRM, ls_procedure_name);
            RAISE;
                
     END prc_print_order;
     
END pkg_order_management;
/   


