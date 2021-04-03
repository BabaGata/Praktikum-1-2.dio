function F = DinamickiUzgon (m, g, x, a)
  d = m.*g;
  e = 1+(x./a);
  F = d.*e;
endfunction
