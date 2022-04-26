function x = solucaoTriangularInferior(A, b)
    dim = length(A);
    x = zeros(dim,1);
    x (1) = b(1) / A (1, 1); %determinacao da ultima variavel
    for k = 2 : dim %descendo na matriz com intervalos de -1
        s = 0; %reinicar para cada linha
        for j = k - 1 : -1 : 1
            s = s + A(k, j)* x(j); %vetor soma combinacao linear das incognitas conhecidas com seus respectivos coeficientes
        end
        x (k) = (b(k) - s) / A(k, k); %resolucao da incognita
        if abs (x(k)) <= 10 * eps %determinar um valor a partir do qual se anula
            x (k) = 0;
        end
    end
end
