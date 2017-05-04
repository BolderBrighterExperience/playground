--Adaugati coloana discount_produs de tip NUMBER(7, 2) adugand totodata o constrangere de verificare pentru a va asigura  ca discount_produs este mai mare de 0
ALTER TABLE PLF_produse ADD discount_produs number(7,2) CHECK (discount_produs > 0 );

--Creati un query in care sa afisati din tabela Angajati numele, prenumele, data angajarii, anul angajarii + o coloana in care sa mentionati daca anul in care s-a realizat angajarea a fost sau nu bisect
SELECT nume,prenume,data_angajarii, CASE WHEN (
  (MOD(EXTRACT (year FROM data_angajarii),4) = 0) AND (MOD(EXTRACT (year FROM data_angajarii),100) != 0 )
    OR (MOD(EXTRACT (year FROM data_angajarii),400) = 0)) THEN 'An Bisect' ELSE 'Anul nu e bisect' end AS AN_BISECT
    from PLF_angajati;