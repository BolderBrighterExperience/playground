INSERT 
INTO gam_credit_line( credit_line_id,
                      customer_id,
                      credit_limit,
                      creation_date,
                      valid_from, 
                      valid_to,
                      last_change_date ) 
SELECT seq_intern02_credit_line.NEXTVAL,
       customer_id,
       10000,
       SYSDATE,
       TO_DATE('01.01.2017','DD.MM.YYYY'),
       TO_DATE('31.12.2020','DD.MM.YYYY'),
       SYSDATE 
FROM   customers; 

COMMIT;
