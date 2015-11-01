with puzzle_permutation; use puzzle_permutation;

package puzzle_board is

   pragma warnings (off, """b"" may be referenced before it has a value");
   pragma warnings (off, """p"" may be referenced before it has a value");

   -- BOARD

   type board is array (Integer range <>, Integer range <>) of Integer;

   function is_valid_board (b : in board) return Boolean;
   function is_transposable (b : in board) return Boolean;

   procedure assign_start_position (b : out board) with
      pre => is_valid_board (b);
   procedure assign_random_position (b : out board) with
      pre => is_valid_board (b);
   procedure transpose (b : in out board) with
      pre => is_valid_board (b) and is_transposable (b);

      -- BOARD + PERMUTATION

   function are_compatible (b : in board; p : in permutation) return Boolean;

   procedure copy (p : in permutation; b : out board) with
      pre => is_valid_permutation (p) and
      is_valid_board (b) and
      are_compatible (b, p);
   procedure transform_row_major_1 (b : in board; p : out permutation) with
      pre => is_valid_permutation (p) and
      is_valid_board (b) and
      are_compatible (b, p);
   procedure transform_row_major_2 (b : in board; p : out permutation) with
      pre => is_valid_permutation (p) and
      is_valid_board (b) and
      are_compatible (b, p);
   procedure transform_col_major_1 (b : in board; p : out permutation) with
      pre => is_valid_permutation (p) and
      is_valid_board (b) and
      are_compatible (b, p);
   procedure transform_col_major_2 (b : in board; p : out permutation) with
      pre => is_valid_permutation (p) and
      is_valid_board (b) and
      are_compatible (b, p);

   pragma warnings (on, """b"" may be referenced before it has a value");
   pragma warnings (on, """p"" may be referenced before it has a value");

end puzzle_board;
