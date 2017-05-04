--1. Scrieti o interogare ce ar afisa: numele, prenumele, functia, localitatea angajatului, care a incheiat contractul de cea mai mare sumã                  
                            
SELECT  a.nume,
        a.prenume,
        a.functia,
        p.pret*t.cantitatea AS contract,
        o.localitatea 
FROM    produse p 
JOIN    tranzactii t    ON p.cod_produs     = t.cod_produs 
JOIN    angajati a      ON a.cod_angajat    = t.cod_vanzator
JOIN    oficii o        ON a.cod_oficiu     = o.cod_oficiu
WHERE   p.pret*t.cantitatea =   (SELECT MAX(pret*cantitatea) 
                                FROM produse 
                                JOIN tranzactii ON produse.cod_produs = tranzactii.cod_produs);
                            
--2. Scrieti o interogare ce ar afisa  compania ce a incheiat contractul de cea mai micã sumã, precum si numele, prenumele reprezentatului ei.

SELECT  c.compania,
        a.nume,
        a.prenume,
        p.pret*t.cantitatea AS contract
FROM    companii c 
JOIN    tranzactii t ON t.cod_client = c.cod_companie
JOIN    angajati a ON a.cod_angajat = c.reprezentant_companie
JOIN    produse p ON p.cod_produs = t.cod_produs 
WHERE   p.pret*t.cantitatea =   (SELECT MIN(pret*cantitatea) 
                                FROM produse 
                                JOIN tranzactii ON produse.cod_produs = tranzactii.cod_produs);

--3. Scrieti o interogare ce ar afisa denumirea companiilor, ce participã la tranzactii si numãrul de tranzactii realizate de companie

SELECT  c.compania,
        COUNT(t.cod_client) AS nr_tranzactii 
FROM    companii c 
JOIN    tranzactii t ON c.cod_companie = t.cod_client 
GROUP BY c.compania;
