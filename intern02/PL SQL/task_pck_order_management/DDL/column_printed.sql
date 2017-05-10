--1. Table Orders: Add new column PRINTED type: number(1). 
-- Values allow: 0, 1. Default value: 0 (not printed). 
ALTER TABLE orders  
DROP COLUMN printed;

ALTER TABLE orders
ADD printed NUMBER(1) DEFAULT 0 NOT NULL;
    
ALTER TABLE orders 
ADD CONSTRAINT chk_orders_printed CHECK (printed IN (0,1));
