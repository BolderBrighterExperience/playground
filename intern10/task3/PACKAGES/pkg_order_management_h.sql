CREATE OR REPLACE PACKAGE pkg_order_management
IS
   TYPE r_items    IS RECORD (order_id order_items.order_id%TYPE,
                              line_item_id order_items.line_item_id%TYPE,
                              product_id order_items.product_id%TYPE,
                              unit_price order_items.unit_price%TYPE,
                              discount_price order_items.discount_price%TYPE,
                              quantity_price order_items.quantity%Type
                              );
   TYPE t_items   IS TABLE OF r_items INDEX BY BINARY_INTEGER;
   TYPE r_orders   IS RECORD  (customer_id     orders.customer_id%TYPE,
                               cust_first_name customers.cust_first_name%TYPE,                        
                               cust_last_name  customers.cust_last_name%TYPE,
                               cust_email      customers.cust_email%TYPE,
                               phone_number    customers.phone_number%TYPE,
                               order_id        orders.order_id%TYPE,
                               order_date      orders.order_date%TYPE,
                               order_items     t_items
                              );
   TYPE t_orders  IS TABLE OF r_orders INDEX BY BINARY_INTEGER;  
   PROCEDURE prc_load_order(an_order_id IN orders.order_id%TYPE); 
   PROCEDURE prc_print_order(an_order_id IN orders.order_id%TYPE DEFAULT NULL);
END pkg_order_management;                             
/
