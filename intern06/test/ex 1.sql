--1
select '[' || email || ']' as testing_email

  from (

   select rtrim(rawdata) as email

     from qz_signups

  )

 order by email

/