function IspisSvega (a, b, c, d, e, f, g)
  status = xlswrite (f, a, g, 'A1');
  status = xlswrite (f, b, g, 'A2');
  status = xlswrite (f, c, g, 'B1:B20');
  status = xlswrite (f, d, g, 'C1:C20');
  status = xlswrite (f, e, g, 'D1:D20');
end
