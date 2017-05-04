drop table cs_departments cascade constraints;
drop table cs_employees cascade constraints;

create table cs_departments(
    id number primary key,
    denumire varchar2(50));
  
create table cs_employees(
    id number primary key,
    nume varchar2(50),
    prenume varchar2(50),
    data_nasterii date,
    data_angajarii date default sysdate,
    gen varchar2(1) check (gen = 'F' or gen = 'M'),
    salariu number default 0,
    id_dept number,
    foreign key (id_dept) references cs_departments(id));

insert into cs_departments values(1,'HR');
insert into cs_departments values(2,'MK');
insert into cs_departments values(3,'DB');
insert into cs_departments values(4,'POM');
insert into cs_departments values(5,'IT');

insert into cs_employees values (1,'IONESCU','Alin',to_date('10.01.1990','dd.mm.yyyy'),to_date('01.01.2015','dd.mm.yyyy'),'M',900,1);
insert into cs_employees values (2,'OANCEA','Maria',to_date('31.03.1970','dd.mm.yyyy'),to_date('15.10.2016','dd.mm.yyyy'),'F',4000,1);
insert into cs_employees values (3,'CRISTESCU','Vasile',to_date('15.04.1984','dd.mm.yyyy'),to_date('20.04.2014','dd.mm.yyyy'),'M',550,1);
insert into cs_employees values (4,'POPESCU','Oana',to_date('3.05.1981 ','dd.mm.yyyy'),to_date('03.06.2016','dd.mm.yyyy'),'F',750,1);
insert into cs_employees values (5,'STROE','Ion',to_date('29.09.1982','dd.mm.yyyy'),to_date('01.01.2017','dd.mm.yyyy'),'M',3560,2);
insert into cs_employees values (6,'GRECU','Radu',to_date('31.10.1992','dd.mm.yyyy'),to_date('30.08.2016','dd.mm.yyyy'),'M',4570,2);

commit;

--Selectati toti angajatii care au data nasterii intre 01.01.1990 si 31.12.1995
select id,nume,prenume,to_char(data_nasterii,'dd.mm.yyyy'),to_char(data_angajarii,'dd.mm.yyyy'),gen,salariu,id_dept from cs_employees where data_nasterii between to_date('01.01.199','dd.mm.yyyy') and to_date('31.12.1995','dd.mm.yyyy');

--Numarati angajatii din fiecare departament, care au data angajarii > 01.01.2016.
select count(id),id_dept from cs_employees where trunc(data_angajarii) > to_date('01.01.2016','dd.mm.yyyy') group by id_dept;

-- Selectati angajatii din fiecare department care au primele 2 salarii ca marime din departamentul lor
select distinct id,nume,prenume,to_char(data_nasterii,'dd.mm.yyyy'),to_char(data_angajarii,'dd.mm.yyyy'),gen,salariu,id_dept from cs_employees t1 where 2 >= ( select count(distinct t2.salariu) from cs_employees t2 where t2.id_dept = t1.id_dept and t2.salariu >= t1.salariu ); 

--Afisati toti angajatii care au salariul mai mare decat media salariului din firma
select id,nume,prenume,to_char(data_nasterii,'dd.mm.yyyy'),to_char(data_angajarii,'dd.mm.yyyy'),gen,salariu,id_dept from cs_employees where salariu >= (select avg(salariu) from cs_employees);

--Scrieti un query care sa afiseze intr-o singura coloana:
select 'Angajatul '||nume||' '||prenume||' are salariul '||salariu from cs_employees;

--Scrieti un query care sa afiseze pozitia caracterului ‘o’ din coloana NUME pentru angajatii care au acest character in nume.
select instr(nume,'O') from cs_employees;






