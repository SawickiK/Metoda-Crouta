function [L, U] = crout(A)

%Funkcja crout(A) służy znajdowaniu rozkładu crouta macierzy A
%[L, U] = crout(A) zwraca macierze L i U takie, że L*U = A gdzie
%A: macierz kwadratowa
%L: macierz trójkątna dolna
%U: rójkątna górna z jedynkami na głównej przekątnej

sizeA = size(A);
if sizeA(1) ~= sizeA(2)
    exc = MException("crout:wrongInput", "Macierz A nie jest kwadratowa");
    throw(exc)
end

n = sizeA(1);
U = eye(n);
L = zeros(n,n);
L(:,1) = A(:,1);
U(1, :) = A(1, :) / L(1, 1);

for i = 2:n
    for j = 2:i
        L(i, j) = A(i, j) - L(i, 1:j - 1) * U(1:j - 1, j);
    end
            
    for j = i + 1:n
        U(i, j) = (A(i, j) - L(i, 1:i - 1) * U(1:i - 1, j)) / L(i, i);
    end
end

end



