function T = Tocnost (x, y)
  a = x.-y;
  b = a./x;
  E = abs(b);
  T = (1 .- E).*100;
end
