%set A as input square matrix
function [p,l,u] = plu(A)
    [r,~] = size(A);
    index = 1:r;
    M = zeros(r,r+1);
    M(:,1:r) = A;
    M(:,r+1) = index;
    R = zeros(r,r+1);
    for m=1:r
        [C,I] = max(abs(M(:,1)));  %  I:index of max element in column 1
        M([1 I],:) = M([I 1],:); % exchange the I th row with the first row
        for k=2:(r+1-m)
            M(k,2:end-1)=M(k,2:end-1)-M(1,2:end-1)*(M(k,1)/M(1,1));
            M(k,1)=M(k,1)/M(1,1);
        end
        R([m I+m-1],:) = R([I+m-1 m],:);
        R(m,m:r+1) = M(1,:);
        R(m:r,m) = M(:,1);
        M = M(2:end,2:end);
    end
    L = tril(R(:,1:r));
    d = diag(L);
    h = 1./d;
    O = ~eye(r)+diag(h);
    L = O.*L;
    U = triu(R(:,1:r));
    list = R(:,r+1);
    E = eye(r);
    P = E(list,:);
    p = P;
    l = L;
    u = U;
end