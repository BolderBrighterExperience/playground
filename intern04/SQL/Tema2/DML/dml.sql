INSERT INTO oficii VALUES ('BL','Beltsy','nord',NULL);
INSERT INTO oficii VALUES ('C','Kishiney','centru',NULL);
INSERT INTO oficii VALUES ('CH','Cahul','sud',NULL);
INSERT INTO oficii VALUES ('ED','Edinets','nord',NULL);
INSERT INTO oficii VALUES ('GL','Glodeni','nord',NULL);
INSERT INTO oficii VALUES ('OR','Orhei','centru',NULL);
INSERT INTO oficii VALUES ('RZ','Rezina','nord',NULL);
INSERT INTO oficii VALUES ('SR','Soroca','nord',NULL);
INSERT INTO oficii VALUES ('UN','Ungheni','centru',NULL);

INSERT INTO companii VALUES ('AL','Auto Lada',NULL,7500.00);
INSERT INTO companii VALUES ('AS','Asito',NULL,26000.00);
INSERT INTO companii VALUES ('AT','Astra',NULL,14780.00);
INSERT INTO companii VALUES ('AV','Avon',NULL,12000.00);
INSERT INTO companii VALUES ('BA','Basarabia',NULL,0.00);
INSERT INTO companii VALUES ('BI','Bizpo',NULL,13050.00);
INSERT INTO companii VALUES ('CA','Cascad',NULL,12300.00);
INSERT INTO companii VALUES ('FB','Floribel',NULL,600.00);
INSERT INTO companii VALUES ('FL','Floarea',NULL,0.00);
INSERT INTO companii VALUES ('IL','InLac',NULL,1000.00);
INSERT INTO companii VALUES ('KN','Knauf',NULL,0.00);
INSERT INTO companii VALUES ('LO','Luck Oil',NULL,13000.00);
INSERT INTO companii VALUES ('PA','Patria',NULL,500.00);
INSERT INTO companii VALUES ('PE','Petrom',NULL,50000.00);
INSERT INTO companii VALUES ('TC','TransCom',NULL,6000.00);
INSERT INTO companii VALUES ('TI','Tirex',NULL,5000.00);
INSERT INTO companii VALUES ('TU','Tutun Ind',NULL,1000.00);
INSERT INTO companii VALUES ('VT','Vitanta',NULL,800.00);
INSERT INTO companii VALUES ('ZO','Zorile',NULL,22890.00);

INSERT INTO angajati VALUES('BC','Bucataru','Constantin',31,'contabil','SR',TO_DATE('18.01.2001','dd.mm.yyyy'),0);
INSERT INTO angajati VALUES('BN','Bucur','Nicolae',27,'manager','SR',TO_DATE('31.01.2001','dd.mm.yyyy'),28000);
INSERT INTO angajati VALUES('CI','Cozma','Ion',20,'reprezentant','OR',TO_DATE('17.11.2001','dd.mm.yyyy'),2000);
INSERT INTO angajati VALUES('DE','Dodon','Elena',34,'contabil','ED',TO_DATE('20.02.2000','dd.mm.yyyy'),0);
INSERT INTO angajati VALUES('DR','Dutca','Radion',33,'reprezentant','GL',TO_DATE('12.12.1999','dd.mm.yyyy'),3250);
INSERT INTO angajati VALUES('FE','Frumosu','Emilia',37,'contabil','ED',TO_DATE('12.02.1998','dd.mm.yyyy'),0);
INSERT INTO angajati VALUES('FN','Florea','Nicoleta',23,'reprezentant','BL',TO_DATE('13.06.2000','dd.mm.yyyy'),2500);
INSERT INTO angajati VALUES('GC','Grosu','Corina',19,'reprezentant','RZ',TO_DATE('04.04.2000','dd.mm.yyyy'),1900);
INSERT INTO angajati VALUES('GI','Gomoja','Ilie',32,'reprezentant','CH',TO_DATE('13.07.2005','dd.mm.yyyy'),3250);
INSERT INTO angajati VALUES('GL','Grosu','Leonid',23,'reprezentant','ED',TO_DATE('28.03.2000','dd.mm.yyyy'),2500);
INSERT INTO angajati VALUES('GM','Grosu','Mihai',42,'sef','C',TO_DATE('07.02.1998','dd.mm.yyyy'),0);
INSERT INTO angajati VALUES('GT','Graur','Teodor',35,'reprezentant','SR',TO_DATE('18.08.2004','dd.mm.yyyy'),35000);
INSERT INTO angajati VALUES('HI','Harea','Igor',25,'manager','CH',TO_DATE('30.03.2003','dd.mm.yyyy'),22000);
INSERT INTO angajati VALUES('LA','Lungu','Alexandru',43,'sef adjunc','C',TO_DATE('07.02.1998','dd.mm.yyyy'),0);
INSERT INTO angajati VALUES('LV','Lisnic','Vladimir',29,'manager','OR',TO_DATE('13.09.2001','dd.mm.yyyy'),351);
INSERT INTO angajati VALUES('ML','Mutu','Livia',38,'manager','BL',TO_DATE('09.02.1999','dd.mm.yyyy'),4500);
INSERT INTO angajati VALUES('MS','Mutu','Sorina',35,'reprezentant','UN',TO_DATE('06.04.2004','dd.mm.yyyy'),3500);
INSERT INTO angajati VALUES('NV','Nanu','Vasile',45,'reprezentant','C',TO_DATE('09.02.1998','dd.mm.yyyy'),4500);
INSERT INTO angajati VALUES('PI','Prisacaru','Inga',27,'reprezentant','UN',TO_DATE('18.03.2001','dd.mm.yyyy'),2750);
INSERT INTO angajati VALUES('RD','Rusu','Dorina',35,'reprezentant','OR',TO_DATE('18.09.2001','dd.mm.yyyy'),3500);
INSERT INTO angajati VALUES('SA','Speriatu','Ana',31,'contabil','GL',TO_DATE('15.01.2003','dd.mm.yyyy'),0);
INSERT INTO angajati VALUES('SD','Spada','Doru',29,'manager','RZ',TO_DATE('12.01.2003','dd.mm.yyyy'),18000);
INSERT INTO angajati VALUES('SM','Surdu','Mihaiela',25,'reprezentant','BL',TO_DATE('10.03.2000','dd.mm.yyyy'),20000);
INSERT INTO angajati VALUES('VD','Vieru','Dorin',32,'manager','C',TO_DATE('08.02.1998','dd.mm.yyyy'),80000);
INSERT INTO angajati VALUES('VI','Vrabie','Ion',42,'contabil','RZ',TO_DATE('18.10.2002','dd.mm.yyyy'),0);

INSERT  INTO produse(descriere,pret,exista) VALUES('Monitor LG 17',100.00,'Y');
INSERT  INTO produse(descriere,pret,exista) VALUES('Monitor Samsung 15"',50.00,'N');
INSERT  INTO produse(descriere,pret,exista) VALUES('Televizor JVS 54cm"',280.00,'N');
INSERT  INTO produse(descriere,pret,exista) VALUES ('Procesor Pentium 4',130.00,'Y');
INSERT  INTO produse(descriere,pret,exista) VALUES ('Procesor Celeron 2000',125.00,'Y');
INSERT  INTO produse(descriere,pret,exista) VALUES ('Mouse Genius optic',4.00,'N');
INSERT  INTO produse(descriere,pret,exista) VALUES('Mouse Logitech optic',5.00,'Y');
INSERT  INTO produse(descriere,pret,exista) VALUES('Televizor Sony 72cm',485.00,'N');
INSERT  INTO produse(descriere,pret,exista) VALUES('DVD Sony 50',75.00,'N');
INSERT  INTO produse(descriere,pret,exista) VALUES('DVD Sony 32-16-32',135,'Y');
INSERT  INTO produse(descriere,pret,exista) VALUES('CD-R Benq 700MB',0.10,'Y');
INSERT  INTO produse(descriere,pret,exista) VALUES('CD-Rw Benq 700MB',0.25,'Y');
INSERT  INTO produse(descriere,pret,exista) VALUES( 'Tastiera Logitech alba',6.75,'Y');
INSERT  INTO produse(descriere,pret,exista) VALUES( 'Tastiera Logitech neagra',9.75,'N');
INSERT  INTO produse(descriere,pret,exista) VALUES( 'Monitor Samsung 17"',85.50,'Y');
INSERT  INTO produse(descriere,pret,exista) VALUES ('Monitor Samsung 21"',109.50,'N');
INSERT  INTO produse(descriere,pret,exista) VALUES ('Monitor Samtron 15"',35.50,'N');
INSERT  INTO produse(descriere,pret,exista) VALUES ('Televizor Alfa 51cm',100.40,'Y'); 
INSERT  INTO produse(descriere,pret,exista) VALUES('Televizor Polar 54cm' , 200.00 , 'N'); 
INSERT  INTO produse(descriere,pret,exista) VALUES('Filtru Sven 220V' , 3.75 , 'Y'); 
INSERT  INTO produse(descriere,pret,exista) VALUES('Telefon Siemens A55' , 200.00 , 'Y');

INSERT INTO tranzactii VALUES (TO_DATE('01.01.2005','dd.mm.yyyy'),'BI','NV',7,5);
INSERT INTO tranzactii VALUES (TO_DATE('01.01.2005','dd.mm.yyyy'),'IL','PI',15,4);
INSERT INTO tranzactii VALUES (TO_DATE('03.01.2005','dd.mm.yyyy'),'VT','HI',14,12);
INSERT INTO tranzactii VALUES (TO_DATE('03.01.2005','dd.mm.yyyy'),'ZO','HI',12,3);
INSERT INTO tranzactii VALUES (TO_DATE('14.01.2005','dd.mm.yyyy'),'VT','BN',15,8);
INSERT INTO tranzactii VALUES (TO_DATE('18.01.2005','dd.mm.yyyy'),'TI','GL',12,3);
INSERT INTO tranzactii VALUES (TO_DATE('31.01.2005','dd.mm.yyyy'),'CA','GI',11,2);
INSERT INTO tranzactii VALUES (TO_DATE('31.01.2005','dd.mm.yyyy'),'VT','BN',14,9);
INSERT INTO tranzactii VALUES (TO_DATE('02.02.2005','dd.mm.yyyy'),'PE','SM',12,2);
INSERT INTO tranzactii VALUES (TO_DATE('11.02.2005','dd.mm.yyyy'),'LO','SM',2,3);
INSERT INTO tranzactii VALUES (TO_DATE('11.02.2005','dd.mm.yyyy'),'TI','FN',21,2);
INSERT INTO tranzactii VALUES (TO_DATE('22.02.2005','dd.mm.yyyy'),'TI','NV',13,2);
INSERT INTO tranzactii VALUES (TO_DATE('02.03.2005','dd.mm.yyyy'),'AL','LV',17,2);
INSERT INTO tranzactii VALUES (TO_DATE('03.03.2005','dd.mm.yyyy'),'FL','PI',11,3);
INSERT INTO tranzactii VALUES (TO_DATE('04.03.2005','dd.mm.yyyy'),'TI','SD',14,3);
INSERT INTO tranzactii VALUES (TO_DATE('12.03.2005','dd.mm.yyyy'),'FL','PI',8,1);
INSERT INTO tranzactii VALUES (TO_DATE('12.03.2005','dd.mm.yyyy'),'VT','GI',14,4);
INSERT INTO tranzactii VALUES (TO_DATE('26.03.2015','dd.mm.yyyy'),'AS','GC',8,3);
INSERT INTO tranzactii VALUES (TO_DATE('26.03.2015','dd.mm.yyyy'),'PA','SD',12,10);
INSERT INTO tranzactii VALUES (TO_DATE('04.04.2015','dd.mm.yyyy'),'AT','DR',11,5);
INSERT INTO tranzactii VALUES (TO_DATE('14.04.2015','dd.mm.yyyy'),'FL','SM',13,3);
INSERT INTO tranzactii VALUES (TO_DATE('18.04.2015','dd.mm.yyyy'),'AS','LV',3,1);
INSERT INTO tranzactii VALUES (TO_DATE('18.04.2015','dd.mm.yyyy'),'PE','BC',18,8);
INSERT INTO tranzactii VALUES (TO_DATE('18.04.2015','dd.mm.yyyy'),'TC','ML',20,2);
INSERT INTO tranzactii VALUES (TO_DATE('01.05.2015','dd.mm.yyyy'),'ZO','BN',21,3);
INSERT INTO tranzactii VALUES (TO_DATE('24.05.2015','dd.mm.yyyy'),'AT','FN',3,10);
INSERT INTO tranzactii VALUES (TO_DATE('24.05.2015','dd.mm.yyyy'),'AT','CI',19,2);
INSERT INTO tranzactii VALUES (TO_DATE('13.06.2015','dd.mm.yyyy'),'AT','GC',9,2);
INSERT INTO tranzactii VALUES (TO_DATE('13.06.2015','dd.mm.yyyy'),'PA','HI',13,11);
INSERT INTO tranzactii VALUES (TO_DATE('16.06.2015','dd.mm.yyyy'),'FB','PI',16,8);
INSERT INTO tranzactii VALUES (TO_DATE('04.07.2015','dd.mm.yyyy'),'ZO','HI',11,5);
INSERT INTO tranzactii VALUES (TO_DATE('11.07.2015','dd.mm.yyyy'),'TI','PI',15,3);
INSERT INTO tranzactii VALUES (TO_DATE('16.07.2015','dd.mm.yyyy'),'FB','RD',18,3);
INSERT INTO tranzactii VALUES (TO_DATE('16.07.2015','dd.mm.yyyy'),'ZO','ML',4,11);
INSERT INTO tranzactii VALUES (TO_DATE('08.08.2015','dd.mm.yyyy'),'LO','DR',5,9);
INSERT INTO tranzactii VALUES (TO_DATE('08.08.2015','dd.mm.yyyy'),'PA','GC',11,4);
INSERT INTO tranzactii VALUES (TO_DATE('16.08.2015','dd.mm.yyyy'),'CA','CI',5,12);
INSERT INTO tranzactii VALUES (TO_DATE('16.08.2015','dd.mm.yyyy'),'VT','NV',17,3);
INSERT INTO tranzactii VALUES (TO_DATE('20.09.2015','dd.mm.yyyy'),'KN','RD',6,2);
INSERT INTO tranzactii VALUES (TO_DATE('20.09.2015','dd.mm.yyyy'),'PA','NV',16,3);
INSERT INTO tranzactii VALUES (TO_DATE('10.10.2015','dd.mm.yyyy'),'AT','MS',11,5);
INSERT INTO tranzactii VALUES (TO_DATE('10.10.2015','dd.mm.yyyy'),'VT','MS',20,7);
INSERT INTO tranzactii VALUES (TO_DATE('11.11.2015','dd.mm.yyyy'),'PE','SD',19,6);
INSERT INTO tranzactii VALUES (TO_DATE('12.11.2015','dd.mm.yyyy'),'PA','DR',12,4);
INSERT INTO tranzactii VALUES (TO_DATE('12.11.2015','dd.mm.yyyy'),'PE','BN',4,3);
INSERT INTO tranzactii VALUES (TO_DATE('19.11.2015','dd.mm.yyyy'),'CA','PI',17,8);
INSERT INTO tranzactii VALUES (TO_DATE('12.12.2015','dd.mm.yyyy'),'IL','GL',13,4);
INSERT INTO tranzactii VALUES (TO_DATE('12.12.2015','dd.mm.yyyy'),'TI','GI',3,2);

UPDATE oficii
SET cod_manager = 'ML'
WHERE cod_oficiu = 'BL';

UPDATE oficii
SET cod_manager = 'VD'
WHERE cod_oficiu = 'C';

UPDATE oficii
SET cod_manager = 'HI'
WHERE cod_oficiu = 'CH';

UPDATE oficii
SET cod_manager = 'ML'
WHERE cod_oficiu = 'ED';

UPDATE oficii
SET cod_manager = 'ML'
WHERE cod_oficiu = 'GL';

UPDATE oficii
SET cod_manager = 'LV'
WHERE cod_oficiu = 'OR';

UPDATE oficii
SET cod_manager = 'SD'
WHERE cod_oficiu = 'RZ';

UPDATE oficii
SET cod_manager = 'BN'
WHERE cod_oficiu = 'SR';

UPDATE oficii
SET cod_manager = 'VD'
WHERE cod_oficiu = 'UN';

UPDATE companii
SET reprezentant_companie = 'NV'
WHERE cod_companie = 'AL';

UPDATE companii
SET reprezentant_companie = 'PI'
WHERE cod_companie = 'AS';

UPDATE companii
SET reprezentant_companie = 'PI'
WHERE cod_companie = 'AT';

UPDATE companii
SET reprezentant_companie = 'GC'
WHERE cod_companie = 'AV';

UPDATE companii
SET reprezentant_companie = 'GC'
WHERE cod_companie = 'BA';

UPDATE companii
SET reprezentant_companie = 'PI'
WHERE cod_companie = 'BI';

UPDATE companii
SET reprezentant_companie = 'GI'
WHERE cod_companie = 'CA';

UPDATE companii
SET reprezentant_companie = 'GL'
WHERE cod_companie = 'FB';

UPDATE companii
SET reprezentant_companie = 'GL'
WHERE cod_companie = 'FL';

UPDATE companii
SET reprezentant_companie = 'GI'
WHERE cod_companie = 'IL';

UPDATE companii
SET reprezentant_companie = 'PI'
WHERE cod_companie = 'KN';

UPDATE companii
SET reprezentant_companie = 'NV'
WHERE cod_companie = 'LO';

UPDATE companii
SET reprezentant_companie = 'DR'
WHERE cod_companie = 'PA';

UPDATE companii
SET reprezentant_companie = 'NV'
WHERE cod_companie = 'PE';

UPDATE companii
SET reprezentant_companie = 'DR'
WHERE cod_companie = 'PA';

UPDATE companii
SET reprezentant_companie = 'NV'
WHERE cod_companie = 'PE';

UPDATE companii
SET reprezentant_companie = 'MS'
WHERE cod_companie = 'TC';

UPDATE companii
SET reprezentant_companie = 'NV'
WHERE cod_companie = 'TI';

UPDATE companii
SET reprezentant_companie = 'GL'
WHERE cod_companie = 'TU';

UPDATE companii
SET reprezentant_companie = 'GI'
WHERE cod_companie = 'VT';

UPDATE companii
SET reprezentant_companie = 'GT'
WHERE cod_companie = 'ZO';

COMMIT;

