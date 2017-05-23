/*
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
/*/

SELECT '['||email||']' AS testing_email
FROM (
    SELECT TRIM(rawdata) AS email
    FROM qz_signups 
    )
ORDER BY email;
/

