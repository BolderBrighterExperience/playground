CREATE OR REPLACE PACKAGE bank_acct
IS
    FUNCTION acct_balance(account_no NUMBER) RETURN NUMBER;
    --PROCEDURE acct_details(account_no IN NUMBER);
    FUNCTION show_name(account_no IN NUMBER) RETURN VARCHAR2;
END bank_acct;
/

CREATE OR REPLACE PACKAGE BODY bank_acct AS
    acct_bal VARCHAR2(50);
    
    PROCEDURE acct_details(account_no IN NUMBER); --forward declaration
    
    FUNCTION acct_balance(account_no NUMBER) RETURN NUMBER IS
        balance NUMBER;
    BEGIN
        SELECT balance INTO acct_bal FROM accounts WHERE account_number = account_no;
        acct_details(account_no);
        RETURN acct_bal;
    END;

    PROCEDURE acct_details(account_no IN NUMBER) IS
        contact_no      NUMBER;
        contact_address VARCHAR2(50);
    BEGIN
        SELECT phone, address INTO contact_no, contact_address FROM accounts WHERE account_number = account_no;
    END;

    FUNCTION show_name(account_no IN NUMBER) RETURN VARCHAR2 IS
        NAME VARCHAR2(40);
    BEGIN
        SELECT first_name INTO NAME FROM accounts WHERE account_number = account_no;
        acct_details(account_no);
        RETURN acct_bal;
    END;
END bank_acct;
/
-- IN ORDER TO COMPILE THE PACKAGE BODY, THE PACKAGE SPECIFICATION AND THE GLOBAL VARIABLE ACCT_BAL MUST BE DECLARED.
