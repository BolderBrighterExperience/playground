I execute the following statements:

CREATE TABLE qz_toys (toy_name VARCHAR2 (20))
/

BEGIN
   INSERT INTO qz_toys (toy_name)
        VALUES ('blocks');

   INSERT INTO qz_toys (toy_name)
        VALUES ('princesses');

   INSERT INTO qz_toys (toy_name)
        VALUES ('rocking horse');

   COMMIT;
END;
/
Write an anonymous block that displays the following text:

DECLARE
  l_message VARCHAR2 (100) := 'Blocks';
  l_message2 VARCHAR2(100) := 'Princesses';
  l_message3 VARCHAR2(100) := 'Rocking horse';
BEGIN
  DBMS_OUTPUT.put_line (l_message || l_message2 || l_message3);
END;
/

blocks
princesses
rocking horse