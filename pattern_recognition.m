%Opis danych ze zbioru:
%1. sepal length in cm
%2. sepal width in cm
%3. petal length in cm
%4. petal width in cm
%5. class: 
%   -- Iris Setosa
%   -- Iris Versicolour
%   -- Iris Virginica

clear
close all;

%import danych:
Iris = importdata('Iris.data.');

%wyci�gni�cie z macierzy okre�lonej kolumny:
%A = M(:, nr_kolumny)
%A - wektor, M - macierz
%wybranie cech:
input = [Iris.data(:, 1), Iris.data(:, 2)];
classes = Iris.textdata;

%gscatter(x, y, klasy, kolory, znaczki);
%przedstawienie danych na wykresie:
figure

%C = classify([test1, test2], [trening1, trening2], klasy, 'Quadratic');
%C - grupy dla punkt�w (test1, test2)
%test1, test2 - wektory danych testowych, dla kt�rych chcemy otrzyma�
%klasyfikacj� na podstawie zbioru treningowego
%OPCJONALNIE klasyfikacja funkcj� classify:

%klasyfikacja danych z uzyciem sieci neuronowej:
%Tu nie trzeba kodu, wystarczy zapisa� output z nprtool.

%por�wnanie danych z sieci z danymi wej�ciowymi:
