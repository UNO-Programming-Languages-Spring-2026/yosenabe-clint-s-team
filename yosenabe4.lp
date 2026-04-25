1 { target(X, Y, XX, YY) : area(XX, YY, _) } 1 :- number(X, Y, _).
%achieved: each number gets moved to exactly one area

:- target(X, _, XX, YY), target(X1, _, XX, YY), X != X1.
:- target(_, Y, XX, YY), target(_, Y1, XX, YY), Y != Y1.
%achieved: one to one number to area

:- target(X, Y, XX, YY), X != XX, Y != YY.
%achieved: numbers move in straight line

:- area(_, _, N), #count { XX, YY : target(_, _, XX, YY), area(XX, YY, N) } < 1.
%achieved: each area has at least one number in it

crossed(X, Y, N, M, NN, MM) :- target(N, M, NN, MM), N != NN, N < NN, X = N..NN, Y = M.
crossed(X, Y, N, M, NN, MM) :- target(N, M, NN, MM), N != NN, N > NN, X = NN..N, Y = M.
crossed(X, Y, N, M, NN, MM) :- target(N, M, NN, MM), M != MM, M < MM, Y = M..MM, X = N.
crossed(X, Y, N, M, NN, MM) :- target(N, M, NN, MM), M != MM, M > MM, Y = MM..M, X = N.
:- crossed(X, Y, N, M, NN, MM), crossed(X, Y, U, I, UU, II), N != U.
:- crossed(X, Y, N, M, NN, MM), crossed(X, Y, U, I, UU, II), M != I.
:- crossed(X, Y, N, M, NN, MM), crossed(X, Y, U, I, UU, II), NN != UU.
:- crossed(X, Y, N, M, NN, MM), crossed(X, Y, U, I, UU, II), MM != II.
%achieved: paths cant cross

sum(A, S) :- area(_, _, A), S = #sum { N : number(X, Y, N), target(X, Y, XX, YY), area(XX, YY, A) }.

%:- sum(A, S), A != S.

#show number/3.
#show target/4.
#show sum/2.
#show area/3.