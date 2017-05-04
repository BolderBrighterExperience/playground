CREATE OR REPLACE TRIGGER trg_06_credit_line
AFTER INSERT ON Customers
FOR EACH ROW
  	BEGIN
    INSERT INTO Credit_line(
                  credit_line_id,
                  customer_id,
                  credit_limit,
                  creation_date,
                  valid_from,
                  valid_to,
                  last_change_date)
           VALUES
                  (seq_06_credit_line.NEXTVAL,
                    :NEW.customer_id,
                    10000,
                    SYSDATE,
                    To_date('01.01.2017','dd.mm.yyyy'),
                    To_date('31.12.2020','dd.mm.yyyy'),
                    SYSDATE );
    END;
    /