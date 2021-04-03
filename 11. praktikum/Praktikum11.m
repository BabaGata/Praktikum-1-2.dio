clear ; close all; clc
pkg load io;

% Dodavanje puteva di se nalaze funkcije
cd ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\11');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\FunkcijePogreske');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\Grafovi');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\Kreiranje nove datoteke');

% Ucitavanje podataka mjerenja
data1 = load('11.1.txt');
data2 = load('11.2.txt');
data3 = load('11.3.txt');


% zadatak 11.1.
h2 = data1(1:5,1)./100;    
h1 = data1(6:10,1)./100;  
s = data1(11:15,1)./100;  
t = data1(16:20,1);  
Q = 250/1000000;
r = 0.925/200;
g = 9.80665;
h= (43.1+0.57)/100;

sume = [ sum(h1); sum(h2); sum(s); sum(t)];
SrednjeVrijednosti = [ AbsolutnaVrijednost(h1); 
                       AbsolutnaVrijednost(h2); 
                       AbsolutnaVrijednost(s); 
                       AbsolutnaVrijednost(t)];
         
v1 = BrzinaStrujanjaVode1 (h1, h2, g);
v2 = BrzinaStrujanjaVode2 (s, h, g);
v3 = BrzinaStrujanjaVode3(Q, r, t);

SrednjeBrzine = [AbsolutnaVrijednost(v1); 
                 AbsolutnaVrijednost(v2); 
                 AbsolutnaVrijednost(v3)];

SEBrzine = [StandardnaDevijacijaAritmetickeSredine(v1); 
            StandardnaDevijacijaAritmetickeSredine(v2); 
            StandardnaDevijacijaAritmetickeSredine(v3)];
                 
status = xlswrite ('11.xlsx', sume, 'Sume');
status = xlswrite ('11.xlsx', SrednjeVrijednosti, 'SrednjeVrijednosti');
status = xlswrite ('11.xlsx', v1, '11.1.1.Zadatak');
status = xlswrite ('11.xlsx', v2, '11.1.2.Zadatak');
status = xlswrite ('11.xlsx', v3, '11.1.3.Zadatak');
status = xlswrite ('11.xlsx', SrednjeBrzine, 'SrednjaVodBrzine');
status = xlswrite ('11.xlsx', SEBrzine, 'SEodBrzine');


% zadatak 11.2
alfa = data2(:,1);
l = data2(:,2)./1000;
rov = 997;
roz = 1.22521;
alfa = StupnjeviURadijane (alfa);

[v, h] = BrzinaStrujanjaZraka(l, alfa, g, rov, roz);

Absolutno = [ AbsolutnaVrijednost(v); AbsolutnaVrijednost(h)];
SEVrijednosti = [ StandardnaDevijacijaAritmetickeSredine(v);
                  StandardnaDevijacijaAritmetickeSredine(h)];
PogreskeOdViH = [Pogreske(v) Pogreske(h)];

status = xlswrite ('11.xlsx', v, 'BrzinaStrujanjaZraka');
status = xlswrite ('11.xlsx', h, 'h');
status = xlswrite ('11.xlsx', Absolutno, 'Absolutno');
status = xlswrite ('11.xlsx', SEVrijednosti, 'SEVrijednosti');
status = xlswrite ('11.xlsx', PogreskeOdViH, 'PogreskeOdViH');

Plot(alfa, l, 'alfa', 'l', 'Graf l=f(alfa)');
print -dpng "11.2.zadatak.png";

% Zdatak 11.3.
a = data3 (1:9,1);
x = data3 (10:18,1)./100;
m = data3 (19:27,1)./1000;

a = StupnjeviURadijane(a);
F = DinamickiUzgon (m, g, x, a);

status = xlswrite ('11.xlsx', F, 'DinamickiUzgon', 'A1:A10');
status = xlswrite ('11.xlsx', a, 'DinamickiUzgon', 'B1:B10');

Plot(a, F, 'alfa', 'F', 'Graf F=f(alfa)');
print -dpng "11.3.zadatak.png";