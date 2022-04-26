% Sistema 3
A = [1 3 4; 1 -3 1; 1 1 5];
b = [8; -9; 1];
x0 = [0; 0; 0];
epsilon = 0.001;
maxIteracoes = 100;
satisfazLinha = CriterioLinhas(A);
[satisfazSassenfeld, beta] = CriterioSassenfeld(A);
[xJac, drJac] = GaussJacobi(A,b,x0,epsilon,maxIteracoes); 
[xSeid, drSeid] = GaussSeidel(A,b,x0,epsilon,maxIteracoes);
plot(drJac);
hold on
plot(drSeid);