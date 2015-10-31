package body puzzle_characteristics is

   -- CHARACTERISTICS

   procedure update(b: in board; c: out characteristics) is
      row, col: integer;
      tn: integer;
   begin
      c.hor.mh := 0;
      c.ver.mh := 0;
      for i in b'range(1) loop
         for j in b'range(2) loop
            tn := b(i,j);
            if tn /= 0 then
               row := tn / b'length(2);
               col := tn mod b'length(2);
               c.ver.mh := c.ver.mh + abs(row-i);
               c.hor.mh := c.hor.mh + abs(col-j);
            end if;
         end loop;
      end loop;
   end;

end puzzle_characteristics;

