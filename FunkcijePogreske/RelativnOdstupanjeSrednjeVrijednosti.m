function E = RelativnOdstupanjeSrednjeVrijednosti(d)
  pogreskeD = Pogreske(d);
  c = pogreskeD./d;
  E = abs(c);
endfunction
