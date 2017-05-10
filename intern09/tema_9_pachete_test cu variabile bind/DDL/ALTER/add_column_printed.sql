ALTER TABLE orders 
ADD printed NUMBER(1) DEFAULT 0;

ALTER TABLE orders
ADD CHECK (printed=0 OR printed=1);

