CREATE OR REPLACE TRIGGER trg_08_credit_line
AFTER INSERT ON customers
FOR EACH ROW
BEGIN
    INSERT INTO credit_line(
                             credit_line_id,
                             customer_id,
                             credit_limit,
                             creation_date,
                             valid_from,
                             valid_to,
                             last_change_date
                            )
    VALUES
                           ( 
                            seq_08_credit_line.NEXTVAL ,
                            :NEW.customer_id,
                            10000,
                            SYSDATE,
                            TO_DATE('01.01.2017','DD.MM.YYYY'),
                            TO_DATE('31.12.2020','DD.MM.YYYY'),
                            SYSDATE 
                           );
END; 
/
 


