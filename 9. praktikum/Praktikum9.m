clear ; close all; clc
pkg load io;

% Dodavanje puteva di se nalaze funkcije
cd ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\9');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\FunkcijePogreske');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\Grafovi');

% Ucitavanje podataka mjerenja
data1 = load('zadatak1.txt');
data2 = load('zadatak2.txt');

% Zdatak 9.1

t1 = data1(:,1);
t2 = data1(:,2);
t3 = data1(:,3);

Arit1 = AbsolutnaVrijednost(t1);
Arit2 = AbsolutnaVrijednost(t2);
Arit3 = AbsolutnaVrijednost(t3);

status = xlswrite ('9.xlsx', Arit1, 'Aritmrticka sredina od t', 'A1');
status = xlswrite ('9.xlsx', Arit2, 'Aritmrticka sredina od t', 'A2');
status = xlswrite ('9.xlsx', Arit3, 'Aritmrticka sredina od t', 'A3');

SEt1 = StandardnaDevijacijaAritmetickeSredine(t1);
SEt2 = StandardnaDevijacijaAritmetickeSredine(t2);
SEt3 = StandardnaDevijacijaAritmetickeSredine(t3);

status = xlswrite ('9.xlsx', SEt1, 'Aritmrticka sredina od t', 'B1');
status = xlswrite ('9.xlsx', SEt2, 'Aritmrticka sredina od t', 'B2');
status = xlswrite ('9.xlsx', SEt3, 'Aritmrticka sredina od t', 'B3');

m = 60/1000;
h = 95.5/100;
O = 9.955/100;
r = RadijusIzOpsega(O);
g = 9.80665;
status = xlswrite ('9.xlsx', r, 'Radijus');

I = MomentInercijeTijela(m, r, h, g, [Arit1; Arit2; Arit3]);

d = data2(:,2);
T = data2(:,3)/10;

Plot(d, T, 'd/cm', 'T/s', 'T = f(d)');
print -dpng "9.2.zadatak.png";

T0 = 1.157;
l = 39.5/100;

G = Ubrzanje (l, T0);

status = xlswrite ('9.xlsx', G, 'Ubrzanje', 'A1');

Tocnost = Tocnost (g, G);
status = xlswrite ('9.xlsx', Tocnost, 'Ubrzanje', 'A2');