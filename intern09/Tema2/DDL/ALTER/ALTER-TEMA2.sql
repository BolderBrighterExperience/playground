ALTER TABLE OFICII ADD CONSTRAINT FK_COD_MANAGER FOREIGN KEY(COD_MANAGER) REFERENCES ANGAJATI(COD_ANGAJAT);
ALTER TABLE COMPANII ADD CONSTRAINT FK_REPREZENTANT_COMPANIE FOREIGN KEY(REPREZENTANT_COMPANIE) REFERENCES ANGAJATI(COD_ANGAJAT);
ALTER TABLE ANGAJATI ADD CONSTRAINT FK_COD_OFICIU FOREIGN KEY(COD_OFICIU) REFERENCES OFICII(COD_OFICIU);
ALTER TABLE TRANZACTII ADD CONSTRAINT FK_COD_CLIENT FOREIGN KEY(COD_CLIENT) REFERENCES COMPANII(COD_COMPANIE);
ALTER TABLE TRANZACTII ADD CONSTRAINT FK_COD_VANZATOR FOREIGN KEY(COD_VANZATOR) REFERENCES ANGAJATI(COD_ANGAJAT);
ALTER TABLE TRANZACTII ADD CONSTRAINT FK_COD_PRODUS FOREIGN KEY(COD_PRODUS) REFERENCES PRODUSE(COD_PRODUS);