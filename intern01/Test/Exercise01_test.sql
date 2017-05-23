select '[' || email || ']' as testing_email
  from (
   select RTRIM(rawdata) as email
     from qz_signups
  )
 order by email
/

