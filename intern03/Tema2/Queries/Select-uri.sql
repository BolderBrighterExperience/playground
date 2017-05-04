/*Scrieti o interogare, ce ar afisa: numele, prenumele, functia angajatilor, a cãror nume incepe
cu literele „gr” în ordinea alfabeticã dupã nume si prenume.*/

SELECT NUME,PRENUME,FUNCTIA
FROM LH_ANGAJATI
WHERE NUME LIKE INITCAP('gr%')
ORDER BY NUME,PRENUME;

/*Scrieti o interogare, ce ar afisa numãrul de manageri*/

SELECT COUNT(*) FROM LH_ANGAJATI 
WHERE FUNCTIA='manager';

/*Scrieti o interogare, ce ar afisa descrierea celui mai scump produs, ce exist? la depozit.*/

SELECT DESCRIERE, PRET FROM LH_PRODUSE
WHERE PRET=(SELECT MAX(PRET) FROM LH_PRODUSE WHERE EXISTA='Y');


