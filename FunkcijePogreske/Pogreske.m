function p = Pogreske(d)
  % Pogreske su razlika izmedu mjerenja i absolutna sredine
  absD = AbsolutnaVrijednost(d);
  p=d.-absD;
endfunction
