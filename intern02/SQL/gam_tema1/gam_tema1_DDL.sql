DROP TABLE gam_departments CASCADE CONSTRAINTS;
CREATE TABLE gam_departments
(
  id_dept NUMBER(3) PRIMARY KEY,
  denumire_dep VARCHAR2(50)
);

DROP TABLE gam_employees CASCADE CONSTRAINTS;
CREATE TABLE gam_employees
(
  id_emp NUMBER(5) PRIMARY KEY,
  nume VARCHAR2(50),
  prenume VARCHAR2(50), 
  data_nasterii DATE,
  data_angajare DATE default SYSDATE,
  gen VARCHAR2(1),
  salariul NUMBER(7) default 0,
  id_dept NUMBER(3),
  CONSTRAINT gam_ck_gen CHECK (gen='F' or gen='M'),
  CONSTRAINT gam_fk_iddep FOREIGN KEY(id_dept) REFERENCES gam_departments(id_dept)
); 



