DROP TABLE AP_DEPARTMENTS CASCADE CONSTRAINTS;
DROP TABLE AP_EMPLOYEES CASCADE CONSTRAINTS;

CREATE TABLE AP_DEPARTMENTS(id NUMBER PRIMARY KEY,denumire VARCHAR2(50));

CREATE TABLE AP_EMPLOYEES(id NUMBER PRIMARY KEY, nume VARCHAR2(50), prenume VARCHAR2(50),
data_nasterii DATE,data_angajarii DATE,gen VARCHAR2(1) CONSTRAINT chk_gen CHECK (gen='F' or gen='M'),salariu NUMBER DEFAULT 0,
id_dept NUMBER,CONSTRAINT fk_id FOREIGN KEY(id_dept) REFERENCES AP_DEPARTMENTS(id));

INSERT INTO AP_DEPARTMENTS(id,denumire) VALUES(1,'Marketing');
INSERT INTO AP_DEPARTMENTS(id,denumire) VALUES(2,'Vanzari');
INSERT INTO AP_DEPARTMENTS(id,denumire) VALUES(3,'IT');
INSERT INTO AP_DEPARTMENTS(id,denumire) VALUES(4,'Contabilitate');
INSERT INTO AP_DEPARTMENTS(id,denumire) VALUES(5,'HR');

INSERT INTO AP_EMPLOYEES(id,nume,prenume,data_nasterii,data_angajarii,gen,salariu,id_dept) VALUES(1,'IONESCU','Alin',TO_DATE('10.01.1990','dd.MM.YYYY'),TO_DATE('01.01.2015','dd.MM.YYYY'),
'M',900,1);
INSERT INTO AP_EMPLOYEES(id,nume,prenume,data_nasterii,data_angajarii,gen,salariu,id_dept) VALUES(2,'OANCEA','Maria',TO_DATE('31.03.1970','dd.MM.YYYY'),TO_DATE('15.10.2016','dd.MM.YYYY'),
'F',4000,1);
INSERT INTO AP_EMPLOYEES(id,nume,prenume,data_nasterii,data_angajarii,gen,salariu,id_dept) VALUES(3,'CRISTESCU','Vasile',TO_DATE('15.04.1984','dd.MM.YYYY'),TO_DATE('20.04.2014','dd.MM.YYYY'),
'M',550,1);
INSERT INTO AP_EMPLOYEES(id,nume,prenume,data_nasterii,data_angajarii,gen,salariu,id_dept) VALUES(4,'POPESCU','Oana',TO_DATE('23.05.1981','dd.MM.YYYY'),TO_DATE('03.06.2016','dd.MM.YYYY'),
'F',750,1);
INSERT INTO AP_EMPLOYEES(id,nume,prenume,data_nasterii,data_angajarii,gen,salariu,id_dept) VALUES(5,'STROE','Ion',TO_DATE('29.09.1982','dd.MM.YYYY'),TO_DATE('01.01.2017','dd.MM.YYYY'),
'M',3560,2);
INSERT INTO AP_EMPLOYEES(id,nume,prenume,data_nasterii,data_angajarii,gen,salariu,id_dept) VALUES(6,'GRECU','Radu',TO_DATE('31.10.1992','dd.MM.YYYY'),TO_DATE('30.08.2016','dd.MM.YYYY'),
'M',4570,2);
INSERT INTO AP_EMPLOYEES(id,nume,prenume,data_nasterii,data_angajarii,gen,salariu,id_dept) VALUES(7,'POPESCU','Mihai',TO_DATE('20.08.1994','dd.MM.YYYY'),TO_DATE('15.06.2015','dd.MM.YYYY'),
'M',230,2);
INSERT INTO AP_EMPLOYEES(id,nume,prenume,data_nasterii,data_angajarii,gen,salariu,id_dept) VALUES(8,'GANEA','Bogdan',TO_DATE('01.02.1997','dd.MM.YYYY'),TO_DATE('01.01.2017','dd.MM.YYYY'),
'M',1100,2);
INSERT INTO AP_EMPLOYEES(id,nume,prenume,data_nasterii,data_angajarii,gen,salariu,id_dept) VALUES(9,'MARINESCU','Emil',TO_DATE('25.12.1995','dd.MM.YYYY'),TO_DATE('23.05.2016','dd.MM.YYYY'),
'M',1200,3);
INSERT INTO AP_EMPLOYEES(id,nume,prenume,data_nasterii,data_angajarii,gen,salariu,id_dept) VALUES(10,'GRIGORE','Raul',TO_DATE('13.10.1993','dd.MM.YYYY'),TO_DATE('06.07.2014','dd.MM.YYYY'),
'M',940,3);
INSERT INTO AP_EMPLOYEES(id,nume,prenume,data_nasterii,data_angajarii,gen,salariu,id_dept)VALUES(11,'MARINCA','Eugenia',TO_DATE('29.11.1985','dd.MM.YYYY'),TO_DATE('04.12.2015','dd.MM.YYYY'),
'F',900,3);
INSERT INTO AP_EMPLOYEES(id,nume,prenume,data_nasterii,data_angajarii,gen,salariu,id_dept)VALUES(12,'POPA','Rodica',TO_DATE('06.04.1988','dd.MM.YYYY'),TO_DATE('20.10.2015','dd.MM.YYYY'),
'F',700,3);
INSERT INTO AP_EMPLOYEES(id,nume,prenume,data_nasterii,data_angajarii,gen,salariu,id_dept)VALUES(13,'ICHIM','Cristina',TO_DATE('15.11.1993','dd.MM.YYYY'),TO_DATE('05.11.2016','dd.MM.YYYY'),
'F',200,3);

COMMIT;

SELECT id, nume, prenume, TO_CHAR(data_nasterii,'dd.MM.YYYY') AS data_nasterii,TO_CHAR(data_angajarii,'dd.MM.YYYY') AS data_angajarii,gen,salariu,id_dept FROM AP_EMPLOYEES WHERE DATA_NASTERII BETWEEN TO_DATE('01.01.1990','dd.MM.YYYY') AND TO_DATE('31.12.1995','dd.MM.YYYY');

SELECT COUNT(*),id_dept FROM AP_EMPLOYEES WHERE DATA_ANGAJARII>TO_DATE('01.01.2016','dd.MM.YYYY') GROUP BY id_dept ;

SELECT * FROM AP_EMPLOYEES t1 WHERE (SELECT COUNT(DISTINCT (SALARIU)) FROM AP_EMPLOYEES t2
WHERE t2.ID_DEPT=t1.ID_DEPT AND t2.SALARIU >= t1.SALARIU) <=2 ORDER BY id_dept ; 

SELECT * FROM AP_EMPLOYEES WHERE SALARIU >(SELECT AVG(salariu) FROM AP_EMPLOYEES);

SELECT 'Angajatul '||nume||' are salariu '||salariu ||'.'
FROM AP_EMPLOYEES;

SELECT INSTR(NUME,'O'), NUME FROM AP_EMPLOYEES WHERE nume LIKE '%O%';


