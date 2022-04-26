function [satisfaz, beta] = CriterioSassenfeld(A)
    n = length(A);
    Beta = zeros(1,n);
    for j=2 : n
       Beta(1) = Beta(1) + abs(A(1,j));
    end
    Beta(1) = Beta(1)/abs(A(1,1));
    
    for i=2 : n
       for j=1 : i-1
           Beta(i) = Beta(i) + abs(A(i,j))*Beta(j);
       end
       for j=i+1 : n
           Beta(i) = Beta(i) + abs(A(i,j));
       end
       Beta(i) = Beta(i)/abs(A(i,i));
    end
    beta = max(Beta);
    satisfaz = beta < 1;
end