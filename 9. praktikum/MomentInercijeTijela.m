function I = MomentInercijeTijela(m, r, h, g, t)
  I = (m*(r^2)/(2*h)).*((g.*(t.^2)).-(2*h));
  status = xlswrite ('9.xlsx', I, 'MomentInercijeTijela');
end
