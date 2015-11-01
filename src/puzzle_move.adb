package body puzzle_move is

   procedure move
     (b    : in     board;
      c    : in     characteristics;
      i, j : in out Integer;
      dir  :        direction) is
   begin
      case direction is
         when up => swap (b (i, j),
      end case;

   end move;


end puzzle_move;
