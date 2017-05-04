/*Scrieti o interogare, ce ar afisa: numele, prenumele, functia angajatilor, a c�ror nume incepe
cu literele �gr� �n ordinea alfabetic� dup� nume si prenume.*/

SELECT NUME,PRENUME,FUNCTIA
FROM LH_ANGAJATI
WHERE NUME LIKE INITCAP('gr%')
ORDER BY NUME,PRENUME;

/*Scrieti o interogare, ce ar afisa num�rul de manageri*/

SELECT COUNT(*) FROM LH_ANGAJATI 
WHERE FUNCTIA='manager';

/*Scrieti o interogare, ce ar afisa descrierea celui mai scump produs, ce exist? la depozit.*/

SELECT DESCRIERE, PRET FROM LH_PRODUSE
WHERE PRET=(SELECT MAX(PRET) FROM LH_PRODUSE WHERE EXISTA='Y');


