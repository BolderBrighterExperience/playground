SELECT name, line, text
  FROM user_source
 WHERE UPPER (text) 
  LIKE '%SUCCES%'
 ORDER BY name, line;