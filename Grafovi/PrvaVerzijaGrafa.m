function Plot(x, y)
  
  hf = figure ();
  plot (x, y);
  xlabel ("x");
  ylabel ("erf (x)");
  title ("erf (x) with text annotation");
  print- djpg 'open plot15_7';
  
endfunction