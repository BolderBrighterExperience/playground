SELECT name, line, text
FROM user_source
WHERE UPPER (text) 
LIKE '%''SUCCESS''%' 
ORDER BY name, line;