with puzzle_permutation;     use puzzle_permutation;
with puzzle_board;           use puzzle_board;
with puzzle_characteristics; use puzzle_characteristics;
with puzzle_io;              use puzzle_io;
with Ada.Text_IO;            use Ada.Text_IO;

procedure main is

   b : board (0 .. 3, 0 .. 3);
   c : characteristics;

begin
   for i in 1 .. 20 loop
      assign_random_position (b);
      --put (b);
      update (b, c);
      put (c.hor.mh);
      Put (", ");
      put (c.hor.i1);
      Put (", ");
      put (c.hor.i2);
      New_Line;
      put (c.ver.mh);
      Put (", ");
      put (c.ver.i1);
      Put (", ");
      put (c.ver.i2);
      New_Line;
      New_Line;
   end loop;
end main;
