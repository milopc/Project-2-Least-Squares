function [Q,R] = QRfact(A)
%QRfact This function provides the QR factorization for a given matrix.
%   Input: squared matrix, A.
%   Output: squared matrices Q,R, where:
%           Q = otrogonal matrix derived from A with Gram-Schmidt process.
%           R := right triangular matrix = Q'*A
%           Notice that A = Q*R; inv(Q) = Q'.

%   FIRST, we read the size of A to get the dimension, n.
[m,n] = size(A);

%   SECOND, we apply the algorithm of the Gram-Schmidt process to the
%   creation of Q and R:
%       1. We create zeros matrices, Q and R;
Q = zeros(n,n);
R = zeros(n,n);
V = zeros(n,n);
%       2. We make all vectors of a dummy matrix, V, equal to A;
for i = 1:n
    V(:,i) = A(:,i);
end
%       3. We begin the orthogonalization process, rendering assigned
%       values to R;
for i = 1:n
    R(i,i) = sqrt(V(:,i)'*V(:,i));
    Q(:,i) = V(:,i)/R(i,i);
    for j = i+1:n
        R(i,j) = (Q(:,i)')*A(:,j);
        V(:,j) = V(:,j)-R(i,j)*Q(:,i);
    end
end
end

