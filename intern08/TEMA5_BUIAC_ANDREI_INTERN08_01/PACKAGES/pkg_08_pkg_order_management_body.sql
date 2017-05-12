--package body
CREATE OR REPLACE PACKAGE BODY pkg_order_management
IS
    TYPE r_order_items IS RECORD ( 		  order_id      	order_items.order_id%TYPE,
                                        line_item_id    order_items.line_item_id%TYPE,
                                        product_id      order_items.product_id%TYPE,
                                        unit_price      order_items.unit_price%TYPE,
                                        discount_price  order_items.discount_price%TYPE,
                                        quantity        order_items.quantity%TYPE
									);

    TYPE t_order_items IS TABLE OF r_order_items INDEX BY BINARY_INTEGER;

    TYPE r_orders IS RECORD (		    order_id            orders.order_id%TYPE,
                                    order_date          orders.order_date%TYPE,
                                    printed             orders.printed%TYPE,
                                    customer_id         customers.customer_id%TYPE,
                                    cust_first_name     customers.cust_first_name%TYPE,
                                    cust_last_name      customers.cust_last_name%TYPE,
                                    orders_table        t_order_items
								);

    TYPE t_orders IS TABLE OF r_orders INDEX BY BINARY_INTEGER;

    gt_orders  t_orders ;

   PROCEDURE prc_load_order (an_order_id IN orders.order_id%TYPE)
    IS
        PROC_NAME         	CONSTANT VARCHAR2(32) := 'prc_load_order';
        invalid_order      	EXCEPTION;
       

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

        CURSOR c_ord_items(an_order_id NUMBER)
        IS
            SELECT  order_id,
                    line_item_id, 
                    product_id, 
                    unit_price, 
                    discount_price, 
                    quantity
            FROM    order_items
            WHERE   order_id = an_order_id;


    BEGIN
        FOR r_orders IN c_ord
        LOOP
           
            gt_orders(c_ord%ROWCOUNT).order_id 				:= 		r_orders.order_id;
            gt_orders(c_ord%ROWCOUNT).order_date 			:= 		r_orders.order_date;
            gt_orders(c_ord%ROWCOUNT).printed 				:= 		r_orders.printed;
            gt_orders(c_ord%ROWCOUNT).customer_id 			:= 		r_orders.customer_id;
            gt_orders(c_ord%ROWCOUNT).cust_first_name 		:= 		r_orders.cust_first_name;
            gt_orders(c_ord%ROWCOUNT).cust_last_name 		:= 		r_orders.cust_last_name;

          /*  DBMS_OUTPUT.PUT_LINE('');
            DBMS_OUTPUT.PUT_LINE('Order '||gt_orders(c_ord%ROWCOUNT).order_id
                                ||' from '||gt_orders(c_ord%ROWCOUNT).cust_first_name||' '||gt_orders(c_ord%ROWCOUNT).cust_last_name
                                ||' on '||gt_orders(c_ord%ROWCOUNT).order_date); */

            FOR r_order_items IN c_ord_items(r_orders.order_id)
            LOOP
              
                gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).order_id 			:= 		r_order_items.order_id;
                gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).line_item_id 		:= 		r_order_items.line_item_id;
                gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).product_id 		:= 		r_order_items.product_id;
                gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).unit_price 		:= 		r_order_items.unit_price;
                gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).discount_price 	:= 		r_order_items.discount_price;
                gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).quantity 			:= 		r_order_items.quantity;

               /* DBMS_OUTPUT.PUT_LINE('Item id: '||gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).line_item_id
                                    ||', product id: '||gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).product_id
                                    ||', discount price: '||gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).discount_price
                                    ||', quantity: '||gt_orders(c_ord%ROWCOUNT).orders_table(c_ord_items%ROWCOUNT).quantity); */
                 
            END LOOP;
		--	DBMS_OUTPUT.PUT_LINE('Au fost incarcate: '||gt_orders.COUNT);
        END LOOP;

        IF (gt_orders.COUNT = 0) THEN
            RAISE invalid_order;   
        END IF;

        prc_log_table( seq_08_log_table.NEXTVAL, USER, SYSDATE, 'pkg_order_management', proc_name, NULL, 'load order' );

        EXCEPTION
            WHEN invalid_order THEN
                prc_log_table( seq_08_log_table.NEXTVAL, USER, SYSDATE, 'pkg_order_management',  proc_name, NULL, 'Invalid order id' );
                RAISE;
            WHEN OTHERS THEN
                prc_log_table( seq_08_log_table.NEXTVAL, USER, SYSDATE, 'pkg_order_management',  proc_name, SQLCODE, SQLERRM );
                RAISE;
    END;

 PROCEDURE prc_print_order (an_order_id IN orders.order_id%TYPE DEFAULT NULL)
    IS
        PROCEDURE_NAME   			                 CONSTANT VARCHAR2(50):='prc_print_order';
        var_count           		     	         NUMBER  := 0;
        var_clob             	 	      	       CLOB;
        var_amount           		      	       NUMBER;
        var_amount_discount         	  	     NUMBER;
        var_chr                       		     VARCHAR2(100) := CHR(13)||CHR(10);
        invalid_order1                		     EXCEPTION;
            CURSOR c_var 
            IS
            SELECT order_id 
            FROM orders 
            WHERE printed = 0;
    BEGIN
        IF(an_order_id IS NULL) THEN
            FOR r_var IN c_var
            LOOP
                prc_load_order(r_var.order_id);
                
                FOR i  IN gt_orders.FIRST .. gt_orders.LAST
                LOOP               
                    var_clob :=  'Order Header'
                                || var_chr
                                || var_chr ||'Customer id: '        ||gt_orders(i).customer_id
                                || var_chr ||'First name: '         ||gt_orders(i).cust_first_name
                                || var_chr ||'Last name: '          ||gt_orders(i).cust_last_name
                                || var_chr ||'Order id: '           ||gt_orders(i).order_id
                                || var_chr ||'Order creation date: '||gt_orders(i).order_date
                                || var_chr ||'Order Body'
                                || var_chr;
                    var_amount       := 0;
                    var_amount_discount  := 0;
                    var_count        := 0;
                    
                    FOR j IN gt_orders(i).orders_table.FIRST .. gt_orders(i).orders_table.LAST
                    LOOP
                        var_count        := var_count +1; 
                        var_amount       := var_amount        + gt_orders(i).orders_table(j).quantity * gt_orders(i).orders_table(j).unit_price;
                        var_amount_discount  := var_amount_discount   + gt_orders(i).orders_table(j).quantity * gt_orders(i).orders_table(j).discount_price;
                        var_clob   := CONCAT(var_clob, var_chr 
                                            ||'Line item id: '           ||gt_orders(i).orders_table(j).line_item_id
                                            ||' Unit price: '            ||gt_orders(i).orders_table(j).unit_price
                                            ||' Discount price: '        ||gt_orders(i).orders_table(j).discount_price
                                            ||' Quantity: '              ||gt_orders(i).orders_table(j).quantity
                                            );

                    END LOOP;
                    gt_orders(i).orders_table.DELETE;
                   
                var_clob := CONCAT (var_clob, var_chr || 'Number of items: ' || var_count || var_chr || var_chr);
                var_clob := CONCAT (var_clob, 'Order Footer'
                                    || var_chr 
                                    || var_chr || 'Amount: '                 || var_amount
                                    || var_chr || 'Amount (with discount): ' || var_amount_discount
                                    || var_chr); 

                END LOOP;
                
                gt_orders.DELETE;
                
                INSERT 
                INTO    printed_orders 
                VALUES  (seq_08_id.NEXTVAL, var_clob);
                
                UPDATE  orders 
                SET     printed = 1 
                WHERE   order_id = r_var.order_id;
                
                var_clob := NULL;
                
            END LOOP;
        ELSE
            pkg_order_management.prc_load_order(an_order_id);
            
            FOR i IN gt_orders.FIRST .. gt_orders.LAST
            LOOP               
                var_clob :=  'Order Header'
                            || var_chr 
                            || var_chr ||'Customer id: '        ||gt_orders(i).customer_id
                            || var_chr ||'First name: '         ||gt_orders(i).cust_first_name
                            || var_chr ||'Last name: '          ||gt_orders(i).cust_last_name
                            || var_chr ||'Order id: '           ||gt_orders(i).order_id
                            || var_chr ||'Order creation date: '||gt_orders(i).order_date
                            || var_chr 
                            || var_chr ||'Order Body'
                            || var_chr;
                var_amount       := 0;
                var_amount_discount  := 0;
                var_count        := 0;
                
                FOR j IN gt_orders(i).orders_table.FIRST .. gt_orders(i).orders_table.LAST
                LOOP
                    var_count        := var_count +1; 
                    var_amount       := var_amount        + gt_orders(i).orders_table(j).quantity * gt_orders(i).orders_table(j).unit_price;
                    var_amount_discount  := var_amount_discount   + gt_orders(i).orders_table(j).quantity * gt_orders(i).orders_table(j).discount_price;
                    var_clob   := CONCAT(var_clob, var_chr 
                                        ||'Line item id: '           ||gt_orders(i).orders_table(j).line_item_id
                                        ||' Product id: '            ||gt_orders(i).orders_table(j).product_id
                                        ||' Unit price: '            ||gt_orders(i).orders_table(j).unit_price
                                        ||' Discount price: '        ||gt_orders(i).orders_table(j).discount_price
                                        ||' Quantity: '              ||gt_orders(i).orders_table(j).quantity
                                        );
                                        

                   
                END LOOP;
                gt_orders(i).orders_table.DELETE;
               
                var_clob := CONCAT (var_clob, var_chr || 'Number of items: ' || var_count || var_chr || var_chr);
                var_clob := CONCAT (var_clob, 'Order Footer'
                                    || var_chr 
                                    || var_chr || 'Amount: '                 || var_amount
                                    || var_chr || 'Amount (with discount): ' || var_amount_discount
                                    || var_chr); 
            END LOOP;
            
            gt_orders.DELETE;
            
            INSERT 
            INTO    printed_orders 
            VALUES  (seq_08_id.NEXTVAL, var_clob);
            
            UPDATE  orders 
            SET     printed = 1 
            WHERE   order_id = an_order_id;
            
        END IF;
        
			 prc_log_table( seq_08_log_table.NEXTVAL, USER, SYSDATE, 'pkg_order_management', procedure_name, NULL, 'PRINTED order' );
    
           EXCEPTION
            WHEN invalid_order1 THEN
                prc_log_table( seq_08_log_table.NEXTVAL, USER, SYSDATE, 'pkg_order_management',  procedure_name, NULL, 'Invalid order id' );
            WHEN OTHERS THEN
                prc_log_table( seq_08_log_table.NEXTVAL, USER, SYSDATE, 'pkg_order_management',  procedure_name, SQLCODE, SQLERRM );
                RAISE;
    END;

END pkg_order_management;
/ 
