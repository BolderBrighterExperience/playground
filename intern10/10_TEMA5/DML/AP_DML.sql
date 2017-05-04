INSERT 
INTO   AP_CREDIT_LINE
SELECT SEQ_AP_CREDIT_LINE.NEXTVAL,
       customer_id,
       10000,
       SYSDATE,
       To_Date('01.01.2017','dd.MM.yyyy'),
       To_Date('31.12.2020','dd.MM.yyyy'),
       SYSDATE
FROM   customers;

COMMIT;
/
