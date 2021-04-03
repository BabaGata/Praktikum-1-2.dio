function C = DinamickaKonstantaTorzije (m, r1, r2, T1, T2)
  a = m*8*(pi^2)*((r2^2)-(r1^2));
  b = (T2^2)-(T1^2);
  C = a/b;
endfunction