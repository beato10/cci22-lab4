function [x, dr] = GaussSeidel(A, b, x0, epsilon, maxIteracoes)
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
       % Aproveitar os novos valores calculados durante a iteração
       for j=1 : n
          x(j) = g(j); % apenas para inicializar aqui? sim, até pq o termo de j vai ser nulo
          for k=1 : n
             if j ~= k
                x(j) = x(j) + x(k)*C(j,k); 
             end
          end
       end
       
       d = max(abs(x - xold));
       dr(i) = d / max(abs(x));
       if dr(i) < epsilon
           break;
       end
    end
end