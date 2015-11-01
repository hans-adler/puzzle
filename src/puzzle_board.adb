package body puzzle_board is

   -- INTERNAL GENERAL UTILITY

   procedure swap (x, y : in out Integer) is
      t : Integer;
   begin
      t := x;
      x := y;
      y := t;
   end swap;

   -- BOARD

   function is_valid_board (b : in board) return Boolean is
   begin
      return b'first (1) = 0 and b'first (2) = 0;
   end is_valid_board;

   function is_transposable (b : in board) return Boolean is
   begin
      return b'length (1) = b'length (2);
   end is_transposable;

   procedure assign_start_position (b : out board) is
      p : permutation (0 .. (b'length (1) * b'length (2) - 1));
   begin
      assign_start_position (p);
      copy (p, b);
   end assign_start_position;

   procedure assign_random_position (b : out board) is
      p : permutation (0 .. (b'length (1) * b'length (2) - 1));
   begin
      assign_random_position (p);
      copy (p, b);
   end assign_random_position;

   procedure transpose (b : in out board) is
   begin
      for i in b'range (1) loop
         for j in Integer range i + 1 .. b'last (2) loop
            swap (b (i, j), b (j, i));
         end loop;
      end loop;
   end transpose;

   -- BOARD + PERMUTATION

   function are_compatible (b : in board; p : in permutation) return Boolean is
   begin
      return b'length (1) * b'length (2) = p'length;
   end are_compatible;

   procedure copy (p : in permutation; b : out board) is
      k : Integer := 0;
   begin
      for i in b'range (1) loop
         for j in b'range (2) loop
            b (i, j) := p (k);
            k        := k + 1;
         end loop;
      end loop;
   end copy;

   procedure transform_row_major_1 (b : in board; p : out permutation) is
      k : Integer := 0;
   begin
      for i in b'range (1) loop
         for j in b'range (2) loop
            p (k) := b (i, j);
            k     := k + 1;
         end loop;
      end loop;
   end transform_row_major_1;

   procedure transform_row_major_2 (b : in board; p : out permutation) is
      k    : Integer := 0;
      b_ij : Integer;
      row  : Integer;
      col  : Integer;
   begin
      for i in reverse b'range (1) loop
         for j in b'range (2) loop
            -- unpack value
            b_ij  := b (i, j);
            row   := b_ij / b'length (2);
            col   := b_ij mod b'length (2);
            -- transform value (switch up and down)
            row   := b'last (1) - row;
            -- pack and write value
            p (k) := row * b'length (2) + (b_ij mod b'length (2));
            k := k + 1;
         end loop;
      end loop;
   end transform_row_major_2;

   procedure transform_col_major_1 (b : in board; p : out permutation) is
      k    : Integer := 0;
      b_ij : Integer;
      row  : Integer;
      col  : Integer;
   begin
      -- XXX
      for i in b'range (1) loop
         for j in b'range (2) loop
            -- unpack value
            b_ij  := b (i, j);
            row   := b_ij / b'length (2);
            col   := b_ij mod b'length (2);
            -- transform value (transpose)
            swap (row, col);
            -- pack and write value
            p (k) := row * b'length (1) + (b_ij mod b'length (1));
            k := k + 1;
         end loop;
      end loop;
   end transform_col_major_1;

   procedure transform_col_major_2 (b : in board; p : out permutation) is
      k    : Integer := 0;
      b_ij : Integer;
      row  : Integer;
      col  : Integer;
   begin
      -- XXX
      for i in reverse b'range (1) loop
         for j in b'range (2) loop
            -- unpack value
            b_ij  := b (i, j);
            row   := b_ij / b'length (2);
            col   := b_ij mod b'length (2);
            -- transform value (switch left and right, transpose)
            col   := b'last (2) - col;
            swap (row, col);
            -- pack and write value
            p (k) := row * b'length (1) + (b_ij mod b'length (1));
            k := k + 1;
         end loop;
      end loop;
   end transform_col_major_2;


end puzzle_board;
