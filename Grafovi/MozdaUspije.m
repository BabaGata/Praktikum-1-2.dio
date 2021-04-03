clear; close all; clc;
pkg load io;

cd ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\Grafovi');

G = [4.9033;
    9.8066;
   19.6133;
   29.4200];
   
l = [0.071450;
   0.143200;
   0.289700;
   0.438700];

Plot(G,l, 'zasto', 'zato', 'mozda');
print -dpng "G(1,1)";