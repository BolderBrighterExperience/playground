
--ex. 1 
select '[' || email || ']' as testing_email
  from (
   select REGEXP_REPLACE(rawdata, '\s') as email
     from qz_signups
  )
 order by email;
/





