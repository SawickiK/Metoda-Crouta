function [X] = upper_triangular_solver(A, B)

%Funkcja upper_triangular_solver rozwiązuje równanie macierzowe AX=B, gdzie A
%jest macierzą górnotrójkątną.
%Funkcja przyjmuje:
%Kwadratową macierz A o wymiarach nxn
%Macierz B o wymiarach nxm
%Funkcja zwraca:
%Macierz X spełniającą równanie AX = B

n = size(A,1);
m = size(B,2);
X = zeros(n, m);

for i = n:-1:1

    v = n:-1:i+1;
    X(i,:) = (B(i,:) - A(i, v)*X(v,:)) / A(i,i);
    
end

end