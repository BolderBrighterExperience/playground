create or replace function to_date1(
                                    p_char_literal   in varchar2,
                                    p_date_format    in varchar2
                                  ) 
                                  return date is
begin 
      return to_date(p_char_literal, p_date_format);
      exception 
      when others then
      raise_application_error(-20001, 'Invalid date');
end;