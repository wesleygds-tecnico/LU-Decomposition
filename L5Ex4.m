function [] = L5Ex4(A)
n = length(A);
b = zeros(n,1);
for k = 1:n
    e = zeros(k);
    for i = 1:k
        for j = 1:k
            e(i,j) = A(i,j);
        end
    end
    a = det(e);
    b(k,1) = a
end
for i1 = 1:n
    if(abs(b(i1,1))<10^-5)  
       a = 1;
       fprintf('Não é possível decompor LU a matriz \n')
       break
    else 
        a = 0;
    end
end
if (a~=1)
    fprintf('É possível decompor LU a matriz \n')
    L = eye(n);
    for j = 1:n-1
        for i = j+1:n
            m = A(i,j)/A(j,j);
            L(i,j) = m;
            A(i,j) = A(i,j) - A(j,j)*m;
            for k = (j+1):n
                A(i,k) = A(i,k) - A(j,k)*m;
            end
        end
    end
    U = A;
    fprintf('A matriz é decomposta em: \n')
    disp(L)
    a = det(L);
    fprintf('Determinante L: \n')
    disp(a)
    disp(U)
    b = det(U);
    fprintf('Determinante U: \n')
    disp(b)
    fprintf('Verificação \n')
    D = L*U;        
    disp(D)
end
end

