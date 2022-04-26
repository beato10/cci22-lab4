function satisfaz = CriterioLinhas(A)
    n = size(A,1);
    soma = sum(abs(A'))' - abs(diag(A)); 
    teste = soma < abs(diag(A));
    satisfaz = (sum(teste) == n);
end