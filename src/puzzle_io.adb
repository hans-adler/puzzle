with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Strings;             use Ada.Strings;
with Ada.Strings.Fixed;       use Ada.Strings.Fixed;
with Ada.Characters.Handling; use Ada.Characters.Handling;
with box_drawing;

package body puzzle_io is

   package bd renames box_drawing;

   function to_string (a : Integer) return String is
   begin
      return Trim (Integer'image (a), Left);
   end to_string;

   procedure put (i : Integer) is
   begin
      Put (to_string (i));
   end put;

   procedure put_line
     (length                          : Integer;
      left, middle, right, horizontal : String) is
   begin
      Put (left);
      for i in 1 .. length - 1 loop
         Put (horizontal);
         Put (horizontal);
         Put (middle);
      end loop;
      Put (horizontal);
      Put (horizontal);
      Put (right);
      New_Line;
   end put_line;

   procedure put (b : in board) is
   begin
      put_line (b'length (2), bd.dr, bd.ddlr, bd.dl, bd.lr);
      for i in b'range (1) loop
         Put (bd.ud);
         for j in b'range (2) loop
            if b (i, j) < 10 then
               Put (' ');
            end if;
            if b (i, j) = 0 then
               Put (' ');
            else
               Put (to_string (b (i, j)));
            end if;
            if j /= b'last (2) then
               Put (bd.uudd);
            else
               Put (bd.ud);
            end if;
         end loop;
         New_Line;
         if i /= b'last (1) then
            put_line (b'length (2), bd.udrr, bd.uuddllrr, bd.udll, bd.llrr);
         else
            put_line (b'length (2), bd.ur, bd.uulr, bd.ul, bd.lr);
         end if;
      end loop;
   end put;

   procedure put (p : in permutation) is
   begin
      for i in p'range loop
         put (p (i));
         put (" ");
      end loop;
      new_line;
   end put;

end puzzle_io;
