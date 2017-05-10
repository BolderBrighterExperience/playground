CREATE OR REPLACE PACKAGE BODY pkg_order_management
IS
    gt_orders  t_orders;
    PROCEDURE prc_load_order(an_order_id IN orders.order_id%TYPE)
    IS 
        ln_count_i NUMBER := 0;
        ln_count_j NUMBER := 0;
        
        CURSOR get_orders 
        IS
            SELECT o.customer_id, 
                   o.order_id, 
                   o.order_date,
                   c.cust_first_name,                  
                   c.cust_last_name,
                   c.cust_email,      
                   c.phone_number            
            FROM  orders o, customers c
            WHERE o.order_id = NVL(an_order_id,o.order_id) AND o.customer_id = c.customer_id;      
            
        CURSOR get_or_items(ord_id orders.order_id%TYPE)
        IS
            SELECT order_id, 
                   line_item_id, 
                   product_id, 
                   unit_price, 
                   discount_price, 
                   quantity
            FROM  order_items
            WHERE order_id = NVL(ord_id,order_id);  
    BEGIN
        FOR get_orders_var IN get_orders 
        LOOP
        ln_count_i := ln_count_i + 1;
        gt_orders(ln_count_i).customer_id     := get_orders_var.customer_id;
        gt_orders(ln_count_i).order_id        := get_orders_var.order_id;
        gt_orders(ln_count_i).order_date      := get_orders_var.order_date;
        gt_orders(ln_count_i).cust_first_name := get_orders_var.cust_first_name;
        gt_orders(ln_count_i).cust_last_name  := get_orders_var.cust_last_name;
        gt_orders(ln_count_i).cust_email      := get_orders_var.cust_email;
        gt_orders(ln_count_i).phone_number    := get_orders_var.phone_number;
     
            FOR get_or_items_var IN get_or_items(get_orders_var.order_id)
            LOOP
            ln_count_j :=  ln_count_j + 1;
            gt_orders(ln_count_i).order_items(ln_count_j).order_id       := get_or_items_var.order_id;
            gt_orders(ln_count_i).order_items(ln_count_j).line_item_id   := get_or_items_var.line_item_id;
            gt_orders(ln_count_i).order_items(ln_count_j).product_id     := get_or_items_var.product_id;
            gt_orders(ln_count_i).order_items(ln_count_j).unit_price     := get_or_items_var.unit_price;
            gt_orders(ln_count_i).order_items(ln_count_j).discount_price := get_or_items_var.discount_price;
            gt_orders(ln_count_i).order_items(ln_count_j).quantity_price := get_or_items_var.quantity;
                                 
            /*IF SQL%ROWCOUNT = 0 THEN
              RAISE NO_DATA_FOUND;
              END IF; */ 
            
            END LOOP;
        END LOOP;
        
        IF(ln_count_i = 0 OR ln_count_j = 0)
        THEN RAISE_APPLICATION_ERROR(-20000,'Nu exista acest id!');
        END IF;
        prc_log('info','pkg_order_management.prc_load_order');
        
    EXCEPTION
        WHEN OTHERS THEN
        prc_log('eroare','pkg_order_management.prc_load_order');
        RAISE;
    END prc_load_order;
    
    PROCEDURE prc_print_order(an_order_id IN orders.order_id%TYPE DEFAULT NULL)
    IS
        ln_count NUMBER;
        CURSOR get_id 
        IS
            SELECT order_id
            FROM orders
            WHERE printed = 0;
        lc_details CLOB; 
        ln_amount NUMBER;
        ln_amount_d NUMBER;
                
    BEGIN
        IF(an_order_id IS NULL)
        THEN                       
            FOR get_id_var IN get_id
                LOOP
                    prc_load_order(get_id_var.order_id);           
                        
                    FOR i IN gt_orders.FIRST .. gt_orders.LAST
                        LOOP
                            lc_details :=  ' Order head '||
                                            chr(10)|| ' Customer id: ' ||gt_orders(i).customer_id    ||
                                            chr(10)||' Order id: '     ||gt_orders(i).order_id       ||                                                    
                                            chr(10)||' First name: '   ||gt_orders(i).cust_first_name||
                                            chr(10)|| ' Last name: '   ||gt_orders(i).cust_last_name ||
                                            chr(10)|| ' Email: '       ||gt_orders(i).cust_email     ||
                                            chr(10)|| ' Phone number: '||gt_orders(i).phone_number   ||
                                            chr(10)||' Order date: '   ||gt_orders(i).order_date     ||
                                            chr(10)||' Order body ';                   
                   
                            ln_count        := 0;
                            ln_amount       := 0;
                            ln_amount_d     := 0;                               
                            FOR j IN gt_orders(i).order_items.FIRST .. gt_orders(i).order_items.LAST        
                                LOOP            
                                    ln_count   :=  ln_count + 1;
                                    lc_details :=  CONCAT (lc_details,                                            
                                                           chr(10)||' Item id: '  || gt_orders(i).order_items(j).line_item_id);
                                    ln_amount   := ln_amount + gt_orders(i).order_items(j).quantity_price * gt_orders(i).order_items(j).unit_price;
                                    ln_amount_d := ln_amount_d + gt_orders(i).order_items(j).quantity_price * gt_orders(i).order_items(j).discount_price;                                 
                                END LOOP;
                                gt_orders(i).order_items.DELETE();
                                lc_details := CONCAT (lc_details,
                                                      chr(10)||' Number of items: ' || ln_count);
                                lc_details :=  CONCAT (lc_details, chr(10) 
                                                       ||' Order Footer '                                                       
                                                       || chr(10) || ' Amount: ' || ln_amount
                                                       || chr(10) || ' Amount (with discount): '|| ln_amount_d);                      
                        END LOOP;
                        gt_orders.DELETE();
                        
                    INSERT INTO printed_orders VALUES(printed_id_seq.NEXTVAL,lc_details);  
                        
                    UPDATE orders
                    SET    printed = 1
                    WHERE  order_id = get_id_var.order_id;
                        
                END LOOP;
                                    
        ELSE    
            /*IF(an_order_id > 0 )
            THEN*/
            prc_load_order(an_order_id);
                FOR i IN gt_orders.FIRST .. gt_orders.LAST
                    LOOP
                        lc_details :=  ' Order head '   ||
                                       chr(10)||' Customer id: ' ||gt_orders(i).customer_id    ||
                                       chr(10)||' Order id: '    ||gt_orders(i).order_id       ||                                                    
                                       chr(10)||' First name: '  ||gt_orders(i).cust_first_name||
                                       chr(10)||' Last name: '   ||gt_orders(i).cust_last_name ||
                                       chr(10)||' Email: '       ||gt_orders(i).cust_email     ||
                                       chr(10)||' Phone number: '||gt_orders(i).phone_number   ||
                                       chr(10)||' Order date: '  ||gt_orders(i).order_date     ||
                                       chr(10)||
                                       chr(10)||' Order body ';
                     
                        ln_count        := 0;
                        ln_amount       := 0;
                        ln_amount_d     := 0;                        
                        FOR j IN gt_orders(i).order_items.FIRST .. gt_orders(i).order_items.LAST        
                            LOOP            
                                ln_count   := ln_count + 1;
                                lc_details :=  CONCAT (lc_details,     
                                                      chr(10)||' Item id: '|| gt_orders(i).order_items(j).line_item_id);
                                ln_amount   := ln_amount + gt_orders(i).order_items(j).quantity_price * gt_orders(i).order_items(j).unit_price;
                                ln_amount_d := ln_amount_d + gt_orders(i).order_items(j).quantity_price * gt_orders(i).order_items(j).discount_price;                                    
                            END LOOP;
                                gt_orders(i).order_items.DELETE();
                                lc_details :=  CONCAT (lc_details,
                                                       chr(10)||' Number of items: ' || ln_count);
                                lc_details :=  CONCAT (lc_details,chr(10)   
                                                       ||' Order Footer '                                                       
                                                       || chr(10) || ' Amount: ' || ln_amount
                                                       || chr(10) || ' Amount (with discount): '|| ln_amount_d);                                                          
                    END LOOP;  
                    gt_orders.DELETE();
                        
                INSERT INTO printed_orders VALUES(printed_id_seq.NEXTVAL,lc_details);
                        
                UPDATE orders
                SET    printed = 1
                WHERE  order_id = an_order_id;               
                END IF;
                 prc_log('info','pkg_order_management.prc_print_order');
            
    EXCEPTION
        WHEN OTHERS THEN
        prc_log('eroare','pkg_order_management.prc_print_order');
        RAISE;        
    END prc_print_order; 
    
END pkg_order_management;   
/


