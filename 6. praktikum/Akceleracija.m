function a = Akceleracija (s, t, x, y)
  a = (2*s)./(t.^2);
  status = xlswrite (x, a, y);
end
