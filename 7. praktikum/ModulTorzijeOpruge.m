function mi = ModulTorzijeOpruge (k, l, r0, r)
  
  % r0 je polumjer opruge, r je polumjer zice
  
  a = k.*(2*l*(r0^2));
  b = pi*(r^4);
  mi = a./b;  
endfunction