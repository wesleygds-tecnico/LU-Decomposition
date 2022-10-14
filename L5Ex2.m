function[] = L5Ex2(A,B)
D = A;
n = length(A);
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
y = zeros(n,1); 
y(1,1) = B(1,1);
for i = 2:(n)
    soma = 0;
    for j = 1:i-1
        soma = soma + (y(j)*L(i,j));
    end
    y(i) = (B(i)-soma);
end

x = zeros(n,1); 
x(n,1) = y(n,1)/U(n,n);
for i = n-1:-1:1
    soma = 0;
    for j = (i+1):n
        soma = soma + (x(j)*U(i,j));
    end
    x(i) = (y(i)-soma)/(U(i,i));
end

fprintf('A matriz é decomposta em: \n')
fprintf('Matriz L \n')
disp(L)
a = det(L);
fprintf('Determinante L: \n')
disp(a)
fprintf('Matriz U: \n')
disp(U)
b = det(U);
fprintf('Determinante U: \n')
disp(b)
fprintf('Verificação da decomposição \n')
D = L*U;
disp(D)
fprintf('Solução do sistema 1 \n')
disp(y)
fprintf('Verificação do sistema 1 \n')
a = L*y;
disp(a)
fprintf('Solução do sistema 2 \n')
a = D*x;
disp(x)
fprintf('Verificação do sistema 2 \n')
disp(a)
end