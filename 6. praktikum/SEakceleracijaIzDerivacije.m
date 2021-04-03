function SE = SEakceleracijaIzDerivacije (s, t, se, y, x)
  a = -4 .*(se.*s);
  b = a./(t.^3);
  SE = abs(b);
  
  status = xlswrite (y, SE, x);
end
