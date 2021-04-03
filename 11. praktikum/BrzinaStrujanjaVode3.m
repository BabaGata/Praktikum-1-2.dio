function v = BrzinaStrujanjaVode3(Q, r, t)
  a = 2*Q;
  b = 3*(r^2)*pi;
  c = b.*t;
  v = a./c;
endfunction
