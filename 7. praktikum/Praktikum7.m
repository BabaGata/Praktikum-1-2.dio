clear ; close all; clc
pkg load io;

% Dodavanje puteva di se nalaze funkcije
cd ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\7');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\FunkcijePogreske');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\Grafovi');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\Kreiranje nove datoteke');

% Ucitavanje podataka mjerenja
data1 = load('7_1_1.txt');
data2 = load('7_1_2.txt');
data3 = load('7_1_2_c.txt');
data4 = load('7_2_1.txt');
data5 = load('7_2_2_c.txt');

% zadatak 7.1.1.
m = data1(2:5,1);
l0 = data1(1,2)/100;
l = data1(2:5,2)./100;
deltal = abs(l.-l0);
G = Tezina (m);
k = HookeovZakon(m, deltal);
absolutnok = AbsolutnaVrijednost(k);
SEk = StandardnaDevijacijaAritmetickeSredine(k);

Plot(G(2:4), deltal(2:4), 'G', 'deltal', 'Produzenja se odnose linearno, tj. 1:2:3 kada se tako mase odnose.');
print -dpng "7.1.1.zadatak.png";

status = xlswrite ('7.1.1.xlsx', deltal, '7.1.1.DeltaL');
status = xlswrite ('7.1.1.xlsx', k, '7.1.1.k');
status = xlswrite ('7.1.1.xlsx', absolutnok, '7.1.1.Absk', 'A1');
status = xlswrite ('7.1.1.xlsx', SEk, '7.1.1.Absk', 'A2');

% Zdatak 7.1.2.
m = data2(:,1);
t = data2(:,2);
n = 10;

T1 = PeriodIzMiK(m, deltal(2:4,1));
T2 = PeriodIzt(t, n);
SrednjeT = abs(T1+T2)./2;

status = xlswrite ('7.1.2.xlsx', T1, 'Azadatak', 'A1:A7');
status = xlswrite ('7.1.2.xlsx', T2, 'Azadatak', 'B1:B7');
status = xlswrite ('7.1.2.xlsx', SrednjeT, 'Azadatak', 'C1:C7');

T3 = PeriodIzt (data3, n);
status = xlswrite('7.1.2.xlsx', T3, 'Czadatak');


% Zdatak 7.2.1.
m = data4(:, 1)./1000;
fi = data4 (:, 2);
fi = StupnjeviURadijane(fi);
l = 20/100;
r = 1.56/2000;
O = 44.4/100;

d = DuljinaD (O);
C = StatickaKonstantaTorzije(fi, m, d);
AbsC = AbsolutnaVrijednost(C);
mi = ModulTorzijeZice (l, r, C);
M = MomentParaSilaTorzije (m, d);

status = xlswrite ('7.2.1.xlsx', C, 'KonstantaTorzije');
status = xlswrite ('7.2.1.xlsx', AbsC, 'AbsC', 'A1');
status = xlswrite ('7.2.1.xlsx', mi, 'AbsC', 'B1:B6');
status = xlswrite ('7.2.1.xlsx', M, 'AbsC', 'C1:C6');
status = xlswrite ('7.2.1.xlsx', d, 'AbsC', 'A2');

Plot(M, fi, 'M', 'KutTheta', 'Zanimljivo');
print -dpng "7.2.1.zadatak.png";

% Zdatak 7.2.2.
m = 222/2000;
r1 = 6/100;
T1 = 0.712;
r2 = 12/100;
T2 = 0.1025;
R = 1.98/2000;
l = 32/100;

C1 = DinamickaKonstantaTorzije (m, r1, r2, T1, T2);
mi = ModulTorzijeZice (l, R, C1);
T = PeriodIzt (data5, n);

status = xlswrite ('7.2.2.xlsx', C1, 'DinamickaKonstantaTorzije');
status = xlswrite ('7.2.2.xlsx', mi, 'ModulTorzijeZice');
status = xlswrite ('7.2.2.xlsx', T, 'Czadatak');


% Zdatak 7.2.3.
k = 6.7968;
r = 13.76/2000;
r0 = 0.6/1000;
n = 142;
p = 1.2/1000;

l = DuljinaZiceUOpruzi(r, n, p);
mi = ModulTorzijeOpruge (k, l, r, r0);

status = xlswrite ('7.2.3.xlsx', l, 'DuljinaZice');
status = xlswrite ('7.2.3.xlsx', mi, 'ModulTorzijeOpruge');