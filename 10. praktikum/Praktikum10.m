clear ; close all; clc
pkg load io;

% Dodavanje puteva di se nalaze funkcije
cd ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\10');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\FunkcijePogreske');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\Grafovi');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\Kreiranje nove datoteke');

% Ucitavanje podataka mjerenja
data1 = load('10.2.1.txt');
data2 = load('10.2.1.drugi.txt');
data3 = load('10.2.2.txt');


% zadatak 10.1.1.
r = 1.9/2000;
h = 10/1000;
t = 21.9+273.16;
ro = 997.8;
g = 9.80665;

sigma1 = PovrsinskaNapetostVode (r,h,ro,g);
                
status = xlswrite ('10.xlsx', sigma1, '10.1.1');


% zadatak 10.1.2.
l = ones(5,1);
l = l.*(20.5/100);
m = 3/1000;
r1 = 5.350/200;
r2 = 5.075/200;

AbsR = AbsolutnaVrijednost([r1 r2]);
SumaL = sum(l);
AbsL = AbsolutnaVrijednost(l);
sigma2 = DeNouyjeveaVaga (m, g, AbsR);
AbsSigma = AbsolutnaVrijednost ([sigma1 sigma2]);
SESigma = StandardnaDevijacijaAritmetickeSredine([sigma1 sigma2]);

status = xlswrite ('10.xlsx', SumaL, '10.1.2.zadatak', 'A1');
status = xlswrite ('10.xlsx', AbsL, '10.1.2.zadatak', 'A2');
status = xlswrite ('10.xlsx', AbsR, '10.1.2.zadatak', 'A3');
status = xlswrite ('10.xlsx', sigma2, '10.1.2.zadatak', 'A4');
status = xlswrite ('10.xlsx', AbsSigma, '10.1.2.zadatak', 'A5');
status = xlswrite ('10.xlsx', SESigma, '10.1.2.zadatak', 'A6');

% zadatak 10.2.1.
ni1 = 0.980;
ro1 = ro;
ro2 = 1166;
t1 = data1;
t2 = data2+120;

SrednjaT1 = AbsolutnaVrijednost(t1);
SrednjaT2 = AbsolutnaVrijednost(t2);
PogreskeT1 = Pogreske(t1);
PogreskeT2 = Pogreske(t2);
KvadratPt1 = PogreskeT1.^2;
KvadratPt2 = PogreskeT2.^2;
ni2 = DinamickaViskoznostTekucine(ni1, ro1, t1, ro2, t2);
SrednjaNi2 = AbsolutnaVrijednost(ni2);
SENi2 = StandardnaDevijacijaAritmetickeSredine(ni2);
vi1 = KinematickaViskoznost(ro1,ni1);
vi2 = KinematickaViskoznost(ro2, SrednjaNi2);
PogreskeNi = Pogreske (ni2);

status = xlswrite('10.xlsx', SrednjaT1, '10.2.1.SrednjeVrijednosti', 'A1');
status = xlswrite('10.xlsx', SrednjaT2, '10.2.1.SrednjeVrijednosti', 'A2');
status = xlswrite('10.xlsx', SrednjaNi2, '10.2.1.SrednjeVrijednosti', 'A3');
status = xlswrite('10.xlsx', SENi2, '10.2.1.SrednjeVrijednosti', 'A4');
status = xlswrite('10.xlsx', vi1, '10.2.1.SrednjeVrijednosti', 'A5');
status = xlswrite('10.xlsx', vi2, '10.2.1.SrednjeVrijednosti', 'A6');
status = xlswrite('10.xlsx', PogreskeT1, '10.2.1.Pogreske', 'A1:A6');
status = xlswrite('10.xlsx', PogreskeT2, '10.2.1.Pogreske', 'B1:B6');
status = xlswrite('10.xlsx', KvadratPt1, '10.2.1.Kvadrati', 'A1:A6');
status = xlswrite('10.xlsx', KvadratPt2, '10.2.1.Kvadrati', 'B1:B6');
status = xlswrite('10.xlsx', ni2, '10.2.1.Kvadrati', 'C1:C6');
status = xlswrite('10.xlsx', PogreskeNi, '10.2.1.Pogreske', 'C1:C6');


%Zdatak 10.2.2.
s = 30/100;
m = 0.62/1000;
r = 0.99/200;
rot = 861;
C = 0.4;
roz = 1.3;

Sumat = sum(data3);
Abst = AbsolutnaVrijednost(data3);
Pogresket = Pogreske (data3);
KvadratPt = Pogresket.^2;

V = ((r^3)*pi)*(4/3);
ro = Gustoca (m, V);
ni = DinamickaViskoznostSaKuglicom (g, r, rot, ro, data3, s);
PogreskeNi = Pogreske (ni);
AbsNi = AbsolutnaVrijednost (ni);
SENi = StandardnaDevijacijaAritmetickeSredine(ni);
v1 = BrzinaKrozTekucinu (s, data3);
v2 = BrzinaKrozZrak (r, ro, g, C, roz);
Srednjav1 = AbsolutnaVrijednost (v1);
Kin = KinematickaViskoznost(rot, ni);
AbsKin = AbsolutnaVrijednost(Kin);


status = xlswrite('10.xlsx', Sumat, '10.2.2.Sume', 'A1');
status = xlswrite('10.xlsx', Abst, '10.2.2.Sume', 'A2');
status = xlswrite('10.xlsx', AbsNi, '10.2.2.Sume', 'A3');
status = xlswrite('10.xlsx', Pogresket, '10.2.2.PogIKvad', 'A1:A12');
status = xlswrite('10.xlsx', KvadratPt, '10.2.2.PogIKvad', 'B1:B12');
status = xlswrite('10.xlsx', ni, '10.2.2.zadatak', 'A1:A12');
status = xlswrite('10.xlsx', PogreskeNi, '10.2.2.zadatak', 'B1:B12');
status = xlswrite('10.xlsx', SENi, '10.2.2.zadatak', 'C2');
status = xlswrite('10.xlsx', Srednjav1, '10.2.2.c', 'B1');
status = xlswrite('10.xlsx', v1, '10.2.2.c', 'A1:A12');
status = xlswrite('10.xlsx', v2, '10.2.2.c', 'B2');
status = xlswrite('10.xlsx', Kin, '10.2.2.d', 'A1:A12');
status = xlswrite('10.xlsx', AbsKin, '10.2.2.d', 'B1');