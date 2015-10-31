with puzzle_permutation; use puzzle_permutation;

package body puzzle_board is

   -- INTERNAL GENERAL UTILITY

   procedure swap(x, y: in out integer) is
      t: integer;
   begin
      t := x;
      x := y;
      y := t;
   end;

   -- BOARD

   function is_valid_board(b: in board) return boolean is
   begin
      return b'first(1) = 0 and b'first(2) = 0;
   end;

   function is_transposable(b: in board) return boolean is
   begin
      return b'length(1) = b'length(2);
   end;

   procedure assign_start_position(b: out board) is
      p: permutation(0..(b'length(1) * b'length(2) - 1));
   begin
      assign_start_position(p);
      copy(p, b);
   end;

   procedure assign_random_position(b: out board) is
      p: permutation(0..(b'length(1) * b'length(2) - 1));
   begin
      assign_random_position(p);
      copy(p, b);
   end;

   procedure transpose(b: in out board) is
   begin
      for i in b'range(1) loop
         for j in integer range i+1 .. b'Last(2) loop
            swap(b(i,j), b(j,i));
         end loop;
      end loop;
   end;

   -- BOARD + PERMUTATION

   function are_compatible(b: in board; p: in permutation) return boolean is
   begin
      return b'length(1) * b'length(2) = p'length;
   end;

   procedure copy(p: in permutation; b: out board) is
      k: integer := 0;
   begin
      for i in b'range(1) loop
         for j in b'range(2) loop
            b(i,j) := p(k);
            k := k + 1;
         end loop;
      end loop;
   end;
   procedure copy(b: in board; p: out permutation) is
      k: integer := 0;
   begin
      for i in b'range(1) loop
         for j in b'range(2) loop
            p(k) := b(i,j);
            k := k + 1;
         end loop;
      end loop;
   end;

   end puzzle_board;
