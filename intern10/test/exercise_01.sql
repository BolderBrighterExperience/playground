create table qz_signups (
   rawdata  varchar2(30)
)
/

insert into qz_signups values ('albrectsson@acmecorp.com      ')
/
insert into qz_signups values ('bill.b.bailey@betterbrands.com')
/
insert into qz_signups values ('cio@coolco.com                ')
/
commit
/

select '[' || email || ']' as testing_email
  from (
   select RTRIM(rawdata) as email
     from qz_signups
  )
 order by email
/

