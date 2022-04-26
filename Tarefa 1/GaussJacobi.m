function [x, dr] = GaussJacobi(A, b, x0, epsilon, maxIteracoes)
    n = size(A,1);
    C = zeros(n);
    g = zeros(n,1);
    
    % Definir C e g
    for i=1 : n
       for j=1 : n
           if i == j
               C(i,j) = 0;
           else
               C(i,j) = (-1)*A(i,j) / A(i,i); 
           end
       end
       g(i) = b(i) / A(i,i);
    end
  
    x = x0;
    for i=1 : maxIteracoes
       xold = x;
       x = C*x + g; % Usa tudo do xold para calcular o xnovo
       d = max(abs(x - xold));
       dr(i) = d / max(abs(x)); % atencao erro relativo e se x for zero???????????
       if dr(i) < epsilon
           break;
       end
    end
end