--1. Scrieti o interogare ce ar afisa numele, prenumele, functia si varsta angajatului 
--care a acumulat cea mai mare sumã de bani.
SELECT NUME,
       PRENUME,
       VARSTA
FROM   GAM_ANGAJATI
WHERE SUMA_PLANIFICATA = (SELECT MAX(SUMA_PLANIFICATA)
                          FROM GAM_ANGAJATI);
                          
--2. Scrieti o interogare ce ar afisa descrierea celui mai scump produs cumpãrat de compania Avon.
SELECT DESCRIERE
FROM GAM_PRODUSE
WHERE COD_PRODUS = (SELECT COD_PRODUS
                    FROM GAM_TRANZACTII, GAM_COMPANII
                    WHERE COD_CLIENT = COD_COMPANIE AND UPPER(COMPANIE)='AVON'); 
                    
--3. Scrieti o interogare, ce ar crea un view cu numele Angajatii de nord, alcãtuit din câmpurile: 
--Cod-angajat, Nume, Prenume Suma planificata si ar contine lista angajatilor din regiunea de nord a tãrii
CREATE VIEW GAM_ANGAJATII_DE_NORD AS
SELECT COD_ANGAJAT,
       NUME,
       PRENUME,
       SUMA_PLANIFICATA
FROM   GAM_ANGAJATI
WHERE  COD_OFICIU IN (SELECT COD_OFICIU
                     FROM GAM_OFICII
                     WHERE REGIUNE='nord');
                    
                     