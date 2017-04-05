SET ECHO OFF
SET VERIFY OFF

PROMPT 
PROMPT Specify new user as parameter 1:
DEFINE intern   = &1
PROMPT
PROMPT 
PROMPT Specify password for &intern as parameter 2:
DEFINE pass     = &2
PROMPT 
PROMPT Specify default tablespeace for &intern as parameter 3:
DEFINE tbs      = &3
PROMPT 
PROMPT Specify temporary tablespace for &intern as parameter 4:
DEFINE ttbs     = &4
PROMPT  
PROMPT Specify log path as parameter 5:
DEFINE log_path = &5
PROMPT

DEFINE spool_file = &log_path.intern_main.log
SPOOL &spool_file

DROP USER &intern CASCADE;

CREATE USER &intern IDENTIFIED BY &pass;

ALTER USER &intern DEFAULT TABLESPACE &tbs
              QUOTA UNLIMITED ON &tbs;

ALTER USER &intern TEMPORARY TABLESPACE &ttbs;

GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO &intern;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE TO &intern;

CONNECT test/test@vis1;

CONNECT &intern/&pass@vis1;
ALTER SESSION SET NLS_LANGUAGE=American;
ALTER SESSION SET NLS_TERRITORY=America;

@hr_cre
@hr_popul
@hr_idx
@hr_code
@hr_comnt

spool off
