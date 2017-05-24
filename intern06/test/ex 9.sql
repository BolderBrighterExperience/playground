declare
   type numbers_t is table of number;
   numbers  numbers_t := numbers_t( 2, 4, null, 8, 10 );
   idx      number;
begin
   idx := 1;
   WHILE numbers(idx) <= 8 OR numbers(idx) IS NULL
   LOOP
     if numbers(idx) is null then
         dbms_output.put_line('null');
      else
         dbms_output.put_line(numbers(idx));
      end if;
      idx := idx + 1;
      
   end loop;
end;
/