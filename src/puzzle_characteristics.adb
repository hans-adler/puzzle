package body puzzle_characteristics is

   -- CHARACTERISTICS

   procedure update (b : in board; c : out characteristics) is
      row, col : Integer;
      tn       : Integer;
      p        : permutation (0 .. b'length (1) * b'length (2) - 1);
   begin
      c.hor.mh := 0;
      c.ver.mh := 0;
      for i in b'range (1) loop
         for j in b'range (2) loop
            tn := b (i, j);
            if tn /= 0 then
               row      := tn / b'length (2);
               col      := tn mod b'length (2);
               c.ver.mh := c.ver.mh + abs (row - i);
               c.hor.mh := c.hor.mh + abs (col - j);
            end if;
         end loop;
      end loop;

      transform_row_major_1 (b, p);
      c.ver.i1 := (inversion_number (p, 0) + 2) / 3;
      transform_row_major_2 (b, p);
      c.ver.i2 := (inversion_number (p, p'length - b'length (2)) + 2) / 3;
      transform_col_major_1 (b, p);
      c.hor.i1 := (inversion_number (p, 0) + 2) / 3;
      transform_col_major_2 (b, p);
      c.hor.i2 := (inversion_number (p, p'length - b'length (1)) + 2) / 3;
   end update;

end puzzle_characteristics;
