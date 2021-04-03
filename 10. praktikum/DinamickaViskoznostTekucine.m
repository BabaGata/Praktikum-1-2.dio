function ni2 = DinamickaViskoznostTekucine(ni1, ro1, t1, ro2, t2)
  a = ro2.*t2;
  b = ro1.*t1;
  c = a./b;
  ni2 = ni1.*c;
end
