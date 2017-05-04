INSERT INTO gam_departments VALUES(1,'IT hardware');
INSERT INTO gam_departments VALUES(2,'Finance');
INSERT INTO gam_departments VALUES(3,'Human Resources');
INSERT INTO gam_departments VALUES(4,'IT software');
INSERT INTO gam_departments VALUES(5,'Security');

INSERT INTO gam_employees VALUES(1,'IONESCU','Alin',to_date('10.01.1990','DD.MM.YYYY'),to_date('01.01.2015','DD.MM.YYYY'),'M',900,1);
INSERT INTO gam_employees VALUES(2,'OANCEA','Maria',to_date('31.03.1970','DD.MM.YYYY'),to_date('15.10.2016','DD.MM.YYYY'),'F',4000,1);
INSERT INTO gam_employees VALUES(3,'CRISTESCU','VASILE',to_date('15.04.1984','DD.MM.YYYY'),to_date('20.04.2014','DD.MM.YYYY'),'M',5500,1);
INSERT INTO gam_employees VALUES(4,'POPESCU','Oana',to_date('23.05.1981','DD.MM.YYYY'),to_date('03.06.2016','DD.MM.YYYY'),'F',750,1);
INSERT INTO gam_employees VALUES(5,'STROE','Ion',to_date('29.09.1982','DD.MM.YYYY'),to_date('01.01.2017','DD.MM.YYYY'),'M',3560,2);
INSERT INTO gam_employees VALUES(6,'GRECU','Radu',to_date('31.10.1992','DD.MM.YYYY'),to_date('30.08.2016','DD.MM.YYYY'),'M',4570,2);
INSERT INTO gam_employees VALUES(7,'POPESCU','Mihai',to_date('20.08.1994','DD.MM.YYYY'),to_date('15.06.2015','DD.MM.YYYY'),'M',230,2);
INSERT INTO gam_employees VALUES(8,'GANEA','Bogdan',to_date('01.02.1997','DD.MM.YYYY'),to_date('01.01.2017','DD.MM.YYYY'),'M',1100,2);
INSERT INTO gam_employees VALUES(9,'MARINESCU','Emil',to_date('25.12.1995','DD.MM.YYYY'),to_date('23.05.2016','DD.MM.YYYY'),'M',1200,3);
INSERT INTO gam_employees VALUES(10,'GRIGORE','Raul',to_date('13.10.1993','DD.MM.YYYY'),to_date('06.07.2014','DD.MM.YYYY'),'M',940,3);
INSERT INTO gam_employees VALUES(11,'MARINCA','Eugenia',to_date('29.11.1985','DD.MM.YYYY'),to_date('04.12.2015','DD.MM.YYYY'),'F',900,3);
INSERT INTO gam_employees VALUES(12,'POPA','Rodica',to_date('06.04.1988','DD.MM.YYYY'),to_date('20.10.2015','DD.MM.YYYY'),'F',700,3);
INSERT INTO gam_employees VALUES(13,'ICHIM','Cristina',to_date('15.11.1993','DD.MM.YYYY'),to_date('05.11.2016','DD.MM.YYYY'),'F',200,null);
COMMIT;

--2. Selectati toti angajatii care au data nasterii intre 01.01.1990 si 31.12.1995
SELECT id_emp, 
       nume, 
       prenume, 
       to_char(data_nasterii,'DD.MM.YYYY') DATA_NASTERII, 
       to_char(data_angajare,'DD.MM.YYYY') DATA_ANGAJARE, 
       gen, 
       salariul, 
       id_dept 
FROM   GAM_EMPLOYEES 
WHERE  data_nasterii>=to_date('01.01.1990','DD.MM.YYYY') and data_nasterii<=to_date('31.12.1995','DD.MM.YYYY');

--3. Numarati angajatii din fiecare departament, care au data angajarii>01.01.2016.
SELECT id_dept, 
       COUNT(*) as Numar_angajati
FROM   GAM_EMPLOYEES 
WHERE  data_angajare>=to_date('01.01.2016','DD.MM.YYYY')
GROUP BY id_dept;

--4. Selectati angajatii din fiecare department care au primele 2 salarii ca marime din departamentul lor. 
 SELECT * FROM (
  SELECT nume, 
         prenume, 
         to_char(data_nasterii,'DD.MM.YYYY') DATA_NASTERII, 
         to_char(data_angajare,'DD.MM.YYYY') DATA_ANGAJARE, 
         salariul, 
         id_dept, 
         ROW_NUMBER() OVER (PARTITION BY id_dept order by salariul DESC) R
  FROM gam_employees)
WHERE R<3;

--5. Afisati toti angajatii care au salariul mai mare decat media salariului din firma
SELECT id_emp, 
       nume, 
       prenume, 
       to_char(data_nasterii,'DD.MM.YYYY') DATA_NASTERII, 
       to_char(data_angajare,'DD.MM.YYYY') DATA_ANGAJARE, 
       gen, 
       salariul, 
       id_dept
FROM   gam_employees 
WHERE  salariul >= ( SELECT AVG(salariul) 
                     FROM gam_employees );

--6. Scrieti un query care sa afiseze intr-o singura coloana.
SELECT 'Angajatul '||nume||' '||prenume||' are salariul '||salariul||'.' 
FROM gam_employees;

--7. Scrieti un query care sa afiseze pozitia caracterului ‘o’ din coloana NUME pentru angajatii care au acest character in nume.
SELECT nume, 
       prenume, 
       INSTR(nume, 'O') as POZITIE
FROM gam_employees
WHERE nume LIKE '%O%';
