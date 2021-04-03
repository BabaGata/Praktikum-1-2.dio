function C = KonstantaTorzije(fi, m, d)
  fi = fi.*(pi/180);
  M = MomentParaSilaTorzije(m, d);
  C = M./fi;
endfunction