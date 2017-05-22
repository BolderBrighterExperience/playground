An external program is sending us signups (email addresses) for our chat forum. The program inserts into this table:

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
For some reason the developers of the external program decided to always fill the entire RAWDATA column, so if the email address is less than 30 characters, it is padded to the right with spaces until the column is filled.

But for our purposes handling the signups, I want to get rid of those trailing spaces. To do that I have this incomplete query:

select '[' || email || ']' as testing_email
  from (
   select rawdata as email
     from qz_signups
  )
 order by email
/


TESTING_EMAIL
--------------------------------
[albrectsson@acmecorp.com]
[bill.b.bailey@betterbrands.com]
[cio@coolco.com]