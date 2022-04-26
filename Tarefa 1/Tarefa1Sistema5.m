% Sistema 5
A = [2 1 1; 1 2 1; 1 1 2];
b = [4; 4; 4];
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