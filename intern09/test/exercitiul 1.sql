--Exercitiul 1

select '[' || email || ']' as testing_email
  from (
   select replace(email,' ','') as email
     from qz_signups
  )
 order by email
/