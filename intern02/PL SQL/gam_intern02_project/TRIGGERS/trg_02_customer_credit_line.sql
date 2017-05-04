CREATE OR REPLACE TRIGGER trg_02_customer_credit_line
    AFTER INSERT ON customers
    FOR EACH ROW
BEGIN
    INSERT 
    INTO gam_credit_line 
    VALUES ( seq_intern02_credit_line.NEXTVAL, 
             :NEW.customer_id,
              10000,
              SYSDATE,
              TO_DATE( '01.01.2017' , 'DD.MM.YYYY' ),
              TO_DATE( '31.12.2020' , 'DD.MM.YYYY' ),
              SYSDATE);
END;