function [Y] = lower_triangular_solver(A, B)

%Funkcja lower_triangular_solver rozwiązuje równanie macierzowe AX=B, gdzie A
%jest macierzą dolnotrójkątną.
%Funkcja przyjmuje:
%Kwadratową macierz A o wymiarach nxn
%Macierz B o wymiarach nxm
%Funkcja zwraca:
%Macierz X spełniającą równanie AX = B

n = size(A,1);
m = size(B,2);
Y = zeros(n, m);

for i = 1:n

    v = 1:i-1;
    Y(i,:) = (B(i,:) - A(i, v)*Y(v,:)) / A(i,i);

end

end