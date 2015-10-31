with puzzle_permutation; use puzzle_permutation;

package puzzle_board is

   pragma warnings(off, """b"" may be referenced before it has a value");
   pragma warnings(off, """p"" may be referenced before it has a value");

   -- BOARD

   type board is array(integer range <>, integer range <>) of integer;

   function is_valid_board(b: in board) return boolean;
   function is_transposable(b: in board) return boolean;

   procedure assign_start_position(b: out board) with
     pre => is_valid_board(b);
   procedure assign_random_position(b: out board) with
     pre => is_valid_board(b);
   procedure transpose(b: in out board) with
     pre => is_valid_board(b) and is_transposable(b);

   -- BOARD + PERMUTATION

   function are_compatible(b: in board; p: in permutation) return boolean;

   procedure copy(p: in permutation; b: out board) with
     pre => is_valid_permutation(p) and is_valid_board(b) and are_compatible(b,p);
   procedure copy(b: in board; p: out permutation) with
     pre => is_valid_permutation(p) and is_valid_board(b) and are_compatible(b,p);


   pragma warnings(on, """b"" may be referenced before it has a value");
   pragma warnings(on, """p"" may be referenced before it has a value");



end puzzle_board;
