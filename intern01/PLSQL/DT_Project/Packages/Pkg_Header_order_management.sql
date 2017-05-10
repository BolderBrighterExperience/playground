CREATE OR REPLACE PACKAGE pkg_order_management 
IS
TYPE r_order_items IS RECORD( order_id order_items.order_id%TYPE,
                              line_item_id order_items.line_item_id %TYPE,
                              product_id order_items.product_id%TYPE,
                              unit_price  order_items.unit_price%TYPE,
                              discount_price order_items.discount_price%TYPE,
                              quantity order_items.quantity%TYPE
                             );
                            
TYPE t_order_items IS TABLE OF r_order_items INDEX BY BINARY_INTEGER;

TYPE r_orders IS RECORD (order_id        orders.order_id%TYPE,
                         customer_id     orders.customer_id%TYPE,
                         cust_first_name customers.cust_first_name%TYPE,
                         cust_last_name  customers.cust_last_name%TYPE,
                         cust_email      customers.cust_email%TYPE,
                         order_date      orders.order_date%TYPE,
                         orders_record   t_order_items
                         );

TYPE t_orders IS TABLE OF r_orders INDEX BY BINARY_INTEGER;

PROCEDURE prc_load_order ( an_order_id IN orders.order_id%TYPE );   

PROCEDURE PRC_PRINT_ORDER( an_order_id IN orders.order_id%TYPE DEFAULT NULL );  

END pkg_order_management;
/