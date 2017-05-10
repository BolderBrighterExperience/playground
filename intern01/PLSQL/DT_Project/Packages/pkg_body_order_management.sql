CREATE OR REPLACE PACKAGE BODY pkg_order_management
IS
gt_orders  t_orders;  

PROCEDURE prc_load_order ( an_order_id IN orders.order_id%TYPE )
IS
    i_counter           NUMBER := 0;
    j_counter           NUMBER := 0;

    CURSOR get_order_items( ord_id orders.order_id%TYPE )
    IS 
    SELECT  order_id, 
            line_item_id,
            product_id, 
            unit_price, 
            discount_price, 
            quantity 
    FROM    order_items
    WHERE   order_id = ord_id;  

    CURSOR get_orders 
    IS
    SELECT   order_id, 
             o.customer_id,
             cust_first_name,
             cust_last_name,
             cust_email, 
             order_date 
    FROM     orders o, customers c 
    WHERE    o.order_id = NVL(an_order_id,o.order_id) AND o.customer_id = c.customer_id;

BEGIN
        FOR g_orders IN get_orders
        LOOP
        i_counter := i_counter + 1;
            gt_orders(i_counter).customer_id     := g_orders.customer_id;
            gt_orders(i_counter).order_id        := g_orders.order_id;
            gt_orders(i_counter).order_date      := g_orders.order_date;
            gt_orders(i_counter).cust_first_name := g_orders.cust_first_name;
            gt_orders(i_counter).cust_last_name  := g_orders.cust_last_name;
            gt_orders(i_counter).cust_email      := g_orders.cust_email;
            
            FOR g_order_items IN get_order_items(g_orders.order_id)
            LOOP
            j_counter := j_counter + 1;
                gt_orders(i_counter).orders_record(j_counter).order_id       :=  g_order_items.order_id;
                gt_orders(i_counter).orders_record(j_counter).line_item_id   :=  g_order_items.line_item_id;
                gt_orders(i_counter).orders_record(j_counter).product_id     :=  g_order_items.product_id;
                gt_orders(i_counter).orders_record(j_counter).unit_price     :=  g_order_items.unit_price;
                gt_orders(i_counter).orders_record(j_counter).discount_price :=  g_order_items.discount_price;
                gt_orders(i_counter).orders_record(j_counter).quantity       :=  g_order_items.quantity;
             
                                   
     
            END LOOP;
        END LOOP;
        
IF ( i_counter = 0  or j_counter = 0 ) THEN  
        RAISE_APPLICATION_ERROR(-20002, 'Order id ' || an_order_id || ' ' || 'doesn''t exists!');
END IF;
 
        prc_record_table( SQLCODE, SQLERRM, 'info','pkg_order_management.prc_load_order' );
      
EXCEPTION
    WHEN OTHERS THEN
        prc_record_table( SQLCODE, SQLERRM,'error','pkg_order_management.prc_load_order' );
         RAISE;
               
END prc_load_order;
    
PROCEDURE PRC_PRINT_ORDER (an_order_id IN orders.order_id%TYPE DEFAULT NULL)
IS
    ln_count        NUMBER;
    ln_amount       NUMBER;
    ln_amount_disc  NUMBER;
    lc_details      CLOB;

    CURSOR c_print IS 
    SELECT order_id 
    FROM   orders 
    WHERE  printed = 0;


BEGIN

    IF (an_order_id IS NULL) THEN

        FOR g_print IN c_print


        LOOP
            PRC_load_ORDER(g_print.order_id);
 
            FOR i IN gt_orders.FIRST .. gt_orders.LAST
            LOOP
     
                lc_details :=  'Order header'||' '|| 
                                CHR(10)|| 'Customer id: '||gt_orders(i).customer_id||' '||
                                CHR(10)||' Order id: '||gt_orders(i).order_id||' '||
                                CHR(10)||' Order date: '||gt_orders(i).order_date ||' '||
                                CHR(10)|| ' First name:'|| gt_orders(i).cust_first_name ||' '||
                                CHR(10)||' Last name:'||gt_orders(i).cust_last_name||' '||
                                CHR(10)|| ' Email:' || gt_orders(i).cust_email||' '||
                                CHR(10)|| 'Order body' ;
                                
                ln_count       := 0;   
                ln_amount      := 0;
                ln_amount_disc := 0;
           
                FOR j IN gt_orders(i).orders_record.FIRST .. gt_orders(i).orders_record.LAST
                LOOP
                    ln_count        := ln_count + 1;
                    ln_amount       := ln_amount        + gt_orders(i).orders_record(j).quantity * gt_orders(i).orders_record(j).unit_price;
                    ln_amount_disc  := ln_amount_disc   + gt_orders(i).orders_record(j).quantity * gt_orders(i).orders_record(j).discount_price;
                    lc_details      := CONCAT(lc_details, 
                                              CHR(10)|| 'Item id: ' ||gt_orders(i).orders_record(j).line_item_id);
                END LOOP; 
                
                gt_orders(i).orders_record.DELETE();
                
                lc_details := CONCAT( lc_details , 
                                      CHR(10)||'Number of items'||' ' || ln_count);
                                  
                lc_details := CONCAT (lc_details,  
                                           CHR(10) || 'Order Footer'
                                        || CHR(10) || 'Amount: '                 || ln_amount
                                        || CHR(10) || 'Amount (with discount): ' || ln_amount_disc
                                        || CHR(10));                       
      
                 
             END LOOP;
			  gt_orders.DELETE;
            
        INSERT 
        INTO printed_orders 
        VALUES( SEQ_PRINTED_ORDERS.NEXTVAL, 
                lc_details); 
            
        UPDATE orders 
        SET    printed = 1
        WHERE  order_id=g_print.order_id;
        END LOOP;
            
    ELSE 
        PRC_load_ORDER(an_order_id);
 
        FOR i IN gt_orders.FIRST .. gt_orders.LAST
        LOOP
     
            lc_details :='Order header' || ' ' ||
                         CHR(10)||'Customer id: '||gt_orders(i).customer_id||' '||
                         CHR(10)||' Order id: '||gt_orders(i).order_id||' '||
                         CHR(10)||  ' Order date: '||gt_orders(i).order_date ||' '||
                         CHR(10)|| ' First name:'|| gt_orders(i).cust_first_name ||' '||
                         CHR(10)|| ' Last name:'||gt_orders(i).cust_last_name||' '||
                         CHR(10)|| ' Email:' || gt_orders(i).cust_email ||' '||
                         CHR(10)|| 'Order body' ;
                        
           ln_count       := 0;
           ln_amount      := 0;
           ln_amount_disc := 0;
           
            FOR j IN gt_orders(i).orders_record.FIRST .. gt_orders(i).orders_record.LAST
            LOOP
                ln_count := ln_count + 1;
                ln_amount       := ln_amount        + gt_orders(i).orders_record(j).quantity * gt_orders(i).orders_record(j).unit_price;
                ln_amount_disc  := ln_amount_disc   + gt_orders(i).orders_record(j).quantity * gt_orders(i).orders_record(j).discount_price;
                lc_details :=   CONCAT ( lc_details, 
                                         CHR(10)||'Item id: '  ||gt_orders(i).orders_record(j).line_item_id);
                                   
            
            END LOOP; 
            
            gt_orders(i).orders_record.DELETE();
            
            lc_details :=CONCAT ( lc_details, 
                                  CHR(10)||'Number of items'||' ' || ln_count); 
                                  
            lc_details := CONCAT (lc_details, CHR(10)||'Order Footer'
                                   
                                    || CHR(10) || 'Amount: '                 || ln_amount
                                    || CHR(10) || 'Amount (with discount): ' || ln_amount_disc
                                    || CHR(10)); 
          
         END LOOP;
		  gt_orders.DELETE;
         
         INSERT 
         INTO   printed_orders 
         VALUES( SEQ_PRINTED_ORDERS.NEXTVAL, 
                 lc_details
                ); 
                         
         UPDATE orders
         SET    printed = 1 
         WHERE  order_id = an_order_id;
    
     END IF;
             
         prc_record_table( SQLCODE, SQLERRM, 'info','pkg_order_management.prc_print_order' );
      
EXCEPTION
    WHEN OTHERS THEN
        prc_record_table( SQLCODE, SQLERRM,'error','pkg_order_management.prc_print_order' );
         RAISE;
     
END PRC_PRINT_ORDER;
END pkg_order_management;
/      

  