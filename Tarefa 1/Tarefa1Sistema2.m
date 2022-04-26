% Sistema 2
A = [5 2 2; 1 3 1; 0 6 8]; %Permutação de linhas do sistema 1
b = [3; -2; -6];
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