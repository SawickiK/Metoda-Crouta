function [res] = detCrout(A)

%Funkcja detCrout(A) służy do obliczenia wyznacznika macierzy A
%wykorzystując rozkład crouta macierzy A (LU = A)
%Funkcja korzysta z własności wyznacznika det(A) = det(L)*det(U)
%oraz tego, że L i U to macierze trójkątne zatem ich wyznacznik to iloczyn
%elementów na przekątnej. Dodatkowo macierz U na głównej przekątnej ma same
%1 zatem jej wyznacznik jest równy 1

[L,U] = crout(A);
n = size(L,1);

%obliczamy wyznacznik det(L), det(U) jest pomijany gdyż jest równy 1
res = L(1,1);

for i = 2:n
    res = res*L(i,i);
end

end