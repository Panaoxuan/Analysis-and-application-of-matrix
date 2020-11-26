%set A as the input matrix, set type as the type of decomposition
% function [P,L,U,Q,R,V]=decomposition(A,type)
A = input('please input the matrix to be decomposed: ');
type = input('plese choose the type of the decomposition to excute: ');
% disp(A);
% disp(type);
s = size(A);
m = s(1); % length
n = s(2); % width
switch type
    case 'LU' %more exactly, PLU
        if m ~= n % not square
            fprint('this matrix is not a square, please check the input and rerun the program!');
        elseif det(A) == 0 %singular
            fprint('this matrix is singular, please check the input and rerun the program!');
        else
            [P, L, U] = plu(A)
        end
    case 'QR' %Gram Schmidt
        [Q, R] = QR(A)
    case 'Hh' %Housholder  PA=T
        [Q, R] = Hh(A)
    case 'Givens' %Givens
        [Q, R] = Givens(A)
    case 'URV' %URV
        [U, R, V] = URV(A)
    otherwise
        warning('Unexpected type of decomposition, please check the input type!')
end