Pachetul nu ruleaza fara specificatii

CREATE OR REPLACE PACKAGE  bank_acct AS
    FUNCTION acct_balance(account_no NUMBER) RETURN NUMBER ;
      
    PROCEDURE acct_details(account_no IN NUMBER); 

    FUNCTION show_name(account_no IN NUMBER) RETURN VARCHAR2;
  
END bank_acct;
