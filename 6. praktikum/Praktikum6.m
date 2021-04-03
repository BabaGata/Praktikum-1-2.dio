clear ; close all; clc
pkg load io;

% Dodavanje puteva di se nalaze funkcije
cd ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\6');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\FunkcijePogreske');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\Grafovi');

% Ucitavanje podataka mjerenja
data = load('zadatci.txt');

t1 = data(:,1);
t2 = data(:,2);
t3 = data(:,3);

DobraKombinacija(t1, '6.xlsx', 'ZaPrvoVrijeme');
DobraKombinacija(t2, '6.xlsx', 'ZaDrugoVrijeme');
DobraKombinacija(t3, '6.xlsx', 'ZaTreceVrijeme');

Aritm1 = AbsolutnaVrijednost(t1);
Aritm2 = AbsolutnaVrijednost(t2);
Aritm3 = AbsolutnaVrijednost(t3);

SE1 = StandardnaDevijacijaAritmetickeSredine(t1);
SE2 = StandardnaDevijacijaAritmetickeSredine(t2);
SE3 = StandardnaDevijacijaAritmetickeSredine(t3);

s = 1;

% zadatak 5.1.

a = Akceleracija (s, [Aritm1; Aritm2; Aritm3], '6.xlsx', 'Zadatak6.1.b');
SE = SEakceleracijaIzDerivacije (s, [Aritm1; Aritm2; Aritm3], [SE1; SE2; SE3], '6.xlsx', 'Zadatak6.1.c');

T = Tocnost (2*a(1,1), a(2,1));

status = xlswrite ('6.xlsx', T, 'Tocnost6.1.');

T2 = Tocnost (a(1,1), 2*a(3,1));

status = xlswrite ('6.xlsx', T2, 'Tocnost6.2.');