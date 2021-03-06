--2
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