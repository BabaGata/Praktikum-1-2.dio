function  v = BrzinaStrujanjaVode1 (h1, h2, g)
  a = h2-h1;
  b = (2*g).*a;
  v = sqrt(b);
endfunction
