with Ada.Numerics.Discrete_Random;

package body puzzle_permutation is
   package rnd is new Ada.Numerics.Discrete_Random (Result_Subtype => Integer);

   -- INTERNAL GENERAL UTILITY

   procedure swap (x, y : in out Integer) is
      t : Integer;
   begin
      t := x;
      x := y;
      y := t;
   end swap;

   -- PERMUTATION

   function is_valid_permutation (p : in permutation) return Boolean is
   begin
      if p'first /= 0 then
         return False;
      end if;
      -- further checks!
      return True;
   end is_valid_permutation;

   procedure assign_start_position (p : out permutation) is
   begin
      for k in p'range loop
         p (k) := k;
      end loop;
   end assign_start_position;

   procedure assign_random_position (p : out permutation) is
      use rnd;
      g    : generator;
      k    : Integer;
      even : Boolean := True;
      c    : Integer := 0;
   begin
      reset (g);
      for i in p'range loop
         p (i) := i;
      end loop;
      for i in reverse 2 .. (p'length - 1) loop
         k := random (g) mod (i + 1);
         if k /= i then
            swap (p (i), p (k));
            even := not even;
         end if;
      end loop;
      if not even then
         swap (p (0), p (1));
      end if;
   end assign_random_position;

   function inversion_number (p : in permutation; ignore : in Integer) return Natural is
      result : Integer := 0;
      p_i    : Integer;
   begin
      for i in p'range loop
         p_i := p (i);
         if p_i /= ignore then
            for j in i + 1 .. p'last loop
               if p (j) /= ignore and then p (j) < p_i then
                  result := result + 1;
               end if;
            end loop;
         end if;
      end loop;
      return result;
   end inversion_number;

end puzzle_permutation;
