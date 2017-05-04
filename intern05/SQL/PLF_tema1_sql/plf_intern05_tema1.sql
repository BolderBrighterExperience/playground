drop table plf_departments CASCADE constraints;
drop table plf_employees CASCADE constraints;

create table plf_departments(
id number primary key,
denumire varchar2(50));

create table plf_employees(
id number primary key,
nume varchar2(50),
prenume varchar2(50),
data_nasterii date,
data_angajarii date default sysdate,
gen varchar2(1) check (gen= 'F' or gen = 'M'),
salariu number default 0,
id_dept number,
foreign key(id_dept) references plf_departments(id));

--Tabela DEPARTMENTS este populata cu urmatoarele inregistrari
insert into plf_departments values (1,'HR');
insert into plf_departments values (2,'DB'); 
insert into plf_departments values (3,'IT'); 
insert into plf_departments values (4,'CAS');
insert into plf_departments values (5,'HCI');

--Tabela EMPLOYEES este populata cu urmatoarele inregistrari
insert into plf_employees values (1,'IONESCU','Alin',to_date('10.01.1990','dd.mm.yyyy'),to_date('01.01.2015','dd.mm.yyyy'),'M',900,1);
insert into plf_employees values (2,'OANCEA','Maria',to_date('31.03.1970','dd.mm.yyyy'),to_date('15.10.2016','dd.mm.yyyy'),'F',4000,1);
insert into plf_employees values (3,'CRISTESCU','Vasile',to_date('15.04.1984','dd.mm.yyyy'),to_date('20.04.2014','dd.mm.yyyy'),'M',550,1);
insert into plf_employees values (4,'POPESCU','Oana',to_date('23.05.1981','dd.mm.yyyy'),to_date('03.06.2016','dd.mm.yyyy'),'F',750,1);
insert into plf_employees values (5,'STROE','Ion',to_date('29.09.1982','dd.mm.yyyy'),to_date('01.01.2017','dd.mm.yyyy'),'M',3560,2);
insert into plf_employees values (6,'GRECU','Radu',to_date('31.10.1992','dd.mm.yyyy'),to_date('30.08.2016','dd.mm.yyyy'),'M',4570,2);
insert into plf_employees values (7,'POPESCU','Mihai',to_date('20.08.1994','dd.mm.yyyy'),to_date('15.06.2015','dd.mm.yyyy'),'M',230,2);
insert into plf_employees values (8,'GANEA','Bogdan',to_date('01.02.1997','dd.mm.yyyy'),to_date('01.01.2017','dd.mm.yyyy'),'M',1100,2);
insert into plf_employees values (9,'MARINESCU','Emil',to_date('25.12.1995','dd.mm.yyyy'),to_date('23.05.2016','dd.mm.yyyy'),'M',1200,3);
insert into plf_employees values (10,'GRIGORE','Raul',to_date('13.10.1993','dd.mm.yyyy'),to_date('06.07.2014','dd.mm.yyyy'),'M',940,3);
insert into plf_employees values (11,'MARINICA','Eugenia',to_date('29.11.1985','dd.mm.yyyy'),to_date('04.12.2015','dd.mm.yyyy'),'F',900,3);
insert into plf_employees values (12,'POPA','Rodica',to_date('06.04.1988','dd.mm.yyyy'),to_date('20.10.2015','dd.mm.yyyy'),'F',700,3);
insert into plf_employees values (13,'ICHIM','Cristina',to_date('15.11.1993','dd.mm.yyyy'),to_date('05.11.2016','dd.mm.yyyy'),'F',200,null);


COMMIT;


--Selectati toti angajatii care au data nasterii intre 01.01.1990 si 31.12.1995
select id,nume,prenume,to_char(data_nasterii,'dd.mm.yyyy'),to_char(data_angajarii,'dd.mm.yyyy'),gen,salariu,id_dept from plf_employees where data_nasterii between to_date('01.01.1990','dd.mm.yyyy') AND to_date('31.12.1995','dd.mm.yyyy');

--Numarati angajatii din fiecare departament, care au data angajarii > 01.01.2016
select count(id),id_dept from plf_employees where trunc(data_angajarii) > to_date('01.01.2016','dd.mm.yyyy') group by id_dept;

--Afisati toti angajatii care au salariul mai mare decat media salariului din firma
select id,nume,prenume,to_char(data_nasterii,'dd.mm.yyyy'),to_char(data_angajarii,'dd.mm.yyyy'),gen,salariu,id_dept from plf_employees where salariu >= (select avg(salariu) from plf_employees);

--Selectati angajatii din fiecare department care au primele 2 salarii ca marime din departamentul lor
--select count(id_dept),max(salariu) from plf_employees group by id_dept having count(id_dept) <=2 order by max(salariu) desc;
select distinct id,nume,prenume,to_char(data_nasterii,'dd.mm.yyyy'),to_char(data_angajarii,'dd.mm.yyyy'),gen,salariu,id_dept from plf_employees l1 where 2>= (select count(distinct l2.salariu) from plf_employees l2 where l2.id_dept = l1.id_dept and l2.salariu>=l1.salariu);

--Scrieti un query care sa afiseze intr-o singura coloana
select 'Angajatul '||nume||' '||prenume||' are salariul '||salariu from plf_employees;

--Scrieti un query care sa afiseze pozitia caracterului 'o' din coloana NUME pentru angajatii care au acest character in nume
select instr(nume,'O') from plf_employees;