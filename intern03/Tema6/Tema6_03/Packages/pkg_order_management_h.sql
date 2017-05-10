CREATE OR REPLACE PACKAGE pkg_order_management
IS   
   PROCEDURE prc_load_order(an_order_id IN orders.order_id%TYPE );
   
   PROCEDURE prc_print_order (an_order_id IN orders.order_id%TYPE DEFAULT NULL);
   
END pkg_order_management;                             
/
