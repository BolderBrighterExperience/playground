ALTER TABLE orders
DROP COLUMN printed;

ALTER TABLE orders
ADD  PRINTED number(1) default 0 
CONSTRAINT PRINTED CHECK (PRINTED=0 or PRINTED=1);