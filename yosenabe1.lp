
%1 { target(X, Y, XX, YY) : area(XX, YY, Z) } 1 :- number(X, Y, _).
%:- target(X, Y, XX, YY), target(X, Y, XX1, YY1), (XX, YY) != (XX1, YY1).
%target(X, Y, XX, YY) :- cell(X, Y), cell(XX, YY), (X, Y) != (XX, YY).
%achieved: every target moves a cell to a different cell
%1 { target(X, Y, XX, YY) : area(XX, YY, _) } 1 :- number(X, Y, _).
%1 { target(X, Y, XX, YY) : number(X, Y, _) } :- area(XX, YY, _).


1 { target(X, Y, XX, YY) : area(XX, YY, _) } 1 :- number(X, Y, _).

%:- target(X, _, XX, YY), target(X1, _, XX, YY), X != X1.
%:- target(_, Y, XX, YY), target(_, Y1, XX, YY), Y != Y1.
%achieved: one to one number to area

:- target(X, Y, XX, YY), X != XX, Y != YY.
%achieved: numbers move in straight line

#show target/4.