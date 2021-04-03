function ni = DinamickaViskoznostSaKuglicom (g, r, rot, ro, t, s)
  a = (r^2)*g*2;
  b = (a*(ro-rot))/(9*s);
  ni = t.*b;
end
