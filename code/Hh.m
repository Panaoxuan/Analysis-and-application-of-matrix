function [Q,R] = Hh(A)
    [m,n] = size(A);
    MIN = min(m,n);
    m0 = m;
    P = eye(m);
    A0 = A;
    for i = 1:MIN-1
        B = zeros(m0);
        [m,n] = size(A);
        a = zeros(1,m)';
        a(1,1) = 1;
        u = A(:,1) - norm(A(:,1))*a;
        if norm(u) == 0
            R1 = eye(m);
        else
            R1 = eye(m) - 2 * (u * u') / (u' * u);
        end
        for j = 1:i-1
            B(j,j) = 1;
        end
        B(i:m0, i:m0) = R1 + B(i:m0, i:m0);
        A = R1 * A;
        P = B * P;
        A = A(2:m,2:n);
    end
    Q = P';
    R = P * A0;