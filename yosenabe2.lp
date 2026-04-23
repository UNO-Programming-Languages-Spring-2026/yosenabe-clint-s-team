
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

%each area has at least one number in it
% area(1,2,3) area(1,3,3) target(_, _, 1, 3)
%:- area(XX, YY, N), area(XX1, YY1, N), (XX, YY) != (XX1, YY1), not target(_, _, XX1, YY1).
%:- area(_, _, N), not 1 { area(XX, YY, N): target(_, _, XX, YY) }.
%an N val exists for which no area(XX, YY, N) has a target(_, _, XX, YY)
%:- area(_, _, N), not 1 { target(_, _, XX, YY) : area(XX, YY, N) }.
:- area(_, _, N), #count { XX, YY : target(_, _, XX, YY), area(XX, YY, N) } < 1.
%achieved: each area has at least one number in it
#show target/4.