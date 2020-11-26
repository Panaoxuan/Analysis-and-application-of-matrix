function [Q, R] = QR(A)
    [m, n] = size(A);
    Q = zeros(m,n);
    R = zeros(n);
    Q(:,1) = A(:,1) / norm(A(:,1)); 
    R(1,1) = norm(A(:,1));
    for j = 2:n
        R(1,j) = Q(:,1)'*A(:,j);
    end
    for i = 2:n
        component = 0;
        for j = 1:i-1
            component = component + Q(:,j)'*A(:,i)*Q(:,j);
        end
        denominator = A(:,i) - component;
        R(i,i) = norm(denominator);
        Q(:,i) = denominator / R(i,i);
    end
    
    for i = 2:n
        for k = i+1:n
            R(i,k) = Q(:,i)'*A(:,k);
        end
    end