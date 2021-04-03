function DobraKombinacija (x, y, z)
  % Pozivanje funkcija
  a = AbsolutnaVrijednost(x);
  b = StandardnaDevijacijaAritmetickeSredine (x);
  c = Pogreske (x);
  d = c.^2;
  e = sum(x);
  f = sum(c);
  g = sum(d);
  
  % Ispisivanje izracuna
  status = xlswrite (y, a, z, 'A2');
  status = xlswrite (y, b, z, 'A4');
  status = xlswrite (y, x, z, 'B2:B20');
  status = xlswrite (y, c, z, 'C2:C20');
  status = xlswrite (y, d, z, 'D2:D20');
  status = xlswrite (y, e, z, 'E2');
  status = xlswrite (y, f, z, 'E4');
  status = xlswrite (y, g, z, 'E6');
  
  % Nazivi
  status = xlswrite (y, 'Srednja vrijednost', z, 'A1');
  status = xlswrite (y, 'SE', z, 'A3');
  status = xlswrite (y, 'Pogreske', z, 'C1');
  status = xlswrite (y, 'Kvadrati pogreski', z, 'D1');
  status = xlswrite (y, 'Velicina', z, 'B1');
  status = xlswrite (y, 'Suma velicine', z, 'E1');
  status = xlswrite (y, 'Suma pogreski', z, 'E3');
  status = xlswrite (y, 'Suma kvadrata', z, 'E5');
end
