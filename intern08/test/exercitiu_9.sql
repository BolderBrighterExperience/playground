DECLARE
   TYPE numbers_t IS TABLE OF NUMBER;
   numbers  numbers_t := numbers_t( 2, 4, NULL, 8, 10 );
   idx      NUMBER;
BEGIN
   idx := 1;
   WHILE  ( (numbers(idx) <= 8) or (numbers(idx) is NULL))
   LOOP
      IF numbers(idx) IS NULL THEN
         dbms_output.put_line('NULL');
      ELSE
         dbms_output.put_line(numbers(idx));
      END IF;
      idx := idx + 1;
   END LOOP;
END;
/
