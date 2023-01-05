function [X] = solve_Crout(A,B)

%Funkcja solve_Crout(A,b) służy do rozwiązywania równania macierzowego
%AX = B, gdzie A ∈ R^nxn, B ∈ R^nxm metodą Crouta.
%Funkcja korzysta z rozkładu Crouta dla macierzy A otrzymując układ równań
%LUX = B. Następnie podstawia Y za UX i rowiązuje układ równań LY = B, aby
%w końcowym rozrachunku rozwiązać układ UX = Y i zwrócić wynikowy X, który
%spełnia pierwotne równanie AX = B.

sizeA = size(A);
sizeB = size(B);

% sprawdzanie, czy macierze A i B są poprawnych wymiarów

if sizeA(1) ~= sizeA(2)
    ME = MException("solve_Crout:wrongInput", "Macierz A nie jest kwadratowa");
    throw(ME)
end
if sizeA(2) ~= sizeB(1)
    ME = MException("solve_Crout:wrongInput", "Macierze A i B mają nieodpowiednie wymiary");
    throw(ME)
end

[L,U] = crout(A);

Y = lower_triangular_solver(L,B);
X = upper_triangular_solver(U,Y);

end