function SD = StandardnaDevijacija(d)
 
  % Jedna od ocjena rasapa skupa podataka jest srednja 
  % kvadratna pogreska ili standardna devijacija
 
  n = max(size(d));
  pogreskeD = Pogreske(d);
  c = pogreskeD.^2;
  b = sum(c);
  a = b./(n-1);
  SD = a.^(1/2);
  
  % Ovo je rastavljena formula za standardnu devijaciju
  % na vise koraka
  
  % Zamisli 2D graf mjerenja gdje su mjerenja tockice
  % okupljene na nekom podrucju. Standardna devijacija
  % bi onda bila mjera kolko su te to?kice rastrkane
  % ili okupljene. Znaci mjerenja su bila preciznija
  % ako su te tockice blize jedna drugoj -> standardna
  % devijacija je manja.
endfunction
