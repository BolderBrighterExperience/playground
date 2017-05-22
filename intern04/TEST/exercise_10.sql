
--gaseste
select * from user_source
where lower(text) LIKE ('%success%');


--inlocuieste   
select regexp_replace (dbms_metadata.get_ddl (object_type, object_name, USER) , 'Success', '***REPLACED HERE***')
from (
select distinct object_name, object_type
    from user_procedures where object_name in (select name from user_source where lower(text) like '%success%')
);