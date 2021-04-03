function SE = StandardnaDevijacijaAritmetickeSredine(d)
  
  % Problem je u tome sto se standardna devijacija nece
  % nuzno smanjiti s povecanjem broja mjerenja. Zbog
  % ogranicenosti mjernih instrumenata vrijednosti
  % mjerenja se nakon nekog broja pocinju ponavljati.
  % Zato se kao najbolja ocjena rasapa uzima srednja
  % kvadratna pogreška aritmeti?ke sredine / standardna
  % devijacija aritmeti?ke sredine.
  
  n = max(size(d));
  SD = StandardnaDevijacija(d);
  SE = SD/sqrt(n);
endfunction
