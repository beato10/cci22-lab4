function x = solucaoTriangularSuperior(A, b)
    dim = length(A);
    x = zeros(dim,1);
    x (dim) = b(dim) / A (dim, dim); %determinacao da ultima variavel
    for k = dim - 1 : -1 : 1 %subindo na matriz com intervalos de -1
        s = 0; %reinicar para cada linha
        for j = k + 1 : dim
            s = s + A(k, j)* x(j); %vetor soma combinacao linear das incognitas conhecidas com seus respectivos coeficientes
        end
        x (k) = (b(k) - s) / A(k, k); %resolucao da incognita
        if abs (x(k)) <= 10 * eps %determinar um valor a partir do qual se anula
            x (k) = 0;
        end
    end
end