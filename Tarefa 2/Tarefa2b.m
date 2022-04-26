% Matriz mal condicionada
% OBSERVACAO: as variaveis craiads dentro do loop aparecem no workspace
% com o valor da ultima iteracao
dim = 8;
N = 10;
x0 = zeros(dim,1);
maxIteracoes = 1000;
epsilon = 10*eps;

for i = 1:N
    A = hilb(dim);
    b = rand(dim,1);
    
    % Gauss com pivoteamento
    tic; 
    xGP = GP(A,b);
    tGP(i, 1) = toc;
    
    % Decomposicao LU
    tic;
    [L,U,P] = LUP(A);
    xLU = SolucaoLU(L, U, P, b);
    tLU(i, 1) = toc;
    
    % Gauss-Jacobi
    tic;
    [xJac, drJac] = GaussJacobi(A,b,x0,epsilon,maxIteracoes); 
    tGJac(i, 1) = toc;
    
    % Gauss-Seidel
    tic;
    [xSeid, drSeid] = GaussSeidel(A,b,x0,epsilon,maxIteracoes);
    tGSeid(i, 1) = toc;
    
end

half = floor(N/2);
tempoGP = mean(tGP(half:N, 1));
tempoLU = mean(tLU(half:N, 1));
tempoGJac = mean(tGJac(half:N, 1));
tempoGSeid = mean(tGSeid(half:N, 1));

iteracoesJac = length(drJac);
iteracoesSeid = length(drSeid);

residuoJac = drJac(length(drJac));
residuoSeid = drJac(length(drSeid));




