function R = RelativnaPouzdanost(d)
  abs = AbsolutnaVrijednost(d);
  SE = StandardnaDevijacijaAritmetickeSredine(d);
  R = SE/abs;
endfunction
