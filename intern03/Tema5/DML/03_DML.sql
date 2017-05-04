DELETE FROM credit_line;

INSERT 
INTO credit_line 
SELECT seq_credit_line_id.NEXTVAL,
       customer_id,
       10000,
       SYSDATE,
       TO_DATE('01.01.2017','dd.mm.yyyy'),
       TO_DATE('31.12.2020','dd.mm.yyyy'),
       SYSDATE 
FROM   customers;
                                                         
COMMIT;
/
