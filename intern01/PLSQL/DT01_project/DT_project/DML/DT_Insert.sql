INSERT INTO DT_Credit_line(credit_line_id,
                           customer_id,
                           credit_limit,
                           creation_date,
                           valid_form, 
                           valid_to,
                           last_change_date) 
SELECT seq_dt_credit_line.NEXTVAL,
       customer_id,
       10000,
       SYSDATE,
       To_date('01.01.2017','dd.mm.yyyy'),
       To_date('31.12.2020','dd.mm.yyyy'),
       SYSDATE 
FROM customers;


COMMIT;







