function [a, b, c, d] = Sve (x)
  a = AbsolutnaVrijednost(x);
  b = StandardnaDevijacijaAritmetickeSredine (x);
  c = Pogreske (x);
  d = c.^2;
end
