function x = SolucaoLU(L,U,P,b)
    dim = length(U);
    y = zeros(dim,1); 
    x = zeros(dim,1);
    % Ly = Pb
    y = solucaoTriangularInferior(L, P*b);
    % Ux = y
    x = solucaoTriangularSuperior(U,y);
end