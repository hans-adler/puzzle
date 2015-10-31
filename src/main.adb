with puzzle_permutation; use puzzle_permutation;
with puzzle_board; use puzzle_board;
with puzzle_characteristics; use puzzle_characteristics;
with puzzle_io;    use puzzle_io;
with ada.text_io; use ada.text_io;

procedure main is

   b: board(0..3, 0..3);
   p: permutation(0..15);
   c: characteristics;

begin
   assign_random_position(b);
   put(b);
--   transpose(b);
--   put(b);
   update(b, c);
   put(c.hor.mh);
   new_line;
   put(c.ver.mh);
   new_line;
   copy(b, p);
   put((inversion_number(p)+2)/3);
end;
