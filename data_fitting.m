%Opis danych ze zbioru:
%1. CRIM      per capita crime rate by town
%2. ZN        proportion of residential land zoned for lots over 25,000 sq.ft.
%3. INDUS     proportion of non-retail business acres per town
%4. CHAS      Charles River dummy variable (= 1 if tract bounds river; 0 otherwise)
%5. NOX       nitric oxides concentration (parts per 10 million)
%6. RM        average number of rooms per dwelling
%7. AGE       proportion of owner-occupied units built prior to 1940
%8. DIS       weighted distances to five Boston employment centres
%9. RAD       index of accessibility to radial highways
%10. TAX      full-value property-tax rate per $10,000
%11. PTRATIO  pupil-teacher ratio by town
%12. B        1000(Bk - 0.63)^2 where Bk is the proportion of blacks by town
%13. LSTAT    % lower status of the population
%14. MEDV     Median value of owner-occupied homes in $1000's

clear;
close all;

%import danych:
Housing = importdata('Housing.data');

%wyci¹gniêcie z macierzy okreœlonej kolumny:
%A = M(:, nr_kolumny)
%A - wektor, M - macierz
%wybranie cech:
input = [Housing(:, 1) Housing(:, 5)];
target = Housing(:, 14).*1000;

%plot3(x, y, z, opcje);
%xlabel('nazwa_osi_x');
%przedstawienie danych na wykresie:
figure

%f = fit([x, y], z, typ)
%f - zwrócona funkcja aproksymuj¹ca
%typ - stopieñ wielomianu; w przypadku 3D polyAB, gdzie A to maksymalna
%potêga pierwszej zmiennej, a B - drugiej
%OPCJONALNIE aproksymacja:

%dopasowanie danych z u¿yciem sieci neuronowej:
%Tu nie trzeba kodu, wystarczy zapisaæ output z nftool.

%porównanie danych z sieci z danymi wejœciowymi:
