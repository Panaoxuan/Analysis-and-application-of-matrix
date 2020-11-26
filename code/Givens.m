function [Q,R] = Givens(A)
    [m,n] = size(A);
    A0 = A;
    P = eye(m);
    MIN = min(m,n);
    for i = 1:MIN-1
        for j = i+1:m
            B = eye(m);
            if A(i,j) == 0
                continue
            end
            c = A(i,i) / sqrt(A(i,i)^2 + A(j,i)^2);
            s = A(j,i) / sqrt(A(i,i)^2 + A(j,i)^2);
            B(i,i) = c;
            B(i,j) = s;
            B(j,i) = -s;
            B(j,j) = c;
            P = B * P;
            A = B * A;
        end
    end
    Q = P';
    R = P * A0;