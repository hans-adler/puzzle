with puzzle_permutation; use puzzle_permutation;
with puzzle_board;       use puzzle_board;

package puzzle_characteristics is

   -- CHARACTERISTICS

   type characteristic is record
      mh : Integer := -1;
      i1 : Integer := -1;
      i2 : Integer := -1;
   end record;

   type characteristics is record
      hor : characteristic;
      ver : characteristic;
   end record;

   procedure update (b : in board; c : out characteristics);

end puzzle_characteristics;
