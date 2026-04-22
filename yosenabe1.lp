%% Your code here
%numbers move only in straight lines, all numbers must be in areas at the end

%each in each target atom, either the x == XX or Y == YY
%target(X, Y, XX, YY) :- number(X, Y, Z), area(XX, YY, C).
5 { target(X, Y, XX, YY) : number(X, Y, Z), area(XX, YY, C) }.

%each area must have one moved number == no area can be empty
%moved numbers must not cross paths
%numbers in area must sum to goal
#show target/4.