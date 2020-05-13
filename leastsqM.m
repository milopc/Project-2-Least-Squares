function [w] = leastsqM(x,y)
%leastsqM This function provides the vector that solves the least squares
%           (LS) problem for two given vectors, x and y, each containing
%           the entries for the scattered dot diagram.
%   Input: two vectors of size 1xn, as follows:
%       - x: contains the independent values for the LS problem
%       - y: conains the dependent values associated to x for the LS
%       problem.
%   Output: a solution vector, w, that solves the LS problem.

%   FIRST, we read the size of x to get the dimension, n.
[m,n] = size(x);

%   SECOND, we create the matrix that will describe the problem given by
%   the equation y_i = m*x_(i) + b.
A = zeros(m,2);
A(:,1) = ones(n,1);
A(:,2) = x';

%   THIRD, as we wish to find w = inv(A'*A)y, we first should note that
%   (A'*A) = B, A'*y = z, then B*w = z. But we can find Q,R such that
%   B = Q*R, then Q*R*w = z, therefore, R*w = u, then Q*u = z, with
%   u = Q'*z.
%       1. We calculate B;
B = (A' * A);
%       2. We calculate z;
z = (A' * y);
%       3. We use QRfact function to find Q,R;
[Q,R] = QRfact(B);
%       4. We calculate u;
u = (Q' * z);

%   FOURTH, we use Solve_UT function to find w, since R is an upper
%   triangular matrix, and R*w = u
w = Solve_UT(R,u);
end

