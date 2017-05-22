CREATE OR REPLACE PACKAGE bank_acct AS
FUNCTION acct_balance(account_no NUMBER) RETURN NUMBER;
PROCEDURE acct_details(account_no IN NUMBER);
FUNCTION show_name(account_no IN NUMBER) RETURN VARCHAR2;
END;
/


CREATE OR REPLACE PACKAGE BODY bank_acct AS
    FUNCTION acct_balance(account_no NUMBER) RETURN NUMBER IS
        acct_bal NUMBER;
    BEGIN
        SELECT balance INTO acct_bal FROM accounts WHERE account_number = account_no;
        acct_details(account_no);
        RETURN acct_bal;
    END;

    PROCEDURE acct_details(account_no IN NUMBER) IS
        contact_no      NUMBER;
        contact_address VARCHAR2;
    BEGIN
        SELECT phone, address INTO contact_no, contact_address FROM accounts WHERE account_number = account_no;
    END;

    FUNCTION show_name(account_no IN NUMBER) RETURN VARCHAR2 IS
        NAME VARCHAR2;
        acct_bal VARCHAR2;
    BEGIN
        SELECT first_name INTO NAME FROM accounts WHERE account_number = account_no;
        acct_details(account_no);
        RETURN acct_bal;
    END;
END bank_acct;
/

--eroare: lipseste headerul pachetului
--eroare se poate rectifica creand headerul cu semnaturile functiilor sau fara, in cazul in care acestea trebuie sa fie private
--eroare: acct_bal  nu e declarat

--nu pot testa mai mult. Tabela Accounts este diferita la mine. Contine doar id,name.