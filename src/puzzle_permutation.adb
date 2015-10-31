with ada.Numerics.discrete_random;

package body puzzle_permutation is
   package rnd is new Ada.Numerics.Discrete_Random(Result_Subtype => Integer);

   -- INTERNAL GENERAL UTILITY

   procedure swap(x, y: in out integer) is
      t: integer;
   begin
      t := x;
      x := y;
      y := t;
   end;

   -- PERMUTATION

   function is_valid_permutation(p: in permutation) return boolean is
   begin
      if p'first /= 0 then
         return false;
      end if;
      -- further checks!
      return true;
   end;

   procedure assign_start_position(p: out permutation) is
   begin
      for k in p'range loop
         p(k) := k;
      end loop;
   end;

   procedure assign_random_position(p: out permutation) is
      use rnd;
      g: generator;
      k: integer;
      even: boolean := true;
      c: integer := 0;
   begin
      reset(g);
      for i in p'range loop
         p(i) := i;
      end loop;
      for i in reverse 2..(p'length - 1) loop
         k := random(g) mod (i+1);
         if k /= i then
            swap(p(i), p(k));
            even := not even;
         end if;
      end loop;
      if not even then
         swap(p(0), p(1));
      end if;
   end;

   function inversion_number(p: in permutation) return integer is
      result: integer := 0;
      p_i: integer;
   begin
      for i in p'range loop
         p_i := p(i);
         for j in i+1..p'last loop
            if p(j) < p_i then
               result := result + 1;
            end if;
         end loop;
      end loop;
      return result;
   end;


end puzzle_permutation;
