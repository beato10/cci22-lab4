function [L,U,P] = LUP(A)
    dim = length(A);
    U = A;
    L = zeros(dim);
    P = eye(dim);
    
    for j = 1 : dim - 1 
        q = j;
        max = abs(U(j,j));
        for k = j+1 : dim  % escolha do pivo
            if abs(U(k,j)) > max    
                max = abs(U(k,j));
                q = k;
            end
        end
        if q ~=j
            U = trocarLinhas(U, j, q);   
            P = trocarLinhas(P, j, q);
            L = trocarLinhas(L, j, q);
        end
        if U(j,j) == 0 % matriz singular 
            break;
        else
            r = 1/U(j,j);
            for i = j+1 : dim   
                m = U(i,j)*r;
                L(i,j) = m; 
                U(i,j) = 0;
                for k = j+1 : dim
                    U(i,k) = U(i,k) - m*U(j,k); % eliminacao de gauss matriz U
                    if abs(U(i, k)) <= 10*eps 
                        U(i, k) = 0;
                    end
                end
            end
        end 
    end
    L = L + eye(dim);
end