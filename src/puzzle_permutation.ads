package puzzle_permutation is

   pragma warnings (off, """p"" may be referenced before it has a value");

   -- PERMUTATION

   type permutation is array (Integer range <>) of Integer;

   function is_valid_permutation (p : in permutation) return Boolean;

   procedure assign_start_position (p : out permutation) with
      pre => is_valid_permutation (p);
   procedure assign_random_position (p : out permutation) with
      pre => is_valid_permutation (p);

   function inversion_number (p : in permutation; ignore : in Integer) return Natural;

   pragma warnings (on, """p"" may be referenced before it has a value");

end puzzle_permutation;
