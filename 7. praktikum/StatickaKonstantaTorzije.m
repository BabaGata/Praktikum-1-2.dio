function C = StatickaKonstantaTorzije(fi, m, d)
  M = MomentParaSilaTorzije(m, d);
  C = M./fi;
endfunction