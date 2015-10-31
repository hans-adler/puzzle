with ada.text_io; use ada.text_io;
with ada.strings; use ada.strings;
with ada.Strings.Fixed; use ada.strings.fixed;
with ada.Characters.Handling; use ada.Characters.Handling;
with box_drawing;

package body puzzle_io is

   package bd renames box_drawing;

   function to_string(a: integer) return string is
   begin
      return trim(integer'Image(a), left);
   end;

   procedure put(x: integer) is
   begin
      put(to_string(x));
   end;

   procedure put_line(length: integer; left, middle, right, horizontal: string) is
   begin
      put(left);
      for i in 1..length-1 loop
         put(horizontal);
         put(horizontal);
         put(middle);
      end loop;
      put(horizontal);
      put(horizontal);
      put(right);
      new_line;
   end;

   procedure put(x: in board) is
   begin
      put_line(x'Length(2), bd.dr, bd.ddlr, bd.dl, bd.lr);
      for i in x'range(1) loop
         put(bd.ud);
         for j in x'range(2) loop
            if (x(i,j) < 10) then
               put(' ');
            end if;
            if x(i,j) = 0 then
               put(' ');
            else
               put(to_string(x(i,j)));
            end if;
            if j /= x'last(2) then
               put(bd.uudd);
            else
               put(bd.ud);
            end if;
         end loop;
         new_line;
         if i /= x'last(1) then
            put_line(x'Length(2), bd.udrr, bd.uuddllrr, bd.udll, bd.llrr);
         else
            put_line(x'Length(2), bd.ur, bd.uulr, bd.ul, bd.lr);
         end if;
      end loop;
   end;

end puzzle_io;
