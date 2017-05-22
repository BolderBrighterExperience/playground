SELECT object_type, object_name
  FROM user_objects
 WHERE status = 'VALID'
 ORDER BY object_type, object_name;