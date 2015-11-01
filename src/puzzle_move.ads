with puzzle_board;           use puzzle_board;
with puzzle_characteristics; use puzzle_characteristics;

package puzzle_move is

   type orientation is (horizontal, vertical);
   type sense is (forward, backward);
   type direction is (up, down, left, right);

   procedure move
     (b    : in     board;
      c    : in     characteristics;
      i, j : in out Integer;
      dir  :        direction) with
      pre  => b (i, j) = 0,
      post => b (i, j) = 0;

end puzzle_move;
