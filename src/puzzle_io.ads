with puzzle_permutation; use puzzle_permutation;
with puzzle_board; use puzzle_board;

package puzzle_io is

   procedure put (i : integer);
   procedure put (p : in permutation);
   procedure put (b : in board);

end puzzle_io;
