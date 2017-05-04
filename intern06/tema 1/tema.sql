


drop table GL_DEPARTMENTS cascade constraints;
drop table GL_EMPLOYEES cascade constraints;
--1

CREATE table GL_DEPARTMENTS (
                ID_DEPT number ,
                DENUMIRE varchar2(50),
                CONSTRAINT pk_ID_DEPT PRIMARY KEY(ID_DEPT)
                );



CREATE table GL_EMPLOYEES (
                ID_EMP number,
                NUME varchar2(50),
                PRENUME varchar2(50),
                DATA_NASTERII date,
                DATA_ANGAJARII date DEFAULT SYSDATE,
                GEN varchar2(1) NOT NULL CONSTRAINT GEN CHECK (GEN='M' or GEN='F'),
                SALARIU number DEFAULT 0,
                ID_DEPT number,
                CONSTRAINT pk_GL_ID_EMP PRIMARY KEY(ID_EMP), 
                CONSTRAINT fk_GL_ID_DEPT FOREIGN KEY(ID_DEPT) REFERENCES GL_DEPARTMENTS(ID_DEPT)
              );




INSERT into GL_DEPARTMENTS (ID_DEPT,DENUMIRE) VALUES (1,'Marketing');
INSERT into GL_DEPARTMENTS (ID_DEPT,DENUMIRE) VALUES (2,'Vanzari');
INSERT into GL_DEPARTMENTS (ID_DEPT,DENUMIRE) VALUES (3,'Financiar');
INSERT into GL_DEPARTMENTS (ID_DEPT,DENUMIRE) VALUES (4,'IT');
INSERT into GL_DEPARTMENTS (ID_DEPT,DENUMIRE) VALUES (5,'HR');



INSERT into GL_EMPLOYEES 
VALUES (1,'IONESCU','Alin',TO_DATE('10.01.1990', 'DD-MM-YYYY'),TO_DATE('01.01.2015','DD-MM-YYYY'),'M',900,1);

INSERT into GL_EMPLOYEES 
VALUES (2,'OANCEA','Maria',TO_DATE('31.03.1970', 'DD-MM-YYYY'),TO_DATE('15.10.2016','DD-MM-YYYY'),'F',4000,1);

INSERT into GL_EMPLOYEES 
VALUES (3,'CRISTESCU','Vasile',TO_DATE('15.04.1984', 'DD-MM-YYYY'),TO_DATE('20.04.2014','DD-MM-YYYY'),'M',4000,1);


INSERT into GL_EMPLOYEES 
VALUES(4,'POPESCU','Oana',TO_DATE('23.05.1981', 'DD-MM-YYYY'),TO_DATE('20.04.2014','DD-MM-YYYY'),'F',750,1);


INSERT into GL_EMPLOYEES 
VALUES(5,'STROE','Ion',TO_DATE('29.09.1982', 'DD-MM-YYYY'),TO_DATE('01.01.2017','DD-MM-YYYY'),'M',3560,2);


INSERT into GL_EMPLOYEES 
VALUES(6,'GRECU','Radu',TO_DATE('31.10.1992', 'DD-MM-YYYY'),TO_DATE('30.08.2016','DD-MM-YYYY'),'M',4570,2);

INSERT into GL_EMPLOYEES 
VALUES(7,'POPESCU','Mihai',TO_DATE('20.08.1994', 'DD-MM-YYYY'),TO_DATE('15.06.2015','DD-MM-YYYY'),'M',230,2);

INSERT into GL_EMPLOYEES 
VALUES(8,'GANEA','Bogdan',TO_DATE('01.02.1997', 'DD-MM-YYYY'),TO_DATE('01.01.2017','DD-MM-YYYY'),'M',1100,2);

INSERT into GL_EMPLOYEES 
VALUES(9,'MARINESCU','Emil',TO_DATE('25.12.1995', 'DD-MM-YYYY'),TO_DATE('23.05.2016','DD-MM-YYYY'),'M',1200,3);

INSERT into GL_EMPLOYEES 
VALUES(10,'GRIGORE','Raul',TO_DATE('13.10.1993', 'DD-MM-YYYY'),TO_DATE('06.07.2014','DD-MM-YYYY'),'M',940,3);

INSERT into GL_EMPLOYEES 
VALUES(11,'MARINCA','Eugenia',TO_DATE('29.11.1985', 'DD-MM-YYYY'),TO_DATE('04.12.2015','DD-MM-YYYY'),'F',900,3);

INSERT into GL_EMPLOYEES 
VALUES(12,'POPA','Rodica',TO_DATE('06.04.1988', 'DD-MM-YYYY'),TO_DATE('20.10.2015','DD-MM-YYYY'),'F',700,3);

INSERT into GL_EMPLOYEES 
VALUES(13,'ICHIM','Cristina',TO_DATE('15.11.1993', 'DD-MM-YYYY'),TO_DATE('05.11.2016','DD-MM-YYYY'),'F',200,null);


COMMIT;

--2
SELECT * from GL_EMPLOYEES
  WHERE DATA_NASTERII BETWEEN TO_DATE('01.01.1990','DD-MM-YYYY') AND TO_DATE('31.12.1995','DD-MM-YYYY');
  
--3
SELECT ID_DEPT,count(ID_EMP)AS NUMAR_ANGAJATI
  from GL_EMPLOYEES
  where DATA_ANGAJARII > TO_DATE('01.01.2016','DD-MM-YYYY')
  GROUP BY ID_DEPT ;
  
--4
select * from (
SELECT ID_EMP,NUME,PRENUME,ID_DEPT,SALARIU,
ROW_NUMBER() OVER (PARTITION BY ID_DEPT ORDER BY SALARIU DESC) AS C
FROM GL_EMPLOYEES
) where c < 3;

--5
SELECT * FROM GL_EMPLOYEES
  WHERE SALARIU > (SELECT AVG(SALARIU)FROM GL_EMPLOYEES);

--6
SELECT 'Angajatul'||' '||NUME||' '||PRENUME||' '||'are salariul'||' '||SALARIU||'.'
FROM GL_EMPLOYEES;

--7
select INSTR(NUME,'O') FROM GL_EMPLOYEES;


SELECT * FROM GL_EMPLOYEES;
