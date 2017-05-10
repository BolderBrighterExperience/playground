
CREATE OR REPLACE PACKAGE BODY pkg_order_management
IS
TYPE r_order_items    IS RECORD (
                                    order_id        order_items.order_id%TYPE,
                                    line_item_id    order_items.line_item_id%TYPE,
                                    product_id      order_items.product_id%TYPE,
                                    unit_price      order_items.unit_price%TYPE,
                                    discount_price  order_items.discount_price%TYPE,
                                    quantity        order_items.quantity%Type
                                    );
TYPE t_order_items    IS TABLE OF r_order_items INDEX BY BINARY_INTEGER;
TYPE r_orders         IS RECORD  (
                                    customer_id     orders.customer_id%TYPE,
                                    cust_first_name customers.cust_first_name%TYPE,                        
                                    cust_last_name  customers.cust_last_name%TYPE,
                                    cust_email      customers.cust_email%TYPE,
                                    phone_number    customers.phone_number%TYPE,
                                    order_id        orders.order_id%TYPE,
                                    order_date      orders.order_date%TYPE,
                                    ord_items       t_order_items
                                    );
TYPE t_orders          IS TABLE OF r_orders INDEX BY BINARY_INTEGER;  
gt_orders  t_orders;
PROCEDURE prc_load_order(an_order_id IN orders.order_id%TYPE )
IS        
    ln_counter_i NUMBER := 0;
    ln_counter_j NUMBER := 0;

    CURSOR cursor_orders 
    IS
        SELECT o.order_id, 
               order_date,
               o.customer_id,
               cust_first_name,                  
               cust_last_name,
               cust_email,      
               phone_number            
        FROM  orders o, customers c
        WHERE o.order_id = NVL(an_order_id, o.order_id) 
        AND o.customer_id = c.customer_id;      

    CURSOR cursor_order_items( an_ord_id IN orders.order_id%TYPE )
    IS
        SELECT t.order_id, 
               line_item_id, 
               product_id, 
               unit_price, 
               discount_price, 
               quantity
        FROM order_items t
      WHERE t.order_id = an_ord_id;  
      
      
        
    BEGIN
        FOR var_cursor_orders IN cursor_orders 
        LOOP
            ln_counter_i := ln_counter_i + 1;
            gt_orders(ln_counter_i).customer_id      := var_cursor_orders.customer_id;
            gt_orders(ln_counter_i).order_id         := var_cursor_orders.order_id;
            gt_orders(ln_counter_i).order_date       := var_cursor_orders.order_date;
            gt_orders(ln_counter_i).cust_first_name  := var_cursor_orders.cust_first_name;
            gt_orders(ln_counter_i).cust_last_name   := var_cursor_orders.cust_last_name;
            gt_orders(ln_counter_i).cust_email       := var_cursor_orders.cust_email;
            gt_orders(ln_counter_i).phone_number     := var_cursor_orders.phone_number;
            /*DBMS_OUTPUT.PUT_LINE( 'Customer id: '  ||gt_orders(ln_counter_i).customer_id||
                                    ' Order id: '    ||gt_orders(ln_counter_i).order_id ||                            
                                    ' Order date: '  ||gt_orders(ln_counter_i).order_date||
                                    ' First name: '  ||gt_orders(ln_counter_i).cust_first_name||
                                    ' Last name: '   ||gt_orders(ln_counter_i).cust_last_name||
                                    ' Email: '       ||gt_orders(ln_counter_i).cust_email||
                                    ' Phone number: '||gt_orders(ln_counter_i).phone_number      
                                    );*/
            FOR var_cursor_ord_items IN cursor_order_items(var_cursor_orders.order_id)
            LOOP
                ln_counter_j :=  ln_counter_j + 1;
                gt_orders(ln_counter_i).ord_items(ln_counter_j).order_id         := var_cursor_ord_items.order_id;
                gt_orders(ln_counter_i).ord_items(ln_counter_j).line_item_id     := var_cursor_ord_items.line_item_id;
                gt_orders(ln_counter_i).ord_items(ln_counter_j).product_id       := var_cursor_ord_items.product_id;
                gt_orders(ln_counter_i).ord_items(ln_counter_j).unit_price       := var_cursor_ord_items.unit_price;
                gt_orders(ln_counter_i).ord_items(ln_counter_j).discount_price   := var_cursor_ord_items.discount_price;
                gt_orders(ln_counter_i).ord_items(ln_counter_j).quantity         := var_cursor_ord_items.quantity;
               /*DBMS_OUTPUT.PUT_LINE('Item id: '       ||gt_orders(ln_counter_i).ord_items(ln_counter_j).line_item_id||
                                     ' Product id: '    ||gt_orders(ln_counter_i).ord_items(ln_counter_j).product_id||
                                     ' Unit price: '    ||gt_orders(ln_counter_i).ord_items(ln_counter_j).unit_price||
                                     ' Discount price: '||gt_orders(ln_counter_i).ord_items(ln_counter_j).discount_price||
                                     ' Quantity price: '||gt_orders(ln_counter_i).ord_items(ln_counter_j).quantity 
                                     );*/
            END LOOP;
        END LOOP;
        
        IF (ln_counter_i = 0 OR ln_counter_j=0) THEN
            RAISE_APPLICATION_ERROR(-20222,'Order id does not exist.');    
        END IF;
    
        proc_log( SQLCODE, SQLERRM,'info', 'pkg_order_management.prc_load_order');
    
    EXCEPTION
        WHEN OTHERS THEN
            proc_log(SQLCODE, SQLERRM,'error', 'pkg_order_management.prc_load_order');
            RAISE;
           
                

END prc_load_order;

PROCEDURE prc_print_order (an_order_id IN orders.order_id%TYPE DEFAULT NULL)
IS
    lc_details      CLOB;
    ln_count        NUMBER;
    ln_amount       NUMBER;
    ln_amount_disc  NUMBER;
    
    
    CURSOR c_id_order
    IS 
        SELECT order_id 
        FROM orders
        WHERE printed = 0;
    BEGIN 

        IF (an_order_id IS NULL) THEN
            FOR var_id_order IN c_id_order 
            LOOP
                prc_load_order(var_id_order.order_id);
              
    
                FOR i IN gt_orders.FIRST .. gt_orders.LAST
                LOOP
                    lc_details := ' Order head ' ||
                                  CHR(10)||
                                  CHR(10)||' Customer id: ' ||gt_orders(i).customer_id||
                                  CHR(10)||' Order id: ' ||gt_orders(i).order_id ||
                                  CHR(10)||' First name: ' ||gt_orders(i).cust_first_name||
                                  CHR(10)||' Last name: ' ||gt_orders(i).cust_last_name||
                                  CHR(10)||' Email: ' ||gt_orders(i).cust_email||
                                  CHR(10)||' Phone number: '||gt_orders(i).phone_number||
                                  CHR(10)||' Order date: ' ||gt_orders(i).order_date||
                                  CHR(10)||' Order body ' 
                                    ;
                    ln_count        := 0;
                    ln_amount       := 0;
                    ln_amount_disc  := 0;
                    FOR j IN gt_orders(i).ord_items.FIRST .. gt_orders(i).ord_items.LAST
                    LOOP
                        ln_count := ln_count + 1;
                        lc_details := CONCAT(lc_details , 
                                             CHR(10) ||' Item id: ' ||gt_orders(i).ord_items(j).line_item_id||
                                             CHR(10) ||' Product id: '            ||gt_orders(i).ord_items(j).product_id||
                                             CHR(10) ||' Unit price: '            ||gt_orders(i).ord_items(j).unit_price||
                                             CHR(10) ||' Discount price: '        ||gt_orders(i).ord_items(j).discount_price||
                                             CHR(10) ||' Quantity: '              ||gt_orders(i).ord_items(j).quantity);
                        ln_amount       := ln_amount        + gt_orders(i).ord_items(j).quantity * gt_orders(i).ord_items(j).unit_price;
                        ln_amount_disc  := ln_amount_disc   + gt_orders(i).ord_items(j).quantity * gt_orders(i).ord_items(j).discount_price;
                    END LOOP;
                    gt_orders(i).ord_items.DELETE(); 
            
                    lc_details := CONCAT( lc_details, ' Number of items: ' || ln_count
                                            || CHR(10) 
                                            || CHR(10) ||'Order Footer'
                                            || CHR(10) || 'Amount: '               || ln_amount
                                            || CHR(10) || 'Amount with discount: ' || ln_amount_disc
                                            || CHR(10));         
                END LOOP;  
                
                INSERT INTO printed_orders VALUES (id_type_seq.NEXTVAL, lc_details);
                UPDATE orders
                SET printed = 1
                WHERE order_id = var_id_order.order_id;
        
            END LOOP;
     
        ELSE         
            prc_load_order(an_order_id);
          
    
            FOR i IN gt_orders.FIRST .. gt_orders.LAST
            LOOP
                lc_details := ' Order head ' ||
                              CHR(10)||' Customer id: ' ||gt_orders(i).customer_id||
                              CHR(10)||' Order id: '    ||gt_orders(i).order_id ||
                              CHR(10)||' First name: '  ||gt_orders(i).cust_first_name||
                              CHR(10)||' Last name: '   ||gt_orders(i).cust_last_name||
                              CHR(10)||' Email: '       ||gt_orders(i).cust_email||
                              CHR(10)||' Phone number: '||gt_orders(i).phone_number||
                              CHR(10)||' Date: '  ||gt_orders(i).order_date||
                              CHR(10)||' Order body ';
                ln_count := 0;
                ln_amount       := 0;
                ln_amount_disc  := 0;
                FOR j IN gt_orders(i).ord_items.FIRST .. gt_orders(i).ord_items.LAST
                LOOP
                    ln_count := ln_count + 1;
                    lc_details := CONCAT(lc_details , 
                                         CHR(10) ||' Item id: '          ||gt_orders(i).ord_items(j).line_item_id||
                                         CHR(10) ||' Product id: '       ||gt_orders(i).ord_items(j).product_id||
                                         CHR(10) ||' Unit price: '      ||gt_orders(i).ord_items(j).unit_price||
                                         CHR(10) ||' Discount price: '  ||gt_orders(i).ord_items(j).discount_price||
                                         CHR(10) ||' Quantity: '        ||gt_orders(i).ord_items(j).quantity);
                    ln_amount       := ln_amount      + gt_orders(i).ord_items(j).quantity * gt_orders(i).ord_items(j).unit_price;
                    ln_amount_disc  := ln_amount_disc + gt_orders(i).ord_items(j).quantity * gt_orders(i).ord_items(j).discount_price;
                END LOOP;
                gt_orders(i).ord_items.DELETE(); 
            
                lc_details := CONCAT( lc_details, ' Number of items: ' || ln_count
                                      ||CHR(10)|| 'Order Footer'                                      
                                      || CHR(10) || 'Amount: '               || ln_amount
                                      || CHR(10) || 'Amount with discount: ' || ln_amount_disc
                                      || CHR(10));         
            END LOOP;        
            INSERT INTO printed_orders VALUES (id_type_seq.NEXTVAL, lc_details);
            UPDATE orders
            SET printed = 1
            WHERE order_id = an_order_id;
    
        END IF;
        proc_log( SQLCODE, SQLERRM,'info', 'pkg_order_management.prc_load_order');
    
    EXCEPTION
        WHEN OTHERS THEN
            proc_log(SQLCODE, SQLERRM,'error', 'pkg_order_management.prc_load_order');
                    
        
END prc_print_order;
END pkg_order_management;   
/

