function T = PeriodIzMiK(m, l)
  k = HookeovZakon(m, l);
  c = m./k;
  b = 2*pi;
  a = sqrt(c);
  T = a.*b;
endfunction
