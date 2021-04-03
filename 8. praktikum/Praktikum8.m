clear ; close all; clc
pkg load io;

% Dodavanje puteva di se nalaze funkcije
cd ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\8');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\FunkcijePogreske');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\Grafovi');
addpath ('C:\Users\Korisnik\Desktop\Faks 3. semestar\Praktikum\Kreiranje nove datoteke');

% Ucitavanje podataka mjerenja
data1 = load('JedanObruc1.txt');
data2 = load('JedanObruc2.txt');
data3 = load('DvaObruca1.txt');
data4 = load('DvaObruca2.txt');


% zadatak
m = 30/100;
m2 = m*2;
r = 2.7/20;
g = 9.80665;

t11 = data1 (1:5,1);
t12 = data1 (6:10,1);
t13 = data1 (11:15,1);

t21 = data2 (1:5,1);
t22 = data2 (6:10,1);
t23 = data2 (11:15,1);

T11 = data3 (1:5,1);
T12 = data3 (6:10,1);
T13 = data3 (11:15,1);

T21 = data4 (1:5,1);
T22 = data4 (6:10,1);
T23 = data4 (11:15,1);

Abst = [AbsolutnaVrijednost(t11);
 AbsolutnaVrijednost(t12);
 AbsolutnaVrijednost(t13);
 AbsolutnaVrijednost(t21);
 AbsolutnaVrijednost(t22);
 AbsolutnaVrijednost(t23);
 AbsolutnaVrijednost(T11);
 AbsolutnaVrijednost(T12);
 AbsolutnaVrijednost(T13);
 AbsolutnaVrijednost(T21);
 AbsolutnaVrijednost(T22);
 AbsolutnaVrijednost(T23)];

fi = [KutFi(1); KutFi(4); KutFi(9)];

alfa = [ KutnoUbrzanje(fi(1,1),t11) KutnoUbrzanje(fi(1,1),t21); 
         KutnoUbrzanje(fi(2,1),t12) KutnoUbrzanje(fi(2,1),t22);
         KutnoUbrzanje(fi(3,1),t13) KutnoUbrzanje(fi(3,1),t23)];
         
Alfa = [ KutnoUbrzanje(fi(1,1),T11) KutnoUbrzanje(fi(1,1),T21); 
         KutnoUbrzanje(fi(2,1),T12) KutnoUbrzanje(fi(2,1),T22);
         KutnoUbrzanje(fi(3,1),T13) KutnoUbrzanje(fi(3,1),T23)];
         
AbsolutnaAlfa = [ AbsolutnaVrijednost(alfa(:,1));
                  AbsolutnaVrijednost(alfa(:,2));
                  AbsolutnaVrijednost(Alfa(:,1));
                  AbsolutnaVrijednost(Alfa(:,2))];

PogreskeAlfa = [ Pogreske(alfa(:,1));
                 Pogreske(alfa(:,2));
                 Pogreske(Alfa(:,1));
                 Pogreske(Alfa(:,2))];    
  
SEAlfa = [ StandardnaDevijacijaAritmetickeSredine(alfa(:,1));
           StandardnaDevijacijaAritmetickeSredine(alfa(:,2));
           StandardnaDevijacijaAritmetickeSredine(Alfa(:,1));
           StandardnaDevijacijaAritmetickeSredine(Alfa(:,2))];    
         
G1 = Tezina (m, g);
G2 = Tezina (m2, g);
M1 = MomentSile(G1, r);
M2 = MomentSile(G2, r);
I = [MomentInercije(M1, AbsolutnaAlfa(1,1));  
     MomentInercije(M2, AbsolutnaAlfa(2,1));  
     MomentInercije(M1, AbsolutnaAlfa(3,1)); 
     MomentInercije(M2, AbsolutnaAlfa(4,1))]; 
         
status = xlswrite ('8.xlsx', alfa, 'KutnoUbrzanjeZajedanObruc');
status = xlswrite ('8.xlsx', Alfa, 'KutnoUbrzanjeZaDvaObruca');
status = xlswrite ('8.xlsx', Abst, 'AbsolutnaVrijednostVremena');
status = xlswrite ('8.xlsx', AbsolutnaAlfa, 'AbsKutnihUbrzanja');
status = xlswrite ('8.xlsx', PogreskeAlfa, 'PogreskeKutnihUbrzanja');
status = xlswrite ('8.xlsx', SEAlfa, 'SEodKutnihUbrzanja');
status = xlswrite ('8.xlsx', I, 'MomentInercije');