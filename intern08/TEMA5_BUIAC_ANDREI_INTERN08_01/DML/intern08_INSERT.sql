INSERT 
INTO credit_line
SELECT seq_08_credit_line.NEXTVAL,
       customer_id,
       10000,
       SYSDATE,
       TO_DATE('01.01.2017','DD.MM.YYYY'),
       TO_DATE('31.12.2020','DD.MM.YYYY'),
       SYSDATE 
FROM   customers;  

COMMIT;
/

    


