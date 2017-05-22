create or replace procedure plch_show_orders is
    v_order_id plch_orders.order_id%TYPE;
    cursor c1(par_order_id  number) is select order_id from plch_orders
        where order_id=par_order_id;
     
begin
    open c1(par_order_id number);
    loop 
    fetch c1 into v_order_id;
    exit when c1%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE (V_ORDER_ID);
    end loop;
    close c1;
end;
 /