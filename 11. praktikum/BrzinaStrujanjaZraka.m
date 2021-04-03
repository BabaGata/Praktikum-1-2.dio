function [v, h] = BrzinaStrujanjaZraka(l, alfa, g, rov, roz)
  h = l.*cos(alfa);
  a = (2*g*rov)/roz;
  v = sqrt(a.*h);
endfunction
