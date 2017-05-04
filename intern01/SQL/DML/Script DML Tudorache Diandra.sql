
INSERT INTO DT_Oficii VALUES('BL','Beltsy','Nord',null);
INSERT INTO DT_Oficii VALUES('C','Kishinew','centru',null);
INSERT INTO DT_Oficii VALUES('CH','Cahul','sud',null);
INSERT INTO DT_Oficii VALUES('ED','Edinets','nord',null);
INSERT INTO DT_Oficii VALUES('GL','Glodeni','nord',null);
INSERT INTO DT_Oficii VALUES('OR','Orhei','centru',null);
INSERT INTO DT_Oficii VALUES('RZ','Rezina','nord',null);
INSERT INTO DT_Oficii VALUES('SR','Soroca','nord',null);
INSERT INTO DT_Oficii VALUES('UN','Ungheni','centru',null);


INSERT INTO DT_Angajati VALUES('BC','Bucataru','Constantin',31,'Contabil','SR',TO_DATE('18.01.2001','DD.MM.YYYY'),0);
INSERT INTO DT_Angajati VALUES('BN','Bucur','Nicolae',27,'manager','SR',TO_DATE('31.01.2001','DD.MM.YYYY'),28000);
INSERT INTO DT_Angajati VALUES('CI','Cozma','Ion',20,'reprezentant','OR',TO_DATE('17.11.2001','DD.MM.YYYY'),2000);
INSERT INTO DT_Angajati VALUES('DE','Dodon','Elena',34,'contabil','ED',TO_DATE('20.02.2000','DD.MM.YYYY'),0);
INSERT INTO DT_Angajati VALUES('DR','Dutca','Radion',33,'reprezentant','GL',TO_DATE('12.12.1999','DD.MM.YYYY'),3250);
INSERT INTO DT_Angajati VALUES('FE','Frumosu','Emilia',37,'contabil','ED',TO_DATE('12.02.1998','DD.MM.YYYY'),0);
INSERT INTO DT_Angajati VALUES('FN','Floarea','Nicoleta',23,'reprezentant','BL',TO_DATE('13.06.2000','DD.MM.YYYY'),2500);
INSERT INTO DT_Angajati VALUES('GC','Grosu','Corina',19,'reprezentant','RZ',TO_DATE('04.04.2000','DD.MM.YYYY'),1900);
INSERT INTO DT_Angajati VALUES('GI','Gomoja','Ilie',32,'reprezentant','CH',TO_DATE('13.07.2005','DD.MM.YYYY'),3250);
INSERT INTO DT_Angajati VALUES('GL','Grosu','Leonid',23,'reprezentant','ED',TO_DATE('28.03.2000','DD.MM.YYYY'),2500);
INSERT INTO DT_Angajati VALUES('GM','Grosu','Mihai',42,'sef','C',TO_DATE('07.02.1998','DD.MM.YYYY'),0);
INSERT INTO DT_Angajati VALUES('GT','Graur','Teodor',35,'reprezentant','SR',TO_DATE('18.08.2004','DD.MM.YYYY'),35000);
INSERT INTO DT_Angajati VALUES('HI','Harea','Igor',25,'manager','CH',TO_DATE('30.03.2003','DD.MM.YYYY'),22000);
INSERT INTO DT_Angajati VALUES('LA','Lungu','Alexandru',43,'sef adjunct','C',TO_DATE('07.02.1998','DD.MM.YYYY'),0);
INSERT INTO DT_Angajati VALUES('LV','Lisnic','Vladimir',29,'manager','OR',TO_DATE('13.09.2001','DD.MM.YYYY'),351);
INSERT INTO DT_Angajati VALUES('ML','Mutu','Livia',38,'manager','BL',TO_DATE('09.02.1999','DD.MM.YYYY'),15000);
INSERT INTO DT_angajati VALUES('MS','Mutu','Sorina',35,'reprezentant','UN',TO_DATE('06.04.2004','DD.MM.YYYY'),3500);
INSERT INTO DT_angajati VALUES('NV','Nanu','Vasile',45,'reprezentant','C',TO_DATE('09.02.1998','DD.MM.YYYY'),4500);
INSERT INTO DT_angajati VALUES('PI','Prisacaru','Inga',27,'reprezentant','UN',TO_DATE('18.03.2001','DD.MM.YYYY'),2750);
INSERT INTO DT_angajati VALUES('RD','Rusu','Dorina',35,'reprezentant','OR',TO_DATE('18.09.2001','DD.MM.YYYY'),3500);
INSERT INTO DT_angajati VALUES('SA','Speriatu','Ana',31,'contabil','GL',TO_DATE('15.01.2003','DD.MM.YYYY'),0);
INSERT INTO DT_angajati VALUES('SD','Spada','Doru',29,'manager','RZ',TO_DATE('12.01.2003','DD.MM.YYYY'),18000);
INSERT INTO DT_angajati VALUES('SM','Surdu','Mihaiela',25,'reprezentant','BL',TO_DATE('10.03.2000','DD.MM.YYYY'),20000);
INSERT INTO DT_angajati VALUES('VD','Vieru','Dorin',32,'manager','C',TO_DATE('08.02.1998','DD.MM.YYYY'),80000);
INSERT INTO DT_angajati VALUES('VI','Vrabie','Ion',42,'contabil','RZ',TO_DATE('18.10.2002','DD.MM.YYYY'),0);


INSERT INTO DT_Companii VALUES('AL','Auto Lada','NV',7500.00);
INSERT INTO DT_Companii VALUES('AS','Asito','PI',26000.00);
INSERT INTO DT_Companii VALUES('AT','Astra','PI',14780.00);
INSERT INTO DT_Companii VALUES('AV','Avon','GC',12000.00);
INSERT INTO DT_Companii VALUES('BA','Basarabia','GC',0.00);
INSERT INTO DT_Companii VALUES('BI','Bizpro','PI',13050.00);
INSERT INTO DT_Companii VALUES('CA','Cascad','GI',12300.00);
INSERT INTO DT_Companii VALUES('FB','Floribel','GL',600.00);
INSERT INTO DT_Companii VALUES('FL','Floarea','GL',0.00);
INSERT INTO DT_Companii VALUES('IL','InLac','GI',1000.00);
INSERT INTO DT_Companii VALUES('KN','Knauf','PI',0.00);
INSERT INTO DT_Companii VALUES('LO','Luck Oil','NV',13000.00);
INSERT INTO DT_Companii VALUES('PA','Patria','DR',500.00);
INSERT INTO DT_Companii VALUES('PE','Petrom','NV',50000.00);
INSERT INTO DT_Companii VALUES('TC','TransCom','MS',6000.00);
INSERT INTO DT_Companii VALUES('TI','Tirex','NV',5000.00);
INSERT INTO DT_Companii VALUES('TU','Tutun Ind','GL',1000.00);
INSERT INTO DT_Companii VALUES('VT','Vitanta','GI',800.00);
INSERT INTO DT_Companii VALUES('ZO','Zorile','GT',22890.00);


INSERT INTO DT_Produse VALUES(Produs_seq.NEXTVAL,'Monitor LG 17"',100.00,'Y');
INSERT INTO DT_produse VALUES(Produs_seq.NEXTVAL,'Monitor Samsung 15"',50.00,'N');
INSERT INTO DT_produse VALUES(Produs_seq.NEXTVAL,'Televizor JVS 54cm"',280.00,'N');
INSERT INTO DT_Produse VALUES (Produs_seq.NEXTVAL,'Procesor Pentium4',130.00,'Y');
INSERT INTO DT_Produse VALUES (Produs_seq.NEXTVAL,'Procesor Celeron2000',125.00,'N');
INSERT INTO DT_Produse VALUES (Produs_seq.NEXTVAL,'Mouse Genius optic',4.00,'N');
INSERT INTO DT_Produse VALUES(Produs_seq.NEXTVAL,'Mouse Logitech optic',5.00,'Y');
INSERT INTO DT_Produse VALUES(Produs_seq.NEXTVAL,'Televizor Sony 72cm',485.00,'N');
INSERT INTO DT_Produse VALUES(Produs_seq.NEXTVAL,'DVD Sony 50',75.00,'N');
INSERT INTO DT_Produse VALUES(Produs_seq.NEXTVAL,'DVD Sony 32-16-32',135,'Y');
INSERT INTO DT_Produse VALUES(Produs_seq.NEXTVAL,'CD-R Benq 700MB',0.10,'Y');
INSERT INTO DT_Produse VALUES(Produs_seq.NEXTVAL,'CD-Rw Benq 700MB',0.25,'Y');
INSERT INTO DT_Produse VALUES(Produs_seq.NEXTVAL, 'Tastiera Logitech alba',6.75,'Y');
INSERT INTO DT_Produse VALUES(Produs_seq.NEXTVAL, 'Tastiera Logitech neagra',9.75,'N');
INSERT INTO DT_Produse VALUES(Produs_seq.NEXTVAL, 'Monitor Samsung 17"',85.50,'Y');
INSERT INTO DT_Produse VALUES (Produs_seq.NEXTVAL,'Monitor Samsung 21"',109.50,'N');
INSERT INTO DT_Produse VALUES (Produs_seq.NEXTVAL,'Monitor Samtron 15"',35.50,'N');
INSERT INTO DT_Produse VALUES (Produs_seq.NEXTVAL,'Televizor Alfa 51cm',100.40,'Y'); 
INSERT INTO DT_Produse VALUES( Produs_seq.NEXTVAL ,'Televizor Polar 54cm' , 200.00 , 'N'); 
INSERT INTO DT_Produse VALUES( Produs_seq.NEXTVAL ,'Filtru Sven 220V' , 3.75 , 'Y'); 
INSERT INTO DT_Produse VALUES( Produs_seq.NEXTVAL ,'Telefon Siemens A55' , 200.00 , 'Y');


INSERT INTO Dt_tranzactii VALUES(TO_DATE('01.01.2005','DD.MM.YYYY'),'BI','NV',7,5);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('01.01.2005','DD.MM.YYYY'),'IL','PI',15,4);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('03.01.2005','DD.MM.YYYY'),'VT','HI',14,12);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('01.01.2005','DD.MM.YYYY'),'ZO','GI',12,3);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('14.01.2005','DD.MM.YYYY'),'VT','BN',15,8);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('18.01.2005','DD.MM.YYYY'),'TI','GL',12,3);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('31.01.2005','DD.MM.YYYY'),'CA','GI',11,2);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('31.01.2005','DD.MM.YYYY'),'VT','BN',14,9);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('02.02.2005','DD.MM.YYYY'),'PE','SM',12,2);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('11.02.2005','DD.MM.YYYY'),'LO','SM',2,3);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('11.02.2005','DD.MM.YYYY'),'TI','FN',21,2);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('22.02.2005','DD.MM.YYYY'),'TI','NV',13,2);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('02.03.2005','DD.MM.YYYY'),'AL','LV',17,2);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('03.03.2005','DD.MM.YYYY'),'FL','PI',11,3);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('04.03.2005','DD.MM.YYYY'),'TI','SD',14,3);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('04.03.2005','DD.MM.YYYY'),'FL','PI',8,1);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('12.03.2005','DD.MM.YYYY'),'VT','GI',14,4);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('26.03.2005','DD.MM.YYYY'),'AS','GC',8,3);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('26.03.2005','DD.MM.YYYY'),'PA','SD',12,10);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('04.04.2005','DD.MM.YYYY'),'AT','DR',11,5);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('14.03.2005','DD.MM.YYYY'),'FL','SM',13,3);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('18.04.2005','DD.MM.YYYY'),'AS','LV',3,1);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('18.04.2005','DD.MM.YYYY'),'PE','BC',18,8);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('18.04.2005','DD.MM.YYYY'),'TC','ML',20,2);
INSERT INTO Dt_tranzactii VALUES(TO_DATE('01.05.2005','DD.MM.YYYY'),'ZO','BN',21,3);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('24.05.2015','DD.MM.YYYY'),'AT','FN',3,10);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('24.05.2015','DD.MM.YYYY'),'AT','CI',19,2);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('13.06.2015','DD.MM.YYYY'),'AT','GC',9,2);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('13.06.2015','DD.MM.YYYY'),'PA','HI',13,11);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('16.06.2015','DD.MM.YYYY'),'FB','PI',16,8);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('04.07.2015','DD.MM.YYYY'),'ZO','HI',11,5);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('11.07.2015','DD.MM.YYYY'),'TI','PI',15,3);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('16.07.2015','DD.MM.YYYY'),'FB','RD',18,3);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('16.07.2015','DD.MM.YYYY'),'ZO','ML',4,11);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('08.08.2015','DD.MM.YYYY'),'LO','DR',5,9);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('08.08.2015','DD.MM.YYYY'),'PA','GC',11,4);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('16.08.2015','DD.MM.YYYY'),'CA','CI',5,12);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('16.08.2015','DD.MM.YYYY'),'VT','NV',17,3);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('20.09.2015','DD.MM.YYYY'),'KN','RD',6,2);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('20.09.2015','DD.MM.YYYY'),'PA','NV',16,3);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('10.10.2015','DD.MM.YYYY'),'AT','MS',11,5);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('10.10.2015','DD.MM.YYYY'),'VT','MS',20,7);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('11.11.2015','DD.MM.YYYY'),'PE','SD',19,6);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('12.11.2015','DD.MM.YYYY'),'PA','DR',12,4);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('12.11.2015','DD.MM.YYYY'),'PE','BN',4,3);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('19.11.2015','DD.MM.YYYY'),'CA','PI',17,8);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('12.12.2015','DD.MM.YYYY'),'IL','GL',13,4);
INSERT INTO Dt_tranzactii VALUES (TO_DATE('12.12.2015','DD.MM.YYYY'),'TI','GI',3,2);  

COMMIT;

UPDATE DT_Oficii SET Cod_manager='ML' WHERE UPPER(Cod_oficiu)='BL';
UPDATE DT_Oficii SET Cod_manager='VD' WHERE UPPER(Cod_oficiu)='C';
UPDATE DT_Oficii SET Cod_manager='HI' WHERE UPPER(Cod_oficiu)='CH';
UPDATE DT_Oficii SET Cod_manager='ML' WHERE UPPER(Cod_oficiu)='ED';
UPDATE DT_Oficii SET Cod_manager='ML' WHERE UPPER(Cod_oficiu)='GL';
UPDATE DT_Oficii SET Cod_manager='LV' WHERE UPPER(Cod_oficiu)='OR';
UPDATE DT_Oficii SET Cod_manager='SD' WHERE UPPER(Cod_oficiu)='RZ';
UPDATE DT_Oficii SET Cod_manager='BN' WHERE UPPER(Cod_oficiu)='SR';
UPDATE DT_Oficii SET Cod_manager='VD' WHERE UPPER(Cod_oficiu)='UN';

COMMIT;



