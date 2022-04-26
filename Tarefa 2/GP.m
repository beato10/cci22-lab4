function x = GP(A,b)
    dim = length(A);
    x = zeros(dim,1);
    t = 1;
    for j = 1 : dim - 1 
        q = j;
        max = abs(A(j,j));
        for k = j+1 : dim  %escolha do pivo
            if abs(A(k,j)) > max    
                max = abs(A(k,j));
                q = k;
            end
        end
        if q ~=j
            A = trocarLinhas(A, j, q);
            b = trocarLinhas(b, j, q);
        end
        if A(j,j) == 0 % matriz singular 
            while A(j,t) == 0
                if t < dim
                    t = t + 1;
                end
            end
        else
            r = 1/A(j,t);
            for i = j+1 : dim
                m = A(i,j)*r;
                A(i,j) = 0;  
                for k = j+1 : dim
                    A(i,k) = A(i,k) - m*A(j,k);
                    if abs(A(i, k)) <= 10*eps 
                        A(i, k) = 0;
                    end
                end
                b(i) = b(i) - m*b(j);
                if abs(b(i)) <= 10*eps 
                    b(i) = 0;
                end
            end
        end 
        if t < dim
            t = t + 1;
        else
            break;
        end
    end
    Ab = [A b];
    rA = posto(A);
    rAb = posto(Ab);
    
    if rA ~= rAb
        x = [Inf; zeros(dim-1,1) ];
    else
        if rA < dim
            x = [NaN; zeros(dim-1,1)];   
        end
        if rA == dim         
           x = solucaoTriangularSuperior(A,b);
        end
    end
end