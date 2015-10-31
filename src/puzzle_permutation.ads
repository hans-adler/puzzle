package puzzle_permutation is

   pragma warnings(off, """p"" may be referenced before it has a value");

   -- PERMUTATION

   type permutation is array(integer range <>) of integer;

   function is_valid_permutation(p: in permutation) return boolean;

   procedure assign_start_position(p: out permutation) with
     pre => is_valid_permutation(p);
   procedure assign_random_position(p: out permutation) with
     pre => is_valid_permutation(p);

   function inversion_number(p: in permutation) return integer;


   pragma warnings(on, """p"" may be referenced before it has a value");

end puzzle_permutation;
