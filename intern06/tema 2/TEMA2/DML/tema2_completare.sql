
--1
SELECT NUME,
       PRENUME,
       FUNCTIA,
       DATA_ANGAJARII,
       SUMA_PLANIFICATA
FROM   GL_ANGAJATI
WHERE  FUNCTIA = 'reprezentant' AND 
       SUMA_PLANIFICATA=(SELECT MIN(SUMA_PLANIFICATA) 
                            FROM GL_ANGAJATI 
                            WHERE FUNCTIA = 'reprezentant');
                                                      
                                                      
                                                      
--2                                                                                                                                                 
SELECT AVG(DATORIA) AS VAL_MEDIE_DATORII
FROM   GL_COMPANII
WHERE  DATORIA > 10000;


--3
SELECT COUNT(*)
FROM   GL_ANGAJATI
WHERE  FUNCTIA = 'reprezentant';





