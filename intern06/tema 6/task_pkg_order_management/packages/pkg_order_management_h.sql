CREATE OR REPLACE PACKAGE pkg_order_management
IS
TYPE rec_order_items_type IS RECORD ( order_id      order_items.order_id%TYPE,
                                    line_item_id    order_items.line_item_id%TYPE,
                                    product_id      order_items.product_id%TYPE,
                                    unit_price      order_items.unit_price%TYPE,
                                    discount_price  order_items.discount_price%TYPE,
                                    quantity        order_items.quantity%TYPE );

TYPE t_order_items_type IS TABLE OF rec_order_items_type
    INDEX BY BINARY_INTEGER;

TYPE rec_orders_type IS RECORD (order_id            orders.order_id%TYPE,
                                order_date          orders.order_date%TYPE,
                                printed             orders.printed%TYPE,
                                customer_id         customers.customer_id%TYPE,
                                cust_first_name     customers.cust_first_name%TYPE,
                                cust_last_name      customers.cust_last_name%TYPE,
                                orders_table        t_order_items_type );

TYPE t_orders_type IS TABLE OF rec_orders_type
    INDEX BY BINARY_INTEGER;

PROCEDURE prc_load_order (an_order_id IN orders.order_id%TYPE);
PROCEDURE prc_print_order (an_order_id IN orders.order_id%TYPE);   

END pkg_order_management; 
/
