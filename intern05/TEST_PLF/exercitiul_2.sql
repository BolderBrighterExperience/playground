I create and populate the following tables:

create table plch_items (
   item_id        integer  primary key
 , item_name      varchar2(20)
 , min_inventory  integer
 , package_qty    integer
)
/

create table plch_inventory (
   item_id        integer references plch_items
 , qty            integer
)
/

insert into plch_items values (100, 'Spoon', 40, 10)
/
insert into plch_items values (200, 'Fork' , 24, 12)
/
insert into plch_items values (300, 'Knife', 18,  6)
/

insert into plch_inventory values (100, 18)
/
insert into plch_inventory values (200, 12)
/
insert into plch_inventory values (300,  9)
/

commit
/
When the inventory of an item gets below the minimum inventory, we need to order a quantity sufficient to get us above or on minimum inventory again.

But we cannot just order any quantity. When we order, it must be in whole packages as defined by the package_qty. For example we need 22 spoons to get above minimum, which means we have to order 3 packages of 10 spoons each.

For that purpose I create this incomplete query:

select item_id
     , item_name
     , packages
     , package_qty
     , packages * package_qty order_qty 
  from (
   select i.item_id
        , i.item_name
        , (i.min_inventory/i.package_qty)-1 packages
        , i.package_qty
     from plch_items i
     join plch_inventory y
          on y.item_id = i.item_id
    where y.qty < i.min_inventory
       )
 order by item_id
/